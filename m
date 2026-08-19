Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7824EC5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVppixrYxL5y3w3BcKXCVN+y3ZJBGpAZgIw7a8RJ9tU=; b=FvJbezvUBdrbsOmDtxwloymRn4
	e0VwfsPnFbAqNWoR+1EpeR5lr38PnKSUN1sWWkZjHm3WKlpku5HETqFBHkRnXI++3Bu76fe1Kr3ZF
	5ObO1InsK/W4exst6u09Ao04IIAlZ/L5i87CmOgeQLwwaLEY+8nEz/B2nlNzBjD8feZTovbA/TJYv
	6auwX8c6hTKl+LyypdgNJlGK4sx/Zj8Lyicqitb8MhGu7vSoJ7a7s/2pyd9VAICA7Hlf4MOS+sGne
	jndWEy80iEnDNvg39MkwjihpBkL+vd0ibjcjEtyAk//MhoK3jWDdFg74R5TZTQV7tI9QdiTlE0II3
	EtkhTqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOI-00000009VyG-3E8b;
	Wed, 19 Aug 2026 10:19:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO8-00000009VoT-3s1Y
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Aug 2026 10:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EVppixrYxL5y3w3BcKXCVN+y3ZJBGpAZgIw7a8RJ9tU=; b=EVrYPE65MCoVsLutgimMzi+1Tp
	MrAZI8Ww5SwiVNYPnAVb77icrzg9aG7vonAhJj/rXJijQbfz2xRvAGvVRTULN6fSPdfnBr7Bsu01A
	W/jitLaJI7aP/DbfHG1QFH630dV8wL00hC5ryZ8a3EU7clMIqjqblLg0aLroAJvw+fCNs/Z4uCgZ0
	ut2AJZQGffy+tg7yBiLy8Mp7lMudZOUMQLzRAWXLvxed0i/9dkyupRwVyTUbsd6J8bh8Rdp0Vr47k
	8rsnsZB3qoVFnDBuj5L5x8fWdAZIVUdUBqJb4E8NdKPH+bPApCk1nB/JMRsOH/X6niD47oBbwsCTr
	qZPnTdpg==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO6-0000000DUaR-0mXW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38deea72eebso952259a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134751; x=1787739551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVppixrYxL5y3w3BcKXCVN+y3ZJBGpAZgIw7a8RJ9tU=;
        b=GayPCLOgYKtcusJZuirRV1Tr/7AHqc3zWY+j8r6G41rFHX8Ex9XyFCEmqRPW3+CWjo
         YKWu7vHmkqjcRA4r7iv31EO2Ux0pbMQ8Is0buHwaNR/N/6pA6lmi4Xu2Cw3DGu3y/iSg
         ZNhk9ausi8nOzEtM8GCWLMlP3T4lt/ydovm+Mkl0GDeeveLvMmtX2LLcBpTuwrr6yNP/
         Ducq96gS0FRLB4fXIxKMdDaGRJxBVEKiyanssWZ9KmQISo+RgCYeY0g9sF9mrHBfOMPd
         P9IiTeLbignS4K2VNbmQC7mWSAVaIm5UZli+2QggICuECCjq+UBQJqmmo8Zb6u1fPzOy
         hiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134751; x=1787739551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVppixrYxL5y3w3BcKXCVN+y3ZJBGpAZgIw7a8RJ9tU=;
        b=KRd5Xi48u9jVIsZeJOjCe2CQE8ZF5IcoyIBts4Lp2FPqeaFKikbCXrm+IdgO11Moek
         xu7jZq7l56kCW3kHaToLGjYKdCpAcPxTfstWHGVwj5lirWAhsV3Kjdf9CBnPUFn4gw2m
         a3H5gpeKJ6U6cgqeeJUTJg1IBJofYagbhnKUV+GaJsk/GX2M2DMByEIi89XCMW35yFnF
         FISvQ+z+9oK9IXvPL0mrcrzzD0nvkdgE+SMwLnTBnEJRyiFkWG2vKCCIFYPtypeJWNJG
         eGThN0zwsriGs9/v8vUHBCHmDSHA0jSa52jtw+ncbgHD5blJ7ijTgp6hv5w8w1YztEAg
         slfw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0zp0jbbBgtLlyWTy5AjuQtiITmcyzA4mhPdcQIao7gzCBC93ykY2WnAU6z5QE4sq4UZFz91RnBEj/HNyKrcnQ@lists.infradead.org
X-Gm-Message-State: AFuF++mdRwd7BGLxMkdxkor4Jdt965gPNbrYqj7GZ6fLrjKPOzPBnqGv
	PpZk6lI44YqqtfI6eEgvTXL02GYToWitAzUFiXZk28t8FY1nlC9aCjg9
X-Gm-Gg: AR+sD1025b3UqtHHOWt0a1QHRi42Lvch9+WefBkgBY1lURxs2WO6oUa9aRAAj1TCGDq
	AgJk2ZPJDiQEsmdAPma/SHUBDxAlEezjZk8GYgNKAY24Oi+2KAEe5K9PLF1QRhU7JA7o8wik8vA
	2W25Dj/SO+LTCzSPcVPFKnq9KLT3oaaxpWRuUfy8XB+TEpREhnJmmm9TbPwkitHD095SGqVRaC9
	TzOJMfYDULDZ+Yp6P+ZRV/68XWVtXb1iCT1cIE3u/8hcI+lcjRqyuMFDuFUVD1vVQx3yhXLkrKy
	ZWWYqnXw08/eZZ9VBNeXtg1ikIZCRLb2kXdNgSCQpPDdCTpnH5Bc6NtRHEW+I7B6vPqDJpr6Lfz
	sFElpnuIPWP49nKsOya3En8oAbIgvBqw0l4jG5Cbbhl/a4RPlbs9Z3Tgs4lCDNS2XFOARwuHUnS
	dUYJl3rreBFik+9eTsDc7dGrjzvZ73zYEc0NXn5jrXfHjXF+rp8Skh+yhDj1/SXF4UkMiGxjcJf
	neiphkEgIk6c7SAbks/GU1V064b40ebvFKo5MD4gEomD2t2+CPM6XRQc6y5/94LgPOVMjPct0Jt
	rsr0
X-Received: by 2002:a17:90b:2241:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-39581228dbdmr6386601a91.16.1787134751062;
        Wed, 19 Aug 2026 03:19:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Wed, 19 Aug 2026 17:18:48 +0700
Message-ID: <20260819101849.68010-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101849.68010-1-phucduc.bui@gmail.com>
References: <20260819101849.68010-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_111914_306834_B499C8A9 
X-CRM114-Status: GOOD (  10.05  )
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
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 260c27016cc0..d532aa8107b0 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


