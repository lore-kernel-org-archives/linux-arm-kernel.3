Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7D2CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/3NINU/K2c7qUKU5f+2zWn2uCGFvhWDC/0NFKmcgbI=; b=SUf10tfplsO+XbaJTaU71AS19F
	X0I1WQPn2XugCoWYSoDp2fUMj08yKZiIai9IUG4e+0hCPe4/9WFEOzFSYmxGwaS+oN7vkttSDp6r1
	Rzt9L+xBX6zdlBToq/YMSfnUeZ0hDKuVfrsMdC2zjSKQCG4IFLXsM1WKoGtj4B/tuUfTpzKPGIkIY
	WO0IHFuBq8YS1If69apFFB5ljePD2OdU3na6yy00NwUWxZGLhS+lquOwBWiDFR0NyyzaDkfA3jZCo
	QOYoRKAffQ8dRMdt+ROWFX7dCM0tUWjnQ4YIXeM7A2qktiBRwlCCAYeTJT+e3VV6q4iALIsizjMmo
	TD4tCuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1ji-0000000Bu5S-1Y4i;
	Mon, 01 Sep 2025 10:26:06 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0hA-0000000Bin5-3m1S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 09:19:26 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819DFH8011686;
	Mon, 1 Sep 2025 11:19:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	x/3NINU/K2c7qUKU5f+2zWn2uCGFvhWDC/0NFKmcgbI=; b=EaMPdb3lCCkKG2UB
	jSzdf6y2qBntKiC4SSKRveSHleQDcxgb3YN8y4K5M6OYGHtYDGtGLWnhr4QgyamM
	Et5Gmr1LcT+bGml3+g9ygx0pLWC/dVuWU5fR1hUfvG+ieWTqtjFDS7M4SE/CTLLC
	jpAYHTZeVqtX2FjPlF4v9p6RIQxBAy+T0C7MGqx7y08RYxrcRJzcZz2NZfF0URPM
	KyKTDVeLc2hKpW4FlZozHN/fbYazLrTvKciLlUcUE2PMHtwevQGni2xJlozmtO6e
	dSzA++PldFFbcvVdFLnT9NCxtWv0eQJTaxkrx+kKOppUYdy/v8HTeKMiZGHBZN+l
	TASunw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upqk6ju4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 11:19:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1CC4140050;
	Mon,  1 Sep 2025 11:17:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B142976B316;
	Mon,  1 Sep 2025 11:16:38 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 1 Sep
 2025 11:16:38 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 1 Sep 2025 11:16:29 +0200
Subject: [PATCH net-next v4 3/3] ARM: dts: stm32: add missing PTP reference
 clocks on stm32mp13x SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250901-relative_flex_pps-v4-3-b874971dfe85@foss.st.com>
References: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
In-Reply-To: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, John Stultz <jstultz@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_021925_231730_1A00306B 
X-CRM114-Status: GOOD (  11.10  )
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

ETH1/2 miss their PTP reference clock in the SoC device tree. Add them
as the fallback is not correctly handled for PPS generation and it seems
there's no reason to not add them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 2 ++
 arch/arm/boot/dts/st/stm32mp133.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index ace9495b9b062e9f96437681cc526fed7f9eac5e..b88953485e597dc89c48ea2e3ffd382d1de5de92 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1602,11 +1602,13 @@ ethernet1: ethernet@5800a000 {
 					      "mac-clk-tx",
 					      "mac-clk-rx",
 					      "ethstp",
+					      "ptp_ref",
 					      "eth-ck";
 				clocks = <&rcc ETH1MAC>,
 					 <&rcc ETH1TX>,
 					 <&rcc ETH1RX>,
 					 <&rcc ETH1STP>,
+					 <&rcc ETH1PTP_K>,
 					 <&rcc ETH1CK_K>;
 				st,syscon = <&syscfg 0x4 0xff0000>;
 				snps,mixed-burst;
diff --git a/arch/arm/boot/dts/st/stm32mp133.dtsi b/arch/arm/boot/dts/st/stm32mp133.dtsi
index 49583137b5972572d1feaa699c0c3a822a1b6f6d..053fc669120513c7d2812a0aabe8186fe1f4fe58 100644
--- a/arch/arm/boot/dts/st/stm32mp133.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp133.dtsi
@@ -81,11 +81,13 @@ ethernet2: ethernet@5800e000 {
 			      "mac-clk-tx",
 			      "mac-clk-rx",
 			      "ethstp",
+			      "ptp_ref",
 			      "eth-ck";
 		clocks = <&rcc ETH2MAC>,
 			 <&rcc ETH2TX>,
 			 <&rcc ETH2RX>,
 			 <&rcc ETH2STP>,
+			 <&rcc ETH2PTP_K>,
 			 <&rcc ETH2CK_K>;
 		st,syscon = <&syscfg 0x4 0xff000000>;
 		snps,mixed-burst;

-- 
2.25.1


