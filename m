Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A277CA0EE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 18:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHREWrH7Mbs7rvCbLIz7UIapzcu/f0n2BpaQMkaLxAk=; b=fCBMUfvayhwxsnbClIM6oIYtbv
	HJ8vgytP7mxnMRSck0RZV0OjuTIqEYQ2HL9vhwRi9drnrfiolvz0D0eH6ZiDGLSNqJz8SeDH0PL8b
	gxBfY4Mpo3BOn/MCW+vCXcv0o7hXyjefu20k0ndW11ZBzYcf3DtnzsmEUfJatWXm618HTb0jgZDW5
	ks6ydCG34L5lUcAXvjx3My2UDYXRPpBjno9Q05R7fPVWKbTznAaD/jIQVO+7nX3YZQkr3lpT3PVLO
	9Vz0EQQDpXsZYmwvnzL6tgfWeOwNOrqMrH1Ie8iuOF83GjeS3l7jNP7d8An+3hwB5PpFPpRMLHdAB
	f9Cw5Q3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrS-0000000Eeoo-3hdr;
	Wed, 13 Aug 2025 18:06:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEqw-0000000EVJX-1l85;
	Wed, 13 Aug 2025 17:01:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8977914BF;
	Wed, 13 Aug 2025 10:01:21 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 704653F738;
	Wed, 13 Aug 2025 10:01:25 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	mark.rutland@arm.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	coresight@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 01/19] perf/arm-cmn: Fix event validation
Date: Wed, 13 Aug 2025 18:00:53 +0100
Message-Id: <0716da3e77065f005ef6ea0d10ddf67fc53e76cb.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100130_505794_FECC0653 
X-CRM114-Status: GOOD (  11.91  )
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

In the hypothetical case where a CMN event is opened with a software
group leader that already has some other hardware sibling, currently
arm_cmn_val_add_event() could try to interpret the other event's data
as an arm_cmn_hw_event, which is not great since we dereference a
pointer from there... Thankfully the way to be more robust is to be
less clever - stop trying to special-case software events and simply
skip any event that isn't for our PMU.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 11fb2234b10f..f8c9be9fa6c0 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -1652,7 +1652,7 @@ static void arm_cmn_val_add_event(struct arm_cmn *cmn, struct arm_cmn_val *val,
 	enum cmn_node_type type;
 	int i;
 
-	if (is_software_event(event))
+	if (event->pmu != &cmn->pmu)
 		return;
 
 	type = CMN_EVENT_TYPE(event);
@@ -1693,9 +1693,6 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
 	if (leader == event)
 		return 0;
 
-	if (event->pmu != leader->pmu && !is_software_event(leader))
-		return -EINVAL;
-
 	val = kzalloc(sizeof(*val), GFP_KERNEL);
 	if (!val)
 		return -ENOMEM;
-- 
2.39.2.101.g768bb238c484.dirty


