Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C35C021A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUvfNbLjfNmcAAGaK7cUPCvul+MKztHjHOVR7K+8/xU=; b=tGT7TmFzdMYzPt8mBrgwmrjAzR
	IARhCYeb4lha1CxLTgwGQNkuP847NCi7E7NdgTyv0SfvUpurE1cLdrZAK7DajtvWfKiYuEwY4FxMT
	rFisWiDIPauqNGBZMzYg4R0o12+9k+uU/J/nz8I0Qln4iJSwaWF8/ZJ6h6orL5mRSJ7Jhzqfb8ma1
	2RDpUOSDrNMHiYTPwXMebIgq3TXPk8XQ+em0g5+zQxeGHMRusmsRNKVSnq5layLuCLj1Iz6AzvrFv
	r8zyeaJJYtU2XOVCxOGB7VGm64RLCye6MIbmb2b883Mt3t3Xkj1iiD96xRl72lCNZ2L3GE7NY0ohw
	cGrKisFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIK-0000000BL3J-2MbE;
	Thu, 13 Feb 2025 14:34:24 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZvZ-0000000BGme-3wCO;
	Thu, 13 Feb 2025 14:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455855; x=1770991855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ctb+xk7MY+w2rTHBydALLPpKRzkmBYWDd9xLRSlOFgk=;
  b=WBQt0zzYzvzpfCBzeA3/UBqv9yd9u2PjfTwQ377CDPVpVRLNZ8WBYAL3
   aBXgpaWSlD+wsNalNUtXXTuG1cPxm0o0AwCqOk8zqVG5ASEuueTunB++M
   63iP6co2K1QfRr4DsXe2gz96O6QQWm0X/43YXczhNUQUcOVfW5f6UFNTq
   3VEcgoKTvRxJkjjAR2/2VNHYpXt9rSZFhV1Q5BDjUSLOny6lUHAXSRbsi
   IBy90Htev8ujueuD4s56IbjCGMWJ5cn+biCsnM7ARMc/TTn7BnbQpDLUb
   jRvyVZcvZ0+xHzaLpq982kSmsJ08+euDaoIooDM2YXE2vKTFH4XKCx79b
   Q==;
X-CSE-ConnectionGUID: myM5lEjpTtOEeBFMWEDJ0w==
X-CSE-MsgGUID: oKdNbkJbQbK57McpCM29VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40280880"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40280880"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:53 -0800
X-CSE-ConnectionGUID: PFagJQ/uTyy19AXdvQFGPQ==
X-CSE-MsgGUID: xtLFa7DZSjSggc3zBYFKzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113682998"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2025 06:10:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 623E1322; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 04/10] i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:18 +0200
Message-ID: <20250213141045.2716943-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061054_051409_00D04BC6 
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

Use i2c_10bit_addr_*_from_msg() helpers instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-brcmstb.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 00f1a046e985..5fa30e8926c5 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -414,23 +414,22 @@ static int brcmstb_i2c_do_addr(struct brcmstb_i2c_dev *dev,
 
 	if (msg->flags & I2C_M_TEN) {
 		/* First byte is 11110XX0 where XX is upper 2 bits */
-		addr = 0xF0 | ((msg->addr & 0x300) >> 7);
+		addr = i2c_10bit_addr_hi_from_msg(msg) & ~I2C_M_RD;
 		bsc_writel(dev, addr, chip_address);
 
 		/* Second byte is the remaining 8 bits */
-		addr = msg->addr & 0xFF;
+		addr = i2c_10bit_addr_lo_from_msg(msg);
 		if (brcmstb_i2c_write_data_byte(dev, &addr, 0) < 0)
 			return -EREMOTEIO;
 
 		if (msg->flags & I2C_M_RD) {
 			/* For read, send restart without stop condition */
-			brcmstb_set_i2c_start_stop(dev, COND_RESTART
-						   | COND_NOSTOP);
+			brcmstb_set_i2c_start_stop(dev, COND_RESTART | COND_NOSTOP);
+
 			/* Then re-send the first byte with the read bit set */
-			addr = 0xF0 | ((msg->addr & 0x300) >> 7) | 0x01;
+			addr = i2c_10bit_addr_hi_from_msg(msg);
 			if (brcmstb_i2c_write_data_byte(dev, &addr, 0) < 0)
 				return -EREMOTEIO;
-
 		}
 	} else {
 		addr = i2c_8bit_addr_from_msg(msg);
-- 
2.45.1.3035.g276e886db78b


