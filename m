Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526F9C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 03:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzarCo0PiGEntl4cqzxyei11Yp87WevMdKTnQJP6EnQ=; b=lfzld8BCKiRQLjGvTnwlsNvB2+
	u0ILr/r9QvGl4ZiUhbMMcYQEMRpDPLB5Ob5m7FhSYLgEM3UPCb5F67DN89vqk8PLdHCRSbwvClFST
	pmoju480B7q5h7/OB5yNgchlTx/UHWMmJe7hP2i/JmIkAVzW3AJ1AQqzW/1TUH3YRsY/0ggd/1oH9
	DYjhH7HmAsbtoae9ChpJzRtdWRv7u9VFrJJL7qevR+2Ofeuv3d8wSRsiM2mv84a+rXIxYhLyM3LEu
	xJK0e5YvIdOydEuCBoB+dRvC7f+KLfN9uSsAvfzSVpbAkSC3E3vHCJnYeKGtnWGCJf8ra4N30QHIj
	okM8xSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQl-000000073No-18Fl;
	Sun, 12 Jul 2026 03:00:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQU-000000073IF-2t3o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 03:00:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 685FA600AE;
	Sun, 12 Jul 2026 03:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF64D1F00ACA;
	Sun, 12 Jul 2026 03:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825217;
	bh=pzarCo0PiGEntl4cqzxyei11Yp87WevMdKTnQJP6EnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OYM8XCBbxH2+vtUBrUayX17GxvMN8/27b2gaHlDRqN4BFjlUSiSfcyRcyW2TF8L+C
	 vJ/S7W5M2KREywFteL4VjSd0hyKmPkQLDRlnsfmSJEanKbffe/hgGc2A4R1+jwEXak
	 Rm04jfGDdXLNsyiNVXV7FiOS4PGmd9p3PLOomY5JxFC+x1eQmRWshRJxb1cFPD2+8H
	 4O4aMvip/0wXtkLaXk34Z3fGGxj8exBqW1dsOcrAtkmYJu56IT/aUtWi0aVtbQmkg7
	 Gn/1q/xI0kevfc2inifGuVog2LzxvhHUyLWvX9wbF8gcCSzT+j+Gp4PvvrY8KN1SkP
	 nCaqGfOWmlRjQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 1BABE60169; Sun, 12 Jul 2026 11:00:13 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine
Date: Sun, 12 Jul 2026 11:00:09 +0800
Message-ID: <20260712030011.3778169-7-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712030011.3778169-1-wens@kernel.org>
References: <20260712030011.3778169-1-wens@kernel.org>
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

The video engine on the H6 actually has two IOMMU ports. The one already
listed is simply named "VE" in the user manual. The missing one is named
"VE_R" and is probably either read-only or used for reference frames.
Either way, it should be listed.

Add a reference to the "VE_R" IOMMU port to the video engine node.

Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 88c6e3e105c0..48c771223af4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -206,7 +206,7 @@ video-codec@1c0e000 {
 			resets = <&ccu RST_BUS_VE>;
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 			allwinner,sram = <&ve_sram 1>, <&de2_sram 1>;
-			iommus = <&iommu 3>;
+			iommus = <&iommu 3>, <&iommu 1>;
 		};
 
 		gpu: gpu@1800000 {
-- 
2.47.3


