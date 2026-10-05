Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCD3CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=; b=wpOyIje6gYiSX63KLkFXHvMAds
	LoHsb8CE0RJ4D5UB40MVt1q9YSvAEKBxY7RkDfWNVxbZ3zZH/BzEAjIBowHf3i7kdt+660w3ShhSV
	i256iOSU5tki4VIOolchRBeyCdvGxuitjDCgvMSPasyVO2ipRy8Qb9he3+5IwIJqxIlHfJlkeAftm
	iAWH3E5yotkMgoSzcSIKzskrO3snzkEIVsGeMEnvvA7FFbOSCLOkSe3MsaN1JlE8RT8OWQ2/IpP2v
	Mc7dovr6YNcsQTAYOAicfgdRO/Ml7jXfS2avVJx1FPoD2kUwLCJEjHg7JWCgEOOH3p392k/U0HUnR
	r8vfZHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTl-0000000GGwv-3BAl;
	Mon, 05 Oct 2026 11:03:33 +0000
Received: from mail-pz2-x2a.google.com ([2607:f8b0:4864:3b::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTi-0000000GGsP-06Y3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:32 +0000
Received: by mail-pz2-x2a.google.com with SMTP id d2e1a72fcca58-881a3a28e72so470536b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198209; x=1791803009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=Sxv33fvb0PfDoJrBYcA4/XTXJUAiTkQX3KCyjTrV2ZhbciXPoVt+qhfG7Y8JLVoQLa
         lG1VC8SQEwiMg1hS1hAg+4l1klU/tmJqjVGyO4QhrENu3poMq3sRqmnQBpSdW0N4Y01Q
         S4yQxyWiKYhkuAo76CYq3qDpxE4MkO6SQO8lJ9XNnTZCiJ3jSGZDXNX8dTOVbxJP2M4D
         85cPfh6OLT8uLK5XdoOkDS/WVpnRGsd1O6yBrhMwp2DhesexXJO5SKkPfMx3mzEGJOsE
         EnFFHFFjzMPGQT3MXC66EJSgBipu4aTgVZq2HQGcYNX9vF6uxeYZaBIosA3m99GxPsja
         SM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198209; x=1791803009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=BptdxZTzIO8ZV/l3NfEVPexbpNpO5S3onc2FklYQ2DLR2SEdNf0dZSFf0aDnY1J8T1
         RkZeCMFr/1nH14Nk2ublu+65+PvS1rqnYeNcaG5suE4pB2hx1GFM5Uj3wHLGIH7ccvbc
         tnPKtj4DLwnJqmMhBYkuesba2BbDmhXsf0SmxR5KVil5wwtnfCXd5+wY1XcGVT0TCsSs
         Chp2uR7oZk85JEI2iigPjVAfd6+VtAVG0747FL14FA2SkQqnwlCVhwV2dBnfMm4nauTB
         cEUKxsPgF0FMPGZl+CBCqGfPu3H1VOI441fhEvk7jPtuxWTOVxQ7gmWjTp8OWjFHKV5N
         IJKg==
X-Forwarded-Encrypted: i=1; AKwUvBxh0aZ+RX4OQIiACTxW6d4vae6KEtQ3wfPVPFIQguVVNXVw6qGJNkPTj3BNHBNXZV03FXn2lZ9kH3sr/7zhaLc1@lists.infradead.org
X-Gm-Message-State: AFuF++mM2xnpA0pDuYawlPrm+o0Ei50Df47qik0g8FWRCj4AwA5MfiD/
	lj6ywBPYgByu30baVCjpzOl53jCLJ8yxG0DqkkyDjb7MiONmnIESkMa0
X-Gm-Gg: AYBFou2KgMWVIUEKRo/rtFMZVqTUqbqzYqn753AUjIvVIk4v81vVdSwPRwy+aPnbaGb
	sCvuJY8Pwvo9vgArecoORZJGwTM5b4Si/cy3shrgsrzi0bUigp0RxRQCjfoLpEZPbX1Jo0CsBdp
	3cDaNhyh2fhPZxPOpu6rahnDktlqPbot2a9Gr8kk2a6HY5BLqrml0lltJQq8zfHAiE07eVVgCoC
	bl23OjySPJbCer7vO9m/SIrSlNnPbRgfj2735H7PKKhf0Iz/CEfMpnMZnCwvoIbP69s9y3o9bzm
	XAyxoENl9vLoGaRBCVwg0dthq4A0kv1Az2tGl06ADJ/39R+TvtmNzBOrXbRYctAjK4QAhtLbc+Q
	T2TPq3j5i6PE8wKbRRUSsQIwAbDLgiHvSftYvhSE53GwOfiR4lAo/N0OUE3ZiJ3wIY/Og9QC+Lt
	2gc06mObtg0UxH9HsuwKXkLWYcY793J8hRdrBfmI+ikSFkxRkicjwKA8riszKmfNDgPbTb6sByr
	pOCfOT0sVbCNswECbUTDELAiA4jCa6kD1aooJcbFkTx20Dy/Kfh2s7ttS8YiZZw+idoYKyGt//f
	tVLqv6C/kErIQqh7TCPkkzHt
X-Received: by 2002:a05:6a21:ed0e:b0:3dd:a196:3091 with SMTP id adf61e73a8af0-3e0bd42d56amr9814841637.65.1791198209069;
        Mon, 05 Oct 2026 04:03:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:28 -0700 (PDT)
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
Subject: [PATCH v2 03/14] ASoC: mediatek: mt8195: Fix register access clock error handling
Date: Mon,  5 Oct 2026 18:02:46 +0700
Message-ID: <20261005110257.50145-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040330_557081_8734A7D8 
X-CRM114-Status: GOOD (  15.29  )
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

Check the return value of mt8195_afe_enable_clk() when enabling the
register access clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 12d8159338be..34c828fdea29 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
@@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


