Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8659DC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 12:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jpUkWfMGwvv5SDHizivejVfJAasO8TxaXlqi3NQ9UUQ=; b=A22YUB8BXpuX4WUJiK4U9T+mJR
	DB9oAQ7oQ6+rLVkDvMVB7MtApNWxv5HJh8Miv3LlavEmVBZR0wbdDfLGeftzRw2aRmE4neIUdgo4i
	Bp88G9SaL6Mzvut0t48yP2JZxUGLT8rKDXahw6w4uFNOtswBH3HVZ14BsH1lZeRBZNhDLawiIHnxV
	UIiajvFELLcvzOxRN0Rk5F3QJAjCCMU6h1gj8b/syQ9KkzNAjbfeeaq87F2djevf6JKbjpKrmqswr
	KD9ExJkfagexb9/UEsyBRhANzV7mDehG9W9F/aplMmzYzzx0SHr5KLnKfNzNbsVRWqUGhyh7BZh49
	GFmloh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtsV-0000000AkNi-0ylK;
	Tue, 27 May 2025 12:57:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtqN-0000000AkAp-2fhG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 12:55:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AA9D14BF;
	Tue, 27 May 2025 05:55:28 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE6543F673;
	Tue, 27 May 2025 05:55:43 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: vincenzo.frascino@arm.com,
	liviu.dudau@arm.com,
	sudeep.holla@arm.com,
	lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: morello: Add CMN PMU
Date: Tue, 27 May 2025 13:55:39 +0100
Message-Id: <cbeb3832ded539c8c4616d49d3133078a34f88ad.1748350539.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_055547_719516_056C4B6D 
X-CRM114-Status: UNSURE (   7.99  )
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

Although CMN-Skeena is mildly modified for the Morello hardware
architecture, it still identifies itself as CMN-600 r3p1. Since
there are also no documented changes to its PMU functionality,
we can make the PMU accessible via the standard CMN-600 binding.
In general, PMU registers are non-functional on CMN Fast Models,
so this is only meaningful for the real SDP hardware.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/boot/dts/arm/morello-sdp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/morello-sdp.dts b/arch/arm64/boot/dts/arm/morello-sdp.dts
index cee49dee7571..42c85f450fa9 100644
--- a/arch/arm64/boot/dts/arm/morello-sdp.dts
+++ b/arch/arm64/boot/dts/arm/morello-sdp.dts
@@ -108,6 +108,13 @@ smmu_pcie: iommu@4f400000 {
 		dma-coherent;
 	};
 
+	pmu@50000000 {
+		compatible = "arm,cmn-600";
+		reg = <0x0 0x50000000 0x0 0x4000000>;
+		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+		arm,root-node = <0x804000>;
+	};
+
 	pcie_ctlr: pcie@28c0000000 {
 		device_type = "pci";
 		compatible = "pci-host-ecam-generic";
-- 
2.39.2.101.g768bb238c484.dirty


