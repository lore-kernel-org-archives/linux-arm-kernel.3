Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E046CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=; b=14C1JQw1C5J6bxTyZ3N832G6cP
	NtGbuIqCImj2QW6ZAqUBxtwz8KekCnVJBvrSqzP6foVqGxmja2cgouLEGg1rr5qvQlEf4ZKWd+HNk
	wZsbM1sfFxBn+CJ29qGeQLXkst1sPCmsRpq/KeY2W27OFhTHI2l1I1QR82+/4948xfibakKrdzU0f
	xt0iI6IvWA8Nzq49umFFeOz09g4oh8/RSgOQCFbSbsDR3t7gwJueDvqvcaH0evxKTHork8iqGKlvz
	/Z2QjICtOezq5F2NlQ3qDnAYKIOS9Xbu+kLSI5lhFQpflegpRRlrwPLgM62xkos7auZuopp9o6HxQ
	1oz/Mhfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAfB-00000001B84-2d8f;
	Thu, 18 Jun 2026 11:12:01 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAf6-00000001B5e-3AOf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c6afcc99a5so3586075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781116; x=1782385916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=VoRq0oWW3KPAq3AG6Ea3MNgYmYv8wGcce6zKd/s4GM215HAVssImjgX0n9TSNk3WBR
         HO2qu0FbesICqy78nL5qbT+7P0KB70LB+VwrZqMloSzVtblksp8TuY0iZPYAUeWyjfOj
         BaN96xc9ILIqtysuZe7TFmzp85WThtw/o0az4LephpAv53+vomxrV+FXXlioLd3anm/I
         MuaIoYlVPMw7fiPO7hywS20Md6vZB3I0ybGH2FmhXX2Ho4YwuF2mpA3DJLMTDxs9x49v
         AgFv8J1prxz8ufuMBtLmUViKC4GA7UHpTpS/fgav0k/4IVNWrzezaH0Pyqo7nUjFImIN
         ynog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781116; x=1782385916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=qVdOgoxMjFRU5uIDtowKmv4lk8eLCDK6R6DiP3skAV2bGBf1fdtsy3MTyB/Q13Ml1i
         4htFiAtoS5/t1g+uwPkMSNeCVRvu++Nz9mBhBVpVNVwxm3z9VrjXL9/vaKdvp5o6rPed
         X+82atEMUxgKJQGXJ5/SbhUa8Zc+AOBhg8/RkU/zhUZ9s6MOdCz1Abz8LxdhNhmmEa0z
         rX0X5/5G52iH9HrCOOZCW+yOymoV3H15xPwikLakoDZl6XisRJ46Jo9HLNdOjgJ6jawT
         lRD+911TgDWP/yiJFHKGa99D2g3N1zyqhKybWVQce4fX4FmVle2tAxfOsciv1STFrZJf
         vM+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/tYf6CHKxU41q7JzZYLd/R2mZG06h4AUqgmKPUBmzqgb9QDacNCehP2KJBMvbr7HD6VbFvsfrSMAWaXjJXTZoR@lists.infradead.org
X-Gm-Message-State: AOJu0YzBc6n8fQV+DyQNmErSC8T+Bwrm64c46a8vo0BGze7VKOQ76V8N
	HpFfi81YPMnhVRrGU4seH3R/DM0NLwv55MSU9h1DQp1w5Vs7Bh3+022E
X-Gm-Gg: AfdE7ckgwhF1bP4+YgjQyYXmTx02nKX74clHJEvEhfKlFEEoskDpzfbAeqohmZRQrZE
	xL/t83nWh9VvgNdkewp78JJ1MlRupWu1La8W8gUw2nDsxOeubVBoEA0YgVXDWOJtrfvomoQwpvE
	DjnazLK3dwXyvwZjgGZpwy+fA9UTC/mhn4YwYtKaaAKjrWmTxnukDaCaZ7Cn154U/PavQ8uYFPn
	zMLQKgSSi5Aynym6tP2EnqbfPUWKoQVh3Jr3mXaIpiZnhUf8ME76IdArFzcYC0ke0OqpdFj+ZBE
	Yfe3BXc1JY40Q59GngVq8RZQBGYL4w2MZUsznJRIghCoM7cO2LWTX4SPg4SUeRdqWC4O+yHC4cW
	PdoHsPvjT4Oq09/6cEZBqjxb3J4Q6afiN7PQRhvjf0DWMe0rTeultR8s8UfEnN8fiRKlBSR4JN+
	fVrMAvdGVEM5SK0cASq0vk+YfX/M3/N+haktzdIXAp7cSv69s=
X-Received: by 2002:a17:903:3510:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c6e00b0e69mr29505545ad.28.1781781115885;
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
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
Subject: [PATCH 78/78] ASoC: codecs: wsa88xx: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:27 +0700
Message-ID: <20260618110827.232983-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041156_802427_70C56F36 
X-CRM114-Status: GOOD (  11.07  )
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
 sound/soc/codecs/wsa883x.c | 10 ++++------
 sound/soc/codecs/wsa884x.c | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 468d2b38a22a..7d9e0ceba461 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1237,9 +1237,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = true;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = true;
 
 		switch (wsa883x->dev_mode) {
 		case RECEIVER:
@@ -1290,9 +1289,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA883X_GLOBAL_PA_EN_MASK, 0);
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK, 0);
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = false;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = false;
 		break;
 	}
 	return 0;
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 6c6b497657d0..89c560428a9e 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1701,9 +1701,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = true;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = true;
 
 		wsa884x_spkr_post_pmu(component, wsa884x);
 
@@ -1717,9 +1716,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
 
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = false;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = false;
 		break;
 	}
 
-- 
2.43.0


