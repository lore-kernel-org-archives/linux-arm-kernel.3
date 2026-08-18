Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA354C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lERV4Dgamz3blZ88l1O9q1VhAYN8Lxx5pk25Ui9BHUY=; b=cDMYEqjuE1sYWkAvidKo52VZnu
	QSp6DI+wAQ8R+2LWrN/Mp1rqDm/bTr31px4XyItXdgTUhn7IjAXNRxadOvIzzsz88WQQMKeX/20I9
	vdIRaJ5vt0PNWWocAmyzeOOhvFe+goIjOIZroXaWTMERpJL3Ukp86xPIu5gBTjxzzxVq5dHvY5B6A
	petny0mrTBXu3q88RJshErhr4G51fg908PVt7i/taT7ZDivNo4bDjdKceJLmpw8NIUUqOttBvd+bd
	T1N2A+CQuw89+8gCvFLeagb7/IdOd25XnwilyPG94DVVgcS45rZbfMGCwIMDZD3BPX1gujMgXNteo
	E7L+Az/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIp-00000007lul-2Jsp;
	Tue, 18 Aug 2026 10:44:19 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIn-00000007ltZ-26Z6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:44:19 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso4427725a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049856; x=1787654656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lERV4Dgamz3blZ88l1O9q1VhAYN8Lxx5pk25Ui9BHUY=;
        b=CoAKyW5Lpsqu6Nf4Iuc/Pb/uFY1VQOgrDCNU7CF2duIHOBGCMFE3aBp+eVWI171qlc
         jS9ppT4xIiB4jCtzh/NLBZ6fKE5O6X3oGhGVeUF4Jc9Ap8qv+i6HF/IC5r90dis0VNd9
         A9oMegh79yAT6ABBxhc7O7K7tHx9n9id2q71/Ey6rIGVpULNxw3g9doxo6nOkWsp2luZ
         J/Y4OgmXIHIsW6uOUA7PUh5A1zOrnfnuo0q1a8TsV0fIIxTucWxQEcsLJQc0zIzA5wA8
         Do6H/kBOCiz1jjK/UOsctOcK4xRpq2vIJdOKZmlQfPboMZnVEIQzcjQSiyYIgNhFFyRk
         0E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049856; x=1787654656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lERV4Dgamz3blZ88l1O9q1VhAYN8Lxx5pk25Ui9BHUY=;
        b=K74V/ga62zdTb9m2uSR3DXAH7EOFDDlersIRSduGwrumudOTHh6KAYJaxXeXNJOqcK
         /q/cJvMXi2ELOPiZ0g95m4+2+sKonRna/llgkJ9Ddyos7OcJDslKNvsoycGFoodavj7r
         /ni85923z/ET5aHlcCwvbRJM5RNlGBPEGPYeg+vbyOuISpj5ZRdskD4cjVBeYbud2oLO
         IB6dSrYbKKsSLOzozq1RRQ56XFRxiyZ61J7Oay26b/ZsbOAnSn4QnPuCug89QPttugFM
         YYTQXbj2NSPPTGTlTRb5Mudd8z4nVjhaXn5v15oYWLkMpaW4mNn2nd2/oO3+ND4TrzmL
         Itkw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1Ty4GVT4FZClOYlKpfJc8XiLcugQZISeKGeXUKrQEq9uKOYyjUwAQP2GcFe9D1Q3pTqMc0fv2dZd/powsvXSi@lists.infradead.org
X-Gm-Message-State: AOJu0YxJsjc2Bma6MkosyDMDacfV8MfHI5eFejg/IF/lnWK4DG/MNpVC
	C4TL/ZMFKmcBNOypkzhUJCx0yGXRLE2YBTjZbQBHiiNv3s+OWj3Yd5UJ
X-Gm-Gg: AR+sD13uHPu2Ol//U3oZqlbVBWSwg1kL+L7xOzDH5youna9NKMP7uolmKPSWmuBX2zM
	UQAxIi7lQtmLKr6xptBOJi1lbA7QVb0SYtv5daMCNg2ub71KKozW9iiKVoxZKrK7WiBxgNutjBL
	dOLPkP2cPaadBjbbPzeTVdRVMqr3+fCfeuT4osMTdfIA8sBV56yyg+kOk2f9jWeYJQUbVUaNMf3
	SSKBHFM0qAl2k0NjoP6muebBUhCZMR5JRKXk5gKrSN3poiIS1CMG8AM47T/s1NdGSUM4Na8sto1
	bN6JM2UcvJQje99ECG+GpxXUjNoUIwdDT0zY66sxc8u/7GWmIdazRhe+YC315swY02YDD1d6XiW
	OFd38AkoH7P+Hh2wHjW7cwbzCrkuolN/bPzcNaT7jUHr69KAqFQlQifQ80Ui2KueqI/JyavKo55
	sX8g/uaqgrZwxl0vl2jsmjC/uuAvJ8ssKZ/xmmXKHHPmobN0ykXwifO/D939lv/i1NewqENELNQ
	XkpNTLdkc9ZtCsvsiQCcf64wBYMTYoe/3eEHvKJ75UGEhf8g11/JLqIx5ZRgE+LvtSt3blUgHQy
	MA63
X-Received: by 2002:a17:90b:3809:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3955a79c068mr8481277a91.10.1787049856368;
        Tue, 18 Aug 2026 03:44:16 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267bf83fb2sm15039905eec.19.2026.08.18.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:44:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: mediatek: mt8173: Use dev_err_probe() for error handling
Date: Tue, 18 Aug 2026 17:43:43 +0700
Message-ID: <20260818104344.37824-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818104344.37824-1-phucduc.bui@gmail.com>
References: <20260818104344.37824-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034417_550971_E1EBBA90 
X-CRM114-Status: GOOD (  13.11  )
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index b4c6ef6f0845..b7c4b24a9cad 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1038,11 +1038,9 @@ static int mt8173_afe_init_audio_clk(struct mtk_base_afe *afe)
 
 	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
 		afe_priv->clocks[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clocks[i])) {
-			dev_err(afe->dev, "%s devm_clk_get %s fail\n",
-				__func__, aud_clks[i]);
-			return PTR_ERR(afe_priv->clocks[i]);
-		}
+		if (IS_ERR(afe_priv->clocks[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clocks[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 	clk_set_rate(afe_priv->clocks[MT8173_CLK_BCK0], 22579200); /* 22M */
 	clk_set_rate(afe_priv->clocks[MT8173_CLK_BCK1], 24576000); /* 24M */
-- 
2.43.0


