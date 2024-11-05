Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDECBD12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pSA2DcK6+VL4PVPhLhuyvaj/CGjejRtTkA3hYib9a0c=; b=Yz/VPTo03OQUNy6c+/Pf0Zd3NK
	R6bT+lASlx15H5POkOCmtOG3SNYQ1E8ZyhsDetvy3EAh7QIqRnK4Up51i2o6lzNj+D1h8yTvyOgIG
	a+33Ba/81rVlc5W7npHPfGSgH0U4isgyYmICovdfcrCTlLUKCaaPlOH4TrW6Ia4F5y0ROYJ5v6IPF
	j1bdvmSheVgxzZFBkvnLqfqcA11wYZBeek1QJzfn/lbeY6416umoNPnpMTEB6hQjnlsc4hYR2RDlc
	3luJYE3TosRfFDD6Wx0Mj7+qrWAHuntnfLKtpgsPgoePXHR0nfyQ0IBtWiDb8GQerf8BoH9/TK/j2
	fFKsTSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Fdq-0000000GSfc-1j5z;
	Tue, 05 Nov 2024 09:14:26 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Fc7-0000000GSR9-1P3L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:12:40 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A59CR4b053563;
	Tue, 5 Nov 2024 03:12:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730797947;
	bh=pSA2DcK6+VL4PVPhLhuyvaj/CGjejRtTkA3hYib9a0c=;
	h=From:To:CC:Subject:Date;
	b=OezhxN4VX9rHbRsTqEjiZODjRuplYhc49cTDGmMVUXNd5Rx/nGN8RvBTta6CUpAo7
	 HZC7obGcs/5eYu91tqCmhkwrrmyxS3PMaFAd+5eex9JINTcl68+ku7Gk7QbmrvQXG+
	 TnaMDWMxTX/UT3qUNHyWzcPn81ZGGvfRGu0rv1Gs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A59CRob050273
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 03:12:27 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Nov 2024 03:12:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Nov 2024 03:12:27 -0600
Received: from localhost ([10.249.128.178])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A59CP0q088748;
	Tue, 5 Nov 2024 03:12:26 -0600
From: Bhavya Kapoor <b-kapoor@ti.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <b-kapoor@ti.com>,
        <u-kumar1@ti.com>, <s-sinha@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j722s-evm: Enable support for mcu_i2c0
Date: Tue, 5 Nov 2024 14:42:24 +0530
Message-ID: <20241105091224.23453-1-b-kapoor@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_011239_588604_F060C14F 
X-CRM114-Status: UNSURE (   8.99  )
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

Enable support for mcu_i2c0 and add pinmux required to bring out the
mcu_i2c0 signals on 40-pin RPi expansion header on the J722S EVM.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
Signed-off-by: Shreyash Sinha <s-sinha@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index a00f4a7d20d9..796287c76b69 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -406,6 +406,13 @@ &main_uart5 {
 
 &mcu_pmx0 {
 
+	mcu_i2c0_pins_default: mcu-i2c0-default-pins {
+		pinctrl-single,pins = <
+			J722S_MCU_IOPAD(0x048, PIN_INPUT, 0) /* (E11) MCU_I2C0_SDA */
+			J722S_MCU_IOPAD(0x044, PIN_INPUT, 0) /* (B13) MCU_I2C0_SCL */
+		>;
+	};
+
 	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
 		pinctrl-single,pins = <
 			J722S_MCU_IOPAD(0x038, PIN_INPUT, 0) /* (D8) MCU_MCAN0_RX */
@@ -812,3 +819,10 @@ &main_mcan0 {
 &mcu_gpio0 {
 	status = "okay";
 };
+
+&mcu_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcu_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+};
-- 
2.34.1


