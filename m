Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC1BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 14:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzarCo0PiGEntl4cqzxyei11Yp87WevMdKTnQJP6EnQ=; b=JJxks+Ll4+AxJsOU4rrBl/497C
	tyiyKjwcw7fF62KlC6zqinHvwcv6VMq6xO8gW9eLgqImBdO2hHkbSMaQQ0svNKmfpkRA9IGiS6eLe
	wjiKN8BJ//7F2BDr9JOpbmfo4l/8WFeQwmXz2ZZ/a6G6e02IojwfqtZdIOAja41/qzSiiNGtv8ILS
	2W4vSUWeV9Lr8vWl356H5R2+/yvKwBhRAPoSV5mpzGTu1VE2xtticNA2ZqhYhUnkxcwdhUhMwQe3M
	BeniOaGxNmGK9wgA+mejsEFowAKMf7S0Ih65yu7dacRLroHvj/7WErFurn52Nr1bKE2AE61ycLbIE
	8EPVY4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiYFl-00000006arn-29Vo;
	Sat, 11 Jul 2026 14:00:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiYFX-00000006ako-3L4k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 14:00:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E6E741767;
	Sat, 11 Jul 2026 14:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5038C1F00AC4;
	Sat, 11 Jul 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778411;
	bh=pzarCo0PiGEntl4cqzxyei11Yp87WevMdKTnQJP6EnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lz+dy0Es4Yygp/eB4qTmrqNxpdhw+CBv/MGfse2dLpCGqTnVX3UPHkXrx+7qIebP0
	 THClOlYed/0WxTPv2Pk6ApKj98IGtaPv4aA8GbfDb/8Wa1k5NAHmgDIRzHGUUSg58v
	 I5QjacFJu/Hu0bhVyYrZaSw4hMNSZz2t3vE/7slhOGitCt/+PTUIAyXXjpZdPaXoeD
	 6WPSWd35kZ03qRU7rYqeVOZ2aoONrcim1ULixOYAlVJtTEVlZ2/F96SLYZFF7sbyp+
	 k+XUt4JAXM6nMKJvoanY9YGDOesR/eoKs85/5pSUiLmi0n8XPSdZ5QbcF0yDzLmfIP
	 s8jRWlIL2h+UQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 84AB8601DD; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
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
Subject: [PATCH v2 6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine
Date: Sat, 11 Jul 2026 21:59:57 +0800
Message-ID: <20260711135959.3616919-7-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711135959.3616919-1-wens@kernel.org>
References: <20260711135959.3616919-1-wens@kernel.org>
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


