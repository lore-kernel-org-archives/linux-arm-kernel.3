Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E73CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/3NINU/K2c7qUKU5f+2zWn2uCGFvhWDC/0NFKmcgbI=; b=m9U1jYZ1wGCqlbKqV0T6bELuOA
	2/m1S/4KX/Z7COmup0WWWVJU3KAvC5vM2+taC02uJevCVv0oSWVekltuJ9YSiIYkt8t8TQMZRfAIO
	DG4ZqyZwzxmUrFlpgI7xxOXa6NfwCFeolfJGu8sPD1QUVFE7leT0nCbeCXwInPIWGmSj7R3dcztb2
	+6/9POWywg+oe6yypjTEEW+540Zvpc5lJXBT3xpZqTvcdHuUT+aAio8mVr8n8KLL8eTEbW6dkK8Bt
	lhOca5j2RPn7SI/+Vg2fuJPhw+FMHAac7TSMDbeBtZKPfCoFF5R2vXKFuf1EpyGdWHSO1o1OzjHxR
	qa9kcHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGpF-0000000Fgpp-0WUp;
	Wed, 27 Aug 2025 14:08:33 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDzz-0000000FACc-0nqP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:07:30 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RA4cGa026189;
	Wed, 27 Aug 2025 13:07:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	x/3NINU/K2c7qUKU5f+2zWn2uCGFvhWDC/0NFKmcgbI=; b=iFV2ErZMbwdc2f5o
	4993XzK2tFEEM3WIt/vW0XWwybINZvj8IUWKlWdTL4Aw9r6TswXkWDMeUAL2lfrY
	vm0qx9YiwaSJGSRzBA1z5rfXL0w/mp+JXqX44zsOGxdv+4VHo+WvI/OpLOT4bod5
	sYtn6QHoHzzv/ObeylxvXefStXzU1kOCnAZbuySJQbqxMpwKxvtZO6vhY4NSfyf3
	KBbS1osRlYXk1PgWmJmzJKisKDgG6AjT9sVUNIrfIgGOmdHCPWmPGBJiVXhvE67J
	dT5tRdEYdokp8pI8pkuD4gC73c5g/620To8zSSz0D7xffFd3b61D6KKHsHyfchYV
	g4b54g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qq745m99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 13:07:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 47B634002D;
	Wed, 27 Aug 2025 13:05:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 27E915FDD5F;
	Wed, 27 Aug 2025 13:05:05 +0200 (CEST)
Received: from localhost (10.252.21.245) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 27 Aug
 2025 13:05:04 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 27 Aug 2025 13:04:59 +0200
Subject: [PATCH net-next v3 2/2] ARM: dts: stm32: add missing PTP reference
 clocks on stm32mp13x SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250827-relative_flex_pps-v3-2-673e77978ba2@foss.st.com>
References: <20250827-relative_flex_pps-v3-0-673e77978ba2@foss.st.com>
In-Reply-To: <20250827-relative_flex_pps-v3-0-673e77978ba2@foss.st.com>
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
        Conor Dooley <conor+dt@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.21.245]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_040727_902585_C140C4D9 
X-CRM114-Status: UNSURE (   9.93  )
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


