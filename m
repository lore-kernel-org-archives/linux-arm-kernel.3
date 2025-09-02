Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F032CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKHmaMqAlKNoVFPe+uzx7ydmqDUhBWUhyYaETomDZac=; b=p5a/U32iiUnWSy5yIXxw66xam7
	wnfIn4ZNj7CNNgwZ+1AKwwNgJC35oxJBRkA+FGC9bb7iYPioSv9T7oE6IfmgB3uh8QReoY/FAP0dQ
	ATBjAqex8Ez6JVQN3LUSJet0Kjz+AlJVa2ku+Z8Qh18goU72lEPAkXFQEpGnAQl6tkgS7Dz6TWEU0
	thPihNNVtMyqnn1JFbCLOfgiBi0I8RnSmoEBs/CTtM01X2Ry0eYrXfR+WHLYZFgP7eAubLN5uMtqf
	v0Irq1ZFVIj3fdrdCIF1vQ24RLHYyAkJ0QFd2sxvLuzoa9YMKErKg8ElMVRl+DpBhCXA5GhYUYUNA
	7swFnzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLTW-0000000Fl5g-1Xia;
	Tue, 02 Sep 2025 07:30:42 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLIl-0000000FiG7-3wIz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 07:19:37 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5827JVYg2930057;
	Tue, 2 Sep 2025 02:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756797571;
	bh=RKHmaMqAlKNoVFPe+uzx7ydmqDUhBWUhyYaETomDZac=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=X90EOp6Kpqu+8V72oBs2A+ZIlZPJdsXmCB3xUSXoeIotbXOvYKyTsVJ7zAPbu5+53
	 v05Sr44IIdFTLGl04AgnHFMKI0jiFQND455xnAeaUkUvM6XzZUkepmo9TITMdUzgVp
	 HwX0Ot8zYJgjAjhH+gBAYPuKnf9BAowIAYBWjln0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5827JVMY2558558
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 02:19:31 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 02:19:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 02:19:31 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5827JJga3689199;
	Tue, 2 Sep 2025 02:19:27 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <d-gole@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>
Subject: [PATCH v3 1/3] arm64: dts: ti: k3-am62p5-sk: Remove the unused cfg in USB1_DRVVBUS
Date: Tue, 2 Sep 2025 12:49:15 +0530
Message-ID: <20250902071917.1616729-2-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902071917.1616729-1-a-kaur@ti.com>
References: <20250902071917.1616729-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_001936_067887_49B1FF25 
X-CRM114-Status: GOOD (  14.17  )
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

After the SoC has entered the DeepSleep low power mode, USB1 can be used
to wakeup the SoC based on USB events triggered by USB devices. This
requires that the pin corresponding to the Type-A connector remains pulled
up even after the SoC has entered the DeepSleep low power mode.
For that, either DeepSleep pullup configuration can be selected or the pin
can have the same configuration that it had when SoC was in active mode.
But, in order for DeepSleep configuration to take effect, the DeepSleep
control bit has to be enabled.
Remove the unnecessary DeepSleep state configuration from USB1_DRVBUS pin,
as the DeepSleep control bit is not set and the active configuration is
sufficient to keep the pin pulled up. This simplifies the setup and removes
redundant configuration.

This reverts commit 115290c112952db27009668aa7ae2f29920704f0.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 899da7896563..e8f0ac2c55e2 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -360,7 +360,7 @@ AM62PX_IOPAD(0x01b0, PIN_OUTPUT, 2) /* (G20) MCASP0_ACLKR.UART1_TXD */
 
 	main_usb1_pins_default: main-usb1-default-pins {
 		pinctrl-single,pins = <
-			AM62PX_IOPAD(0x0258, PIN_INPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (G21) USB1_DRVVBUS */
+			AM62PX_IOPAD(0x0258, PIN_INPUT, 0) /* (G21) USB1_DRVVBUS */
 		>;
 	};
 
-- 
2.34.1


