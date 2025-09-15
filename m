Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85909CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6almVgiNrynY9wpP6mKsTPwVpjO+DNWdJWTwchN5JVA=; b=1FQkSvUeRewW5kwxbz80mogVWP
	ciMSCguRtSoBJRFx5QJ9Qi+9I85QPdy5zzOSPtKDKy/vXP9bRInG2Rz62Liv9HmISF4MMXggZrtXi
	fG5bCeDT7VlqQQNNQeAtyhSVKthPa438nfD/rSVVT9jcGNucNvN1zSp09SJ69JsJWS2nMbnStapLe
	ano18hC1DIh62QmC3SP72R1o56HXL27+26yQq2BdpptBlveqwZchhxoHtJqoF8CniuK8DAXVyz/fA
	XwKdS0emjdAVJiECqTBwUszmJQ9u77G1Uh9+7bk22Go57koIjHfGbvumlmdg259AdAJl2/wf8RaLJ
	Js3DeBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5IP-00000003OnT-0l8O;
	Mon, 15 Sep 2025 09:14:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5IM-00000003OlA-0NsL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757927685; x=1789463685;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=oQfosn2zhfeucMRo21AsBcaF4NJayEqqcVK99eNlv3Q=;
  b=yfmTZ+GCtWRq7+NiBWaYHtyvvnCUvlRyPTuQiUdhtssipimxx/SnsTYF
   3jro0iKRFgovV1i47cdKrPxujvbseHGG2qpfzx+q00arhXrYuIGhY2ABz
   Zmd0qiP/9aNCp2fuOOB7z9WfxmVRuYzAdaEil77xhQeomxgwEpGJ9bI8R
   LYci5OzPu9gq/tBR0dCWOvqeQ3WGTaMks5P3K4Dwkj2aM0UT9IhogRPQl
   sOH0B8ncSzzSRUM/psCHP9dyiVkaExxATvbhzRnr582kqH0KVkTpNXjdI
   bxS+PZjf88pJ5u4blX8PWc2seJ4aHNUtAwALbVrqw31YkITfKx5jBiUtu
   w==;
X-CSE-ConnectionGUID: tqZ4GQ/vQ0a7gKvyioyWTQ==
X-CSE-MsgGUID: yueklx7FSNKUzjdwWJszSQ==
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="213891748"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2025 02:14:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 02:14:05 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 15 Sep 2025 02:14:00 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Mon, 15 Sep 2025 14:43:57 +0530
Subject: [PATCH] ARM: dts: microchip: sam9x7: Add qspi controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250915-sam9x7-qspi-dtsi-v1-1-1cc9adba7573@microchip.com>
X-B4-Tracking: v=1; b=H4sIANTYx2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0NT3eLEXMsKc93C4oJM3ZSS4kzdRBMLExMjM7MkQ/MUJaC2gqLUtMw
 KsJHRsbW1AFznxiViAAAA
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757927640; l=1714;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=oQfosn2zhfeucMRo21AsBcaF4NJayEqqcVK99eNlv3Q=;
 b=NYixYiS+TI4iR/32pLdtnHSaO90FMDfIhQphSIsup9JZeqYuVvcOVQ4HJloezNJMWSIWKn/YG
 V/cPI3tieG8BmN4OsemoTkAxFVsn8EFDZGm90qTbgDFlsyngVVkki58
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_021446_408176_C8A5AA80 
X-CRM114-Status: UNSURE (   9.49  )
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

Add support for QSPI controller.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Driver and Doc support
https://lore.kernel.org/lkml/20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com/
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 66c07e642c3e..46dacbbd201d 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -271,6 +271,27 @@ AT91_XDMAC_DT_PERID(38))>,
 			status = "disabled";
 		};
 
+		qspi: spi@f0014000 {
+			compatible = "microchip,sam9x7-ospi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xf0014000 0x100>, <0x60000000 0x20000000>;
+			reg-names = "qspi_base", "qspi_mmap";
+			interrupts = <35 IRQ_TYPE_LEVEL_HIGH 7>;
+			dmas = <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				AT91_XDMAC_DT_PERID(26))>,
+				<&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				AT91_XDMAC_DT_PERID(27))>;
+			dma-names = "tx", "rx";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 35>, <&pmc PMC_TYPE_GCK 35>;
+			clock-names = "pclk", "gclk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 35>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_PLLADIV2>;
+			status = "disabled";
+		};
+
 		i2s: i2s@f001c000 {
 			compatible = "microchip,sam9x7-i2smcc", "microchip,sam9x60-i2smcc";
 			reg = <0xf001c000 0x100>;

---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250915-sam9x7-qspi-dtsi-a4844266b17d

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


