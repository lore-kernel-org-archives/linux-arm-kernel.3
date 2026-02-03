Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1583CE83077
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z51/LSwxyVQQCwJzOsYDCUnfNLjjWuW1smeCgpUaBns=; b=Su8Tl4vt4GofinQ9SHGR6KyIfW
	dNR1uDdZB9CKi5E7v/phItNnGtk8RzbF7HicF20hhuaUd5FD+lI+WhmnPzO0cqhruZXIrNC15L9zl
	vCkDTrJXHZ98pswaXpvwLZURbs769qfMPu+FewE3dOb4++rdTm1VpQWIpLHHRKR1W1mqRF/UPQMu7
	BHCYdmRKPextc8/0Wak74/RcxadHU2R0j1MA+CMzxlQaHO42SgCmjejaSA4+Ny/osApdQYHmO/Kdx
	7Y0KfGw4wJXBgbO3xHjWE2EHJ26YyRdpbR7tljU9SahEgYMghUGAu8tlrMxrg980OpDEpgrz8sfca
	BcvZOLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDHJ-00000006RXr-1vhE;
	Tue, 03 Feb 2026 10:05:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDHG-00000006RVV-0Qo3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:04:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so41450065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 02:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113096; x=1770717896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z51/LSwxyVQQCwJzOsYDCUnfNLjjWuW1smeCgpUaBns=;
        b=DUMtKU1WFvi85Si1Rv5IZPOa6yvFVSFZskvKxZEk+gcaLw/TVQ6blyckmAjAOXBmKi
         I1n0b7/pXpbh5qMBEqyHpTz1Zd1793jlPo23qOlJGF+vJve99FLZi6gJCAx2TMsGelkC
         jaRp8r4setFjMyTVxTUTMJrg5xBsx6a9QO0IQZrKk4s9hS7cj2ZwkkZ5qOScLIqfdEm0
         7L3N387A0pi9Z+d0qGFRg9AuqWcGC7uIgUmxZiFU+Uvdevx5i3b/Y2YC9vt0qhK+GtQs
         Tvils6BCUOW4ju2GpOToHnNHX+pnSKjeW2nYp9iu3zitCx0EdCd2oNpoG5wNnrUofgz+
         XQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113096; x=1770717896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z51/LSwxyVQQCwJzOsYDCUnfNLjjWuW1smeCgpUaBns=;
        b=dR+N7d4B5vrZLoGP54Q5tmnbA09YH/7vqYiGe9fBAlwKU5+GecqsOJJGQw55Yrn4Uu
         JleUdQW0uHdQlYr5WMr0q18IHuMJIU4SXs0QTUZtmaKm5SLwTSHdOC8TbOzRJ5t9rSZa
         QpSmpeoCcoyEJDzMLSHJrgTBlFN2NUGDsW/weXf5gf+qiB7436OK+w9RH8JQnzK8098T
         Rfiv5dcrhxNTXxqTIEJorAlKGqvqAisYtfictgTkyfAPrVyh1GhH+lmHA2AqJe22QJKC
         LaT0ejf28+/p7S8TJIXV23mmneYbdZdkao+mLcCvwTGWLgg82lTPFcziHxJGo7AflxJs
         SHpA==
X-Forwarded-Encrypted: i=1; AJvYcCWEsuc3RJA0PfyI57XyYUna/wkd3lcYgCpo7X/A23A+UH66QwuweoH4SrL+d5w+gz1DMtmBAqsSXOSWQQJMjWLy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbbk2jOZ2ZHX3hV8e1WC25mblZFOV6FyweeDcHDhWLG6i2Rc0d
	z8u4VDvlpGUsuHrnSQwmBVdIeXBssHd9dFaezqh2KywuYWP836iTCL9o
X-Gm-Gg: AZuq6aKxNKriUhdpVK5Us+Y7lTUlphDv+GIpjm5DhG/vFD208EJlOvbpq/qtuzYjek6
	wr17whAQs82hn5I6r0TxQFdkfwLEPvUaPAReTz+0ztgOXWq2Knr/0yDyP9vr9zffiClF/KXA1Xw
	ux2boDwdaMDK/iwmY8DhLVGZn+vVCGlEuRWaXlqyOoTP0MhdICanIRSbOrCpcUc0zZ9SnVTcPaw
	YWNcxURxuN7nitxtQ6Z9yzC3fogXHGUGOJxLIT+I4NodJT0fQ0SNY/vtWgv1TKHuhhcF9NLy1vB
	OgF/mA1b2rMwJtWWm+UpBHg1Y96ESnDYVwHCOi1HFvA/J6uaGRim/GcHfo2/fpZA49l95PFtp5L
	FbbKqtvilLs3cBsiNQXZgIGJ3idZrmYvpVLSS1KzISwxlN3BWWIng+P9GHzjb8ER8dCIbz5dZsU
	IXYUuiWsKahQFbx4cB8VNY74lqYUlPs3MpEs9jHg==
X-Received: by 2002:a05:600c:34c4:b0:480:52fd:d2e4 with SMTP id 5b1f17b1804b1-482db012dd7mr201253775e9.0.1770113096399;
        Tue, 03 Feb 2026 02:04:56 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dffd47c2sm115534365e9.0.2026.02.03.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:04:55 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
Date: Tue,  3 Feb 2026 02:03:32 -0800
Message-ID: <20260203100332.915-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
References: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_020458_160120_AEA137A1 
X-CRM114-Status: GOOD (  11.54  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add support for AONMIX MQS (i.e. MQS1).

Reviewed-by: Chancel Liu <chancel.liu@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index ca1c4966c867..0f43e3be7058 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -243,6 +243,12 @@ codec {
 		};
 	};
 
+	sound-mqs {
+		compatible = "audio-graph-card2";
+		links = <&sai1_port1>;
+		label = "mqs-audio";
+	};
+
 	usdhc3_pwrseq: usdhc3-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pcal6524 8 GPIO_ACTIVE_LOW>;
@@ -473,6 +479,21 @@ &mu7 {
 	status = "okay";
 };
 
+&mqs1 {
+	clocks = <&scmi_clk IMX95_CLK_SAI1>;
+	clock-names = "mclk";
+	pinctrl-0 = <&pinctrl_mqs1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mqs1_port: port {
+		mqs1_ep: endpoint {
+			dai-format = "left_j";
+			remote-endpoint = <&sai1_port1_ep>;
+		};
+	};
+};
+
 &netc_blk_ctrl {
 	status = "okay";
 };
@@ -534,6 +555,51 @@ &pcie0 {
 	status = "okay";
 };
 
+&sai1 {
+	clocks = <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
+		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* leave unconnected - no RX in the context of MQS */
+		port@0 {
+			reg = <0>;
+
+			endpoint {
+			};
+		};
+
+		sai1_port1: port@1 {
+			reg = <1>;
+			mclk-fs = <512>;
+
+			sai1_port1_ep: endpoint {
+				dai-format = "left_j";
+				system-clock-direction-out;
+				bitclock-master;
+				frame-master;
+				remote-endpoint = <&mqs1_ep>;
+			};
+		};
+	};
+};
+
 &scmi_iomuxc {
 	pinctrl_emdio: emdiogrp {
 		fsl,pins = <
@@ -618,6 +684,13 @@ IMX95_PAD_GPIO_IO31__LPI2C4_SCL				0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT		0x31e
+			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pcal6524: pcal6524grp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
-- 
2.43.0


