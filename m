Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEB4C5B555
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 04:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n6NxpDwg1mf1bOuUw2WDky2Q1KZ624qdIJUn8ZlY//o=; b=o6jR5sA3t9apH1q5P22xnj6pZ0
	7GCJjl+4kW1IDh7bEJAJbghxOPqUoBxX2plJi+yGXc5J7RKxY3nHugTNST+pK7B8B3BaS5iLSxayy
	qX7D2WgJMbSHfzARF7OGQ2a1Tub3arwjf4HmYVnCt4lcwLquIFkn8my41UfENVr8VnigIc2IX2ibC
	UP681ybNRzQtMN4RpLJlLxjoEckyDwJ7H95nn3GLo3gelg8z9JeEnSmN/1Nj3/aJTvK+eVaV9OhOq
	qjzMcjBWEr5h10Sw1xbAXby1d9tDmJSBYfB/jtaN3/4kMUup/rMXWGR0Nn51bj4F7ruYL/O+SbzNK
	uOzzaaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMJFG-00000009flF-2ugR;
	Tue, 03 Jun 2025 04:27:26 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMJCz-00000009fUU-4AK9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 04:25:09 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5534OrUg355270;
	Mon, 2 Jun 2025 23:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748924693;
	bh=n6NxpDwg1mf1bOuUw2WDky2Q1KZ624qdIJUn8ZlY//o=;
	h=From:To:CC:Subject:Date;
	b=bEX1Qu6RpmvpwdD4L0uZYgoUwsapvT76TezuO2ksHm/rjJKoFuiCc8lzz8sqbtrsY
	 g9NshKtWoZeAwk6if4Vg/Rj3+rtAu8BDGgQFAJW2Khyf4vnmcp8fqPfXeW0Mk2cHHb
	 HamrvsIoFFrwnczrlqEcM3QuO5BlxcI6LmC1geb0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5534OrJU3348192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 2 Jun 2025 23:24:53 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Jun 2025 23:24:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Jun 2025 23:24:52 -0500
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (udit-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5534OnfH4063997;
	Mon, 2 Jun 2025 23:24:50 -0500
From: Udit Kumar <u-kumar1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <b-padhi@ti.com>
Subject: [RESEND PATCH] arm64: dts: ti: k3-j784s4-mcu-wakeup: Configure wkup_uart0 with clock settings
Date: Tue, 3 Jun 2025 09:54:48 +0530
Message-ID: <20250603042448.783956-1-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_212506_698151_42378F4A 
X-CRM114-Status: GOOD (  10.15  )
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

From: Bhavya Kapoor <b-kapoor@ti.com>

This commit adds the assigned-clocks and assigned-clock-parents
properties for wkup_uart0 in J784S4. Specifically, the assigned-clocks
property is set to reference the clock identified by
"wkup_usart_mcupll_bypass_out0", ensuring the UART operates with the
correct clock source.

The assigned-clock-parents property specifies "wkup_usart_clksel_out0"
as the parent clock. This configuration is critical for establishing
the proper clocking hierarchy, enabling the UART device to function
reliably across different baud rates.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
---
Link to v1: https://lore.kernel.org/all/20241009072056.3511346-1-b-kapoor@ti.com/

 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
index 52e2965a3bf5..1146bc5990ea 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
@@ -310,6 +310,8 @@ wkup_uart0: serial@42300000 {
 		interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 397 0>;
 		clock-names = "fclk";
+		assigned-clocks = <&k3_clks 397 0>;
+		assigned-clock-parents = <&k3_clks 397 1>;
 		power-domains = <&k3_pds 397 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 	};
-- 
2.34.1


