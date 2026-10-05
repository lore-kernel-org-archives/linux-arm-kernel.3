Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445F7CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=; b=bHQhDXnDf2UqW1vwku9evQvTUd
	LuX7YcdBs/Ci2MjgqNXqq99htZmj3PpmrZJZPAvRo4Dac3Gwcf+HvaSeahwJ+gRWMiWbsEG+d0Lwi
	Xf6csQGRsIStwrAdkhXtZhpt4fix9C38Y/x7fyklY/mIH594cwu9PSOa5xwV5EQql/YnOCrxsaiSF
	jhQ+JzPVKMXx8V0ofgJD0JheeHMYbeAzvJJ11jsNO+yzP216rYrgDD9zmXIGRcd6YjI+kjxiqhFGH
	u9SviDqw2M6/kcjNFtvA295733HfLMg0l04cSIF9yKaiNhgRymitOulTrxKe0bOQsFRuN8GOqO3SZ
	8aJPXwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTj-0000000GGtQ-094d;
	Mon, 05 Oct 2026 11:03:31 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTd-0000000GGpY-0dt9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:29 +0000
Received: by mail-pz2-x0e.google.com with SMTP id d2e1a72fcca58-86e6d007703so465934b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198204; x=1791803004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=Vz3Nkg8eHX+w1FtXwVak5CmoqOs15bO4iv6GZtEZG++hLlufsvLM5/cFW/pvUEAP4h
         As+Q1D66OuhSxBBkrZ3KOLqIQxsFxDpD+ijFuGe+Ue8hLZyAyG9S60dOtxVgcWQAtxeE
         IfbX/IIhJzq5xCK2ZysKH/y+pDAUJeYP99uMzZo1FO9l2iN+mDMsDqaujJV+wJ8/2waI
         8h0dVVYMA44oPw8jyzOxSyX19ia/q/0yGj4tublXtHS9okf7/UVdqwy1ggSWgRa4PB+t
         SkHGrDwuCPo8UeR2wHIC/nbq5YkisYHvofJVs9LGYRRqLiZCeD0RVJ7Ic6HGCGFnvOdE
         vjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198204; x=1791803004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=zyXYKKcyDUZG+Bzndb0rMJAGcQiAVMXu02h1Pbd89W52usKjeezb+zFfQt9UkUG4Ec
         q0ORZ6+9OpHPIVT5i5B77Qt3FXYAmBgLYADyIXN5ttQIfiGFXh+hVQhys/P84CRK/D/J
         IVSZY6rDRqfqtI6roYkM2LHwXIa0lTr3TyAYv82Sk4J2dCUrHGODJtJailHJLOKf1Oez
         zAgf8x42+JIRFKGqaZIWKEJilqJDc4e2bzfeMY3R5NZV/fzz6zT8j76Ef2Dkf9FNLMrY
         XDbpovp/vU4OkbbwD9jZmbXdVHkjTaWtbo+aUnosjEPLe5BOrlfY+7BdYA7Zx4RZ91b0
         naUw==
X-Forwarded-Encrypted: i=1; AKwUvBzHGnLwQQoSqkG8fyjkirWGKH0FqAXrv3VvPgIjbn+2aeCqQR1DjBC6uv5ul/oGZbL8p2bDqmBRWxd1OMmW185n@lists.infradead.org
X-Gm-Message-State: AFuF++nW+cEsLl7UeRcpCSrh49vIyn/TY+Sqi5kGIJV292i9VuD8XQr9
	0I5ODReMUzxShTMgwzhb4w957l0r+bPmFC3oMq6Loy8poFtoRRGCxmRS
X-Gm-Gg: AYBFou3fPDrY0UrYGM9tzw8GkqkoPuaHjOp7w9Hzo4aoGb9GlcuKqE8rX0uPvvgA0n2
	dqPIKaUcHFWy4kKDQczFyQs08r45omSr7Bzq4dM5qEHv+IAS6CtZ5zSvPsjafLCZCzehdVC+pUT
	a6XaIMHRNmS62ndisbQtSLrDlst8X2VoUV1h9x5RW592WjU9K5ReCxr22/gCsyGtEWFLFYY8MZR
	XSBf99caMthysT/thwSEx9eEzcmPiAvCOu2YmDf9IM6ufkQbCaug2yAGCgltg/Rm4sdsUhdzRVW
	JgJPvvoIXyxyx+SIBQwSA0Jdxo5289kfV4uhwaC1oLr3/kMaVi0biX6Fu9iJj9y9pY1w0g+jMRE
	Bc8kEpjugGU/m7KPwDxOYkyXbr0BrmKtPE8HdM7TtDwFlKSIfJ1LbVkC0dEjrtpdAhnpn1Mclb5
	mIZNWqSUDrrpmgyEVrjDJ3DrlGRUv+iElJVzBwWwlQ4QQLraXuL4sblyVxR2/6SsFXzfofb9I1F
	R+crWt2Ixg+X91Rr1c6NGYJoLtLQzPBV8DhoAJFnhSkDthujt7eAYsZ2cA6TGTzRcX2coRQgGKb
	ywjiTN8cg3xT3A==
X-Received: by 2002:a05:6a20:9c95:b0:3e0:da23:8746 with SMTP id adf61e73a8af0-3e0da2392f7mr6761110637.18.1791198204336;
        Mon, 05 Oct 2026 04:03:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:23 -0700 (PDT)
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
Subject: [PATCH v2 02/14] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Mon,  5 Oct 2026 18:02:45 +0700
Message-ID: <20261005110257.50145-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040325_187431_64DAABF4 
X-CRM114-Status: GOOD (  11.89  )
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


