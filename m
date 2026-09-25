Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B79CC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rr9O3pSXlopPJwpXTp6LzZ1GSJi+3cpwZPBmE56Frg=; b=q81NYOY9JjdldkQyJBrl8Yi/9O
	9tWaIBXjAAstuOMP55omJaYIcslMYvscVYiWXGByveZjZNiSXaa8qTYkHCgmyvPtEIZtVKaX9aNbk
	5p5ZennXu3NLG2TxJzRE3oqUXOLJIiL6evU5HV/fVtoRiyRib9tCpsqvi7RVcO/5+YJiNpMKYoTxy
	RdE+zb5U1W8WF3QPrEJGxOIeknI43QICwJiMPFIcSnARE0S428oBhzW7sYw41Ijft+E1dFISasBFv
	5gCVdJoJZlMriUcqpkq/k0ciTpUul/oARuXug824+9USjLIgFQo0qku5hak+L8zJuz0L+F45t8x6T
	ia4NBe6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtR-0000000CdlK-0XaB;
	Fri, 25 Sep 2026 04:50:41 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xt7-0000000CdUG-05A1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:23 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f01363so2588025ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311820; x=1790916620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rr9O3pSXlopPJwpXTp6LzZ1GSJi+3cpwZPBmE56Frg=;
        b=CPvAo+tqDT3QpQ8CDkBnM+p6XLLmLbAk35srCeR1Fye9BbAQH0RG4Vd1Pp7W7jJsTz
         VMRZMnGheKOG4pcMQdaoqWwSgQ/FJW3VQDZM7QrGoiO4KwZ0aBFLxvBTFQ6Y6p5ATi50
         LjCoapMCgFxmddxlMO3YU7gxXrNeoo2SAftFI290/EZeKcbLMAoe8Hp684n5NzeNZXWI
         r8Elzlv6AEgsE8Apf3gNjWzZaU+pJWIJHNCUm8VK/OZuE8c1yo4UxSU0v4UbHysu+bgg
         0ptAgJGQTHcdQ54wLogZTEPBP3vdbpQfTBgd9OZZ69uhdCf/rOB81YBDvPMTSho810KB
         wNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311820; x=1790916620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rr9O3pSXlopPJwpXTp6LzZ1GSJi+3cpwZPBmE56Frg=;
        b=SNFX6XaEH93cVW24+wWQoU1cho/rC67A4wLnU23ImIU515xDdCiQ/JXgNLmCyCP335
         547w88Ip31Z+vqhdDkShR2VWs8HtZ3Xt75SOkUjCtiI8x8VAMKxppAjbHN7AaMFlzNr/
         5T7BJsIxWQwz0kzGX9Gw9N+Q2QADjE8fZ1HuippVp8EJGgOFQjZLug+sbN2B2RXacpyk
         ksBI0hGYIEi2FERTu/rSQO+d3o+8HuO6BeX1/HZ9jDnckZzX/j2pth9EpfCRye7Rxq3m
         8+4C5MQe+F3imqOZMK8ln6ojg1QGx9Rnq6dCOwg96QIj1ty3RZD7Nq9DUL42xe0EwDsQ
         g0aQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyr23xzPsmnV5sPgOl4F6bvAUjVyxw69zpL0MX9kET22l9XS9Es9EVC9CYfXSy8cPm7tweXAFsd5BsCmfpv3g5@lists.infradead.org
X-Gm-Message-State: AFuF++nXdrexzed626Y20o+D/flfxbOFSpmE5szyPt8aXVHqdTfWvmMK
	yMhpO7LyDQWPjHnll2yptThVaecalcIzSBSm6uumhWXQwRku6qxkuLb/
X-Gm-Gg: AYBFou0ciLwtkBDiJ0at2djYWC9woY1rXOJw1UiQN8HBy1KX6yd+z5rObmXBxCC1BcB
	X9hW2aOoR8TO1TDl0CkveyJxRKypYEZaC9ryu8UIt79FiTAYKC+cypNekfiDYKOD2Zd0mU58EKe
	WoY5e/9fyTVrxM9M6odAB8pPdDiyOpIZrtZojmlLog7Wr2mscQc2EI/0k7Im/EmCW0iijc/JP+S
	J/OtUM5vQpluNlIOrcoRl1bMX2q3/k1sSQVBU+T/4yKiTw0fv4jmcq8FoL8PEDPqwz56EaURzz5
	HinceP42yOTHkQGQh03VmwexITXWu33wZ+E+grutaEc73jTEvDgXPqMqy0j9UyDPb8OltbS55Ag
	rs/4Ujlkka/u/6taathiYm2Yr/AVKF5mdJjuFelSy0LMwYQ3oCRtpTlP4J1kEEPbL6IuLLFbppG
	v19//DoQ+LFSs84hjTqMjbgYZlfCd5Xr/H1ZHPG+WUu1/M4c6Qo3GdJJXcvAk4w4CCEyO+WXMhs
	Rtiq75NRb5cPeoKGXBjcZ9oACHcu+SRVARBxtXpx4UOa6dvCsEnU0b9sFtwcik7IBiJmpV3VphN
	IHyQwhMMt1aBrw==
X-Received: by 2002:a17:90b:2d46:b0:39e:6c6a:657f with SMTP id 98e67ed59e1d1-3a0bb6606eemr886083a91.66.1790311820391;
        Thu, 24 Sep 2026 21:50:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:20 -0700 (PDT)
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
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
Date: Fri, 25 Sep 2026 11:49:00 +0700
Message-ID: <20260925044908.450775-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215021_867324_01C36F26 
X-CRM114-Status: GOOD (  14.73  )
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

Check and propagate errors from paired memif clock preparation and
PCM hardware constraints during FE startup.

Unprepare the paired memif clocks and shut down the FE when a later
startup step fails to avoid leaving resources enabled on error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 40 +++++++++++++++-------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1d3e01e2c3e7..5e76625915a5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -364,24 +364,38 @@ static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret = 0;
 
-	mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	ret = mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	if (ret)
+		return ret;
 
 	ret = mtk_afe_fe_startup(substream, dai);
+	if (ret)
+		goto err_clk_unprepare;
 
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				   MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	if (ret)
+		goto err_fe_shutdow;
 
-	if (id != MT8195_AFE_MEMIF_DL7)
-		goto out;
+	if (id == MT8195_AFE_MEMIF_DL7) {
+		ret = snd_pcm_hw_constraint_minmax(runtime,
+						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+						   1,
+						   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
+		if (ret < 0) {
+			dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+			goto err_fe_shutdow;
+		}
+	}
+
+	return 0;
+
+err_fe_shutdow:
+	mtk_afe_fe_shutdown(substream, dai);
+err_clk_unprepare:
+	mt8195_afe_paired_memif_clk_prepare(substream, dai, 0);
 
-	ret = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					   1,
-					   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
-	if (ret < 0)
-		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
-out:
 	return ret;
 }
 
-- 
2.43.0


