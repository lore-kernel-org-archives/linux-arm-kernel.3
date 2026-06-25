Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20016CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGDKUwtGAyS+7+q7mgtQ02+mVANH5ixDJ+D4q6Iez1w=; b=G/DX6juQVIlkIR1/a6J2Gc0oUc
	Y5ceaoTpDRVcHEJrEiD77F1pawzVdujfVP+Nl+WE8u+YMvyTqZHLUOztSkvvPCP6qcs9K3maiX2Si
	6faRFzpgZTMQRr8o4tmo2FdXPbaxxjiXaa6NIwiDY+jmCIc+EY/VvCl6BAYARpChg5CBjwUJbnimm
	pejr2kCMeLfiLzl8nLijJ+KYR2WuQxXR+Mcfkn4es5OEbRC68AzRUlUsbdd0YZ13/Se/KTcn5Y6tK
	qpxcAYzYKgE1Pzhg5yEcrLnNXuR9dUhW1dKdncAmwjSb/cJG+yB0U8B1sMxD3AoZ7Ylqb5opFJ0Bi
	G5EkkvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchd3-000000091yb-3CYC;
	Thu, 25 Jun 2026 10:48:17 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchcz-000000091vK-3bfQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:48:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4624c1409c9so1736226f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384492; x=1782989292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGDKUwtGAyS+7+q7mgtQ02+mVANH5ixDJ+D4q6Iez1w=;
        b=nayFIIvbKrHsD+cZD72vITszIKKUZZ5TcpVmrbdedQC88RmPmlWIDJDrNc81Q6PTBA
         jE4lKsDBpsyBveras+RjiCR8sJ6H4UDhE9lZEKEFi18KrryYDaeiOUmn5Ktr0j9LUzIw
         xRV6aW63fmG6iQKpjvTL/1OC1//EMnmqhfxZxs3WgG8mg5TccwSBSiVl6dpzFNkLDo+/
         KK8KqWp2pgPNuWf08cw555IUL8ePxTwDe4XJruCnH0cQKSLzdkedKtXawa5M1z3Vt1Lr
         nijSPX1RDDdVc9aphsvbAdK+PLD3N/HENBOeZk6xlTL3krMc/PJQX9ClGQ4SJz+GFSQ8
         TK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384492; x=1782989292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGDKUwtGAyS+7+q7mgtQ02+mVANH5ixDJ+D4q6Iez1w=;
        b=JztvXFYPlRaI2JGh09/l4L/pMDtoWJnFUqMb46VLy3VZ96QkS27ZR2BkiFlBh8zmkS
         uCkhkOKojVGJTKloY5r+Cy+oJJ8amMUlN7kaFyfpKrTmxpwQH1Uo0U4IPgDddBoJqyC7
         FKRIxDjbtmal/iSiBLwFVDXHcQFZoEBZqBi6404YwE8uu3uV0P5BirkOhfSZ/MrWQLKj
         41U2azPSQeEbazIvGX+F6fk2zTUibEdpxHaqkRNci9vG3wlM9TylN6ARXsJMGk6/36Bs
         b8H5rOF7TycVBgtyNt3VMxvObiRPxAmeo08GfEq0t8ttuYKL2Q5rd6cDuZa/LDgQCA26
         3b8g==
X-Forwarded-Encrypted: i=1; AHgh+Rq3iF0e25jeT8NLrbZxT8UMbiusIrqrz4sb1g8JBTp+3ALbD0xdO7Wl/HxT3TxlSPNKzFJDZeOTVhZ7x/r0Dizw@lists.infradead.org
X-Gm-Message-State: AOJu0YyJUfxDOOY/N9VtKumvmhF1T+iaVyIqvg/8f5ev5G3EAYw2usv2
	bGWcpg7pmXUWgmx7lRi2b7GUopN//xhZmjHYxdwbnuARjcgts8ybPFRG
X-Gm-Gg: AfdE7clhQ8LAqY4yV2j47qlFH6EwEEY5jcWDPffNSOX+SiMdQknb7i2Y6D3/yq3bxJF
	FView3vRHxlxU1c7s98mpGWNwu64yg7uBq8sYEVREp3QGekXk4NvBlkTbtAwnyVQGMq5QycoHgV
	U9w2y/sO83q8m821Rjqr/2j3EOzwmz1i/15VubbT0y5/nIVh0RBcuPqAg1bk1b95sbzxr3Lot3X
	vyTsRsjLwk0gJOeemQI+zmOWYhcLc3JyT97yikqACP4xagbFVh348WPqqJU9EJwQzmpeI2fQTzw
	h1vCPv06AyGuesdGGahdTryG4rWCoNqXaWZ84vv/E5gsG0EU6zvB0K7fRkQu+FsyVAwWc+FPnK+
	+8TjL8wMoJGryLtXACgj0sm9CKKSkqhnrvLNkSwgGpO17o0OHat+iieWjCJ5+RoNkf2mTvsMX05
	N7rOHqiw==
X-Received: by 2002:a5d:64cb:0:b0:46d:32:3340 with SMTP id ffacd0b85a97d-46dc16b9abbmr3055956f8f.36.1782384491908;
        Thu, 25 Jun 2026 03:48:11 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:48:11 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 3/3] arm64: dts: mt8516/mt8167: Update pinctrl nodes for the new paris driver
Date: Thu, 25 Jun 2026 12:46:32 +0200
Message-ID: <20260625104742.113803-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625104742.113803-1-l.scorcia@gmail.com>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034813_923754_CF75A173 
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

Update the MediaTek mt8516-mt8167 SoCs descriptions to respect the
constraints of the Paris pinctrl driver.

In those SoCs the pinctrl has base address 0x10005000 for gpio settings
while 0x1000b000 is used for eint configuration.

This change also drops the no longer required syscfg_pctl syscon node
that was used before to access the gpio regmap, fixing the following
dtbs_check errors:

mt8167-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short
mt8516-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 15 ++++-----------
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 12 ++++--------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..65da6c0538b1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -95,17 +95,6 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
-		pio: pinctrl@1000b000 {
-			compatible = "mediatek,mt8167-pinctrl";
-			reg = <0 0x1000b000 0 0x1000>;
-			mediatek,pctl-regmap = <&syscfg_pctl>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
 		apmixedsys: apmixedsys@10018000 {
 			compatible = "mediatek,mt8167-apmixedsys", "syscon";
 			reg = <0 0x10018000 0 0x710>;
@@ -178,3 +167,7 @@ larb2: larb@16010000 {
 		};
 	};
 };
+
+&pio {
+	compatible = "mediatek,mt8167-pinctrl";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..63f36df4d1b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -231,17 +231,13 @@ keypad: keypad@10002000 {
 			status = "disabled";
 		};
 
-		syscfg_pctl: syscfg-pctl@10005000 {
-			compatible = "syscon";
-			reg = <0 0x10005000 0 0x1000>;
-		};
-
-		pio: pinctrl@1000b000 {
+		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8516-pinctrl";
-			reg = <0 0x1000b000 0 0x1000>;
-			mediatek,pctl-regmap = <&syscfg_pctl>;
+			reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
+			reg-names = "base", "eint";
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 124>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0


