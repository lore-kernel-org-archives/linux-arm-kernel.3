Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB98FCC06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSGdR/fONreoDaJVUI/JFgQUgIkT771I117jJn+3wes=; b=sjeep08m8DFMJxncTR4+sqAjy0
	NrrdZSSXiBdDszfNmE+NnFC9UzYu7/bCM7my9OUTGHbMtiqpqA80IMYxy1JBuphLl3QM+3dqiEq7a
	K5wJGW3YWuB1Oy83a0Tpp8QRIvL9Q4cHA56HnyHYQzj92UwRh174dVRZGxI49LcxkZkSgCOWxXE3g
	qQ+NeENVqhB4MUQD3MWIDhrgwLVAfB2c7s/VtscbPXkos2/UQ1lU3Fn6aEGaEM4FnFxImZV29SysD
	QKZmtHeGRlv42geeJLL2adcDCUlxqyhzOQNCztuGI6GgUV2I87lUXjwtw8jfNdiy9Vv1ZdJignjVK
	jrFCpkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybK8-00000004Qq4-1jVf;
	Fri, 06 Mar 2026 19:59:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybK0-00000004Qgr-3S2Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:58:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso5120605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827131; x=1773431931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSGdR/fONreoDaJVUI/JFgQUgIkT771I117jJn+3wes=;
        b=ftVAwkXwk0+fAK/KYwm0RdqkHC+JpAf/gq3TLRSwKGoZhQzw99oUwW/7seYS2QzYyj
         P8qvl0VQqJHGpUHrphvix8MMAafEMZP2QA6/e0F+aUNdYgib+DvhoOSalYGc29dLJfNH
         gvgXwjOEMIuYjqEce5CKUv8OXtMhGVXq9t/7Kv5mXJjUhcutdobzWe3kdKNYBNiRBNv1
         Xex9D4Xq0vwJzk/jdF0CwuiI2VqmynbIlMdpqbTtZKhduMDX/baSR4ZzJef6Oxfa+pYK
         jnLmQ3rLMITFa+22rmlmkHN1n+hqe98ASytnvIIhEcNG1+nKl7daEyqkYMAFNn2eW9Or
         7fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827131; x=1773431931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TSGdR/fONreoDaJVUI/JFgQUgIkT771I117jJn+3wes=;
        b=ffpG/m4NDGD2lPgoyM6GCwpIE3hqoGQxxyNk4V6b7N3OgDetKVoVRsx/nccoC0jBEO
         BmyEvn+pYe8BbRKMW/UlJ3DsJ5O2C4Y/2zIXKowbb2WWBU3BTpKl6tOqwTSscsAmvXK2
         yDpsjPA93EMANFofF18hGcKIe4yVQMGWizxCOPLAf3q5Hme8S+MLLRnGYmTHtz26UlGO
         kgjcDVEASADVHuiWMkV/fs9AY5JznmukziG8YQHau4WytYzcx1UAoY+MSKZkQqlpyv9/
         W1WwSrVlWZHVIC0WyaH56vPZNASE86oZ8hj0+oNsRv1jthFtag/FPx9XVS+FziHXVa7L
         GWgw==
X-Forwarded-Encrypted: i=1; AJvYcCUsBJisgHnRKyAvYQVlhSlmafoivG3+W+krkvY3wL1rN6qh+8zkiXND7jXHt9LspiwSxPKCwtO+DvcOJJqjje2m@lists.infradead.org
X-Gm-Message-State: AOJu0YzC365rLf5j0NOAg2awP+tYeB2tWkynZQqWsyRCdb9gURkf3bsP
	Fnu4PdsRz8x3SrI4hDbEFYdoncW/6S6C9/AuK+oRKy7uhF2ku1VdpPIW
X-Gm-Gg: ATEYQzzfgQjGlna/NfAuhXcXavbXWFuIzYn9TgLLAJ4l+qOvnsWeiNcc1Mp/G/fKp6/
	pZl0OGEH8OyzGfMwirCauSkI3C2n1TBMlDYaDiHKhiMUyEBIjLNIvLO8Fk3X2g2owRBAr4wBNUr
	3mNs+uFWS9bdWV/jphBHO2zqb1WWKLRzlmrMPBjiAcYn54kWqV9xmfSZVwGc8Qoz8HDVzxNbPAq
	27RNO9ojhvP17kJqmzEEkwI0fKzdISO8x66sJkmi3igBFtVUmALPQuywmuHmifbE8iEq5q9LW6R
	y5grxI2eO/kkoN40gHpZnoJQhQcOLKthb1hUXwhaBggxSM7vAnmnFA8snnR56WWxVFh8OpOnShK
	UvE4LOljJFfY+stAnc3/C7s6OIEBsArzwrsrOvaFc3TAkZKkSaCfOFk3zfIRICNZjsu5JdRoAuV
	0RFbuk6KrxCsrM2kdVq6UWuim/aFfrfOVzEK9JoA1XtjDpYJ6OJvFPcceOnythp2sgK9Yl/AxcI
	7JMij70RZT/KXva3zU5H9EjJial67QdvxNTX/k=
X-Received: by 2002:a05:600c:a12:b0:483:badb:618f with SMTP id 5b1f17b1804b1-48526966b07mr53084435e9.25.1772827131139;
        Fri, 06 Mar 2026 11:58:51 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:50 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 11/11] arm64: dts: imx8mm-var-som-symphony: Enable PCIe
Date: Fri,  6 Mar 2026 20:58:30 +0100
Message-ID: <a029d4f029274a368af0e9c58e9b41106857e436.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115852_893401_AF35E38D 
X-CRM114-Status: GOOD (  11.28  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PCIe support on the VAR-SOM Symphony carrier board by adding the
external reference clock, configuring the PHY and providing the required
clock and reset properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 9a29c81b06eb..0aa288af6c5e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include "imx8mm-var-som.dtsi"
 #include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
 
@@ -17,6 +18,12 @@ chosen {
 		stdout-path = &uart4;
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -205,6 +212,27 @@ &i2c4 {
 	status = "okay";
 };
 
+&pcie_phy {
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	fsl,tx-deemph-gen1 = <0x2d>;
+	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
+	clocks = <&pcie0_refclk>;
+	status = "okay";
+};
+
+&pcie0 {
+	reset-gpio = <&pca6408 1 GPIO_ACTIVE_LOW>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
+			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
+	assigned-clock-rates = <10000000>, <250000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_250M>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3


