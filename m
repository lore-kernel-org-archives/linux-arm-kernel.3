Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B79C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpXZvA3uuPXkuu3DljhIQTB0F4kEzq3HX2LtKvFVjrk=; b=BJB34h65Zvn7SVm8OVq2FmqQh2
	cOC5f51vyaq0hORAWRBwIrJzU7Ll5nfo34ihOFkALZs+RgXaVzJ73HEreprnOpK0++aQQ58xDs06X
	NGLz0EYIdCSqRGwWCHbO8SFHmg7pPKj4O5LR8bhThaowZTk2p5WO2G3ARYnWNGojhKen82qKVu6ZL
	ANDk8HpFPtnlSDENGvOpo+gFArAfl/ghIXf0i9yZgMjAfM4eKyobTof+7BixfyTOFvzdXZufTVqSE
	Jxs+vTxFcQidIP5/wXDE9bfWFMggWHhj93WFedQuHpkaG5+E5ONBur5yaoA9BfrvNR6m3iIgwfHbD
	LBN19ovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti90K-00000006ldI-2LOx;
	Wed, 12 Feb 2025 09:26:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8xV-00000006l1s-0Dce;
	Wed, 12 Feb 2025 09:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739352184; x=1770888184;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=FtpQPQxXyCZvQj8wWOr7b4bemvo3SmchpItYo+CBY98=;
  b=Jm8O5mvu3+gweycPs4OP//uf1SFdUTLjQUnBgL9yJV+as37MtT77hMuP
   ZHT3iteha6Bm/3+hib0x/HIWg7y1zr8XzUNyWkaAOwdCHpLjblyfj6sbJ
   5eXntyXfkNCyOCFAPUtlIhx8JDsuit1v7aNUtPEEzglfnmjfJbRiPMWD2
   LosmQkN45Bep12bMGGmiriKC3wounkOsn0NwLdy5hyG3q2eRWuwYYM9k+
   nXLCyP3VtCoktaWwvo63hqN7vgTx7t3QWAxktDywIWdkGpvEw0rY8RZBy
   x2sMJ16zQ3BhSDKvCLOSYOOrDpRPOSo8wdTMKN88tTwul+DdrI+rrDrDz
   g==;
X-CSE-ConnectionGUID: Im7caqcMRgeiMBKdbNTopA==
X-CSE-MsgGUID: l+jiiei1QIuIv8w+HO/aMQ==
X-IronPort-AV: E=Sophos;i="6.13,279,1732604400"; 
   d="scan'208";a="37190267"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Feb 2025 02:23:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 12 Feb 2025 02:22:28 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 12 Feb 2025 02:22:23 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 12 Feb 2025 14:52:10 +0530
Subject: [PATCH v3 1/2] dt-bindings: mmc: mmc-slot: Make compatible
 property optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250212-mmc-slot-v3-1-2bf288207040@microchip.com>
References: <20250212-mmc-slot-v3-0-2bf288207040@microchip.com>
In-Reply-To: <20250212-mmc-slot-v3-0-2bf288207040@microchip.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739352136; l=1618;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=FtpQPQxXyCZvQj8wWOr7b4bemvo3SmchpItYo+CBY98=;
 b=M64rEr7kRrwyX1QrNxdiw1/HiMyCZ3zWX9Itfkk3bZ0NS4jWaGzoU66nc3FzpEfGrrHAZHv8B
 dxEMCnnyyXUCJzRL9cUKBiizPwamPTbLVI9G7d47b+L/8rD5n0IpLEy
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_012305_351715_7970955E 
X-CRM114-Status: GOOD (  10.11  )
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

The compatible property is required for some vendor-specific device trees, such
as Amlogic's meson-mx-sdio, but is unnecessary for others, like Microchip's
DTS. To resolve unintended warnings for configurations that do not require it,
remove compatible from the required properties in mmc-slot.yaml.

Since meson-mx-sdio still requires compatible, explicitly add it to its
required list in amlogic,meson-mx-sdio.yaml.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml | 3 +++
 Documentation/devicetree/bindings/mmc/mmc-slot.yaml              | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
index 022682a977c6..0d4d9ca6a8d9 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
@@ -60,6 +60,9 @@ patternProperties:
       bus-width:
         enum: [1, 4]
 
+    required:
+      - compatible
+
     unevaluatedProperties: false
 
 required:
diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
index 1f0667828063..ca3d0114bfc6 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
@@ -29,7 +29,6 @@ properties:
     maxItems: 1
 
 required:
-  - compatible
   - reg
 
 unevaluatedProperties: false

-- 
2.43.0


