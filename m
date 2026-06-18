Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAB3CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=; b=LxD79s9qvT7DYIwKyvbI1tZ32J
	8FZUTBh+bGxGzk9VQ2lGQ5/wfMgkuMxc9RZ8jU7+MN1CqvnHeIPW5qv69O0PfZ9cPrB3kgnSPd51X
	sNlpvKRxgHQbfYHCvRPRJnAazcoluxm6LQeP+DqXb07l68plzvGMbKMHJWgFGh2akj5YRQaB/kt8l
	skngFqkmUYwXvfA02/C7Zcp+vcDhcfdWVxbPj7Ny3tylpUUWKenMthpYYie+r/rbkZ3cO+fARgLAr
	8nPaGGk3uP0W+D1vkfFnYurb2j3VuuyHTPRKoi42kXTwkQ0/DjFz7Z6wqtD24VKSzneP837fK5rDo
	HHZc8BBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAet-00000001Aw5-0ePF;
	Thu, 18 Jun 2026 11:11:43 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAen-00000001Arn-2Mc3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c6d31bfc8aso5621125ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781097; x=1782385897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=YSTDvJnl3tAcivYdBMHxCbgQ3hKnCx/e3+noGdlgUXWpY6CVwx2c8CHifvx6cl6GGQ
         YQjLxYeDb+ZMODzMAa20E9K14lP5kKKscOitMlF9lbwH2zeqsALGI/evdBmhQg/lxtAn
         5Ddw7fdSk6YX8tdd1lj+WTcUscGo85MFKWyYz7F+3NJNK735vQvUvUqAgA8XvXjRYbVR
         ykoCpX1YeG88raD6uO/klfl8AyHsG6Pw1HS76Uj2CJpjoPNLdErwweUPgXB54FGouD1m
         7ai/Ym7Nij0SBldOdAwi6PTpX3YucH6mVoDYcbido11/um8qhIyBMBS2hkRstXrlIK5v
         1POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781097; x=1782385897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=RIJ4+YWkEenkCHtTRt/LfiTf4XzJPdPmBWqMVfHqNkn6oxc/yN8XAatU7Ll1F8u7Bj
         ZSEMYwJVFDBdsbKDS/b8EB2Mt/bF1GHhINTXUSosRoG9GyviCokenI0NGHo3wE1PDCuE
         EKHwa7Yw78geMXo4S5KxJxi+KX+GVsE8RPYUdRfMjpk0kCGnGDc/dfQ4JLxhJoUQUIdG
         Eh7Y2MbQZZa7gUJfnorzGjQHf670Gjdbn8WxYbgYHfly/3XwGbX5Xu0GihcfkDXKSp0a
         LnxmLq5G/oOMutWEYODRfiXzU4A4GL+feDz5kuHVUGu5S4u3JUnZ3jTIlpvjAxfh65Hz
         s+Gw==
X-Forwarded-Encrypted: i=1; AFNElJ+pAJjlJrnybN5sdgFlFgXNGyNjcyW2xbK4yGVgGhQgsERuVCAVPfR91etSsudB+0HjuxTXf3ukDN4z8c6uxnA5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Mw9w7/+xuS6xlOqS7nW0SvzASO1fQ+O9iK3ly7bNrhaybzS5
	QsXaoti9KPRMKXCraDTu1u8hBuhOzLUhElfl0o3TCkSm/OgDSif/eUcR
X-Gm-Gg: AfdE7clyX2SDNpg6gh5dYJCjuxB4Z69B3mIktWe1v0MsbFjPkFGAEki/vv/L8ldFG3J
	p+BwW7AMMaRo+WrBekhVOD1+pVsCnJ/6O1s8HRj8rYsQDC/bee0uDJUTn6uOBTJyTAYPkdZNhAt
	wqImagGhlDGLN9AjoC5SzP/TdK/MvEnRQGJZWn5LBtwYBmccbMz+55dgHLZY25QfjsLU2zNzwQV
	aR9DuupSTwF8nYOD2FyMrNK97mz4ODAvgbDzmEizagjDeTVxs8bRNRYZagEgPoC/8OxsZxBC19+
	XaD9tePL5KT85l3U9FkMNhu/vudUV0H3g2r+k3SqlINaKMZWO2rg7HE3T4L33exo3wrSNL7f/Wn
	+HNMx32bxBQ003HrdHpLGVs65+LrnvaVejKDO5h445pEgsXez09bPxdViL0OUY0Sg8pbyEJL+/c
	oIXHtewVEvupVZbOSMBA8yfafaejXrxSXWF+ZT2a4DVxnK5IY=
X-Received: by 2002:a17:902:d546:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c6e2472467mr40617785ad.0.1781781096866;
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
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
Subject: [PATCH 76/78] ASoC: codecs: wm971x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:25 +0700
Message-ID: <20260618110827.232983-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041137_626786_459BD950 
X-CRM114-Status: GOOD (  11.17  )
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
 sound/soc/codecs/wm9712.c | 4 +---
 sound/soc/codecs/wm9713.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 83cd42fa0c28..68ebf9d23865 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -229,7 +229,7 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = 1 << shift;
 
-	mutex_lock(&wm9712->lock);
+	guard(mutex)(&wm9712->lock);
 	old = wm9712->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9712->hp_mixer[mixer] |= mask;
@@ -251,8 +251,6 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9712->lock);
-
 	return change;
 }
 
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index b3bbecf074ee..d338b9a915d7 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -238,7 +238,7 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = (1 << shift);
 
-	mutex_lock(&wm9713->lock);
+	guard(mutex)(&wm9713->lock);
 	old = wm9713->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9713->hp_mixer[mixer] |= mask;
@@ -260,8 +260,6 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9713->lock);
-
 	return change;
 }
 
-- 
2.43.0


