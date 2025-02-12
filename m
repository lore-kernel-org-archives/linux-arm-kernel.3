Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F33C021A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ObtcrTuelHoaZzgReqhFbeEfbfvzB90jJfxNART9a8=; b=Sqvk+3OQpcKCUyq66DROtbaGeV
	TId9zMUH/In7RWaNSEMFtfNbFaVsEUo2XiQZ4rkR3Rttds52VXalykx3onlT4ssBW75bXhRy2R6tr
	6zob5eQXc8S38Z/JBaLyVUDOHg6jEVu+S66bJ+86mfFj6Gd4Zq1FRpZQhtztj6CqXeCO6s3IE/S9R
	HGAaTwZ7SjvBXtodoXJneFEkTKxUaHQK3baaeR0CHDyo2QJNy18ra0AYUEMnos7gdLso4to8n4qVf
	9zHCGeBlyJHShk9vk8H41jNVKanDfeozWY/uop2Zi5CdkP/GVfSgqn8EebiXoLmk4gK+WhF0N1mLC
	9/gEnzHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGK-00000008Ehr-2hxi;
	Wed, 12 Feb 2025 17:11:00 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFgi-000000086Js-45aX;
	Wed, 12 Feb 2025 16:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378053; x=1770914053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=34yUH4FReh//Shi3Q14PxOJohJbKhtrPmtlmxuM90Cw=;
  b=PKrKXApIfURcRxczAdbn2gpl5u4kqBFaHD1QWbhaQ5raWU+neENjWBiz
   B2ca++sF25532JVJtsClSL7IGvflW8GeJQOOZd7fKBMq3hSj2jZicggYj
   Xqgp1FxrokPb1tF6JjseWn5mAnvyqM4k49pEqbJSGZPrqT0Ae7c1AWpNb
   rjzcgBukKqYktY+kcT266PmXH8EzGWg1JYqOoXLDXQCi4Bu6DDEJjcqyT
   BX447KgRKlwjps82h2+YVz8Se5tKhnYNNOZmz51VbL5vsFeVD0a/rpmGp
   ULpdkLueY2YllTClHZkfES5wWkw7+OTAXNyM5Oz4dBBaaiqDwt3P0R1ED
   Q==;
X-CSE-ConnectionGUID: h18MuCyBSvWAo95qzc932w==
X-CSE-MsgGUID: lx1iR6j9RVCahd2BDc/VfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43811888"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="43811888"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:12 -0800
X-CSE-ConnectionGUID: +vdWh79iQG6OMwT6nXvM4w==
X-CSE-MsgGUID: MwpZszTMTVaYHbh6HJ9xRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143815136"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2025 08:34:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0F81F4D1; Wed, 12 Feb 2025 18:34:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v1 8/8] i2c: rzv2m: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:33 +0200
Message-ID: <20250212163359.2407327-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_083413_055863_ACFEDA34 
X-CRM114-Status: GOOD (  10.21  )
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

Use i2c_10bit_addr_from_msg() helper instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-rzv2m.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index 02b76e24a476..55c5ce3b0f97 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -287,13 +287,9 @@ static int rzv2m_i2c_send_address(struct rzv2m_i2c_priv *priv,
 	int ret;
 
 	if (msg->flags & I2C_M_TEN) {
-		/*
-		 * 10-bit address
-		 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
-		 *   addr_2: addr[7:0]
-		 */
-		addr = 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7);
-		addr |= !!(msg->flags & I2C_M_RD);
+		/* 10-bit address */
+		addr = i2c_10bit_addr_from_msg(msg);
+
 		/* Send 1st address(extend code) */
 		ret = rzv2m_i2c_write_with_ack(priv, addr);
 		if (ret)
-- 
2.45.1.3035.g276e886db78b


