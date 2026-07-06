Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B21C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gChBujE50o+E2TRUNjFqwotu6HuQ7YJSYME1WfOxq9A=; b=Tc/KUhTAt5JXTggXfDLyWi9ySr
	NHYXN+2O2JfGaSoS4pJpb33YMyNDiowsdn8uv5lQj2J/1MSQ4no+lwEvo9q3bVlWGKCGIWTSQRmqe
	i1U+J2QM9BZW88qJqL4h3i+T2LXlPGJkK250oK8YiYTXMRihApytSEzUNieoXgaq9t0kI/C26mIlc
	+aSDLo8jadm+PA1ztYNk97lbPWNdYO878mmo3bmygvusP48tm+Wm9kj7oquwX9tG+x4t47fCPoqpX
	F52Wjy+ZfgXHyA+UraaBos4ylrmtcNewhYf0nYUi5L06lSyRM+SQcRq00uzin9C5eI/vxK+jqzFQx
	pZygo+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjS-0000000C3Xc-2PsC;
	Mon, 06 Jul 2026 09:35:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjC-0000000C3An-3rve
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:04 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493b27c7451so34208355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330501; x=1783935301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gChBujE50o+E2TRUNjFqwotu6HuQ7YJSYME1WfOxq9A=;
        b=d3kxDahgQmVO0Hxp3fUFPlCCd5d8RL17XFYT7Tkrolun7GfGhtbP3uk8uvsIUTFIqs
         Vjj2JzejmBsCXStDRFo+eTCRIzoFb3W8iIquf0/61YHZT1do6vd/vE0cpW3VAuENovnv
         N6eXsQGO38wG9onhohahiXwlEEpceuEZxPTAtVAMBUNQRzDhyVuRqXUpiZ2DYxD+a0Aj
         1GnokaHhXbzm4OLKksS4rwhsB5RClvZFu//Mrx0bhYmqFa3bzoQCVPlsxe2DvKvzb018
         eEXpBQBdB+VMPPrsQ9h4mGiFdM2RMDLeJNu0seiU7+nlIlrXhmGqR9Jbzo7Ki1A1grN0
         urdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330501; x=1783935301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gChBujE50o+E2TRUNjFqwotu6HuQ7YJSYME1WfOxq9A=;
        b=rvOQPuWW2DGDNENlaLXneDU5xPUqd7bLK7lbROmjbjgiGMQFW8hyypFFRMUOE+3yNW
         wNnIlsO165GpOBxhTtpYuNeje6U1C4GaYSV9nxKS8DEp7Ll65ZrbAJ1C3ScFuL9YUl/x
         0sjoNyJOZ8Hf+RBwrkAbsoiTVdGrqy+RSmNZh2m5iGuWlB59/O0NqzN+9sJbKUZOJs5Q
         mbiaYqlG/tOQPcktQVwfZhzBebxG2iPcqSjwm6nNiOcicZm9r4G6rw//WubAryGUkx+s
         obLW288rlS5zHq59sWVWbMvrg3bPSdg34nKWW4IMkO8LDyDECH1CGDyAXciPtwZgqZiG
         yG7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoI3YQgOO60GDzSe35kSBbxsDTEYGRw0OGaZvGk1qDOrW6aQC3ro/NrQV6K+eJag2NvVG+Kssz6/r3zsdrz7iMP@lists.infradead.org
X-Gm-Message-State: AOJu0YypqYQ+2EIl8lFndXmA0FXVr3A0lcJQ+XEKPk0INNOKtzgYMRFD
	7zeJz6Yk03iAUDMmQZGZc7cGFRCEAIhr+vViLtF3SX/1oGF68wN3YxMi
X-Gm-Gg: AfdE7ckLL5EUcfBiXzoWxcpX4gFrPokFN/see/XcDnjeDWUDdmA+NdDF0PbvIyQOpTJ
	hNFiFdPG70Ska8O32LHIHmDnEXebc+f+6WuWfY9F2hNm6txkSEktvmyft3XbKl+i5Lv18lMVquI
	HedwcJS4s8f3FK574CVdkI9+UQoAgMV5KPQRzeTh1EfUxjzRzGHPflRLMt5FuAs7s9G2GjpzTjL
	HdYvEoX8Ur1MGYCcg8AjnPShO9rGNG3kvMxdCNYzdi9aSgbbq0nvesg/rMxmoYny1nHpHB5sWzi
	tI0KmDJ5zZ4vNDoD2QeWftZ7l67k2ewzM3uVt5rqjxQJLAq0yOQtoo2na1TMZzRkIxf14xcCb9k
	TmqBHBpcY0AIKoxPjq9V9lhlwz/Ma8vpRF8AUaOOyzT78WTyawrTDiaZyeDDdwluG4EHeChTVVU
	OB/gyyfswJIIAcSUmc4hNc1oB++/bHxtH4hfod3jriHjHH8y1mRxPmki7rHRUSxNsXpqJQ0uzBw
	4giaQpdE+H9JvFzuvxZem9YkQ==
X-Received: by 2002:a05:600c:1d0d:b0:490:5000:917 with SMTP id 5b1f17b1804b1-493d127f020mr90286025e9.1.1783330501114;
        Mon, 06 Jul 2026 02:35:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 09/15] arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
Date: Mon,  6 Jul 2026 11:34:39 +0200
Message-ID: <4cb1d292b7899c72cbdaea212dcefc04e6705dda.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023503_008713_64340D5A 
X-CRM114-Status: GOOD (  10.31  )
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

Enable the FlexSPI controller on the VAR-SOM-MX8MN and add the
corresponding pin multiplexing configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som.dtsi      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 7a4c7455a162..0bc9fb44069e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -176,6 +176,12 @@ ethphy: ethernet-phy@4 {
 	};
 };
 
+&flexspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexspi0>;
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -454,6 +460,17 @@ MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x120
 		>;
 	};
 
+	pinctrl_flexspi0: flexspi0grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_ALE_QSPI_A_SCLK		0x1c4
+			MX8MN_IOMUXC_NAND_CE0_B_QSPI_A_SS0_B		0x84
+			MX8MN_IOMUXC_NAND_DATA00_QSPI_A_DATA0		0x84
+			MX8MN_IOMUXC_NAND_DATA01_QSPI_A_DATA1		0x84
+			MX8MN_IOMUXC_NAND_DATA02_QSPI_A_DATA2		0x84
+			MX8MN_IOMUXC_NAND_DATA03_QSPI_A_DATA3		0x84
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
-- 
2.47.3


