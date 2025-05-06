Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D04C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FqV8NN8MoX7I3CfOua8u0Vyp1KWV9LzitGLHHj4Vdhs=; b=4fvqhWY0SsjBHGlZdnfgmPnCi/
	lqe9aOVrUW9E4sNZED0BcmvmHTz43WSdZO/KFP5t7dK81x6Gzav5+IjxgpZCBv9aIza2B2c9Gv4nl
	V78o6/dmGQJC5Z6DBoq2Z5zv/Fv5VuPTpyK12kDENP5RN4S/0sYcAyHIdS6sh60NQAia3v8bHLhZO
	69O18QzTCcGO2lNh9ktJ1Ufk0UEwDLZI9Jnv9yHywoa912sp1y/jCepixhCMmgpjQ03wmb+OUVtum
	2AL7IgRUaokLPuaI24HyjvcNGFN+lD7uFtpJBAKZexwC61lxFW33I/NFH/h5omDOfVF/DniAHJWEh
	ZdozHQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUaZ-0000000DuXE-2F0i;
	Wed, 07 May 2025 02:32:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOXc-0000000DJSp-2FS8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746561924; x=1778097924;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pl1pOocrht3vmgtnFTJ9B4+etkXCe7HNZzSd09+Zpjs=;
  b=e3iah3lBgdElrvyyOI8Djr4TbORAloj6YbYOw3GMnxellm+ehTWujRG2
   e3WeaI7xlXJ+awZoWTVbVnYQpc86rSl6UK3TUVjUW+aKqyKI6DdyhZXBS
   JahsmsTdP1+FF6O/j90Cyaq2kFVzfOF97b7j+/C/Pv3+xOGiLE3pI1ReZ
   Ow0nzvgcw0YBWD0fFOHlHjyxUFAK1WQjwtjJxO4Nkh+3WviXiOtFLjI0Q
   1AJnmDrJ7s2aEQUdFhPoS45CMVKVf5FVXzb4oSTvzPu2qTIdy4F5MHR5J
   D6W95RBknOF7X+ZQntB4CAIe+BmZi46wVeo1T8Hn06JBz2paZcmReca5D
   w==;
X-CSE-ConnectionGUID: lZtvjl0vTEGjDKUcareavA==
X-CSE-MsgGUID: X8leMnIES+qi7n9W3zbrQw==
X-IronPort-AV: E=Sophos;i="6.15,267,1739862000"; 
   d="scan'208";a="41792571"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 May 2025 13:05:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 6 May 2025 13:05:12 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 6 May 2025 13:05:12 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v3 0/4] AT91 SAMA7 SoC Clock Adjustments
Date: Tue, 6 May 2025 13:04:55 -0700
Message-ID: <cover.1746561722.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_130524_816537_E043D8A3 
X-CRM114-Status: GOOD (  11.19  )
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

The first is to adjust the slow clock driver to account for the updated
DT node-naming for clocks and xtals and ensuring the driver is still
backwards compatible.

The second and third are adding a missing clk_hw struct that are not added into
parent_data struct causing a incorrect parent for main_osc for both
sama7d65 and sama7g54 SoCs.

The last patch updates the device tree phandle formatting for the
sama7g54 SoC.

Changes v1 -> v2:
- Add clk_hw struct to parent_data adjustment for the sama7g5.c driver.
- Add correction to sama7g54 dtsi main xtal phandles.

Changes v2 -> v3:
- Removed the empty line after the fixes tag.
- Correct commit messages to better explain the issue that this is
  fixing.
- Initialize parent_data index to 0.

Ryan Wanner (4):
  clk: at91: sckc: Fix parent_data struct for slow osc
  clk: at91: sama7d65: Add missing clk_hw to parent_data
  clk: at91: sama7g5: Add missing clk_hw to parent_data
  ARM: dts: microchip: sama7g5: Adjust clock xtal phandle

 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  4 ++--
 drivers/clk/at91/sama7d65.c                    |  3 ++-
 drivers/clk/at91/sama7g5.c                     |  3 ++-
 drivers/clk/at91/sckc.c                        | 12 ++++++------
 5 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.43.0


