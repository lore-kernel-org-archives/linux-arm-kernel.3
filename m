Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD59C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=; b=WGEEGzwDpiPBb9ZaPraNX7m0x5
	XttoD4bWvy6ILC0DVs/IH5qk4/oxOHkgvC9Ex4CcfuqQayimNpsdVEIhWSgOh3cYqA43KSSqRll5C
	4Sb35qesI6hVqjPgyzwRZyVaCQ+0NEkvJuXE9sb8DTfRrJpGJVQZ7fwQn6B+UMUn+Cbp1PrX8z8OY
	ZjyfajV1nUeUGLATRGnsAuUcvWg0HdrB+oQwg9s9btIrU+GrAUEY8X0CX7qrr+DmBuO7OGCgfHY4g
	qDa9EU60PXUTtRC3mIurjkBp/841lhysYMsud295lfYyEiiiglav4Glt56Usa9yW9iLgntkXn3sVZ
	fg005H5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89br-0000000Gt48-0N1v;
	Sun, 20 Sep 2026 04:57:03 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bn-0000000Gt0a-1TPB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:57:01 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747ee1f9bso17022585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880219; x=1790485019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=;
        b=aVTRkwnjZbsXPy3j+PAVxxVnuWxQI1WKUPJwwlr5MlAHh9CAvGmXvayvSeaTAbjpuf
         T/iUDOARU86wDzFByByuSkvVy3QBrzTkLh475WIPAvnjJnft5r1P20Lm4elQbYO4liTN
         ZMSMw0GOYF6FeGeCGGrj5wuORmQLcAXTmynWNh7vPpjh0sUGrEphNO815HzlTQLwmWMg
         37acDYxOjrDjZjrQ3q6GhcrSMxMId4r+K0o2OXEQAWUWlL7W+wEB36rQ8hvB+GkzavIX
         bZYcWTd5usGC4OHerxSnDrLavwrqTAWpck2ylpGCayRDclvxBNOiGt6yZAU0OWk8Qt/8
         bfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880219; x=1790485019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=;
        b=a3NQ45s3B0cIuFKRyuE7gWOHduK9p+xNMmwi8JP5h3G3rovt9Kr8It7syPZjShMJHJ
         8cgns3lMJUWcxLi7dKsRjpA7Osdr6Hx6nirkaLT6YJFG9CVEb9DBTzaMAENx/RrcGwbE
         7/Gg7a3K5qsbzr/1/tv/C5G2MiRuCcFRrVymC13j6xIwVayp8uqVLEdE1OL2ZCNTpzD9
         vQhTBHRrXNeRDdyDrM+jRupZE1OC8EMgNL6odwRvIgPeZjgxfsBpU3qYDY/rd3EVHQZQ
         o3z8epOWHU8x1NqAwKSwhdKq5AticzfbAOUU7I8MeeYeQX3WwEBW/ZlIfY1Jkw9/TEpU
         dGjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxamTX5FUyW2H4bScMrhCJ2YvnpMUTco1XC7I6QHZ0RY3nPxDSmKl/egfADROORyAw0SqWFiks9sBLndqHXhVeg@lists.infradead.org
X-Gm-Message-State: AFuF++k1928zlnxGbS7XrJZdQWC+xg2PSV6ils/HKQHhyzNO7touRZZ3
	FtSEgFoOEKbiTha2uRNDLuVNnI4MgwvsZo5w3ifEyunP2GNxeCh0dyTA
X-Gm-Gg: AYBFou2UFRfzyN6hXGkQQAwMwwQNNVPpnjEFNwMmnK99ZUSMyEkEqXZp612u1HCGj5N
	VlWF6FfjayufKHpcby8+wCG8oSeA2jX8BqYmdV/qWLp3JhYYCrhufpR172fULDFHm9ugHIrkxfw
	nv0+znyAnCIbu1XHx1Jmvc1cBTt8T7KN8WU8/zCZsmh0BqXTOMjS2o9bpNTdk527Pi2RMtaGNnh
	5aYJzwZ5TGrKs80aZj6O4Vsdss29oIwj5eB3w4Ez5Wer2ByhzqjkVqjdLib2vUYGTsRssDJwsjD
	czjPfh0AdstxVxiat4Km+zixB0cdz/ZSw3K9E0r2rYG68Pt/g1OZi7pxPenXh8S/HmnrEz80KQM
	l10olbfQksdf1/cfjgAr+nNyViuaovbLQ6y2tBaSPhB1j7yiAjQqM8p24r59qIJ54cZKPXb4iJI
	FVRr7tBeUlKSzGBZjuDNalQeo+ez9ySLoBvzz+EzrW5XWfkW1KYbMWp1PP0kusQtENnNLXZypFu
	yRwUN3XF3wTDUESdQIl1mkQDjPfOGC6nOI9CNTLT5lI0e3XBmNzS2t6jbk73ifKGm5AvbFw6mpk
	hixr/WMwgeyfouZ5VPuEBBXgzjIfJ+7fPEMe0nM0dSfShgg=
X-Received: by 2002:a17:903:32d2:b0:2dd:7ab0:7313 with SMTP id d9443c01a7336-2ddb1c17059mr113999215ad.18.1789880218740;
        Sat, 19 Sep 2026 21:56:58 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:51 +1000
Subject: [PATCH 12/28] ASoC: ops: Introduce 'soc_set_enum_kctl'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-12-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3075;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ALw7GM6BAIc0MHLkA2EcsPFMi9t4wRSGpPulB3kFXSk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWYKk3fyLwPOWP4bnLrx6JZ3MlXbuismZzzpHTX6
 3LxGCfTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTf7GBk2PQ34GexV8erhzy3oqqqFix1cXzjEnblC8NqE4dtJQfP9TH891WtZX0
 Tk7ag3Txt7df9e//ssZq+ujZri9HMeyxeITUFvAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215659_399415_A053FF33 
X-CRM114-Status: GOOD (  18.55  )
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
values -- either a single control or many controls in bulk by pattern.
It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 +
 sound/soc/soc-ops.c | 70 +++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 973ffaf6f060..f356b553227d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -580,6 +580,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *strval);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index d35e24df891b..dc27d1c409ab 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -550,6 +550,76 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *strval)
+{
+	struct snd_ctl_elem_value value;
+	struct snd_ctl_elem_info info;
+	int sel, i, ret;
+
+	ret = kctl->info(kctl, &info);
+	if (ret < 0)
+		return ret;
+
+	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info.value.enumerated.items; sel++) {
+		info.value.enumerated.item = sel;
+		ret = kctl->info(kctl, &info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(strval, info.value.enumerated.name))
+			break;
+	}
+
+	if (sel == info.value.enumerated.items)
+		return -EINVAL;
+
+	for (i = 0; i < info.count; i++)
+		value.value.enumerated.item[i] = sel;
+
+	return kctl->put(kctl, &value);
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated controls matching a pattern
+ *
+ * @card: where to look for the controls
+ * @name: name pattern
+ * @value: string value to set the controls to
+ *
+ * Return number of matching and set controls on success, else error.
+ * No controls need to match.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+	int hits = 0;
+	int ret;
+
+	/* Sanity check for name */
+	if (unlikely(!name))
+		return -EINVAL;
+
+	list_for_each_entry(kctl, &card->snd_card->controls, list) {
+		if (!soc_control_matches(kctl, name))
+			continue;
+
+		ret = soc_set_enum_kctl(kctl, value);
+		if (ret < 0)
+			return ret;
+		hits++;
+	}
+
+	if (!hits)
+		return -EINVAL;
+
+	return hits;
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0


