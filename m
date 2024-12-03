Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B83E74AC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duiFeAaSBhIytnaxrND6nGOkl5Gph0V28FDpDxMvpzI=; b=jE8sFVXAoN8COtXti6saEbS2XY
	E3Lpfg4W3KE5N4yLmwGZHqYIvBIxZSWrkaeBSglc2AH0xnk5BmH/ZwymSKjzGqLKQVvybEgEBP8mw
	D4Jl/A6Z8Rc0gcHznH0fo28W4RX3/lV0SPXWg2uO+ez+pgOzjAijj5U5asPyM8jh++ZnUFjM6hoBs
	f9I7vkl1ydbyw61aLWMQMM2ZFldYiwptwr+7TCjB8lLpEDi4rbHti1F/y4mm4AFmaqZvhEUxPUuZK
	qJ0HzxD/XDQE5rqjGoXXUjpEqzWVoW7D5EYXsk6BvWiq+8y4ZSCra9/zS+RTxAHRP0sGXTszyoXY3
	VrHvWZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWxj-0000000AHxR-3Eus;
	Tue, 03 Dec 2024 17:45:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWts-0000000AH9N-2Ril
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Dec 2024 17:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=duiFeAaSBhIytnaxrND6nGOkl5Gph0V28FDpDxMvpzI=; b=cMW9eiVM7YNZxbIAbtaJseYpPh
	SjbhL00YKmsspf0S6DRxgkp+apYOC01ZDZnc67eItOEXfovPN4rjqz29Wyqo3Pb8l6zs6/b7AFKx9
	zlfsiKpdk9/+Q+Pe53Uy3XZvpmTuK8/1l1mwOpKiZWeTRvPI5hty7BlESYKNHmOiGqb7cC1BRQOLu
	a4MAraeoK0InhHe83nOtDYDj1dQj2wLRDOwG5qqVbVGceBKwGTUSd50bTVMdmQTvnfrWbn+zfG/hj
	EufxkQXApkTvn5a4zq8pOUIXXPNUoNqQN96EJbB0PMDPjK9Q/UuhZn87M1WRfgosAI5usJ0N/rVf3
	QKyANCoQ==;
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWtp-00000002RBi-1tZ6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 17:41:27 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B3HfG1t124426;
	Tue, 3 Dec 2024 11:41:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733247676;
	bh=duiFeAaSBhIytnaxrND6nGOkl5Gph0V28FDpDxMvpzI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NJxEB3RsRDV0Uy2dnrLl/5hl5dmxtFHw1dAYwQHBGyG5ju18HqbnrkJTzNxB+SZ4d
	 SJ3mIUy9k0eplP2aZKtm3uC2HU+LdfPhufL9gyKivNqo+zchnQ0bNU1iVau5oN0Lbm
	 6zFOegEPj16UfubJ/v2m0HSn7q3O48BspOObQuRM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3HfGgR001712
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Dec 2024 11:41:16 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 11:41:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 11:41:16 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3HfF8K076485;
	Tue, 3 Dec 2024 11:41:15 -0600
From: Andrew Davis <afd@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert
 Nelson <robertcnelson@beagleboard.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am67a-beagley-ai: Add remote processor nodes
Date: Tue, 3 Dec 2024 11:41:14 -0600
Message-ID: <20241203174114.94751-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241203174114.94751-1-afd@ti.com>
References: <20241203174114.94751-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_174125_885181_6EE03D5E 
X-CRM114-Status: GOOD (  10.87  )
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

Add nodes for the R5F and C7x cores on the SoC. This includes the mailbox
and memory carveouts used by these remote cores.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 158 ++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 44dfbdf892775..9be6bba28c26f 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -50,11 +50,71 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa0000000 0x00 0x100000>;
+			no-map;
+		};
+
 		wkup_r5fss0_core0_memory_region: r5f-memory@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@a1000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa1000000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@a1100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa1100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		main_r5fss0_core0_dma_memory_region: main-r5fss-dma-memory-region@a2000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa2000000 0x00 0x100000>;
+			no-map;
+		};
+
+		main_r5fss0_core0_memory_region: main-r5fss-memory-region@a2100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa2100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		c7x_0_dma_memory_region: c7x-dma-memory@a3000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa3000000 0x00 0x100000>;
+			no-map;
+		};
+
+		c7x_0_memory_region: c7x-memory@a3100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa3100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		c7x_1_dma_memory_region: c7x-dma-memory@a4000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa4000000 0x00 0x100000>;
+			no-map;
+		};
+
+		c7x_1_memory_region: c7x-memory@a4100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa4100000 0x00 0xf00000>;
+			no-map;
+		};
+
+		rtos_ipc_memory_region: ipc-memories@a5000000 {
+			reg = <0x00 0xa5000000 0x00 0x1c00000>;
+			alignment = <0x1000>;
+			no-map;
+		};
 	};
 
 	vsys_5v0: regulator-1 {
@@ -391,3 +451,101 @@ &sdhci1 {
 	ti,fails-without-test-cd;
 	status = "okay";
 };
+
+&mailbox0_cluster0 {
+	status = "okay";
+
+	mbox_wkup_r5_0: mbox-wkup-r5-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&mailbox0_cluster1 {
+	status = "okay";
+
+	mbox_mcu_r5_0: mbox-mcu-r5-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&mailbox0_cluster2 {
+	status = "okay";
+
+	mbox_c7x_0: mbox-c7x-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&mailbox0_cluster3 {
+	status = "okay";
+
+	mbox_main_r5_0: mbox-main-r5-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+
+	mbox_c7x_1: mbox-c7x-1 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
+};
+
+/* Timers are used by Remoteproc firmware */
+&main_timer0 {
+	status = "reserved";
+};
+
+&main_timer1 {
+	status = "reserved";
+};
+
+&main_timer2 {
+	status = "reserved";
+};
+
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0 &mbox_wkup_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+};
+
+&mcu_r5fss0 {
+	status = "okay";
+};
+
+&mcu_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>;
+};
+
+&main_r5fss0 {
+	status = "okay";
+};
+
+&main_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster3 &mbox_main_r5_0>;
+	memory-region = <&main_r5fss0_core0_dma_memory_region>,
+			<&main_r5fss0_core0_memory_region>;
+};
+
+&c7x_0 {
+	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>;
+	memory-region = <&c7x_0_dma_memory_region>,
+			<&c7x_0_memory_region>;
+	status = "okay";
+};
+
+&c7x_1 {
+	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>;
+	memory-region = <&c7x_1_dma_memory_region>,
+			<&c7x_1_memory_region>;
+	status = "okay";
+};
-- 
2.39.2


