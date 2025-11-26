Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E79D10397
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFNtTs8Tq7V4LrSWhHNlkAVn8NW67k2SRw4M3l3l+CM=; b=KymAOH1p7ruOHrXR7N8VcFeeO0
	t0BP5QdpdZ+ZMgq5C6RGUsvS5dKPEix0tyEqAvb/Jy/rJHTs3mI5ftN/Gs9vHyPyIbcLez/DMubeF
	4M02wfHA0c1N+P6ru6xUvUQukrZUgLCq17rUY18OUB3JCGYSi6A+HE/RCVXFv1PwJF/EYylVbQRpe
	ZMdyVkSCt0umt+zBwXMUq+4ij/Hr3/9W1drqoLGmsoOEIQpUxiBg2AIriX1vZroPmxNacsSAA+Fu7
	F21Zg+h6PNZXAXQAOcYGPEUloZU5fx53DeyZr7s9FQ//iIT8YdsmsdteEdkR1ZgN9TFLQRARw+MXL
	MgLh2xbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCMC-0000000Ekms-3w5B;
	Wed, 26 Nov 2025 10:02:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCM4-0000000Ekjl-1wMG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1764151351; x=1795687351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o3e/QN+XEBfcjrx9MO89hAG618jyoE25s87Z0l8Xktk=;
  b=qLw5lWBA0R4B/0i/PBomHeAuA5EW1lnSO9vFpKm6prlxoJdPMfPNh3f9
   Dqxpt5rRGtyBN8cY2HtyffPvDbuC8muwl995jhXJAZM9MUWu4DteiHM+L
   WBvZ5h9Zh3s3V7+4PgQdxNlsM00GBv7yIKb1Qcpo4cfUhBT9xycMYiA9Y
   u1TXuVby0WM2Adzt+7b0Ihu673SAwYgiLMfz0ws7BHxS04+9s7obEQ35Q
   +GLPbxA0sc/oi6Gi+cDIDuIybJxQkFw4KCadlOdCFXT5zNevtWTxN2/c+
   XXhRnFST2MyvQI2XM5Rtz6LRVjxC7g07XFSd7NtVzqx5W3Q7fzJBVuiLU
   A==;
X-CSE-ConnectionGUID: uVR4L6JwQOarTsqRLnuBMw==
X-CSE-MsgGUID: RZjGXGP5QouiygR1Kh9g8A==
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="49045664"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 03:02:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 26 Nov 2025 03:02:03 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 26 Nov 2025 03:02:01 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wsa+renesas@sang-engineering.com>,
	<Ryan.Wanner@microchip.com>, <romain.sioen@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: at91: add lan966 pcb8385 board
Date: Wed, 26 Nov 2025 11:01:50 +0100
Message-ID: <20251126100151.1559590-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126100151.1559590-1-horatiu.vultur@microchip.com>
References: <20251126100151.1559590-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_020232_764955_C6082214 
X-CRM114-Status: UNSURE (   9.41  )
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

Add documentation for Microchip LAN9668 PCB8385

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 3a34b7a2e8d4e..68d306d17c2a1 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -235,9 +235,11 @@ properties:
           - const: microchip,lan9662
           - const: microchip,lan966
 
-      - description: Microchip LAN9668 PCB8290 Evaluation Board.
+      - description: Microchip LAN9668 Evaluation Board.
         items:
-          - const: microchip,lan9668-pcb8290
+          - enum:
+              - microchip,lan9668-pcb8290
+              - microchip,lan9668-pcb8385
           - const: microchip,lan9668
           - const: microchip,lan966
 
-- 
2.34.1


