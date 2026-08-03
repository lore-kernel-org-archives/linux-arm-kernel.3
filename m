Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6C5C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gb4LPnphqc1DtduXOsyl640sXOpfiOxS2LbjD6EtoY4=; b=BiILLKXXoUdZZghcBdP/+VYMKN
	WccuOl6fYXRHMS0nRnCbmSlH3KO0ncjjzERB64o/pE7LekxtimwfqVwAea7VAtFXMtbvmNFMGh7tW
	IpHZUn1lXrc4WQuJ9Qt+QWagc62YeWuV3IwNOYqeNv88ibmZ1KSpyaNL+/b/LhEsQQT+b7njJJuXj
	jm3X/1FT29VMnJdYzPxygL5L9ncfeFNYfLpUOCEtiAwxvpO9OQ0t3GFzf3yJsAiW7UMKlXIT6dxJ1
	+OvUB6yFYtlidFMKn6gJ7b4mEuVdlX9vZkepuQTHasmhXNp1FUhMWq1OHnrRoYx8kPEE5i17Ah4er
	u1Zhdxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1R-0000000GKdL-3l1U;
	Mon, 03 Aug 2026 05:15:33 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1O-0000000GKWW-12Ae
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:32 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7e9f1f24cbcso2864795a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734129; x=1786338929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gb4LPnphqc1DtduXOsyl640sXOpfiOxS2LbjD6EtoY4=;
        b=jw7LL+oRZeP6BsmjpNHZuTmbRodlvbBF961PYBaC25tQc+clNtGUDuwBijjzeCx+sd
         Z/gs4czLBUMRPbFYtDx1SC9FduhHJhFUI4EQmawp21KyySJ+c2uMR/TJypfuIxuyGBHT
         YJhb/dDE9Dd58hPrWBnUCV2hljmIHOjzaUsPwznFch62Hz2gKCirXYIpJ9LlzAgNJClY
         eHH5JrCPWJ6DXu1Dp/rZAJsIVn9IH+GqFx3sLPzo2SBVlL/OvLk0USXe9BcCSOIEogpq
         MtCTi/dytsszkL0Pr0q413Jn2lFCL+ukmRGd5Jdi+s4OCp8XqdN9c9h086MkyWeiMsSw
         S3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734129; x=1786338929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gb4LPnphqc1DtduXOsyl640sXOpfiOxS2LbjD6EtoY4=;
        b=fIXqtnpQGGeGk2e3D30T6VTqeg5dUuI/5Kbi4J+cTjVtk8EYIx6y45ATX7f1EqG8ln
         98dzlHP/IiatZLqC6R96wtH+oXsJuJ2pv4gIROwkUzC3CU0tGhqinZ2pAK8HcihvyBOm
         yjg8EM6osqNkLUsHfgll+ULoOdfX3FcUDPG4hxEwLOJAFxcoO3OtH8R/2botCHdi+adK
         GIVvMD7SsScKyW3kjbxN/kGie6C8R9O0wPWAxO+IFaJWJydp9mO6kioStrub892J9xw1
         GG6ceoLKq1GuI6gtW3pH3wL5VDSfkfHsRj3ruM75+y0NxsH1BwM7sECwbp2O024aPGpT
         nC9w==
X-Forwarded-Encrypted: i=1; AHgh+RqB/y2RBPfGQcXqfJCc+ZFT1zE68dYHjeS+EHAgbX7HmPS+vKCYPy5HLt/tYTRSNMCW6KmlcVeHCyldY15FxlEy@lists.infradead.org
X-Gm-Message-State: AOJu0YxkTh8nRSq7NFOizxY2CafCZd8yEYoM+gOl8uErMJRIKYpG824r
	9DDp81fL3K/gJXebn7YsoCKqufVGzoPZnoJ+fznQ6o65+ekThR0HiCw4WBEGdD3M
X-Gm-Gg: AR+sD10SFpT2zBeRdvZXcx464MDhgk7aTU1JiDl+HrQWWqxnOv0071Mp2p0ZI+G5xjz
	sKUawbA8IJN4XXQvk9Ttav5ykYUGOW4RLunNVC1CvicBHE9cgW0QRYJTh/OzaUEYCqO4nUGkg02
	MNFFmb7XWfBV13LLZ7zx3roDOj3fSbHBKTVvEBLKdDiLg6yBQeH6EfhjssbqG+yZm/3MBUOLazK
	YXLkVevDktcNy3/evlr88BjnBnyFJtaeeSdlVRUNWOH24u7IpDgIVnmoYEJQ8E56dLPwka37NGH
	Y9b+HhJH0aQ9rnIkY6pUIbTB1qcULwhgz8WFdCJi8WGngOdSomAREvxBD/MjeTH0MzMEYQeO8Ha
	p4qo4T7sgbGGuPHgwjcqx4r2Dj0QOGo4Kj0LgnIfD06gWH3KIO8/alDqWVhQvTV1cykRlyBFUd3
	oLRZITI8BGwe6PGUtwwcg49qcgBA3E9VfeU6D57VhqJyKISKi3RHS7R0d5ZLORfUGRL4DeUCOB6
	b2fQeAguv7wMokejAs/8EieLHPsVwONjNSAMyUqFgYqZBnYcpw9mWmXswfWcJSnUPEWlIdMPCOM
	YBObkw9faiaNULXim+Ym8ej9Nn0P896fmHdL9V2aIiRXYXWaFRM3+OpVGupRS3O1pb6j6O1NqG7
	aJVYqWs3n0j1MC0du3uOWmooS1w==
X-Received: by 2002:a05:6830:7086:10b0:7db:a297:9e62 with SMTP id 46e09a7af769-7f1892c8017mr4283606a34.8.1785734124209;
        Sun, 02 Aug 2026 22:15:24 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:13 -0600
Subject: [PATCH 03/21] arm64: dts: allwinner: h616: add EMAC1 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-3-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221530_326743_D3C8143F 
X-CRM114-Status: GOOD (  12.18  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 has a secondary EMAC controller that supports only RMII at
10/100 Mbps. It connects through PA0-PA9 to an EPHY in a companion
AC200 or AC300 package.

Add the EMAC1 controller and RMII pin group. Leave the controller
disabled for boards to enable when the companion Ethernet hardware
is present.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 90fe56a1d3cd..6879f27c2b2b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -432,6 +432,14 @@ pwm5_pin: pwm5-pin {
 				function = "pwm5";
 			};
 
+			/omit-if-no-ref/
+			rmii_emac1_pins: rmii-emac1-pins {
+				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
+					"PA5", "PA6", "PA7", "PA8", "PA9";
+				function = "emac1";
+				drive-strength = <40>;
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";
@@ -789,6 +797,28 @@ mdio0: mdio {
 			};
 		};
 
+		emac1: ethernet@5030000 {
+			compatible = "allwinner,sun50i-h616-emac1";
+			reg = <0x05030000 0x10000>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&ccu CLK_BUS_EMAC1>;
+			clock-names = "stmmaceth";
+			resets = <&ccu RST_BUS_EMAC1>;
+			reset-names = "stmmaceth";
+			syscon = <&syscon>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&rmii_emac1_pins>;
+			phy-mode = "rmii";
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gpadc: adc@5070000 {
 			compatible = "allwinner,sun50i-h616-gpadc",
 				     "allwinner,sun20i-d1-gpadc";

-- 
2.53.0


