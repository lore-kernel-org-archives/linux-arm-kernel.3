Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4642C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRzRh5NUzGvp8Emh2XYNG2PkxOx6HnXFHxrMYQBd+nQ=; b=bqeMgPGwGf++Lh3lSLte5ceM1H
	u7zLCgWWer1bq3UdI8mPPwcZIR4CdXLffP17O8JeQPVkH0RzChql9l0CWW3NP+JKmLze0GbRhkuf8
	t9yOrPgUnkN8QO+DUMvKfyfks1QuY/Tpk6B0fGgD4rhAsrbPXm2OgW+VN57C0CqBs8DMrRq5CIlB0
	iy8pz0y1TWyJmza/2uUy36fouRGfsoTtg9FZpNI98bBDv8GoqQjtu+F3//e89raGmX21hLswo6XYB
	UA0rdJIeER8SG+qnaZ6ywgHcrtnAd1SjBp3tvO8qYmVLElRLj12Gvp6lm25tWKxfuQKIu0OvEpd9d
	teVFioeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIW-0000000BLNp-00yQ;
	Thu, 13 Feb 2025 14:34:36 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZvf-0000000BGqj-3MTA;
	Thu, 13 Feb 2025 14:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455860; x=1770991860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1jajp4kJf0AGawBV2YpqEpiYtshZwSib+DRflhjaZMg=;
  b=fuXLthHCTEtfTDb14CCwhwcAIlKfMm+VRmnuKmOI75zM+QAYFjbl2Bj9
   Ola2HvdMlkp2Oex+VMZQ+ucSR2LZt4JdyH3goaM1ais6QuqCxRqHdLFj9
   zjgb8xpP1m6VVJT7CIUeOu3YGsLqeR5XNEUmCCdiXpwjka5oKXUW5hJGj
   4Q90G8Hd+Rii+nDODObWskfrUr/Drmw064rvLzjzZGfGTZzfk7bSacMx+
   1y0qJgFSxkjd9loS1zfrdJA6yaEfMBh5JOpK894tKcyxFb+UcFj9czLq4
   KOGHEBSEu2CGmNBxx1QGg0IKJALZmTg0I31iqryw7mCvz6xRlKqKvYE+e
   Q==;
X-CSE-ConnectionGUID: +9TwKcNBR+62EUllv7FfgQ==
X-CSE-MsgGUID: j+UFzu2LQCGj+TyfpBA4Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40190568"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40190568"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:59 -0800
X-CSE-ConnectionGUID: +puV+GHOQzSmmh3V0YhlCg==
X-CSE-MsgGUID: f8x//h/JTNyLD4hu3lbJmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118162152"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8995F4AE; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 07/10] i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:21 +0200
Message-ID: <20250213141045.2716943-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061059_882554_88A7DD18 
X-CRM114-Status: GOOD (  10.45  )
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
 drivers/i2c/busses/i2c-mt7621.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 2103f21f9ddd..0a288c998419 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -164,22 +164,18 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		/* write address */
 		if (pmsg->flags & I2C_M_TEN) {
 			/* 10 bits address */
-			addr = 0xf0 | ((pmsg->addr >> 7) & 0x06);
-			addr |= (pmsg->addr & 0xff) << 8;
-			if (pmsg->flags & I2C_M_RD)
-				addr |= 1;
-			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2);
-			if (ret)
-				goto err_timeout;
+			addr = i2c_10bit_addr_hi_from_msg(pmsg);
+			addr |= i2c_10bit_addr_lo_from_msg(pmsg) << 8;
+			len = 2;
 		} else {
 			/* 7 bits address */
 			addr = i2c_8bit_addr_from_msg(pmsg);
-			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 1);
-			if (ret)
-				goto err_timeout;
+			len = 1;
 		}
+		iowrite32(addr, i2c->base + REG_SM0D0_REG);
+		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len);
+		if (ret)
+			goto err_timeout;
 
 		/* check address ACK */
 		if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {
-- 
2.45.1.3035.g276e886db78b


