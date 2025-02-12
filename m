Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7340AC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWPoxo/vKE0IwtZvkWF9/6Ri+UdXVfkqqMLUhRwcLFk=; b=Ntdq5QOPm2GN44ojZuvX26n0Zc
	VZdFyXjE2VYAwnhc54HhvbQMf2/JJt3VeXyQQVOIYAiF79+d7SnJ5EfjwrAHjYXY8ALzdISwpcXW4
	47JNS6vR+bS8cRxjf7B8JHT+hRBTOrDB3zse9I33sGmvnFzZVj9k+s17i0xWbKCMdL+0sqWOgE+0M
	DsZCwIzhQ8KTbLKumlUEJx+1SzvHV1tg4n66B+b8rJgy9sUWnzNvZjesks3VMoq+A0KQGVcihiTU2
	jVgwMI7pHWiFgwGUhWTI4yeK2WUjnzyp6JE3S28ZaQsSXWMr22WUWdGmrUOPYsBCR1tQtyB1tLD5K
	PNSQ7o7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGH-00000008Eba-0vNP;
	Wed, 12 Feb 2025 17:10:57 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFgi-000000086HD-3BQi;
	Wed, 12 Feb 2025 16:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378053; x=1770914053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hb3P1Z7fp3eHA+WMWeBY9ywHmJku1uAyrgRk9oKvYTM=;
  b=WvQ3xSrLoRgCIjKaddw+4sttPrCnbDo9BHBDedjKoZS+dsamdP3B9w7j
   fL7rTrRrvdXiV6y7Perg9WVJYOd4vg0bVj+qD1sv+kwlHs59iN+NK7uJj
   BWCyAaCczqFFY+WCiife5IlUcCcoYQavLj6wL2e6zuuuAQbIo8rzNSc0n
   7qc7uj/Gya3UJnvQeOfge0BpoQn9fL1htmINNhaOxVdR9kYP/LNmJyt1y
   zBpGavrppk2ntppoPJeXYKMClY344f83fcT1GDvN/I+0q/g/ylX09bphY
   ziF1/0e8bS3CX3kCZ/Q/gQAT+9lmvjmQPbLyNzfmrBL9Gd63g2u2Gv3zd
   g==;
X-CSE-ConnectionGUID: kRfpZEUaTcuK4BMS7dweUQ==
X-CSE-MsgGUID: 9xfceJ/tQ8i5Hfrbl3oXSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39969221"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="39969221"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:12 -0800
X-CSE-ConnectionGUID: 8OZBwWCSShK6pBCksmcUPA==
X-CSE-MsgGUID: 14jO9aJVT/CiG7rJ6BlqOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143815135"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2025 08:34:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 043304B0; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
Subject: [PATCH v1 7/8] i2c: mv64xxx: Use i2c_*bit_addr_from_msg() helpers
Date: Wed, 12 Feb 2025 18:32:32 +0200
Message-ID: <20250212163359.2407327-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_083412_865440_D715F303 
X-CRM114-Status: GOOD (  12.43  )
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

Use i2c_*bit_addr_from_msg() helpers instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 874309580c33..3f83c68947cc 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -27,7 +27,6 @@
 #include <linux/err.h>
 #include <linux/delay.h>
 
-#define MV64XXX_I2C_ADDR_ADDR(val)			((val & 0x7f) << 1)
 #define MV64XXX_I2C_BAUD_DIV_N(val)			(val & 0x7)
 #define MV64XXX_I2C_BAUD_DIV_M(val)			((val & 0xf) << 3)
 
@@ -176,22 +175,17 @@ static void
 mv64xxx_i2c_prepare_for_io(struct mv64xxx_i2c_data *drv_data,
 	struct i2c_msg *msg)
 {
-	u32	dir = 0;
-
 	drv_data->cntl_bits = MV64XXX_I2C_REG_CONTROL_ACK |
 			      MV64XXX_I2C_REG_CONTROL_TWSIEN;
 
 	if (!drv_data->atomic)
 		drv_data->cntl_bits |= MV64XXX_I2C_REG_CONTROL_INTEN;
 
-	if (msg->flags & I2C_M_RD)
-		dir = 1;
-
 	if (msg->flags & I2C_M_TEN) {
-		drv_data->addr1 = 0xf0 | (((u32)msg->addr & 0x300) >> 7) | dir;
+		drv_data->addr1 = i2c_10bit_addr_from_msg(msg);
 		drv_data->addr2 = (u32)msg->addr & 0xff;
 	} else {
-		drv_data->addr1 = MV64XXX_I2C_ADDR_ADDR((u32)msg->addr) | dir;
+		drv_data->addr1 = i2c_8bit_addr_from_msg(msg);
 		drv_data->addr2 = 0;
 	}
 }
-- 
2.45.1.3035.g276e886db78b


