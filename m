Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84C2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yo5Xx8h3uCqqmk4Dv0r1R0rtmXCq2HKncRpeohdg7BQ=; b=ABYmO29c0VgkdsPj4ZIpQEbQzJ
	+Yr2uGGBIx5RtqUvMgnljOWGHH7bdJmbjz6BMCrLBNCxcpU8lJBhr285yd9WOWCFLB1woauhHKKbO
	THBgA1i1IzZ81GWC+bCIidTaekvs83rXmynqcEuU0bcLHqPOxtg/93rUysLVFD24Lf80zbKbg7Tde
	Ekn6NxBD4TOW/vDIhZJtx5nyryIGds44E34WyueWlWffU6jj8aq26XI81BPn/8W/WwKe/8VUoKZD+
	4RZIWjUQIkNrUXU1zbCvXNSMR9YQHoQmeNa8z0EhwxhfFrlchKzwX+ezGbctTPBraQ/rI8pX2nwwE
	N283hvYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZr1-00000004Vvw-0NJm;
	Fri, 20 Dec 2024 10:03:31 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZpr-00000004VdI-0Hw3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:02:21 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK89MWV013574;
	Fri, 20 Dec 2024 11:02:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	yo5Xx8h3uCqqmk4Dv0r1R0rtmXCq2HKncRpeohdg7BQ=; b=LUGtwFxJD+v4G+EJ
	F0u0JJYijUKbd5dfxEPXb/cTIL9DElink2YkG9Pg9tEYWof7RZ0v5fyj4BiPPmoK
	/uhiSrzfcrFjswHaYBMOEvQQq8RN2S8AIDoumhlX0b0WSmYyBbBECa54jbtnhG5N
	zmRIQ/NKtvcLT3N1vXmPD4NvZVfTzDpqm6R1RucscxSczS8cKGqAr/6IcR4J3802
	ySKQ1qAaWpdaaEotVqwW5RTcU1aVec8xKFetLkAZY2slHbNlSx7fBW9PDQakGRp0
	vG8ofJiBzdhnTiwn2bbbifWeY5lqerHEe4+rhKWrrFtsTUSDH1kxp/Ank6c1udQ1
	/TnRAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n34brywx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:02:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 54D7D4004D;
	Fri, 20 Dec 2024 11:01:21 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4E3A25C235;
	Fri, 20 Dec 2024 11:00:13 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 11:00:13 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 11:00:13 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <wbg@kernel.org>, <jic23@kernel.org>, <ukleinek@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
Subject: [PATCH v2 9/9] arm64: dts: st: add timer nodes on stm32mp257f-ev1
Date: Fri, 20 Dec 2024 10:59:27 +0100
Message-ID: <20241220095927.1122782-10-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220095927.1122782-1-fabrice.gasnier@foss.st.com>
References: <20241220095927.1122782-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_020219_627749_DB53228C 
X-CRM114-Status: GOOD (  10.33  )
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

Configure timer nodes on stm32mp257f-ev1:
- Timer3 CH2 is available on mikroBUS connector for PWM
- timer8 CH1, timer8 CH4, timer10 CH1 and timer12 CH2 are available
  on EXPANSION connector.
Timers are kept disabled by default, so the pins can be used for any
other purpose (and the timers can be assigned to any of the processors).
Arbitrary choice is to use all these timers as PWM (or counter on
internal clock signal), except for timer10 that is configured with
CH1 as an input (for capture).

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 6f393b082789..6601ca411006 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -156,6 +156,64 @@ &spi8 {
 	status = "disabled";
 };
 
+&timers3 {
+	status = "disabled";
+	counter {
+		status = "okay";
+	};
+	pwm {
+		pinctrl-0 = <&pwm3_pins_a>;
+		pinctrl-1 = <&pwm3_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@2 {
+		status = "okay";
+	};
+};
+
+&timers8 {
+	status = "disabled";
+	counter {
+		status = "okay";
+	};
+	pwm {
+		pinctrl-0 = <&pwm8_pins_a>;
+		pinctrl-1 = <&pwm8_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@7 {
+		status = "okay";
+	};
+};
+
+&timers10 {
+	status = "disabled";
+	counter {
+		pinctrl-0 = <&tim10_counter_pins_a>;
+		pinctrl-1 = <&tim10_counter_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+};
+
+&timers12 {
+	status = "disabled";
+	counter {
+		status = "okay";
+	};
+	pwm {
+		pinctrl-0 = <&pwm12_pins_a>;
+		pinctrl-1 = <&pwm12_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@11 {
+		status = "okay";
+	};
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
-- 
2.25.1


