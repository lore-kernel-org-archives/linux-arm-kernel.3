Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F11C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 15:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84YJu5c9njy1DU+TSe/AuT8a5aoDMIOsRFmJ0NwBPUU=; b=vkWiSi4NA/i+diAwyiCGN+b0hv
	MzJ3QrS2HPXTQ46HFqynTO+BIZfu4T2aw2U4qOB37XINvsbkx/l2s/Fsz55756wn1fwPl0/qL3sSl
	maw2H/qOdiLLegL5ZHlf1tFafHbufK067giyhxVauW080i/D5XpMS6W41AVjm0oH0GgGDtsyDT4Hl
	07VLSP7rNbkNA0kReZXrL2cJfj2xx84mKAxMq2NASShHoRV8Hcyt47Us7B76o1jwOLhR8PfNuiq7T
	BzQzsJOL9qiA3wXkMEQ7GwIdrjLo8u07iTkx6vKUoCDn7UcV2uitv4VCasbbWRqaHnbQnzvL22Z9P
	x9w28X2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iaH-00000006K2C-0CSn;
	Tue, 15 Apr 2025 15:52:25 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iGW-00000006Fgg-1hLQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:32:01 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFVmvS056949
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 10:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744731108;
	bh=84YJu5c9njy1DU+TSe/AuT8a5aoDMIOsRFmJ0NwBPUU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Aq7R94WRVVt5BSQM4yY1HZDPFjafHU2ZePAtw1pKtuFJfJ+53sQ80/i8om0f+DFCg
	 4SrhAeTiHHTQUjbt/wfx7R1tmuUN0hd6vHv3DWD2SyZwWKOQpSt50bHpSIomm3Ff7R
	 shaZVL5Mm3Fq4kqFmzSGj2P18cLMHhHbMmNoF8R8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFVm2C109500
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 10:31:48 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 10:31:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 10:31:47 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FFVlZs109804;
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
Subject: [PATCH v7 02/11] arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F node
Date: Tue, 15 Apr 2025 10:31:38 -0500
Message-ID: <20250415153147.1844076-3-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415153147.1844076-1-jm@ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_083200_534644_EEF8AE22 
X-CRM114-Status: UNSURE (   9.53  )
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

AM62 SoC devices have a single core R5F processor in wakeup domain.
The R5F processor in wakeup domain is used as a device manager
for the SoC.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
index 9b8a1f85aa15c..6549b7efa6561 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
@@ -106,6 +106,31 @@ wkup_rti0: watchdog@2b000000 {
 		status = "reserved";
 	};
 
+	wkup_r5fss0: r5fss@78000000 {
+		compatible = "ti,am62-r5fss";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x78000000 0x00 0x78000000 0x8000>,
+			 <0x78100000 0x00 0x78100000 0x8000>;
+		power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+
+		wkup_r5fss0_core0: r5f@78000000 {
+			compatible = "ti,am62-r5f";
+			reg = <0x78000000 0x00008000>,
+			      <0x78100000 0x00008000>;
+			reg-names = "atcm", "btcm";
+			resets = <&k3_reset 121 1>;
+			firmware-name = "am62-wkup-r5f0_0-fw";
+			ti,atcm-enable = <1>;
+			ti,btcm-enable = <1>;
+			ti,loczrama = <1>;
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <121>;
+			ti,sci-proc-ids = <0x01 0xff>;
+		};
+	};
+
 	wkup_vtm0: temperature-sensor@b00000 {
 		compatible = "ti,j7200-vtm";
 		reg = <0x00 0xb00000 0x00 0x400>,
-- 
2.49.0


