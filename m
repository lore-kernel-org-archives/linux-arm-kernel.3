Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1492BC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAVOL9koiJ+YcQGa1QFT/np1LbpIAAvGvOBmeTVIdhA=; b=ArKXUNoJnnI6uSephlhRGiCvwU
	g7wnCkc88WgzYMWq3hJu2r5ucaonVQyDokrFRqTgz9pni67ebaE+Zy8uDAXIuxP9s70qfBp8ReXLj
	RkpgTuK07ofCJlOVqe1Ds+mQIZpVmnoWKOWNRftRJ0ecc2k5O7bOLV2g6K6KGKrXQ6ov2nrco7B1h
	Tn1/l6woIf/gFg9KT8koQ3P3QZikBpbZ75yHRfqU1cqkuEx/9e0rs5ITqh6/NRrW61CgYten8lcZC
	kK1o//5kq70MIVPlwwthN0ysNlbH0hupIsQto1uEoooG77yNfRAKSNphwhFUO7esyzTGCacCIFX5G
	TSsk2I6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89af-0000000Gs8t-1AYk;
	Sun, 20 Sep 2026 04:55:49 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89ad-0000000Gs72-00La
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:55:48 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d8fdc579daso22626195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880146; x=1790484946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAVOL9koiJ+YcQGa1QFT/np1LbpIAAvGvOBmeTVIdhA=;
        b=nzO1uhUhhJfy8vXa8C2+RCgAxgYyVn/751fTWxSIMhFpP734zyC8DLC3hFiJ1LA9Rs
         jXcZlcv1ZezROhLM+OOZRtEeMS6v75a8NONeqPPHg+LTnz4IdVzbf4EixWDr9TqtwTMB
         bwEFVfBn/IQGF44FYCgjl/mCORjCBipSKPA5Jh1f+MhtisrreKA8Hr9YUBe1pPPjzzYZ
         seKUu4ELZjh1QDKdb97ssDO+PaJDehhERNSBtJ1/Mp9P1opZsCYEABMOeGdw5LFROvNp
         OoGV5EeUIFy2oDvxrFy4ZHPnBNx0vqQ9v148RMiDHbxM4FbeVdz47SZ1FYrBk7ZA4xwL
         hEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880146; x=1790484946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAVOL9koiJ+YcQGa1QFT/np1LbpIAAvGvOBmeTVIdhA=;
        b=Xg54dHvN/3f2lKTmSnKJKq3p1CUybvw7pyuf/xGS6jwEOy2B6FK7tqTd9PsxUBZ6Kw
         xLXJReYIyeh4cXCDH3vUeWsh0On8Ikt09Tljl4jp8noWKxuiWQjJT3TUU7hBPjrMkYMl
         OCKTw7m0vUSYLQKqyV90521uqX1E3ooOodmEgAZmipRV+hbcQmDuGLg00ZPuQOkGMp3J
         RITRxII2Uvr8liGsVp9shbo/N784SNGIshN973LIyXrJcLnNkgsnSES6+AAlcG7JXXZt
         xVxR2q/0/8prjJnt/5NE75qUL4nwtIJFwsq7m80oeNT4MkxudlPdurfQ+Pwa9+diX8Ob
         eqCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXIjZs/QQ5ExSlrBg3AOUT6QR5mSJlbidlk3OtoXNWRxs47XAFOmlq4Hg7l2Ba1CI+BkILGCWfko3o824QP39h@lists.infradead.org
X-Gm-Message-State: AFuF++m7sw4yTyMhtNNcCyD9X3BpGREdOIwHv4/WHmH/GjdKbYIVfypm
	h+96FsVNXfaDOgs+E3fqS8oZhESEH84eSxcfC66Rrt80p4pQ+4h2giGB
X-Gm-Gg: AYBFou22Q0UB1pzJl2+5i0ImcNJkmzNkgGXHhEwlAwoQhFInq6h26YQ3wLe2EhUftzn
	TsnEwG4+5/fRB8WAwTpDejzRqB7zOPUMnIKXSpXPnkbMuth728pq9xY8gixLVKwXu7y/Upt/dSF
	qWcEONlRYbDR6XbemHvz2f/scINBzn4wOxv221zMwScaGdelx+BSi4fj9bx0+wVbs7NeDI41lUy
	PUkRMaMAcGDldBiLheqx0l1KHJ6W2YHyU+wLlBTTAMQBqmG9rEUFR2l9gLWD+XXIHI9P8q5JKge
	NK78mECCDsaoDhvQnOoPVcO/HYiGd/8sxR0/FpFJ/7lvhz/lEk+PguTtNzKInfx+z0aAo0pFRaY
	01gu7FCP4arVef7cqLac1XPV8MJZie7kxscKNvVt732tLUMMmefd5ZFG8uyBlFVYcaeb00Xc/2h
	D1fdE2rAZpWNfMZO45rhUcNAgWBYr0yVfcFnSgqX/Zv5lCSFT5v0De6Tw/35p56vJXqhw+iOs0Y
	KXsC3WRnCPQE85H5h1Zv3QbvQQv9vlWP4u1yCWCTmkG86SfjS+as3CLgDRYOS0OXJXzP829jfFR
	GdZyk0+agLWDG+X/n+5UuxwzwHl40wtSs3sIZ4k4z4K6XeC2TonaiBSz8A==
X-Received: by 2002:a17:902:d4c6:b0:2dd:c100:3130 with SMTP id d9443c01a7336-2ddc100319amr56593615ad.44.1789880146239;
        Sat, 19 Sep 2026 21:55:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:43 +1000
Subject: [PATCH 04/28] ASoC: apple: mca: Fix PD link double-frees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-4-741cc20a74e5@gmail.com>
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
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=l6ILyllDJHogvaPe0jQmA0G3c3totE6rg0ScLhCeibc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+U5j3Q8K1d7n3zG7LTOxmmXz5Q2XzaeunGxT7HUc
 45m1SaHjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRPesTwT+HVJhMTvqn60VdsGRn0HgazSXQf/Jq76funXvH8tlWL1RgZWk4ftrd
 /oNc+ddnUN1O2mJZWhlTNltBy1Hz0+n246IQNHAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215547_199295_F4EC7578 
X-CRM114-Status: GOOD (  13.89  )
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

From: Hector Martin <marcan@marcan.st>

Add additional checks to ensure MCA PD links are not double freed.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..66196c6a9273 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -303,6 +303,7 @@ static int mca_fe_enable_clocks(struct mca_cluster *cl)
 	 * the power state driver would error out on seeing the device
 	 * as clock-gated.
 	 */
+	WARN_ON(cl->pd_link);
 	cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 				      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 					      DL_FLAG_RPM_ACTIVE);
@@ -326,7 +327,11 @@ static void mca_fe_disable_clocks(struct mca_cluster *cl)
 	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN, 0);
 	mca_modify(cl, REG_STATUS, STATUS_MCLK_EN, 0);
 
-	device_link_del(cl->pd_link);
+	if (cl->pd_link) {
+		device_link_del(cl->pd_link);
+		cl->pd_link = NULL;
+	}
+
 	clk_disable_unprepare(cl->clk_parent);
 }
 
@@ -392,6 +397,7 @@ static int mca_fe_prepare(struct snd_pcm_substream *substream,
 	if (!cl->syncgen_in_use) {
 		int port = ffs(mca_fe_get_portmask(substream));
 
+		WARN_ON(cl->pd_link);
 		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 						DL_FLAG_RPM_ACTIVE);
@@ -423,8 +429,10 @@ static int mca_fe_hw_free(struct snd_pcm_substream *substream,
 		return 0;
 
 	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN, 0);
-	if (cl->pd_link)
+	if (cl->pd_link) {
 		device_link_del(cl->pd_link);
+		cl->pd_link = NULL;
+	}
 
 	return 0;
 }
@@ -1145,8 +1153,10 @@ static void apple_mca_release(struct mca_data *mca)
 			dev_pm_domain_detach(cl->pd_dev, true);
 	}
 
-	if (mca->pd_link)
+	if (mca->pd_link) {
 		device_link_del(mca->pd_link);
+		mca->pd_link = NULL;
+	}
 
 	if (!IS_ERR_OR_NULL(mca->pd_dev))
 		dev_pm_domain_detach(mca->pd_dev, true);

-- 
2.55.0


