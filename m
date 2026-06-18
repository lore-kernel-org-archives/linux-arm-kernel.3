Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512D6CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 14:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vIuAPLgALRdQhhwnYfCojQgf4QsTylmWqfXsAqojKl4=; b=e40KRB5jclkLnPfdyoGxL88hw2
	jwpGYAKI2TIPup6HVhMWuczQGUzgzgRoliZT6sHM+170zCjCzSFfZvkRCvgIs9KD7M/pYdzyL/0Co
	gX1Bva9XBPNxjROm4bmyND7VL9jb+98Z6RVzfvqdCz+H7Z8kJkHFOazT/L7EvAiliXEsXAlVAkdUR
	fow9Ssl09qW7q0nTcM6WIoUtTk9c3DQi4BwHFuI0yd33eNWa7GSaNN1K3oi1fiOzy9jSeXZSK8704
	APSc+AEbH+826F8PXWhCAIvlRVWEi3P7OlGIGI20EsF1f57idZ2AAwOzyuBIAOk8UqKReUFzN90vm
	9QrN8ysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDYq-00000001Q7N-1vCj;
	Thu, 18 Jun 2026 14:17:40 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDYl-00000001Q6v-2H3Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 14:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781792255; x=1813328255;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+VH0Lw0M21tcpHte4wL0B83y4owSz1NJvo/FVcUrwAE=;
  b=aLEnaYv1o/9WoKeAtNyXFQjixmdPcR3Q1Yrlil23SMkxTIBGR6FyhBtH
   ZO9eIiIUrSbMiBsuFBAK0ZN5Bjz7ocQKf/tDhBtcdxMFdPwDpyQDTViEV
   8p/dL0VJUOwAlZ+oymxJP4GOQ0Pp0BkBOI6EbgvxqAcWeu+eplFbn0pHh
   KAW8lJbeav82aEd9EKVrFBRERPPlAdKHlU20HHvox0ZKWiWHr7BDqSlFz
   JcU1XZD7TUgbTefW4L7VtUJ36LOl1eA2cUYDthYrkN70SAfhr5bBXKGuZ
   5wHrUuASXX3nzngjAiB5vi3fkPy1DBt3c2BcFIUy0Eyhi+T4nac5SOaeH
   Q==;
X-CSE-ConnectionGUID: WwcynxU2QayXhe9JT7YBiA==
X-CSE-MsgGUID: Y9kkWapsSNmD/cyj6s3MTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82632235"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82632235"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:17:34 -0700
X-CSE-ConnectionGUID: tvlBX8kmRjm/1HGX1ebZjw==
X-CSE-MsgGUID: IjMkPXYmRLeZEdWGyjwBDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="248442871"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 18 Jun 2026 07:17:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BE19698; Thu, 18 Jun 2026 16:17:31 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 1/1] i2c: nomadik: Use generic definitions for bus frequencies
Date: Thu, 18 Jun 2026 16:17:30 +0200
Message-ID: <20260618141730.3243303-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_071735_647241_CCBDD91B 
X-CRM114-Status: GOOD (  10.57  )
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

Since we have generic definitions for bus frequencies, let's use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index b63ee51c1652..404709179d73 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1050,9 +1050,9 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
 	if (id >= ARRAY_SIZE(nmk_i2c_eyeq5_masks))
 		return -ENOENT;
 
-	if (priv->clk_freq <= 400000)
+	if (priv->clk_freq <= I2C_MAX_FAST_MODE_FREQ)
 		speed_mode = I2C_EYEQ5_SPEED_FAST;
-	else if (priv->clk_freq <= 1000000)
+	else if (priv->clk_freq <= I2C_MAX_FAST_MODE_PLUS_FREQ)
 		speed_mode = I2C_EYEQ5_SPEED_FAST_PLUS;
 	else
 		speed_mode = I2C_EYEQ5_SPEED_HIGH_SPEED;
-- 
2.50.1


