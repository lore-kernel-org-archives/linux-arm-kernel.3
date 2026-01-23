Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB35D77880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKz8Oj95MmCJntzAYOY+k8w2M44jT6cyXI84XwHgJew=; b=tZVajHXff/a/m96hY/qRZh3FM/
	Mu5zE78Kqt+0eHIqsLoWKZ/uVxg4wN+o6jKATdvRIlAHBUSUAZQ/Ep5kgNXMrVuB0LHmuH+gmLfE9
	jLD31ihcP9gxdaL1tbeCDMJoVNZq+beZGX2YjNE5smXSz/5esNT1M6KhJm7GUhO/CNnQNmN6MJHVx
	fy5GM8ayLPRk/XvfaNx+tPtZQALvbP1+9Qg1lTIDS3KH32wII8zKrp9bvu59fVyZV41PjYQ7iKicT
	0uwEPV1M0k+YYR0tFJuzzrkaUD4nEe5Q2n4F6Uk4h9t1BctGzHl0iHZIFQ29Ytebfa5sWBVNHl+HM
	kcpW2LmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNK-00000009E0W-3wIl;
	Fri, 23 Jan 2026 16:51:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNG-00000009DyI-0W2w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:51:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70F551515;
	Fri, 23 Jan 2026 08:50:57 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DFA33F694;
	Fri, 23 Jan 2026 08:51:02 -0800 (PST)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	andrew.jones@linux.dev,
	eric.auger@redhat.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvm-unit-tests PATCH v6 01/14] arm64: fix overflow in gic-v2 initialisation
Date: Fri, 23 Jan 2026 16:50:40 +0000
Message-Id: <20260123165053.2250754-2-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123165053.2250754-1-joey.gouly@arm.com>
References: <20260123165053.2250754-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085106_196036_96DD4E94 
X-CRM114-Status: GOOD (  11.61  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The gic-v2 DT bindings can have up to 4 registers, GIC dist base, GIC cpu
interface base, vGIC dist base and vGIC cpu interface base.

QEMU when booting at EL1 fills out the first 2, when booting at EL2 it fills
out all 4 reg values in the DT.

However `struct gicv2_data` only contains fields for 2 bases, causing the loop
over GICV3_NR_REDISTS to write to random areas of memory after `gicv2_data`.

Fix this by only looping if we know it's a gic-v3, and only reading 2 bases if
it's a gic-v2.

Fixes: a5a2d35cba2e ("arm/arm64: gicv3: support up to 8 redistributor regions")
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 lib/arm/gic.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/lib/arm/gic.c b/lib/arm/gic.c
index af43a96d..1b2dc101 100644
--- a/lib/arm/gic.c
+++ b/lib/arm/gic.c
@@ -69,6 +69,16 @@ gic_get_dt_bases(const char *compatible, void **base1, void **base2, void **base
 	assert(ret == 0);
 	*base1 = ioremap(reg.addr, reg.size);
 
+	if (!base3) {
+		assert(!strcmp(compatible, "arm,cortex-a15-gic"));
+		ret = dt_pbus_translate(&gic, 1, &reg);
+		assert(ret == 0);
+		*base2 = ioremap(reg.addr, reg.size);
+		return true;
+	}
+
+	assert(!strcmp(compatible, "arm,gic-v3"));
+
 	for (i = 0; i < GICV3_NR_REDISTS; ++i) {
 		ret = dt_pbus_translate(&gic, i + 1, &reg);
 		if (ret == -FDT_ERR_NOTFOUND)
@@ -77,13 +87,6 @@ gic_get_dt_bases(const char *compatible, void **base1, void **base2, void **base
 		base2[i] = ioremap(reg.addr, reg.size);
 	}
 
-	if (!base3) {
-		assert(!strcmp(compatible, "arm,cortex-a15-gic"));
-		return true;
-	}
-
-	assert(!strcmp(compatible, "arm,gic-v3"));
-
 	dt_for_each_subnode(node, subnode) {
 		const struct fdt_property *prop;
 
-- 
2.25.1


