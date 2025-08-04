Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1E7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWEhLqfzUY/tnCWIAXzpD3iwUHvmcInhG83A8EpCn1I=; b=S4kwzkVSVEBEU9ZgzNFEpiLKNO
	fDMAMG2csKiYAb9djuidquJbJfJv92RrZGSOKEqyTUqmoNsVggSdoPP1fpGAZGRxuBKqC5F0sQEkE
	Baz8Q/9hLANlZNXLttgyQihGvLMT0eoFuyo7Eu88aNZ4lKNJ4s7q7BUiJH+l+lmIn+5avqv+S0YQA
	gjGWr6baYEWVDldo8INBIGFgOivBmhXY/E6Nu1Bn7ImdMEozb7YR9SCqXzbSk4CyGcFquAI4N6Umd
	iK0giC504b362SsXHgASNCCtnDJlmZb9pz5W5+YWkid/15XmFToLpGckqz6mor5GaIUGp8E0xtnIi
	VYhnnngA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisWJ-0000000ACBh-3ChG;
	Mon, 04 Aug 2025 10:34:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis33-0000000A921-172J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301845; x=1785837845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eG9AgnYvgMNCD21KCfB7uWMjojFHdvhPsM8eXGAz93w=;
  b=SxSVWbfjSPSdJaU/iHNvZkZyrbqN8s4uZmdyUwbezNNhtUJo0IpCVWVy
   zD5LGmsM/9R9+K/nAR2ctLYjdkjqrbXvkXAR59OQ1hTWqRZKEF1mQnn+l
   sBkjO9IN9Z/8OOQy0FVj0E3tDUJlC3KkbP21aCRDVgddm2GdYQSFI5+Jn
   h5aN0psHdN4sn9B8NuVNN/flaRhMbXGYKz0nTylgCYN57HJF26VS1Fbxo
   K1RAdXYRFlVOXX71QwBXdLrQ5XfD/kYt9ew374sq11Vql7zar0DX6Ab7B
   t743w0VsFMeoOtwh5owNuPlLoWN7b0WGmVLlJpwGFmLvQANvU1vtnEAcO
   Q==;
X-CSE-ConnectionGUID: +866aF0tQ+SVcfcIeqWRcg==
X-CSE-MsgGUID: nmkq1QdtRbeuIyLRexpjfA==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44245547"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:04:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:03:38 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:03:32 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 11/15] dt-bindings: microchip-otpc: document sama7d65
Date: Mon, 4 Aug 2025 15:32:15 +0530
Message-ID: <20250804100219.63325-12-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030405_365684_296050F5 
X-CRM114-Status: UNSURE (   8.17  )
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

Add microchip,sama7d65-otpc to DT bindings documentation.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 .../bindings/nvmem/microchip,sama7g5-otpc.yaml       | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index e9059dce85ef..43625c9d6af5 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -20,9 +20,15 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: microchip,sama7g5-otpc
-      - const: syscon
+    oneOf:
+      - items:
+          - const: microchip,sama7g5-otpc
+          - const: syscon
+      - items:
+          - enum:
+              - microchip,sama7d65-otpc
+          - const: microchip,sama7g5-otpc
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.34.1


