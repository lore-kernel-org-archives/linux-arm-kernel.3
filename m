Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499F7CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lm/AWXQd/K6rTr19dM+wodz40FWVmC3MrTz5s7TrMzM=; b=30V4cxWYyIIiul6Ukv1tKCP2t7
	z0Kwt0x1xLcgplNugVG7gdkS6iPH/bJHPWAozc8cfSUu2F4AUPtFc1ryG4xQYM0nihSS02W8/ET3k
	Aa1F5K6n6B7It6CkAhey9tYY/87vr6NhSRXNI4GTmymNj3eZ+zlzFvHWEswmvbGhcvf+K097FBXiD
	cDyUlYz4QZr71v2kkeuYUZx7r8VeUWwrNHF3RMQeHjejDOFOU+nYE76TVdJRFhiplEBlmNo+xKX4K
	58m81ChYEDEA3I2n+pmDdTylzQtZTIMLum3ZAD7IiyuoEe13jmYm+rc4w/8H56SyhZaHpZd+r1cNb
	0bz68FTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAW-00000003oDo-1G6S;
	Mon, 08 Jun 2026 14:41:36 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAQ-00000003o6k-2BWq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:31 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-46013161068so2157944f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929689; x=1781534489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm/AWXQd/K6rTr19dM+wodz40FWVmC3MrTz5s7TrMzM=;
        b=RfBG239n/sdOcY7aBju7KPccMK1+zLkYEVO3Zx/rpm2m8nw8vXVh/fvh8GHYbbAvp3
         1zSPfM1deKCng/ywIi4jqCN7+Z3QD9sNYdYI0SFtqeFRbxyd8nyG8kUgREjnEAiqs6xL
         FJQ5gg+5Ss+cs/WQ6s5ctkdGYs0MV0zxSkAXKkKOji2cdQ+D1wuagx5xSuOrTjLjPztE
         KzSSKBxWw5PlOlqZ7xbTUrq2WKL0pSpKwvey39TafWg8UiQHLiEmnBoKIqqi6Wozflv8
         IDsCcTOz25BKJqF/zyZatkVRQ1WpYcoRJ3paYJPpBj25VkCHYZV+pUReC9Va+E811dxB
         dK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929689; x=1781534489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lm/AWXQd/K6rTr19dM+wodz40FWVmC3MrTz5s7TrMzM=;
        b=lXemt+uUgebJzT8G/KZc4uZMEXdATt1KMuxSl9Bu0EFDw29jSaX+jwz+oOZXQJxmZ6
         uzDTXmyE7t7DUmQ/mYvBESL3r8ImZOEhLHs9Jr0QZFo+h81oFYjC+qg3dXM3My17KM4Q
         ndAH9SN3HwN+5vrb2xwv9V7PzijzkiH1w/yTTDEOhQUYp1CRoUeMPp6+jZsM0JZJ8+0N
         ohhTAXQfEMiF9wF52bC9xvzu4DXaMW5KkDVTwuA9U7rU76HKJNDhYw2iLEvghUsqzctc
         7KNCfRxD7o7ZRw7wlcEXB2EAEHF9cYWMJAJ9Dn4zAbJTsmpTipKRiVj5W2YpzFkI4YjS
         FUZw==
X-Forwarded-Encrypted: i=1; AFNElJ+gfTDtiWO5lkNX3suP/lSVWqcNCeUr3s/BkQWdUywNIwfZvNUjb8lzfs2Re9ObZh4si3RLOIh0Ek/C/K45FpfP@lists.infradead.org
X-Gm-Message-State: AOJu0YzyEhLF86CcOUBfHqs7yKl3+PiHJNGlT9rpxwwQFkigGsgSTlAe
	egiTOZejwK34gVyOMuEf2ByhXotEh4uC1eVWFh3wnRXQ9xMEQXIAOEmP
X-Gm-Gg: Acq92OHOqn6/bVboSVEbIKynRu8DIJGPku4P+mdimyAxWwVlXdbm5+i6z0ECFNsGq/N
	Fmseo6LtAhDAC2PPdw68g/+lRoBbftbcOsCN4nCLZWk1gDHAOQu7q20xayMLYkrXce60os0/grn
	WQr1V4yuCVz7evv6UbgJPOAWMxTgO2UoKdNHAmJSg98q2hBmfQdE2g7iMQrgUnaoIUwG+QPKjOI
	RfMRfHO49xM2lY4jmIdk170Gex3+rGNab0a1GvYLEpp9XGNMI8joldcxaaSXsLFLClf7bqeNUPD
	aCvsa2/06phFG8uoRuTN+HAVbLDOy7Xj0HVJysQL0L+WBIxxn9ITAILr64Zil+dL24rg2iXoc3b
	6rE4xfCUGPq87XRoIY8uzJEWY9tOpvQWglwkw4p/xb2N9I15rXiSVhzuQs/bnEk7GJkvzlneiam
	5nAw9lvjuJ1FlIlfdU3LOCG7gCntL+BwpaN43r6INzcbdVEB5TNpXAhQ0T2WsJXUh6UaGaYOIKr
	cn9W7Tljz6wKFk1ahSqALpSWx+ePsOeezqtGZL2d32rXvWd
X-Received: by 2002:a05:6000:4810:b0:460:31d1:74de with SMTP id ffacd0b85a97d-46031d17543mr22898424f8f.10.1780929688812;
        Mon, 08 Jun 2026 07:41:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:28 -0700 (PDT)
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
Subject: [PATCH v5 05/14] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Mon,  8 Jun 2026 16:41:06 +0200
Message-ID: <9999286d70381eb6637b3d1779197b6be0c8c6ab.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074130_577861_12D5B4E0 
X-CRM114-Status: GOOD (  11.39  )
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

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index cb3348aafa07..fdac4ceb4c19 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -154,6 +154,13 @@ &snvs_rtc {
 	status = "disabled";
 };
 
+/* Header UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
@@ -161,6 +168,13 @@ &uart2 {
 	status = "okay";
 };
 
+/* Header UART */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usb3_0 {
 	status = "okay";
 };
@@ -261,6 +275,13 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
@@ -268,6 +289,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX				0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-- 
2.47.3


