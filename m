Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B92C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfuQxXQBzQdiG8pcrRLYit+FZNGH7Vv2RSH2qXkFpTY=; b=069wILdUP14YBPBkki02K7v3p8
	EMC82OPF9B53kL5DFBYKtx7eUvJe0lnfHQXBjNPAazD+eT6ZkpxovkLPdQ1rVYLX0Uhr3H+VdkHBw
	Ay2icvD9cVGwbH9C/sj0SuYtzQ+pCcafPvMSYcUBHBeyzCRgF2ooErdM+G/Wa+LysYU4oF3D//aV0
	OM3/whN0+ol5Ib7tGgtEOkxmuBChsgAkN6bhgBAY7uIT3owHbNmNRbIWmxpG0UvrohIsGIE+4sWX8
	7o7FXNFgeC71wZow0XdTjDE6uu1vU6RgEMyZgkmozOR9tHQA/uVeGscBXoO/qwiIT7WHOl/jLQRBs
	edbJq8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIS-0000000BLFR-0KVc;
	Thu, 13 Feb 2025 14:34:32 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZvf-0000000BGqP-0Shw;
	Thu, 13 Feb 2025 14:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455860; x=1770991860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LW/jlQRmBR0/tm3s8iRoswrCxeV0lv1udBQdBgsISMA=;
  b=UueNSAInowIuXD7SvqcEsI15mGk0vIOFYymU2wY+rBp3RIKhxWH/hsl/
   yfNXF+sPAYF5ntM/jqNBjIk4iE+2PmDj0x5OV3xO3tj0MkAIC3Iv7F1tW
   g7iKvq+Dj8ihQgQfwo/144pMt4tqkM1NPCHj9xab7ClwAO2Ljrezq4EU0
   3ZNDBMNwNTVctGAcopP7SpMzuGd33k4jQvfBHRYDMR2Gw1SIy7mE8g0g0
   YuqbYQt52GgaKNXQoNX2qOFOvvngv4ItDnbxpqqdmsRJ2XWrlwhYFTQtO
   DyrHiEd/1PTxvjv4XRO631mOOml/RcVLJuS7sUQclb+MztI8vFSmvMKtV
   g==;
X-CSE-ConnectionGUID: 6HH1jissTaGxTnDo3YSVgQ==
X-CSE-MsgGUID: QP/OmcpFTFipRVR3r318yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40022155"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40022155"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:59 -0800
X-CSE-ConnectionGUID: 1FUUSg7TR163ZoOY/IYeZw==
X-CSE-MsgGUID: DbFEjdE7RMe9DivjowJdUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117777627"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7CED648C; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 06/10] i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:20 +0200
Message-ID: <20250213141045.2716943-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061059_193834_8CAF0CBD 
X-CRM114-Status: GOOD (  11.97  )
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
 drivers/i2c/busses/i2c-kempld.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index 212196af68ba..9b4c7cba62b6 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -115,9 +115,7 @@ static int kempld_i2c_process(struct kempld_i2c_data *i2c)
 	if (i2c->state == STATE_ADDR) {
 		/* 10 bit address? */
 		if (i2c->msg->flags & I2C_M_TEN) {
-			addr = 0xf0 | ((i2c->msg->addr >> 7) & 0x6);
-			/* Set read bit if necessary */
-			addr |= (i2c->msg->flags & I2C_M_RD) ? 1 : 0;
+			addr = i2c_10bit_addr_hi_from_msg(msg);
 			i2c->state = STATE_ADDR10;
 		} else {
 			addr = i2c_8bit_addr_from_msg(i2c->msg);
@@ -132,10 +130,12 @@ static int kempld_i2c_process(struct kempld_i2c_data *i2c)
 
 	/* Second part of 10 bit addressing */
 	if (i2c->state == STATE_ADDR10) {
-		kempld_write8(pld, KEMPLD_I2C_DATA, i2c->msg->addr & 0xff);
+		addr = i2c_10bit_addr_lo_from_msg(msg);
+		i2c->state = STATE_START;
+
+		kempld_write8(pld, KEMPLD_I2C_DATA, addr);
 		kempld_write8(pld, KEMPLD_I2C_CMD, I2C_CMD_WRITE);
 
-		i2c->state = STATE_START;
 		return 0;
 	}
 
-- 
2.45.1.3035.g276e886db78b


