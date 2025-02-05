Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E317C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 05:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CO9FY0Wm5lTgU1lqZJE7rO94ggNAyUKoTehfqzxmL3M=; b=H45dpknCDxnln7
	J8DXUnGxdL0wso5N7qgoqiAynF2s43Igpgd1zmKdyim/d0KILGj4Gx3SWFFUw/i2i5evivAfBQzcH
	LbDwqzx8LciRlZz58DLClJjnfAEFTweBa1TUoRpTdfJHnXbTAckoEVvDlb8KI3bT+7yGwc8aUHSb3
	aDwDLfMzUqRb/yCQLUIbo8VqSnLlJK+G+nDqcHn63HkLFTxRmSkCVD9OBKHArkRGubgOessYMjNJ1
	HOZwGXllQyV+y4DYGSH5J0Egu9qrKGz01m2ORkOCDluRxQI51iFaTP25jPONOydqh3FXarGyx3NqE
	V1yxJKqyLHBPqV2BI7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfYIl-00000002Mk0-3wEX;
	Wed, 05 Feb 2025 05:50:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfYGD-00000002MQp-0h3M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 05:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738734461; x=1770270461;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=03binLSyY8x9MAEINWCcoaRHc+hMDevy5AFcDXVUMG8=;
  b=C+pFZquWKYFz0KFLaqROtqKs30hzzq0DUGR1lMtkw0ReHjQhNKmHtIIY
   hkwcDzulLB+k2FAVZLaQmOXste9ogti5MHAlmlvfNd9uphbOLom23zL4H
   iJxgJSRZygOrt6mCby4RrK+8BI7ONsCwqs55shKGHq9+uwkCCCB/KlrLB
   FMv/Q5kILMP96/IoRgHwDyE7gtjWwjsiev/65becyHKSRQxP9nt/LYfd3
   8whYF49IpnmxPBkvSk3e8L9Hkbfjc9mRvbwJqw5kZ6Mo9miSiV5w+nUq+
   7L9GFX8arOJn31nZQx+o+3dQcANdbJ2rkfYFVj2S0jOEmw3XeHWR6RJtV
   g==;
X-CSE-ConnectionGUID: SlhoVWEVQYiqxuNbYIUogA==
X-CSE-MsgGUID: cskGm2+uQIO7CUWRde8SSA==
X-IronPort-AV: E=Sophos;i="6.13,260,1732604400"; 
   d="scan'208";a="204805605"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Feb 2025 22:47:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 4 Feb 2025 22:47:11 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 4 Feb 2025 22:47:06 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: [PATCH 0/2] dmaengine: at_xdmac: retrieve DMA channels from device
 tree
Date: Wed, 5 Feb 2025 11:17:01 +0530
Message-ID: <20250205-mchp-dma-v1-0-124b639d5afe@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFX7omcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNT3dzkjALdlNxEXWNT02QLY4s0I7M0EyWg8oKi1LTMCrBR0bG1tQC
 9h3W+WgAAAA==
To: Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Charan Pedumuru <charan.pedumuru@microchip.com>
CC: <linux-arm-kernel@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Tony Han <tony.han@microchip.com>,
	Cristian Birsan <cristian.birsan@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738734425; l=910;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=03binLSyY8x9MAEINWCcoaRHc+hMDevy5AFcDXVUMG8=;
 b=gYeZSfAOX1Ed6HExseu4wcvUQyH86wo9IXZQ5i4SsunRZ6suTFpNaHmtLG2qXkpWFTG+Vs81c
 pMTbLWCVuK4CNxrX232xzq2meh21eA3Yx/X6WL7QyCW07N/vy3NdohD
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_214741_273647_053E3432 
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

This patch series adds support to get the number of DMA channels available in
XDMAC from dts. This property is required when the channel count cannot be read
from the XDMAC_GTYPE register (which occurs when accessing from non-secure
world on certain devices)

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Dharma Balasubiramani (1):
      dt-bindings: dma: at_xdmac: document dma-channels property

Tony Han (1):
      dmaengine: at_xdmac: get the number of DMA channels from device tree

 .../devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 26 ++++++++++++++--------
 drivers/dma/at_xdmac.c                             | 26 +++++++++++++++++++---
 2 files changed, 40 insertions(+), 12 deletions(-)
---
base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
change-id: 20250205-mchp-dma-355c838f26f4

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


