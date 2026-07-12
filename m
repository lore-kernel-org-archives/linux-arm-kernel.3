Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C8DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 03:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHn+VlrPP8+DG9eMf2EHuMFbxRRlTlKli3GayR7WGoQ=; b=rhjTgvnPR4beJJG+pPmpEjkTka
	uWAA9VHVDFpRHLJ1fR2bvEr56PyOD1wdV4lIRGVCQ/POS6e0/8lE20QKQQdIQmXddmxtIj+63IA2h
	cDDASMUOhHBZxrsSgFPcppUkqxRqlFHO+1rtzi7rq277dfv7XY6cSUWCGX9BBQhXAfK4a32GPHhxE
	jVZUI3pR25Lc5p92huwganQiV6VjySXpMnmci2dprQDWhdddGNxmDn0hgN5ICq6oObVcBBNRYPoQo
	Ow3bHm/jWDMJahtToW3Tt9PRvJYadlzILsUA626bjrCz18eu59Z1VTSxQ4CmbV3ZIlNXlkZ/4aECY
	IcLs8O9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQl-000000073OI-1aU6;
	Sun, 12 Jul 2026 03:00:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQU-000000073IA-2t3q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 03:00:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 66BBE6004E;
	Sun, 12 Jul 2026 03:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1B81F00AC4;
	Sun, 12 Jul 2026 03:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825217;
	bh=lHn+VlrPP8+DG9eMf2EHuMFbxRRlTlKli3GayR7WGoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vy8zoUDNas+vvG0c2LmFKZew4UfK+SSk56tXC0Fg46ambpKU2CcLCEQEapdMGuJso
	 RkVe97ZOQL5eMAlMX8gyaerTuDB6oCuHmW6eld8HD7KMgK582JOcs9zdMF+FKSAEGm
	 UN9y79Qoo/obqfiZ+xwvgueP3WNMjil1T27f8ubXOBq3RGVyiWBye77Ibw37JpIolE
	 PpvlwyjgWpcOIML36+DlC15b2xqDcsYrRro+ioOY3jcBWkyU1dix2U7TepybWGKyYF
	 qv8LuD+BdIIfT3lm+r0rNgZmuCsjGZS3CfxKZmmwJr4JDnN65E4Nx/4P70/eXdQCss
	 A/EX6AmbO9WFA==
Received: by wens.tw (Postfix, from userid 1000)
	id 1245460176; Sun, 12 Jul 2026 11:00:13 +0800 (CST)
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
Subject: [PATCH v3 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video engine
Date: Sun, 12 Jul 2026 11:00:08 +0800
Message-ID: <20260712030011.3778169-6-wens@kernel.org>
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

The SRAM C region contains a partial alias to the VE SRAM already
referenced by the video engine. To avoid access through this alias
window, the region should also be claimed by the video engine.

Add a reference to the SRAM C region to the video engine node.

Fixes: b542570e5605 ("arm64: dts: allwinner: h6: Add Video Engine node")
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 72ce1a75647b..88c6e3e105c0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -205,7 +205,7 @@ video-codec@1c0e000 {
 			clock-names = "ahb", "mod", "ram";
 			resets = <&ccu RST_BUS_VE>;
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-			allwinner,sram = <&ve_sram 1>;
+			allwinner,sram = <&ve_sram 1>, <&de2_sram 1>;
 			iommus = <&iommu 3>;
 		};
 
-- 
2.47.3


