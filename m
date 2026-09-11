Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86D6C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYaDweuQgQBTdUArpjX7XKC0IRrVZckG1t1WSNHNrl4=; b=GKJwIvv6Rve8lAQ+6H+SLsNaDn
	TqWfgbP0Z6nNBKslJSB1I0DR+a0IcppjJpGEVSTW+YTwCzJoVD7nM8KQh1cU0f0LwcU2WirKnfnkT
	7aado6dRSVYJfM/fPfOhTFy1dYoB5IgonoYSPYc/9wpkLrWb0eMO0B8nCfIor3h9UKeaC15uHlsmd
	yS1Zz5+nXmbKHrEDC6G2wTBJ/6j5zLNMx0/89kEEuykgYrl76cREZEPv+pL547kSVeKiphZEPBxLY
	e8B5TddZMyu6aVFTlpdxJ8nOExLvtvVNWe4+Rsxckp+9u3dv+lQd0wfNEhrvRFUQO9aivcei7srMh
	DmiRQ3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Y2-0000000H924-2vwy;
	Fri, 11 Sep 2026 15:52:18 +0000
Received: from mail-northeuropeazon11011019.outbound.protection.outlook.com ([52.101.65.19] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Xs-0000000H8uB-0O3F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:52:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EedkHNf+2uZtYuQ8NvqG4Q+F1F9+5FO8ySoDU7hFrr3JzcmwyyWVCX/ISTQIDSSbGW5jYH34daqvZdivLzWXBkUP/EXRSUNN/sqCP7S54IZfZgE5A9cXxK8xaCN2vKT4n1BWNRFQSX4PD+4z0oHG//8GSEqSZ62OpMObS1YR3V1p/NkXs340fw8ItSyfCo4AkxGDtfUvK6yChCzQk8+C315JJb6Y1jEdIZ1Yfk39QNSH3Qn2SHzsPzUa+FeowT7aOOrixJs3oIpeq2BrD5UoNNrNNXMNBCb1LgL/b85gh9meG9uoHFp7qCgmOXoIQVybVsngZCWVhraNPE3QaJK/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYaDweuQgQBTdUArpjX7XKC0IRrVZckG1t1WSNHNrl4=;
 b=ICug0a4Gr1k/kT/fjmO6rY2xoNfEohMyKVpl5kOr3j0PESPSU07ooRcbzBTYvP35gwAIs6B2lV2kY5HJ/tF/BwRPNb8gfwOr8stfvi9Kr3nLw+y9NdJF+Ee+csI8VFvjI4HdGfLbM1Me4MhLOOc6OJBQEfCBquufr22eTjU/jTTxFKgPSUGCs9fsvAy43IkPdsZiOCymisbh9hf4lGAoAv1Kw88Qc7bXq2nPA4SiiTicmBpK9k53z2/exj32121rBG04fOUsdZ+m5qMj8gpg2ztk9/KZo3FjGpBnh4Q9Lv6WoKVJHC21YaD2C3byXLt4n//i8mRSss4vfhDn+FVo4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYaDweuQgQBTdUArpjX7XKC0IRrVZckG1t1WSNHNrl4=;
 b=T4anUUnOnzSNlgkjeju9Ux4O1iXSiI4Nl7ZrBAT2lfoNv34VAzxaS+Vus2MqEaAMJGp/aJ/TyheBxUxlrPFIiGp//OI0YVyIaZxZRhykW2qVg1iejJent/wXYaKI3ZnVATnxz3ZHFrQa4yM1sBMisIjWeWI1U3rmCXtVjXNXu0dZuZOywj/BETvjgutJlkpsNrDS0hiE7VjJqrp72nZCjDC+ImA8d/QYcs/dpB1jFNhpXFXNqwOm4yu/LesPPyBFAWNUfzKDohxDFH7k9P7MJZnVyyL2Nkg00WxZSfz+ywuA2s6LQNAAu+HDLvjPd+ALLleyg2cP7g3LalnZFMIYnw==
Received: from VI6PEPF00000216.AUTP296.PROD.OUTLOOK.COM (2603:10a6:808:1::8ce)
 by GV2PR10MB7560.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Fri, 11 Sep
 2026 15:52:01 +0000
Received: from MI3PEPF00008484.eurprd02.prod.outlook.com (2603:10a6:298:1::6b)
 by VI6PEPF00000216.outlook.office365.com (2603:10a6:808:1::8ce) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.406.10 via Frontend Transport; Fri, 11 Sep 2026 15:52:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008484.mail.protection.outlook.com (10.167.240.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 15:52:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 17:57:50 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 17:51:48 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 11 Sep 2026 17:51:30 +0200
Subject: [PATCH 8/8] arm64: dts: st: add ADC support on stm32mp257f-ev1
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260911-adc-stm32mp25-v1-v1-8-cef26eecdef2@foss.st.com>
References: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
In-Reply-To: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008484:EE_|GV2PR10MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 935d381a-8896-438d-15f2-08df101c9e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|1800799024|376014|6133799003|3023799007|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SP1dElc66O5eSYXug0rInsSW8dj9Y13BiqwbOoJMhv8DJx546fLImR5BjbRjFmU8pr0LxRtngcq2uNLWDKqKy3cURQ7ycXJ4/k2WiSjuUUXsrYELnIdQkPXgPr8voEbF4hatKzqxl2Y/jVmn40tAmP3Dh7JUppRoB+py2u1QUUEbKe6HS4c71z0v5YDengO4yxo5sALupVcYVuwWJx23FhF5p43Z+ntY7SYV4/NSDZmSBsDLsAeB1r9ZM6W3cAqxa8i9tGXj/CMIB3B60+Zs4R1XZTaeYwDmTFWyoqNTSLmy/pKqgUapb4J0aw1AICQkR+xKODvcdjh5TNbmRgdFTtE9e4jBK6RfFjCHQ52gq5+CuoZOZcEngmjrvXeEO21BHJj8VXuhbiNlHCyVrSjBqG3g6uJ6tD5T7AAsjil4Y7hXhGtk9zCca87LjisLH6rfk9C6VBwXLlBk1lKyjLyuSsF/neeOkNRPRuvfhU6WPHITwFyOLWmQ94VJ0r/a6Yy0AQ5e8nN/9pa02WjJzIGZwlZ386D87gu5FTlTuyy5zwdPEg5A01oZgPwXe7nScoMIctarQv86NzOr8+cSpg0LC+QoQC2nZRoZg/06UOz9wzAQtAeaTZN79I+p97AJl5ernNbffMihE3HkEqi86z3rz1VAgg5em/FAQigYJyeRVrt8ONxdhD8Y8NV7X3XweKXpTnQig6puoIu8UN+sv4Tp5Q==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(1800799024)(376014)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Dq0WOD5bdcwf4tvyOCKps9pxUWQkrVig1QbEjepBOtJ4VtO2rXz/+2lKcrdGNacO/sxJJVJlnDRxwnpOQpL0kZHihWxB7NXbTVjZ+fzSLEO5DVVua6FSoDxUrldvafl+MZxIJLPH983prdDVZ9z/BwBaWJEaHg1j12Yx3h/vlhU9NLuV9SvX+PbxJ1XlVvrjYL8+Phwp1dfkz5QsWMQkoSDmRvxXjq+/tr0/arOOunUr0Z//CByemQcJPJQvDPtbbZCstbs64QIUjFyEAeEku7zpIRXwU+dnAyJnH8iDwFb71fkjUVkVj6oHQHy/OjXnFjx/yaZLm+y00yNWIFGFC//hWmcAFHEFsuZg4P/MPMYMVkr+yWJHrLVZmeudXXP9o4rwQoOj8OsclP1JI7tmgrKCLQYwfWlecxlFDtAltzjXPhacbE0mUiWfLMbuHOWI
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:52:01.3669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 935d381a-8896-438d-15f2-08df101c9e83
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008484.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_085208_144583_FBEBFF94 
X-CRM114-Status: GOOD (  10.36  )
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

Add ADC support on stm32mp257f-ev1 board. ANA0 dedicated pin is wired on
mikroBUS connector, through a resistor divided and operational amplifier.
Configure adc1 channel0, and voltage divider in the DT. Keep it disabled
by default, to allow ADC to be used freely for other purpose.

--> | 470K | -+-- > | OpAmp (gain = 1) | --> ANA0 (to ADC1, ADC2 or ADC3)
              |
              v
           | 560K |
              |
              v
             ---
             GND

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 14e033f365e3..f66eccee2139 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -160,6 +160,28 @@ mm_ospi1: mm-ospi@60000000 {
 			no-map;
 		};
 	};
+
+	vdiv_ana0: voltage-divider-ana0 {
+		compatible = "voltage-divider";
+		io-channels = <&adc1 0>;
+		output-ohms = <560000>;
+		full-ohms = <1030000>;
+		status = "disabled";
+	};
+};
+
+&adc_12 {
+	/* Don't need a pinctrl for ANA0 dedicated pin e.g. Channel@0 */
+	vdda-supply = <&scmi_vdda18adc>;
+	vref-supply = <&scmi_v1v8>;
+	status = "disabled";
+	adc1: adc@0 {
+		status = "okay";
+		channel@0 {
+			reg = <0>;
+			st,min-sample-time-ns = <400>;
+		};
+	};
 };
 
 &arm_wdt {

-- 
2.43.0


