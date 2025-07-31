Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C4FC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 12:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6sZ+TNX9IcKpnhypEPKDNU8G9miBOODLIjgJJ1A5pg=; b=RFNffvdpET1t+0w978s2fcbVuQ
	WP5WSHvk33KnqV68844v2n0yX1dkFHLLSxBxKrQIxw8JF1+6YL+GWWl2sMsSGZG6HXPYrwm49WpEZ
	ewrglRYh/1YdGYBBbcXkbiC5lAL90vkxjlWY8gLUx8WRzUb+WfvJ9RzZL/55BiyXvBnEt6EnMiWAp
	9EGdTA6F4zdGse1pxEYVZhXP9ZbD3O2VkJZ2r9uy4G7KL2VfSvedEPVid2tquIuv9aVGT+BCzZR48
	Pz3Bb2f3zCheWd2pnW7sgC0Iq2g8BmeTXNC6TqwQqJ9pQbWqwbD2JvD3PHBtQEVTLU9Swi9/s/lXF
	W2yKHClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhRz9-00000003X5V-0ld8;
	Thu, 31 Jul 2025 12:02:11 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhRuT-00000003WWY-1xHr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 11:57:22 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56VBvFGv3481496;
	Thu, 31 Jul 2025 06:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753963035;
	bh=z6sZ+TNX9IcKpnhypEPKDNU8G9miBOODLIjgJJ1A5pg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xqTUJKta4gqiJHOtYcJh6lpgL9WJHb2/Q2dXreTfbZ+V419PNQzwXAc2+t59T8K/I
	 RIAywB5SdW/wb2ZbVw9T+eOF7KfH9SJSZlY9ALAAdgL3iPNgDBpV5lxVFamVEprea/
	 PVC8Ok7zohWY5COCDGjyOwoZ6Wh15xtegDwNbNFA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56VBvFxZ2686468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 31 Jul 2025 06:57:15 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 31
 Jul 2025 06:57:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 31 Jul 2025 06:57:14 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56VBudQP2861468;
	Thu, 31 Jul 2025 06:57:11 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <vigneshr@ti.com>, <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>
Subject: [PATCH 1/3] arm64: dts: ti: k3-am62p5-sk: Remove the unused config from USB1_DRVVBUS
Date: Thu, 31 Jul 2025 17:26:29 +0530
Message-ID: <20250731115631.3263798-2-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250731115631.3263798-1-a-kaur@ti.com>
References: <20250731115631.3263798-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_045721_591645_FCE57CCC 
X-CRM114-Status: GOOD (  13.24  )
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

After the SoC has entered the Deep Sleep mode, USB1 can be used to wakeup
the SoC based on USB events triggered by USB devices. This requires that
the pin corresponding to the Type-A connector remains pulled up even after
the SoC has entered the Deep Sleep mode.
For that, either deep Sleep pullup can be selected or the pin can have the
same configuration that it had when SoC was in active mode.
In order for deep sleep configuration to take effect, the deep sleep
control bit has to be enabled.
Remove the deep sleep state configuration from USB1_DRVBUS pin as it is
anyways not taking effect (deep sleep control bit is not set).

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


