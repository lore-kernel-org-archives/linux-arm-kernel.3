Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C2DCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=; b=Wuo1xdLZ6Rujj0r+JMA5/E1ewm
	VZyzYgi65Wl0tEo3Evyjk3sZqilsDna/PDa+N1+dSjbYZk9V1/NFJcQ2ICDeEYoL4A0AYzNJZpBSD
	oE9qIorX7vMjSW18wzSSAxlV6tTqLUK4bT/VbxNvujVFrZVjuam7BFEHhpALiqLNatQI/jYAcbv/G
	zylKLkJdiK0HvKD5t7wTzOvmzgRPVB+QUn0Azywr5Y5B/SSxWodseoydpyLL8eNnEAOufxHX/E/No
	WQMSgy+BdNncTCAAZSEsRf0LcFfHGknnpPXOn5Im1DzWl8XIJOChFsHc8qbkYCxz1UVqNOvy/dFPa
	UfocGjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLx-0000000ENoY-1nTC;
	Sun, 04 Oct 2026 06:05:41 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLu-0000000ENlB-2WbC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e4af975346so5233825ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 23:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093938; x=1791698738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=Xhw9w9Ox5IbsRDt53+FpUniHyUN8nAcVdExxwIlN5rl/IU4OCGbUQzhZK4GvgXbsyh
         h26WIgGZb7VgAQtSQ6W+67WTSYkHNZdF9Eg4BoULoyc7EVeMidMH0jd/SGOVz2tWGeF8
         1TEjnHavw5mAGZ66r6Kbaq5/xZb8ZogaA8N8flGTZBY9I6ankykbZp9sWXlYwFfs0CWy
         IMO4GZs0Vth4oHPophlFx4jsaoixS8IUFAORki0nnfa2EHx3ZPXj7MVzbmX6kVeCYoSl
         gFZ4lWci5A2qEu+F0Vsk2x57h2tgBQA6wYQzAWvK9lP+MJkdoJIpcYqeuutRSGH08Hmq
         Ri5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093938; x=1791698738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=GRtUYuomYOk9n+MDvdscrfJ4Mv03ypLK0uEDSfGKRPS7S5tPI3x9tmTephjeOao4TA
         qiznOOK62W6ANH5CyEA4hMnxGF21CcO2Fv8vViArd0FBp052ykKf3pAoWJzr3j48hcEH
         GDnbeKTHNNdPhU2Emobb3blJGY9ecLKVNwZUbjp+SX+J4a/14bGd6Hh3Z4w3y4y1+qkV
         Fzyu9eCeyzGqVDk5/nXNakc7SAkArRRIaK6vmFvTRinvUQw7iALXlI60wFzZRm3uAqET
         40++4sa4t2JPrk0IrMrNvgBFNWbiwFVdkvMC1E1bnkA8M75ypufEyDszQhl99swYSWBR
         Kk5g==
X-Forwarded-Encrypted: i=1; AKwUvBzGWaUMQStQv1NoW1jQy/acalpMcgP6v1ZtzblOdG111UZMLlc25/v3wOMi8hyKqJnnWyzJWi0h5p3z/l/5BfRf@lists.infradead.org
X-Gm-Message-State: AFq9FYIazypF57KzbDqsu0zVTC1aBlnmKA/Wr13j6pXvF8ok9TiwoCtT
	FryJO+ATkwbQD36E51RCKZDyrR/YEclrZhJ/gKzzeXkzG6qK4o0+Kd3C
X-Gm-Gg: AYBFou374aop93NrhbGYvd+ZbfuUl7nb2jkH6CMuGvQwPAeR9eXuObDBxOYQtdA0HtN
	qv0BVU4K+qRC6U/OMr3cFQOA1oImZ50t6svWa2rtBvY0HQpTETKtiojPCM364QImU8tDorlxLl7
	3eN2hz0wcfGTsrudlIjd5a7HmwGXaLxms4AtbRxcGKvImpdMofM4BoV2BtuXLlHJco4Gh0YWX6H
	rBVZ3y5tIsRsJxtWU6SaeWvHEwS13MJ48o4WaQwWuO7KMGX3I+lX2bIViMoFxSTFYBITtCYO6IL
	Fh4A+/kOznKu2RKc06gDfPFwKxklPp+99LyROjdEwC8elAJyv1UXifBKWfDntD/uKhJAXgxDuLE
	zuvmre4SX6RTX5fmfBkTVt+w8Y9u9IbHxhDPSDg3TZrID+sfzvdpfl2R4B694pgs5+SyUnfovR3
	XF88uzhs/j9d4u4iRChYYzDwhkyhRzjfRKJ9cv67nNKjFbfG1Td7kXxhleZOBIHx9YItYz4pyyT
	ehqWmFeutNEh7y3NcOBjnZx8b3wUjlakMyy/NH1qhTeC75b85qmPlz42KejEBOgl8dDMdpyolT+
	cr0f8jTzuq77v+1HDlMAZmlKyubJ9sLNMDD9IiAFZWICaE8=
X-Received: by 2002:a17:90b:1807:b0:39e:574d:3d2f with SMTP id 98e67ed59e1d1-3a786736764mr3389299a91.7.1791093937568;
        Sat, 03 Oct 2026 23:05:37 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:35 +1000
Subject: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2WG4d/8EDKjA/Ac+P1A9R66HR3H99W3M7nFvRZ5lYJI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+S6/V6Rf+CQkZB8/d8Fh39Hzv1fkX9mK4PJDtM1F
 ls4/js2dkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKa6yZOR4U5dScnqLI/y+oajswwsflst1AkQninyhIsheYujw62rKxj+u63d4uq
 j8bA70sPo5VtB9qCwq6lvD/V8MKvXC368M6WDHQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230539_460996_A692F45C 
X-CRM114-Status: GOOD (  17.84  )
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

From: Martin Povišer <povik+lin@cutebit.org>

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                 |  2 +-
 include/sound/soc.h                      |  2 +-
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
 sound/soc/soc-card.c                     | 12 +++++++++---
 sound/soc/soc-core.c                     |  5 ++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f553..c392e6c4844b 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -44,7 +44,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
-void snd_soc_card_fixup_controls(struct snd_soc_card *card);
+int snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f356b553227d..d638fc69925c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1005,7 +1005,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 75c90d1d165f..14890af97706 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1280,7 +1280,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1302,6 +1302,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
+
+	return 0;
 }
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9e..e4d81329cde3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -184,10 +184,16 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+int snd_soc_card_fixup_controls(struct snd_soc_card *card)
 {
-	if (card->fixup_controls)
-		card->fixup_controls(card);
+	if (card->fixup_controls) {
+		int ret = card->fixup_controls(card);
+
+		if (ret < 0)
+			return soc_card_ret(card, ret);
+	}
+
+	return 0;
 }
 
 int snd_soc_card_remove(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06167a198591..2092373698db 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2109,7 +2109,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (ret < 0)
 			goto probe_end;
 	}
-	snd_soc_card_fixup_controls(card);
+
+	ret = snd_soc_card_fixup_controls(card);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {

-- 
2.55.0


