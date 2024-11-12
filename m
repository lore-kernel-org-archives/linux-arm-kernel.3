Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4C5D32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x39qJZiDk7Rcvu2YVAqB/TtapZ8KFsFMLViv0bVAnOw=; b=MMzmVYPpazN49sNcf3ZFe/v3YU
	pKNjNs2GsjbU9iOycD5zgcljSran8+Zep1EKwnN2MW/NNF4jw5kqjw+cyx2LY759VP1rg7Z48EYgA
	2U5Yg++UJTQBuvEQMjQzP/pKy7XEJRlQXbvP7COYqIQq7dPfwGkxBr5BE/Z8JD2e01RI9GlFxewKK
	g+LHOco3MkVKMWL+IQxKnkDk9mqTBjSXKycWOOIwjOj+OU3rC7IoIuTACeIkY0l4m78piJLvZp0R3
	WnMsu2z1Rdf9qwWx5KjZ79KPL1Ew9y6j3KjB8wHZ5sPQWs2Gj/RfPa55dqtHqJaWtQGzAcoG2ej7/
	eMYioI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApxm-00000003OAH-09t0;
	Tue, 12 Nov 2024 12:25:42 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApWH-00000003JR8-0XMm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:57:18 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4ACBv1rU2669700
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Nov 2024 05:57:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731412622;
	bh=x39qJZiDk7Rcvu2YVAqB/TtapZ8KFsFMLViv0bVAnOw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ok+9MoXSU13GDmvZ+s6KaOJbgaFcU/MRMz63VkU6/NuQFoNi/ugOx9xI9YunGzQsZ
	 PHuERkgBs1L1LWwvzsad8uTbVUo5HjOAMjYqFODIedPmLyitV3JU1gC+LP6ui6SGrS
	 /PqK34NBUXCL1z5GGF6LoXCmNDcegzf8sDl9132E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ACBv1G2016256
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Nov 2024 05:57:01 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Nov 2024 05:57:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Nov 2024 05:57:01 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ACBuo5U116685;
	Tue, 12 Nov 2024 05:56:58 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62x-sk-common: Support SoC wakeup using USB1 wakeup
Date: Tue, 12 Nov 2024 17:26:50 +0530
Message-ID: <20241112115650.988943-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241112115650.988943-1-s-vadapalli@ti.com>
References: <20241112115650.988943-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_035717_374692_44020A11 
X-CRM114-Status: GOOD (  12.58  )
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
the SoC has entered the Deep Sleep mode. Hence, enable Deep Sleep pullup /
pulldown selection for the USB1_DRVVBUS pin and set its Deep Sleep state to
PULL_UP.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 6957b3e44c82..8b6316454639 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -256,7 +256,7 @@ AM62X_IOPAD(0x12c, PIN_OUTPUT, 0) /* (AD19/V15) RGMII1_TX_CTL */
 
 	main_usb1_pins_default: main-usb1-default-pins {
 		pinctrl-single,pins = <
-			AM62X_IOPAD(0x0258, PIN_OUTPUT, 0) /* (F18/E16) USB1_DRVVBUS */
+			AM62X_IOPAD(0x0258, PIN_OUTPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (F18/E16) USB1_DRVVBUS */
 		>;
 	};
 
-- 
2.40.1


