Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA66CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 10:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Fo8rDgsgL3oMTlQGP2qNGmy2BxQXSmGIlr4hASY30A=; b=snwRLs6HN0LHWrnIAqzYcrZgoF
	sGuPK17bCMI9QK1ED8LK1SRVt0mc0cIT3DpMMXVAgE9LEsGGMszroWbMOEvgo2bg3bmTsPCIB7xir
	kZpmwVRIiU0PeipbT48jRQJ7NGdPDRvhCtsVpFXLp+3oBcbXOyFAByKk0BnYll4iGFE3qkHrZdYE+
	NWyCJcMLk6iba7zKVXdjNYvFIaRemX9kOjG+oCKFJdGuuv99kI0ySe5W3/nI5T8jhsYq0J3PTmqIp
	1u7jA8cckpq9JpFuu6VepELd76AVQD1QjkSH6wkmYgOadsOCfAJYKro3G+lFU0hdXJqoQrZZOjmx/
	K0MiGXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxNId-0000000EGLt-1KYk;
	Sat, 13 Sep 2025 10:16:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxNIb-0000000EGLV-0Umi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 10:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C46C640B8C;
	Sat, 13 Sep 2025 10:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE92C4CEEB;
	Sat, 13 Sep 2025 10:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757758564;
	bh=ojF6PfBKwReEDaj3Mu698DpXN9oraXTujEiRhBUQr4g=;
	h=From:To:Cc:Subject:Date:From;
	b=WDj51K4z3iWjhPFCI7RymiVsSdQW+WqIf/Pa5Pi0Q7i06vDTAS81VP2Grh7l4GE/X
	 Vry82r6ey6DJysCVDhJowMXp7a4VLYQuHAAGOCTX8r4JyrlMGUCGqJ3Z14Sx0XyBzD
	 U6WTkDfRbiC8WJm+XToSaTmqPi3IJE1XhEFFWrwVZTWz8XcBizMan2DPyPRI2augOy
	 0vLjJmAuxQu+D/pB3E51CVzfqabaFj8Ig10s0MUsLi3jx6LwD5TGl+lrxfjBjP0X7m
	 rE8WeT+yoxagx8PJ9QQ7FTG7yDV9pkr7+JhMgqIHSTquv2/weYMk4jMcdur7ueyEJs
	 oiYXMieo8H5sw==
Received: by wens.tw (Postfix, from userid 1000)
	id 275645FC8D; Sat, 13 Sep 2025 18:16:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: sun55i: a523: Assign standard clock rates to PRCM bus clocks
Date: Sat, 13 Sep 2025 18:16:00 +0800
Message-Id: <20250913101600.3932762-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_031605_174749_C1466C58 
X-CRM114-Status: GOOD (  10.09  )
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

From: Chen-Yu Tsai <wens@csie.org>

At least in the initial version of U-boot support landed upstream, the
PRCM bus clocks were not configured, and left at their reset default 24
MHz clock rate. This is quite slow for the peripherals on them.

The recommended rates from the manual are:

- AHBS: 200 MHz
- APBS0: 100 MHz
- APBS1: 24 MHz

Since 24 MHz is the hardware default, just assign rates for the first two.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 3aad1b909501..5cd6ddae86c8 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -767,6 +767,8 @@ r_ccu: clock-controller@7010000 {
 				      "pll-audio";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			assigned-clocks = <&r_ccu CLK_R_AHB>, <&r_ccu CLK_R_APB0>;
+			assigned-clock-rates = <200000000>, <100000000>;
 		};
 
 		nmi_intc: interrupt-controller@7010320 {
-- 
2.39.5


