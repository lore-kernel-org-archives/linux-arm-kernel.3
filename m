Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63509C83F2C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4KKW96i5GEm7DBJPg18B8dj7NVF1jGvp7u/oCyxl6l8=; b=PTr2oTqxtMHKgoV8pMqD4ve3jI
	fc/4soLfVTK1g6Y18vMWI4ZJ/YkZmwDvERixebUBgyYdyI33MPadfadO/2GwcnBkC/E2Gk1OOV03i
	h3IgNAOu/GB6PzYu/dMi1XiB9NQ92XYpQ/GmAOw9Y3cKLQEdc9JpFOLSKppbJZLLdJWj+c+BHGTqe
	aFFKZvRXwDMatVAjeB2LCwrKM2FYObl+HYo/hDxzDzgSQwRT0eSzRUZirM+kmJOupMIbGchd3h4cI
	cVsNZuT6vSPu9TJGTThn1w6zbY5U4AzbHgqovTcdHJ77c4JRQux6KkZ+Gh/RYovVzLR5M2vm/ZBPm
	XW4mzTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFb-0000000348L-2tb9;
	Mon, 14 Jul 2025 18:50:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMAx-00000002qix-2Whr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 16:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752511031; x=1784047031;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tMrOtJ+kfSdVA0qrXoov8X2JtXzZ9F1mreWoWfrUzIA=;
  b=Rz/+GQV5dLyA4iO9p2paRNzKznOSm/WBcUs5nRde+4v1lP9PayOSISs9
   Hw0u4jqakx8pz3sDuuPCtIWo/o0W+6Hl1lVtJU/m3CHQEdRbTzp8ynHYt
   13+d5jemCNsF4wpR7vIuvBp1Fbrq1WQf2JUu2sRk1sq3Q2CNttbvVNvHP
   YBGmkCTxqdIUp26H/F0aFEhppWjzhabIlEvd9ImGghS4NIcM59xPrFVJ2
   wtk1JKSXKFGMijqHTyuAQdP8fjW6vUb5Jt7H51c3/+t07jAnjb85A09sv
   RFOhEgDAO+PPzswMxwI3VinQsZbqg9Kln+jhnrzCcaF9jLJ0jz4JvpaCd
   w==;
X-CSE-ConnectionGUID: hBq1ljEWSkqL674rDMJkcA==
X-CSE-MsgGUID: per8wVp3TQ2Qiv2PcIAY/A==
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="211399318"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jul 2025 09:37:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Jul 2025 09:36:28 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Jul 2025 09:36:28 -0700
From: <Ryan.Wanner@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 0/5] Expose REFCLK for RMII and enable RMII
Date: Mon, 14 Jul 2025 09:36:58 -0700
Message-ID: <cover.1752510727.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_093711_901458_3F026779 
X-CRM114-Status: UNSURE (   9.44  )
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

This set allows the REFCLK property to be exposed as a dt-property to
properly reflect the correct RMII layout. RMII can take an external or
internal provided REFCLK, since this is not SoC dependent but board
dependent this must be exposed as a DT property for the macb driver.

This set also enables RMII mode for the SAMA7 SoCs gigabit mac.

V1 is here [1]

changes v1 -> v2:
- Add device tree changes to use the new REFCLK property.
- Remove USARIO_HAS_CLKEN from the sama7g54 emac node to use the exposed
  REFCLK propterty.
- Use property_read_bool() instead of property_present check.
- Adjust variables to follow reverse xmas tree

1) https://lore.kernel.org/all/cover.1750346271.git.Ryan.Wanner@microchip.com/

Ryan Wanner (5):
  dt-bindings: net: cdns,macb: Add external REFCLK property
  net: cadence: macb: Expose REFCLK as a device tree property
  net: cadence: macb: Enable RMII for SAMA7 gem
  net: cadence: macb: sama7g5_emac: Remove USARIO CLKEN flag
  ARM: dts: microchip: sama7g5: Add RMII ext refclk flag

 Documentation/devicetree/bindings/net/cdns,macb.yaml |  7 +++++++
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts       |  1 +
 drivers/net/ethernet/cadence/macb_main.c             | 11 +++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.43.0


