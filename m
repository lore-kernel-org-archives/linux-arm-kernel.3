Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EE2FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYN2y5huAXYsxiNMaa+uVh6q/17vB+zSMoKetg5TSUM=; b=JuOOv4esGbiKGgBG6K3ZGsIGfu
	riqELRwRsVvY9/bjRyMzp4ccOEp61MJN6uVv7s6zGGKs+nPZRQWWqfQlWVicI9GRN5u8KLzJJCh4v
	UwysQVHAeZidbAggh5ekn0XY2revVqiRKqNFgwQjUeSA2affEMWzghJ8dBPovYGCJ7HtMYCrJPzdc
	/v3bOuRroqBKUx/F3OpiOd1yNKT1ySmZjpoE60h2b3M3ROUY0jkZZPhUDje00wWzxwVb9rNCI3m9B
	y1sONQKyCFk+BiZ2bUCEFgikBJmWF6RrAy2KQqMMDc1/ps4opNcVrn9UBfoSbHCIfqHCZy0Oe4gAA
	TWp2jtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8T-0000000GNZm-3D69;
	Tue, 05 May 2026 13:48:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG8N-0000000GNTH-3lb1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ACC2445B9;
	Tue,  5 May 2026 13:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61921C2BCB9;
	Tue,  5 May 2026 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988903;
	bh=SmJP1v6k7XMlEDKnWfg6SBf41AMTtCvcAOTsyx0JJ20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k5dFEt8Y+/elNtbUoXdo50/jpfD7T3Ly1kmcmCRH8UmkyrqXSNO20iSYYMAGfsXA/
	 rnwiqkBUHj62oXKOuEQtbYSVB9knjZ6eOTtZOlKfglMnNFgb2b/un7NiocLCFKhQ6R
	 q7u0vJaQEeyKoPykpxohGaVDPuYPvavlM7FZCoBR1tJ2V47+dV1lVQXircyKa65S81
	 7t+nyj4+rV1mbUONsXZO3Wmm2++GWA+he7sfAmg315N1j1o7ybh4/8LN2PbU0mSfxi
	 TYWGddruM9TIiU5zgDTZ3x1kKpmv94DbuZ3pshDImYNhEdTbghBvcAayudEVH2kRIM
	 sXnIhLUBD7gRw==
Received: by wens.tw (Postfix, from userid 1000)
	id 5AB295FFE0; Tue, 05 May 2026 21:48:19 +0800 (CST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video engine
Date: Tue,  5 May 2026 21:48:09 +0800
Message-ID: <20260505134812.408316-6-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505134812.408316-1-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_064823_976582_9392C4B5 
X-CRM114-Status: GOOD (  13.71  )
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


