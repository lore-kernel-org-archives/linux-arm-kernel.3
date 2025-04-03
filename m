Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E76EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKML0WZjxBIyltj3JPMcWXIsE/1e9bbTAtcZvdraRW0=; b=ATeJlakVxY4CaEFbeKhz1o356j
	t4yn67AsLDIzX+s1iw0LkYVe7ob/EDkGxGlTjEGW+890qjcdFh3HD3PrCxgpxuRW4/m/I7E6WJfLT
	seXSAqCOQBWtu+rraTXxYhBonwt6qXPwhcDzg6rcksidgK25oPCgOthRLH97VgKZwY2rlrcBwvI7J
	8n7NZWh3PRKLiGV4UWDfXtaRozqBcOJ0bfPLixi0vY/kRL4IS7T5LNQSQ+Rf30iHU++sX73J1QGa3
	adXp9Eg+dDLHdj9lpdNjGnxU7uoQSNdaWFFJqbM6VG36JLEzkAOzZ6TgEJdl5iwnlyCjgJyNuZN+S
	B5VvZHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Jlo-00000008pUo-0OkA;
	Thu, 03 Apr 2025 12:34:08 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JiF-00000008p32-1nBB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 12:30:29 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BM3S8024194;
	Thu, 3 Apr 2025 14:30:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	pKML0WZjxBIyltj3JPMcWXIsE/1e9bbTAtcZvdraRW0=; b=cpyDjXYjv9jmG3w/
	oz33rqsrjwzcF2NuUda+5gLMNuy9q/ekUUUD3Dpfb4AyjkWkium0ejmuBAL4BNY4
	wm51tmmTtwS8V6Usn7wRzswusKpvBWCWmtwVCZ/WUnyZywztg4VGJ1xLpDL2wvyG
	duMwyI4F4Bne1NBLsEo5e/kZMSGZS/1PzWNunB580do4Oqe0qGxb0d5wn/0Ck67a
	UEX7b0EWcjx0fZTLZr9EldmUnHn24Brdi7cbE5jwsUvbq92cv0KetHO8sQfRfqfB
	jbOgYL80n0E1rcRwOR/wwtdSTwc1fGqG9C6YJqu21sXQKWKNC3pC4SIT4eDwgywR
	TvzMSg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2c7ef05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:30:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 16C7C40045;
	Thu,  3 Apr 2025 14:29:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 647AF8EEC9B;
	Thu,  3 Apr 2025 14:28:35 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:28:35 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <maz@kernel.org>, <tglx@linutronix.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH 3/3] arm64: dts: st: add st,stm32mp2-cortex-a7-gic in intc node in stm32mp251.dtsi
Date: Thu, 3 Apr 2025 14:28:05 +0200
Message-ID: <20250403122805.1574086-4-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403122805.1574086-1-christian.bruel@foss.st.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_053027_904996_066E9C00 
X-CRM114-Status: GOOD (  11.62  )
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

Add st,stm32mp2-cortex-a7-gic to enable the GICC_DIR register remap

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index f3c6cdfd7008..030e5da67a7e 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -115,7 +115,7 @@ scmi_vdda18adc: regulator@7 {
 	};
 
 	intc: interrupt-controller@4ac00000 {
-		compatible = "arm,cortex-a7-gic";
+		compatible = "st,stm32mp2-cortex-a7-gic", "arm,cortex-a7-gic";
 		#interrupt-cells = <3>;
 		#address-cells = <1>;
 		interrupt-controller;
-- 
2.34.1


