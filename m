Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F11AC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsJ9BwEz1wd8EF9lpOMOQsDImQr6kHRBw5n5nBd+jPE=; b=lDFBt3JTxvD7V/fD1806By70sh
	fsFhjMBTemKY6vyluP6uTwyCVr0/BeuAbj4oAmi2jSZXLZ7ImA3RSpIHGjGEf8ZDKqEJDHgXtjKPI
	JBsAAzQZ4l8KthGtPfr20B2K7A96QWIbYS79eT1PtIOXRqMi07Rv49UAVPIrmIV2X0hDU00kGnkTn
	8HCsvwmKBCN1SsFWCumRaw9am2QcAwUHxlW9E7WIDIvijMhkNZEprlktYeZpfN5IKc/6eoElnJVh5
	FqfumwDQ40cpNUvW+epHUCkV6uoC2Qvub/myBed+zlj8wHa86i3WI2KRyqC6yryllqO5w5r//odq6
	moMgmW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOd8-0000000DI5W-1z7U;
	Tue, 20 May 2025 15:11:46 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOW7-0000000DGNE-3EOb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:04:33 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KEnRIG019007;
	Tue, 20 May 2025 17:04:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	VsJ9BwEz1wd8EF9lpOMOQsDImQr6kHRBw5n5nBd+jPE=; b=P/E43kiInuUCyuB/
	2h64dMzcDGpB6Y0buaRhmzsROovX0DXm0/bfJjXTLvbm2Pu+g4cYkmLq933Hcfmj
	keZEhjcmZbRa0aPZa7HVUNUcsjx0cBs8rmVj1wdJ+bOUpD/Ln/vCgRF7KylNeBHX
	fFllBDmBRxLQ/uobyKfFyjBkf24SaLIC1FZwiBeuzs9Hao1Oqv/Li95dcSazAq/u
	YJ39Bx+XcHzYEe6OeUb3HPAbtCj02wJxqk5MF77LEhvuTw8KDAnuEgZV/U33TMmW
	70Smzt58kW2Dz5EKkOv3R+r35IeqFpRZDzXrtqFzGqLoUh6ESGYygcY/I4M1FyV9
	pYhnlw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfka5sst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 17:04:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9588140057;
	Tue, 20 May 2025 17:03:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2C73B20AE7;
	Tue, 20 May 2025 17:02:34 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 17:02:34 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 20 May 2025 17:02:31 +0200
Subject: [PATCH v2 4/8] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250520-hdp-upstream-v2-4-53f6b8b5ffc8@foss.st.com>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_080432_101827_F4733EBB 
X-CRM114-Status: UNSURE (   9.27  )
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

Add the hdp devicetree node for stm32mp13 SoC family

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 8512a6e46b33..b0537bcdb9d5 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -951,6 +951,12 @@ dts: thermal@50028000 {
 			clocks = <&rcc DTS>;
 			clock-names = "pclk";
 			#thermal-sensor-cells = <0>;
+		};
+
+		hdp: pinctrl@5002a000 {
+			compatible = "st,stm32mp131-hdp";
+			reg = <0x5002a000 0x400>;
+			clocks = <&rcc HDP>;
 			status = "disabled";
 		};
 

-- 
2.43.0


