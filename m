Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6EBC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEQuIFOe+DS2nZiwFyTWFuDynfnlJeQh363DJwGz6cU=; b=4V0LwORu0pjo7nSMu4uZM+8uxR
	Fz5ulXg+HDO2N+UOnbtonUz38Cevi2Vu2nLPWi982r5nC30Mrgw43cDmEOgm0ARcDmMCtVhem37Pr
	kIZjaBgz9AYiHvD4la9Eo+O9id5QidRTaf9NRuhOc37faRS/Hqiie7c3TNgRmO2L36AXjL9IdtxbA
	4SCDuY6sY+XPj0W/6YjjlXaFaZK2MKzgsqIfgw3t1K8Ot3GeHxCI/L3zbL+He6eoLLza6+lu20qax
	zqDJYPQMEw1Tt88udedr55Tce+S0/avH2ZuvrxivD/DzoiezSDKsVrEUb9IfNJUuzVewlbmlZcYki
	qAR0de1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIO-0000000BL95-0oTb;
	Thu, 13 Feb 2025 14:34:28 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZvc-0000000BGog-2JeK;
	Thu, 13 Feb 2025 14:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455857; x=1770991857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w5OIcmlLWZ5owUnVqwY4hOy9GeQY3Ik9w5ZZ4hRMggA=;
  b=NNRQbSGBio+DK2HnOwXG2Ik2ZJknKh8Q8qOa/v1Rww793v4Dq5Ztfx+v
   G+E8hmLaDmQ7jzqeHESlvPt/DLhvFMUUcN3xtkpfIIxCLnhgVUzJ5RKW/
   fZjVX0oq0sand5ZiFr87rdveFtUttfzlCAQ0+Cs4lUmamqQXTMsB5ovao
   7cvt3HW4Atn+Rx1zSJ7j9smk5A8/NeJIrJilRRaBtHKtqK3u2zZs7pu4H
   s2AiXI+iSbg4+BVHPpeEKFkroVO1wM/7EaEjPMYw/Vpe+YeZD/HMnT0IB
   74CoHFKLkmHY0VkKk2jgqBw0RLFnZ5NgAxYtcfYQOlpmCqSfDm1t8uUfD
   g==;
X-CSE-ConnectionGUID: VbzeXLdqSbKPGkyouL0a8w==
X-CSE-MsgGUID: U3UhPOjaRc64w5MmPRKkcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40273358"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40273358"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:54 -0800
X-CSE-ConnectionGUID: RpVy3KmLSyCp1ahol+ineA==
X-CSE-MsgGUID: DCwuJTz5RTSR209KgyRuBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113815327"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 06:10:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 54C1E31C; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 03/10] i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:17 +0200
Message-ID: <20250213141045.2716943-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061056_635629_3255A3E4 
X-CRM114-Status: GOOD (  11.23  )
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
 drivers/i2c/busses/i2c-bcm-kona.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 340fe1305dd9..9d8838bbd938 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -471,12 +471,12 @@ static int bcm_kona_i2c_do_addr(struct bcm_kona_i2c_dev *dev,
 
 	if (msg->flags & I2C_M_TEN) {
 		/* First byte is 11110XX0 where XX is upper 2 bits */
-		addr = 0xF0 | ((msg->addr & 0x300) >> 7);
+		addr = i2c_10bit_addr_hi_from_msg(msg) & ~I2C_M_RD;
 		if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
 			return -EREMOTEIO;
 
 		/* Second byte is the remaining 8 bits */
-		addr = msg->addr & 0xFF;
+		addr = i2c_10bit_addr_lo_from_msg(msg);
 		if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
 			return -EREMOTEIO;
 
@@ -486,7 +486,7 @@ static int bcm_kona_i2c_do_addr(struct bcm_kona_i2c_dev *dev,
 				return -EREMOTEIO;
 
 			/* Then re-send the first byte with the read bit set */
-			addr = 0xF0 | ((msg->addr & 0x300) >> 7) | 0x01;
+			addr = i2c_10bit_addr_hi_from_msg(msg);
 			if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
 				return -EREMOTEIO;
 		}
-- 
2.45.1.3035.g276e886db78b


