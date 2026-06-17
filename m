Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DABCD98F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=; b=tJzulJPiBilUKUC3VVGZSM9tNP
	MMd/+64IeS1y/DgekvT+cFxTXM9CNGVBZit3GSCrE5j0Y0b4hnxTcKomJcaUBQQCkgC8kzQLRmXtN
	vZBh2fGqTiNieLS+3Qi9zAe/IxegSNYG+JMPzkSBKgwDuF0gH3mDQtsKiCAhaCX8k29AilaQt3Rw3
	0GsWAMMHzEslBFQaRyLA2KMpM4fQ8n0oLIscGGACHTNFGm15uByUGKXYD1pdAL/ZjHU6i0nrYsgZs
	1sXriMrydPR8RSgxXcBFU4GnYG7fXD2FQ4XOowV70WVJtYgqHUg4ZlFhlrs+RYkTbtOfpNHHDTsOF
	Vd5QzUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndG-0000000H6B5-1n8Q;
	Wed, 17 Jun 2026 10:36:30 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndA-0000000H65c-0YfN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:36:29 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-30bcf74e617so1415623eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692583; x=1782297383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=ssOFwRJ/bTNViA5lbsVCsRgknaKn1sqc+YvpcNgnta8PrH80QEstXMTa21A/GIY/8h
         CxJvLRU7FBOp3DaVLufPtqCLjYZTiNuIYP3PAo8pllK3/HQW1df1v2sn3uaF/wqAsnRp
         +w8X/vVQj1FNbtfOQf02yaDj57NalUHUu3Eo9fwq4YawyiWIWPX8KaEIKU5jIl8Jl0ej
         BLQekR7X6g2TzXYz29oU5wQyUP2oxuu2DClvOc2i4jYekiexTkt9sBlWdU6DavVa+mQ7
         f3feaCDk3k6YCjyM+MvfLdm5LgQX6N7fxy5yY2r7G8oIaB9cevAr0gcjNHYI4HsQrde6
         XMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692583; x=1782297383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=h5ieJYru+FJht0rnb4koyXm2dTWEMemE02+ibBZjDhBkZ0QWH0n7fjlgnHGd7j9vW8
         mzXdFvRbnBOHFNBE5LeXeW21GJsc94jIPwMmEZwFaEPITaRMM9r6Q8GIp7AOQOfpvAGj
         rbvh1rqPl5oWZjNfGIfJHVn1vfIyeJynOOLmVD+FuW2rpYxElQDnfB6GOFOIXmbs1WUB
         q5gBkThy49j52zmmy91fBbK340FJvZdZdpbwDVZ/5HGK+w+LhnKZS0M2yZXAnAwZJ34c
         dgke8jnDC7qe+X+2Ed8RvstD+K3qMcloVsp5F9jGHEa6Rvn5LQ7LrRKkGiFoS6wcBWVr
         eVwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QjmZykKIyS+POpLNKlp9dR0y8hHtZm7CWra+q2QACOX1sSrcMN3rb6NY7Q6uc2Cyd5Nf80qg8D/rhJWPmA+F/@lists.infradead.org
X-Gm-Message-State: AOJu0YzgpoQwSfLvXI/Xi8L4aUPDUOfIi3LcG2LaBggztuqCII1wsM/r
	QVKyIZxKOVIs3dOt1jR/8GJITKDUMvehvq4GSnzs3nYSFDcnKHkUCKOr
X-Gm-Gg: AfdE7cmX3fa9G76+vf27BBc5c1zsgHL14ryEqKmX0HA/FwhctmWefrNRm0V+iBfwD8T
	Nb00DP0OIDuIZt8yNise7GdCPKPvqEsez2jLdunOgNQni0eW8uBGtxi4ifAaRHwYTiWQbDkidqn
	befDqxfWneolPqv+JeaSSXe+mpyfmzexqHPOgkcMfTN61s59I/3768L54N7PUHTBcm8jZuc/c4p
	b4noTLPWvisVkVyEdxlhqTGPxqMlP58z9kPwYeLFQIIbELynx+qOo/+/Gg7m3AXJcrztbmbxrmq
	821o2j9Nn9uWqgkqaaLbB7sh9jWJC55M+03525qmwIF286bzpmUwAPD4t5fjN/5uKatrffgYGT9
	gVRV1f4jZ6/4mimDbWVRrjmX24FME0UdP2EpYc/qDMLeLq1XVdrLzTPNf8ONz4t9axJLZjpnX9i
	2SpIF1Obsc/7ec/ZChiNr5DlEtv19VThZqEZJsAUusCo8TvtA=
X-Received: by 2002:a05:7300:430e:b0:304:188d:d0b0 with SMTP id 5a478bee46e88-30bca0b8c3bmr1984423eec.20.1781692583469;
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
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
Subject: [PATCH 22/78] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:39 +0700
Message-ID: <20260617103235.449609-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033624_181273_2ACCCF68 
X-CRM114-Status: GOOD (  11.23  )
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
 sound/soc/codecs/cs47l92.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..4abc896caab3 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1892,9 +1892,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1921,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0


