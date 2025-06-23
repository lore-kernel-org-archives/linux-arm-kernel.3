Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A267FC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soCA1TZ0DhY5YcbIv8yTONB+anARgZKgPRV/EvTfcRg=; b=jlg53AqemSBN7QVkaN81k62m09
	kMN35OCyjAaQoHwYVHbdUc/YMgJMSra1eM+dJQX3wo+6ROmU32whrcGtF1o2oXV6BVRpUJ1oz5+P6
	BCRTbKBNsWg0AmslNL+vrh7N6J8q+v0SxU0rOJB45eOPaG3kLS1WzHbv9s8cjvUGmJ1YICju1yZZF
	GDn9QvP3p1nAJxvNTM+gHcmRnLCHF+Qt83+d2/OM7SJ/pdJX38wcU83UHrQ116aVt2Dp1XOPlcLu6
	hYWW7wTsXiROH1qjlXcZXSgRLDpu1rtfprS3YzQJhXYveA94DwcMlFgdrQJboL12VEcxwiURMQNIm
	WDz0O2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbkE-00000001tJR-0wg2;
	Mon, 23 Jun 2025 07:37:34 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbf9-00000001sHG-12Hd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 07:32:20 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N5XHLQ031861;
	Mon, 23 Jun 2025 09:32:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	soCA1TZ0DhY5YcbIv8yTONB+anARgZKgPRV/EvTfcRg=; b=YeMxTpvIrHFJs11z
	i/YclhjwUCfhr8HXUFCT/IWck6j2Em0xLj6MnY3Ipn05AqTQtD7uCZ/o+bN0GCnS
	MQlIMQzAFy3cI5FxkGPU0gA6KYwI5/EV7+hY8Uj4yBMt0/LHCc+jKMMZGW+lTBPV
	KCbk7jpgaOzLbdvEaRoQZ2aNlNj0z9+dA9INtVebI5Lt9VhZfffVCs9xL0b/2cok
	yzZQY+jR/+mNjamGHmVQ+UPDQHNVIlOR0Q3nbro/JmRT0ZpJJmjrklT5tIuQH+/N
	iyuAs0ZKLce4jYcIZKrlmX0Q8feNq+b3IJJGHffRmOJ4agf+GOHZqqd76qJfFQcF
	+KFJXg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5ner58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 09:32:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6930E40058;
	Mon, 23 Jun 2025 09:30:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 77A61B598C4;
	Mon, 23 Jun 2025 09:29:47 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 09:29:47 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 09:29:17 +0200
Subject: [PATCH v6 7/8] ARM: dts: stm32: add alternate pinmux for HDP pin
 and add HDP pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250623-hdp-upstream-v6-7-387536f08398@foss.st.com>
References: <20250623-hdp-upstream-v6-0-387536f08398@foss.st.com>
In-Reply-To: <20250623-hdp-upstream-v6-0-387536f08398@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_003219_580104_4F89DBD9 
X-CRM114-Status: GOOD (  10.99  )
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


