Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB895CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=; b=axItjCk08SihfG2OimckogcQet
	whFi44G6SAWoZgAf+FISK/azxFHba8f+2qyJK745kQkDdEqKU/Jh++jmdWjVFGTiY8wMPQ4ZkH1QN
	YFk3bFpgDMSyJJrEsc8JovTBLaMx3oTpO0wqnvQ/N2k2JLM+7tFIj+He7dLf83PtXuKrC5lQfi8jS
	D1UAacUbn8bwoC4BFmbn/aHjfvBMjCq6LNwQVLkmJG97uknX9cCLzMsFBsaTK1fqOti/9KLKwlaD1
	Gj14MpMMr9ddZelG1VPnuNluAYc3hJSMuJivZ/PA9yUAJXsClGl8uKKF+xjkIpQK2ClNKiIM2KRfq
	+rcN/H1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTb-0000000GGoe-3sxx;
	Mon, 05 Oct 2026 11:03:23 +0000
Received: from mail-pz2-x29.google.com ([2607:f8b0:4864:3b::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTY-0000000GGm0-2BbE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:22 +0000
Received: by mail-pz2-x29.google.com with SMTP id 41be03b00d2f7-cc7d1802740so799236a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198200; x=1791803000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=THcZO1i0M66y9NJ9DJif5PdiJqkytEeGFhhV78M5BluAo+0oq4h+ZE2tc9vAA8kp1z
         yyi0rAssBQp6GrFwYUkaLRM+jKVzNOMa0Zxux6b1WCP84BIyyHgROtWOO8lKLVkabftA
         yDUswItHgq+6KO0HCCfq6FoR5BXBfkefmLH9nD4cxd3Ar+9AMzzmT3+CFhbGFhyvBbtw
         JQHVwqDya+D3tKGvMwdE+E3jcc1UQc7B/iT9C4wxtx1ZJOGv7o5DG5EArQ+a40I2O3D8
         +WL95X3Nv5dn2aAkwja70EbJbHbWZmGf8/4IjsJ/FpQ9QYzKRHK6u4uHnyh0MKUachmx
         eB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198200; x=1791803000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=CwiVKh40iaOYnLf4N/2/wYMeFCng+b5cU7jSpk6ZDVPgZ5tzphxLPmjd9Et8cAVj07
         aduLfoGAcubvZqOV4KvrfFAcyPoXL4o7gj7qE3NOImfwM70H7bErIZTyQI+1QEzAizBr
         fO/s8lVVBhTI4vi0LY5uYm26EnDemfSF1GeDJdPpmez98CjJwyya1Z0ofZ2oDer8BDqE
         DUv/23euvc+k3xgi5cN+9wlB3pcwji6yxkSEsYWISpYvRRnhTTPOVEYD8oLqGKBCObGx
         yWIE2yJm05DC9QeIyjODNotMKCjiZI6JXOMMuGMQruHE/1naKVSVkuUXfcv873ozP61A
         S9rQ==
X-Forwarded-Encrypted: i=1; AKwUvByjkIHQSEa9SLxikEtZogkbO+vnsL/ilaUNtYGXLYaIZezOpIkmJl4Cb3B5ORF2wYjX0f4ztoR/JSxDPqSb1Aov@lists.infradead.org
X-Gm-Message-State: AFq9FYIF0nHpX6jbJpYLnovj7/XRGdeQSP7MQwaST6EwlWdsunxwkPC9
	eVv67OheS2LHGOl71YTPqRrcSpcLH0L2l29dc6cR1PtRGnkIDxqdzCw8
X-Gm-Gg: AYBFou3pXfn6LnNA6lX2GUWU2MbPZej/j+kP+9IiwOClrtX2agnHgAF4H2YP48ml6KE
	XNkkjQS51rfPoRDt9cDNng06VhzUOC13hC6b0PZSSQsUOB/HrMhfF4lV+R9xqVqmXrLtpy/+2OJ
	DH9FIUovwoem7GLNioljes5AdfYHeAkm18/QvfvmszawsNLfjYgnOCQ8ELlT+QLDfVH1WKRjLPr
	b7BSaN/KDXor1wn47LSnoryHfjOQtZSKNgSFPpXYzv8N7t/yCV46Z6KOXxpmjpKUTLWX+NLE3lu
	lNGT0ZLFHwGUNpz3RRKmtiSXp5ypLYbbKGzW2RjuXOmhn1d/soUvcvKxGzkI81RW3LhTQxxN/n8
	lyS2a8JAiiVgHcmeu+G9mJJtCcBQzAEypoAYVHcE3zmtG0OXlkVrwhIocsiFq7qXaoRTVRwJg4d
	tM5yJY99yeCL+7DVFsek6QukWNFUvkGEPAYJY8AWmKNXY4PQJ+/Xh1QBQOtcgFV9gaSnQ+vtIiC
	ePUKJVdNOqtmMzXFTJeYl3y40+SEr5D5lMAKKneqOxo9E86J+WILf5O/oCrYaxbDoa+T5JGofCu
	w9o0yylWKmJtrQ==
X-Received: by 2002:a17:90b:586e:b0:3a0:f5fe:74d9 with SMTP id 98e67ed59e1d1-3a6ce3a97e0mr9329608a91.4.1791198199561;
        Mon, 05 Oct 2026 04:03:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:19 -0700 (PDT)
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
Subject: [PATCH v2 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Mon,  5 Oct 2026 18:02:44 +0700
Message-ID: <20261005110257.50145-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040320_956875_13B81440 
X-CRM114-Status: GOOD (  12.30  )
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

Check and propagate errors from mt8195_afe_enable_clk(). If enabling
the tuner clock fails, disable the previously enabled APLL clock.

Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 618d8400913a..ec1ea5b988ff 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8195_AUD_PLL1:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8195_AUD_PLL2:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,
-- 
2.43.0


