Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA34C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzWaCHnho2bMyMzPaPLKOwqgDp5H9X/Keu6ZixtPxUE=; b=ukiktQm/wVkX8TCeQOaPzWr9jZ
	hOA8Fsx31YwtOyTxHesmAL9KMxP0fn1dU43zHScQF2kCkAZ2Kepl9PseQ+mOL+zSt8Dme4IZOZV14
	KB2fufqSD6e7+xlj3usrPDLYpUwbzacjZ6a0gwYdtezBD3XR2aCfDPVXRdUmbGIGg2pWPYdYGVlN+
	yNFtUCg5gMoo7czs1d3VFjeclRbHahLYTM/iUHbl6lTEdpahnTiQpXFi/BmSKSacv+rtPYMD9DGzd
	6GpaOVfi0ZT6bQh8+NDi+YML+FgWZFFNF/Oxz7EciBAek5hBh2mYKvEZuO1roRnoDa0/WEvsBwxCa
	AkNsoxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFa-0000000346h-3QE4;
	Mon, 14 Jul 2025 18:50:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMAx-00000002qj0-2ayC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 16:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752511031; x=1784047031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tTBbCPNjh3kndWKdQLLOC9WO7P6uncnMXrl9fKN6diI=;
  b=M0dD65X53D7YKq5Z5hKnxOaSv0TwsmDAsoNQGOJBMSaxmYuP2O3HOVUW
   wGguN8SR0/oxcU49PddK2bsAbThHFlFRvqUCTtkOjrZKy1ygRAgtEuI0r
   XyXtQ8u1EXyp+TGtE616ZznSeZVscsOjvz7zVaVeAGWysKq6Dns+OR/CB
   olKD6KZ596ubltWrh1hHnpLVQNYagF7OfWqhA4RB+okD0uQkFvXOamNy4
   f/7MBaki6CJJsfP0whFcZbq5sqiCHB2oKgRJXapWOrr1R5rvrCmOx4GDz
   JvGxwIThFjU5ge8g9oMDlyjCsv84PZuMPsAaAww/aNULGFzeXoMWw1/LR
   A==;
X-CSE-ConnectionGUID: hBq1ljEWSkqL674rDMJkcA==
X-CSE-MsgGUID: ImMng/ZlRaCQ7+lJv5BLcQ==
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="211399321"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jul 2025 09:37:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Jul 2025 09:36:28 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Jul 2025 09:36:28 -0700
From: <Ryan.Wanner@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v2 1/5] dt-bindings: net: cdns,macb: Add external REFCLK property
Date: Mon, 14 Jul 2025 09:36:59 -0700
Message-ID: <d558467c4d5b27fb3135ffdead800b14cd9c6c0a.1752510727.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752510727.git.Ryan.Wanner@microchip.com>
References: <cover.1752510727.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_093711_900173_29E9290B 
X-CRM114-Status: GOOD (  10.17  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

REFCLK can be provided by an external source so this should be exposed
by a DT property. The REFCLK is used for RMII and in some SoCs that use
this driver the RGMII 125MHz clk can also be provided by an external
source.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/net/cdns,macb.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index 8d69846b2e09..e69f60c37793 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -114,6 +114,13 @@ properties:
   power-domains:
     maxItems: 1
 
+  cdns,refclk-ext:
+    type: boolean
+    description:
+      This selects if the REFCLK for RMII is provided by an external source.
+      For RGMII mode this selects if the 125MHz REF clock is provided by an external
+      source.
+
   cdns,rx-watermark:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.43.0


