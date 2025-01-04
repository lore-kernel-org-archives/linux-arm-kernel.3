Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB039E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 07:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RemTwaYzBS1si26CVDrNGu9vkTiHrmOVmvsRlAFTpyQ=; b=EMOxqpth7E9T/mcuURw7i4jtDL
	hWKXGys+jJgSeTjJsrZBfrwsvSsHNSauMHGlhHt1xGXsUmWHsXTK4tVsI+XgNW+Z4OFSoBVXTZOVT
	b+v0wYk3w9likrquCxZQe4n7+rROhMZ7nSNr4vqqXN3FIZgfkCk1tFAxwSm3wbaEdRoGmMos1n6G5
	pG4WT5u8XG7+4dDZ6vNLX4tv/MYxWMvT7Yj/FGibcv/hwG7XV/CcWYruunl8XGheCLr8qss1s3mP/
	DvW7sLfgq4rkyLDMZmX9NgDzZPEpHzQLWtTbVG1Y354CLef8G1dfsdWg4hrsx6IZGAXwm+sfIOMTk
	ZPVtYNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTyqg-0000000EfZj-3YMj;
	Sat, 04 Jan 2025 07:45:30 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTym7-0000000Eez3-02Ta
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 07:40:48 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2167141dfa1so177662355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 23:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976446; x=1736581246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RemTwaYzBS1si26CVDrNGu9vkTiHrmOVmvsRlAFTpyQ=;
        b=UtaZUO1/QSgwvFGLq0oTs1xP6lVZCqy+A9A+DwNBszyooaPYUDpaQFZbU8RhqGbCqI
         X57hL5aUO5CcAsbD1z2gI3YsslmylK330n8zXxT4WOJq9jd3kqfn0RmaOoPxLPFbbxde
         yDB3W4Qyn4payvThWqQwpMG4xkxLXu5QUxCWehtcfPDWSgZFRLBOgsjdxejiunyXv1nk
         /WUWLrRK2PokcsaN3+JLt1lXfD7FBIUV2RXx4AaYlBfJ3PlWRzEuJShBlAFtD8jGFORb
         Oj9xXKuk+PXNegK/pCWHZB931gl6sRrua4+xHsS9fIZTjDxlCwjaGQTRnnAKXEHpKPyj
         h6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976446; x=1736581246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RemTwaYzBS1si26CVDrNGu9vkTiHrmOVmvsRlAFTpyQ=;
        b=uVZJ4zC/2r3pH3NmZBTXVj7f7TMJyA+Kfee5hvJaSpg1fsBi4fjnsfvnArH1LJJksW
         TfVqcBXgiHqjB/VFt2lovCLIFvoMgqnA0HHC+uNrVWk918XWMy12dpenY9wNEpYrPA6Z
         RMoRp/s0dkWxyDtMyly7luVxBduSmJOmmtzm1OfiJzQ4XzOQSfzx24qSDvNiA25V8osT
         9OlYZlgaaIdleRJk/M3FKAFcn6skaOyN+yvJjVXy9UJvFzhpOANbmfKX+1jZKISBbeAX
         +2zakvYC8ExgsAab/pLJMv+aLVfuflEPAOMisD5V4UaERxRXke+ediHLuP8ECZ9iHimI
         ppOA==
X-Forwarded-Encrypted: i=1; AJvYcCUdSL+RsaDGC54PDUla/7dcVNQOPfS4ryZSFex6xoqyEihTNlkunK2ggsaXFa+/d6MPyHxdHZt450dKooHTLwcI@lists.infradead.org
X-Gm-Message-State: AOJu0YxMp8DlcEnsaUbHPF8wQMe50tDf1muKN+m8PzAm+nPUbzMvdUlj
	CcUT60J70jR4aAYxVh6jDb5eyL2JAYbdDvMiepHkMHmTLjGOPtb+
X-Gm-Gg: ASbGnctIjKd5KfzvhKJNqOUPHViG1YMzZmnvV5KOMQCt5ZwhOp3zMGx3n8YBrIn9iNQ
	feSky18+tTZJcm7zWqSs2cjKD8rbTnaXCfeiDZiPKYJBAnZwrklxWtLsnhWn2n+ptBcUE6QbqeB
	1U7uK6eZShoF0TojAmn2xyRKhknq9jUOIfoPcsbeFG/ZJxtyaj6weZqyuoFhfUqMhqqR7WQmKSD
	6Rijf7uGXkSZCPleUFvKpN+yBpLfHVHTbeBumTyZ0Bz5ziI6Q==
X-Google-Smtp-Source: AGHT+IFzAL/sWxagDkVX/+NamzAgakEA8UUO4OYdQZ4vgwAgnJ6fLVP3LLXGLkf1UZM4Gkgyz98S+A==
X-Received: by 2002:a17:902:e746:b0:215:a303:24e9 with SMTP id d9443c01a7336-219e6ca6c2fmr758900565ad.3.1735976446069;
        Fri, 03 Jan 2025 23:40:46 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:45 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Stuart Gathman <stuart@gathman.org>
Subject: [PATCH v2 3/4] arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
Date: Fri,  3 Jan 2025 23:36:59 -0800
Message-ID: <20250104074035.1611136-4-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_234047_045963_A254E650 
X-CRM114-Status: GOOD (  12.99  )
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

TCON0 seems to need a different clock parent depending on output type.
For RGB it has to be PLL-VIDEO0-2X, while for DSI it has to be PLL-MIPI,
so select it explicitly.

Video output doesn't work if incorrect clock is assigned.

On my Pinebook I manually configured PLL-VIDEO0-2X and PLL-MIPI to the same
rate, and while video output works fine with PLL-VIDEO0-2X, it doesn't
work at all (as in no picture) with PLL-MIPI.

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 379c2c8466f5..86d44349e095 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -390,6 +390,8 @@ &sound {
 &tcon0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&lcd_rgb666_pins>;
+	assigned-clocks = <&ccu CLK_TCON0>;
+	assigned-clock-parents = <&ccu CLK_PLL_VIDEO0_2X>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index b407e1dd08a7..ec055510af8b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -369,6 +369,8 @@ &sound {
 &tcon0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&lcd_rgb666_pins>;
+	assigned-clocks = <&ccu CLK_TCON0>;
+	assigned-clock-parents = <&ccu CLK_PLL_VIDEO0_2X>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index a5c3920e0f04..0fecf0abb204 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -445,6 +445,8 @@ tcon0: lcd-controller@1c0c000 {
 			clock-names = "ahb", "tcon-ch0";
 			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
+			assigned-clocks = <&ccu CLK_TCON0>;
+			assigned-clock-parents = <&ccu CLK_PLL_MIPI>;
 			resets = <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
 			reset-names = "lcd", "lvds";
 
-- 
2.47.1


