Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B071CC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CExJJFNeVdJxJ2CT2z02fSyns9MbGRw3UzVN3YUCwRQ=; b=lsRrj+APg1lFtD0KnYgIi/0cXk
	LjpWUg27l13+OkzC2h1w+8AJXl8A0C+D4qNmYFnOAufv3G3t2/L00VpUsLAk0xxR362uXxKSdr+B7
	oxaJz1V0RquMX1mBZo4v6oOJPgd//T2Wj9s20NuhKlR5/onkTI5piUtm6tSsaoZc490Nsk5sx1rf0
	azoAAwYkkRycIH8AI0cAVOYjFE1UBkABrXMNLCd8/Vv6J0z9824hNC1Hc6JF8BO5t/G4YxbYaWSh3
	/TuBDa1Z18d+TNhaBU/DNFIiWZJhzkR7jdpu5XVXOx5e6E9RJ/dqKHJP0GmBHqeK4ZBvKuJt6wWYb
	tGXGSEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9x-0000000FJeV-1ZF4;
	Wed, 14 Oct 2026 11:28:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9q-0000000FJbx-2nDN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CExJJFNeVdJxJ2CT2z02fSyns9MbGRw3UzVN3YUCwRQ=; b=dZIDoVJx8g567FkEAlokhlbpc3
	o9dsdkUnRbTGmRCRbOmyT4XWqa6kQrBC3D811Qr6QVv0n+Cuqx+aTyh+hAP4NHWkDkM2RQKMd9QXD
	tJyVHi8NKRaWO40Yfc94seFpQ1Opx9V/ZBv8jZteiOKunPElWmAWr4cVRVNFyP5zg/IN83HKl+ytC
	zMHf90n782qgqAtY2+Qqa2sZWBzVP6jLMccYbArP1PH5Gde6/WXGAENkSD4Tmiagm13EY+JgUlXeP
	c9UIqMD5B5ZSEwrSljbjTYH2z8DWXRrqmUdCEQfPGERigqyO/gtGlGK38q0Gya6dsmKAl1BY4o2jK
	8QrfP/9A==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGx9n-0000000GgYL-3w41
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:29 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so3346380a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977305; x=1792582105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CExJJFNeVdJxJ2CT2z02fSyns9MbGRw3UzVN3YUCwRQ=;
        b=D06YMWys9jvQgjL1mD4dybmOA8wt/owjp8t50+Hu4zyIF5tWF9VVSv0ue1LbZy1iq/
         g1vy1o7r0J6t6flIVpTtWXTMuwLXODzE9b7c05oORT0KOkG5/dNpHE6S6iPmY3guMaZH
         KftEqOV56MA3x0ogJBPeKROpC73SJaVxi+nU3Cz/rdHe+19DOdRA1G/1ZkVQUhQojDm0
         EDE+TSTeNOwlh0/A7b1vh27i5Oo/F7BURawOp/AMpIC9GnpnzrG8wfbyehX6Q43kIZgT
         TmMkmQRNYX6VcQCZi7KzYEBk88w0Vu4iX2gEQz4cdOUPwA+ZI5ZAUXX9XiwbcB8IJ3NA
         M+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977305; x=1792582105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CExJJFNeVdJxJ2CT2z02fSyns9MbGRw3UzVN3YUCwRQ=;
        b=0jse06wegd67rxwOICWJ/hIfuFFgaRkAS+dWxJ64kNCLH4E8a0eP4qAYsBrFSKI8hM
         5jP1VCu0XcptDh8wi1tveiLlI67hn8Z+3mpMRautBChHrgg4APISEhkmKIudpJt2r6YJ
         ts2+xXx+UPkvEDG63Yab38DQmtmbWexdHAaN89nO/zoBNlxJSkkKoywYNwnj7Z0+BNcd
         3MRelDlSEBHAQoEBz2hpqVtDVUWhY35Dz8G+ZBr97DHh+Io+4tM2RVu6Pn6Imr8zZIzJ
         JvGtMDt92dDbCSlLeX3pyrOwc9xfGQQr4uDS9Mf4PzmVUyMgaXE82da7RfDNsDrEB4Iz
         0hbA==
X-Forwarded-Encrypted: i=1; AKwUvBxrOQvFL3TIGPg5Db+r0APH1beE7FLFt31D78Hi0mUdN5qGDNuJCml8JF3tZl3p3suyb+FDvIAWwzkexCw44TYd@lists.infradead.org
X-Gm-Message-State: AFq9FYLRh4azKlCxuhTfKQPiP/JMcqVCYRQMMPt+NIL8nH583a3OJXCE
	DmGNpxUV+F10K1hTCKsiy8spZU1DBcXg3rOneyaAgCkx7QEP0vLzxP8C
X-Gm-Gg: AYBFou294u3/TcZJYpMNR7wrDwOyZEGjRGyca341kIsEDALbm+PKu+oVeXAqmkKOXlV
	xKBT8EevCGpFC3rmYcYbp/vV4HftZ2+koo/RKjAEqBYyIbgkLjfoo1JUap6MHVfhfHi9EPSpSys
	/N/7Yqqoz/RgEn447PaKvd5DdbuZBqfVyTDsXC3EqOaK86BLby+a1lHwEc3mlmP6ZAAn+P0oWSL
	Qp2G7JqtjDFKKpHCsDgONK4Mn61NFzF2OUfkJoHyMLvP/vAvK8rZyTIbnQxP1ROKfROuNfTt7sQ
	0+UAAfFSNkLoF8ZgWf6K9l3jnz7VyvnOcCnTEG3RD3KHYtF9/hIcRJEF7IAlbuoDO5yoe6K0DyK
	4REvjgbbD/uRMT2QJgo767dkg1ZcA4r4nyDrZ30jBrtuEMiFvmklBdYt/iyTgcHrdcYCjXr/qcF
	DnnVtTcYPBBzo5kaoiMkyzmwOWhrzT8ao+X/LqLatJltAjhj4WuauhsNKi2pcDiUZmJl+85e/zP
	DWuggph5abVrxvxddpzFCdoEfGRUMRFNVgtxVrGRfbjs8idAjIn90+T+H+FLMkRr8CGBRiUrfI8
	7zcAwtGg87UMffnI1zP07Jur
X-Received: by 2002:a17:90b:5343:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3ab3a9d3dfdmr12082597a91.67.1791977305154;
        Wed, 14 Oct 2026 04:28:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:24 -0700 (PDT)
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
Subject: [PATCH v3 02/16] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Wed, 14 Oct 2026 18:27:37 +0700
Message-ID: <20261014112752.683032-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122828_163333_4B02D0AB 
X-CRM114-Status: GOOD (  12.62  )
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

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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


