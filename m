Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAB2CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=; b=rpL95PJdmsvA/SQrstvFbyc6YZ
	N85c3aVg1OmHfp3GTroPmwqNRBcIh77Vhd1fofKBUROY1kao/63nBTQ7i/RMlMXtg8vgLRmsLSNdQ
	WGOblw/9J1RTK3vOJYO9OiWxwvg0KhNCAg6fkVmU43sSnV9kDD9vVAtk7DkhPFIipa+T/C8OIST9t
	klnayir2ydUGZvEt/nABNahPDEWonB7fsDj/WG9oHxBVzqPnvNj3cJ5lIiZCVevkWX5Ps0ZsRUkfs
	drjl4L4ilX470kUkNLwMStyCW0G6uH/AqlcS296pUl2kGiUQhPFGPBve5QiP/s/UJ8lkJBnw+28jZ
	h/+yqZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUN-0000000GHiQ-2gsJ;
	Mon, 05 Oct 2026 11:04:12 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUK-0000000GHdc-3VE4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:04:10 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc73a80ede5so522157a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198248; x=1791803048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=jw70/kB0VbTtIxwtMTkZPxkM0XQGWiii8epXRusAHZQFf49hTJTckhG8UQ3MMhXBKt
         3x21KfTO7oFB5VkLsYSh7yMtx35wxdwkZIxVFGZn1UZoeN2er2EZAyzJokglfIRu4C1i
         FoXTkkJ4TLS+vGEV+q5OUYHtbjp627vQQ/YGIjwMgZrmBBZha8RQy/nsrQMI5Dl1jOZa
         07o0ww+1mmGw+ssygt5fsXmL91mxz6mo9LGYJLIrDN/DT6CF+uOBxiX2cjwJj6Xgk73S
         7dLqo9IDE4CJmtUwfMsRRF5ccQl534hjomJdFn/gVhqzaewCQaZ8o4laetPSGXAGS0iS
         TFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198248; x=1791803048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=XnPHuFvfStroX6SHvF4yUB83Je+O0Pn/MYNdWlQjKz6TyTivoFjbhIiZb3TZHEjPy2
         AjEr6rqyUDzVym+pWep5tIhuusnwbpu7iOHp5RIhZqOBbz8VtY5m52QBAAbbQvO8uUUt
         yIjlPbjf3waDoREdAi9LNKX5kbOLmAtuYUI2dOXkZyb8V6W8kpC4/Vhrmf0wX3pQ0kVu
         PlwR06gNf8uNhQPX6Fw7BaQuubA+QN4Vh+qJlZQ0UNcL8kZ2QIHr6yRUXBqDz0BXHBTq
         +npA65UESpgZ9EnHL54f6uc0l0miYFIOxziAzorBq3XE1hN1ovgvwI2ZicOHW01509vl
         7C7g==
X-Forwarded-Encrypted: i=1; AKwUvBzKkujwbC3J385FK3XRTWkjwaecAhGI/N4FZUTORMI/aEs/bsruCG7LDgt7EA3apvwng852M/Dg7NtSedP7AWX7@lists.infradead.org
X-Gm-Message-State: AFuF++mGB8YKLlHy5Lc7jbWW35SXhs/xSTY31EW56sV2Mk2Iwh60SDgW
	oytjb7lFry8ZSnpwII4BNTl/N6OxHEHe2ajDD1mu4JvpMUdpNYIkl+x8
X-Gm-Gg: AYBFou3tHTv+kfHby7cHWVY3BXsb/oHYf1fqouP4UvFNmm4eo6fnT2xJjD6OJ33VOGD
	dRhFdZ9EAs4UsIPRhyvm3RAVEDFBBbDIJhcjhFzR/dJCxWISSABm/XA2PtuTpmOGxNyOegvfXRa
	WBzZTD6CO+727gN2pT3sTegpw2JGX7EhIjs+Wd2IIiDR6TzIIRVxTDkk/bNJ/zkeI0N4JpY2bpE
	vWxYaOTeKqasjngDXgVNbPcYvLd+dS5mb+qTZOV5YUqstNlrwT5mmeNRbl7i9uK3/l9EqJkgIP2
	QAn46PHuAFHaV+wLLu1sA+AKXNIHmuhKlu9bgonL7sqhD3hNWefWOq1iY6zj87Mm4J6kEBRXTfG
	mOpOrFsyGrnqGlDfov50xAwp+qtdXdR69rkFyLoNu4/cGLKsLgNSvg09hUwO2LlE9WsuR+CYDtS
	WbQ9U31t8k5i/G2kcR9KYL/EZ0nV4GJRpdNl58US2Jwz0HfGGWWB/WW+0fN/A3gSTCpvG4wMgUs
	TATdBwxPE2SQGzzBw1/cr+opKOtaMXsZEV2UzkBLHFoixtF2NqhvpXw+R1e19g+tXIZ1n1lm70e
	HccutvduwCw6ag==
X-Received: by 2002:a05:6a21:9089:b0:3de:5a86:9dca with SMTP id adf61e73a8af0-3e0d6b554ccmr6744719637.19.1791198247726;
        Mon, 05 Oct 2026 04:04:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:07 -0700 (PDT)
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
Subject: [PATCH v2 11/14] ASoC: mediatek: mt8195: Fix ETDM startup error handling
Date: Mon,  5 Oct 2026 18:02:54 +0700
Message-ID: <20261005110257.50145-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040408_921391_0AAF5044 
X-CRM114-Status: GOOD (  15.35  )
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

Check and propagate errors when enabling the ETDM MCLK and clock
gates during startup.

If enabling a clock fails, disable the clocks that were already
enabled to keep the clock state balanced.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fba51c552eec..1270fcac6b3f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
 	int cg_id;
 	int mst_dai_id;
 	int slv_dai_id;
-	int i;
+	int i, ret;
 
 	if (is_cowork_mode(dai)) {
 		mst_dai_id = get_etdm_cowork_master_id(dai);
 		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
 			return -EINVAL;
 
-		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		if (ret)
+			return ret;
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 
 		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
 
 		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
 			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
 			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
-			if (cg_id >= 0)
-				mt8195_afe_enable_clk(afe,
-						      afe_priv->clk[cg_id]);
+			if (cg_id >= 0) {
+				ret = mt8195_afe_enable_clk(afe,
+							    afe_priv->clk[cg_id]);
+				if (ret)
+					goto err_disable_slv_clk;
+			}
 		}
 	} else {
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
+		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+		if (ret)
+			return ret;
 
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 	}
 
 	return 0;
+
+err_disable_slv_clk:
+	while (--i >= 0) {
+		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
+		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
+		if (cg_id >= 0)
+			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+	}
+
+	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+err_disable_mclk:
+	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
+
+	return ret;
 }
 
 static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


