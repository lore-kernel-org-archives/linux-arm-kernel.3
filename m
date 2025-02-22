Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30718C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 23:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/zujhcm9qd+jkKX4xcD1vV7CqxNf3l6ZPiM36RzLDU=; b=HBHQZSLOci2H5cDjsZ+tYCbegN
	kxzLs7vFiZh8Va1OILEU3SwoibkMNEJjVW21RWpnWAPl4slWg3Y0cYtspra13TPjwdRBO9Pv/IodI
	IusDfSWEd8oQ7bJIQyfiMLQ1TaBHZupx/9bfNltqxe6o7CxtUQ8X9vrWTXfaZGFsN8zHJGY204o8v
	XWhYFJBbnECA+z9UD/pez8D/Wm00DV9V94iyB3Knazztyfhnj/CtaOCae4VkyMLGUb8rBLSt+2Zy/
	D9mE/SWRhWlPcpmNRzNvWi7yxQEXnu4ukSCTk9Tp4MhRXjqqBuYRxfptcyGWY03j7JF1eet8taHv0
	cN3d20iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlyVc-000000098n9-2XhD;
	Sat, 22 Feb 2025 23:02:08 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlyU8-000000098QU-1cBd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 23:00:37 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740265230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G/zujhcm9qd+jkKX4xcD1vV7CqxNf3l6ZPiM36RzLDU=;
	b=Z1JaS5f7UPGwX9kTebeq3QY6oV24hx5IwxxaqoqwtVPpu4G55btBgGjGq5bqlC9laFdrd8
	5DlmI7ebFewcMd8pgO+Plf9OEAoT4lxcAK93kUPLpIwbw/onh5yo8qvLjZXwWbuUeiPAmH
	2p2uuA8+bUxAANaT7beT60Whgk4GU4A=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: atmel: atmel-classd: Use str_enabled_disabled() helper
Date: Sat, 22 Feb 2025 23:59:25 +0100
Message-ID: <20250222225925.539840-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_150036_661800_3F52903A 
X-CRM114-Status: UNSURE (   8.42  )
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

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/atmel/atmel-classd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index ba314b279919..1f8c60d2de82 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/string_choices.h>
 #include <sound/core.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
@@ -275,7 +276,7 @@ static int atmel_classd_component_probe(struct snd_soc_component *component)
 	dev_info(component->dev,
 		"PWM modulation type is %s, non-overlapping is %s\n",
 		pwm_type[pdata->pwm_type],
-		pdata->non_overlap_enable?"enabled":"disabled");
+		str_enabled_disabled(pdata->non_overlap_enable));
 
 	return 0;
 }
-- 
2.48.1


