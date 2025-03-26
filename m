Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C3AC36019
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0QKdVYTMsVhuN3NgHvWIrKDHVnqbw2iqTyqrI/I5RI=; b=fSH4g1kEde2A5Rm1QGSTFA0h8v
	CP4tr2/9NpRALEh5LQRbXdTpaeU8nxDor/ckCsoVWMbshcHdBIhqzWbfZbC9LK4UxF3ZR9KJaHZOo
	4s8VzpgI4efNV8VgnlSO3gCcWoUofhWAJfyxxF3cZ2P0n9xsHvoiOqsJVDyySouMF7QFLDWhNX5Wn
	r1dkSJ4UC3zUFwtDRmOop37S8Q2XpM/Jyx8R8pLy70bUstfcNbekWb6KN/hDRHF+6v4D2HH5BMMYx
	WNJGRV29vWVMqdlrE204ZZW0fGb3t+7lk7tU19NQqAXjbnTVFOO5MDafcfiJ7mgUjwkxujcLMUFN5
	sSEJimXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTD0-00000008wKY-0Fp4;
	Wed, 26 Mar 2025 16:02:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSny-00000008sfF-3hQt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 15:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743003394; x=1774539394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xkIKAcxmvRMr0isI4ttyqqzXZUNUbkxbL/xiHHpkAg8=;
  b=eOzEBfmkbK+usKOaQlB8VEuWDzH5e0Z5qWh6e9k/opRXnTey61CkJSzp
   cKA88i2T8zgDKP1Ca/RhPqpvL+IcKvnPHcUNie8v5Yb39wEnyc9W/9hAv
   fxKxZOsyUwxsmzOuVnJOX2e247Wbbob/QCDxotdsstS4nwrSMWRsqLWSk
   ny8Oq/MMAQTjUjhzUp174a5IvsY7mt3i0p7REd2e5FcvsTKCzPugvytsi
   nyVYHXlgkH7geHgnkPvrbdvuLsvxJ07gMyTT/zY/mO/7EvJypaF9xab6c
   q/DBGZNSH/INIq3XY7w7CxWdKn6t5qA/q8ABmpbb6L4qZBeI3jzQPUXwX
   Q==;
X-CSE-ConnectionGUID: NRxSiTFnT3ucBnaYj7CaZg==
X-CSE-MsgGUID: hBcQ+YvkQV+0ElpMLixFdQ==
X-IronPort-AV: E=Sophos;i="6.14,278,1736838000"; 
   d="scan'208";a="44096105"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Mar 2025 08:36:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 08:35:51 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 08:35:51 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 06/11] dt-bindings: mfd: atmel: Add microchip,sama7d65-gpbr
Date: Wed, 26 Mar 2025 08:35:39 -0700
Message-ID: <57a9f2ef94005bc7bb450fe073fb594fe7d5c2e1.1742936082.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742936082.git.Ryan.Wanner@microchip.com>
References: <cover.1742936082.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_083634_940587_E43B4119 
X-CRM114-Status: UNSURE (   8.11  )
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

 Add SAMA7D65 GPBR compatible to DT bindings documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml
index f805545aa62a..f6f47999c6c1 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - atmel,at91sam9260-gpbr
+              - microchip,sama7d65-gpbr
           - const: syscon
       - items:
           - enum:
-- 
2.43.0


