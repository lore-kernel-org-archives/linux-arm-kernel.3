Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29349CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=; b=d5xaAXQVbAET5/8zoi8en2ddpL
	ZVrvROsG0QowInhRyuKdBkX5Hmq+M6VtPPEnAZsDxKjpbrnVVNiWOO65T3awSE1c227nKqP6p4h4H
	0Jkx79VWk673Dz30x4xAaHHPtSufX1v6t76XsBuXSBB3tlaW5yj3BaEDx6Bw+8xYGRm10e/3upjtc
	yvS9+DA5eNo6t3pQb/w0wcFmWSrYo2jjM6MyV6QKAsYYM6RGJ6tURKbun2d4orkd9m1pggsatuTGb
	EDX8TxDmF5aMFj/qSS7Hag/B1ZZfyLwunx9xxagVtNe/MMTLwsmjQOClouRP/09C0Tm87C2q+wmkl
	bRtb2+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhm-0000000H9rc-0RsJ;
	Wed, 17 Jun 2026 10:41:10 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhh-0000000H9og-491u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:41:08 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-307d0405e07so8462797eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692865; x=1782297665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=;
        b=VF6waUukMALBWIigvLx00/g65C7WcdGSVor0Ppz3kG3k5LUHjMzTPwSVfzqcN0tTRR
         u+G49CNsJQFRx+UrCdnNbuKTkh+Ui0btiv/DzsjFUSplLGSmI93jSozAWU1EGyaobX+3
         G/Bj+Z5TqjfNUPoMgz8LD9vCJFgAyTPUqHvUqspCIuQw6PjFqfifiCXkGVqZXTIIduJB
         2ofizqADfwnZuY7+f/RLW/+Ura6tcEVUcybFvz6opsHZD20O1fy6Dn51lQnXT4wXRD1f
         AbDWMWl65TK8FH+CeMTh14nz5A4zrSgHYhdbGk7v4b1fgq0UFoWjoeZBZjdFNhp4+Uak
         903A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692865; x=1782297665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=;
        b=jOE+oVWWCKitATWUNhW47wsg/ZKKcqk/iMkyV/k6Jo0Gaj1MsakPUjgE46b1mpBMxW
         BKBgarblAl4b0UyPf4wFMMXzCtTEwRI/JxBr5KT3G9lSKl4/GReB92iz1POdT9BkMKKz
         VcPkuoWVMFoDbXjddzCO/LhEGoJeyikaknm1wriQrp/cKzMcNhTsqWhH4JwG/Slo8ZHP
         KkeStIdG601VkHeoVv1CGuFmi7K/pM3irew+wN1/ctnxVQhGmTDiMKR9/f9aVC+/8/Ei
         WBMQKGhhubeAkoBybKd242DdQ6n8v7NXpMMQn1RNoqNNGIVh7hLR/lBagm+j+F0Ar3TS
         OjXw==
X-Forwarded-Encrypted: i=1; AFNElJ+3cDaFr0hxDEwxYGD0nLfvciIAU6lzp4k0noiKX189TghfpZ0081bbrDZ+J4SZrqlzbQ9xugNSJif2WFRJVVYH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1+lPZfWlb97M7EUAGUav64TRIgdyWxC6HsmY3BC/jXiQMyv5S
	kZWOA9gRaPTU0/R5Da3IUD6axLt4aI8xbDDtdayGXkIdKxq41iQtH6xc
X-Gm-Gg: AfdE7cl6jO6Z/Y3e4emLrnoBWC6ckzRQOD8+GZASJNWUtQDqbWzZBI9lwESvnbjoGIO
	LVe5THzxh9Be4uZ4J2oKCnXzIj/ud3y0SXEHRDnB2JIwDerNN40OM3O7FHWn/9kKyEHy38ybGIi
	lMjNeDl9ofWN9wP9Sdyurn/Lm9plotpg3ata4MH4eSXs8+jUPFI1WKnkgIcHdbrgyMWnAm+XF1x
	xTDzZXL4e0FVbruhx4ZwkWLocKJPv2XLifRS3TdT/3HB1kWgXkgVq9++P7BaHwMd74CptAjbWUw
	z4AWHXysC5byv7g14zIAff+6afXO/ZnhDhVgw7FYgPbDSA0a6adzriBQIG5qZ78LuTB5JHhHs9m
	DQa16zRJ3VfYblHipAtf0B5HYXBDtAmUcHx3yuNBTAk0Z52XA1GKaFDU+g1p7IVk2hQb8v2hM+1
	t41DmAplL0BqqHIUb/yNi8YqEXYNqHZ7h8YanrDLpAQweA2MB9oOCxAju7Fg==
X-Received: by 2002:a05:7300:30c8:b0:30a:e52d:fb27 with SMTP id 5a478bee46e88-30bc9df5a44mr2016767eec.11.1781692865129;
        Wed, 17 Jun 2026 03:41:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:04 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 52/78] ASoC: codecs: sigmadsp: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:09 +0700
Message-ID: <20260617103235.449609-53-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034106_024525_102574F2 
X-CRM114-Status: GOOD (  11.73  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/sigmadsp.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 2e08fde3989c..592aba25de11 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -135,7 +135,7 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 	uint8_t *data;
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	data = ucontrol->value.bytes.data;
 
@@ -148,8 +148,6 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 			ctrl->cached = true;
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -160,7 +158,7 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 	struct sigmadsp *sigmadsp = snd_kcontrol_chip(kcontrol);
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	if (!ctrl->cached) {
 		ret = sigmadsp_read(sigmadsp, ctrl->addr, ctrl->cache,
@@ -174,8 +172,6 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 			ctrl->num_bytes);
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -677,10 +673,10 @@ static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
 		return;
 	changed = snd_ctl_activate_id(card, &ctrl->kcontrol->id, active);
 	if (active && changed > 0) {
-		mutex_lock(&sigmadsp->lock);
-		if (ctrl->cached)
-			sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
-		mutex_unlock(&sigmadsp->lock);
+		scoped_guard(mutex, &sigmadsp->lock) {
+			if (ctrl->cached)
+				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
+		}
 	}
 }
 
-- 
2.43.0


