Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B613C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 03:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/BKbhuL0vKp+y2KpfAqEHa8O7EtSQwyOm6GZvSm+1w=; b=JpblxrKeSL90rSLVZlTHiR03gu
	CD697OPR7WDNo+WocqeQlEZNmkXb30fKMxqqXS2EVNkCsGKBv0HRxUUZPNhZVcGYYtjcWBPG/a8Gj
	hQQEH1UoJr41h3LYw1fMFyHoAfN4DVSbC+H4cWI0XWBV0mF32ePdf1svSUAeMhwQelz6Ryd2pP9kU
	Mzb0PoFv4ku6zNJl/Kvh/Wqj5ZfgEW6WarDRX+ZH/G6LhW7aItxy/Gq83jxWEqoYVqgXj3pnQO3ef
	l2G8zjYIdrxprZGyeRptkoPDJwrDqMP5lzzIjE5UboCuGrrq4GrxefyG1gKvIWc6uLZ0+ZGVn3+9E
	4gti7rIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udh7d-0000000G5L1-2YAB;
	Mon, 21 Jul 2025 03:23:25 +0000
Received: from mta-65-228.siemens.flowmailer.net ([185.136.65.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udglt-0000000G2qe-0fcz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 03:00:58 +0000
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250721030053871417abe5920d1a50
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 21 Jul 2025 05:00:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=q/BKbhuL0vKp+y2KpfAqEHa8O7EtSQwyOm6GZvSm+1w=;
 b=CvkXuMS+U9++KsW6UQFzd1r2SC8DHb9CVpVvqqDrzQiYEyB22sWIaHexUAEsxV3pqPSVnK
 Esbui3nybGHrKrEdIPor1ebTxpwr08yW67U/xtrJZnxGi1yhTug0Jv/HCoaAm1cD52Vg9gmW
 is9fGGD83kcVN5hCdRm5+5risKQroKh0VCGHphprxG/olP4+elmAy0Ldtmw1DCFd1iHvjatg
 FPjypANuey2hmIS749s+P2UwU/3FY7WFC2I/nOnDRgI9mmyL2fAvOa+u097v5XR2vh2V9TuX
 MPZJbVRGLqqU7B47Oep70LwPK3RdWuCoIta9YFI/0FyVI9Y3PcOL3h6A==;
From: huaqian.li@siemens.com
To: s-vadapalli@ti.com
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	helgaas@kernel.org,
	huaqian.li@siemens.com,
	jan.kiszka@siemens.com,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	nm@ti.com,
	robh@kernel.org,
	ssantosh@kernel.org,
	vigneshr@ti.com
Subject: [PATCH v10 5/7] arm64: dts: ti: k3-am65-main: Add PVU nodes
Date: Mon, 21 Jul 2025 10:59:43 +0800
Message-Id: <20250721025945.204422-6-huaqian.li@siemens.com>
In-Reply-To: <20250721025945.204422-1-huaqian.li@siemens.com>
References: <20250721025945.204422-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_200057_329073_30EBFDAF 
X-CRM114-Status: UNSURE (   8.12  )
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Add nodes for the two PVUs of the AM65. Keep them disabled, though,
because the board has to additionally define DMA pools and the devices
to be isolated.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index b085e7361116..be65e6aa7b80 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -843,6 +843,26 @@ main_cpts_mux: refclk-mux {
 				assigned-clock-parents = <&k3_clks 118 5>;
 			};
 		};
+
+		ti_pvu0: iommu@30f80000 {
+			compatible = "ti,am654-pvu";
+			reg = <0 0x30f80000 0 0x1000>,
+			<0 0x36000000 0 0x100000>;
+			reg-names = "cfg", "tlbif";
+			interrupts-extended = <&intr_main_navss 390>;
+			interrupt-names = "pvu";
+			status = "disabled";
+		};
+
+		ti_pvu1: iommu@30f81000 {
+			compatible = "ti,am654-pvu";
+			reg = <0 0x30f81000 0 0x1000>,
+			<0 0x36100000 0 0x100000>;
+			reg-names = "cfg", "tlbif";
+			interrupts-extended = <&intr_main_navss 389>;
+			interrupt-names = "pvu";
+			status = "disabled";
+		};
 	};
 
 	main_gpio0: gpio@600000 {
-- 
2.34.1


