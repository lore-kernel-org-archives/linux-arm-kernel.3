Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E43C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4y87oy6OKAiqnu/jIL3XduDUN3BGcMssQM5AWBSQLw=; b=ntQGsQKVVeWZVsCMtsVTscwgwp
	UxdjfnFolxTRtCfQXN6xi2CZmD7yKYmmqCSg/mSaFRhtlc+SFH5m0ssoe4gfRSnLDzHQKtyz84MG+
	U7PPu3PVim3+MoZPTE9f7lQ+E8l+l912Q1ITpxLhrzvnkIPf1bW5uo0gUC8YqRK2uu0zSd82/Nvjf
	FNvA5uDVNze/Plv/qZCVKziPW6ceAHXEaBlPx+o2wRqtOqlEe/s/kWevV7/urQOEkCDV6WNrDAG08
	j7cXw1BXYMNUzn4NCRSUnJF6BUd/FN+UbwWpsPKzKgaiaQ2RFOicV52CnE3MrYyU9EPh0FnljWJp6
	fETi0Dtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89b6-0000000GsS4-2bNF;
	Sun, 20 Sep 2026 04:56:16 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89b4-0000000GsQ5-1lxZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:56:15 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2dd77300825so20378475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880174; x=1790484974; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4y87oy6OKAiqnu/jIL3XduDUN3BGcMssQM5AWBSQLw=;
        b=WpCEk3rX7WC2foF9K2CngReeeHtAyZuoDWq8vmxvVzzdLxoZP+A8t70efI/OEjnHtp
         57jfE4nHqVMYUtjKZzVRfPzlHsK+/McOQcaPccmjFDmHODNG9K+/+qyJbwfZVijMbHph
         FhqLuG4MYn9Z8fh5flZ+qDPcbP3Rs/80KKsUxHxbNg/87sZIeSPE2TeJpcH2arWf4d/G
         wwTBg53qFmxnFW/v0G6j79N32+RWUgchyzKSRF6KknhgHBMHVQ8FA/dWWQKVSWf5FHol
         kWJX4Ak0MGU+3yWDZpXBhpnStNUPvvIq2rfRnOa0EwuoxzchZCRmOoCxbHRhmUyOtf5y
         mK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880174; x=1790484974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4y87oy6OKAiqnu/jIL3XduDUN3BGcMssQM5AWBSQLw=;
        b=SqXwv27ACBdJgt3ziBcxQHACGaX/qRV8K0K5W7czUSg3AmaEwYaopJdXOIzO3z3iCS
         yqg5Ys/xAgNpVGl4HZGybSZGcDAtmdvYcTZCEKgrK3CrHjef/9k8pYXPOul9oO739ZPf
         CGCqFDULy/Ce8xApTMTv39Hzaiwar6gs8vH4ZaEkZtfcKE3Ycgn9P4zXnGPc1C5A/71i
         BXaW2vSWfWeZ10knGBQ9+Vx2ewjJt9nEp3ZxkdPYaYLv4KzqEz7C1Oz21JhfgHmlifZB
         UzpP+rqt7UhjJCcGy3gJ565aUN4+HfFgggLXnabWfAfDbMNglial2bOiN6ZHSTOQK2KN
         MMyA==
X-Forwarded-Encrypted: i=1; AKwUvByLMZM8Q8+yjvGlIEKFHebqIlz53fMmpc6HlUwmOgrWb8CxERExtS/PEU4w5R67FWVrdjolefj5ZVhxAlbp5c2v@lists.infradead.org
X-Gm-Message-State: AFuF++m0f6CFjKTA4X+hXM13733EQTlsGUVZTgyMs3Lvc5Tr3ohoNY1J
	GlHj8nhlHDPT1qqea74WmOlICRB/rRi9KE4yV4ZnSn2M7URVyK/YU2YL
X-Gm-Gg: AYBFou3TgDQKZdzCsNAeuQNSAwEj7Gfj/whtNzTFB8DaC0DILMQFzVepwMGcKI81C8G
	DXWHz17Nhnbv9zAAbTp3x5VDKKMkUrTzfi1qxbEVvGh/W0UdGCDBzHIKLbxsrMpoIrzxONa8Mcd
	IV4wvXcOobz41b6Av39b9h/yUPAW/fKcg7P89LP6Or69cZIiJsOykFcjRri+6eiCP9NZ42MsxGW
	FC2KG9bNdF7l6T64GIGqHHErtW2fcPe+gjBwkHnbIQL9UBSY7v0kxTnusCbNIDOIvmyZQEjY6mt
	zoPNqy5sUjx2Nw61V/DKlzl+9ECNW961KXqn4H9KGjqU62ZCCGQpxy0lncCQi3HDnFGzFvUi/IF
	dV+YYrjovNVHjNQ8/VPBPhnKIe+npvZv3nChw8uqAT/3qAMeadP63IPGT9AC95XAFBm9HC4ebnZ
	aGsfDwBTB5kvJgmNhJ3XcMo+oBDEbj70cFdF7bCVZSOaIKfMRuneKt2yu7Zke1CTya2xaaHQ9XL
	ndhA6EJl5heaakVhss4cZ/4Bhu8Jfndg1yC8vJKdxP93UADnP+DVDRO0GhnxxoxTiRgbI88NomQ
	y08WRwn/KwO2xPU3GUCKc9af5mCOdTSuO/A/wBkZU0z1WAQ=
X-Received: by 2002:a17:903:b48:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2ddb1adc353mr126021925ad.7.1789880173735;
        Sat, 19 Sep 2026 21:56:13 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:13 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:46 +1000
Subject: [PATCH 07/28] ALSA: Support nonatomic dmaengine PCMs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-7-741cc20a74e5@gmail.com>
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
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2677;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KObS9Pt9I+T74LqcNTQHQ5cFB2c2q8qsj/Np1ljqwI0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xU2+4Xv/r+xROS6dVFDzcSiOyfWXf7+o3x2v8XN+
 f7e1oJ/OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFP9+xXDX8GZ9xRU9+7bXXMt7eK5Zew5L14t2sB48Drv779sq+Sd1d8xMkxZv9d
 N4ur99eJhaqns17xjBA3fHwku4TzRxB7rpBbQwwsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215614_487468_49629473 
X-CRM114-Status: GOOD (  15.15  )
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

From: Martin Povišer <povik+lin@cutebit.org>

Add support for nonatomic dmaengine PCMs.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/core/pcm_dmaengine.c | 32 ++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index e59b561b849d..839ff2711f5e 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -22,6 +22,8 @@
 struct dmaengine_pcm_runtime_data {
 	struct dma_chan *dma_chan;
 	dma_cookie_t cookie;
+	struct work_struct complete_wq; /* for nonatomic PCM */
+	struct snd_pcm_substream *substream;
 
 	unsigned int pos;
 };
@@ -147,6 +149,24 @@ static void dmaengine_pcm_dma_complete(void *arg)
 	snd_pcm_period_elapsed(substream);
 }
 
+static void dmaengine_pcm_dma_complete_nonatomic(struct work_struct *wq)
+{
+	struct dmaengine_pcm_runtime_data *prtd = container_of(wq,
+							       struct dmaengine_pcm_runtime_data,
+							       complete_wq);
+	struct snd_pcm_substream *substream = prtd->substream;
+
+	dmaengine_pcm_dma_complete(substream);
+}
+
+static void dmaengine_pcm_dma_complete_nonatomic_callback(void *arg)
+{
+	struct snd_pcm_substream *substream = arg;
+	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
+
+	schedule_work(&prtd->complete_wq);
+}
+
 static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 {
 	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
@@ -169,7 +189,11 @@ static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 	if (!desc)
 		return -ENOMEM;
 
-	desc->callback = dmaengine_pcm_dma_complete;
+	if (substream->pcm->nonatomic)
+		desc->callback = dmaengine_pcm_dma_complete_nonatomic_callback;
+	else
+		desc->callback = dmaengine_pcm_dma_complete;
+
 	desc->callback_param = substream;
 	prtd->cookie = dmaengine_submit(desc);
 
@@ -322,6 +346,10 @@ int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
 	if (!prtd)
 		return -ENOMEM;
 
+	if (substream->pcm->nonatomic)
+		INIT_WORK(&prtd->complete_wq, dmaengine_pcm_dma_complete_nonatomic);
+
+	prtd->substream = substream;
 	prtd->dma_chan = chan;
 
 	substream->runtime->private_data = prtd;
@@ -361,6 +389,8 @@ static void __snd_dmaengine_pcm_close(struct snd_pcm_substream *substream,
 	 */
 	dmaengine_terminate_async(prtd->dma_chan);
 	dmaengine_synchronize(prtd->dma_chan);
+	if (substream->pcm->nonatomic)
+		flush_work(&prtd->complete_wq);
 	if (release_channel)
 		dma_release_channel(prtd->dma_chan);
 	kfree(prtd);

-- 
2.55.0


