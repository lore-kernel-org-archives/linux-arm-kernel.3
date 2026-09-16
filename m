Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331C0C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdugvJNqgU6E7j1wDJGENADgIVNNhusm8dqwAWIMj0U=; b=U4hDvJU16b19OBlSiqD9yhIsNG
	BTGrsn0cdZpwYnAb6DI7EeH4r6vfM3HB/iErKGm7jiDiGxnm9FJ/WDhFqcy1EeTta9SkJWOQI90Vq
	ODxjtDYE+uH+gO9vpF/TH9glzyutK4Np3rffhpChWvKfYzOF67OoimQI8YaPSBkFlKxxyMhilZWQQ
	x6rsJ3BxJTocQCI5T4GenGQF5o1cLM6kenDyBQmUvXL0adeKL2Xh8TBmYjngOB+9zEXdZm9nUG6iu
	5muqwZciWr8TrqOrfh9Njml9MXU1yWAOz3ub3qdmiZ6wtonxlHlR9oF/CD9jb7jzmKuM/zv8+AbQW
	dmal0X2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlj-00000008LLb-34iJ;
	Wed, 16 Sep 2026 05:01:15 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hla-00000008LGH-1G1i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:12 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so306111a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534866; x=1790139666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdugvJNqgU6E7j1wDJGENADgIVNNhusm8dqwAWIMj0U=;
        b=MeMY0YYui4ug7DclwkcJElQs7pKEyjOM6CoCzU0zEuk2pb2GVsBkGsbAgP3Y1FAy7e
         GfBkaUmRhcJe6CooI4s7/3zLFq5EMl13YgHOI2ydsp0el00dbzXS6uN8rEt5u0VeHS0h
         KxafgOeDpVRj+JKNstYZjiI2LxHCXF4yWQMmrSFPeIlOXybHIl+eaPhE30uhqE55xNn8
         e/5CNQ3ZWfcwU4IpEQ++scfgovE0H0LmBSuRctWpnXkp+JLr4Ie/+gbOnktJ0BFOf0mP
         Q25lBVxINNIUC7ojeJG7JG4qQzxenfnI+i7+HwTZtxpu9jetspOUUXEenBIUQnHALDNc
         3UTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534866; x=1790139666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdugvJNqgU6E7j1wDJGENADgIVNNhusm8dqwAWIMj0U=;
        b=DvkQ26ABWo61VtNYthYq35o+2OcoBizRkgsSO3yUiB3tQ/R3wURqzBe71AU91J9Yim
         hExC8H+QTtUfQbN0v6pFmivPburQtEmMQP1YDXdpLzAhbfhmazgWYeWCOPLcFLN78Hh3
         8CGTbE01gz+6gpcrdtoKS0jaqA8xQZjW7oG3Js0K7rZ+1h85BJ6tsZqMhvlGKvMCtw8y
         ErAIJzUZ8iLzJiWdiabfDFc6yhVQjxeTkUS+q9CK2q7fvJtC83HtInyGpKOYVU3QrhFn
         lMcynWyclF9ZALjz7zl6xdEuvShkfkuXUr8sZzaZX23nK7aERfavVJMTQdsOuqxf9Dad
         URjg==
X-Forwarded-Encrypted: i=1; AKwUvBwcXButTYykTM4ayuaNw6NKBED/l82xaVoAI9NTHfJi7pgJMFVxf/8ycjv8HaIR2xfhela0ROVFZbfzyviJHQcD@lists.infradead.org
X-Gm-Message-State: AFuF++l3OKrJNj+G/85flajqSBL2xPsHmg76pyqyfpdqebnkzxByiL28
	V4GKcd1hhijN3jFmEB2Ue2DnYj64dBJ3iC2ArBMJeW42vdhDYjfFlfpc
X-Gm-Gg: AYBFou3TsbAD/IK5Ir544QQ9X6awAx6PUXIng4/NV762cr0aGoOF2VqUIFQe4w+tRtR
	kJaUnxuBcVTstgnrRyyFETnsazKy7Qnqwuf7r/EYQKVIwaqr9GF/DnB4jv1jSduR2K1N3vdo10v
	XMpclf7E90y6H8fMjkwml+veOtOb2JVfZMA+G4ZADNrQNkjy51T2SW0MXdIxH3wFSEa704pMsF6
	CvQkX9MRpg/FMdwWLczAVbCRtb+s9aLu9e1SxXUinbqKLRqBr9nAOZvpzJAo4/12QIJ8/Hcdxr3
	3I4UWOkYbwXXSHOGG78cwRJMIM63Mv5E24tvvFopdK6cnf80K0hbTFx1HSBCplYT57MAMXISEBk
	SLXgOnnHD7q+A8MsibfsTlMe3qAxSWeN+XR8Cp8w5UczVc8HlWvTJ1X7O2874e5RNOViZo2d53F
	6MOwcB1+q4L4sWX8Z/lkIE0ZPxP/KejXOzmsJdcyNTtDYSTgcppT4mKRo3AKBiePkZi1TjkMYa3
	qxhYdmPPjxtBtYOXEsXxNdmHB6gKlodTLINyzskchdGxaMBLnwrKRGgJP8gJDFQbQ74eq98UPgg
	oBghRLF79CCPvuo=
X-Received: by 2002:a05:6a20:918e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3dd5f7b25d9mr2952258637.28.1789534865531;
        Tue, 15 Sep 2026 22:01:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:04 -0700 (PDT)
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
Subject: [PATCH v3 05/12] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Wed, 16 Sep 2026 12:00:12 +0700
Message-ID: <20260916050020.14575-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220108_247301_A1C75593 
X-CRM114-Status: GOOD (  12.09  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 1132c924158d..594c214fa697 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -793,10 +793,9 @@ int mt8189_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8189_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	ret = mt8189_afe_disable_apll(afe);
-- 
2.43.0


