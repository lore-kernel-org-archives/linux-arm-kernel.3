Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24865D61011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y/GSKv8rEj9YBhxyjWOc13pk8rgjTYZW2bIlAYxHqy0=; b=qABRBfAiNbOQxVzP9o6LAS8P6E
	ECs8VMPsuoz6nPsqxgtsLoP8yPMGI9otVfdNtJaAsZaDT0dxWFW8HuRyX+ByD8O0WBJu7Flk8juOH
	DCvN8TZgkIShS7BtkdAEY+1bUd+XEFpcaCXWrYX0qn7EqX+7eyI+Hd8xJayPHUtU31oz1ghXAsOwW
	xQS5ojNSegt7gZri27xywCI23Kw6MkhZqzXGENgk/tgtJyd23N09OTbMkdEHJw79TIGEiTq9CILSX
	6Lzc3v03+UvKcKvufSnVAXGojyPvlLETeHfqPD6FnfpXwiycymagCVgTRsjg0NKEG080qw25mNeoe
	F0UeZOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlS9l-00000000A9R-1z1A;
	Thu, 29 Jan 2026 13:33:57 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlS9i-00000000A96-1F7k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 13:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769693634; x=1801229634;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yxfhhn0nRCfHcjiprrgl6wNRy+BkMZll3z6YEBC1fuk=;
  b=ee+QIrEcWSsr1x6ZU+SQ+I9kThbYx4hQ2Y9XLNQjxm4C+oDRNc5jdvqC
   Y+Vf+yAGPhH9iqYzH2sCGnz5jLF2MEZN3ZIwilfxFm/7LUZfmwhDzha87
   BkZE6dhTVdsk4wYhKGKANINTUBatEOsh6u73yShsT4F7uvYtOJ8t1NPau
   c9f6Is4eMqEINKhJYM24D0Qre0GXGgqXvGGitmreJSElL/FlZSS7cJYxW
   6A6ekZsL6MmhvGblqR+Awfvxd2kOh+gNQaX1bnGp/IePgzDh2y+icFRXC
   9LzNQZoZ5V0UpA4gHkxeZwYl1lBsJC9P8aaRppLaHhVdUiVqdHu2JdRX6
   A==;
X-CSE-ConnectionGUID: iyfU25SdSLGWpSzVeW3OPA==
X-CSE-MsgGUID: S/Lu7AqDQKadjG1QTNaEYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81662857"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="81662857"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 05:33:47 -0800
X-CSE-ConnectionGUID: xb/TTuU1QXS25X17zPl7eg==
X-CSE-MsgGUID: IcmP50VARzuOurnhpLzJIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208183835"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jan 2026 05:33:42 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 23B659B; Thu, 29 Jan 2026 14:33:41 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peng Fan <peng.fan@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Date: Thu, 29 Jan 2026 14:33:40 +0100
Message-ID: <20260129133340.302446-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_053354_376281_11A92290 
X-CRM114-Status: GOOD (  11.59  )
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

No need to open code the devm_gpiod_get_optional() wrapper.
Instead of checking for a certain error code, check for NULL.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/arm/pxa2xx-ac97-lib.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 1e114dbcf93c..47889f6003c1 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -330,13 +330,12 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 
 	if (dev->dev.of_node) {
 		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
-		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
+		rst_gpio = devm_gpiod_get_optional(&dev->dev, "reset", GPIOD_OUT_HIGH);
 		ret = PTR_ERR(rst_gpio);
-		if (ret == -ENOENT)
-			reset_gpio = -1;
-		else if (ret)
+		if (ret)
 			return ret;
-		reset_gpio = desc_to_gpio(rst_gpio);
+
+		reset_gpio = rst_gpio ? desc_to_gpio(rst_gpio) : -1;
 	} else {
 		if (cpu_is_pxa27x())
 			reset_gpio = 113;
-- 
2.50.1


