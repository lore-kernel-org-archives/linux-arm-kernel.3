Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A08C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 14:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t53J5ySJvjZ1mWhdFkUh4HPCxy4CyKe2Xlf/1xsbpAU=; b=RHyexhi9H177RScOtgu+hZVkJQ
	uQGdEhj5fvDpaNBb0v0GOiDqU0la3OpMnHBQrfso85CA9Pnt8VAsqjBW19nbCuLxMSzaPuWd/UdUH
	lrL8NGJS7nX9bDP363USjmQtDm8FMfqVxz/Ltf1e9OqhK5klbHqApQ5TVs2oAoLbFn/J9aLSAJYp+
	NnohjDbBx6Pesm50QFqvws28CpvT1az7TZ5C0JmHuip4OkPOdKX2nqEvlOr5B2RCRLjDE7pnQCGD5
	rT4GpGrH32gtFk5kZPEaF6ZSMEO2k5MSL2j8f/qvs3xSx4EEMvkprKKt/zZ2J0bYuvq5uSebwmaWj
	LmsWmmqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabbv-0000000APzI-2ObZ;
	Wed, 22 Jan 2025 14:21:39 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabTw-0000000AODE-1k6V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 14:13:25 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9W6H7016234;
	Wed, 22 Jan 2025 15:13:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	t53J5ySJvjZ1mWhdFkUh4HPCxy4CyKe2Xlf/1xsbpAU=; b=aAoAtHhHybgNy8vP
	fMxMU/E2n+BtU70eFFpGGNQ/IjND6gyJeYk0Eawi9C0ATNOMS1bC3E7ix7obkdri
	7KnizH9lWS0YHOycNWNs5KwA6vOS8FyKMZhtpjXMXyYE3qqmZuNuJzP+fRqKJ+nt
	RLgiSiqUkMSnXBHau2JLLM4O6HFVE8teYSUhifIBsj8z/usXctv87yzt9+MDBhTM
	44mbK+y10v6QoFShW4MaXyDzjp4A500sEhp1/XHKDAhq72nen2KAU1WPrN5p6f7t
	N5U13c69oT1Ve7GdVyYYj9Mqk5g7XrmX99yIuWuCnJuinRNPC7nUFp8ldmDtORAB
	4Svj3A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44arn2t5rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 15:13:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 56AD740057;
	Wed, 22 Jan 2025 15:11:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89841299486;
	Wed, 22 Jan 2025 15:10:44 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 22 Jan
 2025 15:10:44 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>, <patrice.chotard@foss.st.com>
Subject: [PATCH 7/9] arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
Date: Wed, 22 Jan 2025 15:10:35 +0100
Message-ID: <20250122141037.953934-8-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122141037.953934-1-patrice.chotard@foss.st.com>
References: <20250122141037.953934-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_06,2025-01-22_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_061324_742761_A48BCAEB 
X-CRM114-Status: GOOD (  11.41  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Add SPI NOR flash nor support on stm32mp257f-ev1 board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 1b88485a62a1..fe5577fff4d3 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -80,6 +80,11 @@ fw@80000000 {
 			reg = <0x0 0x80000000 0x0 0x4000000>;
 			no-map;
 		};
+
+		mm_ospi1: mm-ospi@60000000 {
+			reg = <0x0 0x60000000 0x0 0x10000000>;
+			no-map;
+		};
 	};
 };
 
@@ -190,6 +195,34 @@ &i2c8 {
 	status = "disabled";
 };
 
+&ommanager {
+	memory-region = <&mm_ospi1>;
+	memory-region-names = "mm_ospi1";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ospi_port1_clk_pins_a
+		     &ospi_port1_io03_pins_a
+		     &ospi_port1_cs0_pins_a>;
+	pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
+		     &ospi_port1_io03_sleep_pins_a
+		     &ospi_port1_cs0_sleep_pins_a>;
+	status = "okay";
+
+	spi@40430000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		memory-region = <&mm_ospi1>;
+		status = "okay";
+
+		flash0: flash@0 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-rx-bus-width = <4>;
+			spi-tx-bus-width = <4>;
+			spi-max-frequency = <50000000>;
+		};
+	};
+};
+
 &rtc {
 	status = "okay";
 };
-- 
2.25.1


