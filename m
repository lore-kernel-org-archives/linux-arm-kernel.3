Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C08CCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz6DpUxPfKNPf31EvMRwP84SQ1THxlAVvf/QPE9uAxw=; b=VyYOEeerFc9EDgwbv5F0SpegIR
	FIZuqk9ziafX/S8WTk791yTLNJ4b9Pq+d0sllO4PZ4OSEKlKpBCZzkfqMojsur2jjIWUCd8pvPiUh
	IZRLCClzeuS4N8e82mGgY7B9c4iNr2t/VARRLAyIzHPu/DrrGFD01jmU8Skq4K9e3PufXLr0R2TWt
	1dqyqptDtBjfGyxOFyJj3/8Ts7t5yXi7JyVNDjatCm6o9P/3pichZrOuD6DNhy0IQHwbR5kDJaVuE
	kkX21kd+MZY7CG7LHh1JrxnMs/FneKigFgCyDUngrugzqrSOj4RPxpdY6aHAwwmxFw6DAW5096Ge4
	T3XjpmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrh-00000005ZpA-1pht;
	Sun, 18 Oct 2026 05:55:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrd-00000005ZmQ-15wm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:55:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e9cf928dc9so1513555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302920; x=1792907720; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz6DpUxPfKNPf31EvMRwP84SQ1THxlAVvf/QPE9uAxw=;
        b=Yr0pl1NQNjf6tM9esduYG9jyzYFQ30aCgd6YaVV3ulJse3rpWSZddVOJCUh+ilm2tM
         LbIcakr4NVzeeRBU8BtXT6btBCaPV6ipTVGV9LS8bjiIAlBkhAAUocb7HU2G4ijBzcbM
         +l/7wR4SeFJjY0POU7gqmMdRgDNSxHOA1vnWvkCZ7R+2QJDVqBuWWSZXfCrEjtsJICeG
         yYV5TI9dfBTRwVqqK33d758CpTPEpbEtKupx+YlLB3WIPzymNcafvLhcpsDHyru8utzX
         ANrLrc16fTXpoiSimmRCTZcUF5n564cqHih4091tfhkbjc5UpZ5sArd5MJXTXyM5NIdv
         iTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302920; x=1792907720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tz6DpUxPfKNPf31EvMRwP84SQ1THxlAVvf/QPE9uAxw=;
        b=fPGF1+mIZoguB5lztoIAYmX+RgLqSUjMsXpyY4+rs4nK347WScDFoiWId5TdEFx1JQ
         0ByqxIzUkY0zM9lqrXMPQBQSQomv740cWd1Nku5gUaeBvkVzeuQqBha6nZHEUtYXSp7b
         l/m57Gtv2Lq+y0ymzYpveEY19QREst5RLMoUx7aqME9VkEZ7pFA8iqCq18BtjDYwCWbt
         BUdxoR4crk33OrlbNMi0Sm3wltect0IxzbOB4VxTDT+HHqbS/VJLytFoV6FifGKiA6OR
         i5WqH2r7KEb4GzXvmYlWKBVU/reWg7/sO7devGbkex6Bm9qf6KPjE8K2CGqv5tsRYMl5
         VXzw==
X-Forwarded-Encrypted: i=1; AKwUvBxnbuNJf1O53LtY/daMK+szIOPwWFMHVDCyng2JstM3yq0OchPr1CG9enRrKd44X1QHYQZUMM93l3rY7m0OhbRB@lists.infradead.org
X-Gm-Message-State: AFq9FYLyBGvJ48BfMS3vNnEM/11sPLsqbEjL1//xSNAQIYx6mvgYttcv
	0E99N3RcrKGCGL4OI0RRQqWYci/pEaMWDcnkppnfvV5LwsqD65EO44ne
X-Gm-Gg: AYBFou1ZjKzllyqDLeJJmPzE0xwtifiqbiSfE8oEVbmWw7dctbH9omBGjwJMJnFo4Xt
	3H+RFlLH8eSVJFPJeroYgc0zjUhVIw1J5QZOaeWGCqTRiFZw4WvWt/ckzHGOzTFQd6r5kncVGP+
	w3vurTJc8JtO4C3RRa/3qWFpMyZy6eDKDnIrQxRDB5E0QNErzVRuU3T2j6BbhcXUimPOJDEELXB
	PUXX1kBtKtt29sHdmLWReot9+5AlI+R2Y1tT2Ugh20Tlc9n/NLRGZOjmaWsZBStkiuEtygE5yUm
	7iwsJ0y+98xQx46aG266BoglTwSmtLmZEvsKbUl0MMQDd6yu3Qp1XkQuMDVapfqR4OEIRO9Wg+y
	+xTIRs9Of2Q6YCy6rCK1udqq9GQUecsiOlbJD929wKrYiPgo0HOarxrCv+ujzDdf2mP2emYZ42s
	k9BxE3YarYUz8XjZt7EWzp5xjheuixbuQwVLBKerseawn/lDu3EDh/QB33AJKQ1YuedVbUssrvU
	bYOEYfeH7iKAmHdJzibtwJ8PIXFtzTfI+h7MF6ZXsAcKLy3uYA5PNJ59rp8hBHmc48tgmIG1zLK
	2n4ZRyiqbQlfM3QUPIZMeeWwTiETxY86BJrGaCGYbLYHEw==
X-Received: by 2002:a17:90b:45:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3aceefbd753mr2885259a91.10.1792302920286;
        Sat, 17 Oct 2026 22:55:20 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:19 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:59 +1000
Subject: [PATCH v3 05/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-5-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3004;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=GZ5WTNP4gDv2fMsvOJFicRig6JxdLlKhDpR9KaPgb0k=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nns2I888NrlJOEYp5zy95Ev3+q6ib9LRNYacS84a
 5t9Zfe0joksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTvCWFkWCxXzaS0z37mFxPX29cvbV8b+vXXzNjLEmc0okyPp3zKEWT4Z7tj19H
 +1VtPxDLUiq1XsKle16VzhXVbnHEHo1uyiOx5LgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225522_755472_E5C8AF1B 
X-CRM114-Status: GOOD (  16.35  )
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

The new function is to be used to set enumerated controls to desired
values. It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 +
 sound/soc/soc-ops.c | 67 +++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7509824a6b2e..dcfd706a73ad 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -580,6 +580,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_ctl_activate(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *strval);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 295056bcc081..149a094112d2 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -503,6 +503,73 @@ int snd_soc_ctl_activate(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
+{
+	int sel, i, ret;
+
+	struct snd_ctl_elem_value *evalue __free(kfree) = kzalloc_obj(*evalue);
+	if (!evalue)
+		return -ENOMEM;
+
+	struct snd_ctl_elem_info *info __free(kfree) = kzalloc_obj(*info);
+	if (!info)
+		return -ENOMEM;
+
+	info->id = evalue->id = kctl->id;
+
+	ret = kctl->info(kctl, info);
+	if (ret < 0)
+		return ret;
+
+	if (!kctl->put)
+		return -EINVAL;
+
+	if (info->type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info->value.enumerated.items; sel++) {
+		info->value.enumerated.item = sel;
+		ret = kctl->info(kctl, info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(value, info->value.enumerated.name))
+			break;
+	}
+
+	if (sel == info->value.enumerated.items)
+		return -ENOENT;
+
+	for (i = 0; i < info->count; i++)
+		evalue->value.enumerated.item[i] = sel;
+
+	return kctl->put(kctl, evalue);
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated control matching a name
+ *
+ * @card: where to look for the controls
+ * @name: name
+ * @value: string value to set the controls to
+ *
+ * Return 0 on success, else error.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+			  const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+	if (!kctl) {
+		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n", name, value);
+		return -EINVAL;
+	}
+
+	return soc_set_enum_kctl(kctl, value);
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0


