Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B48C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=; b=ffscgZuh8l7yu/SjPPsDILvx6r
	DBvda1BV1ex3qrNO1foCBJkiR7sdvrxLdQoOhSNtRH3pfcklHBoBsuOASKMB9ptT4Wfb4I4KX8MXx
	EqIN3LXG7Ov7Mnr/ItUr60TScCn59J8vKibxWt43zkIlPagzbj/NzfMCEq1vXtEkQw+a0Pgbpvymk
	EaC5yMdIpjNbW8Zw+nB6HrA3YOR84tVk7lbmNzeEHc+TqAdadZhhU21qucJSmt+wLU+LEkamcWPbZ
	YFSaZx43jxxGUu0a4FhM+rxBLVTVzZ7jh/Xg1C/xZmkiZQpuMEZ4vSY33LCDvXgYtjHTJGBXcUsbX
	+HL9ve3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hli-00000008LJ3-20yU;
	Wed, 16 Sep 2026 05:01:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlW-00000008LEe-2syb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=; b=S+FXs/hIR1QfwduFikSEuUar3Q
	BrtQ1eJXbXwlwsqSyoHnbcJSVXs8VfJOnOq9LiTBwi01BtIw4fkM3UwvmeIo+8nnb2LiuPUx9mMvb
	KnqbCPVGG0y6M5OHDK3gENe//2n6hgKiYvHHmdJOUoK4NYX65nC2QdzaM9CwW7FPHE8ym8G9l4kt8
	myzi8hL4WJscPfqmVhM526nzIkS5PoWV0N4M3yciABG5WJTVcgtDJyo6V1WUa3LZbm2Pbw9d/Seiw
	+2YEazgs3m9u1Pqgdzxj1VLS70Z3AqcYLMQSCWeuulP7+74mwgyAaO90VRQyerQeDDy00Ai4W2WPk
	j1IBLecw==;
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hlS-00000007UIy-2cbL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:01 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469d20963so289490b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534857; x=1790139657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=;
        b=f+hqIHew/0Yy6UbPJyeRn6uT2dbVT+oakS8Rzxm2eBs8cgcHt4Ge/TWiHsDzp4PH6H
         LWsVSX2ivAPIYhOX00EbhIOzI1N0YdPBrw+WDnmPFx8XQZDmu03zKS5Ya90qPKd4s+a2
         ZZYHk/oFVX86ec10EJ1hJ9oSOVK8jOyNasdVXoiNXf+3STiMsXaSVh/hx7OJg3h5kcnG
         KbG6pyoC9uYPpKqeB8736Bg0+m+1+kAExsv+Jk0igqiqeRRdfSM+WerJIxs1kQAxH7M8
         HEEsS4Tn4+hOPblOdzKJu9KtpTuNcbjU96g4YsNfLq/2iOPRgIX+b0+bpzyswo+WBCRA
         QYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534857; x=1790139657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=;
        b=QCKSKAotOSkrBTMdUl7WjJW6CA+kEaweAPV4jyA1kK4rEWWsHbFDJ2OWoYOST2vwW2
         DhtswADFGyeR7F4eYi9x2Z/tYNMKlRt6rHEFeI/0E1EbPupzss84Tfn3XMSuT0WqrPWT
         +yeGjC1Nbk2lIAEJlo44OX1EbsfcDYphOgPQrnFZaM66vE9DT/CjkOa2MvSCOAsmmwy5
         vCNNgiYvsXlAIs8KmubspG0FyZckiQGmi6oU4Wgk6KOkeG2B+W9ZXFJz7ewcaMe2ceKW
         8QRmx681HkluvMvS52qCrCrnD8U+kLdL9UP9vBcmAbBEo+wGzCpeQFV8u/4aQ4W1XmNa
         /Zuw==
X-Forwarded-Encrypted: i=1; AKwUvBz5AA/ca77d1al+VXFYrgQjBD+xuWXayZIiwFx12UI0FBW0Dp7DrWRU4amtF0ceJnfT+SbpQVrd7J26d+LkN0wW@lists.infradead.org
X-Gm-Message-State: AFuF++kykGD+1a7Vs4xROgTRSOMaFccxaZVM5Y8vz37khozhiUDaDrt9
	6KlQgGwbpVbdix3oAo2bd+ZYBedpbBMJW5r+noVrjpMNknnWu2rVoKyc
X-Gm-Gg: AYBFou0SdnIjhWvJjzsbraYjUCn7iYtoBbY4kqW2UQfVH7gmhNH15RGPg5TQEntRH8J
	KbSfZwPiKEt6ChkJU2T8fB3ooyboNl0wXnbyZS4eOgDHYoitXMbyclt3CHhNhKwWmDR3fmzdent
	lmimkzZkIQfmt9EecGwR0FM340OJ9/L5o/QSXgokPJJvQHfrAq3A2libRFjdgRZvd67LUxWHTlq
	09stp0Qk3B51h3FNXP7FcLehCSQvAXmNemn8mwMtSo89HU681AlzyPJKQr80jvxYsAAMfhq04je
	tRKP6wGrHIcqqZVx7G9p8O0fLBFsVf5Y9fUZM7jBM/8Hzv6jwr/N8owUfnYfQ8AdlyKor4H3/Nn
	cWrZLMVpyXp/ArsJzvpxOtA4n2RX8KzYcadKPwuGCUiOc2nfJrmD5NiPkjXQixXI4fjyDIGf7Uj
	MVIRS21++VohgjMQ1GBYDkWopK+APDUjb9vLRkY6oY6Jaf8jkEu7vKhyTMuHjzLEXFF7xOF/aW+
	yFYOJsjYijwTyoLgTyHiQNixWv/bHXowBYTip2MffJLMWVcGnQW/GbEM7/tPvwy5kt7JuSX30+k
	9no31rUCg8nhFsY=
X-Received: by 2002:a05:6a00:908f:b0:864:cbc5:b8dc with SMTP id d2e1a72fcca58-872378bbb6bmr2333682b3a.10.1789534853419;
        Tue, 15 Sep 2026 22:00:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:53 -0700 (PDT)
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
Subject: [PATCH v3 03/12] ASoC: mediatek: mt8189: Validate MCK ID
Date: Wed, 16 Sep 2026 12:00:10 +0700
Message-ID: <20260916050020.14575-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060059_909247_317F8E25 
X-CRM114-Status: GOOD (  12.55  )
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

mt8189_mck_disable() only checks for negative MCK IDs.
Reject IDs outside the valid MCK range as well.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 56362c4756c9..7fe9d01006d5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -675,8 +675,8 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 
 	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
 
-	if (mck_id < 0) {
-		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+	if (mck_id >= MT8189_MCK_NUM || mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d\n", mck_id);
 		return -EINVAL;
 	}
 
-- 
2.43.0


