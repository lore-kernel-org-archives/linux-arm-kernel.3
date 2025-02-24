Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA6FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 02:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ry4SDpGlDRJBZD+IEFl+0xYkx9uILbFklQbzPOASlmU=; b=Ji+BsGs784A4eeiB7qD2u9CHvS
	05xwUzQQIVYT4ldMbt/tqEVgQghomLSvzXVfNBzbvCne1ceks369DwAMBmrukZq4zi2oepcQ8KrvE
	6BdlrAGAmEZdGB21b0Xq0nK/ZELdlTUO6sj6a5mo4HKVhA6YhLcfl/SrdthycPbNvvKDve5mzqvCy
	3uVwILosNWNQwUHLMoa/HWj1h0PWywBL50EqOTUES0Spr0rhboDyS2DBoQJyJ1lpHaFdl3Y5tW+xx
	rm6xQ4RK/i6iqzL2SUOYDdAGsD7DqWkWi43PzPbymEzlVJbm/MD08ZTl1xjRXoTmyFM8lo9Zr4Wir
	Yf0taFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmOc8-0000000CBx1-30e3;
	Mon, 24 Feb 2025 02:54:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmOaZ-0000000CBkB-3aCq;
	Mon, 24 Feb 2025 02:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740365579; x=1771901579;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=J9123hZZrTlIOXBBpLmo8l+k5NrzmEjd/ByKPLqak5s=;
  b=c75FApAVcrBQLH1C1u1ZCbCsWC00C64+9P870MMcF9OuSBgEnsDt5moB
   qwmFJCFe7IZHGvFWrXrCltIK5CXoszqqPb+zWeSOZ2mf9pqlxJzySuwS2
   ps0p/HGNv7VpdBBl+IASyLKz/cwsvyhM8MMm07Yk5I68APgtRrdrCak6D
   xhMqFGN+3ARKmUGJ+g8pqBkHZFfwjcC3h+yVlawsdPXgW8d7FRkFu55k3
   6eaZvJ66ORTG6HivaV3EgtH+JPn+WLzsauoVXeB5KQ7H1YtNFd3V6Y1dw
   COfODN8UTOK874iBCGfjaWsehCkFIhQdcYnLtJWD7Gce9O7sBhBREuR8N
   A==;
X-CSE-ConnectionGUID: 6rVg96LVQkmrqYQWG6Firw==
X-CSE-MsgGUID: 1zih4FZmSx+QgG3aHGhnsA==
X-IronPort-AV: E=Sophos;i="6.13,309,1732604400"; 
   d="scan'208";a="42149827"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Feb 2025 19:52:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 23 Feb 2025 19:52:40 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 23 Feb 2025 19:52:35 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Mon, 24 Feb 2025 08:22:27 +0530
Subject: [PATCH v4 1/2] dt-bindings: mmc: mmc-slot: Make compatible
 property optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250224-mmc-slot-v4-1-231620a31e88@microchip.com>
References: <20250224-mmc-slot-v4-0-231620a31e88@microchip.com>
In-Reply-To: <20250224-mmc-slot-v4-0-231620a31e88@microchip.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740365548; l=1669;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=J9123hZZrTlIOXBBpLmo8l+k5NrzmEjd/ByKPLqak5s=;
 b=iDQoQc5oZ8QR9avJPK5QkY2uuNY3zyCIOqDnd0geowgfmnyOkIzbvtD2WwO1bpiOqrNyHdy6+
 FGdvWNIhq7LB1aK78lpkwa21FvcUe+3Z/3M9DeOVdjaWKx4mtFRlxWz
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_185300_086046_9B93E713 
X-CRM114-Status: UNSURE (   9.31  )
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

The compatible property is required for some vendor-specific device trees,
such as Amlogic's meson-mx-sdio, but is unnecessary for others, like
Microchip's DTS. To resolve unintended warnings for configurations that do
not require it, remove compatible from the required properties in
mmc-slot.yaml.

Since meson-mx-sdio still requires compatible, explicitly add it to its
required list in amlogic,meson-mx-sdio.yaml.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


