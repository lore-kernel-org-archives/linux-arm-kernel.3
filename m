Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36A1C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 15:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0x4HYCG6udDh+zdPSfjRlPnIjrs/dPAOW/52VBr2Zg8=; b=3x9w76oRx1MVRm1LxSS36ooq6E
	iyYfoHXPpIMVVDPmsDT4tsuPvaVLvw54tTt6a8HC+6gT1gCCUpzwJ4+2s9QrpHqzzhKlg2QchF0I/
	/mfRDGoM63mnNomAbKvo7pBOrLMicqDu2nSGBNEwpJr0iidZ8vD3H9WBHumojr1njxKIr3TUhnlc1
	9ZyEbULMWA+ohgQzVrV6I9sfbruSVLUo0xu6x46E2XGOHWRQMMesxmNSVpSMvgYACwd+XsBd6LTn2
	QawxlUNYaH8iqwqkMGC7xXoWTbU/z+OUMcqChe0MyckCGb4jpbCyhse/a8dIhEZ6XRhlz72WhWjLX
	U5BYLQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iK5-00000006GUN-159i;
	Tue, 15 Apr 2025 15:35:41 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iGR-00000006Fd1-2d1v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:31:57 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFVmLf067493
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 10:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744731108;
	bh=0x4HYCG6udDh+zdPSfjRlPnIjrs/dPAOW/52VBr2Zg8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lWBd9N2WsD/48djntRd9+nArzQLBGRFZhyQaskQT0yDU9rOHRs+29/tgTxGjQWAU/
	 jmuPzMIuUPiQylKP3MB/+3xwAh3VZS8UQPIqtgsPeB6DOZLLa8ZT5IyA6HmcPlkxtX
	 WhVcFITUO/7UhWY+6UpFjCnNX7g75uhTrKvMyKgg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFVm2L030234
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 10:31:48 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 10:31:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 10:31:47 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FFVlZt109804;
	Tue, 15 Apr 2025 10:31:47 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>, Andrew Davis <afd@ti.com>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>,
        Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
Subject: [PATCH v7 03/11] arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
Date: Tue, 15 Apr 2025 10:31:39 -0500
Message-ID: <20250415153147.1844076-4-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415153147.1844076-1-jm@ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_083155_773554_7702ABEF 
X-CRM114-Status: UNSURE (   8.61  )
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

From: Hari Nagalla <hnagalla@ti.com>

AM62A SoCs have a single R5F core in the MCU voltage domain.
Add the R5FSS node with the child node for core0 in MCU voltage
domain .dtsi file.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index 9ed9d703ff24d..ee961ced7208f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
@@ -174,4 +174,29 @@ mcu_mcan1: can@4e18000 {
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
 		status = "disabled";
 	};
+
+	mcu_r5fss0: r5fss@79000000 {
+		compatible = "ti,am62-r5fss";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x79000000 0x00 0x79000000 0x8000>,
+			 <0x79020000 0x00 0x79020000 0x8000>;
+		power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+
+		mcu_r5fss0_core0: r5f@79000000 {
+			compatible = "ti,am62-r5f";
+			reg = <0x79000000 0x00008000>,
+			      <0x79020000 0x00008000>;
+			reg-names = "atcm", "btcm";
+			resets = <&k3_reset 9 1>;
+			firmware-name = "am62a-mcu-r5f0_0-fw";
+			ti,atcm-enable = <0>;
+			ti,btcm-enable = <1>;
+			ti,loczrama = <0>;
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <9>;
+			ti,sci-proc-ids = <0x03 0xff>;
+		};
+	};
 };
-- 
2.49.0


