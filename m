Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8628DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6RdxceKp9Lb4XLCzxtNYg/LbxWBXXVQzDxc1SNn9Pe4=; b=kXPS4Pv3HoctevqGC4QpLMM02c
	lSJkDeXX3nPIAjzMLjA1FsOKSWfdcJXx3ciWxWOMB1lY9J8LJSggq+ETKYJlceDNCmmVEds8N2RlP
	gAsiTf67iiUxudhoiyTetqW12ykCUphUyZpSFjivoHWG48oIp1KSRX9Sxi7GusCaKS++JuZ5FYMnr
	rZrR7wVn7oxEO/oVz4U3sCuHwfKr1rhrNF6CTDnRQI2q/wW1jxIG9vzdv2r9beXwcMpR+KuCbExBD
	vZaPYdgibVq2gn5Kxn7+pEJv3QLxjygnmHiYvKUElivOH0xv4oX2JlFTeexpMly3gRv4Zcujzfsxh
	8SvWWCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iJ2-0000000H6Xi-1fOA;
	Mon, 07 Apr 2025 08:58:12 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1i4y-0000000H3Tt-05E5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:43:41 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378gYlc002911;
	Mon, 7 Apr 2025 10:43:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=6RdxceKp9Lb4XLCzxtNYg/
	LbxWBXXVQzDxc1SNn9Pe4=; b=vi3oUl21AXCwqUmFSXejzo/bu1DxyNXCAnZyec
	c5eSZCJdTmw8e8y21BICEZnAnYPo4A2KIqtmUnwKcU6TJgitos03ukcCcO1hLtEH
	XYyKRn2uFxIXIfr8qis48dW1l8l9Jpj+uhzQY2sG5Rlh0xpEqZatz6xU2ZXnT270
	Rj0qpDhDXzRqrkGljafZDAZuStcIUChIk9f2FBI2gYt2FQx0QWXK/BumyOiIlBNB
	LG+HYA/IODK4VG682X5PhvGqJvfcNu5XH2Xl1XncSVyTQXWSlRX/MXWQiQ2Q/fqL
	9MGHBsgeGA5w0SR3NTYR6Gf6sx42jqzoqKV5WnuvP02pBNGw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw5fxrny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 10:43:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BECB54014B;
	Mon,  7 Apr 2025 10:41:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53FD093D7CB;
	Mon,  7 Apr 2025 10:40:33 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 10:40:33 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH 2/2] arm64: dts: st: Use 128kB size for aliased GIC400 register access
Date: Mon, 7 Apr 2025 10:40:28 +0200
Message-ID: <20250407084028.2072504-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_014340_350693_83745CE8 
X-CRM114-Status: UNSURE (   9.59  )
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

Adjust the size of 8kB GIC regions to 128kB so that each 4kB is mapped
to 64kB. The offset is then adjusted in the irq-gic driver.

see commit 12e14066f4835 ("irqchip/GIC: Add workaround for aliased GIC400")

Fixes: 5d30d03aaf785 ("arm64: dts: st: introduce stm32mp25 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
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


