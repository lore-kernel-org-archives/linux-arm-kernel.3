Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6131FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyvfV+AYwDjBOXDtTWGqGeG/DtUzeN6+72wCHLNtRTI=; b=HkJ9M3J8h5RZ2dzhciCBgINgj4
	nJosUKwUdtZWvIbzt3B4inl9/cYWTXcxqcCt/icnVra6/Gm5SvbEvvBzqkBIWc1pPRDaruvgTH58/
	jnul30apI21u02SXS5yG0HCHhHyE1VjEG5PHlzYAwu5SMegJkqK/dVCYh7O6C+rLYeQ9b/5FDb4pY
	Q3QynOODtHv2u/g4dNtR/kZvcKf/HFsxG97uw3XGBz/MXV/GUFfhL8kl4/zYAdh2dTd16fZUXripY
	7M64nXVfG9xBuFzs5QYSGJzZ319yOvOhRdg47kpV/cHJG7JBpWumFcHPJ/gJb3FzVUh5FqrztvhOb
	1H80dRMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDJq-0000000AT2k-1TTw;
	Mon, 16 Dec 2024 15:47:38 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDDH-0000000ARi5-10Av
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:40:52 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEYN89030036;
	Mon, 16 Dec 2024 16:40:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	oyvfV+AYwDjBOXDtTWGqGeG/DtUzeN6+72wCHLNtRTI=; b=r/rFzRaHcJBnwpyu
	wgMwaZrS9W+xmRnmEEXU6/ksTqmhA1XAI6vxvbsmJC0oT2kw2GjSzCsJIUVxVeiu
	Zjw3/Fzke9nu9/65ch70VMTob8/SM4kMzldmzJ2V05MXypDMQjlTYoIqPzfbPmEq
	rgINum/MSpBogQ3d9lOQo0I1J6HDiWzkX5ExT+viks5PrQFm5aqxlp2e+rA4xeIO
	ImQQt0cjpSxe0ZqakelkjCUrgrc1t7sOjP6By74bVzzy9pdc7BPu0AJlOYKoKEPT
	y6QiW5tOUabtelsCyq7cJhMR9AHgehQy1/93lYgkF8BZLx99MPTxc8EtFnFitmwX
	Tp1pmQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43jp3987c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:40:46 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 386384004B;
	Mon, 16 Dec 2024 16:39:52 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D395285ED5;
	Mon, 16 Dec 2024 16:39:23 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 16:39:23 +0100
Received: from localhost (10.252.30.129) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 16:39:23 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <fabrice.gasnier@foss.st.com>, <olivier.moysan@foss.st.com>
Subject: [PATCH 5/5] ARM: dts: stm32: add counter subnodes on stm32mp157 dk boards
Date: Mon, 16 Dec 2024 16:39:08 +0100
Message-ID: <20241216153908.3069548-6-fabrice.gasnier@foss.st.com>
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
X-CRM114-CacheID: sfid-20241216_074051_568146_677F6D55 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index f7634c51efb2..a5511b1f0ce3 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -570,6 +570,9 @@ &timers1 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "disabled";
+	counter {
+		status = "okay";
+	};
 	pwm {
 		pinctrl-0 = <&pwm1_pins_a>;
 		pinctrl-1 = <&pwm1_sleep_pins_a>;
@@ -585,6 +588,9 @@ &timers3 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "disabled";
+	counter {
+		status = "okay";
+	};
 	pwm {
 		pinctrl-0 = <&pwm3_pins_a>;
 		pinctrl-1 = <&pwm3_sleep_pins_a>;
@@ -600,6 +606,9 @@ &timers4 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "disabled";
+	counter {
+		status = "okay";
+	};
 	pwm {
 		pinctrl-0 = <&pwm4_pins_a &pwm4_pins_b>;
 		pinctrl-1 = <&pwm4_sleep_pins_a &pwm4_sleep_pins_b>;
@@ -615,6 +624,9 @@ &timers5 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "disabled";
+	counter {
+		status = "okay";
+	};
 	pwm {
 		pinctrl-0 = <&pwm5_pins_a>;
 		pinctrl-1 = <&pwm5_sleep_pins_a>;
@@ -630,6 +642,9 @@ &timers6 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "disabled";
+	counter {
+		status = "okay";
+	};
 	timer@5 {
 		status = "okay";
 	};
@@ -639,6 +654,9 @@ &timers12 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "disabled";
+	counter {
+		status = "okay";
+	};
 	pwm {
 		pinctrl-0 = <&pwm12_pins_a>;
 		pinctrl-1 = <&pwm12_sleep_pins_a>;
-- 
2.25.1


