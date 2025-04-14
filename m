Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA5AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 21:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dmFB76YnpMfJqA5Zs1zWgJHzMCeCVLrre2rzYv3SAY=; b=yVIgoz+zlU6HO+w+s37XuYDWQF
	pc4a2tqufd3ybwRiMmvMl8CFMiHjNPmW8Xr9GoCszUf37THPk0evYFljuoEHjmrT/GTBImiyIFMPH
	bCByv1+FnwTvT9LJ+vNJ4QSAHsiZMFXnWRAGnExWlGdsroeszNLjGJlp9Svba7Gj9Fgd2aRfSuhIn
	yTERGvyBWVYICex/n3Pgp6Aod1QbA4B3HSqiWDX+++J/kMWGSj94WgEjLDJ3z4EikszeiVR3FOvMb
	m0EEtVLnqbXz3b1LFb2UlCdCc+Z5EvmFRLruwudBDWgPrGhA0H2a7RzKajQygyc3XDNltJQGeNYT2
	dnXkdh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Rjb-00000003d0L-2LRJ;
	Mon, 14 Apr 2025 21:52:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RZ1-00000003afD-4Bjg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 21:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1744666919; x=1776202919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QtZL9N8JnzdiSxrQgqOdrgyJiMS1ffqau28eqfXsCas=;
  b=mNSg9rVrX69t7hX4dn5+wKX26C42nmWDdtHnf/LwBMuzU2irLf3GUoA9
   b5LxegupppJrJlIxiPMVI1curqDVSB2LqAI8KZqbUwNAzSzt4PumG8G8V
   mzr2/HKKfPNyJO+nOYO69E/xfgtx3PsQSyRburmzhmx3d3r398EdM91Ja
   Qik1EVmrELqwYTsiJWv8a/wMB5MNkYg1lHafFqEtxh30CEDzvgpoLJLQd
   zKtZztEA1sOfToHEj+WCooqpKTB2qpe3ua7r1cLJfwdKbPziu7DgDIaxg
   6alPMCOPuStoXerPr72G79i6Go/fYDtVVzf4/qUCiF6oF6DIWoZk1w8Os
   A==;
X-CSE-ConnectionGUID: jf75aQsXSneWELgtntpGWQ==
X-CSE-MsgGUID: qCFiSR9fQOSj57WZGaEazQ==
X-IronPort-AV: E=Sophos;i="6.15,212,1739862000"; 
   d="scan'208";a="40006670"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2025 14:41:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Apr 2025 14:41:05 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Apr 2025 14:41:05 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 03/11] dt-bindings: reset: atmel,at91sam9260-reset: add microchip,sama7d65-rstc
Date: Mon, 14 Apr 2025 14:41:20 -0700
Message-ID: <b2bf907cebc2e251f6d8bebade864372e3dbc1eb.1744666011.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_144200_124719_C630282E 
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add SAMA7D65 RSTC compatible to DT bindings documentation. The
sama7d65-rstc is compatible with the sama7g5-rstc.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/reset/atmel,at91sam9260-reset.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
index 98465d26949e..a2ab7f8a11f8 100644
--- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
@@ -23,6 +23,9 @@ properties:
               - atmel,sama5d3-rstc
               - microchip,sam9x60-rstc
               - microchip,sama7g5-rstc
+      - items:
+          - const: microchip,sama7d65-rstc
+          - const: microchip,sama7g5-rstc
       - items:
           - const: atmel,sama5d3-rstc
           - const: atmel,at91sam9g45-rstc
-- 
2.43.0


