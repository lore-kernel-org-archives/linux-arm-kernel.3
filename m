Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA65C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 18:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ddo6/t51Ad7jbh1RDELKsmA+85tSYxxw1JYFqZMDRG0=; b=X9tAUFmbnFec2EBqTvq+DCLg5o
	KDZ+HEvmfTi5N/NnooQgkpSPD/rO+RQW+I6X1kHnUbJ7x4SfRrJRxvcJwR0qjvu+VhT/m0CBjEtUG
	bOs8VL2i0h61SeWX0TNqpifEhJ7p2HcKI41CEGfTk+g339sjXZoaYocBGNFjg+YZKDCqf4/q/TVpl
	D4Gc2p7u9KVqIRN+gVmRHMnNib94TpPJog31+LiTIg2zbjoxH//S/ebIh5LdU6j8K50cfjf8EYjkJ
	pkIV5rn3wMJfe9Lx82VHkppiVC+wxCGn2o0rI1VafKDLABLiNHtRSydkC6ikrSLkecLKX+F0IGh7V
	1kBV9wKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAeI-00000001rYq-3fqm;
	Thu, 22 May 2025 18:28:10 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAFQ-00000001omW-2ZsG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 18:02:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747936926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ddo6/t51Ad7jbh1RDELKsmA+85tSYxxw1JYFqZMDRG0=;
	b=qpSD4Ag252jeNzMrw9zTEucNN68Txb6+CBaeVOjfgNFG2daUT9aLpuQH5erDSoqWwAS8Nc
	lsInP/dzY5RrdC+n88bNlQhps5A/JrTKMZmq0tKFIG7fAWgHvPdvpse16enUOtCv77qDPs
	fRu+xVqhxafjsjyx6w8lCKmKC52J0f4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: atmel: Replace deprecated strcpy() with strscpy()
Date: Thu, 22 May 2025 20:01:09 +0200
Message-ID: <20250522180111.12144-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_110228_830876_7B002F3E 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

strcpy() is deprecated; use strscpy() instead. Use strscpy() to copy the
long name because there's no string to format with sprintf().

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/atmel/ac97c.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 84e264f335ca..693d48f08b88 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/mutex.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/io.h>
 
@@ -589,7 +590,7 @@ static int atmel_ac97c_pcm_new(struct atmel_ac97c *chip)
 
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	chip->pcm = pcm;
 
 	return 0;
@@ -748,9 +749,9 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 
 	spin_lock_init(&chip->lock);
 
-	strcpy(card->driver, "Atmel AC97C");
-	strcpy(card->shortname, "Atmel AC97C");
-	sprintf(card->longname, "Atmel AC97 controller");
+	strscpy(card->driver, "Atmel AC97C");
+	strscpy(card->shortname, "Atmel AC97C");
+	strscpy(card->longname, "Atmel AC97 controller");
 
 	chip->card = card;
 	chip->pclk = pclk;
-- 
2.49.0


