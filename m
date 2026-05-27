Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7EFCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxLsjsge6FjE23brvA4cB6kvPU6JOYpV69fL9+pATJc=; b=Kn6X46pAYyGkS7KygG7l9RqjCZ
	HpGRIRALjyeJ0k4a/Oe/9QHeVBrC5W6XNyRG660Eou2x092BUV0eOln/zENz64Tu6DPp9wMQqyPbY
	EIcZAxCsVmBKJDTlRhsk+eDYvm8K+lM7JcL+UFqZcKksTFP5gwFYFq/Sku0R3SUpqaZ8T8Pgy8Lf8
	0NqOS77LcKPl1Ymf1v/B+E0RrUFueAYE2APNGeqzWMuYKcJNWmJYesRFkP8uLPflKCeSsLvBjnVCe
	fLYsXbU55ZdixloJxoBHC/Hlf6PjCfQWNN6vD8V/mIv3HOx5ZPIfPnKsrI3w+tIFpAT5Y6QpoAVal
	gjC0jFIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEWW-00000004Da6-1KYw;
	Wed, 27 May 2026 13:42:16 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEWS-00000004DXJ-1db5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:42:13 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3045c195251so5155611eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779889332; x=1780494132; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxLsjsge6FjE23brvA4cB6kvPU6JOYpV69fL9+pATJc=;
        b=EG4y3jrWRHK2L2qOfnPNWNx6FdOewHX3YtwRTapzWsV1Z8FUlA9/vE0nXOrRLGD2kG
         Am+FXN5+FnrfEonCS95y4+HGs0dpSIP+CMxM3weQAeP3OPboEqdsx7AVXH0ox4TW81xd
         GZkGCNwUUaFF6fsIKV3ojNvZ629gyEIO0aTMB4gSCdZ+QAeK6PvjS92jhChO90pSWPGP
         MydoAnUDihN7iwq+/Ip7dIA+aLH02Yrx8o51pebOpxJCUzyg0npAyOsMoT6FscoEYpVs
         j42xwPsScc6m+296RDbNCW7u0/MxIE0Hyz1Hz5oxEoJSBOtmowudPIqqiM7hCrYx7uH6
         D1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889332; x=1780494132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxLsjsge6FjE23brvA4cB6kvPU6JOYpV69fL9+pATJc=;
        b=BMY0t1+oMOOWWUT5LGOf9Gb4MtHLTuVMjtMzcqsWGOHrVZNbLetU3XlexCXWYqUHYZ
         P3ShxvRZMTDNb3pe5Ebcv2YfOVoVpZmnD37deYv8ZFJpfrABeyg5NJlTpTD9HpIXNIlT
         eGSz+KvWVJaYTHszw1yTfDPwJnfIs09uqDd3xWUTm2PED7XzzhNM8GGhPzgAI/EcU1OG
         p9u60qQlzc85k/cKKSV9i/flXyO4R+nA1LoetIi2fnhVYsYYAlY+SMOgj3fvowQrUNZK
         /ZkY0g/YJeHFoEXm88Ii5u0K2qy/yUvNE1GS7XSNj1ra6WFdEbn79dE1zKbp54cxIMMY
         mkYg==
X-Forwarded-Encrypted: i=1; AFNElJ/WbqF9iKaL3If/rwjf4Syi7Q2uQktN5vyTs1xDCiFhA6mYyCremck2sDJ+d13thJgbcBgSkkgHuelrivjs+/rL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt92YyhlSAEFtdJDbx1HXncN0D7KNaD3p2BPjuF5ss8qKNqeH8
	rpddcMUy7APoN/U17c+0bckp63yi4wLg+EiO4R8oJ+Xvhq8ylmJcg0g/
X-Gm-Gg: Acq92OEh+YUQKrbvzBTC3eWKjW4s/ay92ERLYiGhAuCEd0dU0s+STnGyB8jge+Q6jE4
	CZaOMIKxwe1hx5nGVWkIVh2/baNTVdQKHcnPtAEZwq5YD8RXazZ557smph7YcUWVMCh6i2Fs4uG
	rHGcePJx5bguYTY0FnYQlZGInqN3Pu+e81xw7100XzZiWUCq1AQYkB0OlmH7UwEEQJhLpoxb5cO
	H2K7tdMU16kWvT3PVYmkGwpEP/WudA/EIomj7sIq4Ft4J5xL/cZcjUDfAElU1ODqEGtKvXR2dn7
	aLKGqfMwop5iIuN7seAm22W9Os5KjrUPrFGJNV95KHIhZLalTydsDLT4cYcQNe5elgqGMOhOzih
	RLpPzMPRERj+1mGQQ+86jGX6ThSc3u+X0CtDGVv1/yimI1L9xM4Q9+pk1EWsdODkrBF6EyZjB/i
	bw6Rj8xzIJPfsBIu503E5jws02XvrFjttFlrpCCo3aWoHE9SceRjOrh1c/uM4DD0fj2JVSUJwb4
	67EDTBIDkZu+G/Ftqxcj0A=
X-Received: by 2002:a05:693c:2285:b0:304:3c33:7ad6 with SMTP id 5a478bee46e88-30449001dd5mr10880555eec.11.1779889331603;
        Wed, 27 May 2026 06:42:11 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ccdaa124sm311702eec.11.2026.05.27.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:42:11 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 27 May 2026 10:41:48 -0300
Subject: [PATCH 1/2] ASoC: mediatek: mt8183: Release reserved memory on
 cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260527-asoc-mt8183-probe-cleanup-v1-1-4f4f5593c8d1@gmail.com>
References: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
In-Reply-To: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Shunli Wang <shunli.wang@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=VzV/fPvjI+XqWxKprvzJZVYA2YFkSP4aBOscYa8+RWs=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliX1YeEzh78zWH703pVZqrvTeuWL526atwxjdhBwS39
 7CtZm1L7ChlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJfDNm+Kc1XYkx5/BGR6aP
 S5Jv73u+L4OR4d7Hw36J036ccnm7bNNjhv8JapdZPIUlUs+z7D+Tof32xs24+sMPi1v/nz0x85e
 09lsWAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_064212_448177_1ADFAD18 
X-CRM114-Status: GOOD (  13.66  )
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

The MT8183 AFE probe can assign reserved memory with
of_reserved_mem_device_init(), but the assignment is never released on
driver removal or later probe failures.

Register a devm cleanup action so the reserved memory assignment is
released consistently, matching newer Mediatek AFE drivers.

Fixes: ec4a10ca4a68 ("ASoC: mediatek: use reserved memory or enable buffer pre-allocation")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index a7fef772760a..49a69728fd72 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -766,6 +766,11 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8183_dai_memif_register,
 };
 
+static void mt8183_afe_release_reserved_mem(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -794,6 +799,12 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
+	} else {
+		ret = devm_add_action_or_reset(dev,
+					       mt8183_afe_release_reserved_mem,
+					       dev);
+		if (ret)
+			return ret;
 	}
 
 	/* initial audio related clock */

-- 
2.54.0


