Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FA2D41D61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JlUZyI451SP0ByeDZt2Rr3Atu/Ic1hLEBuyaHi0J/rI=; b=luqOiNVBp/SU4M0FycAtQYawlu
	mu1tc9tCoyjj3gXH/KWwtgqSQLj8s1BNnpLt/L/d2A4kvvwXpigzDAVmk0A3mIDkfo8FvA0PdfiTq
	Wr/RSI/ePmAMkRDegpjL8mf/SxcyxfDJvHX2ZG3/YZmgYGY9JaC+z5rI9K6zwm5q0yxvOR8iz4OMb
	j3IObuEKBc/Tks8iBxEF7c+FwioYNPx8O4DmidPHHpRcC2VV2mXG0KT94Lxo2GrSdb0QfrT29g60F
	m/eAMz75+X44J1/VWP51rzP+mnxELF9dLlLIF8Eu+bTqw6mWhdyShPDeny3u7sRp3PV2fgHRWkS1I
	K/p0DrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlEn-00000002SIC-12rW;
	Tue, 12 Nov 2024 07:22:57 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlCz-00000002S1k-0YlZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:21:08 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABLu5gD016704;
	Mon, 11 Nov 2024 23:20:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=JlUZyI451SP0ByeDZt2Rr3A
	tu/Ic1hLEBuyaHi0J/rI=; b=DUIdKcDyd/y/2a0eEEEn9Day9UOpaLqDDEg0+rU
	M5mOSNstO5lO9hp6Nvyr9s30laMKRpE5xYCP5MlY6O6M6EY52P7XCosooRWJMSsC
	MKESpfwW1pO7ad7z1x3h1iD0v7IS11h0bWQRSsVmDmz6ON2VuKldX+dmbar5Blz+
	p4NIpVCRNOUkApcvrOOyQ7VSXA3blfkVImWgdAZdFY54FYOsVAsOMKXSJsr8GI4Q
	v085s1BbBpxyh4a11uR686gMwiH5dpo7njCqCZek19qPPOdajUBfv2bTNDLeQIdS
	7UsXZps2yo+Evmkxx6BFMfM9T3qGGWU18NNp5mswpiJQ52w==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42un9d1d29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 23:20:55 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 11 Nov 2024 23:20:54 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 11 Nov 2024 23:20:54 -0800
Received: from localhost.localdomain (unknown [10.111.135.16])
	by maili.marvell.com (Postfix) with ESMTP id AD5C73F707B;
	Mon, 11 Nov 2024 23:20:53 -0800 (PST)
From: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
To: <linux@armlinux.org.uk>, <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <salee@marvell.com>, <dingwei@marvell.com>,
        Jenishkumar Maheshbhai Patel
	<jpatel2@marvell.com>
Subject: [PATCH 1/1] arm64: dts: marvell: mcbin: fix PCIe reset property
Date: Mon, 11 Nov 2024 23:20:49 -0800
Message-ID: <20241112072049.765097-1-jpatel2@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7PIGneXPdl4sxcjbtoUaIgMZ9Nl_kyln
X-Proofpoint-ORIG-GUID: 7PIGneXPdl4sxcjbtoUaIgMZ9Nl_kyln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_232105_537530_826DB522 
X-CRM114-Status: GOOD (  10.53  )
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

Set reset gpio to active high

Fixes: b83e1669adce ("arm64: dts: marvell: mcbin: add support for PCIe")

Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
---
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index c864df9ec84d..a8c732a47360 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -181,7 +181,7 @@ &cp0_pcie0 {
 	pinctrl-0 = <&cp0_pcie_pins>;
 	num-lanes = <4>;
 	num-viewport = <8>;
-	reset-gpios = <&cp0_gpio2 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&cp0_gpio2 20 GPIO_ACTIVE_HIGH>;
 	ranges = <0x82000000 0x0 0xc0000000 0x0 0xc0000000 0x0 0x20000000>;
 	phys = <&cp0_comphy0 0>, <&cp0_comphy1 0>,
 	       <&cp0_comphy2 0>, <&cp0_comphy3 0>;
-- 
2.25.1


