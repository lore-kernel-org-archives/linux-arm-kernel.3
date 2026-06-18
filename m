Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4579ACD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=; b=lzJ1L8wu51TndN9pmu73Hf5oVl
	gpXjEGLYNVsQpuK4H0jf59CCwSw/tBv5hnas3uxSyghGECi3DaZydemjlFuwBmsEvzfDWEoyB+4kP
	Gr9CnG2V1ldIyPFALLY8F2eBkuumxAfyJRfnMJHES4s5QXgocHanldbbXfCI0NOyluPbYWVooZ2vI
	aYyewwxkqZjn3Vcwwn361vTytFnRHzqL8+2cEkFzHgq8/l8t6ah79qSp/25KTLXEdsLxVSFrG0JOw
	Ofa/KxVV7UQPyWxLpQ/BYsugaZA4J8Fix/8zmm0ryLkbPviC1joqgLP1Kcq34qmbGo6R2nnuT0tKZ
	wM3yCT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeI-00000001AS8-04gy;
	Thu, 18 Jun 2026 11:11:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeF-00000001AQM-3V5l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c0b9328c4aso5620885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781063; x=1782385863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=;
        b=VumaDQfMMfmQbJ8niiK2iGik2ZopdtI1FQAa8Y/+WZNhAVJNpIVFtMEo9TtkQrc/41
         haIsGcmEF/9S54YfYiyxHgTBpLpLNS2E4aQb+F4y0LqBev6TRWYiAvrEIlhdJ7xsmIsi
         t1kzd4zm32tPqSjt9LGCGiCdqBXBgopAlD/jGgdBK4emIuXkQe15kqTsYiju16M6HEyU
         w2DSmDbTN6gXsNZA2BLVS+e4igIrVimySUxS1old+YpO5kBYOzoNVGzasa2HICjq5hY+
         YIJhSQ/A2kk9jhoGvPN/p57qHR9FIww8F3tHD6G+TSERdNbhHVKmifJTMMqgJboiq3Bj
         IMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781063; x=1782385863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=;
        b=UA4sKE3keS46/2VT8a+bz7GPvnY+0zZ/llQkYl06ghShNga/a+xEzI6UBvcl/mKzK2
         nSYfRvg9fruIYDfcWlQOS46QfpNOLU4sgIgYfhJ/9O8Yq52jfDw9l2Ob0rUV7B86M28s
         LfmRQU/ZRoFHjEhBMk+W19J+FLdDb8Jby/Cg+cLQITilglXVV3ndSFtcNOIXm4v3qAg9
         CmUZI2ON4AiSoGXerA7p2IzC6n/uYsK77vI1xLZFbVvzJmWAK8k1uwaAJiD7eli1oqnc
         E3JDgWyVC5k5WLtkSG8Z8npWEHGBSts4GDAlo1sMUkoN7hcEw7QMnrlpBwExhx7QTzIJ
         sq8w==
X-Forwarded-Encrypted: i=1; AFNElJ9Q0seAO7ySmnX/MirSOc6ovK8cViFI3SQMU8jgWL99OErJcDDfHWtKp0iaf3WptlqX7hiZvDxVybtcueKxGxUU@lists.infradead.org
X-Gm-Message-State: AOJu0YzB0xO7/+zvBcWMJmZtuoc5UBEz+Pkv1ZnGmmQcmEDKSgwgKdPT
	13qk4tFs98gwl9tqBsGwYL2xscHLkjdae6EtePxJSlg5tVPA14Qlr9iD
X-Gm-Gg: AfdE7ck0+TYu9Y+LKGXh6OtJh1MNYU3SdWYqs4+f5YSpKbmJJtZOol9WILEW9NoQ7ye
	qiFs2yV+N6D3dFSpaCaaNXZHXwXbZfIfULl/fjA0lTSyRjFu651/18uwjGLkheCIb0xOyWV7pxK
	mjPT0VCFFrR9U1RZlYoQxA8JIw28H85h49gp+adNK4Tv4GcwyCD1MkXrL86bl45uA+zqnwxqkB7
	ffTlVaM7AibKAcfAbssvKozt6kGOZi4e7uxE4ZKhhLbZ93uQLrLi1v4Q0LslUGudb41uzoVKU1W
	DNECXm/ffiv9GlfC4J36WDwHOjMfIQuWNestxfls/RGoBWHWml+i3BLC1f4Bp0hdttx/I8BCgjT
	MrPEbQjl+R9yO0sHqww4sMABFkEa3jyqu1Y678Ig2OyCPOF/981t3k3NKsZn5oMixB/r4Dtarl2
	93yreSUesBJQbaLw7BcESOUAwYEE2aN1ktkWtN7bU1MPwpN7M=
X-Received: by 2002:a17:902:ec87:b0:2bf:1cda:29ce with SMTP id d9443c01a7336-2c6f340c89fmr22802915ad.6.1781781062990;
        Thu, 18 Jun 2026 04:11:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:02 -0700 (PDT)
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
Subject: [PATCH 72/78] ASoC: codecs: wm8903: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:21 +0700
Message-ID: <20260618110827.232983-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041103_872749_3AB86862 
X-CRM114-Status: GOOD (  11.91  )
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
 sound/soc/codecs/wm8903.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 320d7737699d..7c87e927836b 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -463,7 +463,7 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8903->lock);
+	guard(mutex)(&wm8903->lock);
 	if (wm8903->deemph != deemph) {
 		wm8903->deemph = deemph;
 
@@ -471,7 +471,6 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 
 		ret = 1;
 	}
-	mutex_unlock(&wm8903->lock);
 
 	return ret;
 }
-- 
2.43.0


