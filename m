Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F99E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 05:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhrQlN2vwbW+HH5J9QciNO8jVjYFc2SW7Nua2x90G3A=; b=jhinEnv5j83hpR8PpmQR2zfCn0
	VrQ1szNjFUXQmxY5e+xWp3dWcoJ9yV38WJ1dRiFq5lwHsrXhsK3DCFSXedcTciRTRPsu+Zf8NF9T5
	nNZfDU0UWj/JlASo14d4a0rVA7dWMmZ6t6kKyCm0ngiZmOi3Dsz6xXZpPNuXLMTOcHAIxAmHRibET
	aGm6vcUVAqOcdHIkB9pfpedEeePLzISWFFeuyxCMN2TRMiShTDjON4aVtT1yaSJSQMJelre5nrN0h
	y+ScZoVKr1kpCm4jUovLYUE9bnKOp8Vv7ROkW5jm3/gILeY4AiT9gl0o1Yx7/9Yvd8uf7yeqDPUf0
	pTaUjyDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMhMW-00000007S9Q-0Cyp;
	Sun, 15 Dec 2024 05:40:16 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMhJM-00000007RjT-4C46
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 05:37:02 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so2223738a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 21:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734241020; x=1734845820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhrQlN2vwbW+HH5J9QciNO8jVjYFc2SW7Nua2x90G3A=;
        b=PbT7r31U/Jq5HWDk5t3v/4FWbO2ibDVckTXndPnaUlIjZ6sZc668g//2KXihXS9xSJ
         0JJXatV+hvai32I7Y0Q0KZSlKW81/D31s1nlToti8+ezi9lkpBH/6nPMCaMA5JymhrfI
         JuQWruhbOsCVaj8rps/u4OTdrjzT7ZbxiMNvxe3Bvvare3Ck/oeFk9vCnk7iQ6SwIgnd
         on+v9vuh1HWLI6YGyVKUCxtnpeWCLTfUJwoF5CfoIwsvrRBK036ybAO1FgoHr25q1eSs
         wiwLUhtv7osByvK3ZBKsFpn4mJ0Kq/xr4og/fHoVOfhkKxm880u2txkojZcAW39e0KiB
         tZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734241020; x=1734845820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhrQlN2vwbW+HH5J9QciNO8jVjYFc2SW7Nua2x90G3A=;
        b=Ez7CnSI+BpurANFFmd7FD5IyT4pw0qgOb+JpIVVkLY/5lS5Ppl3ctON+lbGtleu/8u
         AX741wW0kUp8hlrlVlksh1Js+jELJamoPkhzbb4wxr2f3U+aA/M/gsuU0zVnMchGsBqq
         hle87OAdcaAS73qoPFY2uAh4bNdfEopzZYdxSzWbfQGdLWwMlMaZ5+l13SP8YF7Fe0dx
         JlSee/xgiCSRe4q4LL2zhIXqlvpT1m5IhnT8WsP5fRFnp19Ncvhwfnb2fO/Idw+cnfMD
         Pm5ZWFROWOsG5W9E4LeTQEuFVPUgZhtUJYCTJupBP4MDfG9c5i+lcYzg7IsO20JJSpor
         3OCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTZ60gPNzvbsbqFW+D4FMnsFd9w2HgV5roSMy6HToWsRzYuINySxNSqSuLs1KtgStwIOVInhAfLWSGaG/X1bxT@lists.infradead.org
X-Gm-Message-State: AOJu0YzPjujoUde++52wA3pg8XNYco6i4rFwge8WhNl9ARv0sFaQTI4a
	uMMB/0KBYH2K6/axlEyO8I07GwsWBWyTkRBgYAh/NcumofA9l62M
X-Gm-Gg: ASbGnctrj209gM62pmPEIUlUe6DQEJybv2dRbxA03Z7HbKHuF/d5o3dwkCgJH/0ygP/
	J9Q4qPkYXVwIQYE8+Bep7L2CG/WufepofROnA5AoEyNZHXpqykvNCpIoP+Cp1Ee77HFvkcgeeGk
	YwWZ9oA7aQJjt5/0wuHTRH6b17E7nHektblLyW5c7upd3hy8eQBczhk5i9j0jmm7Nnpvu74fJU2
	KvyyaqX7CA6PW3uMCml0wRexNjxYJLCOC46Yr5lrmULhLyNtQ==
X-Google-Smtp-Source: AGHT+IErUG9RW0X9xHdH5/Ssxiqt3RncarH98/x9Df651+JEpUXRrMwQ+2RKrQ87NQ7RiDs3G7ovLg==
X-Received: by 2002:a17:90b:4cc2:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-2f29166acd5mr12192019a91.9.1734241020112;
        Sat, 14 Dec 2024 21:37:00 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fa1cf8sm5729803a91.38.2024.12.14.21.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 21:36:59 -0800 (PST)
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 2/3] arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
Date: Sat, 14 Dec 2024 21:34:58 -0800
Message-ID: <20241215053639.738890-3-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241215053639.738890-1-anarsoul@gmail.com>
References: <20241215053639.738890-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_213701_038176_D25D5CAA 
X-CRM114-Status: GOOD (  13.00  )
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
For RGB it has to be PLL-VIDEO0-2X, while for DSI it has to be PLL-MIPI

Video output doesn't work if incorrect clock is assigned.

On my Pinebook I manually configured PLL-VIDEO0-2X and PLL-MIPI to the same
rate, and while video output works fine with PLL-VIDEO0-2X, it doesn't
work at all (as in no picture) with PLL-MIPI.

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
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


