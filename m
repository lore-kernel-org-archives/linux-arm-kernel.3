Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704E1CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=; b=qtsCIUeJS8gRodbDmGdx6WFc/W
	TDGutLGPJgxTynNHcnjtKbFr4MER87ZGjXj1w3xulpNVEe9qK1EGC5f4sYqnEzWnMTwFyENMS9RbD
	Oe2VUycJn+bwgDkTf/0b3c4nti2lAXgDqTxOK3EEOdqZunmipqBqB7wz6GYE9W9RC4C3z9594livW
	eZDLk70zSE6SozxJLXFRO7nSdUJnP5xo+JbpT2QWUzwkkiYF2yCiT670jKBUlYAioD5vLfASyKJlo
	6KYnDNO0m0jgBjGTl1PWxkmvWdOEJb2tc6RLWcitv5ScQ0qXjt1KeJPLXZ3CGW/MJM1zLoWkQ8a4S
	8VuvzjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnap-0000000H46x-0TS1;
	Wed, 17 Jun 2026 10:33:59 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnam-0000000H442-2TT8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:33:57 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-30bd445db39so180806eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692436; x=1782297236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=;
        b=lK0VQf98f5J41Lw9HM5XODlpWZxwXGKoqJw8J0rBeD42is7zxc0pRnZ0fa1XMAMtKL
         HqXnBL3j+Z6YZmoAw6FU1WumMDT+GRr/AbSiEjjz3VurZiBR3aq/BWMOruQkv32Trawj
         dKNj3whr2oWDdsdycsgGxZYlTdnOPymhD/Fzd1b0+bAciNTkliHjV6e8tSEBN7QHNaWK
         HCYtx2mPS4PpJGiPF3+KEsr09S6rDa5cbtG6/g4a6YTQBu0HjDkV54e/gmZrhy8hkjmW
         u4EVAnQxenMZFglj78pRiXfAT7AkQI1omqJUoqgTs79G73E/oiIEKcm1U+L7biZ0hCHr
         ikqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692436; x=1782297236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=;
        b=X9UwhIwWCUBibNzLQmMwde1/pWsxiq+Jm9i8GRTkZC4U7NN7UVybYvw6OawmURMbNg
         F6Lhne/k05is+BPTsg7y0OkSF0SltXxI0Y4aEgFXNkyvtD45wtkrs9FjE/oeIN52zlfb
         3OjX0BgHKq7YtGvdfJMYooYS74G3qgoSGiouEv/Wl+YI1HVDfdM+NoTe0ESmYPou+1ow
         SRUF8WOn0Fii81TrzR5nAlY4AB6HVlu19FQFuq5jwfSb2QIsaJ4btaJltcIZ+WCFBVjd
         IPypD88+7fBai3Oup8z/LfB1fLLR8SNn07kFHW58EBIdReT+KxujHSEqW87mhc3Mw1yu
         LHxw==
X-Forwarded-Encrypted: i=1; AFNElJ8kaeE3lQQN0Mksv8UG61l6ClUz7I/6ZBj1o630Frj3TTm4e60xIQQ3ImQNSyil+HmJBIR5NU2kfzhWChBIjMb+@lists.infradead.org
X-Gm-Message-State: AOJu0YxWQy/nsKZRnsNJxOhgpllprL+3NUnzn7LAi8OlRxRqPP+lLYM3
	5/ytk+eLQZ+kYwzzX06oT13mdkqACrCbpvFBZv+BijiYBAp2I54uj+ce
X-Gm-Gg: AfdE7cmVUCBo6TXQOd5YmxZfZpN/jx7oVgOGw38Ufiik+3VIM/ZNX1YZgji7z100K/B
	B7+lbt7WBerJL7lfILvjagwWxPCigdJUR12TNep7O7dumhtNNr6mpvwLTyVHgk/vI+KMB+Ok1RD
	o1MLeXk2fOYMzytvnfW0LKRTPa+Zgce5OfZCNCxipatfMxVu2cYGkPvmC5oiUm1Memty9o4Rg82
	lMZumjGogAJGW2le7AuuTrnDUUojlgByLhFIfkLfPwvWfzJYGz3V4Lu3fN9AtjdTvbJiNyo5rCl
	0acfqdUSuNl6RWIoQdzCSksdzt4CjvjH5/6mCTwUxxxhYpG02EX/A6t0zTcxZnqD4vgGfF6bK9g
	Pu4L8AeDydCq2XA04m1K62CnVZKmxMErmv3fZXvYIVm+ceQIpDEcAeOncs5vJXCIx8IfYgMPEBQ
	vgofn8NreG+qxHp625YuYDVQVpzeSf0O6rmCtKvgdX8zCwRXY=
X-Received: by 2002:a05:7300:da13:b0:304:56fc:775 with SMTP id 5a478bee46e88-30bcf567d78mr865158eec.21.1781692435786;
        Wed, 17 Jun 2026 03:33:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:55 -0700 (PDT)
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
Subject: [PATCH 06/78] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:23 +0700
Message-ID: <20260617103235.449609-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033356_636552_DF796ECC 
X-CRM114-Status: GOOD (  11.33  )
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
 sound/soc/codecs/aw88081.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index d5e886a8f106..fce56a249a1f 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -763,9 +763,8 @@ static void aw88081_startup_work(struct work_struct *work)
 	struct aw88081 *aw88081 =
 		container_of(work, struct aw88081, start_work.work);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	aw88081_start_pa(aw88081);
-	mutex_unlock(&aw88081->lock);
 }
 
 static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
@@ -942,11 +941,10 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	ret = aw88081_dev_set_profile_index(aw88081->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88081->lock);
 		return 0;
 	}
 
@@ -955,8 +953,6 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 		aw88081_start(aw88081, AW88081_SYNC_START);
 	}
 
-	mutex_unlock(&aw88081->lock);
-
 	return 1;
 }
 
@@ -1165,11 +1161,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	if (ret)
 		return ret;
 
-	mutex_lock(&aw88081->lock);
-	ret = aw88081_dev_init(aw88081, aw88081->aw_cfg);
-	mutex_unlock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 
-	return ret;
+	return aw88081_dev_init(aw88081, aw88081->aw_cfg);
 }
 
 static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
@@ -1178,7 +1172,7 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88081_start(aw88081, AW88081_ASYNC_START);
@@ -1189,7 +1183,6 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88081->lock);
 
 	return 0;
 }
-- 
2.43.0


