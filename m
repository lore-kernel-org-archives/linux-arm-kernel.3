Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DEBC02192
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 01:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfNRwzxWn/+WARN6HNDKXgKGg+ZHN4hL9TJorAidzAg=; b=4vQHDJbKyezOZwByP7YqHPCMvm
	IKXXtqxrQdWPO6/9ThIrZ8qO/T9zj7+lJY0uYqy/BICB1c5LXAQKaqinzcnEJl1NkdzCeozIlY+80
	T4ToMrjNOgf2wZRyh3CTBpZJGQlca6d1IR3FMjUF90gNWG9vAsJmf4hswfDlerMsVBN/ue/Gt/Z3s
	XNVsnWgAiLGgHj5TZ6qwKjP5WLDxt/3TAotvdLK3ex8t/U8MVRHMw2Je3KoqSv2BU3fQwB71EVRFk
	i7nLvrEQrYZZ+CLq52g1PHPD6NpjIxUTMoqDim9XVv6umHRTlFkyrwr5Uv7SdxLbjBn/MjDIbo2+G
	F+l9DnOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7j8-0000000H3sx-1Hez;
	Tue, 04 Feb 2025 01:27:46 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7YV-0000000H1XR-2f4l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 01:16:50 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5141GgxH2243641
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 19:16:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738631802;
	bh=qfNRwzxWn/+WARN6HNDKXgKGg+ZHN4hL9TJorAidzAg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lXklQ46Gd+4r+DzgOCqvEUZRcmVRvcxiL76fUu60PHoY9Z/CoKnnzbnihqYLlkdK0
	 n+Mg+RdAyQygcI2a3gxnQF8IPF7WFtZv4rYxH95tteHmvWovlsKNvUFQIcQ3brFxc+
	 mSyK9aacpijv5q6U6PBz5C3687DUcfUtWvY/gUkk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5141GgoM127295
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 19:16:42 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 19:16:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 19:16:41 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5141GfAQ024451;
	Mon, 3 Feb 2025 19:16:41 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>,
        Hari Nagalla
	<hnagalla@ti.com>
Subject: [PATCH v3 2/9] arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
Date: Mon, 3 Feb 2025 19:16:34 -0600
Message-ID: <20250204011641.1523561-3-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250204011641.1523561-1-jm@ti.com>
References: <20250204011641.1523561-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_171647_786500_8E7AD3BA 
X-CRM114-Status: UNSURE (   9.24  )
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
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v2:
- Fix whitespace issues
---
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index 0469c766b769e..e9042c986e68a 100644
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
@@ -175,4 +187,30 @@ mcu_mcan1: can@4e18000 {
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


