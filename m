Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B16DD116FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 08:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ppoOPua4SMfUwCREkyTFD6SUvqumbmnNVbKih19LUGo=; b=4xWyvnbswJLPrE15LwmwPvsKC2
	l0cYKeQesmkM/zB9ZcPt+2uYKWaUZijpnctQfc5NR/+5X0UnZ81rZkgA1n8YXJwDB6r/BIWp9Q4HN
	jJuzF7yx0v6NnM4JXj++pV8Coi6DATkkNIfu9F8p8hvUe4F4o9wjt22KO/RVkQmB/3J/HH0BW7uuV
	2HQihqAG4Zf56cQ4k9PNHxnkeaUmJPc2DtRurO6SFTxRbzt6N6QE4Os3iF2WnGLYNTHy1ca5NKSGl
	DWlZRtjwklUQPEPxLCNiNcehQw4O8nphSVTIu84QsCkPJBJ/2meFrQVC16jBdLzsVBifcPcGMDO1v
	ptIzhj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzHm-0000000374x-35rL;
	Mon, 01 Dec 2025 08:29:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzHj-00000003744-3aks
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 08:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1764577767; x=1796113767;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nnOflrQf9c+yPiN7JaFu2F8hdPCaEh5dnJ4Ub1sQvQE=;
  b=ykCkKUY/SCYE2vR7+lJk/wU83PMkSK2PXu/0vHqu3T8g9iiAPkLZRTso
   HA6x6NGumxgVM2Rtpzk8YYOxlsfzksIbRjJ79ytdpIPNd4WXAaPO2uASG
   FEcJjwq3TEqZFQWATDp3B8Tyb5kdnRm2MP1Vlnp64XKAHrwLD4KhoUfPk
   7L0ip16Heq52T7NhadcGu0JlZnV5f4p44aRrSI9Ojv9Cpi0RIjhvhh8Ig
   CABXtbma5rcEXVO+IG8yTm3XG0r3MjSS/nqiZoe6hVQfIdIAHk0QPZlv4
   yPELcjCzPMI1Buu94fyvcWSlkBoN3ZSJ2dp2tKXO3abdmfq7MJ4FgCHVy
   A==;
X-CSE-ConnectionGUID: Jt19qymKQxqm5dx5AqyGaw==
X-CSE-MsgGUID: SVtlS4eqTZCguy3xjYIe+g==
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="56483965"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Dec 2025 01:29:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 1 Dec 2025 01:29:19 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 1 Dec 2025 01:29:16 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wsa+renesas@sang-engineering.com>,
	<romain.sioen@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v4 0/2] ARM: add support for pcb8385
Date: Mon, 1 Dec 2025 09:26:27 +0100
Message-ID: <20251201082629.2326339-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_002928_109893_528814D4 
X-CRM114-Status: UNSURE (   9.61  )
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

Add pcb8385 and the documentation for it.
This is a moduler board on which it can add different daughter cards.

v3->v4:
- override i2c0 using labels instead of having it under flx0
- override usart3 using labels instead of having it under flx3

v2->v3:
- remove the linux,default-trigger properties

v1->v2:
- sort nodes in alphanumerical order
- move the eeprom nodes under i2c0

Horatiu Vultur (2):
  dt-bindings: arm: at91: add lan966 pcb8385 board
  ARM: dts: Add support for pcb8385

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +-
 arch/arm/boot/dts/microchip/Makefile          |   3 +-
 .../boot/dts/microchip/lan966x-pcb8385.dts    | 131 ++++++++++++++++++
 3 files changed, 137 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts

-- 
2.34.1


