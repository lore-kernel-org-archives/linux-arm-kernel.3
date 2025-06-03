Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA700C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqsmLtll0RdQ6R1NoZ+5laIhIOqbT81HDIchGbSKfvg=; b=4kvGlmARI+CyBYmW5qwu1/N4jK
	McPf68UARupsYycPZQnJx1tBdJ4PWAEcOootyoHR5lUopC+1ikn171275NM+SkQrEIunhAzToPl97
	Ubq5BMx0J16Ohca+gWUz71tni2dCIc2Zo6yq3mAcb6YsEpzT4NOE5TGh0EHqBuwqvh/nzVO+FDzJ2
	h2wwtrbFo826tN4BvaiFF490cCa2P8JC6pYajTLxJaJMR+IEZtugXpBC4FWkxjSY+iMNdsewX6XLG
	sItxrkOwCEIR7S+vMfR4Co/TJ+kca2nO8p7r4ji+jZ6byPHISSEfcQ8Hz4bdnaeriWlxw2Qzj8dp0
	eah01ivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNpY-0000000AUKY-1AfU;
	Tue, 03 Jun 2025 09:21:12 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNZf-0000000AR3b-3HIu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:04:49 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55388UHu006945;
	Tue, 3 Jun 2025 11:04:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	BqsmLtll0RdQ6R1NoZ+5laIhIOqbT81HDIchGbSKfvg=; b=X/wjvKB6yk9AgSgM
	mLeDDb2fYpYYtS4V5AyCq9CWqhkDNTqzcR3c0jsZSEd9cLSXhe0n/nCcnxvtqvr0
	pItdicnuiw/wXO9VrAdcTzSQxnyReG4RTXH2Fvhp2VtgUiyDzHrImR8ngzVYynMP
	ZwDLypYdqlotRQtRc4cHy9nf0oLh+u/7bZg/aOM9qOU9CnpsqtuACJrDI8wKlOQS
	0VEbKYK0g8ns2hr+wfdngJe/Jo150/r1Ay2OX9uDLfwZ6HoDpw9H+qaNmeSeDRPG
	54lmCu4++F9MCffbvi/iQi1y4oL9w5WAo5ui+mARO/ir8Zj50Uys3mpItQuZCspS
	tjGyTA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g90ay76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:04:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 887A840060;
	Tue,  3 Jun 2025 11:03:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8E766CF2B2;
	Tue,  3 Jun 2025 11:02:35 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:35 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 3 Jun 2025 11:02:12 +0200
Subject: [PATCH v2 6/7] dt-bindings: arm: stm32: add STM32MP157F-DK2 board
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250603-stm32mp157f-dk2-v2-6-5be0854a9299@foss.st.com>
References: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
In-Reply-To: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>,
        Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.237]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_020448_112822_B1B22530 
X-CRM114-Status: UNSURE (   8.86  )
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

From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Add the "st,stm32mp157f-dk2" compatible string to the STM32 SoC
bindings. The MP157F is functionally similar to the MP157C.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 408532504a24d5e570c738b16de30dcf8deead6a..ad144c02eb7edf4fc2191ab0af244342dcaa59d5 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -121,6 +121,7 @@ properties:
               - st,stm32mp157a-dk1-scmi
               - st,stm32mp157c-dk2
               - st,stm32mp157c-dk2-scmi
+              - st,stm32mp157f-dk2
           - const: st,stm32mp157
 
       - items:

-- 
2.25.1


