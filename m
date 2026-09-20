Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D07DC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usgTFYno7+hAzGXo/yfuRjYlJhKU8fYfhaps2/4rD8k=; b=yu2+P5HhJmI99AVYZ4tzDD4c/+
	fpQhvj+RZydoKgBR6lx64NCfJHdGVj8elBLhBnQtiZZJuWP/MiIyKjR795/TMVmmDTHsNqytpHSAi
	YxWzaR3d2KZ3YXJ8g3VsYzO3DG0AKStx0pX/tpuQfbmQO2oSKhB4Y+3Ao+wS0kCtS2+SH2oErWqGT
	qlNLBT7aNcoJizwCVZT7y8MakmtWVq9KRqPtUr5r/7oXi/yD5rpFpzLLYW6OPRtRWPlUSJ0ON4VN9
	uNOnpFz26bM/DrIUCwWz7+w6IVAE/1fu4oC0R5LOVsRrXcxmRbpMmEvARlTs/+LDrPoDYkMpmswdw
	kzR+z9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bY-0000000GsoD-2zDu;
	Sun, 20 Sep 2026 04:56:44 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bV-0000000GsmF-2mhQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:56:42 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2dd4b43b20bso13300515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880201; x=1790485001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usgTFYno7+hAzGXo/yfuRjYlJhKU8fYfhaps2/4rD8k=;
        b=MEOAppY9Fl2ZspcKgHK2+Sn2hmYzinW0n1wvqY6mr4xsA3ZfqMwlSBbPnoi4tXBPMZ
         t3Q5fpQtFQZwBpPCVnAUQP8KbKzwy9AaMHl3o7eesDAaJ5LwT96AzAtbVVaaL425433o
         mxPNokupZJ+nq/g6AyYy8Vx72sTpZvjyy7yHzQalnv4EvT7/MCEOSHsUUY5izHTmXg0s
         1kXJ5Q43Zq07fuqrSt7a22nrHPOdW6QTZ1tw3tL+OjiHMwSG/MVbdemZzYY/qcpGalq9
         nvMlQ4ZfQvYzgzbo0R5UYNckx27aQR0Of5ZszD59SRxoW+IPXaZ62LSWPHJ7z3mIeDH6
         wREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880201; x=1790485001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usgTFYno7+hAzGXo/yfuRjYlJhKU8fYfhaps2/4rD8k=;
        b=0wfnCBmyx7NaP3FRfjbFEmpR2cVLA6hAf1tyuvM4KruSmBJZlotZBNLnK3kXEhUe1R
         kJH+GdDmeePZmyQkk/Fkd2cINwSG3PwYVKRwfgQLY9koKGfsi4+F7crHolaU81XtDICy
         nrhzD0MxSVc8RUt8hnuYNh5eHkBUISsibDuW24n5dzi9EejUg2p+KYHaf9GeT4Ezyshu
         YCpjT0znyyfSJ9vD0rHOVFLrTVPtHwPDi72enllwHnhZFIcDd6SL6g9bvVj62H+7fNqB
         nX3fM23YA43PnhHFfRZdtlZvTIZSxRL6Xpv7AWv8kyaiViFO/WM5Bg/wcPorZ2ULIWGv
         Y5Ww==
X-Forwarded-Encrypted: i=1; AKwUvBw+MoaNw1dgTnxDQQ2uteBNFCy0JrRajGd0V3VVdaT5X1szH1rhS8AGO/vgvGDEDpQ6huT3yVgeWcptozP07awI@lists.infradead.org
X-Gm-Message-State: AFuF++mIucvUETw2FW/MBDFYaluxGnbdrWk60yQoaB9HAt0xuLeReM7p
	sWMYteiEO+pXxmnxWboKf96sd1O4YOApqLoTfP2lgVn3N5BvBh/xCFLw
X-Gm-Gg: AYBFou34rT6QfU4oUNf8N8TV7ZIRca+eDGUuPIAWJy8NtzOjvMzFI+UBkigckTMB3ZX
	IRPQVa7SrjaUPxqYGqWme3pqFjsiV0cwzGHQcvYuDv2MK/E29uBGSMNnQojG21Ph5EiK1Q3P89J
	mhI+YtzHsxJaQrhVQx6tcykWeTsYaQDi7gMzmwqut5eykXaQNHuDFRbuZ4v9pui1+ThmoMQ6/A2
	O3vFf2QiNkWRI45ySAN/yRF6tYS8JQMIN/bMTLkYedWItB/J+ad/qzI1L5ONfXEYCE6Z+LMf+OY
	5BmEANwl+u4ZO0+cjvWZ+YJE+un6LP7902+tNkM7F8LzE+Pw23VG5p6iQqyLq2MlDcIBSEWHvKr
	XhEpax3RmwvuEHXUPouz0LNC8hnTnxO6rUpZnj8ra9+Hxic/sft1vARsCkz6B6wLE3FGnojWOUQ
	HSpfTVCk6vusM8rNodBYztdcVbeuYHQYiqk5RBChMkGn4+fGGzj6Z/39B3sAc/L3nxkOfWhY6UB
	qqz9H6JEm37WeLxgmbOXTjYfilCc8fB3GIAMGVk+fGTNhu0eS05E7o7GODsHlv1vso0THVjsjia
	n/8QjyyJaTiX+7SYBvpTNHV5WrHpYiF/TnbV3IFcjmWr28c=
X-Received: by 2002:a17:902:e543:b0:2df:39bd:ace2 with SMTP id d9443c01a7336-2df39bdb0a4mr24798825ad.43.1789880201029;
        Sat, 19 Sep 2026 21:56:41 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:49 +1000
Subject: [PATCH 10/28] ASoC: ops: Accept patterns in snd_soc_limit_volume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-10-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2816;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=giyxcaB7oPKDW7kHY6FxQFJhi2IQzFYLV+w/nh4sO8E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xV+HF2p1seUK7lhz+75Sy6XKnK6zLlreVYmbF3Bm
 QOajkLxHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKleG8TI8CqdbbN2+S/VoCAT3nVMDvGZ86ZkRsz6OD1eZoq/ovrURYwMV95umc5
 m67PbWbG0nuv1Qp6aIJtzX5z1bYVeT724eGMZPwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215641_735363_00BD3665 
X-CRM114-Status: GOOD (  18.37  )
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

In snd_soc_limit_volume, instead of looking up a single control by name,
also understand wildcard-starting patterns like '* Amp Gain Volume' to
touch many controls at one.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/soc-ops.c | 51 ++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index e572b05840b4..2f91ee7946bb 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -403,6 +403,29 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_put_volsw_sx);
 
+static bool soc_control_matches(struct snd_kcontrol *kctl,
+	const char *pattern)
+{
+	const char *name = kctl->id.name;
+
+	if (pattern[0] == '*') {
+		int namelen;
+		int patternlen;
+
+		pattern++;
+		if (pattern[0] == ' ')
+			pattern++;
+
+		namelen = strlen(name);
+		patternlen = strlen(pattern);
+
+		if (namelen > patternlen)
+			name += namelen - patternlen;
+	}
+
+	return !strcmp(name, pattern);
+}
+
 static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
@@ -445,31 +468,47 @@ static int soc_limit_volume(struct snd_kcontrol *kctl, int max)
 }
 
 /**
- * snd_soc_limit_volume - Set new limit to an existing volume control.
+ * snd_soc_limit_volume - Set new limit to existing volume controls.
  *
  * @card: where to look for the control
- * @name: Name of the control
+ * @name: name pattern
  * @max: new maximum limit
  *
- * Return 0 for success, else error.
+ * Finds controls matching the given name (which can be either a name
+ * verbatim, or a pattern starting with the wildcard '*') and sets
+ * a platform volume limit on them.
+ *
+ * Return number of matching controls on success, else error. At least
+ * one control needs to match the pattern.
  */
 int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 {
 	struct snd_kcontrol *kctl;
+	int hits = 0;
+	int ret;
 
 	/* Sanity check for name */
 	if (unlikely(!name))
 		return -EINVAL;
 
-	kctl = snd_soc_card_get_kcontrol(card, name);
-	if (!kctl) {
+	list_for_each_entry(kctl, &card->snd_card->controls, list) {
+		if (!soc_control_matches(kctl, name))
+			continue;
+
+		ret = soc_limit_volume(kctl, max);
+		if (ret < 0)
+			return ret;
+		hits++;
+	}
+
+	if (!hits) {
 		/* Some cards blindly add limits for multiple variants. */
 		dev_dbg(card->dev, "Volume limit for unknown control '%s'\n",
 			name);
 		return -EINVAL;
 	}
 
-	return soc_limit_volume(kctl, max);
+	return hits;
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 

-- 
2.55.0


