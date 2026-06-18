Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58018CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OY5fb/Dq+8t+PbF847YNuNR+1WYPM7PZhbf7meKQVc=; b=qm+ks+3wvLl2fKEoP7M0dlLRba
	NthLFTG5fAJ+6kvDxk1CKWRG7xeCXHzOq/tSfhwxFqvnJzh4R1hfgTQj7GVcW6kD9VjB5YIIH2Wdl
	lCjYLOXV2DabXExmEcNLp3ctIDz1mCLhbo5zaaQo9RfrnRNb8484OpNwodB7vMNSahiWs6ITfej8B
	pVzo3DaQCZ7KFUBq9OTeI+w+jniZKmuq5Tc1uptmkSk2fT06l2F/9nhmqXn8zKYfZSDHfITa5hLtf
	gaYvEcM+sefqeLSx+Wm9tGDUDmQyUjisRKhsDZ1PADokXacbXEXmOqduUTixcDKMidx6r3DRjJ2MQ
	yO7vbLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdc-000000019v0-0FTV;
	Thu, 18 Jun 2026 11:10:24 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdZ-000000019sQ-1LL3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:10:22 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c88d1d4543fso592707a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781021; x=1782385821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OY5fb/Dq+8t+PbF847YNuNR+1WYPM7PZhbf7meKQVc=;
        b=os1lWWhBlLsM7MaSVK2jaPwbfeW4fKk2yZ3CakNLcNuQNc8Zw9yUHo6BFFFgB4PmzV
         N3WvjhIyxeoufx5mHLLmv261OLNhNQbiw7Q0eR9cPMDZw9aC068GJfUOHSnAbwpI3Pas
         wS8jLCevYAuFoDhZg+A2dL/RAkoJE0hSLOM0dQFR6rbjUHJaK5sWbU0pgZPXjkIWRUqY
         D12TK27x1WuGX77HgkEHtTvkTbprT1wGdKkyk0jJwnfkSJFxHqSERbWYGe5nt1FDG+o9
         7VP7DNhQgbx1nMyDveuTjDd9aPb2pbcfeuoILFipMtLYVW7kSQqSRb5EVEh1v3R/47tx
         8JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781021; x=1782385821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OY5fb/Dq+8t+PbF847YNuNR+1WYPM7PZhbf7meKQVc=;
        b=KsCQ0IWs0hQYszM9J+HVgsK6PY2JztAXXTBoQC2uhjhOLwS5ylaC+r09MOnfGFPoCu
         NJTzWyxKpxI7o5UYPFlwk8ymMY8vLEd2ZAF6NclU6NhQ8/3kAHtwq2X7DJCoiWFUSqge
         SC811tMhIm7lu9jpMq4QpezoDQs8H9u8Y2iSxIn57FvMEEkKtW9p8hilA3hIJer2jY7Y
         qoWr4daMe/XJfNpOaTn8hkBwRGf7bbO+cHh4duTMkgiFDhcCWL74jdQTeBlkfwiNSrst
         yF2zPcaEdMH8TgMFsPXAyetx8xfXOm5AXX169oV2EA3so+mEXj+npWxfkdQ++M1XuTTC
         gr8w==
X-Forwarded-Encrypted: i=1; AFNElJ/YY8Y7DnQdhFz4tviFnvhGJtBftS9jOGtc2q0K3ljSi+n9DQy1pqSOvTa3zKRJNBPouh3cLu0XYzjclfejNsK3@lists.infradead.org
X-Gm-Message-State: AOJu0YxTau+OlNDyGiXAxPvtHwwDBp5yQqK42B7wv7Tp8yXE1+BFLWET
	0K0WOWF5F7682oFsQeVpxvgvDkFADfCO4OI6ULHrBZJriQKIfY1/SL9Y
X-Gm-Gg: AfdE7cn0K3gb9TCOWzbxCEnJCs1a7gQMsx3tT+U4qu4dOx5mo9LS/jjWERnLFe2TjMO
	6P8WHJEC1NnVkMU6kH6ayyiFW5I2qpMdGWIxQuWEV6rWG4Z2Ew22VB9y1OEjSnms2bE1uSevcp8
	9HgrXR3LRKzDbYbq6OcGtBlGi1i/4mVOsjekgzn80q/2tX/kzkrn70tP4gefFmD3Ya03rHwQKhg
	j+McBCInsQ9YBq4gLPXVgWA1jjTnUjh4RKwgxJq1goKxe3j1rJ7FmcJrg1Iea4mWmIEinpS8fmr
	pmKi6cJQ9I9vpKkj+BGZ3crlR68OrjzMEOTekuLoT0JlaYGlXRYWUr4WrLbdFmjdInUWB5F3ZDA
	4wU2FKS2l33mbvXW60u8MlFMu6dxnPre/8WjwFF2Rsof7UWCirDkrXC/MgMyOHjJO0ePz6YYLFU
	7+x2oEJMeNSvFnV3oR+7oKdmNGYC36TAiWAIWzg7eI4fZYIiU=
X-Received: by 2002:a17:903:19ee:b0:2c6:c9e0:2c17 with SMTP id d9443c01a7336-2c6de3f353emr31079685ad.8.1781781020504;
        Thu, 18 Jun 2026 04:10:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:20 -0700 (PDT)
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
Subject: [PATCH 67/78] ASoC: codecs: wcd939x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:16 +0700
Message-ID: <20260618110827.232983-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041021_398410_73FE115C 
X-CRM114-Status: GOOD (  13.52  )
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
 sound/soc/codecs/wcd939x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 010d12466722..922b6a0423a6 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1923,7 +1923,6 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	unsigned int micb_reg, cur_vout_ctl, micb_en;
 	int req_vout_ctl;
-	int ret = 0;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1941,7 +1940,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd939x->micb_lock);
+	guard(mutex)(&wcd939x->micb_lock);
 
 	/*
 	 * If requested micbias voltage is same as current micbias
@@ -1957,15 +1956,11 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD939X_MICB_VOUT_CTL);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = req_vout_ctl;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return req_vout_ctl;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	dev_dbg(component->dev, "%s: micb_num: %d, cur_mv: %d, req_mv: %d, micb_en: %d\n",
 		__func__, micb_num, WCD_VOUT_CTL_TO_MICB(cur_vout_ctl),
@@ -1990,9 +1985,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		usleep_range(2000, 2100);
 	}
 
-exit:
-	mutex_unlock(&wcd939x->micb_lock);
-	return ret;
+	return 0;
 }
 
 static int wcd939x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0


