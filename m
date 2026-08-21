Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E51C5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i28649nrMbrzjwe7lKZ6MKTSXfJUvAObdfOOl+7VWTs=; b=MfRGZfBG2BCv6imxyugAxMNh+G
	lg6Er9HEPo8lPMr7YgE8QXDiVIWYMPDfQPmGqpbE/yZ0w5ryHijj+i+LGYrhevPPrCrVxSNNHvTKy
	5XsIV9EcffFOFpiQCMdJOm17nRMPXXKiHQ4zECg6LNfeHF4nGyzDHGBxOPw98XBAMmtbyQsmnv3ji
	bUszFYYB3+ffbC+EFDWlPlJXiSWoLNMf7jvsqTzIaxa2VKhZDxmRYpor+49MyxExzAgktP5TyW1br
	8uhzZJHzmeNpdv7htodOVEo72wegRSIWxKrCTuURUnFr+1oRBb69LOwz2S0yOJelFJAbGbK5eYK0D
	q/oDaAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQiR-0000000DbzU-1EBO;
	Fri, 21 Aug 2026 14:59:31 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQiL-0000000Dbx8-3AIp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:59:26 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so2243731a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787324364; x=1787929164; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i28649nrMbrzjwe7lKZ6MKTSXfJUvAObdfOOl+7VWTs=;
        b=DIuB3Z9kG6BIOxJHun1uhCVtSnjZbGRuLE7Pqh97I9bqoyKcETOSIsVeJ2I/y8CIrZ
         lCYJiJKzLv8ZHPL/RClqfcgGGLTcTKbHUWMHyvaP4BhjnTm8wyp2DOG5EL4dsxGFg77c
         BHNXKBdmd5rwJG9T4aUImDDcR7aogyfDkXoFb20RsWhZ9Sq1i2W1VBIOWonf5LwfGzCC
         T7qQq5g8WOHH7yyNGUVvRFd/gl9sFcAfCqoeHkgdNDZWKy4UsHU43sdVgLgnxmTNhQiZ
         +dT5woe57Ild98dWrjoEmEbFWbVHdWf138yaDtWOruGSqzgphFGAdDOCvW0pWNO8L+FY
         m26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787324364; x=1787929164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i28649nrMbrzjwe7lKZ6MKTSXfJUvAObdfOOl+7VWTs=;
        b=RpBTUp5va7zoKvS0daFi69O6ZYZclyhxxOAuroSXYKK4N/avEagh7Ait73NsRZCzWE
         yUmbI1WvOFCkoHDNndQkSaAdOC/aPpnwcM6BX4qNw1Nn0MZWpgBFn581InzW/jxOhunK
         0eB8Pi/HYSo2nDTRSf+hBGwUh8p3jAlAY7mOI35RjaI9KXH3r7rM78WTtsWjprcOdKYf
         YDDA4HK2mHIvaFENIAp+Y1Dp5HUSz3UQlvbBOk4xp5pvyOdSlEWgCLHHtp4gWI6aULSY
         IZX3qMVlJTPE+0S3HfXzBURyLSLNGvYxG8li8omYndRqVHXX2PTuoCMUHLVoMfkGBlT2
         RGjg==
X-Forwarded-Encrypted: i=1; AHgh+RrfcjavHxb08xyu3/0vXUwN8OgWsqfFHA3CVeql+FGmyhwl/iuqS6pS1tWGB9EaA6/2UBINArJvdZY/rjNl7pdO@lists.infradead.org
X-Gm-Message-State: AFuF++mpySWd2hHTVAGdEVpTj7h1zcH2x+vnu/NB9AjFGVnTPMt6BNU+
	XroieK8Oxr4dOuKLA4MBRjPbzk3JisHyNAs6QcJwNfBfE5nQF/JzWU/g
X-Gm-Gg: AR+sD13yEDlnJjZan7+jzbiv3lhw66L7ERk+nQt+nrpuJsj4/vXqwz7XsX0xdtnGlHq
	TUwMnXXzP7nqAbIupnubiKjRl6j5k1X6SX+6/jiNg7sm6fNtF9TyyhOZSTxgWB02+Ohwj+NtuUL
	0znK7BNQ8PfLI4GV7UhThNind/TKopVvJ6I4B9edy6GWF/8q8zX7Q9SnMUPxXaHsfBPK3DaV6W3
	5k1JlP6lKl7hqzfPijaKaJu6NkGLPoFpTOM2rZEFybRornJnIMSwuhgd0lZTJaDOFnzh/0LIZpG
	hp35Y2puzSpXKiEH1edOASwUki1AQSEtYDSngD27WSH+KcdD45+BzUz1rWwJeCGHiSjGaH0+LZs
	EWIRgFtQvvS/rypIs+zE8+mARvoH/1jgUIIEtdOEkqUvDTRzIafcEFC1KWog6v3Mjpm+ayWnKzu
	OmlQnTdShAEh/Xo39ZDSw/pTsUtDFkWLf7/yqsA3faMh5Qeu/f3Psi8tSUYVd8RgMkCZ0dsvZ7v
	XNOItBjQh5U+eWuDaKzodanWUwxL8zBXDoDq75jbk6VJcvTw8mH1cd8GK0Hon7+DXUg4+Fc13XT
	HwDE9V6TTEelj98Aj95M15i2fH0I/90TNvoVeQ==
X-Received: by 2002:a05:6402:322a:b0:6a1:f895:1ba with SMTP id 4fb4d7f45d1cf-6a42f20b899mr8424396a12.12.1787324363509;
        Fri, 21 Aug 2026 07:59:23 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a411971b19sm6577066a12.11.2026.08.21.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:59:23 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Fri, 21 Aug 2026 16:58:57 +0200
Subject: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: Add USB HSIC related nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-add-apalis-imx8-usbhsic-v1-1-fb93d73ead44@toradex.com>
References: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
In-Reply-To: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_075925_820779_1A68C4C5 
X-CRM114-Status: GOOD (  11.64  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

Add the required nodes to support the iMX8QM/QP USB HSIC host controller.

Keep the HSIC host node in the QM/QP specific dtsi to not conflict with
the address used by usbotg2 on the iMX8DXL variant.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi   |  9 ++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 26 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
index 176e2e332f87c..44eee9abacfb1 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
@@ -384,3 +384,12 @@ gpmi: nand-controller@5b812000 {
 		status = "disabled";
 	};
 };
+
+usbphynop2: usbphynop2 {
+	compatible = "usb-nop-xceiv";
+	#phy-cells = <0>;
+	clocks = <&usb2_lpcg IMX_LPCG_CLK_7>;
+	clock-names = "main_clk";
+	power-domains = <&pd IMX_SC_R_USB_0_PHY>;
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
index ccf9f510e0f88..168f89eebeedb 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
@@ -4,6 +4,32 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+&conn_subsys {
+	usbh1: usb@5b0e0000 {
+		compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb", "fsl,imx27-usb";
+		reg = <0x5b0e0000 0x200>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
+		phy_type = "hsic";
+		dr_mode = "host";
+		fsl,usbphy = <&usbphynop2>;
+		fsl,usbmisc = <&usbmisc2 0>;
+		clocks = <&usb2_lpcg IMX_LPCG_CLK_6>;
+		ahb-burst-config = <0x0>;
+		tx-burst-size-dword = <0x10>;
+		rx-burst-size-dword = <0x10>;
+		#stream-id-cells = <1>;
+		power-domains = <&pd IMX_SC_R_USB_1>;
+		status = "disabled";
+	};
+
+	usbmisc2: usbmisc@5b0e0200 {
+		compatible = "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc", "fsl,imx6q-usbmisc";
+		#index-cells = <1>;
+		reg = <0x5b0e0200 0x200>;
+	};
+};
+
 &usbphy1 {
 	compatible = "fsl,imx8qm-usbphy", "fsl,imx7ulp-usbphy";
 };

-- 
2.43.0


