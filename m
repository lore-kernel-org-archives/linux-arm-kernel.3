Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E50C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMupLjWd2gTIRNUkkhAjmLP4EX857cqSjwQTFVZ2qhI=; b=AeHHkCij6WKjvgvhhS1vpHOCCD
	lefOqawF336VxlwHhi4aC8DrsPaq8f727F8c4eHt86uXYufPo1W8QRJp/3UISXYwO8HKfJQvyQKne
	uOq2Mp7f1h5KCUylOBjm8hRjZm1b43Ga3mYN26h/h6uOnGu01+yZcm0w1ciAgI/dxm2jjy8ihtCLt
	FMthXbyIcye7pWNKGt3RSF+CtUC6H+j3XvvfzaSWIpJf1ESHA7a/xHfBR3yjnqfNWK6v9tLhwC//n
	J/Z904Fu+Znol4paWdMBJd/W61WUu09DeBZQJ6gmZv4qWBPXq9xBNgbDgxqjrFiWSAe+bD9u5jA0D
	KG74ozNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeFJ-0000000Fy8R-0vbp;
	Thu, 29 May 2025 14:28:37 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdPM-0000000FrlQ-0pG2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:34:57 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDYpYQ2407009;
	Thu, 29 May 2025 08:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525691;
	bh=CMupLjWd2gTIRNUkkhAjmLP4EX857cqSjwQTFVZ2qhI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fMK3zD1IP7KzaJX1n0elp8xIOHfHYe5nBrUhElxCirsCpcf7ffTUQbG1MmyrfIxyt
	 luD3/B5pD3U6svw3wZiVvCaX+FPNwB/69bnbYOzMUUulP6NIgN3ecMK5eyC4iNgNPn
	 lkUCfC/qDyHsXblCd2KL9yp4dCxXx93IPB7HA2H0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDYpj7063926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:34:51 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:34:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:34:51 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8h1650971;
	Thu, 29 May 2025 08:34:48 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 01/13] arm64: dts: ti: k3-am625-beagleplay: Enable "cpsw3g" in the board file
Date: Thu, 29 May 2025 19:04:31 +0530
Message-ID: <20250529133443.1252293-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529133443.1252293-1-s-vadapalli@ti.com>
References: <20250529133443.1252293-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_063456_320592_7FF0490D 
X-CRM114-Status: GOOD (  10.99  )
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

In preparation for disabling "cpsw3g" device-tree node in the SoC file,
namely "k3-am62-main.dtsi", enable it in the board file. The motivation
for this change is that of following the existing convention of disabling
nodes in the SoC file and only enabling the required ones in the board
file.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 72b09f9c69d8..999f5baaba1a 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -585,6 +585,7 @@ &usb1 {
 };
 
 &cpsw3g {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii1_pins_default>, <&spe_pins_default>,
 		    <&gbe_pmx_obsclk>;
-- 
2.34.1


