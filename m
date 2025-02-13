Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8319DC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPvANseAJIJT1iE8x9czCJx9Fw6QQJeU/+fdEZAFQBY=; b=PJfZsqudH2zlLeBRyP8zdksECN
	k1EQhClj1JzZiKF1ZZ0eLB2Z9gNAr20eyLbOP0FY5lQGRxLsh1Xn/w2VfwF9Sn1dXiwFLX/nFjFcr
	Zz0+RDofnEQ/R7MVtW19DKfKD1p+1+JPc6Z8hKTX9Q/8AGgO5d7V7zzJEIDEUvsqFpYsrTSB2CuRA
	YpGYaLzwASZcu1DZbOiKufu3xjQFvk8RQUK44LU95jZQDaQtqBIina4VI01Uo5NzrkeVw+1+0HVE2
	8wEJh+cj+pn0xbisLAlhScmoOmnyOKbwOhlFxSz+lJQpfaVVzZyJSXAivp6VRLxN47+pOWnqzP0e7
	riYb5WAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIZ-0000000BLUK-2O1t;
	Thu, 13 Feb 2025 14:34:39 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZvh-0000000BGqj-0GFF;
	Thu, 13 Feb 2025 14:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455862; x=1770991862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VA1tfbqQVZF5jK+NE8+kVijBTK5o1VLx6VaYd48u/1E=;
  b=iq7PF/fNiJev5id6TGOsi3z9Tr3zWGRtOE0QiaFvQqRL4tJzbmf7TuLQ
   lp973ENHqhQjfwdsjV3SdeXjbC6TwSGFxsMqlQfLjAV3AZ+E7A2nt0fmP
   8zyCSJL8UoKzXuX1zTURBbLhRaco/lHKhNMQ1kmHuubZsMfWP07+rx2sa
   YETfjmuS4Ut9/yq7QHk1j24+ZAATmQw1D3fpCiE8enzKRKQHa6orYazB8
   2iGVXtaQdUIM60etNv1GW8t/BABshPbbE1/kgCGurCDExTw7zFSKFSDx/
   O7jcFKYVsuVEPyEQkxDz4BIvgkCbRVfxZ9nn2bor4mJ9WHz+er5BLuguI
   w==;
X-CSE-ConnectionGUID: RcTMo2JeTKqWsK0ofxNTbA==
X-CSE-MsgGUID: /6O/7SNcStK0T0loTP5q6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40190579"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40190579"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:59 -0800
X-CSE-ConnectionGUID: CC5XQBZoRu+4nrrfc8HM9A==
X-CSE-MsgGUID: /UI5GoifQOepe8vvQPR4ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118162151"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A899058B; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 10/10] i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:24 +0200
Message-ID: <20250213141045.2716943-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061101_146384_0B6354C0 
X-CRM114-Status: GOOD (  11.75  )
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

Use i2c_*bit_addr*_from_msg() helpers instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 874309580c33..8fc26a511320 100644
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
-		drv_data->addr2 = (u32)msg->addr & 0xff;
+		drv_data->addr1 = i2c_10bit_addr_hi_from_msg(msg);
+		drv_data->addr2 = i2c_10bit_addr_lo_from_msg(msg);
 	} else {
-		drv_data->addr1 = MV64XXX_I2C_ADDR_ADDR((u32)msg->addr) | dir;
+		drv_data->addr1 = i2c_8bit_addr_from_msg(msg);
 		drv_data->addr2 = 0;
 	}
 }
-- 
2.45.1.3035.g276e886db78b


