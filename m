Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0866AC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DrlvccNSoTa1N2CEqty6SXPXaqMw8CS9faA9z8SPqGA=; b=UfkRTk/fQ3rUg5w6bxnOoYP5Jc
	QyzMWVPP7YKjeM+l/fQfaAOXdc/V2cbJrYh/630miRXEMxls8H5TbxKjnjODhg+i8LNKF9ivLjgvK
	B5ZEA5GyLa9Zhhq2FRU7bmpvM+MxlNPFJFyZrNumSYHSu/g57YAN05zIaScrcQOMOR212N25uolTF
	vrBfZFf9dG5Rs00WjET8HbhGgs0AgKuxFcvl0jH/aMdgbHsKy16BpP6B2nMvalggyooe1ElDrx7DD
	vh9CctuEl0pjMK4LYd7uvaQiykMYGWABHOwz/xTiXhh6DSOgVYvqX6Ry0PCNuVJvZa7VaEe9H0OoL
	8qhI9Jdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTNv-0000000BPgX-26Ro;
	Wed, 11 Jun 2025 21:53:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRR1-0000000Az51-1zKH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671311; x=1781207311;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OLfd68qnuzctm3Q3lmoS0Sml2GYxSnlcolATqmbMYcs=;
  b=nWl40bXJJFpD8ppKVVpyd+mdAbry4HoaPoFNWvhx7bCpnlMSordbSnFG
   IhXcW8/4mEXtDeK8qNrIYxzwvuOyAoPBODeIbvUxrtUuFd2zqma6Qiv5K
   m4NCCQiKQ3Tk25PnSjF2FgIWsKmoiFKXqZ5v+hk2yZPPBDXmX3AZ9ptaT
   sX8pfhqe5NaSuU+GyCJGubgpxyCI/o2/TveU37l0PqPaLWL/iUjvZYBbx
   IUNvR4IJBR7eImMoabR6ax2jLIci5AboPbx3eGNKLq9qRYrO7HuZ0X2dt
   Ez1nqjxols2kgDmWgoOYehzvdeScbgxJQi2XJZZL5/HO8wZuSaqmyNjCO
   A==;
X-CSE-ConnectionGUID: VqjTqfGTSymHXSpb+r0c0A==
X-CSE-MsgGUID: Gwb8uRMNTNmg1Pwhb40oAw==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="42226221"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:48:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 12:48:16 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 11 Jun 2025 12:48:16 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 00/10] SAMA7D65 Add support for Crypto, CAN and PWM
Date: Wed, 11 Jun 2025 12:47:24 -0700
Message-ID: <cover.1749666053.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124831_699639_C246F901 
X-CRM114-Status: GOOD (  13.78  )
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

Changes v1 -> v2:
- Clean up formatting issues in the device tree and DT bindings.
- Add a description of the capabilities for the cyrpto IPs for this SoC.

Ryan Wanner (10):
  dt-bindings: crypto: add sama7d65 in Atmel AES
  dt-bindings: crypto: add sama7d65 in Atmel SHA
  dt-bindings: crypto: add sama7d65 in Atmel TDES
  dt-bindings: rng: atmel,at91-trng: add sama7d65 TRNG
  crypto: atmel - add support for AES and SHA IPs available on sama7d65
    SoC
  ARM: dts: microchip: sama7d65: Add crypto support
  ARM: dts: microchip: sama7d65: Add PWM support
  ARM: dts: microchip: sama7d65: Add CAN bus support
  ARM: dts: microchip: sama7d65: Clean up extra space
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


