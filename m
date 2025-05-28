Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6872DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E50xYFA31UxV2r8i4ZX3G+C/OQH/OeYpXAFoahXjSdE=; b=toFhbpSbSJGRnxndMdP7jEHwZ8
	9nLpzdxJZfCP1BATfcS9hE78SQciFG29f4iiXxLXLpSdxgb/egz6Q4tJxuwgHLmPxEZQqifHhJ5sb
	x0M7r6hAx+vEgeXIBX6OD6WzRRqMs7Bqy3iRMBlyZQvv7eOWCf+/yNl8RVYBDATN4lzQvejkXvYf+
	Gq3X9z2chU6O3nrqQan/E5ntN6H2o+xlMeGeC/4zx1HV+8EL2xPYANFkjJGNzdxPI4x8+lgCHNQ7U
	h8LHpZMVr8IHvzOHXpk4uY89r0KEyKeO3elUYQ6X8+IsUZfp9vMgVMRZx+MyK9nDu65Gj7rhNtF5U
	nmiapMwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIKN-0000000DVCh-3Ksj;
	Wed, 28 May 2025 15:04:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGuE-0000000DFji-1LD9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 May 2025 13:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=E50xYFA31UxV2r8i4ZX3G+C/OQH/OeYpXAFoahXjSdE=; b=m+VtZc1cNFbPNPZ1roYkYEKCg0
	7akP9dLNFT76g3V+O9naq8ZRdRfcVRqt9eWMidpU1d4xAtfAiZeuSF5DFEcQO5MSI4q9GEsWSB4G8
	RK+5KsXiUHhjUS9klpt39KtdrFYVaGb8qnyR0NdEPgqMWJ8stRqQT+S4iFJ2XKQfTi71tq3pW2G0z
	oIfw5erThVHyNtHovRNVhwyVVbsD1CpEpSuE1GCWObpw7Vx0DsExAUktFOVCDCzzPL7/aQAAhfvb4
	ZUvIHIJwI67f3o4kAvY/KYt8HbEiO3YJdHH1lT/x4q+NwYqxB4+Pzt8B2AnQISnln6lVuZ0JBJcNW
	ANepkCnw==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGu9-000000000XX-1x4n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:33:17 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SC50nv016771;
	Wed, 28 May 2025 15:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	E50xYFA31UxV2r8i4ZX3G+C/OQH/OeYpXAFoahXjSdE=; b=Vgx6lHBJQdIh+MUI
	arbDveMPv8zTQMBrwDm4eeG+uDzjIXdRp9xyVK+J71R4PQaU+yd6001npOIdj99d
	GqbHWfNog7vETGZrXGggrUoMDrSK72vhw0hGMuPTK+MBagPebEyemKf0p7FdyzcT
	V+bhOzdFUYtlb0aaIf2uFIk/ps9V2ZWyizpvSeoMjsU7JRdLZ6NwGvp53uT2M0mK
	9Ch3nZe/8NjAa1C5b+TqqJlRSF426OPsgyYVHZux6JGCe9jOvL5Xbh4uFJs+OvdB
	a5Phs+8zkjy+xuHJxONWrJ+geKpHChgJs2382GSTKRWxR6Lk/vVE2FJW+HQ8z521
	+XHyXA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u50gsjhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 15:33:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8E34C4006D;
	Wed, 28 May 2025 15:31:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38F2E6CCEF7;
	Wed, 28 May 2025 15:31:06 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 15:31:05 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 28 May 2025 15:31:01 +0200
Subject: [PATCH v4 8/9] ARM: dts: stm32: add alternate pinmux for HDP pin
 and add HDP pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250528-hdp-upstream-v4-8-7e9b3ad2036d@foss.st.com>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_143313_885571_A0F540D0 
X-CRM114-Status: GOOD (  10.48  )
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


