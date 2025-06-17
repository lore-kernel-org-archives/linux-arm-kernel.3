Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2A0C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UO3OBg3KnqxOnhAqmgUrsRPAjHjoZWYMZcKfrgL11EY=; b=L+5X3l8U0TxuSO2aOBNCsPCMDu
	5R618RS5o4ABFozQdPmsQUcBYBuc9Mdzl97uZ3Qeu02yzxeORYtbg8r/9wuQ0jzIn2iNz6TgkkKuC
	eSm8KgycttfQs7ifAQyxI/cQDMrkOoOgO3UsDQxfQxw2OtUuO1KCwX5uT03sNDqSjKvPwbNQ9Rrg7
	x9+vE8tIFCa00L5Wxa/x/ByOWPMEnUNOJatTnVMZMdL/C8NtQnm7wB4ui18SySXkn8bfe6uwcVxWX
	n4P63NmpRatTKqQ7ZHm8/UQ1G5ttgxkz0Z83TMBtGr8KN0b6KK3anRM2Sfny9fvXEmkd7tu/acmIy
	uBTIa1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrK-00000007ztU-1G75;
	Tue, 17 Jun 2025 17:12:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYrj-00000007py9-0aHl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750176530; x=1781712530;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7PYbB5ciYDFQ/YiUR7wUJVLYeeg/6IgVHNbv1sYOFLg=;
  b=T4ko4A4TxUo/4pvsVMF1U5vQqiCMQ36+lBd5qMDTPeaOirRakltTZCJ+
   nJAoVBVOQbq1IFKw4zR913p+UQ1tpQjlTRhjNej2ZDiUaqJ1zWmlevHLm
   bj43A+17D2pvvwEqc8HF3BFZ6N32RAbOSs8VcAoxWYvh7zsydJn6D0H0t
   BYmsuQzwSqVeeYSDxHDlYK045oBCsoz0nPtbGUow4n4CWhXHZsZGx3PPy
   sZZU4C6XUs4rrj8fqQW9yVPmfFmABmgh4K1c6N1CEDpLq5nttu1nZCxqO
   4P9FdBRhUCVmdVOrexSJvBigYFxb9g1vivlbxlEvkOs4fxbufRUl153ta
   w==;
X-CSE-ConnectionGUID: nTbCTdliQ7eOQ0UC/OTqRA==
X-CSE-MsgGUID: Zlp5949DT86pliXPpTbf+g==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="210388665"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 09:08:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 09:08:24 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 17 Jun 2025 09:08:24 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 0/3] AT91 SAMA7 SoC Clock Adjustments
Date: Tue, 17 Jun 2025 09:08:39 -0700
Message-ID: <cover.1750175453.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_090851_418947_ED3FEF9A 
X-CRM114-Status: GOOD (  12.10  )
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

This set has clock system adjustments for the AT91 clock system for
sama7 SoC family.

The patch set updates the device tree phandle formatting for the
sama7g54 SoC. This also adds names to the xtals so the driver can
correclty find and name them in the clock tree.

Changes v1 -> v2:
- Add clk_hw struct to parent_data adjustment for the sama7g5.c driver.
- Add correction to sama7g54 dtsi main xtal phandles.

Changes v2 -> v3:
- Removed the empty line after the fixes tag.
- Correct commit messages to better explain the issue that this is
  fixing.
- Initialize parent_data index to 0.

Changes v3 -> v4:
- Add clock-output-names to the xtal nodes.
- Remove the clock driver changes since those are not needed for this
  set.
- Adjust cover letter message to reflect the changes in the v4.

Changes v4 -> v5:
- Correct alphabetical issues.
- Add adjustment USB_CLK name to fit the formatting.
- Add clock names to SAM9X75 SoC.

Ryan Wanner (3):
  ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
  ARM: dts: microchip: sama7d65: Add clock name property
  ARM: dts: microchip: sam9x7: Add clock name property

 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
 arch/arm/boot/dts/microchip/sam9x7.dtsi        |  2 ++
 arch/arm/boot/dts/microchip/sama7d65.dtsi      |  2 ++
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  9 ++++++---
 4 files changed, 18 insertions(+), 13 deletions(-)

-- 
2.43.0


