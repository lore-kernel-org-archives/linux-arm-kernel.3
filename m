Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5153CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McfH8rWJuuVUcm1G/yfvz4+Q+IQpATUYtGec2KxjrME=; b=iWvSZcQYVLp3AXMSVMfIPPxUJ9
	s4tVJp9tuAAe3bQMxr7CnZtJeNOfrJvDLKwKOkyMwRb7F9SFwqpM/tVLuq5rDZW4JcYp1LK3EXet7
	nklVaKJhcAYeowfobR4lSnXp8QSqkqN96crxhXnxXYOV5Wu3NgHgVmhf9F4lwOjk3SvIfEDDdJJ8R
	XIU4Yj3KPUB8e2eTl32ZKxeQWDB+jDueJ2nbCsI3+ouX5VpWoRiNh5bATjPzdgSlL8gj6uwWuVp9O
	VMMmKNtlAj9jfHBuStCTkgdWMwKrFBdLdgonTq2CYHAuSG/pLnGhYrMCZwKoV8vzjuyC7B69StCdI
	enNsOmcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAe1-00000001AGh-2cnx;
	Thu, 18 Jun 2026 11:10:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdz-00000001ADs-01FI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:10:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c68190ade4so14541575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781046; x=1782385846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McfH8rWJuuVUcm1G/yfvz4+Q+IQpATUYtGec2KxjrME=;
        b=Ic4b++d7IPDtxQniktppxDAdIgAbpCTelS4dltLcV3SBRoY57pOW4DC+1NFfUop8Jw
         cNoTjVfK0ER6eb91v3FzGpyaP7bxisK+yjJreADRLSil8nuepOng5IICpzYqrpo/DFtz
         PU+h+yw5Dt9lb1akUzuTZ1Dx0eKRtwXuzJ1GEdifzVAvn+85EG0j7VDsr464AQXN0hzd
         EiisWmgCOEhMXyMVgqgGt5bmr7Ju3isormQAJOvVfTqIP3lr5xeIfEooq+qgjyZB6tTf
         LdFxZ6u+IEDJI3QmxCOUeGAsSdEXtnV7PctqFZ1rY89Bd6fgB+5KLXb90mcplP8nbUd2
         Xaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781046; x=1782385846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=McfH8rWJuuVUcm1G/yfvz4+Q+IQpATUYtGec2KxjrME=;
        b=ecfTlHW94JXrB2frBokmmSA1ZtuwVuz3apuZIoCpKoSUZOsCH8J+lTv/pKPOaXPHQQ
         Z1hYPrlf4HVSi5C5xDKKBx8Z7rA9KlKIDPoeqbr1q/WhddbFarUrDIgNzJll4J1Zts3S
         SSawkwDHqBpow7g3nElkpI/7iPHXKrrB2zWRC9jYBG8Kovf8RRK1EyZ8ZHh/0Dc89KPM
         TazWVfynmQ++Oh21zizKLBjQL+dSrtyX+1OznsRAauTO9/rZOb264eI29PKLbSOhX2Z1
         wLfzBYIUhCCJDdCqca90BOjVgoe2Nk5BgoW47OYrjW1XNfxOULKp/QEq894reMaZ43EJ
         gkWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qmRyPmu7tzBcIlOqj2oDRPxI1DjwpfoNpuA/ONLNTVmEJnATT4Kf4RSjrQOXsVhwl567GYeUBL82F+9NuHDyd@lists.infradead.org
X-Gm-Message-State: AOJu0YxDVotZaXztAw6NkMPCIy/tmFrinowH+hIHyPBxxYJE6TkprO9h
	xObL1wwbPXThYmz75Lo4AsnDGkBTvhxfO2gz5EBOU1HTfoZwo+Ud22q/
X-Gm-Gg: AfdE7cnBBEqh+J3V7dzaxYS6rDF3S2dR9kTBKnVtFhgW7nT8JXEjPzy0vpCax3k6iTo
	a6ytdtOu1c93RzQghNpSfJlGqQeSwBckMs5kDwhL4vsyOlLS4YuX+Ou4HNAQ1GfdBavDhAFZjgO
	ldgF3MfnuwXBHmwANrs/PDFkkOLejXL0/ih78xjFzxe4rhNuQ4yZ8GSNXqE+ybp29uJOb21iwqW
	pIATYatIJ18eACYZtxscyQdb5flhvlGQqG1bnXfhKuxNdDvMBR81jfNEhD2K2tj0tRpfZFF4k/q
	dhegWm85nBVY5Q4a5GPnuuXS+o6r62h6OQLktvGNrnL8+OLwvwbTpS8kp3eH/rl1doeiOrsZBAh
	XzL4mi134r7nyNc+6rrjwMsB6W1aVn9dD7TLjGzaVhEZI9UYUxVjXamKjSKqzrCdQPpTQAbq85O
	tGx7oK2XfC3dU7rtdjWXHDlYHLMECePMNpV9Igv6ET2bMCRMk=
X-Received: by 2002:a17:903:22cb:b0:2c2:343:88b0 with SMTP id d9443c01a7336-2c6de666d41mr28427805ad.19.1781781046290;
        Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
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
Subject: [PATCH 70/78] ASoC: codecs: wm5102: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:19 +0700
Message-ID: <20260618110827.232983-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041047_216175_EDE2C988 
X-CRM114-Status: GOOD (  12.14  )
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
 sound/soc/codecs/wm5102.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index b4d4137c05b4..d0b6707ce62e 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -667,10 +667,9 @@ static int wm5102_out_comp_coeff_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	put_unaligned_be16(arizona->dac_comp_coeff,
 			   ucontrol->value.bytes.data);
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -683,12 +682,11 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 	uint16_t dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
 	int ret = 0;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_coeff != dac_comp_coeff) {
 		arizona->dac_comp_coeff = dac_comp_coeff;
 		ret = 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return ret;
 }
@@ -699,9 +697,8 @@ static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	ucontrol->value.integer.value[0] = arizona->dac_comp_enabled;
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -717,12 +714,11 @@ static int wm5102_out_comp_switch_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] > mc->max)
 		return -EINVAL;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_enabled != ucontrol->value.integer.value[0]) {
 		arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
 		ret = 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return ret;
 }
-- 
2.43.0


