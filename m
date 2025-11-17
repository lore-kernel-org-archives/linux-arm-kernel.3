Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F25CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 13:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9/Ws6wvzIYeRtMZyXpkL6jLOuuQh7bsSxnABS3uW92Y=; b=PpZ4M2QAta6S3OGkVRkvWL1/wn
	LTCEoCloEm9C32i810M8a3/Gpv6CdWpB9wZ0LwSpArHBC3begn3Zpa7/6UehAfOYDlU4KUPeeA2Xg
	4v4lEjFmYzYBXgnKM9fAc0hX0wS30AR3SMizmFOQjCN7NaKNOFK50/GXS/K0OL8+LMXc1VR6y1cxq
	7WyxJBXYE/TjAqxrmOgLyJ9U1bKVOoTcBA8Nme2KB0xUL2kWLsSrm2i1tw+UixPU6+mK/D6hb8fdu
	WYMK1iA1w23qZ+l1Pv9h6Nld1fWPNvDgye600pWMuUbmWWAvcK+FHWfbCmpYgZkD9YhnwJvQIaLMn
	8Z8EGcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyrg-0000000G8nX-36M2;
	Mon, 17 Nov 2025 13:01:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyrd-0000000G8ms-26fe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 13:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763384509; x=1794920509;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UXOU+yL+OrBxKdkfdUf6SCfqvZjolEPurouI3Fu1XLE=;
  b=0TWdiT6Yv6tIlaUwY5QfaebL9r3aMsWNwjjene43PKjs3WbwOD6fYFNH
   vK9/zWfFC6n0T0PxSGasDGxVpFqpRQzDC+W9FUgJSbw9jOE0NpKxRXzrJ
   KWVJ+yZGwqPeeMhjtYYlgpZVplBTMJ9oIySuCncsk2DFKUH3mZvSHVmlY
   dRPrrZdC1+/ExZBON3jA9nGhGH4KpG/hv8CmqVyeBKNlYZhNGIqq/v6e+
   lR04nsZG+I5ROINgpLHrDiWgkz9MCVCz/myKz2KoiuInBzsG1rBF5Ymzn
   do5gmZeUgGc1GBa9YpduHoFBH9uu1jZcM2wFMdyaajp3wCLsfBRcCKtph
   g==;
X-CSE-ConnectionGUID: a4mIhi7kS1KMxkhMPJdVjQ==
X-CSE-MsgGUID: c8bzCIYjSzW5jvd767lAPg==
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="49728587"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Nov 2025 06:01:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 17 Nov 2025 06:01:43 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 17 Nov 2025 06:01:41 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wsa+renesas@sang-engineering.com>,
	<romain.sioen@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH 0/2] ARM: add support for pcb8385
Date: Mon, 17 Nov 2025 13:57:07 +0100
Message-ID: <20251117125709.102013-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_050149_805802_B0686088 
X-CRM114-Status: UNSURE (   9.05  )
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

Horatiu Vultur (2):
  dt-bindings: arm: at91: add lan966 pcb8385 board
  ARM: dts: Add support for pcb8385

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +-
 arch/arm/boot/dts/microchip/Makefile          |   3 +-
 .../boot/dts/microchip/lan966x-pcb8385.dts    | 137 ++++++++++++++++++
 3 files changed, 143 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts

-- 
2.34.1


