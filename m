Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E50CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5KkougDEniPNaB4zp+jheULTstkgfTv6Bq66fUj4K0=; b=CsRBT3UMmiOQlhmCafgKX0pMQD
	SNhCtcNvliN2W9X7m8QWDrbO42xKrJAZBt7pSph34D3ydCLS8zJLCX7PKjljxtkvM16tz9n34NxIu
	IpNaWYZ47bxH+A9lebSde7GXD/eyUdkzTyt86c62uG+8ieY2lmDUADNSp+m5n1hp0oOwwRTGDARr5
	gfH/gK7eCf+Vbq/r+bA0R3mo/o9CtDH9io9Y7tG28yjzGwqo2LRZUETakhGfYYbHcHGlKhxYPrfWf
	ROaKBSPnczO3jaVKC3QuaYuOFXdGAuUFvW0hfM5QnlpTkQvb0gx+cF34U5X2TUsm1uyPqdSPMqpSW
	w5VvpcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaCs-00000003dx7-14n8;
	Mon, 08 Jun 2026 13:39:58 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaCp-00000003dw8-1bfN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:39:56 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-307263ad0cbso5505389eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925994; x=1781530794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5KkougDEniPNaB4zp+jheULTstkgfTv6Bq66fUj4K0=;
        b=k2NkVFLCjViAVXRzAKJer88a8d4maMn92n1nNBDmCAoX+4XBOZxqlmae8+akH4z7mh
         ONd4ZhrnKU/Y4iOeIs7tDNLn8JoqQiR9rLe4NHp+VaeclGBz9Qpq2hCi1CMtcoYrYABK
         c7Quae1jSl8zM3bJ39vmeiyWwkfsZx+cmkznZg8q4TA7uK8V61jjy4wnv72F359u8kf0
         VSJf+YRRaN3VRb1/lyVvxPlDtAt38a+ulnGoW8ivcbRp7fGH+UlQ7GtcgsEnpA1Daovw
         ShekZ4hKxJCTaAO9EryI90MfghbZO3Frm3vPSVmS/kLwxsz9W4ze5uk+mliZK0KYkd9q
         a9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925994; x=1781530794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v5KkougDEniPNaB4zp+jheULTstkgfTv6Bq66fUj4K0=;
        b=ZsmBmKquWis09a4v2bQCi4xY+MPpOLfhWsJlbmHS52VWzECYu+dJK3NppJ1RpR0DVl
         s9EB7xd/hkDQ2RaEbjz1gMD9Furc3GBPYc1Rbt1XuQuPDN9QGWRGI/1WMuFA2QX/1z0Y
         zNBKFjO6nvPBJNFXveT80JEsP2Yv3vPE4PjsOObuAQy3gf/ZldCxlt4g+qfgAYP/yHeK
         LDUC3AvZzBbQpZZ/UMTTcbUv13iv6GCRfov1gRsBimRpGi2lUUmrVsCQMuf0XpG9ri80
         P+hp+RpIPaRYgAW7y9coVlvnHo0nDUTRuIKedwHt1rGGDNDT3Fm9KVLvY33BkadCFmgb
         JtRg==
X-Forwarded-Encrypted: i=1; AFNElJ+At3IjTmcT9OqJo74fWK09Zs3MNPIToqq/L8FMt/kcQCcKcXQDuC0C5M3bzojs18npmrkBrF15nlATprbxgiCL@lists.infradead.org
X-Gm-Message-State: AOJu0YxY/Y09cDuLvwagQiGFXbxbuVaprJoAZ3DVDvA1HhpEosCcallt
	pfCh7CLY5jQpSROPOs3vJgjOCRdba1DvKBwHCNW7zIMgYJ8DejNFdcDXr0M2tI1v
X-Gm-Gg: Acq92OH00n7QH2BZdy1+sKnW/+uW+GO+KhvINRRlLm8x1m/KdmxImSAXFhUytjFdJk2
	B1FfEmw+mFbTIfDim8CwwST2YWBgnaUiDefC9Ibja+MGRLrU9z8Y5nnxDkfiPKROWCyoDAUygSf
	w3nc3nxyZ0biY4pkT67V4+wber9Hda2KYn4Hs2uvhwfE8Pm+19HgcZL6d3yYx7naKOx/I1aahIm
	cpm9bTiVXATNYPOLB0WxMDLvOXMUmftpaBEqgBpON+Zkm9WBWO32ODwKhIfdHCoElWx16yeUoXw
	WPgcLtYexXN4F/wWm0l7TSqGeaunAw0jKQZUfwPsq0/qPVtJeo4IQHFWCsoXRUV14It7xvqKH24
	hOrbBAZSuUo0szciuw+SSeEbgYUAxYDUUss8RGfSqwXJBwwB0iOOJjRQf/oKoj4h/ULBcy1mNtO
	hD1EHoIThvonfdyyuWfpSeKjwGRlFMh3XOQwv1tfTZqNsPmYXC9qpsfxlhcwEldOkcdoosfMCe+
	1peVRLPZShH
X-Received: by 2002:a05:693c:3003:b0:304:d835:27f with SMTP id 5a478bee46e88-3077b15d304mr7307289eec.22.1780925994137;
        Mon, 08 Jun 2026 06:39:54 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:53 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 08 Jun 2026 10:39:12 -0300
Subject: [PATCH 2/3] ASoC: fsl: fsl_qmc_audio: use scoped child node loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-2-9e3ac518dc2e@gmail.com>
References: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
In-Reply-To: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=MCx2N3prAUvO8MqB4noVmeheqznOyy7WsBMuY4aEAtk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxyQ6WbXOHZl573lk8fKZWS9rEjeZ7J/2YxvT62vSk
 utzDuowdZSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBE3n5k+Mm48r9C6PqddYW7
 uKUX3W660TnB1a/qr6303zidBctYjqoxMuyLmB/7u3zl96m+jSwPQpazaHlsyeq94VPsoy/x/EV
 /FzcA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_063955_425566_5EE4B22E 
X-CRM114-Status: GOOD (  12.89  )
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

qmc_audio_probe() manually puts the current child node before returning
from the DAI parsing loop on error.

Use for_each_available_child_of_node_scoped() so the current child node is
released automatically on early return and normal loop exit.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 76e014dfb6d7..d0f644573f49 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -905,7 +905,6 @@ static int qmc_audio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct qmc_audio *qmc_audio;
-	struct device_node *child;
 	unsigned int i;
 	int ret;
 
@@ -931,14 +930,12 @@ static int qmc_audio_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		ret = qmc_audio_dai_parse(qmc_audio, child,
 					  qmc_audio->dais + i,
 					  qmc_audio->dai_drivers + i);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 		i++;
 	}
 

-- 
2.54.0


