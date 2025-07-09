Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778D8C83F19
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 23:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieWThEMAjC1kkWBufnewbQMKpVwyrb/YlxHe6w5rs5g=; b=kqjX3k7vGL6OtFLMHqn7rqeQm7
	k8DnOE3HJr7L8hF7G5UGRzYU6Lbmdp0KYznuRDLzmDByjZc+IINdnddXVxSFsZhHhLlEf8O55OnKv
	3uV8pz/f1xbSZyuRC8MNw3cfFt+QcM49Xxn0B9rqodh6fUzlWCPcyl8MFAenOa+hDkfawrgKsRj0s
	7cnR1VtyP0foj2H4m5rW/1aDk2wkOJjRXW1R6o99c5GZXTm9Tgf+T+x+dmr/eGKSE2yqYcILsqoxu
	3+OIEIHIJKBkbY8zuqo4sZcDkKtTILTTnHd5Cx+vl0mZA+GjoZzE3K5ITBqtHwi5bGqfcYKaZnSMa
	5d/PBFiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZegt-0000000AHUx-3szQ;
	Wed, 09 Jul 2025 23:59:07 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdON-0000000A6Cl-2iNr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 22:35:56 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569MZoxU1569128;
	Wed, 9 Jul 2025 17:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752100551;
	bh=ieWThEMAjC1kkWBufnewbQMKpVwyrb/YlxHe6w5rs5g=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=aHQZn5YrvDk6zXI/Dlvyw3Sv8QMHXCeyzInI2DWZPb1+u6US0u5Ai+mJwDrnXZlqg
	 NHYJ5H6wmCtFVUjL38niqVgijlq3pRLlDi6AXvlg27ISdQhW5E3LB+6r/YtrPZZZXs
	 AL+LV1aQlrKbVs8iqiPWea9vR8pHYNPE7twvvCsY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569MZogW568838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 17:35:50 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 17:35:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 17:35:50 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569MZoU3520527;
	Wed, 9 Jul 2025 17:35:50 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Wed, 9 Jul 2025 17:35:43 -0500
Subject: [PATCH 1/2] arm64: dts: ti: k3-am65: add boot phase tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-65-boot-phases-v1-1-e1f89d97a931@ti.com>
References: <20250709-65-boot-phases-v1-0-e1f89d97a931@ti.com>
In-Reply-To: <20250709-65-boot-phases-v1-0-e1f89d97a931@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_153555_786458_E8263C12 
X-CRM114-Status: GOOD (  12.31  )
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

The 'bootph-all' tag was added to the dt-schema to describe the various
nodes used during the different phases of bootup with DT. Add the
bootph-all tag to all required nodes for all AM65x platforms.

Mark the mailbox and ring accelerators needed to communicate the with
various vendor firmware and the power, clock and reset nodes along with
the MMR for the chip-id to facilitate detecting the SoC and which
silicon version during the early stages of bootup with 'bootph-all' as
they are used during all phases of bootup

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi   | 1 +
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi    | 2 ++
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index b085e736111660ed0dad5f127ef0c3d79c52fe1d..61c11dc92d9c27fc9e47123698c17118cd522be1 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -655,6 +655,7 @@ secure_proxy_main: mailbox@32c00000 {
 			      <0x00 0x32800000 0x00 0x100000>;
 			interrupt-names = "rx_011";
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			bootph-all;
 		};
 
 		hwspinlock: spinlock@30e00000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
index 7cf1f646500a16c1d1bac6dfb37fb285218063b3..5bbd817bc51464f6605c5b2dc9cb544a109a695d 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
@@ -211,6 +211,7 @@ mcu_ringacc: ringacc@2b800000 {
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <195>;
 			msi-parent = <&inta_main_udmass>;
+			bootph-all;
 		};
 
 		mcu_udmap: dma-controller@285c0000 {
@@ -235,6 +236,7 @@ mcu_udmap: dma-controller@285c0000 {
 			ti,sci-rm-range-rchan = <0xb>, /* RX_HCHAN */
 						<0xa>; /* RX_CHAN */
 			ti,sci-rm-range-rflow = <0x0>; /* GP RFLOW */
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
index eee072e44a42f5f66423200975016447d22bdc46..d62a0be767c814706e146bcf95ee4ff84461a515 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -21,16 +21,19 @@ dmsc: system-controller@44083000 {
 		k3_pds: power-controller {
 			compatible = "ti,sci-pm-domain";
 			#power-domain-cells = <2>;
+			bootph-all;
 		};
 
 		k3_clks: clock-controller {
 			compatible = "ti,k2g-sci-clk";
 			#clock-cells = <2>;
+			bootph-all;
 		};
 
 		k3_reset: reset-controller {
 			compatible = "ti,sci-reset";
 			#reset-cells = <2>;
+			bootph-all;
 		};
 	};
 
@@ -43,6 +46,7 @@ wkup_conf: bus@43000000 {
 		chipid: chipid@14 {
 			compatible = "ti,am654-chipid";
 			reg = <0x14 0x4>;
+			bootph-all;
 		};
 	};
 
@@ -107,5 +111,6 @@ wkup_vtm0: temperature-sensor@42050000 {
 		reg = <0x42050000 0x25c>;
 		power-domains = <&k3_pds 80 TI_SCI_PD_EXCLUSIVE>;
 		#thermal-sensor-cells = <1>;
+		bootph-all;
 	};
 };

-- 
2.49.0


