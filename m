Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DC6C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3HMULhTdJvMc73sd1m2swXp0fxdZg6FQdwJWWZoV0I=; b=klAf43cyCahY4kIVvzK6yuEQ27
	ADVh5wPMRr/gFXkNtAx40nrFQLiab97J9Ecjvz5I9ysy8PCKGytBmAlo0Tz2MJesPLP0JQPiyAU1K
	Wjwydi4FiHs6aK3yOHkrapgieodiAEKyPH7N5g1KM+PF0h42BT3gE/qK3zZRQpWwlGPiQKRSw4GRn
	jpFDR9GQA0FofanmxO3ZDUECogEc5EcqEZ9rXIMFYo5e3NYUWVX7UHlajnOTLf6UzwbQPmMjdLiLY
	/gUg5LciXyATzrzSaEW9U0l7UJnyOmH/OTY2Ar4HOWj+kM7iWhhaCBFSeB7wfxK11BYQ1BGV3ALel
	MDiVtAfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmr8P-0000000GZXG-4Ayb;
	Tue, 25 Feb 2025 09:21:49 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmql2-0000000GUAB-2H2z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 08:57:41 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7jf80018116;
	Tue, 25 Feb 2025 09:57:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	n3HMULhTdJvMc73sd1m2swXp0fxdZg6FQdwJWWZoV0I=; b=KVJgjNLF0FrKAKLA
	5kvBxLZQUY2/7Tb8VgSFel/Gjvpdqzk6BKDYtFyp075Xsqih+niQVYlyNt6PR3pF
	TtBYVaPxgbcJQjm+Mk0tUVWl1Szzk9OsVBR6FwHubxFtA6xL+l40iSpYLEDkW8I7
	Daf4YIKmBI4aYbbIn8nCwZD6sGYjgvHrhWV3LJgWAYIibl+iwQapdRMZFE8hh0sc
	F+fvZmS4BPat+SlclKLFmjO9O46/zbK79hebpC6WzZ553oJkiriNMNZThweqLZBu
	Flx6DvibnwLlJIwSzpFVdyjQcQB2SoRc0x6Ttvh2s4sDEwJr7P3Y59xveP+zemzv
	D5BtKQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sqsstp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:57:34 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 540E64008E;
	Tue, 25 Feb 2025 09:56:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6ECDD47D0DE;
	Tue, 25 Feb 2025 09:54:32 +0100 (CET)
Received: from localhost (10.48.87.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:54:32 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 25 Feb 2025 09:54:07 +0100
Subject: [PATCH v2 04/10] dt-bindings: stm32: add STM32MP21 and STM32MP23
 compatibles for syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250225-b4-stm32mp2_new_dts-v2-4-1a628c1580c7@foss.st.com>
References: <20250225-b4-stm32mp2_new_dts-v2-0-1a628c1580c7@foss.st.com>
In-Reply-To: <20250225-b4-stm32mp2_new_dts-v2-0-1a628c1580c7@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_005740_870799_383781F6 
X-CRM114-Status: UNSURE (   8.07  )
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

Add the new syscon compatibles for STM32MP21 syscfg = "st,stm32mp21-syscfg"
and for STM32MP23 syscfg = "st,stm32mp23-syscfg".

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index d083d8ad48b70ef68150f3d1b177890282ca025a..ed97652c84922813e94b1818c07fe8714891c089 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -21,6 +21,8 @@ properties:
               - st,stm32f4-gcan
               - st,stm32mp151-pwr-mcu
               - st,stm32mp157-syscfg
+              - st,stm32mp21-syscfg
+              - st,stm32mp23-syscfg
               - st,stm32mp25-syscfg
           - const: syscon
       - items:

-- 
2.25.1


