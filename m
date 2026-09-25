Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4151CC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=; b=tTND+urTF+tDDdLRyO2feCe+tm
	yp8RbASvrMOcGj+bh7xeGhf3NAQTMRoDwUzCzn5mOoFTXxCOqWPoaA4eJXkPO8T5WtDy2yq4Dfp9E
	pxW0QKPOpHr4wZtgJtvuzfuzpOTqm384o4TR3l1hIM+GUCLc/yH6BXVF0EYyzlqrsBzDL3i7/cUvX
	nMNkFqDJiNMlw+pFTp4jnKEmHY8FcgzLIkRwR5nGeTBj0c4LCFd5BzSvmaPbCrcwQOcgtvcrBoRxQ
	TTmu+2sB6kepBRccd3xhoUuO4OCiLzDN4X2Sqvw52Wp6psvMeXkYfMp5DEpxY67ouPKetXvAeHOA8
	w6AwFcvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsr-0000000CdII-2q6H;
	Fri, 25 Sep 2026 04:50:05 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsp-0000000CdGk-3D5k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:04 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso312876a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311803; x=1790916603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=ULRfCcPHqh/Kt4Cvg3hZns6KVXWx/XiwxdJim9cLPbphUZeMdtCkGS7EV+ruXD4Fb7
         wNKwOsW18niOmSzXo5bLbV02PvIuUiPttHvW1f6ddpQG7UAshJw5VcXf1zPExoo/tz0o
         ngr5bpBut2iYRTP4JrPvLvXZl+xKkYkvgq+uJa4N7NBe7yEqAm5Xn0BZWC8e/+X64pnj
         lar1dVV6gFwKTtW5to3kH+nxYmV4eW+xO/dh0c7Mv4PnvY0otO55h9CRwJEAYQgQt9zF
         ZwtlSBobV9af1az0Qly/pEkxBKIJAyozYa5a86wxM18G8igjbdpREC10hVxZdsrpoeUW
         m1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311803; x=1790916603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=zP/d4rPZTBkfDmRPmWLMEYih2mHkrjKSpBom84q6p2HnaiXHY+lEoMqW2bKxjtuAWM
         pG6/eBNvYvJ7xMMiIE2q9fheM196CwddqH8985ITeVgm8wvhGcvBPj3r5/iRIC5GoRS3
         B6npOEtQ3kc461ehkc25mt19hsbjTaq7lVXH0RX3EWEPnt26dUQgmcRpIlqIEfaZl1+X
         YdarBJDd0pnIVMmV26aDeRd+7y0utWDjhKHL8KGZH7yaWbhnkoJKHA+Fet71yc8HoBNb
         jqwn+a9WpD2EM/Q3kooygfU3/e6owBPooZw/mNQ1lS5NPBP5MickUSZt72Kn7JU4TgD+
         fwtw==
X-Forwarded-Encrypted: i=1; AKwUvBxpbSjalMxzulS49I54fyHfK7IRcnFhKm2lbIzNnTRq5Xnn2X+KQy6SwfnYfSwCH4d2XknzLfC9g5/BoSOw6puv@lists.infradead.org
X-Gm-Message-State: AFuF++n1vQ1fYcRAXWTdm3I4RBIMxLIv+QCyfIfAiQ5Jjey9OCQgzUhl
	ytJUkB/5R9cdDnOiuHdIMX9ISnwRPA0JTWM2io3YXtLv5aw/mJQwVWlB
X-Gm-Gg: AYBFou1IsWgtNalQISRs7cffzaFsRLNFFMMarRBCG22rKDnFd3gjnoIZpRhglQaYgtf
	KYDhtTxiF5+fHV4gSzhcLTZ1F0kQxNICiG/oyPa1p51GwtqRV+BGHtr1DQpfEHMbEmBM8YlXDkv
	pS+zj0LGF8pwkTSSZLw63FKIeKsIrHHhUTP7qEYBzi0VKhgNaC95eUK1Jxtt5z3c1c+T3D8lbrn
	cczyKabjqc6lF0oDJdpSQ4P+LbVr9VY84I/zJkevv2fot0KTGK02IAI9QPcWa99L2qNlsZx3OYC
	tv6RI4VSKTs9WMM6lZ5HOoAY2O9PUkfDIkvFz5kNTZjau24LKHbL2fjaLFnG2LCjMMGezw6NpkR
	2JaI+g3GYSo8bKHRw0GXBQKRPvBoKjy7mT9zZUGb7bYIaraNcbaCOrRr5WSmEm7ulyQEh24avy7
	vy4XNltZjCssCfsCXw0jWZXS0p+pRC39f0onECUclRCy2BxARwKHXsb2sKI8+2y3AyKAVn8SI2m
	sfDRZ5rceRefXW/0ZLunUCheHaYIfZyQm+z+gHYq+9yNIHm3bkxdRCwp6gGUc111LeoIJTnwOS1
	RHWxrH6HQhI9fxusDPJxBsd5
X-Received: by 2002:a17:90b:3c51:b0:39e:6c6a:4b79 with SMTP id 98e67ed59e1d1-3a098e41273mr4074558a91.67.1790311802879;
        Thu, 24 Sep 2026 21:50:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:02 -0700 (PDT)
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
Subject: [PATCH 02/14] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Fri, 25 Sep 2026 11:48:56 +0700
Message-ID: <20260925044908.450775-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215003_822620_8B47EA5C 
X-CRM114-Status: GOOD (  11.75  )
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index ec1ea5b988ff..12d8159338be 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8195_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
-- 
2.43.0


