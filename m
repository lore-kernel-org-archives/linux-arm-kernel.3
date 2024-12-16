Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F499E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvLF11FcB2dtW8666kmjq3LshJkFjb/3saLUTOv8TrM=; b=gxdZMgx/G22ntgar87L6aMHBEd
	V6z+ZIC4n0+8Pz8P+waYGHRhDPoTZuKZ4CgzQZqwMvxJkGKU03CW9xcNcbXtZ9yU0Rk1Z+oTKLZHJ
	bWMNoxnxRRqa2tVULai18MHbFAqnucVM5bGSYrG+bkUjl0lXI9dtT0fsm2My1CVEJihFdieBXVHGA
	X6MaFx4Y5wBaGVS95DAOWZJpclwYU3U+bBWAGBEOWDVEm30qjQQswXdmZLYMKURpVT0CuJDLoVn1Z
	l40UfwlN9y3ahVQ3BGzBSXKATFzfVy3slwT7rwJybZwxuUR1mhb5CRvEoXOgJVYJIPP5vQJ1dwdG3
	bWM09QQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDEP-0000000ARyw-0EF9;
	Mon, 16 Dec 2024 15:42:01 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDDB-0000000ARbR-10cl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:40:47 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEZApx028644;
	Mon, 16 Dec 2024 16:40:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	nvLF11FcB2dtW8666kmjq3LshJkFjb/3saLUTOv8TrM=; b=JQhFuTsrszvz8XAs
	7FOPa6MafgqLur+RtNhm+ZrYhG+BT3/gf6yFoh8YvUzkz+TmWGGFZI8KG0l9QFl/
	6HsZ1ld78LGLWGNMtBlgwMorkJL8YA1C22WJFEpk/w2mPs5DONzDiucZW9Hdq3Cz
	VeOviV+2zIIucGCeK+9JGGpEzFrz3XKwHmoakWm4cVKE2gJKd+ixhNRV8QODV+ji
	pnottnxz7H1EDKGD5BaYRSFsMEmh+86t5+o6b/2EMvEOaHQLhAwf5kdMNpSayzAi
	AJtSZ12KrFw03RCRfNAEGmjCFBDjApwsxOfXUdg3ypZSq0OHFumO68XG0mLXcis7
	jU3skg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43jp3mg77c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:40:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8C9BF4004A;
	Mon, 16 Dec 2024 16:39:51 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5C8C277E13;
	Mon, 16 Dec 2024 16:39:21 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 16:39:21 +0100
Received: from localhost (10.252.30.129) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 16:39:21 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <fabrice.gasnier@foss.st.com>, <olivier.moysan@foss.st.com>
Subject: [PATCH 3/5] ARM: dts: stm32: add counter subnodes on stm32mp135f-dk
Date: Mon, 16 Dec 2024 16:39:06 +0100
Message-ID: <20241216153908.3069548-4-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241216153908.3069548-1-fabrice.gasnier@foss.st.com>
References: <20241216153908.3069548-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.30.129]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_074045_789178_ECF7F999 
X-CRM114-Status: GOOD (  10.70  )
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

Enable the counter nodes without dedicated pins. With such configuration,
the counter interface can be used on internal clock to generate events.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 1af335a39993..c6a5bfe89a38 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -396,6 +396,9 @@ &timers3 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "disabled";
+	counter {
+		status = "okay";
+	};
 	pwm {
 		/* PWM output on pin 7 of the expansion connector (CN8.7) using TIM3_CH4 func */
 		pinctrl-0 = <&pwm3_pins_a>;
@@ -412,6 +415,9 @@ &timers4 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "disabled";
+	counter {
+		status = "okay";
+	};
 	pwm {
 		/* PWM output on pin 31 of the expansion connector (CN8.31) using TIM4_CH2 func */
 		pinctrl-0 = <&pwm4_pins_a>;
@@ -428,6 +434,9 @@ &timers8 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "disabled";
+	counter {
+		status = "okay";
+	};
 	pwm {
 		/* PWM output on pin 32 of the expansion connector (CN8.32) using TIM8_CH3 func */
 		pinctrl-0 = <&pwm8_pins_a>;
@@ -442,6 +451,9 @@ timer@7 {
 
 &timers14 {
 	status = "disabled";
+	counter {
+		status = "okay";
+	};
 	pwm {
 		/* PWM output on pin 33 of the expansion connector (CN8.33) using TIM14_CH1 func */
 		pinctrl-0 = <&pwm14_pins_a>;
-- 
2.25.1


