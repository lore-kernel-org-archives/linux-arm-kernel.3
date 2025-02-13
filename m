Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1DAC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBok5ljzTeLLhCjqjxrcZsgYahXobFmQsrwlu8b6yG8=; b=YFWr4Ptav0q3QRjAvsqL8/G1bS
	DGaG+fTSXspQJkcZ0POEFLILEsiQIg96YzAKDPOpTe5E6BGEkPsnKW4xOuzPtFrRwcUeiAVPuTVOL
	JVX3jThaX9FIpcxYzO228AvuRL8Up7j1fA4GjhEXNmte1kMu0DgRf2v8rhCXlxRUDRBDG/RL3PRe6
	UcATrIq7yLxDyuV9p8LankD+xeInEuAZyvKm2LFMXTiUm4T9R3vEf8Kb+7vR7vzP9inNCCuLEYXC3
	KvHYNpktvoaT/pFZa2tm+JfxpHZ6GGEujMn/4A8S13imv4P9xUi3wHF0LO/QTt/TKXRxdPMJjqGII
	wRqGPyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIg-0000000BLgv-3DS0;
	Thu, 13 Feb 2025 14:34:46 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZvh-0000000BGqP-162B;
	Thu, 13 Feb 2025 14:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455862; x=1770991862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ybN5Nygx8hZ29vGg+klw6Hx6uz4qirA/yKTm+8272bo=;
  b=aNMqMZwVlMV6V7OBTn9YiXo0UVPw1jS902+QiLm/Gf6MhMEkgMrnzShJ
   mezlkF+a/VJ8FF5udJ4Y03CQVqSHxdzAsJgxs91GxUcy8J5WTmvdi0Ezk
   7kJcx04UuoCq3C7kChNtPd1yC1GGePp+ZxYwgt5pr5AahV0cOdDwlbucV
   UNdC3/iQ19h0tLLJbsfnuI8tl7IrGMHqJpow7BXFw6a3GpdZfRQH30Toq
   erEk7hccchK+ufSqDsMywruJX6HvUhWph9YaQTgjSCd++DBrsJu5vWQeK
   TqX2B1jcSsMl6yNBpLDXIkP+RmXwygend64qseI+BASGA7DTgqdQgr7HQ
   w==;
X-CSE-ConnectionGUID: oLT8U7ilTGmp9JWXnw9ypQ==
X-CSE-MsgGUID: WmlQhrb8ReKZDT9i0zWObQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40022170"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40022170"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:59 -0800
X-CSE-ConnectionGUID: BwV8tZeoSYuucBgwq9XW7g==
X-CSE-MsgGUID: zwLfW2AwRTybHJ9Kyd0XPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117777628"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6F5333BA; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 05/10] i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:19 +0200
Message-ID: <20250213141045.2716943-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061101_346735_0C96EDA2 
X-CRM114-Status: GOOD (  10.86  )
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

Use i2c_10bit_addr_*_from_msg() helpers instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-eg20t.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 4914bfbee2a9..efdaddf99f9e 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -48,8 +48,6 @@
 
 #define BUS_IDLE_TIMEOUT	20
 #define PCH_I2CCTL_I2CMEN	0x0080
-#define TEN_BIT_ADDR_DEFAULT	0xF000
-#define TEN_BIT_ADDR_MASK	0xF0
 #define PCH_START		0x0020
 #define PCH_RESTART		0x0004
 #define PCH_ESR_START		0x0001
@@ -58,7 +56,6 @@
 #define PCH_ACK			0x0008
 #define PCH_GETACK		0x0001
 #define CLR_REG			0x0
-#define I2C_RD			0x1
 #define I2CMCF_BIT		0x0080
 #define I2CMIF_BIT		0x0002
 #define I2CMAL_BIT		0x0010
@@ -76,8 +73,6 @@
 #define I2CMBB_BIT		0x0020
 #define BUFFER_MODE_MASK	(I2CBMFI_BIT | I2CBMAL_BIT | I2CBMNA_BIT | \
 				I2CBMTO_BIT | I2CBMIS_BIT)
-#define I2C_ADDR_MSK		0xFF
-#define I2C_MSB_2B_MSK		0x300
 #define FAST_MODE_CLK		400
 #define FAST_MODE_EN		0x0001
 #define SUB_ADDR_LEN_MAX	4
@@ -371,16 +366,12 @@ static s32 pch_i2c_writebytes(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pch_data *adap = i2c_adap->algo_data;
 	u8 *buf;
 	u32 length;
-	u32 addr;
-	u32 addr_2_msb;
-	u32 addr_8_lsb;
 	s32 wrcount;
 	s32 rtn;
 	void __iomem *p = adap->pch_base_address;
 
 	length = msgs->len;
 	buf = msgs->buf;
-	addr = msgs->addr;
 
 	/* enable master tx */
 	pch_setbit(adap->pch_base_address, PCH_I2CCTL, I2C_TX_MODE);
@@ -394,8 +385,7 @@ static s32 pch_i2c_writebytes(struct i2c_adapter *i2c_adap,
 	}
 
 	if (msgs->flags & I2C_M_TEN) {
-		addr_2_msb = ((addr & I2C_MSB_2B_MSK) >> 7) & 0x06;
-		iowrite32(addr_2_msb | TEN_BIT_ADDR_MASK, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_hi_from_msg(msgs), p + PCH_I2CDR);
 		if (first)
 			pch_i2c_start(adap);
 
@@ -403,8 +393,7 @@ static s32 pch_i2c_writebytes(struct i2c_adapter *i2c_adap,
 		if (rtn)
 			return rtn;
 
-		addr_8_lsb = (addr & I2C_ADDR_MSK);
-		iowrite32(addr_8_lsb, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_lo_from_msg(msgs), p + PCH_I2CDR);
 	} else {
 		/* set 7 bit slave address and R/W bit as 0 */
 		iowrite32(i2c_8bit_addr_from_msg(msgs), p + PCH_I2CDR);
@@ -490,15 +479,11 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 	u8 *buf;
 	u32 count;
 	u32 length;
-	u32 addr;
-	u32 addr_2_msb;
-	u32 addr_8_lsb;
 	void __iomem *p = adap->pch_base_address;
 	s32 rtn;
 
 	length = msgs->len;
 	buf = msgs->buf;
-	addr = msgs->addr;
 
 	/* enable master reception */
 	pch_clrbit(adap->pch_base_address, PCH_I2CCTL, I2C_TX_MODE);
@@ -509,8 +494,7 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 	}
 
 	if (msgs->flags & I2C_M_TEN) {
-		addr_2_msb = ((addr & I2C_MSB_2B_MSK) >> 7);
-		iowrite32(addr_2_msb | TEN_BIT_ADDR_MASK, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_hi_from_msg(msgs) & ~I2C_M_RD, p + PCH_I2CDR);
 		if (first)
 			pch_i2c_start(adap);
 
@@ -518,8 +502,7 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 		if (rtn)
 			return rtn;
 
-		addr_8_lsb = (addr & I2C_ADDR_MSK);
-		iowrite32(addr_8_lsb, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_lo_from_msg(msgs), p + PCH_I2CDR);
 
 		pch_i2c_restart(adap);
 
@@ -527,8 +510,7 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 		if (rtn)
 			return rtn;
 
-		addr_2_msb |= I2C_RD;
-		iowrite32(addr_2_msb | TEN_BIT_ADDR_MASK, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_hi_from_msg(msgs), p + PCH_I2CDR);
 	} else {
 		/* 7 address bits + R/W bit */
 		iowrite32(i2c_8bit_addr_from_msg(msgs), p + PCH_I2CDR);
-- 
2.45.1.3035.g276e886db78b


