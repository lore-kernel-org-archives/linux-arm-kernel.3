Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5E4C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhyKqtsY06vLNdvd6vYAC+C0aLujryTRqdrSJjEz6bY=; b=32r7cKjBMLhp/6TkKJVzx3lI4I
	eq3wx1gNJc/F3XWxRFGhBxzUNpYKJEPP/Y+n1FaycPNLPlTfC3slRQb62HS5Avm3THN7vthHD/LBN
	CFU3iwTQ3xaXa1DwD60U6drKbIujfqXg8H55sm4nlrwnb5ancpokXv9ANuDtWQacnMNId9FRy56tZ
	JkYtHD74ijjzDa9m8Qk65Y8o7jhzaV7Y8qIDejTM8mETCpw0CsstO1O3IuHuaMSxK2oxvjJWAodes
	Qr3LyYQXPLgBWmCWfZKiinp+hDx5hGLLztER9+MWYMZk/1sufJYZFvSAqTrzxmxtVNBYYnFQAWVVO
	9413hwjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bP-0000000Gsh1-1YqH;
	Sun, 20 Sep 2026 04:56:35 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89bM-0000000GseB-16wL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:56:33 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2dd88a115ebso16262775ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880191; x=1790484991; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhyKqtsY06vLNdvd6vYAC+C0aLujryTRqdrSJjEz6bY=;
        b=OLtch25SxHK1IsI+46Ix/wRTP+wmnDabS7foDFqNcqW2MdID94yTVsk/vtyH8jpO7g
         7BTDqR+WNFVQlm7ki0y8EsmvIxkauQ8/8rNlLhfNGFsYuEfuSwdWX5xzifLTBJRuPien
         fYNdYWDuLSyEXuw/+7fCwL7fXgjLvWldiCSqQPe5T4AiU68Sv4BFu4ySCgWchmwMLLHz
         MJ+ueTfv4qFoPtebpfa1Yx1DipVQzGgD5Tmw0J0RjpUY7yggXzqPDiDGKOnLc1f4EQLT
         pbXc/QxtYVmo7jv1P6f6ziHV9uVkKX899yyHHwuSUmBM422Hsfi+8tRVcL+Sn4l1GMYx
         s4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880191; x=1790484991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhyKqtsY06vLNdvd6vYAC+C0aLujryTRqdrSJjEz6bY=;
        b=b8NCaH77cBXLEDLrXL77Uz5kFZnLNEi1UGKGQyRX0vyrbMaRKIPa78OfzdxnuKG4PQ
         +e6RDBom7V0dQl7Bo1999CQkvzLWpGTKC+fXIpKrGiyTA4omhm15LoOpwcZe60+V65RO
         OZhzupPOLSzgQ9MmEASoiKbgoGK/TdTrxF360/aU/DiX0g1+RaECcKP3pBh83Dwk85CU
         BmbefySa+pFrlCO6PRvjFMtz/QSt3zsgsmzquU/LREw4ZKJkvUAqPzLH2h67GB/ZYAmk
         p2EbscIhJIoUbgH9kSFJyQsXOZjmdG4WR5WbCfAkItdO3T4hfOH+oWHRU3Zvke+6FF0c
         7K+A==
X-Forwarded-Encrypted: i=1; AKwUvByNB0MlY0bF8HCC+9BmK1voQPXDz85s+noxyDYDo66Wos97SA1hbql5VqeQRoPv/4rJCxxm23Oo+Hz42zhw+Wn1@lists.infradead.org
X-Gm-Message-State: AFuF++naWAM8KisgU0oCfis7/I/k7qS3qWLVi9WPUEIgdztaUFnDurhs
	A9yl9Mze3wkiwPVZmDxqg7qEx09vuExhqX+GWv09fYitRZOg6VhFHFzs
X-Gm-Gg: AYBFou2DAxvv4eIstG4wNITWO9Wj3irSv5NfNWJUTEBAaVIRozR7ZT8Kscse+LxSCsb
	fHqCup+rZSTKCWI1MO1F6rIMWJ/oyEAOp/u6BYl7PvzxtzbrHAWA1naX2W/Li9kl8T9fLBwvMdl
	LgFPbdZJo36jIwJKlCT9OIB6PaOtdbT9d07JWiiFV39xQytS1ZfHLoSKmgBlHwN5mfWAISDqSQa
	rm14fB57Pnbkv6TLPQE9M19YjEx/AWQKr/4bgcSEsD5UjNYFhMaUzoYafgWC0eBXccE0kg68kfv
	a/P5jtVxzXG0yy+kGLR0RCF7+OjcV1gvHCvE4DCGf2Lz72WECmj/d4Lzaavnj5NIuybY277DRJ+
	TznkVVL9xJp1KOc5ufl8aDSREQ4kRJmkAT1eGMEm6nqmvH9tB71587zMTu0YZwd/I2+0AlO8sk2
	xDLCLBagx8IBdx7Eqz9wAKk/SX/HK0P3sJfcuNMSQ2UZqAOXqkjwC7XWtsBzh8FfmhSIiTe5O1o
	b8F6+vcD/khM0ANl+CrN51Gz6mHhpKWbj2XqJkkXTtH4biMz0a8d2iN4NKILSU5Fx4bwAi+tkrF
	hbtIiyCk/jaHQ+CbtVk1s4gcemp3x5i2Z3LbaPBhO3H2bPY=
X-Received: by 2002:a17:903:1446:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2ddb1add397mr117214805ad.7.1789880191567;
        Sat, 19 Sep 2026 21:56:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:48 +1000
Subject: [PATCH 09/28] ASoC: ops: Move guts out of snd_soc_limit_volume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-9-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ofWNdRfEPmyBqzJBf/dI8RMLcLf8D6L0C2OlsVRutbo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXaG63U53++zvmJ51PEZI2s0OpTh2NTF/oY6Ww2/
 bGnqHRrx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqfhTH8z/nL9d9t399GmTaj31sO7E/klD6itHY9U2Sj2g7BxFc/MxkZ5q2a3aJ
 r5a1bdVfwxPWl+0T3vOXK2SNh4WS2vHdeF5scHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215632_312719_F4D9B2AA 
X-CRM114-Status: GOOD (  15.35  )
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

In advance of other changes, move the modification of the control itself
into function of its own.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/soc-ops.c | 28 +++++++++++++------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..e572b05840b4 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -434,6 +434,16 @@ static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 	return ret;
 }
 
+static int soc_limit_volume(struct snd_kcontrol *kctl, int max)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+
+	if (max <= 0 || max > mc->max - mc->min)
+		return -EINVAL;
+	mc->platform_max = max;
+	return snd_soc_clip_to_platform_max(kctl);
+}
+
 /**
  * snd_soc_limit_volume - Set new limit to an existing volume control.
  *
@@ -446,28 +456,20 @@ static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 {
 	struct snd_kcontrol *kctl;
-	int ret = -EINVAL;
 
-	/* Sanity check for name and max */
-	if (unlikely(!name || max <= 0))
+	/* Sanity check for name */
+	if (unlikely(!name))
 		return -EINVAL;
 
 	kctl = snd_soc_card_get_kcontrol(card, name);
-	if (kctl) {
-		struct soc_mixer_control *mc =
-			(struct soc_mixer_control *)kctl->private_value;
-
-		if (max <= mc->max - mc->min) {
-			mc->platform_max = max;
-			ret = snd_soc_clip_to_platform_max(kctl);
-		}
-	} else {
+	if (!kctl) {
 		/* Some cards blindly add limits for multiple variants. */
 		dev_dbg(card->dev, "Volume limit for unknown control '%s'\n",
 			name);
+		return -EINVAL;
 	}
 
-	return ret;
+	return soc_limit_volume(kctl, max);
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 

-- 
2.55.0


