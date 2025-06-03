Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3493C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2k4Kt+zguDD1NIcj7jjrhOaWN1xKwqC+/1mHTke1NI=; b=FHyGt2fQ96rWMvUMHmw1Q8Kj+A
	zJNSYkpsRBBwdbEDLcCZSJcnNZfOqiSthyjQMoiaUzL83PaWpRxxrlQVBqQB/ZNesJQ7cnFLLMN8K
	6nhElixcee3yniX2Mb3eRilxeb/bemakxcgDvoe0G65PvTgOdIu+9r7wxOIluvNtpeGB1Riv3sQLl
	SDx+D55EM9rtJHisTJ6ZiWKDLcT5owHc6+9TSfUPTCSpW99PwPUzpFuZukQ2t8XwOAsGWZL25jQWV
	8wKNG6oYatNgigfI9sHVXj+t1i4kCaCorjfhRfGCzOlSG3cw0C89uhx9Yj9zov5t7FWBi9cZbzoyT
	X3UkvbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNj4-0000000AT0A-3F1Z;
	Tue, 03 Jun 2025 09:14:30 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNZT-0000000AQyi-4AEi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:04:37 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5538lLnp017178;
	Tue, 3 Jun 2025 11:04:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	U2k4Kt+zguDD1NIcj7jjrhOaWN1xKwqC+/1mHTke1NI=; b=g9+2raUNK7Qpjjsi
	64z9/MQ/pvsvQrEZVHvh5sR4AW8z5F/bvrejgXpP2gDdpIZ6SDOhuRSJFqNK4675
	URD4Ncnp/2mrLUOjbni7w05XO9q90ZWxlTlfygxDTwJPCwPIE2FMKY4D+ffWWLNM
	+2cIuCpb8oc72hwa+WztipISRBl7zcXW+yHqpeGgs0qaxqBLAMCK75Qh6cDWaNXZ
	cUWLRDZa6oCBXPLx/8JnDFWePcK0h8GizknAzZO1l9YFBvM0J+1CW6UgxwNA+YGM
	2fKSR1fiEfjU5sYC3BtMz6ooQhRpx8v11eeoLhMPloKvIO5oQRT/Cf5v9rG6D23n
	jIpvcA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g932uv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:04:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 901A140081;
	Tue,  3 Jun 2025 11:03:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE1E96CEEDA;
	Tue,  3 Jun 2025 11:02:32 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:32 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 3 Jun 2025 11:02:08 +0200
Subject: [PATCH v2 2/7] ARM: dts: stm32: use 'typec' generic name for
 stusb1600 on stm32mp15xx-dkx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250603-stm32mp157f-dk2-v2-2-5be0854a9299@foss.st.com>
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
	<himanshu.bhavani@siliconsignals.io>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.237]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_020436_312637_4749B5C7 
X-CRM114-Status: GOOD (  11.52  )
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

Adopt generic node name 'typec' for stusb1600, which is the USB Type-C
controller on stm32mp157x Discovery Kits.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index a5511b1f0ce306feea5d8657721b078161d01a36..276ed2c9be71cc59891e9b06cb057ce4ff8a143e 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -254,7 +254,7 @@ &i2c4 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 
-	stusb1600@28 {
+	stusb1600: typec@28 {
 		compatible = "st,stusb1600";
 		reg = <0x28>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;

-- 
2.25.1


