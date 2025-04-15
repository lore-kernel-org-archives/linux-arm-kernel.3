Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB0EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uCnm0EMQjNm1h5+L8Dhq/0jgdfQ1th5txaTffecQEY=; b=vtDhc0IU3PlV5orURoFWxZ5T3H
	H18ihI8v38jh6miP8RY6jlPhH++ma5oWRXIDzVLumH49sdnWTe5jZ00tdSLfzEqr+7WEmGTUJVEFM
	R4RZXOl9ew6pPjcur50CsipHlELQ8liX5mc2TIrGbBPySvwnTIJBeywyp7EvCsxnG2D3QagK5PZ7T
	AMrVQx+26W4KFTfaezbZcCRxsrubYpmJlFqmEYzT4IEfMohWoPYcUHX1MZrK6Bk6q7QgQmvOjDPDm
	5VJcceefJYOo6gOcq80EMNxrmBBj1vOEePyjM7sKJCdTF/az9Dfv/1PsF4Sl0XgyNxg53Y7QrhVgd
	SkQdKM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4f8f-00000005fdF-39qO;
	Tue, 15 Apr 2025 12:11:41 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eJe-00000005V1V-0LKK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 11:19:01 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F72Q0a021604;
	Tue, 15 Apr 2025 13:18:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	8uCnm0EMQjNm1h5+L8Dhq/0jgdfQ1th5txaTffecQEY=; b=cod8n22J+Ng621aZ
	u9PIqF5ftCR1vJYTJEoY6TmgoVjn5wnWs8zKFcLfJXDTxIT0ybZ83C39+ZzY/xm5
	1wauxcNOSw6nT3dI6x6MdPGxZM0sJ/+LtUdr0t/uqXmu/bdGlP7VeIoPFGuOa424
	+zp+JWHpbqrhAoQsjqE+dOeYdJouXeM0Ug77fuOaNuoQODIT3kMENiDDZb27hTck
	9XBhuj12bvioKeO80/XERumKJ9OOq5ghVSes+jGw4Ra357Mpptgrq3k5G9MXQx0t
	7SWk3NYQNZptnkgbp9/GzbCU9YVIa0JJBc9LfNfRJbFLWD5LHSsweSjj4104VuP/
	sYHTNQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4601r4aqe4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 13:18:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3704D4004F;
	Tue, 15 Apr 2025 13:17:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F4CA985E9D;
	Tue, 15 Apr 2025 13:17:12 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:17:12 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v2 3/6] arm64: dts: st: Adjust interrupt-controller for stm32mp21 SoCs
Date: Tue, 15 Apr 2025 13:16:51 +0200
Message-ID: <20250415111654.2103767-4-christian.bruel@foss.st.com>
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
X-CRM114-CacheID: sfid-20250415_041858_719026_E25F82B8 
X-CRM114-Status: GOOD (  10.63  )
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

Use gic-400 compatible for aarch64

Fixes: 7a57b1bb1afbf ("arm64: dts: st: introduce stm32mp21 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 6dd1377f3e1d..52a8209471b8 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -116,7 +116,7 @@ syscfg: syscon@44230000 {
 		};
 
 		intc: interrupt-controller@4ac10000 {
-			compatible = "arm,cortex-a7-gic";
+			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,
 			      <0x4ac20000 0x0 0x2000>,
 			      <0x4ac40000 0x0 0x2000>,
-- 
2.34.1


