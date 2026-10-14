Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77468CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=; b=Q05RKk0PhBe/3z8jkCQOIRlXu+
	fq92EVit7a2GK4GnBtgJ6rZPFc0vEft7VQARHLA+QnR0dIGct8rlctjitISbB8p0E3R3TNWsGA0ZO
	r8rH3zkCyVe2/D8+rBNe8s5t/MdsVzZNYgQPKOvNmJeHQVnvZWCBvL4WcjReWu9BV6EtlZ/etJ0vt
	ydAEKbHxtZ376M1C/qHt+TXG8vXEcOZRXQhPoF9NY7KpSPNgpsAXbOKvX/5WdvpRN0Io8l2gfJBtO
	7cZOIg0ejt3f4+cfI8ffmTbXb7FOhu0K3+CpFpDPKbylOOWrFLTQto0EDNyHlxFf7OXMio5V08O6H
	048hoOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9k-0000000FJZU-48cB;
	Wed, 14 Oct 2026 11:28:25 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9f-0000000FJXO-2Bpu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:23 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2094456a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977298; x=1792582098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=L9vZxGSaqJTvwnVFTFs2nMYukUiNnWTYZHwkekOyx7rX4pV6RadNP1NHBJh2TVBKZE
         4zaG5+tcQikxbPZ1kQGafxQEHJF1vaQtlKss7taa3GAVi2Ws0G83TxTI9tiGbsYtdgid
         51OjfNx4bKnPk9cKeFI+6SJMeojBBKzE1FECI084JnUEmByqTs0KNnMdDtaOyNjCSGq/
         81HXoYY12WON92uQxM2EXQgTtlQSPM5UDwOYM5jpILjS7rbF55c6Ea9NhMM5Rg+wQpVw
         xeOS6dpDx1C0lMIcqfIuKzPROlOowIbIsfv3L6wha/HqwAlH0N/24j7aysreojBg/7bN
         Fwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977298; x=1792582098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=qgB6VCgErGBe2zR6/Ds1QLFj5B9aJEtOb8Ju8p4+mH2AG8EY+pMt7WQ5tHSF8MAuoQ
         APXXyzhkueZqgbfzrnOCFUEKmZblsM5zlowYHpAUafSTTr7gY+JKkLejM8xyrwjl58Cc
         0ucPGxBiiNNuxf98JumFftgkwJl+UNV5ZnUoUJQxeN1srDWyUhIcFA/KrnKEz3gbsF2U
         M+iVODcgZJtL2UWVjerHZ37EaUOUpw7bsdkF9jBTjlDuevTkobkrjksEc/XFsslOXDb7
         1KadvfquYJq9mgpf3Vp7iVWkjWWDltY76DVyetlEh6p5dRfBBjTHbALfI3fmiMwIAFdV
         /buA==
X-Forwarded-Encrypted: i=1; AKwUvBxwu7O8YEif8TSZ6irQGm9Eqm9/Sj2BX3klWdLNCTRwmEtYx2J+3P4L26GGPW4BnqTY2f+hFffgrOh3mBzrCcLB@lists.infradead.org
X-Gm-Message-State: AFq9FYJQthwrD5u06M4N//DB/b5RCLj/N8LXdMzTxRdYd2qZO87NQOgX
	IF4Icop2TjbkbTtZ92xdJFWHyEINmcNLW6EzTaboYnaKBJ6PRAT78GKk
X-Gm-Gg: AYBFou1Q6LyT+nZBDcQkEXxOagTlKGKVyM1BQZhfEHD/kuyk8thzRc1AUMkvr38MhQ/
	nGK0KwNnEL9rzgom/OtDt2FAHHRQt2vnwqVm0w0hZ2B3k7jge5cd1UXa/Qa76x2SKnr1ppN2ZiS
	09xse408oiyksx0hgQtbO6SFxFRP2Vu4r7Jrs6yV6JtPXU+h9aDB59DvdHrG61nzn3Y7eeKYhMp
	SQtduH+AV3wexZe2a71YNCfqco8WEQjgbFEim4D303TLrCyaKtbeaChlfygraBiCZC1SnknghTH
	7MDpWV8iSq+DBVvgNVvLYD4Y3DJl8ypY+ADo5FwMPL2Bs0tK55bUl9uLV4LYLV5xoVI3jtuH7+h
	oDn7PbGYUYuhzTZ/xXdo560cKRFa9tuoqtFVpbp3KLcw19TxrCgEHh49v9zFTBEYc7zYt1ODiON
	bVIwAul1Zz43SUSpEk/ujtDvYGK5f1c//I3tS0idk6WEqAHpBkN554zLXABcwc20f7sX4RaK3Po
	R4F/j4Vcsi9/qrDgUJbiGXf9vkDoCc+r5k0Qdodfc0dxC2nhrK2p8Bn412+Y5PdfEV6lbF3gcKl
	UIG0nJiYRo6VKw==
X-Received: by 2002:a17:90b:4c52:b0:3ac:6c15:1173 with SMTP id 98e67ed59e1d1-3ac6c151496mr1396142a91.31.1791977298568;
        Wed, 14 Oct 2026 04:28:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:18 -0700 (PDT)
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
Subject: [PATCH v3 01/16] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Wed, 14 Oct 2026 18:27:36 +0700
Message-ID: <20261014112752.683032-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042820_263490_9A10111A 
X-CRM114-Status: GOOD (  12.42  )
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


