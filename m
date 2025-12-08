Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348A4D3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 08:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ADkAfghBtTGeUe17N0RWfRGo3UTYMxYC3RBtzSepj00=; b=FqycnCIfH3NaqSv7Ac3G0wCopn
	xN0ldkMltNeKz9Dvz33qE4H9bsfRWd4EhgTzN/+FMWu/b1ySJLQt2HCy48xaedrfn0Vh3XCQMSBdT
	w58avM2KDrhiJX7U2DAFaWcKyIHGvJXVwN2M4wbZzTRUdxZPLK8UNe2lMlm3lEiOsAcgxLZ5ZQVwf
	i2QZgQi6tMsGaTGbqSzzY8cYE6USDonj0BuMd/6oxEM1EP7RDRuNCGs0plSp/0pgQLulkgnCExyEM
	KEkZKeP4b6TdGUOt0Stgiu7l9gltOe2/QCAhMcL2TSbSluxtj5CmgoU2/RqFut9u0Y3yXHAhkqnSM
	wVkYoydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSWkP-0000000ConH-1u8X;
	Mon, 08 Dec 2025 08:37:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSWkK-0000000ComJ-3QNU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 08:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1765183049; x=1796719049;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gcs+i1c9iJ9vBol4OAC5dihzeWSQQqGNoN4SU8Fubqs=;
  b=TTi7hNFq4QBDMwxpFnzWQDqacxtJy3R+Pcic8d5ien8b3NvGIT08nMNB
   YmnKELKNtqM+RVMY4Pnhzg/1akzGx6Z6jAiH1ufSKR8XPXNKWsvJ0AbO7
   BjezSQeLSf5c2Qw718UjEU+oHvwHktS+0mVS9tPyFMVxfqzbxsPZ+2CAB
   BpSQnosrToh04P17Q3+tUtm1BnU0eYdM800dPA1mWlSDCFiy+bND6l41F
   Ij5fAapE8LYX2EkTe3eGA4l4lrplpkjT4Zmt+156x9Ld4vZB2MiqJqb1b
   QvuD0Vu/nCGoA+C2YQPVLKPdbECqGPCWCR5s+xluoelIFMqqiR+YOUmKV
   w==;
X-CSE-ConnectionGUID: a05ABXuWRCakQDBK+rkcGA==
X-CSE-MsgGUID: Tt0ru/ccRySn0uQ2PsLUPQ==
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="281574456"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Dec 2025 01:37:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 8 Dec 2025 01:37:04 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 8 Dec 2025 01:37:02 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wsa+renesas@sang-engineering.com>,
	<romain.sioen@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v5 0/2] ARM: add support for pcb8385
Date: Mon, 8 Dec 2025 09:35:43 +0100
Message-ID: <20251208083545.3642168-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_003729_083766_4DB67E52 
X-CRM114-Status: GOOD (  10.02  )
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

v4->v5:
- change the status for aes node to be "reserved"

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


