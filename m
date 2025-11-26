Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01589D10397
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rUgfiuPQqPthfHv9BF18SMN5MTa5Tt1MdljRmfpfqYU=; b=iXoF3wJQu6NbIOhjJXK8tNcxnK
	9gtkw9iW2l5rzhYBfvGl4ph1EC6tl8Xi9VlUTIn9GsUm1RcBpOi5ZbZEJuheP+FeJOJfF2KrvVegq
	BS42urzo/ABtcOnI5qhYW+cgEm/sfB74yKQyPP9EH7XWSTogZ5hMH2JDE7j1lbsTUKXtp8gx5KGBq
	9U/h8uB8EZynjfF4p/mdZNvXsgpdY0/76EufY0peeDfeZMQUbhOY+UHSE/oy4h5Qx09T0U5rq84Sr
	jIZ+zsDc3OPkPdcDv2T8E1tHbhdRN9pv2lln2/Y3bP6x/WfkRYigSuC23d3suBZmaoqQnittr5rWG
	ogOsHtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCM6-0000000EklB-2UPN;
	Wed, 26 Nov 2025 10:02:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCM4-0000000Ekjt-3J3v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1764151352; x=1795687352;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MB7TFExKovkIe/FTKbZLG4AaR1UT47lwRBCzVCfas1E=;
  b=lHUoCwVqNI/FxKiLgk3Yo4gMP543j8A+DjMY2Gb1V+1KCoNRg/kWFcgm
   lKlNb7nzkWKowqIDfr0nbFTGwoVK7T8EhM2mrpQ+qvcsO4mBO/VwEkEUi
   oCC4JtHSL09xXAc5aWzCMW64rj6C3ljwj4mDUl372AyvU6Hx9FwJhJcte
   2KqtkKCQBrXqMWC641F7B+YmFEDesrxXGarZoYHcku89s8eU15Lnmbevh
   mT3yAlIj4zog5+eKIq2MMaVYxYUQT1xK4kd2kMXNnTvIyLwK7d1pJQ6Ls
   AdpuXjy7rLgr6Se3weXmYZ6PpMSBMqPMsUK+cEsZ4ASt/24AlxtinfCGi
   w==;
X-CSE-ConnectionGUID: jBrz8LRmS7CFC/Xb1gpQxw==
X-CSE-MsgGUID: OARiB2ZPQBK8RBonucGPbA==
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="56286338"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 03:02:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 26 Nov 2025 03:02:01 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 26 Nov 2025 03:01:58 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wsa+renesas@sang-engineering.com>,
	<Ryan.Wanner@microchip.com>, <romain.sioen@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v3 0/2] ARM: add support for pcb8385
Date: Wed, 26 Nov 2025 11:01:49 +0100
Message-ID: <20251126100151.1559590-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_020232_847252_C4E49FF2 
X-CRM114-Status: GOOD (  10.37  )
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
 .../boot/dts/microchip/lan966x-pcb8385.dts    | 133 ++++++++++++++++++
 3 files changed, 139 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts

-- 
2.34.1


