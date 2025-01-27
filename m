Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1548DC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 22:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAQJp8lyXwkwrv/bFJPOT1fYuvi5iOZkUWN9QAH0yks=; b=Omp50rwGDzh/hdrEVn5NQLZP6I
	iB0SPxAuWMc8l3BLlnqs6CpdfkzcJQW0SC+gERKOysRQ992YVOPG9lV5nqtHlSuFv15tYPseMhs8D
	TvfxBWOgiiuPuyOHzvfSFLMzWr1TWS1XPD+R/K756yeAopuatsbL0i3dleqIIZS602DFsYJ29Echg
	7zewicHk211aMoKQ/hyiTZ4R1b22EjI7GAN7xf7ESTR82zILCW+CD0I3/im948gfV7mncPpZPOE1m
	mPQIuYamilOpsUgLmyn5eJFoVwJCY9AZwFA8Lsd6HZ6ssg0XW8U7RpK71OsegwM2GTWO0yUTzy71O
	gF3w4zpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXQe-00000003NLv-33sg;
	Mon, 27 Jan 2025 22:18:00 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXPJ-00000003N8m-1JSw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 22:16:38 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50RMGVus1052867
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 16:16:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738016192;
	bh=aAQJp8lyXwkwrv/bFJPOT1fYuvi5iOZkUWN9QAH0yks=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fS84AOCSPkDaKrJnnrO+tGEHUzv4Pj/qL1P0TWUA8jmYtcQq2tfEY+Q/XztV7ho1V
	 J9iVcZ2chYU1xrLv8Co1FPUiJOCvUm9lKiHoOspEHfF4pBVmEJZF9wrO0dB8KXsfkD
	 kytdJjDCMmVtKn1lnTKIwiHFamc0cE5MrDRugL9o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50RMGVjv070988
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2025 16:16:31 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Jan 2025 16:16:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Jan 2025 16:16:31 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50RMGVEI098068;
	Mon, 27 Jan 2025 16:16:31 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Devarsh Thakkar
	<devarsht@ti.com>,
        Hari Nagalla <hnagalla@ti.com>
Subject: [PATCH 2/4] arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
Date: Mon, 27 Jan 2025 16:16:29 -0600
Message-ID: <20250127221631.3974583-3-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250127221631.3974583-1-jm@ti.com>
References: <20250127221631.3974583-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_141637_440403_CFB43C3F 
X-CRM114-Status: UNSURE (   9.69  )
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

AM62A SoCs have a single R5F core in the MCU voltage domain. The MCU
domain also has a 512KB sram memory, the R5F core can use for
applications needing fast memory access.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
[Judith: Fix commit message header]
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index 0469c766b769e..9a20f75e48063 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
@@ -6,6 +6,18 @@
  */
 
 &cbass_mcu {
+	mcu_ram: sram@79100000 {
+		compatible = "mmio-sram";
+		reg = <0x00 0x79100000 0x00 0x80000>;
+		ranges = <0x00 0x00 0x79100000 0x80000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		mcu1-sram@0 {
+			reg = <0x0 0x80000>;
+		};
+	};
+
 	mcu_pmx0: pinctrl@4084000 {
 		compatible = "pinctrl-single";
 		reg = <0x00 0x04084000 0x00 0x88>;
@@ -175,4 +187,28 @@ mcu_mcan1: can@4e18000 {
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
+		mcu_r5fss0_core0: r5f@79000000 {
+			compatible = "ti,am62-r5f";
+			reg = <0x79000000 0x00008000>,
+				<0x79020000 0x00008000>;
+			reg-names = "atcm", "btcm";
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <9>;
+			ti,sci-proc-ids = <0x03 0xff>;
+			resets = <&k3_reset 9 1>;
+			firmware-name = "am62a-mcu-r5f0_0-fw";
+			ti,atcm-enable = <0>;
+			ti,btcm-enable = <1>;
+			ti,loczrama = <0>;
+			sram = <&mcu_ram>;
+		};
+	};
 };
-- 
2.48.0


