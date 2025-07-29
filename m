Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B53C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/Foo9POshykOfCA1tCQxxLdk6j4kVXsCtJfrKcrneA=; b=s2vKG+QZM3AZFolL2MT8/Bx5UM
	EgDHM7leQdASKL3jkCduOAFeDecz2m07v1p/EuKTvUKGci5lOzppSkQpaWAc8YOYhgdYZvSjwNG53
	tanAJJzNi+UuZ/5lAsbQfhIlIC8u0frDLDF5/sYpknMx6C2Ud8rqGGnx872aaCYCOZM8tDvNo+0/E
	Qr/LMWOSsbsNFfE6u16ZkZ0s/M6ugeM1LwPJrFZtLoM/BXHIuLR4M9iF8Hq+fCps1qctEQQHMaFM/
	Jh5BlOxy6kMVVXhqDTqO8CIObiIiJZhCvdre098P3jXUopucSnRSKbRn0gsK7a+tLdALnqNIklrn6
	N1r1Q3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglle-0000000Gxwg-3Hqi;
	Tue, 29 Jul 2025 14:57:26 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugljC-0000000GxXt-1ohc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 14:54:56 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TDqD6D023729;
	Tue, 29 Jul 2025 16:54:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	f/Foo9POshykOfCA1tCQxxLdk6j4kVXsCtJfrKcrneA=; b=f/tV+cw8yLM1QTsX
	jftRGfiAZCia852woVLiue+QfJQkryig+H9TTOxqdiPp2rhMirV0lIeG1AxqOiBp
	lyTWhg8wj4RnQBYOUpUIZ1SRG455sxnsSvBAoU1ScbvIwMKaohFgRfZyLdMtG3yo
	UjAPkbHpUijYL5MQDZFrlKaXEQ0Lg0o3EJxaBM76tJn4aSYC/0qED+1x5zjcjEUk
	IGIMfx/4eB0QqecOkjd2PPCbk4Kg1mW2VGi4RH+lGiURbVuw+O5yzwwC4p8qAWEp
	LJm5Ssvv+TIfTnjsf9ge4cqz+nvm6JZucdDBFu1z7u2aT8FHpJV5G86NfcGw0kIz
	u4F9/g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484memnux3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 16:54:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6E3B94002D;
	Tue, 29 Jul 2025 16:53:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3340778886;
	Tue, 29 Jul 2025 16:52:18 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 16:52:18 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Tue, 29 Jul 2025 16:52:01 +0200
Subject: [PATCH net-next v2 2/2] ARM: dts: stm32: add missing PTP reference
 clocks on stm32mp13x SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250729-relative_flex_pps-v2-2-3e5f03525c45@foss.st.com>
References: <20250729-relative_flex_pps-v2-0-3e5f03525c45@foss.st.com>
In-Reply-To: <20250729-relative_flex_pps-v2-0-3e5f03525c45@foss.st.com>
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
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_075454_980214_EE37F0E7 
X-CRM114-Status: UNSURE (   9.69  )
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
index 492bcf586361c487208439ed71a93c2bf83d5eb2..6f5720fb9fa1f58bd97b6bf19fc898f0fecb34d1 100644
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
index e48838374f0df4e003aee5046e45b49986c1daea..0112c05b13e1f02e5ec4b4bffc9a11b4bef1b9bc 100644
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


