Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15763C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCMmTABrSBqeAhv7e77caexkaudNwZFg/B0FOzQ1fiU=; b=PwSn+ICzcofGoJy3VSns0/BFhF
	/kxVJsPg6oL59qMLZmF7LV/FjBAiMxfbSGceSsnN7dvlbioCntxmEviLoP/32kw63UNC+EoYapCtK
	0uj7xXeTvImgEmttwtPOE86kARiM+AiwUlk/mYnN5gfIl+A6Md4mY+ldBvZJVmoVW0GExtE2C3aTE
	GHoOYzyOo/V6HmYRD14+kpy5XAfQpJ1PVq3Z7WVkJokTp87kL4ItX8JFm9tDQNs4J2TpjDpL5rOkK
	9monpmMOF5X1nOv/eawNnCZfGNIS7TBS/HV/nj7RXNSFs88r3cnxClj8jkq3mr1KY/SsqOVDs349S
	z1pkJpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8ra-0000000E5pL-4BsE;
	Fri, 11 Jul 2025 08:12:11 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8QA-0000000E0lK-1xq8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:43:52 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B30ckx014453;
	Fri, 11 Jul 2025 09:43:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vCMmTABrSBqeAhv7e77caexkaudNwZFg/B0FOzQ1fiU=; b=05Z7EaRfhT7myXFk
	wytVQoJhBlgAdS7ffz9ZcQJXkIjfVi8O6VgkZHi+n/FDbvNdZFmABzYrE/ROdl7T
	EvIY77AITnLvybk3haIHyYTae45do3P2lcR3/wI4CBvixZCNmsWWHkvjMeKm9+vb
	WG0eCX5e0mSgWn4iDHpBSekRQckMJ/9xf9rcHhiVuxvpXtuOXnIkM8tAzvDBlCpp
	EMRpsMRVyzieUDuVkRyCNoIr9sWTVpEoVOzYo4eKkfuDUpSare5b7M2nIKMgPbz7
	TbN4Bvtt9X+OL1NmyBcyqtdma1KFQwo4dLVCMeJPy3VHsOEkDT77F94UO7u0+AUF
	oJ0H1g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47qdm6arhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:43:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D536B40049;
	Fri, 11 Jul 2025 09:42:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CD83B11278;
	Fri, 11 Jul 2025 09:41:42 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:41:42 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 09:41:24 +0200
Subject: [PATCH v7 6/8] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp25
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250711-hdp-upstream-v7-6-faeecf7aaee1@foss.st.com>
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
In-Reply-To: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_004350_788878_8246AFEB 
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

Add the hdp devicetree node for stm32mp25 SoC family

Keep the node disabled as HDP needs the pinctrl SoC configuration to be
able to output its mux output signal outside of the SoC, on the SoC pad.
This configuration is provided in the board dtsi file through 'pinctrl-*'
properties as well as HDP mux configuration.
Thus, if needed, HDP should be enabled in board dtsi file.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 8d87865850a7..fa2b6a1881f2 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1148,6 +1148,13 @@ package_otp@1e8 {
 			};
 		};
 
+		hdp: pinctrl@44090000 {
+			compatible = "st,stm32mp251-hdp";
+			reg = <0x44090000 0x400>;
+			clocks = <&rcc CK_BUS_HDP>;
+			status = "disabled";
+		};
+
 		rcc: clock-controller@44200000 {
 			compatible = "st,stm32mp25-rcc";
 			reg = <0x44200000 0x10000>;

-- 
2.43.0


