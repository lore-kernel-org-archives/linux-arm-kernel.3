Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B836CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PK5ZZtJo+tl9vrIOwQupM3QlXvu4Jm4LnZkxXhrCHtU=; b=C71X5siekmwB4M3GkgUiZDNxvO
	9QS9vHtcr0HHeBddY9bO2Rfo7AWT1ZdjQCFNj7HZV0txL/pjbfpjI6z+f6h6gnDRZQ2HGyvr6v4rA
	/b+LplEh8NpibAu/BtttgAGWGLtbSJ8acHJESN/onnX0eJivH0P50Qx9d/59SuNXcD9yt2bmhIvrT
	19y09vvWKR/rrRgon/4TQJazwIbFf6jNersTsVKBNo2Vithfz7slUKzai5ObgLjtrFygc2EG/qRMr
	FeC0k6T2ep/WC0WN4CWB4kxkmSV69v5liEfa5bIs40Y508I0E9Fgqkh0+d4vQdjnO0uGP9JqDswiM
	q2iSWTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6s-000000049BM-0hVA;
	Thu, 30 Oct 2025 12:50:34 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6i-0000000494P-3Ymp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:26 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=PK5ZZtJo+tl9vrIOwQupM3QlXvu4Jm4LnZkxXhrCHtU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828615;
 b=tkpnfrHE5A6IExmKYemwrjjmRkVIGpYWLdp5r0fIPWL+dPpDIpK3Z2fyBOm0ZZ+pNYTFT9su
 ms5+SeC2Dhew9n/Qs+Dk4a/BYaqd2FUg4okKQW+uPl/SXEx3T+4Z2DsW2iGv0DhkgpU2zbZhGp+
 hMDk34xuOOHyXXhpgYKAhcHTGW91req1MBApDb3ZFg++9f4jh3gattp1bmRwyyzGQ1kpdwTf3p0
 WN+w2gaz+b7lo1F5ikuacXVJcR54dwr2r3c0By5f/reB7Vyzr5roTPk4uAH4crCb7KXO4OHIR4v
 yMMPzpJforcvIBu0icb8MQuDCKJgG4FQmp2XemW1z6RPA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828615;
 b=p7FpoxsiNDWWWRpt1jAFyyzSpha+55t3xEsu8GZ4kXZvcUbQEUfcQSc4cRFaXYMamSutUtrS
 i47BUYGTLmVXRqgDiaXkzDgFMLxjIHSWRbDPvgGeZBk2NP7s7GB/qPdhsEHZyB/w0AOeNaEbaR9
 bhtiav4dT8OdVr5SC5GGGQbp/XUQkR4w1shlx/vbr46y/et0bpLesVH0qvp6gZraRBPavDywkWz
 ZqpPJqy3UPSDP0uTpvvDWsf6uwbnsUg8azirT3HL8tVUlqGZImg3QlwzkW8V3RskO/YJybrrDv9
 u37h+Tn8PCDqlShturazxtz76vUYKinDJTanEUb7qZUmg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 30 Oct 2025 13:50:15 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7E327220D26;
	Thu, 30 Oct 2025 13:50:00 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/19] arm64: dts: imx95-tqma9596sa: move pcie config to SOM
Date: Thu, 30 Oct 2025 13:49:15 +0100
Message-ID: <20251030124936.1408152-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4cy3qF1SYTz3yc2t
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 6e315f0fcc0e47734d335f45771da7a3
X-cloud-security: scantime:1.865
DKIM-Signature: a=rsa-sha256;
 bh=PK5ZZtJo+tl9vrIOwQupM3QlXvu4Jm4LnZkxXhrCHtU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828614; v=1;
 b=DlAovD+/4ljpoVbrLuYPE5+8pp9FUfaIORE3hAbY4AvHlqEciQLdsUQTKtEeF7x8l0JsHZxH
 IAnwJ0sSKrlkHvzz8IOQ9HKjg8I/PXKJjUXyVBRmtQuUqQDHCEYQ/d54TNpzu5bRkAZxZ4yZSwL
 xE9oP24kKo9oH58wj33QEyDvNjsfd4BTtmxRoDx5hmPIcWqXqQcIR5KxtfEqBlEFBjuoLRJbgwI
 Qdy6a1qVJgLU2mrvLps1fmmYUX3SkWZUXqt9F658pI2Ta1cZ6PHzmMD6rQ3zDrj5teIYGyIC33C
 CQkeyPzNLfsvUC7rfFsaRKTw5kXAqAa/3R1W9BADpu54g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055025_026300_80689A50 
X-CRM114-Status: GOOD (  12.24  )
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

The muxing and other features are mostly determined by SOM, so add it
at this level.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx95-tqma9596sa-mb-smarc-2.dts | 16 --------------
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  | 22 +++++++++++++++++++
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 5c94d8cf28c4c..8caf0c68ba9fc 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -225,27 +225,11 @@ &lpuart8 {
 
 /* X44 mPCIe */
 &pcie0 {
-	pinctrl-0 = <&pinctrl_pcie0>;
-	pinctrl-names = "default";
-	clocks = <&scmi_clk IMX95_CLK_HSIO>,
-		 <&pcieclk 1>,
-		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
-	reset-gpio = <&expander2 9 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
 /* X22 PCIe x1 socket */
 &pcie1 {
-	pinctrl-0 = <&pinctrl_pcie1>;
-	pinctrl-names = "default";
-	clocks = <&scmi_clk IMX95_CLK_HSIO>,
-		 <&pcieclk 0>,
-		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
-	reset-gpio = <&expander2 10 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index e7edeec712dcb..832c753abcd75 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -391,6 +391,28 @@ ethphy3: ethernet-phy@3 {
 	};
 };
 
+&pcie0 {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX95_CLK_HSIO>,
+		 <&pcieclk 1>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+	reset-gpio = <&expander2 9 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX95_CLK_HSIO>,
+		 <&pcieclk 0>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+	reset-gpio = <&expander2 10 GPIO_ACTIVE_LOW>;
+};
+
 &sai3 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-- 
2.43.0


