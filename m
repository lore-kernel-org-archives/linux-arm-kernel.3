Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2760ECA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=; b=nbF18D/nqPfFHkO3SC+6Wjiyrp
	8rbsh+nIK8RKdS+qVTmHVbZJmNxzfePVaBRJnGp3QWNcVHIrHRjOQEC5I3mVjrPBnk+/Hz1DR/U0f
	heiqntgf7K6xgeRkB7FSY+FxQzy0Fgz8Z5b53t8TBlapcIJTPKeEurtFwLuv+Nb2+PSmoQF/DiXes
	m/Axe8aQD9dQx0QxoSJl0EB9iIojMpYenpfpzxREJ5dZCFYuTk54ta5H4yO3k8gVrAh//Y1xL3BIv
	thpM/TG69KGDicrqJqEf01M2U++8LcNS7zXq873VFBqi2niPXqclgzpwlzX3z3/ALUWhjgrW5JzvF
	xPVKB8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPX4-00000002H20-1xuI;
	Wed, 07 Oct 2026 11:09:58 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPX2-00000002H0S-2HNK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:09:57 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso731248a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371395; x=1791976195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=oXh5CxJz6sz99i4CeGqA0jJaDCsQD+KpVXpLgibNU0dH2sIKWij8c7GMcYD8nWjC8a
         pDLbFSpcONsix3XNIKSoY1LClF7h5vj40xtxjTsUddI1lr2HCEu0Yso+m1e2oFRY9u8f
         GkZWUMkMecTwvEV5Tr5VYLdD7wYL8CqfGElLuS3lr4J3JnUz4OaQjTOqfIfH6zzRFlbW
         2Gm4QLoOQVT2la92T4ugBu/40qdH4x44RcMg84sm9ova0V+u56vHlZIlj1Mbw8QQol3A
         OaKTSC1BsdQnFk3aE+73Pd7p7ZioBjXUgfT/IaoVsGVx5g2mC8NkVRYehj3e6meMttTa
         +DyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371395; x=1791976195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=XhJBLujLbvH4dJXN7mEmw2PCG82xuZit9xGKTw88DF0MCFOyfcpPRbecFRVwMX7zw4
         YhDr2w3i0ayAmkcu8U68/ZN/MShciom10d9SRZzywk3pgHTWVCJO1KzXvKIL0z5QxSCQ
         w7P32l6CrynUL5QL6Hqvot7AnQM1tp3bagA+AGMwaAulu19yAhcM3ks26af20yEacrwT
         Hnm8U7eEyZ3oQwTZm3NN3e1wn7QXyTHsHzFirSxPPtUKdD3ShgWi/gLmFSsE7b9YTkSq
         /MdvkOvGOLe6vc3zymZpHxeUIJFitH1Q0c2Y9JQp/qyhRWjSgmpzcvE3oRC4s6l/smCe
         9i0A==
X-Forwarded-Encrypted: i=1; AKwUvBxW9d5S17Nr4GmmgwavMbCZk5jHJ7t3JO6AUl/Kwfu1cD0815hjG5e6kfhNc+g1i/FB1XVkjzLmvCCpQr7cScBe@lists.infradead.org
X-Gm-Message-State: AFq9FYKN1/FyLMr8dyHfyaLoOpgc1nbUsDGjKbpH+gfjJobMZ8FkNSWm
	DVU1SFju4mW3nnk2qewFdtr8MEuGo92ZNU7iyPuUnRx6Hqtrgh95so2C
X-Gm-Gg: AYBFou0iz3sXQVc9lkK+bElJLGQKcXij44trlTxEBBmsj3oSW/NIhI1bnJFAtwTbm93
	3cIVza5U4/XKrvZslGasX7LGBxsBjHHVOlC7GNEe293tcLtE7nIJcVUdfGMMmr7RPFSE17F4d4Z
	RqXIFuQPy6nIec19J/exCWpvRRREfQAiL0yFm5TU20xXma1ZrxN+Rbocj47+b3BTWsl8CAS91DP
	QueuJJIgPfR3bzxhALIAZwV9i3fD+ch0E9zXdRRBi4ESJ+rFiO4ORh3Q/Xwypz3b2XwPHAmdFVA
	hj8oOT/1LMkDHmxEDGlNOxOIr6uTCvHP5jeNtAH7+PqUFCuoEq/o//7snAM6UqpHNr4utBk6Z32
	JNITAaRuM46FwUWs+cJBMRjLDQQx9iCrf7GKsaDlu06TiXWKjwYVcQDEvl0zivC2KGKEhFo+eGA
	taxsw+XQZxdTQOogyNoW96azpse/V9F2+qI9H/XrZZPLuJfaGBHBTYOSwpoLtnxssiX4SGKtOqK
	B85Enq4QP7BYleku57jYY/wXJK9zXIMfG+gDgZPBwFBVF1CwgqLXz4wVB350dNj8edy/bSu2CG9
	slZEwLKeR/y8VD8=
X-Received: by 2002:a17:90b:37d0:b0:3a8:5d57:a5eb with SMTP id 98e67ed59e1d1-3a8a19478d4mr1407044a91.15.1791371395353;
        Wed, 07 Oct 2026 04:09:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/4] ASoC: mediatek: mt8189: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:57 +0700
Message-ID: <20261007110858.509341-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_040956_584860_EA2095AA 
X-CRM114-Status: GOOD (  14.19  )
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8189_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index c0f340a6cc09..eefa96b701a5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -155,8 +155,10 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_warn(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -168,11 +170,11 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
 		} else {
 			dev_err(afe->dev, "%s() error: no more asys irq\n",
 				__func__);
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static void mt8189_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


