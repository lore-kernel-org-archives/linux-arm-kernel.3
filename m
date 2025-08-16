Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A16CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzugRTjSEEA3vhHWZEvncDTD2t0Cnyv/9flgnww7Mso=; b=zsOE0JCo36IW5Z8KVJjiLUJ0Wr
	LaTOBc5LxSbA0DsrPrhQ+Zg/iRv+fTZgvcSB043WxOtuvYUEGLMtq3A5m2PXujB5wRmF1O9KPGlhX
	7fXEOsMBeu5LJikHMBj353kXsDd4kWDed5SJ23cc4BoaJN67WC4EVaCwKCA4o/5GOcw6SRYESptJj
	eMtnq0Z66FHma9MXMM3WI6hh0/91Ktk/ck+sNTg32L9tekttnI4/9byLTiF3XBLUgHc4oyV3yqtv7
	70qxWzYIOf+TjTNOasxkVwSgT66YZjmiT08neqGhN7x7JjIKTrD5UaBcGxpf3RuxrxtKJuBBcljl9
	rnHnPurQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCh6-00000004KiF-2mmJ;
	Sat, 16 Aug 2025 08:55:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCZl-00000004K7r-1s0W;
	Sat, 16 Aug 2025 08:47:46 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2430c3684d1so28513015ad.0;
        Sat, 16 Aug 2025 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334064; x=1755938864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzugRTjSEEA3vhHWZEvncDTD2t0Cnyv/9flgnww7Mso=;
        b=P3nxGP4fBDBsmpxJzP1TF5HQZZBYuGTUTfJHHHL5nvGrGEcUTrhqnRV6KzA8I7wmgK
         89DEc/b5oau8e6EI0n7CVq52/M7AcS5RzXa/0GYr0BVUEqQjbCL+nUUuDMCi2fagZ9NZ
         46Frr8rZB0OcdT4SG05eJCzUvZQ6TcXKD+AK2aGO3FGxPHghHOYRkqBdmwU4IqrWWoKy
         88QopnUuGdDGnVEsO+CRc0KdTnGACO3c0u3kGH/00jYqR67+GKtQ9WgicpPY/y7wgjnn
         rY1UsncH9Dj5Gw2AjZGFEc7ynvbDIJI1eHEtnF2gXoARaMvZIUm79UsKyPRSWuquwUAT
         hxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334064; x=1755938864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzugRTjSEEA3vhHWZEvncDTD2t0Cnyv/9flgnww7Mso=;
        b=T9xjfDCwSnyrxk+6C9QB7wlScl60MuUcXV80nnyP8t7YIT82zn58T5Eqbw0jmYpkiX
         SSqtKrFw/bk2QQFqT9fRDSs/XsmlCLIeHi2q0NezBCfNqNKJT7tRNuMhp1XxFLhDXevs
         At6aym5rwl5KcyxyAvyhfdLCzAJN4nszFmVim5WRThyT6IwPJlo/XX1lQfRv0GLwcFmf
         Mtxyg572rwn72yc8+5kj5rOCWPGf9q0X2cgAvh08qOEmoXOHS7Wh00a+lL6ghb+0Mf/p
         05Ysg93/Pe9RvEuNZ2DqLabB6QmJmPnrfm112MpemTpu6pDXxkbzbG6XitiJ6f4ocR2V
         9Wuw==
X-Forwarded-Encrypted: i=1; AJvYcCVNvX9F8mNCmEA7MxnwJEX5r+rXp9ryClk62Jl8/gLcD7V7dvOJM2F30cJv2R34kRp6g19gPrN+NAuz@lists.infradead.org, AJvYcCWeazBinHH7ZLkf0hCkMSJSJHJhmmFbg0wLMnNcUHcZ38HGvkdUcUEEgDxW5RnIQITNfaCyVctyBCXxkpdxzRE0@lists.infradead.org
X-Gm-Message-State: AOJu0YypTXsl8a1/1ymg25IO+vhiKIrFBTfquQOPiAz+PdGd7kDssQo0
	Gkq+ZufgvPz4wbw163frDnPwzJTk4FtTecZNNqLwFf6YmtJhUiZaoAy+
X-Gm-Gg: ASbGncsedrLMQAEr3BWxm8J2p8pHWgWEYNBXUCWZFEeIkUyOWRleM8CwF8Ykuw3HAYB
	dKA3NoN9yw9lOujQo+l27Lp73Wp+fo5tl45voi+82ep+STjMeNTKgNlhKENSlGJWIHZfuMZLxSv
	hbiD4p9K44qFuEGnXFtQ7UP1eoVTzBaFbJOAfRgZGjn7E0J1piWrg2J1p3hY8xuL4uE7N/1H3g/
	hk1XiRYTnMNZfYR42TCZQgnT4u8r+v0ELn6xghTFwlAcs8Pha/dGoROCIMPWn5VGsWqCul9a2ue
	PvAE/g/jW5Fu878Bo4JMWfWISFSauPVbEV63zpkljdi5uADTm8BYGxd7wd3n27b5nEMItZKM6Wi
	XvoKFNfaIFz8=
X-Google-Smtp-Source: AGHT+IGC/f9ctRQyGd8OhPgk/EDa/XtCGcODk7HhjJFFgAw+CxRy4DpFueYRqcfy/Uow1U/CzbWKQQ==
X-Received: by 2002:a17:902:d4d0:b0:240:6fc0:3421 with SMTP id d9443c01a7336-2446bce444fmr73487325ad.3.1755334064339;
        Sat, 16 Aug 2025 01:47:44 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:47:43 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/7] arm64: dts: allwinner: a523: add third usb2 phy
Date: Sat, 16 Aug 2025 16:46:55 +0800
Message-ID: <20250816084700.569524-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084700.569524-1-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_014745_482973_2C8CE926 
X-CRM114-Status: GOOD (  12.04  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

It seems that there are actually three usb2 phys in the processor, which
makes it incompatible with D1.
The third phy is used together with USB3/PCIe combophy with DWC3
controller. In the BSP code, the third PHY requires a separate glue
driver, but it seems that it is not needed.
According to the BSP code, the third phy does not have a reset line; the
only reset is declared in the DWC3 node, but none of this is documented.
Since sun4i-usb-phy driver requires a reset, I added RST_BUS_3 here.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 6b6f2296b..e4ed4fa82 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -503,22 +503,27 @@ usb_otg: usb@4100000 {
 		};
 
 		usbphy: phy@4100400 {
-			compatible = "allwinner,sun55i-a523-usb-phy",
-				     "allwinner,sun20i-d1-usb-phy";
+			compatible = "allwinner,sun55i-a523-usb-phy";
 			reg = <0x4100400 0x100>,
 			      <0x4101800 0x100>,
-			      <0x4200800 0x100>;
+			      <0x4200800 0x100>,
+				  <0x4e00000 0x100>;
 			reg-names = "phy_ctrl",
 				    "pmu0",
-				    "pmu1";
+				    "pmu1",
+					"pmu2";
 			clocks = <&osc24M>,
-				 <&osc24M>;
+				 <&osc24M>,
+				 <&ccu CLK_USB2>;
 			clock-names = "usb0_phy",
-				      "usb1_phy";
+				      "usb1_phy",
+					  "usb2_phy";
 			resets = <&ccu RST_USB_PHY0>,
-				 <&ccu RST_USB_PHY1>;
+				 <&ccu RST_USB_PHY1>,
+				 <&ccu RST_BUS_3>;
 			reset-names = "usb0_reset",
-				      "usb1_reset";
+				      "usb1_reset",
+					  "usb2_reset";
 			status = "disabled";
 			#phy-cells = <1>;
 		};
-- 
2.50.1


