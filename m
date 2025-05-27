Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F40C5B542
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2k4Kt+zguDD1NIcj7jjrhOaWN1xKwqC+/1mHTke1NI=; b=jv7cuHrMIjtIuJYaVmwCHJh4sj
	mN9FBMin2IJtZDwQNA7WN02RN2x0BF0IQ7Ouk1ntKpLzBFUeVfoaC13uuoz60xSBrmCfOug9ZWI5h
	KFilQ8X0Yuqoo6yHzVWA31F7YsN/MWr9BlUqmK5Osh0/EqzYiYYsA9fFcsKsvXlVHMBVPa81L9y9v
	5lQT4KAXQvOctPvI6eODup6EjjLpcNklTTfcf8Hd9haUZ/OkMMyMm4O8ej/yMwGPxQahimwGWbTrd
	JG+N55bTFApxua97ss920JAiPWlI35NCshgrbJ+ayhw2EyHVqtoQKx+TcTL0eVDRaM+QQlBW5RoD9
	fXRR4B3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJu3s-0000000AmUC-1UAr;
	Tue, 27 May 2025 13:09:44 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtzr-0000000AlhP-2oBE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 13:05:37 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCaRqv028208;
	Tue, 27 May 2025 15:05:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	U2k4Kt+zguDD1NIcj7jjrhOaWN1xKwqC+/1mHTke1NI=; b=Euo7B2GKs7ey3ZQB
	A+k5TZJu/4mO6iuvjFXFp97E6vGjqkybbPgXx/u3o/1Y96IBhxChqb4hu16ZbB4E
	Bo2F15hyBVqro4eLdcxvFI48jzSJ5T3SPeGp60bVDkDY9Lk50wWJ9m3hizoIj9gZ
	8EUvtaebHetSqs00lqaopCMshJSIP5AdVWXPBFYpwiuajSlLPzADn6m9GQpFkXWb
	S8LRSuF2NN+cmR/1lwjDPXOsRvIo3mFqHYfyvmnnHQHtm9HXWmV8D5K0feoyGtS5
	YJgt48suOKMWZHPRS7/NW6z+QgKWAz37exo7JDcVtGhkhT/azrOAfvG+oqEM3Pdy
	6AjdkQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hk4edh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 15:05:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0EC0E4004F;
	Tue, 27 May 2025 15:04:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48C18AE0788;
	Tue, 27 May 2025 15:03:48 +0200 (CEST)
Received: from localhost (10.48.86.139) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:03:48 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 27 May 2025 15:03:18 +0200
Subject: [PATCH 2/5] ARM: dts: stm32: use 'typec' generic name for
 stusb1600 on stm32mp15xx-dkx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250527-stm32mp157f-dk2-v1-2-8aef885a4928@foss.st.com>
References: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
In-Reply-To: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.86.139]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_060536_019502_762B8285 
X-CRM114-Status: GOOD (  10.98  )
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


