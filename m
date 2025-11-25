Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B3ACFD315
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFNtTs8Tq7V4LrSWhHNlkAVn8NW67k2SRw4M3l3l+CM=; b=cgox65dQfGt5q7BTrylQ3srRIt
	x5oDAcV4lo0gWDm3lCvVlMuJr02EqnGk3VB90fWVKzUIv18u+SUYnLYiceSjAYWRvR2Oppp1yh6ud
	sfeolpPHQ7VskCFMFhbfU0c/47hsxqdRExugSiQk2lsYrLV528bLIqGHkrJ8fxwfm5adEyKqqRYPY
	Kkw4yW0au3XvyR3D6E9M00suAR9ps1ySyHxMvxz9FlExQwIhIfNSRV/8i/YxCYpNuL8V8QVVuiggY
	RUjl6fDAZfQmX6tTF/p4D1lAF9FBNj8tHlexnC/Wt0XNVMTEYR/4vFPJ4iy7Znal+63zEVZbs8PD6
	UlNUWdCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNoEr-0000000CxuJ-1P9d;
	Tue, 25 Nov 2025 08:17:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNoEo-0000000CxtQ-2YW5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 08:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1764058645; x=1795594645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o3e/QN+XEBfcjrx9MO89hAG618jyoE25s87Z0l8Xktk=;
  b=aTKhN0C+7Zf5/+w4Iysz4ByYMZWMxGCJ4Qs0KdJkyMmP7t7/pg6VzjuF
   +5Id8O6Qw3x+zgksxus4AtWPoX+wrZfhD9VKr8uLJJm7dcDLB7/flR+Aw
   kZBm70AyGBkngKDOAAOAE0EPBcaNiMrx4giF69RVg6GXFWlzFxUMiqqQV
   +yKZhJPc+FOQb4dH4lquBXPkH27joTAcsFpgvFNDC70iJpVw5qVajWDGQ
   azyQtk/3h5fOorsOy0o2t3Arv1wxV7789m+XIHFT+V8KjaLAOkSMnrH3J
   87p0ELrzQFwWDzn90I+4SPiKRU8bIATBE87B97YPsUFKVQAD0uG+dbkZR
   g==;
X-CSE-ConnectionGUID: IOm3dB9ZQcuJUUeoNzT1ww==
X-CSE-MsgGUID: KLQ7DqJjQ82DYZXE5pnfWA==
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="216971704"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:17:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 25 Nov 2025 01:16:59 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 25 Nov 2025 01:16:57 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wsa+renesas@sang-engineering.com>,
	<romain.sioen@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: at91: add lan966 pcb8385 board
Date: Tue, 25 Nov 2025 09:15:50 +0100
Message-ID: <20251125081551.1390820-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125081551.1390820-1-horatiu.vultur@microchip.com>
References: <20251125081551.1390820-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_001726_742876_4408E1C2 
X-CRM114-Status: UNSURE (   9.08  )
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


