Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EF9C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywv536guZWyP/Lc9tX7tX/h7w5n/JNLArjRwgvxbIig=; b=c0I78th2R8DcFfgD7R6X7LVFLM
	XGP8fAaQyv2dyiiUo4JHx5WtxvwynVgUJGlOa4zqEgoBOLN0+jJWtYZqscdPRVLmcvIu2r0WI7vId
	FcGB4QfnZVGWeUPGvfsKpxUFTuMbI76oJpEZPumtFTTKZmU5o5V9bG17N8rkqUhT7Yf8UDWBqxqyJ
	+tEIkLam6dEk3YsWv+1iVX+YRoDKCXKU+8qLOwvODhD7ABdts9EXByc1t2248W4sO7e8HFIVk+t4I
	UQbyRoY4AL4TL70+K3Oj300G49+H9xNMNoTgAcHAvCeNrpGG0sezVEjHCP0QD4+y2CIRPqd+rDYUz
	hcuEUmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGC-00000008EVJ-3RMK;
	Wed, 12 Feb 2025 17:10:52 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFge-000000086HD-3QFt;
	Wed, 12 Feb 2025 16:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378049; x=1770914049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lw0AQ9Rpd28XddSfg/O8nWXU4S88r7p5CG7C4eayPmU=;
  b=PlQacMNz8fboZxzi8oU4IKGff+SxvqjsWSx9GVMAhhYkJcK03Ua/oFRN
   c/ZF5GxHO66cQpXoTmBpptnMSUu0hESmYRprdZx2gb+oSeE+p/Hd11wOR
   bBTJO3mvMRTAfo3auYItCHw90hdoJNNa5vZARQBkzj6W6CNBRx/kT/qfg
   rMRlHjNL9Gl4mnwJQiSWacGYPKLrrOnBAkeSe6XHZuRzy81O26BjK4Nhw
   k4Q1GfMaL8RaGuxU4an+cZ+0IuWxCBCAYd3Fz8AsUIJ2sq5nWMchQa/Zb
   c6yYRbVz4/ceP9ni3VdBu3uDzN3iq6DEFRe0griq9nyR681yD4+cD+eCy
   Q==;
X-CSE-ConnectionGUID: TkpBu8/ARjGgv0nYRYkgYw==
X-CSE-MsgGUID: 25TpQSvAQr2HzyHCgV8JwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39969203"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="39969203"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:08 -0800
X-CSE-ConnectionGUID: pHECftlpSbC3O2TFvy+LFw==
X-CSE-MsgGUID: RnMIYfAdRvS/SfwDNyDA1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143815131"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2025 08:34:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D3A3431C; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
Subject: [PATCH v1 4/8] i2c: eg20t: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:29 +0200
Message-ID: <20250212163359.2407327-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_083408_892714_23D991C9 
X-CRM114-Status: GOOD (  11.46  )
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
 drivers/i2c/busses/i2c-eg20t.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 4914bfbee2a9..20151408bf9c 100644
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
+		iowrite32(i2c_10bit_addr_from_msg(msgs), p + PCH_I2CDR);
 		if (first)
 			pch_i2c_start(adap);
 
@@ -403,8 +393,7 @@ static s32 pch_i2c_writebytes(struct i2c_adapter *i2c_adap,
 		if (rtn)
 			return rtn;
 
-		addr_8_lsb = (addr & I2C_ADDR_MSK);
-		iowrite32(addr_8_lsb, p + PCH_I2CDR);
+		iowrite32(msgs->addr & 0xff, p + PCH_I2CDR);
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
+		iowrite32(i2c_10bit_addr_from_msg(msgs) & ~I2C_M_RD, p + PCH_I2CDR);
 		if (first)
 			pch_i2c_start(adap);
 
@@ -518,8 +502,7 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 		if (rtn)
 			return rtn;
 
-		addr_8_lsb = (addr & I2C_ADDR_MSK);
-		iowrite32(addr_8_lsb, p + PCH_I2CDR);
+		iowrite32(msgs->addr & 0xff, p + PCH_I2CDR);
 
 		pch_i2c_restart(adap);
 
@@ -527,8 +510,7 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 		if (rtn)
 			return rtn;
 
-		addr_2_msb |= I2C_RD;
-		iowrite32(addr_2_msb | TEN_BIT_ADDR_MASK, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_from_msg(msgs), p + PCH_I2CDR);
 	} else {
 		/* 7 address bits + R/W bit */
 		iowrite32(i2c_8bit_addr_from_msg(msgs), p + PCH_I2CDR);
-- 
2.45.1.3035.g276e886db78b


