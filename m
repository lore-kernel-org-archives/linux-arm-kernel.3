Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA412C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLoRpcl9tXKtJLd+8WJKIJFOTcibTvljhF2F7NJ//oI=; b=R0RWTOmFc4ESEUZSV02NMvxPZG
	m5gSIOUNK8+/SX6rkoHpfdoStbz8Vund9jUlqg1xjwEjgvZFhapadB/ZTDBvzxAKQVismKYb6n4c+
	u0Bxn1NrNSRSXDxwFzTWLXsur0f6mmx8IDxYlB3qA3zC4C20Vx/ynZ1+uCCaE7JjcCGxGWFVvp/bP
	RGlQFFRLNUSgLLq55obRaAgjum0KPY6vdBx50qR9ZV9ZXT0DXVqD8mcud2/dXLfbMEt4rcj6O8d7e
	x6vhq63R6mRnrhxLD2u9L5CEUJcb4XI883saOKoTmsxltkC20dOgprLHZrTb8eEYBGizd9HBtKg5n
	EcsnFySg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4f56-00000005fD6-1FXO;
	Tue, 15 Apr 2025 12:08:00 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eJe-00000005V1t-1KT0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 11:19:00 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7cHed002917;
	Tue, 15 Apr 2025 13:18:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	YLoRpcl9tXKtJLd+8WJKIJFOTcibTvljhF2F7NJ//oI=; b=57/gd+C6H30Mh4iZ
	aXksiGpXyY8P+14TpOknatRLPbbQulu2qLYcGUHNmP2/AfHKLzHrTfeHzC0+6if2
	QU9Bibmt5KOjQ8P+9k+PwJuxnqZR8CG4hXh8ni8vk0NaXi/uCxA5cExOPvPqmxj4
	qPBzOQBH9FRtq9noftV4n+VV89LnYSvkUTLW9QqBEPYF07UxsEHF0ULooY8nesbL
	/gy2twGs35daVZsbJ1goF0wECIcjxGarptKBn6CWmZARM05DAsSXCb+/gieEgOaB
	+vgqHZLkb8z1+SRNb0ro7m0/P4dQmRFOgQAAlLay/upa8Wq8RwWpwTZ1/VFcdA0t
	KNR40Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45yfh1vvwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 13:18:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0E2184004D;
	Tue, 15 Apr 2025 13:17:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5BA949B3DEE;
	Tue, 15 Apr 2025 13:17:11 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:17:11 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v2 2/6] arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp25 SoCs
Date: Tue, 15 Apr 2025 13:16:50 +0200
Message-ID: <20250415111654.2103767-3-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415111654.2103767-1-christian.bruel@foss.st.com>
References: <20250415111654.2103767-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_041858_712976_32FD7EC9 
X-CRM114-Status: UNSURE (   9.99  )
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

Adjust the size of 8kB GIC regions to 128kB so that each 4kB is mapped 16
times over a 64kB region.
The offset is then adjusted in the irq-gic driver.

see commit 12e14066f4835 ("irqchip/GIC: Add workaround for aliased GIC400")

Fixes: 5d30d03aaf785 ("arm64: dts: st: introduce stm32mp25 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 379e290313dc..87110f91e489 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -119,9 +119,9 @@ intc: interrupt-controller@4ac00000 {
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x4ac10000 0x0 0x1000>,
-		      <0x0 0x4ac20000 0x0 0x2000>,
-		      <0x0 0x4ac40000 0x0 0x2000>,
-		      <0x0 0x4ac60000 0x0 0x2000>;
+		      <0x0 0x4ac20000 0x0 0x20000>,
+		      <0x0 0x4ac40000 0x0 0x20000>,
+		      <0x0 0x4ac60000 0x0 0x20000>;
 	};
 
 	psci {
-- 
2.34.1


