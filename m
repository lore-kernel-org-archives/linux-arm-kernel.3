Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705D7CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LH+QGYOc/zlk9kynHB57i4Jfr2TpVc6CuOpzeWP/q+M=; b=Zw5/voAqog6D33toNBaQ7fcoNn
	PE2/8HyjIGWUftNPWvhWpYOFMjEKK8KpDZKi91ay0PK9Olb3NknkhFU4JH4DgXe9kmZ1lryOhHgtf
	n4PwCkiDCNpwaTP1VwM1P9SzYGThg32Je6RlUvs4ahSZ15EFbYlEtC/NhTREl9z/y/hJnAa3I/ek1
	AiqOSPwT3Y8po7s6EUdcHmfcE1DqITqQr0lIZTyMavCp6387wYbXjs55cOaeCsH7Qr1q2+F04JKAR
	ev1DQblWdzHirQFz4nj0LS2acPqZUlPTPAifg4egJd1Jid1d3q6LiFKo2qzoSIl558Oejmyrg+1lh
	qvKnmlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6u-000000049E2-2Mxd;
	Thu, 30 Oct 2025 12:50:36 +0000
Received: from mx-relay164-hz1.antispameurope.com ([94.100.133.57])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6l-00000004969-0AwR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:28 +0000
ARC-Authentication-Results: i=1; mx-gate164-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=LH+QGYOc/zlk9kynHB57i4Jfr2TpVc6CuOpzeWP/q+M=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828615;
 b=Ei1591USZf5hYhqCh/0swdvvd1vw9ss+ilfM9bcWiBE7MZg19fPag/z9D0Pt6I2h2+ZBmChU
 C++uy3xk8Dh8L4+1DJVx6VMhkQ/qrmAD8VHHhb0gAWqzQIiJZbyzHHKqLhNvhnzGH9i4N6NEwC3
 HRVhPxcjfVvLh2NG3vmAwq1JjtfIkK7C6HWfXpkXmNciRYEdkcw89XuM13U+g4Ezj/RTAJlf95t
 1+YodmbAA4mHOZQ6/VqSMCqe7Ziz4tj1vWfMnNYusRi0NRKHmfjTmxfz07+05CDe51lNPIH43LL
 SLgui8HRr0uA6reLG1Y+JJTe4pNMqfPRN4yQBSNS/nMjQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828615;
 b=X5V6+qUk9KF61eg/DgsrmQQswHZfDLvPmTNOVBjyUGrXLGQD5TUy8k1dpNwDgdJh6HJ7u3c6
 OztMHT9nlcPGeYlh035OBwuFbQZIlCZ3egVk8cOf2sU14Edx1t4P5TdyNS37ekMgFnFWBD8pMVL
 qYyeWjMUJOOOOH8Rgj2zNFVghmxdg94UkHujfk5YfL4b+7iN5yueFp5Lf3V+cRBDxup4HdrDXDu
 gjO/pI/haKCWL9vZUrZ3khhGddfBamM7U9FqDuE9PXJM+eWUP8VhD6ZeMqHSm2j4LlxQ92UzoGy
 bBh/Ku+xPda4zbxpIqOm0WT/3C8rsM8IwqV767Z/XKRCQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay164-hz1.antispameurope.com;
 Thu, 30 Oct 2025 13:50:15 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 35CF1220D35;
	Thu, 30 Oct 2025 13:49:59 +0100 (CET)
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
Subject: [PATCH 07/19] arm64: dts: imx95-tqma9596sa: move sai config to SOM
Date: Thu, 30 Oct 2025 13:49:14 +0100
Message-ID: <20251030124936.1408152-8-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay164-hz1.antispameurope.com with 4cy3qC6KJsz3xpSY
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 9ebcda3407cd901d1ba1b6606188f8b0
X-cloud-security: scantime:2.896
DKIM-Signature: a=rsa-sha256;
 bh=LH+QGYOc/zlk9kynHB57i4Jfr2TpVc6CuOpzeWP/q+M=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828615; v=1;
 b=rnyBJjzyvldIfVNS8QvfwsM6t4lHiaoHkopA8k9YrgY8gpso8TCJMIAdfYXPZcYgCC29y3gg
 dlGSJWwR077bSQ5NgJ+9B9IbkBwqZeheQCSW8SZ3nD6zpBZaHl1It3ZLaUZXkPJ/a0uONfvkVKf
 s5ztWIvehSx7KVLHSwQqfpbXXGZiIunwhQtDwsvN6uXiAViYVI3CLHuDieSe5KboTbQYzXw3C7X
 xdlzC8LiEBS61IRCXQAJEyM7LAealAMLLbsMhe+mkk0TS/aKI4BY+54hgA8zwnkDV9PwRR6rINQ
 2tsbfDYDcXKxRXVbPGV6McWb/qkij+PLGwK3bjdKRuctA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055027_216989_E517DE29 
X-CRM114-Status: GOOD (  12.35  )
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
 .../freescale/imx95-tqma9596sa-mb-smarc-2.dts | 30 -----------------
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 02bbaaf298930..5c94d8cf28c4c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -254,39 +254,9 @@ &reg_sdvmmc {
 };
 
 &sai3 {
-	#sound-dai-cells = <0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sai3>;
-	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
-			  <&scmi_clk IMX95_CLK_SAI3>;
-	assigned-clock-parents = <0>, <0>, <0>, <0>,
-				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
-	assigned-clock-rates = <3932160000>,
-			       <3612672000>, <393216000>,
-			       <361267200>, <12288000>;
-	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-&sai5 {
-	#sound-dai-cells = <0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sai5>;
-	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
-			  <&scmi_clk IMX95_CLK_SAI5>;
-	assigned-clock-parents = <0>, <0>, <0>, <0>,
-				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
-	assigned-clock-rates = <3932160000>,
-			       <3612672000>, <393216000>,
-			       <361267200>, <12288000>;
-};
-
 /* X4 */
 &usb2 {
 	srp-disable;
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 166439e251c53..e7edeec712dcb 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -391,6 +391,39 @@ ethphy3: ethernet-phy@3 {
 	};
 };
 
+&sai3 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+	fsl,sai-mclk-direction-output;
+};
+
+&sai5 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai5>;
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI5>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+};
+
 &scmi_bbm {
 	linux,code = <KEY_POWER>;
 };
-- 
2.43.0


