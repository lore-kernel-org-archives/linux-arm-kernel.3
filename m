Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963A7C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueFbq8+vEvSr27HopAfMc9ldfFuJNT5gbHVBZLkrJAw=; b=APJzwtugIHJXp4KpY79xxwN/VA
	a1UhSITbZX4DYm3gesE8ts0Y1Wx6aVjq5pEOl+m2th83y+No0rRhAlYtdTAnLG73eJey3DMFA+MKM
	sld96TUYqZm5Xl/G7IE1Uu05bynNUOb7KasyWvdP+WMiRFZmr5UdbOat59X+KMVluBGn0vdT/GAiY
	ywsFg8wiyx0p6uyDtWew1Ae7rlm32aEuM/Fl1Tq349wpV/7D78IqYl5/ebmhfr7o3wSbvbs2wsQst
	J7wWGlJo9cIY8ONAE/MXJuPUYibxdmA3lkZkyhEJ889H8HNY2voQxmJeIOnRcHnT4i6/cWhrKokpZ
	ALPTdWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMV-0000000EOnD-1ndp;
	Thu, 10 Sep 2026 12:58:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMU-0000000EOlq-2TdS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ueFbq8+vEvSr27HopAfMc9ldfFuJNT5gbHVBZLkrJAw=; b=TuKt08VsR9/5JP36XM4kkKA8gV
	zrKsPgxaoQpiP+E187W1r0CTuc0W9rsN9rDVK1c1DF5tAsv3gB04yKrOdc5/QMWjbN+2u+BNmMsc5
	L2dz4SjWhfKsO/bv9nh9kx7lqtUcM8daL/HStn3rd1VQWhVGGmbQInhGbE1FadKSKft6GZLxyzVHZ
	WDXrOTxc6GcrB1ajBZ57z/iYoX6bzoUdb18frZYscIE033TKfGAGJrczUtBvxZHzV8YL46j1aQQLF
	+RftlQG47XrMOsG49as59DPCaL7nm3oamAzawzqqALn4pqSlSknSgM4cBblgeX4Ju780vmF0olaUy
	00UWRBSQ==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMR-00000002V2B-08No
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:41 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1562513a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045117; x=1789649917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ueFbq8+vEvSr27HopAfMc9ldfFuJNT5gbHVBZLkrJAw=;
        b=KYfYxmwBZUbenLvJAnAV036njjQZfi4ywo5mY7a0DBxG+MHlfTnRL8wjaTn4Ribrcn
         9Lw2XRR9ECs/qtv8uBthSBmK8hBTfy93Dk+I+xIXgtIHcwO2nJ8DqKgZ7QQqu/Xi6sVp
         LBpB5cO1LEVVqMqewF/GWKYVSMKtdTPTLKv4s3m1/d6meuIZTplNE9/iKikJLSH4dqag
         f8+NAG1GrZqteDk+tpPcTK7mHdw4N1aZRpAmjclY2iUalnNq7GqzQf/bkF9EpBmhNqfa
         0bQVYvB6w8VepSAtcGlUsFfv7BnMMTBNwlNpiLhJrzt5spm7KRcpX91TV1PQGqrvCPr6
         Bbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045117; x=1789649917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ueFbq8+vEvSr27HopAfMc9ldfFuJNT5gbHVBZLkrJAw=;
        b=nMWbXFXZre+4KDUmHH+gGbX6qHSqAWNVbVEZiWA/ovte+azXcOgqXBTbPt9CJX5YKr
         B5UV9clwyVfxI0cQaWF/B6z2niIk2hsa+xu/oW9qAf2v99YEcDfbjLp06t7a1GOKJwTz
         myPqx5ERx7XcNtxNvuLg4vB1HG2Ztw9/2tixxUgE12qm7uN8eIs8AYLEAcvThlsB35vh
         Vv6pfFSgk/WhoIGTvY4xZOQ15DwmInH+ntMfXzfudkwNEwdsHBYVl8MBzzf5vyYbwiGN
         gwAuHZrUEMpP+ej6Z/bv0Zme2MTSl1llmtOVP3fapYpLCFRTd3ioHy76qgl4c7p/rNSk
         Rdng==
X-Forwarded-Encrypted: i=1; AKwUvBzE2Y7PWTed6/dbMCPWNPS2l5RwW5+d5Zg3hIruTdgvv2m6gNye+Rt+1VwU2klOqbKx8Ae1Vc7XMMn2NvFkE2ql@lists.infradead.org
X-Gm-Message-State: AFuF++lxLZyzCqAdSeEjxllPFYPYdCsnZtM8WDEApX1E6p36oCORT5Mc
	MwChiqZAHRBeXY2MkKiMzsY2zpGOmanGijJ1n/QOh27S18pDvSJdmvqM
X-Gm-Gg: AYBFou3KZ0CCFrT5QcLJHRtVzX5JwVIPd4cbsdIxxw4agyWFi+itCXKKluJ/GbeQTtx
	n8IihY3QVF3A+u6Lvg0qheBrsPMO50Ej1ekrTmlnkY2zLzZn6K3sVr0RnHRE0yN1kDZyPCZSaLP
	/qKhKdbS6SwG5mqNfBgQywp0j+NclL0X1eR3Kede/OvzfYCKa0feArXQlC92h7/myLNH/i2mhf7
	17arYA60gCUdxWdnGdkWsDOGLIw2+KOAXMG4fJMoS1WY+fUKq/HlkxxiqLaa11A+tsJOZwj579y
	ZonE53WfFtoxYDCE770QpQIMxDThl8IV/7PVEewTDcwdavvBHLPkOA6NYBSa7uOWNSdnla4UmER
	6E2/ePEBLeOsv6+D9sumQvFt8lXMSr/Vuy6bTvQqM4Rt6F37QztkrKb+p9OhYpyLCYsB89ffEhf
	QivAy1IzKeJCx1zjVS6mNhjdenv2PBhvPs4hQy/XwQj4reNmC8Q164yyj2yqyatmSJ+sAjH7quf
	LW/sIBOGjznxwp/CHGUl5tJGsp5WBbTyssKhBecLhwpsj07Eb3q1Y8XTsjrfowDjQ9wVmW7lbgV
	3r2bz1qtswoeX/Y=
X-Received: by 2002:a17:90b:57e6:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-39d70a34abcmr11658680a91.7.1789045117218;
        Thu, 10 Sep 2026 05:58:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/13] ASoC: mediatek: mt8189: Remove redundant error message
Date: Thu, 10 Sep 2026 19:57:37 +0700
Message-ID: <20260910125742.150902-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135839_207990_8B911773 
X-CRM114-Status: GOOD (  13.37  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 431320719b63..9335a9e44665 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2488,13 +2488,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
-		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
-				     "AFE base_addr not found\n");
+		return PTR_ERR(afe->base_addr);
 
 	/* init audio related clock */
 	ret = mt8189_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error.\n");
+		return ret;
 
 	/* init memif */
 	/* IPM2.0 no need banding */
@@ -2528,13 +2527,13 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2603,10 +2602,8 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8189_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "afe component err: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 
-- 
2.43.0


