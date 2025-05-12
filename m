Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D28C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 19:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eiEiTEq+b3iVlYOxIWTl7/lZJrwXV1uqoAKgh97ggZ8=; b=k60LKwSR8lHpQ9eEbTQTuuCHzF
	5N9ylJFjMw1d1GUIzyAmAjBB5q8f3I95gKIrz26igVY5LTbSBr4LkVL5b6vU3/1UHErwF/a4wS91T
	6x1uc+G2xidASlh27qbKHK6B/D/zynf8dfQaUw3EeyupQAbA5HZgonMuY9RNzI2Xz16oZ3JZc9Ven
	p+Sajv+M5KGbwEUkYg8xHEhQa8sGOGnLUmGKBLW2GGC+dZUyj+WrPLCi1X2Pi12oiiD5+634r55Bo
	+bgpCD2gSbL25C912h4YvzpZ1VtfiWRs85j2kgWbeZDYT85/Uy4fc2CkAEXRGsw6doWJuEh87qrSO
	Kqi4yPqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYsN-0000000AXkd-1jJY;
	Mon, 12 May 2025 19:31:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYqJ-0000000AXJ3-21ro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 19:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747078179; x=1778614179;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Sdl1gDmVvVhvI5vO5ld0fmlqgs4/bpMSz4SEZl51ot0=;
  b=JlXoSyXqd/1d1NAvxH+gnwlzWfokNbG5MCXU9h3+MrVtixiQgC9xCB3D
   RiCYmzrW9C2+Fec5xDAuXkFMuLGN/kStQhfeyebDDtOU4sRZKcoL1/qaf
   sC/YcWtCgD98NkXfcCvS/nOQcvNhrTobUGiry4YZ2rS+ePVV98hqhELQY
   89isgzko/en+QxL0Jyz1Yx1yvOx4pwZYcBJV5LO8Y77NYGdXzfUUwjeQU
   VqpLX2AWc1gupkwqd+wq/Lj8WSOzTjO7P0P1XA2FzSd88TpVRltt1XLWf
   L1CNYylzMu4TxthAgKA6W90/g6OAie05PQCqdCH8C7JDXBD1pQHzt2lvm
   g==;
X-CSE-ConnectionGUID: hYKpzzHaRPOvLPNNOvU8gw==
X-CSE-MsgGUID: dl60q0MJRZCfEkOp56V1ig==
X-IronPort-AV: E=Sophos;i="6.15,283,1739862000"; 
   d="scan'208";a="209006606"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2025 12:29:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 12 May 2025 12:28:56 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 12 May 2025 12:28:56 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH 0/9] SAMA7D65 Add support for Crypto, CAN and PWM
Date: Mon, 12 May 2025 12:27:26 -0700
Message-ID: <cover.1747077616.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_122939_754204_5898CB51 
X-CRM114-Status: GOOD (  11.58  )
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

This set adds support for the SAMA7D65 SoC crypto subsystem and enabling
them in the device tree. This set also adds PWM to the device tree, and
adds and enables the CAN bus system for the SAMA7D65 SoC.

Ryan Wanner (9):
  dt-bindings: crypto: add sama7d65 in Atmel AES
  dt-bindings: crypto: add sama7d65 in Atmel SHA
  dt-bindings: crypto: add sama7d65 in Atmel TDES
  dt-bindings: rng: atmel,at91-trng: add sama7d65 TRNG
  crypto: atmel - add support for AES and SHA IPs available on sama7d65
    SoC
  ARM: dts: microchip: sama7d65: Add crypto support
  ARM: dts: microchip: sama7d65: Add PWM support
  ARM: dts: microchip: sama7d65: Add CAN bus support
  ARM: dts: microchip: sama7d65: Enable CAN bus

 .../crypto/atmel,at91sam9g46-aes.yaml         |   4 +-
 .../crypto/atmel,at91sam9g46-sha.yaml         |   4 +-
 .../crypto/atmel,at91sam9g46-tdes.yaml        |   4 +-
 .../bindings/rng/atmel,at91-trng.yaml         |   1 +
 .../dts/microchip/at91-sama7d65_curiosity.dts |  35 +++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 128 ++++++++++++++++++
 drivers/crypto/atmel-aes.c                    |   1 +
 drivers/crypto/atmel-sha.c                    |   1 +
 8 files changed, 175 insertions(+), 3 deletions(-)

-- 
2.43.0


