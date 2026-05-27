Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE0CCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbmScUewxy69yzIsUCuE8aXgVmgMHcoBqHlMt7xLKm8=; b=cQ+mAP6rAB8KyqCSeiK1oj4yFr
	6Gs5u5uxp6Qus/PoA+eLifpFnaUtqx/MGNZj0uPag4rl1G9L2CaW4hA5sHVRFj9I1XVAFr5Or5NS6
	UM9tJjKEPJEHFKbD08k/E6I9pcTeSK9t7vIfu1h7HdKHeWBahWVc9t7TR5Qp1STWCGE0FDdfUP2oo
	RDRHkTW4rqvyZoAcu8KoBpICUPbpsGLecIKbtLIJCCQJm6PusEaQJNS+R6uffuyOjtDfcX7n3mzxN
	1Tg7V3WRbDSCD62BqWM3oqQe4jH/4KxDEZrPwFwD0xHL7cL5te3YUc2+02hqyULwkm7BZ8tvXxuef
	CBJN3M6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEm8-00000004FVD-1ALz;
	Wed, 27 May 2026 13:58:24 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEm5-00000004FSN-2IDK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:58:23 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-304b8ced372so1128069eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779890301; x=1780495101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbmScUewxy69yzIsUCuE8aXgVmgMHcoBqHlMt7xLKm8=;
        b=f9FlvD9XCb+UGTf+CSO+M/lRUbcifG49MOskYICWZUbvM0RitFhLGOLq+MRzPwbe3U
         Z/h+yqSU7uKZp5LRAnfBXN6yPVMR2HmdAfjv0d1HZSIWbhru+2B4+NdRLkkTJ8da+SVC
         eBu+hF/PBaedswOJDiG1YjU33rB50mWzSXnOCnv4txhBdpBEVYBuzzX9NZIihA7egni3
         WFLcbyVfDdvZqUE3/0VZqKC2Ccwc9TwXr9eaRnwT7esObLsCk42n1hooW2AD4oqArOum
         ZaW7YLohdzr6C6YgiZvOkvOkZLLcEf48BsMAkvMElBuRngg5vdhmJufJPBe2T7iW9Pex
         Y1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890301; x=1780495101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sbmScUewxy69yzIsUCuE8aXgVmgMHcoBqHlMt7xLKm8=;
        b=Y57GOIydzvbxlnB74rEcU/JHE+XtuofJFvIOLz9A2b1wJ7HZoRGsZthkX4ja9K68mL
         lxg9Gj0ODzu5ekWxqLauMgimqIyw5utZMomDWSL1b8nPKILDeuUQccBJ35sxexEm0T5M
         jZVEGyEoGZte7f5UDbx83z8p3yXBu+pnQHU/9t+qmxgFGAVTtUyQw9/F9UIJImCqCzvx
         Ox+0JWvldFG0A2Q/5hoJ2hDbD/pYKQWrNsB+rBkw85rItUIkIeupsNpVlGWOjcNqlGN2
         oY2r1qz04VWErfvF47Jy11cAH9aVKwddbQ/QvjcZN2aIhGMA8meLh71htB/LUhkneYYE
         jiNA==
X-Forwarded-Encrypted: i=1; AFNElJ9Mpp2KPtD8bSbTGlfy7kx0R/5G+2jUkgWyxzalkEP+v0unTIHo61VNGREAH/mvHy7vAM7mRQBOlCBjqaWal2p/@lists.infradead.org
X-Gm-Message-State: AOJu0YyhyBFtyzaaXir27GbdO8/SzU7261czqqGUSrY1uTwwWiDPCu4U
	GMok19dIL93omA+ce3GnyZ/zM73AGgs22coye9GTPq0/5KlxAkqYjqWs
X-Gm-Gg: Acq92OEjhmY0el1OlmJMZgZ3/UB0dAUChjgKwtT408W2hwBNBlKH14IOScjH2UzyZQm
	RN8ox7szL81PPjdYeuYmDTREMX/3OA3cVLawfPu6rQPP/09OIW+mm0T+tnLdEx7eyXezGESv/jn
	8dY7I8Wacc6L/SLkBvGnXwEyffBvppWk0tL+2hTJpmxNHtlnCIfFIuAYDIJvG1XeoZ7a+bahOzA
	6u+HeqLxHoAdRxv7rixdX+VyxYy+/BHyMeD24yfLU2L3Y5l169Mxqnz6Hf6HXWkMC8qzMUNVwEa
	2XQXCKz+UXq8jW+ALHbz8bwct18kjnbwPMHzcIETCW2mpwHM3wrdf0qUT5AP0FfmDSlWuTC6XG1
	1foWihdNg4KSYgBsJh3mIii4QK/N1DmYxdssA/xLfotgDMcmwTIaFbDAnAUdW6RPXtZxM5zzHKH
	tNhoqHsnCKxZTssNevZk7lzemsyTxGqXBS3bUy210C08Mj1NuS5aDiAoDHtaNOspujDUkS2KcVu
	g==
X-Received: by 2002:a05:7301:37ca:b0:2ed:e14:7f5b with SMTP id 5a478bee46e88-3044922a4d1mr10566374eec.31.1779890300526;
        Wed, 27 May 2026 06:58:20 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba2b9asm13013788c88.15.2026.05.27.06.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:58:20 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 27 May 2026 10:55:46 -0300
Subject: [PATCH 1/2] ASoC: mediatek: mt8192: Release reserved memory on
 cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260527-asoc-mt8192-probe-cleanup-v1-1-1bb834d05b72@gmail.com>
References: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
In-Reply-To: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=r0AY6balmI5LK5cBrk9Sz6C0q7ffejwvtR4gMM36msY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliP4oslk4/pFEex7tum9+WL9wiE02MQh9tun/h9d0vl
 5K52bNOdJSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEKvQZGX72MgtpmK0vun6+
 dHdfYPiNXz9mzhP3TzR6l2byzE41Jo6R4USD2QwLlhkTnNbLPbDZfPBamp/jK2bTFyt3WDx+vts
 rnhsA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_065821_644949_D27B8854 
X-CRM114-Status: GOOD (  12.62  )
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

The MT8192 AFE probe calls of_reserved_mem_device_init() and falls
back to preallocated buffers when no reserved memory region is
available. When the reserved memory assignment succeeds, however, the
driver never releases it.

Register a devm cleanup action after a successful reserved-memory
assignment so the assignment is released on probe failure and driver
unbind.

Fixes: ec4a10ca4a68 ("ASoC: mediatek: use reserved memory or enable buffer pre-allocation")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 3d32fe46118e..9f5057eeeff9 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2155,6 +2155,11 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8192_dai_memif_register,
 };
 
+static void mt8192_afe_release_reserved_mem(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -2184,6 +2189,10 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
+	} else {
+		ret = devm_add_action_or_reset(dev, mt8192_afe_release_reserved_mem, dev);
+		if (ret)
+			return ret;
 	}
 
 	/* init audio related clock */

-- 
2.54.0


