Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2EBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 06:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne9hcF58qKX5z0h7aYVu1YWFoSx2QyASdoSBJ5sodaI=; b=P6nvKwIqlFUMtNgUxu/nDQYXnU
	6VS668X22ill9Dnj4BEGrs8eEz/QOZPZsTv/fM2fezaQBs8MAH4BKXyc9pHFFlivDsHmhmSk567Tf
	NGVBMOQQ2+gp2tGu2dxSwp2ghBonTMbYZwNcsoP54bopMeVQKaatR0E5178FCSVejdZTTnFUVfJby
	3ShB6xx16iJO3sj/EHse9uqP8GJAwYyCHFn8WM0cFattLK3ebViyEw3BWz5Mq4AOVzTGi+Nvy0MKG
	oMoEsMs02CDFwyRVbd5JFoW4y0TSh/B6A2P1bm4gmHZy91RFuliJdb9QwUtPXTRB75eSvfT0AFRAB
	394sKcBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u774p-00000005wt3-333D;
	Tue, 22 Apr 2025 06:25:52 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u76uF-00000005vV0-3vIm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:14:57 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202504220614529c048987fee2499089
        for <linux-arm-kernel@lists.infradead.org>;
        Tue, 22 Apr 2025 08:14:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ne9hcF58qKX5z0h7aYVu1YWFoSx2QyASdoSBJ5sodaI=;
 b=ONpcmZrTAJpd/bi0OKObTPN2ajj1XonEo+3u5LraYJiyQmMSOLBUc3uBPY3qY4oMT9CC1m
 FpyM44J92TUFE2LXDH6k2qyUCYki0TTx6kFKYmLZ5ehN2mSuZp7OTxMVarOpY/qdzATUX/Kl
 0xr460K7HJC+poCfoa/CZPhHxq03dJg8lRlLJdU7t4XdbGFR1E6Mg0QL6ykI3QmmH0XwNIYx
 bY9c0vLcRKMq5FModYecLAeMCQdqg5MSzcNcm5WBApHiSAmXg0+CcOS04PWjKRGMUFOsLUg9
 PSlL+O69pGFajNnB0fME5mr1dLN+5Eo2/YTfXsdBjmI9q0Pf4WKsvrGA==;
From: huaqian.li@siemens.com
To: helgaas@kernel.org
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
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
	s-vadapalli@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com
Subject: [PATCH v8 5/7] arm64: dts: ti: k3-am65-main: Add PVU nodes
Date: Tue, 22 Apr 2025 14:14:04 +0800
Message-Id: <20250422061406.112539-6-huaqian.li@siemens.com>
In-Reply-To: <20250422061406.112539-1-huaqian.li@siemens.com>
References: <aa3c8d033480801250b3fb0be29adda4a2c31f9e.camel@siemens.com>
 <20250422061406.112539-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_231456_112975_5035191D 
X-CRM114-Status: UNSURE (   8.13  )
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
index 94a812a1355b..977c66a3a7c7 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -841,6 +841,26 @@ main_cpts_mux: refclk-mux {
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


