Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0CAD77883
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFmknUFExvntjMXArlo+QGYXCMApnwCGjL0EqgfBfw0=; b=REWHl4M3F5iztzQyW4b7qVZDn0
	fpLcfmUZ+ZTISo0YHxfm5Ch5NfL7iRBaemjG3k/zxtofdxtOlWlJqcWfCvCZZnyvwcZ1V0aW7IQFq
	ISGAeHvEbl8PGbjK7gbdXzlH0u01rFKI8Whi0+H+i70yb1T4+A9OnmtdWiR/lUN5dkTpQ2qsR9PUW
	6seZkVg5P0VS/8DI4ihfnhsxfqQ/seVBycJVh93Es+7rFC6EcOmARIGo2ik1eu4ckljlRg2CIS3Gh
	tpDPlwRiFn+btMrywRfkb6l6njoG7WZORSggWTTzqehXgXSEmq1BnfoeP/2xpXksYAaCA2cTqg0D2
	H75m3Q8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNL-00000009E0x-0ziX;
	Fri, 23 Jan 2026 16:51:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNG-00000009Dyr-34Zw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:51:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34A291576;
	Fri, 23 Jan 2026 08:50:59 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EDD33F694;
	Fri, 23 Jan 2026 08:51:04 -0800 (PST)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	andrew.jones@linux.dev,
	eric.auger@redhat.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvm-unit-tests PATCH v6 02/14] arm64: set SCTLR_EL1 to a known value for secondary cores
Date: Fri, 23 Jan 2026 16:50:41 +0000
Message-Id: <20260123165053.2250754-3-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123165053.2250754-1-joey.gouly@arm.com>
References: <20260123165053.2250754-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085106_812246_6EBB4AAF 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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

This ensures that primary and secondary cores will have the same values for
SCTLR_EL1.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Fixes: 10b65ce77ae7 ("arm64: Configure SCTLR_EL1 at boot")
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
---
 arm/cstart64.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arm/cstart64.S b/arm/cstart64.S
index 014c9c7b..dcdd1516 100644
--- a/arm/cstart64.S
+++ b/arm/cstart64.S
@@ -185,6 +185,11 @@ get_mmu_off:
 
 .globl secondary_entry
 secondary_entry:
+	/* set SCTLR_EL1 to a known value */
+	ldr	x0, =INIT_SCTLR_EL1_MMU_OFF
+	msr	sctlr_el1, x0
+	isb
+
 	/* enable FP/ASIMD and SVE */
 	mov	x0, #(3 << 20)
 	orr	x0, x0, #(3 << 16)
-- 
2.25.1


