Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05EDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soCA1TZ0DhY5YcbIv8yTONB+anARgZKgPRV/EvTfcRg=; b=SksWOn16BZUJz+UVTyXdNjCpLM
	7sqqngEb2PBE5FBssiUnbsi5w7pZCImzoDj3DVBYQgKwLQMfTjar/8C77GtDN9mvHOnaSPmheokLg
	C6aS4gfC+7GxCPdByTE168Nm/QFvy18RMDlXxGx9laZmuleuTQbEbrYfY4zWPjzh0LcVtDJsn2Jsw
	2VYVaAmFwTSrOozMdBOBpEg/+aNoPHTKRcIYPUTAhknvPhwovpLY/6Op4xpumIVCI0sph6z2EkvC5
	uWyoFuYnW0sdYfsOAgaGRVyC1/rwwY8YKN/MQml/BYHky/udn621wEILoWhGhQA0WngnRAmfQu71b
	e9XkNJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8pG-0000000E5KT-1LK6;
	Fri, 11 Jul 2025 08:09:46 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Q9-0000000E0l9-2QJn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:43:52 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B6d1H1005183;
	Fri, 11 Jul 2025 09:43:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	soCA1TZ0DhY5YcbIv8yTONB+anARgZKgPRV/EvTfcRg=; b=U5tJqTX58u5gclYU
	gZP8ypa6Es0JxUubJoRquJEJZhTgwwqn/S2Q7JIK9Tr8yA9103NebQbDu4YDIYly
	gpWSkWyI1shezADYrcoNo35UTuM4rFpNjNpHYCr27uFuj8xlQXc0Tex04Zt4ytfE
	5LuntdNu+QY4/0ZPIQBN3E/uxon2WKTPPOD4cOG1sgxVquWibD+f4FvRtzmUV8x+
	UeccT6J7Zo1UoREI6hWjvWgOvlhzvBrVNZamt4upCmyVjX/vTRligvWSvnQxBUVV
	hZa4EsxkmijI4SnHgV4FJnIYvOoK3Xvh48rNPb5Gl2dQsA6kEop0OBPJ9FgRWkxw
	TX/4MA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47pud3ne8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:43:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BAE1D40050;
	Fri, 11 Jul 2025 09:42:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55C8DB157CA;
	Fri, 11 Jul 2025 09:41:43 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:41:43 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 09:41:25 +0200
Subject: [PATCH v7 7/8] ARM: dts: stm32: add alternate pinmux for HDP pin
 and add HDP pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250711-hdp-upstream-v7-7-faeecf7aaee1@foss.st.com>
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
In-Reply-To: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_004350_258192_0070B1AE 
X-CRM114-Status: GOOD (  10.86  )
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

Introduce hdp node to output a user defined value on port hdp2.
Add pinctrl nodes to be able to output this signal on one SoC pin.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
index 40605ea85ee1..4a31e9f7a897 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -5,6 +5,14 @@
  */
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
+&hdp {
+	/omit-if-no-ref/
+	hdp2_gpo: hdp2-pins {
+		function = "gpoval2";
+		pins = "HDP2";
+	};
+};
+
 &pinctrl {
 	/omit-if-no-ref/
 	adc1_ain_pins_a: adc1-ain-0 {
@@ -731,6 +739,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	hdp2_pins_a: hdp2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, AF0)>; /* HDP2 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	hdp2_sleep_pins_a: hdp2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>; /* HDP2 */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c1_pins_a: i2c1-0 {
 		pins {

-- 
2.43.0


