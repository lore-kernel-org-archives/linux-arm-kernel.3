Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EBAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 18:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T33qGfs/0g0LtIrSUJXt4Q6Ekpi06sGsGWylhaYJd90=; b=5BJAZ3EbCJDQ88ESlVS555uTDk
	k312Jw/EUFTm5eA1Ib8+fYwMPJYWc4DUtbPacnyLCZB/zG7RJr56Z9pZ5WbfaXd7GGtJ716pz8Z7E
	Npls7M9//tUCOJlyyO4nba/+g4urQq8QKpT8tLzcu5fro4xgq8nSBXso4i+17ynSfy6QjY7VRiShN
	/RlmrZekyO8+BJqQklAWs7pQ4Y42GUwgy3LsaUaVvPeb4OzBTaH0JHq97WQKHHEKVJ+FE3jZoTTMq
	lVkkXaGTWLI1Uck6e7U7v3INMilIy0FJLOrKf41nHEpUa4C7AClYCLFGI9CacRc1KK8r4Xv1Uyo1B
	hUpZ1W5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww2VK-00000006gQG-1lO8;
	Mon, 17 Aug 2026 18:56:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww2VJ-00000006gQ9-2s4a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 18:56:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 975A843420;
	Mon, 17 Aug 2026 18:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C37F1F00A3A;
	Mon, 17 Aug 2026 18:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786992972;
	bh=T33qGfs/0g0LtIrSUJXt4Q6Ekpi06sGsGWylhaYJd90=;
	h=From:To:Cc:Subject:Date;
	b=H/NpkALVtexLsn2fi4vjzvjSHCYJdXeTn7Jlgk51uq3IJV2bign4+t7t2bihbo+f3
	 66G97/fTLRyfMkU/GHIxprq1o74nkEDWJCm14cCx6ZshFkLM86/95kQm3tltyq9oL0
	 rqqbUyMnxJ3rpD7HFlNE/VupoZetJd6gcIA25u98YgGf1uMXV3cGeKFEBPD62AoS1L
	 JgdKbVIEnfgBu2lIk57vfMUVD2BIzGWz2rqvfQiQ32RrUhaoZ0Mr7AuMm31bZIzApQ
	 sZDs+EEpAdHbDiyZuPsOOApDXbzZWgtWmiM1w6xsea7EAD9I86a460xPMh4mApmn7J
	 7wocNBaFsTnHw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: arm: corstone1000-a320: Fix GIC redistributor region size
Date: Mon, 17 Aug 2026 13:56:07 -0500
Message-ID: <20260817185607.1756124-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Arm Corstone1000-A320 has a GICv4 which means the redistributor
region should be 4x256KB rather than 512KB. This issue didn't become
apparent as SMP was disabled as a work-around in early versions of the
FVP.

Fixes: 87599f1843d3 ("arm64: dts: arm/corstone1000: Add corstone-1000-a320")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
index f0937914350c..f895a024fc92 100644
--- a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
+++ b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
@@ -73,7 +73,7 @@ gic: interrupt-controller@1c000000 {
 		#size-cells = <1>;
 		interrupt-controller;
 		reg = <0x1c000000 0x10000>,
-		      <0x1c040000 0x80000>;
+		      <0x1c040000 0x100000>;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-- 
2.53.0


