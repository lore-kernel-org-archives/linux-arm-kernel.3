Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656DBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 00:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtlE8n852ESlBd0Jmsf8siXOlSR5oed0ZYISsStED1w=; b=Y/4NVy9pehuexXdVeb5l9F7BPb
	HDydqr+s/cWJN/Fr97lyPSsB4kwnzdMe/6qXD4gFvW5E5roFZRJbtO5J26PAxZptgKqCrptCPd20h
	zPyTf5fwlIHvzviB2D2IMPVzOOriXRz5WopBBU8i6f7LR0n4Cq/UGq96t+X7QO/P7iX1oSyUMnCcg
	E3SB194LFoQRgl9kzrhK2cKbkWtjLYAwE2xhAEJud43vTwneSDCZ4Um9ofBk2B1dLjKh+bUAFCG75
	eGKma5fo3o04EjsI2nzQWzOmV2uS7eEh6urkcGc+PrXSGIGYT+hqn71VpemWREbYRHXF29M3pazBV
	S+eJcM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71KJ-00000005SDg-1tpZ;
	Tue, 22 Apr 2025 00:17:27 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71C4-00000005RSF-2wyC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 00:08:58 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08qDO1715195
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 19:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745280532;
	bh=dtlE8n852ESlBd0Jmsf8siXOlSR5oed0ZYISsStED1w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WSdLi1seRiEqJoSO6rWoxwrAcgwnJ2uuDIS9li7G/xtYDUOxP7Ra1tV6r9/W4cz6R
	 00X4vqxZB1xaqUBeoOt829oCIxm5CtWWmcjTRiL/JLXk/Vj6jnJa9OUonVEoChWgWF
	 yXMNCJCI6z3+KeaNly0OnXjShUN5iy8Xb4lM1eaw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08q62079762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 19:08:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 19:08:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 19:08:51 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M08pDG065170;
	Mon, 21 Apr 2025 19:08:52 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] arm64: dts: ti: k3-am62a7-sk: Enable PWM
Date: Mon, 21 Apr 2025 19:08:50 -0500
Message-ID: <20250422000851.4118545-3-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422000851.4118545-1-jm@ti.com>
References: <20250422000851.4118545-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_170856_829938_748DF244 
X-CRM114-Status: GOOD (  10.90  )
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

PWM signals can be routed to the user expansion header on am62a7
SK. Enable eCAP0, eCAP1, eHRPWM1, and route the output PWM signals
to pins on J3 header.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 +++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 1c9d95696c839..a9557ee73b831 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -383,6 +383,25 @@ vddshv_sdio_pins_default: vddshv-sdio-default-pins {
 			AM62AX_IOPAD(0x07c, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO0_31 */
 		>;
 	};
+
+	main_ecap0_pins_default: main-ecap0-default-pins {
+		pinctrl-single,pins = <
+			AM62AX_IOPAD(0x01b8, PIN_OUTPUT, 3) /* (C16) SPI0_CS1.ECAP0_IN_APWM_OUT */
+		>;
+	};
+
+	main_ecap2_pins_default: main-ecap2-default-pins {
+		pinctrl-single,pins = <
+			AM62AX_IOPAD(0x01a4, PIN_OUTPUT, 2) /* (A19) MCASP0_ACLKX.ECAP2_IN_APWM_OUT */
+		>;
+	};
+
+	main_epwm1_pins_default: main-epwm1-default-pins {
+		pinctrl-single,pins = <
+			AM62AX_IOPAD(0x019c, PIN_OUTPUT, 6) /* (B18) MCASP0_AXR1.EHRPWM1_A */
+			AM62AX_IOPAD(0x01a0, PIN_OUTPUT, 6) /* (B20) MCASP0_AXR0.EHRPWM1_B */
+		>;
+	};
 };
 
 &mcu_pmx0 {
@@ -741,3 +760,24 @@ dpi1_out: endpoint {
 		};
 	};
 };
+
+&ecap0 {
+	/* P26 of J3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_ecap0_pins_default>;
+	status = "okay";
+};
+
+&ecap2 {
+	/* P11 of J3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_ecap2_pins_default>;
+	status = "okay";
+};
+
+&epwm1 {
+	/* P36/P33 of J3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_epwm1_pins_default>;
+	status = "okay";
+};
-- 
2.49.0


