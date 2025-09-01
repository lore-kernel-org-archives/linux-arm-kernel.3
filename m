Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68548CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN+whkUQ8XqfkuukuvJSM7K0OZfjbIY1Xk7U8MUNQGM=; b=o0D3CYsdoaVRqTWjJTcU6DXU9m
	nm7oNBXc9jccaUh0ntzb9BqaEb4IxwHwl0riLVXtkFv/M97R0P39asDj/WS69zyxqiZLa6yPAnbuQ
	nJFX1j0pVBNpQBIMe8Vml9jxG9TiZGKeaNNvmac0/c+SAQJiOh01tR4LVRLha2AwZbDSVbGNOCkXq
	l1xu692DiQXwITxUbmCp83EJw8XNvyXElPP6SqhaU8xP8ZcwAnVHMk3JwcT+QpON0PYip9zm5R96A
	UwipeLWLvpAGB726zB3rhf+nEVQYqL+crBQ/RcBQrqlH06+MNbIQNIRSfSGLX+UNzG3xSuxx2hMJC
	TTgctq4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6Aa-0000000CzKU-2yys;
	Mon, 01 Sep 2025 15:10:08 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3eb-0000000CSbL-2HPf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:28:58 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581CSsE62805457;
	Mon, 1 Sep 2025 07:28:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756729734;
	bh=WN+whkUQ8XqfkuukuvJSM7K0OZfjbIY1Xk7U8MUNQGM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SswIjOZ+vPoWXNa1AUtTi5wq8sXs9BJbN8Gw0lqU12UkU1+jU/9oQFxb8QtCoppRm
	 IOQ/GfrjSpl6MNsXEpWvSbnq2qlDuRcRL/hqwcJt1QBeTS8kFvJDLwtknFMhm+0NBt
	 ZnWeUHrFHL5mpW6EBIFYcl189AEliuWwuI+hY8fo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581CSsMf1538228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 07:28:54 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 07:28:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 07:28:54 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581CSc7s2504775;
	Mon, 1 Sep 2025 07:28:50 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <d-gole@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-am62x-sk-common: Remove the unused config from USB1_DRVVBUS
Date: Mon, 1 Sep 2025 17:58:34 +0530
Message-ID: <20250901122835.3022850-3-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901122835.3022850-1-a-kaur@ti.com>
References: <20250901122835.3022850-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052857_675674_06EADFC0 
X-CRM114-Status: GOOD (  13.38  )
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

After the SoC has entered the DeepSleep low power mode, USB1 can be
used to wakeup the SoC based on USB events triggered by USB devices.
This requires that the pin corresponding to the Type-A connector
remains pulled up even after the SoC has entered the DeepSleep low power
mode.
For that, either DeepSleep pullup can be selected or the pin can have the
same configuration that it had when SoC was in active mode.
In order for DeepSleep configuration to take effect, the DeepSleep
control bit has to be enabled.
Remove the DeepSleep state configuration from USB1_DRVBUS pin as it is
anyways not taking effect (DeepSleep control bit is not set).

This reverts commit 527f884d2d94981016e181dcbd4c4b5bf597c0ad.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 13e1d36123d51..d3bed23134ca0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -249,7 +249,7 @@ AM62X_IOPAD(0x12c, PIN_OUTPUT, 0) /* (AD19/V15) RGMII1_TX_CTL */
 
 	main_usb1_pins_default: main-usb1-default-pins {
 		pinctrl-single,pins = <
-			AM62X_IOPAD(0x0258, PIN_OUTPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (F18/E16) USB1_DRVVBUS */
+			AM62X_IOPAD(0x0258, PIN_OUTPUT, 0) /* (F18/E16) USB1_DRVVBUS */
 		>;
 	};
 
-- 
2.34.1


