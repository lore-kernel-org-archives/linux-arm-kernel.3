Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B73C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ax4LaGaBfrrkBkD2N8V65ujOE7hyKQm3t9uv6wB/UKM=; b=qcRV8bIPHYl2+0g3UtWZpb+EKm
	S9vJoL0aSGAVSQ0gvBBb786ShGTj/m5gkurAagUaS8vU2m/7XD91I7k5V3bi2h6hHWyIkz8nZyXJ+
	pRsxUFqM+1ad0HRL+YYc5ozpnlBFy0JEWVRmhHw4/IBiXbdQZXC83hG/h9TVFD/ssU1kX4re+GYGy
	ina+n3fLe8AM4fzdExb6hz+YFUHJA81apKDQJGhBYUOEyuHasH23p95p3fnQUMKwXCZvhStfSppEu
	ChgaaFjtu/rxdsXC5fCtdXavT2QIpbkD95DHq2g8pyENPVx2Amq4mf9eFEt4Z8YOXCRPU5atf9nOw
	oW4s4yRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIc-0000000BLYT-0kwP;
	Thu, 13 Feb 2025 14:34:42 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZvh-0000000BGrN-0y6B;
	Thu, 13 Feb 2025 14:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455862; x=1770991862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NuQBePCeibtx8uP9iufq1Kz+enaMxX19L9oTrmUixUQ=;
  b=Zv4MUgMnEz7eNiX8xegPfyLUySSGGwHx+mTcUuns5Vr/qqIENlBc7fIS
   RnTwD1F6dji5ZdcfA+kreN9+7UZI4Y6CDT0Uowx5go4sGSEdm1dtEniMq
   0QSKgnmpCknz/aUtr6yVJbk8dTaE5AMDHr0r+jad2Iw+bVWGfGnDz1LQq
   MTB2+uUSZuL2CRG1D0aXEKpCFDIiB9mm2a1cZGKsiet9JbJh2LB/LqUxx
   xM6bsM2pklPwxRauNXZ+5BkIe0OgNHVn4c/Pi0GwShq5sq+32lyAA6Cqb
   Xygp61rqdkqctZvTnmwOTY1shziRB9NzRmLKWVWEBuvO8cBM2cxwVHzO4
   w==;
X-CSE-ConnectionGUID: +t/aKahvS1yhlV/VRWuK9w==
X-CSE-MsgGUID: 8/lSgMx8R5CrrRZ9i7H42g==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40190589"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40190589"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:11:00 -0800
X-CSE-ConnectionGUID: Ozai6iqES8u4+I7UPbMlLg==
X-CSE-MsgGUID: wXVa540yT0SgcbkKIN8gyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118162153"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 940F74B0; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 08/10] i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:22 +0200
Message-ID: <20250213141045.2716943-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061101_313372_8137070D 
X-CRM114-Status: GOOD (  10.18  )
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
 drivers/i2c/busses/i2c-rzv2m.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index 02b76e24a476..53762cc56d28 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -287,20 +287,15 @@ static int rzv2m_i2c_send_address(struct rzv2m_i2c_priv *priv,
 	int ret;
 
 	if (msg->flags & I2C_M_TEN) {
-		/*
-		 * 10-bit address
-		 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
-		 *   addr_2: addr[7:0]
-		 */
-		addr = 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7);
-		addr |= !!(msg->flags & I2C_M_RD);
-		/* Send 1st address(extend code) */
+		/* 10-bit address: Send 1st address(extend code) */
+		addr = i2c_10bit_addr_hi_from_msg(msg);
 		ret = rzv2m_i2c_write_with_ack(priv, addr);
 		if (ret)
 			return ret;
 
-		/* Send 2nd address */
-		ret = rzv2m_i2c_write_with_ack(priv, msg->addr & 0xff);
+		/* 10-bit address: Send 2nd address */
+		addr = i2c_10bit_addr_lo_from_msg(msg);
+		ret = rzv2m_i2c_write_with_ack(priv, addr);
 	} else {
 		/* 7-bit address */
 		addr = i2c_8bit_addr_from_msg(msg);
-- 
2.45.1.3035.g276e886db78b


