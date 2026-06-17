Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF09CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=; b=vtGWDSam/tJQAdueHYvzmnVlGu
	AG9LKQHpUtvyarRt8kHbm3CBj5xdYN0szP1lO+gfV4sFKJ82jklLgMb9WbXS0c52mhECB1UYGLRcc
	fePfNgFpHMbvc0vPi7AP0HSwKZPhZZP/wBTOQDeDfMRxr3PcC2z/i63PTMPqnUomp8RwiV0kT7hIa
	8zcpdbgyKU3LFNHkSo1pnvTCwItzDUBbTwQgaxlwJnEGaZ0wLaV6RTGQoT6fGieVLlf8j1w4mFOuN
	3MdN98ndgIa9cM7Ev/75JxZGk7+ZRaX06QqBU7mTA4ca/eVVOGpAKoLyCQX08ZBU839k7TAfRyCII
	5hub+60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnd3-0000000H5z7-0Twx;
	Wed, 17 Jun 2026 10:36:17 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnd1-0000000H5xA-0UFv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:36:16 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-304d8362a58so601776eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692574; x=1782297374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=KW+jrDOC3ojuQ8/ufFzCVy04DS2hvJo78jYVA281usb41KRFN7aukaKzWwM0r0GNQF
         tAiw//TxwKsdulqMnK9szJZTC3QWFFs8FvtyEwZXfPh+NUSzailhpYUIWXYVCnhdWG8r
         f5kJR2Vlt5nhegdUAjtM9D2Kb6CWAYSl7chFOXm2KrAVATTJh3F5MJ8wreLytZSzrZBL
         blseVP2uJJpELzkT4Jbgo+k6uYLlBOQixaKG6MONUMO88P6RqeSG3D0JH5TRvGSG4Jbu
         tDXXkQdiqDPKPD+Nkxdjh3icfCaZQPU+jy9tMazJFdX7/85PGgzbDz81nZhH0i8fMYDN
         klqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692574; x=1782297374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=RikWx7FSKCdt8Z3Q7h+cYleTQA/DT3/X//uAGB7pmy0GxF+WuLua7ATU8x/GLMGhv4
         DHgQm6oh2bln2l8QN9r2RIhXMOlUjPQNiz5+yc4MH2uCgG1nwvMukYiaHLa/iMx1UfVn
         Bd0gVs0eLg/LsbsLgu5QO4DmnYTvBhvp0qsI/UCVXUhWeBDgWtmydADfk146MuWgvD0j
         F2QOXIUPo2NSW5hngD3CQi+LGSVb73Ho/NsYmCNS8Nh5SYBZh9vl3dxGbpWbTXIOjLVf
         KE72tB7wec4GgOtXLKZ3BRZDtGSJ+9thP/K8jws2k/W7p1g3x4fhFM1ogLj5X2xestQ8
         6awg==
X-Forwarded-Encrypted: i=1; AFNElJ9KtrMMdXwW2LRt1ezUlrNceSHzygfPfRnjmeg9RFG152rn/nnaq3L6B7uNRQwdTSy2uh4uZRRQ7fGN3DPqI/XW@lists.infradead.org
X-Gm-Message-State: AOJu0YzPkuBYAZCVG9pDkQzQSUZ862cKo+hMIb1/eSTxF43+9lMzwBR5
	LTEIL4p0P72gzbZA0OS7wJNY0qdk7PdYlfRPP5Vtrb5864SDFQ48Un/OPZZWeA==
X-Gm-Gg: AfdE7cmDpH69IqeG4NWD5t6zq8xUSVeisy6p7d5+79kqeWt8KdKIId4QqI+E0wLFdey
	7/SAiNJ2PGmaaiZeR0DHJQkPU1sJW4Si9gCWWBMxuBcwqzN1/9zTBe5yoaPoN+ThwcxTrJ3jBLf
	yTmgccxY0l0l6oJvun5VkceotORTdOsTC3vFdQTSf1sC8LBmsJEoEqSjwObsXJBFcYv+DMUJTHD
	eMqGqe0c7jjqtEj1TbE2lOtprKQSnVxuVMFt6NqbaLWJpUcNK1Ymx0L7dqJk9kYYA3gENLSsiJS
	e7izi36qp/3UeLa1ndyZ9bewodabWSzbwP7YRogMxj48SlykiYBjgWtqw7+NNjcdcXDtJx4nRP5
	PUY30s3dzDO4+1QSgiplaLNC4pmYAeHzN/wg43hjy2ZsrbxbkvNB/jnlrTR6da5nj4jNAVjBXNs
	NZPdIfnhxJvg4XhSj0um9xa7DPTsGrjAXdVQ16k5AUbYWmkjU=
X-Received: by 2002:a05:7301:7308:b0:30b:e524:77aa with SMTP id 5a478bee46e88-30be5247ae7mr89541eec.14.1781692574470;
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
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
Subject: [PATCH 21/78] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:38 +0700
Message-ID: <20260617103235.449609-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033615_146461_182D3942 
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
 sound/soc/codecs/cs47l90.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..978149245079 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2423,9 +2423,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2455,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0


