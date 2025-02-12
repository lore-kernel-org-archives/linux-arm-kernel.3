Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC3CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKEe+oyK7NwEIVSAMcW9Afi9HIBfzodNOT64RP3a+hY=; b=3Dclol0LQZKSUSu1Ugf770C8DY
	NNEwP7bw/aoVZmYqPGVlCmlbGJuFENvKE3TgSpiF+KkZJoWu9WbMX1yP/blKiwEsDJfrsyZRip/4x
	QYBvdQtciBpa5oPTk6Ck058VOniArvnNpuJ1rLVPEQoAu1/+ij6yO6RTy3ErBe8UU4TnISisgNdDY
	5X8E7kZkR1gbvOIcLBBk9i9s0+ValFBexHuYYtNC6s/MWllZpOFaTAC5tNBn9c0AnJzDjzcxypC87
	hmpi6A8GY/Sx6E0E0/H3HOO6aC2UEfiuti1bur+gzSxxPW9ORqT1pl9bnshc5OdaoExikg3NaJy2/
	k1Ekv/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGB-00000008EUa-3jiX;
	Wed, 12 Feb 2025 17:10:51 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFge-000000086HB-26Sa;
	Wed, 12 Feb 2025 16:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378049; x=1770914049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2DuNQD3CiVM6sMHqctlFn9JOuTyVK4PWMPLxN9OjiMU=;
  b=Xmb3aIq7iqZaTVUDcbchT9/SLHsSpXDFK5Ikp1ysUMCxFKqM0u8IqDvn
   4ru03VNicuLUH487SXe4CDrPNyWdn1rfplHbA+FbN+0r+B0DPemWE6T2y
   9jjTwXElgy0js+iIZcmJdpTXaERJD5bC4JYzqsYgdGKjMaROeoSWkA3OH
   4XzmB4jbZ9oyQVY2JXBquKlqdvbwHVqqhrs4NpWAsWiIIl1c9ys0WXUsM
   p4l0udmzz9eXsLsBAWGK56Nxa4kJgkrggpIbIKLaHQ5HaLvBO392ONRqw
   2gtT0pYK+WcNQx94riAB68tXLdNWlhXxfkyPZ+zOiX3/Et5lc/7rP6HCW
   Q==;
X-CSE-ConnectionGUID: JBgqeCjnTtiEBsPXQvXJiw==
X-CSE-MsgGUID: 9103m6xPTrK8yNAinVobyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032345"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032345"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:08 -0800
X-CSE-ConnectionGUID: KXHlTlg2SpWG16syJE4uWQ==
X-CSE-MsgGUID: 5M5XTvAcTKCeP3lw6CTN9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879144"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B28651FD; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
Subject: [PATCH v1 2/8] i2c: axxia: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:27 +0200
Message-ID: <20250212163359.2407327-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_083408_582971_537C89D4 
X-CRM114-Status: GOOD (  13.00  )
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
 drivers/i2c/busses/i2c-axxia.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index 741ee4636759..bee56e33531b 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -255,11 +255,6 @@ static int i2c_m_rd(const struct i2c_msg *msg)
 	return (msg->flags & I2C_M_RD) != 0;
 }
 
-static int i2c_m_ten(const struct i2c_msg *msg)
-{
-	return (msg->flags & I2C_M_TEN) != 0;
-}
-
 static int i2c_m_recv_len(const struct i2c_msg *msg)
 {
 	return (msg->flags & I2C_M_RECV_LEN) != 0;
@@ -439,20 +434,10 @@ static void axxia_i2c_set_addr(struct axxia_i2c_dev *idev, struct i2c_msg *msg)
 {
 	u32 addr_1, addr_2;
 
-	if (i2c_m_ten(msg)) {
-		/* 10-bit address
-		 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
-		 *   addr_2: addr[7:0]
-		 */
-		addr_1 = 0xF0 | ((msg->addr >> 7) & 0x06);
-		if (i2c_m_rd(msg))
-			addr_1 |= 1;	/* Set the R/nW bit of the address */
+	if (msg->flags & I2C_M_TEN) {
+		addr_1 = i2c_10bit_addr_from_msg(msg);
 		addr_2 = msg->addr & 0xFF;
 	} else {
-		/* 7-bit address
-		 *   addr_1: addr[6:0] | (R/nW)
-		 *   addr_2: dont care
-		 */
 		addr_1 = i2c_8bit_addr_from_msg(msg);
 		addr_2 = 0;
 	}
-- 
2.45.1.3035.g276e886db78b


