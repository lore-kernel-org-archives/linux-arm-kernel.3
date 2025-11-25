Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4E6CFD37A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2bcwc8v6K6VBoNL6JWQk7cto0HdSwvsqgOQidTqbeGw=; b=di4T2kyTJApIwDnQ0MFsGm6eg6
	56PUhExHd3rR+ncwnOYbCTio5NIQuu6RNs4RcokgHUOxVCzgwPl+CSZlbiMP5irw9kgb5jkjf0c2M
	vvHNdHLp+vb4NDno6VSks156B0dTBrKgKRGoyI23Mm6zCJo0+umOaVnwJABPMfJ1b9LJewypKbbDX
	s/K36tOqvQ4A76YROqDciB/c4Tl0iJWslAuRn1GL7sWLL2nnuF36f4ZJTFRAsj3NyOO/gLDTRL4R5
	CisyVdRbCL1nSWuyxwDAA84vipwOmMICDn5fRzPfznSj2EPE2Od085JR5F9ZYs/aAz9zsg6ePBAbd
	9nEIDpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNoEw-0000000CxvI-2cBQ;
	Tue, 25 Nov 2025 08:17:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNoEp-0000000Cxtg-47dO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 08:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1764058647; x=1795594647;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6Twb8mgQPk7aj0pXX+bHnIC/oSrtic7qmC+oaQndG4M=;
  b=cpZXvtVjbxW6ytb9/3s8L9twORIucjREShudsS0T29Avqu3w329RmlzX
   crk464uEjpKAoASemxxwB7WylNEMFIe4K9+abNORU//3p5uW59n/kj5Ui
   EhIiCpKv7485fat+u0RDDWoTJiU1UCmD16e4qVxrcMPrLdv/tVHZh0y4x
   En8KESsc7CH6RHVKp+pncv8LV2kyJQv/xaLqVKi1oAX7nLxKNHTuYavgt
   EpNTGsWqGECnDrraqBjlCwLYDRzKNtpROaGRcMU+PdPthJ5ZWZTerggUO
   inOydyWA/1ZNavz7qldnYjl4xefVZP2kO8uipMkTI6/8nImg71hEtsL+g
   g==;
X-CSE-ConnectionGUID: tWv0xuV6SpSm15i19A7SVg==
X-CSE-MsgGUID: 0oDT14BcQbmdfSmipQbBLA==
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="216971709"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Nov 2025 01:17:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 25 Nov 2025 01:16:56 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 25 Nov 2025 01:16:54 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wsa+renesas@sang-engineering.com>,
	<romain.sioen@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v2 0/2] ARM: add support for pcb8385
Date: Tue, 25 Nov 2025 09:15:49 +0100
Message-ID: <20251125081551.1390820-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_001728_082195_C4D7C669 
X-CRM114-Status: UNSURE (   9.79  )
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

v1->v2:
- sort nodes in alphanumerical order
- move the eeprom nodes under i2c0

Horatiu Vultur (2):
  dt-bindings: arm: at91: add lan966 pcb8385 board
  ARM: dts: Add support for pcb8385

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +-
 arch/arm/boot/dts/microchip/Makefile          |   3 +-
 .../boot/dts/microchip/lan966x-pcb8385.dts    | 135 ++++++++++++++++++
 3 files changed, 141 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts

-- 
2.34.1


