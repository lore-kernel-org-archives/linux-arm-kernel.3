Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1197D31765
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aVMUkRdLkMCaG4A9wtB/vfWUp+xDSUG4XcTStCzpQHM=; b=jM90JFDaxkrVj4ANv9bhWYWyM4
	uSDUY0dddCsY7L8CKgfWcYSDtS5Nmswh2UCSnjx9kc9aC79vLsvINhGSPg8uoH1VTqF2n7sd4xE5+
	raQmwWzupJuMjb56hIwMgp9bF0zWKE/ebE61TGJmdMn84kUhA7PR/ILdBMWDbdMvOvHJXtKYbvlsw
	SpVvDsEsedQKbbmiwe6/Im/8KKsu0EAC1WupJ2ZjdrUCCV1H996EPC6AatCZn+6L+uMAcWO4EcSPu
	Fzoazh5Hvjg4KrZUBDvVlwn0dv/LCsVFBEY0zXCjn0uPmu0at3uQEplIV9IUMXjocgjxTiNQyio6a
	HmX+xClQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Mxp-0000000099N-2Bdd;
	Tue, 05 Nov 2024 17:03:33 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MLB-000000001pG-0ATP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:23:38 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5B9tdI023031;
	Tue, 5 Nov 2024 17:23:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=aVMUkRdLkMCaG4A9wtB/vf
	WUp+xDSUG4XcTStCzpQHM=; b=x8R29AaGuHavJqJItWuwnwmCmqYRVtYRUh3RlD
	Gh3mrSvk9L3fagKy/uFabHvNeeQu680T3/0H/P+HcDmTEDr2Gz/bCTGS+noDPmuR
	qWWRCmjbfD0ByoIhStT+CyrEE8qyqLZyvQ1aTUnNG/C/m0+/Szt70GBZnAUEgUAt
	ammAUd7oMLQHp0Sua8LdImJIG/VERJzKXRe72OgIAyw3hTEl3NgUG+RsmeAYO4RQ
	gnn72DGWz+3kllTWTdQjnMj3YBHc4JTES2q7UAgHucaVJhm1O0WhcIbQydbqZeO0
	Szt4tgwuXhs9cLTts9OEmXbMGIscyq6LRB+byM0W3rzaJUJw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nywnamjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 17:23:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 965C84002D;
	Tue,  5 Nov 2024 17:22:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25B3A267809;
	Tue,  5 Nov 2024 17:22:01 +0100 (CET)
Received: from localhost (10.252.16.126) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 17:22:00 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Olivier Moysan <olivier.moysan@foss.st.com>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] arm64: dts: st: add spdifrx support on stm32mp251
Date: Tue, 5 Nov 2024 17:21:41 +0100
Message-ID: <20241105162141.712073-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.16.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_082337_393084_72612415 
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

Add S/PDIFRX support to STM32MP25 SoC family.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 6fe12e3bd7dd..34970be2e0b3 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -267,6 +267,20 @@ spi3: spi@400c0000 {
 				status = "disabled";
 			};
 
+			spdifrx: audio-controller@400d0000 {
+				compatible = "st,stm32h7-spdifrx";
+				#sound-dai-cells = <0>;
+				reg = <0x400d0000 0x400>;
+				clocks = <&rcc CK_KER_SPDIFRX>;
+				clock-names = "kclk";
+				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&hpdma 71 0x43 0x212>,
+				       <&hpdma 72 0x43 0x212>;
+				dma-names = "rx", "rx-ctrl";
+				access-controllers = <&rifsc 30>;
+				status = "disabled";
+			};
+
 			usart2: serial@400e0000 {
 				compatible = "st,stm32h7-uart";
 				reg = <0x400e0000 0x400>;
-- 
2.25.1


