Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B34CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 08:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aCnbaJkf95wFTf1Eb2cQ4V/qecIbdzw00dRoxQPp0U=; b=XvqRbzqpsppfU8PW7okfCyVFib
	xDXhpAQAojWBh8TItzJY0IqES0DAjzDFYzXgBuAVVbqpv7r6gOiW9gHeHMs+yZzHcO7WL0ohua94E
	mP+Uxi8nbW5/wBtEFz8VZiNzzZA7RWQuFjE3pCTVRZB8eP6rvCAk0i9PuWhyq8CJzYLSi31XX4uS4
	wn/FNj0Qg6Vz4eekpDClZJRHfCo23KR2nOUU5OWjBL+umTt47REglpTQpoGXVPfumZzmIcofq1Yyb
	o74afnoOlh1uwHZ14kpMwhTrNHKIDkxAAwJlOuFHdYEVgLHFK1Y0WN+RGVupYGCvD6uW6exYmjLFp
	EIJIKcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoe5J-0000000Cikx-0x9r;
	Wed, 20 Aug 2025 08:22:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodjS-0000000Cf1V-3UEy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 07:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2aCnbaJkf95wFTf1Eb2cQ4V/qecIbdzw00dRoxQPp0U=; b=naHhj/JD1JrrcQCI71jLfkn6U/
	Reg5DJGMsz+e8rLNOMsjvIrPG+6ujpPzZx5fjBk8PEAcA54ja/YrXqJgtyu+AJZZ/tuJAcYRznccx
	JRAZdk0twP0YIR28Smrtz5hISBgn0PbRLeAPFPwXSp0XRIJjVYJl7NGmV+GYfcL6gPio87HNpeXxA
	vOqiNQsGASwGGY9L+Xa2xFXxs/990bdF0gAbX3OfoEA88Xd9VpMaTaIUhQJhKG/BGFvo1b+TTfGmQ
	NMRwW6JSOh6myhZauUu2ePyPEx7pU68D6KcNdVcYlhP6iHYOCjtmx1aeWP3VffzbuhkrBQ2WncjVT
	QmlR8rYA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodjP-00000000ERg-3zWs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 07:59:41 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K7i0pJ011121;
	Wed, 20 Aug 2025 09:59:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	2aCnbaJkf95wFTf1Eb2cQ4V/qecIbdzw00dRoxQPp0U=; b=IfoiP8lzbpba+cyB
	0icqfIQNjWIkTKuHd7dXDVd+LHNV5FKXCkb3LiAME/rvD5MXYR7mqNvm250GDPLZ
	EE9EuUaxq1z72oMzWjnMFJocAblhr/fYnWTlFLT+3VfNvJ9tnGdq0SIBbzAfPYzU
	q+p2oKV4tUFS6tQok/xvNfuLytU44tqGQD/v7ypw2M21VOKTMbg1JnInBcuwEh+y
	y2uGYCXwQyaLWQnhugluaupKIEjatNEZU1xv2/8GY9b7PqLZfwgrtzphij6p3nI2
	x5Lit0N6l6+lPsuoqF/v2OzaeSvlaPEye6ODlu/M8iSClWKT6mxGiRMKbUEaT7mW
	KJ31Ug==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n7w5rsp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:59:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A242E40049;
	Wed, 20 Aug 2025 09:57:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54B825E8119;
	Wed, 20 Aug 2025 09:56:17 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 09:56:17 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linus.walleij@linaro.org>, <corbet@lwn.net>, <p.zabel@pengutronix.de>,
        <shradha.t@samsung.com>, <mayank.rana@oss.qualcomm.com>,
        <namcao@linutronix.de>, <qiang.yu@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <inochiama@gmail.com>,
        <quic_schintav@quicinc.com>
CC: <johan+linaro@kernel.org>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v13 08/11] arm64: dts: st: add PCIe pinctrl entries in stm32mp25-pinctrl.dtsi
Date: Wed, 20 Aug 2025 09:54:08 +0200
Message-ID: <20250820075411.1178729-9-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820075411.1178729-1-christian.bruel@foss.st.com>
References: <20250820075411.1178729-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_085940_150038_4513F3D4 
X-CRM114-Status: UNSURE (   9.85  )
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

Add PCIe pinctrl entries in stm32mp25-pinctrl.dtsi
init: forces GPIO to low while probing so CLKREQ is low for
phy_init
default: restore the AFMUX after controller probe

Add Analog pins of PCIe to perform power cycle

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 5ac9e72478dd..04e1606df126 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -133,6 +133,26 @@ pins {
 		};
 	};
 
+	pcie_pins_a: pcie-0 {
+		pins {
+			pinmux = <STM32_PINMUX('J', 0, AF4)>;
+			bias-disable;
+		};
+	};
+
+	pcie_init_pins_a: pcie-init-0 {
+		pins {
+			pinmux = <STM32_PINMUX('J', 0, GPIO)>;
+			output-low;
+		};
+	};
+
+	pcie_sleep_pins_a: pcie-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('J', 0, ANALOG)>;
+		};
+	};
+
 	pwm3_pins_a: pwm3-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 15, AF7)>; /* TIM3_CH2 */
-- 
2.34.1


