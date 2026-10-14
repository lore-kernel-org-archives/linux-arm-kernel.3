Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7960CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=; b=dPJCrk/AHJX+Qfs3aPlSv9ahGr
	sFrJTQWIy46ab0ZA9OyJN7z13MpCRScmZDgdOuOtgTU7R1BHx4dcgxyLXDNlcYCJ+tUwH+Tv2AZl1
	bC2LIMLNjuRsirMgglZSfLgcsamqfkTkQ+iTBFZ8v2sz2Ea43vaOOhQbEee+0nLSRpvNvJhJ30MhJ
	s86aQaPF+z3PVIv1wFOX48UxfCmibVZikjw/EVSYMNfo276lLE3ne61DMqICXg25UZOHV0ax/vBZ6
	bRJy5CnvC80mgjFfHEZV2/gz06QHKsC5wHTRsw0MWN/IVbvPsnSAYSUvWbXltb3JxDfB9w47QwVBe
	qFy7VPtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxBG-0000000FKdx-3rMK;
	Wed, 14 Oct 2026 11:29:58 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxB0-0000000FKPc-0QBv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:45 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso175196a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977381; x=1792582181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=LWPgpnfVpev7kvpAFNtZ03M+3T8UPmT9qCPW3/19VtQxNRbnWzYTbHTwEruAKuk3RZ
         YWN4H9ob3TSPsaAdT8TMFraH7nNUFagoLJ5pOCU10cP3/b4bnc4US49Zxygq5AVPurko
         zCJ8bq1g0aP6DZBbRmrs0oWVfqVVioFvBb2wICYVbgKIU5C0mCdfy0pAjkIV/jtsOqrA
         827MESdNl484VOuEcoCvn4+Bw/rdYetYOc5Xu0tT/A/fRr/k8o5NlHE2ul9yULA37ACC
         33A1YZIGBw9MP7s9/iv9uHR3UrEyWR9/0ATzg9BPnXrBOSPSOQhumgRLgjJWk3niHpXm
         qidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977381; x=1792582181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=YaiHvlDxdAv/88ImtW7YsMZ6fTZh+Ol4D/P38NI89izBSUSF2svEsxQbiXOJArCNbp
         pFrrmtUcjrEkVBrf2SNNtjupvkOEpxRCwpJqihcX9hHElF3wh/fC1/zNg1jcKG/6TYCi
         sHlGu0GVKHmvDpHgUIol1H/SnOqG8GT2BioMJ3UehR3MgGV4wSoUiW9hj3fUFsQ3yELb
         Bp6pjYx3TRIt6FEbp928NxTeJsnp3U7P4fFBYCawM6HtQ6yhmcu7ArL3ukQIoRmvdHGR
         gvk7l8IIPm+QX6Y/kA52TKSayQb8ymVAxEQuexQM2A9Mi4pDjYkU8vvHxEiNHsFKmY0W
         YDHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxw9iT4XtbQiMgPis1T1HTAaLt/3hUatXI4EjDvTPijB792f9ISXwN1cHV7FgnuvsZLLzppxqvtmhSiDSgb7a3a@lists.infradead.org
X-Gm-Message-State: AFq9FYJjhRnRi3A4Q1PziUU7mk9SJankLFas5pJXj87BcdjwRuQAnwY4
	XXSyvA3ym2lA7DL8th7iDPejQr1WCHrnnDWN7d4Gu8U6CMwxTIy17aQK
X-Gm-Gg: AYBFou1yt6KS5qMgBEMsLhMM0/bL6Q/bfXyTE1940zRRhk/GQ4Lmu+qM3gBWOossAK5
	F6vouUHa2NXmHDIKKRW4yfvzwh63z8VJVskG0sNtd4vjfFsyaT5wVlBnCUgBwtLpNT7IRoI+E0H
	O5Sv4BklWELUfJPZaaMo9a1g3VKdZlI2XuvQrVvIYX9kae7poavIQbGVVxwdWtXXK3BHb4H8sn4
	+vMYpSD7C0GkF+C9158mO4SR/m07o8/iH7z6jGbmQFi/3UtlFPOb87vzVTLQcO+VNPTYXeowrRv
	kb1TMKL5iOPmOLoYGdobYKFur0xLi+6D+SNYK54IB9d+2AFEPgNiooRpsIGMEyND3yZ0tA/a+5E
	fEBpDYw7dYB+sX0fxJRcv9kyqYd8KUbDy/mCnawnpfaatJbChDhgvwEraX078Lopk/fqW+bPYq7
	jinXkarQMB/FhpycTug2HT5RCv9Sib5m+Pa9u8Dq+EvHGa1Eywg5K6HzckASy/wz1AO53SaSTh+
	JGd2vUaaDRjOiRFNlvhm/IRReb4kx13ryS7wFkt8GMy4qsydT5oSibKpIBBCBdDJEBCaeQ4tG3F
	wKTf9I07/UsP1w==
X-Received: by 2002:a17:90a:10d6:b0:3ac:80dc:f40e with SMTP id 98e67ed59e1d1-3ac80dd0197mr393878a91.24.1791977380867;
        Wed, 14 Oct 2026 04:29:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 15/16] ASoC: mediatek: mt8195: Fix ETDM probe error handling
Date: Wed, 14 Oct 2026 18:27:50 +0700
Message-ID: <20261014112752.683032-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042943_555776_2822F245 
X-CRM114-Status: GOOD (  12.95  )
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

Use pm_runtime_resume_and_get() to properly handle runtime PM errors
during ETDM probe.

Propagate errors from MCLK configuration and enabling instead of
ignoring them.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 27 ++++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 11317cdd14ab..8fa830a57502 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2503,6 +2503,7 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
+	int ret;
 
 	dev_dbg(dai->dev, "%s id %d\n", __func__, dai->id);
 
@@ -2510,15 +2511,23 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai->id];
-	if (etdm_data->mclk_freq) {
-		dev_dbg(afe->dev, "MCLK always on, rate %d\n",
-			etdm_data->mclk_freq);
-		pm_runtime_get_sync(afe->dev);
-		mtk_dai_etdm_mclk_configure(afe, dai->id);
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
-		pm_runtime_put_sync(afe->dev);
-	}
-	return 0;
+	if (!etdm_data->mclk_freq)
+		return 0;
+
+	dev_dbg(afe->dev, "MCLK always on, rate %d\n",
+		etdm_data->mclk_freq);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return ret;
+	ret = mtk_dai_etdm_mclk_configure(afe, dai->id);
+	if (ret)
+		goto err_put_pm;
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+
+err_put_pm:
+	pm_runtime_put_sync(afe->dev);
+
+	return ret;
 }
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
-- 
2.43.0


