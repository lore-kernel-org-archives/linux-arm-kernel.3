Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D7AC79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=; b=GGwgpsZoGMcb2mT5EwcN+uxQmj
	zdZZ+zGgUqZGk14ZzCMjPf+tGtV0lLkwvvwX01kZy3VfxmGXggm0tpVKkyB4tiKBKq4yN7tcQpNmZ
	WJt4XfYX8uXBmtfeE2pFmx4GBTKflth/7ARV7r/5WXriEFZKBCReXboMcSsYZGQolf2BNIgfD9aTA
	mOAGSBAbuX68sjI9iReGKOvQb0GmrDjwpNDiE+lmc5t0EtJYXQpYaJaIHHyBfcNYfjzV8sqofzbZD
	W527C8AllbITjaWG30rdudLs0zwb4yvkHsnosq2IpcQcvQxvfjtv1MG/omTSXaSXSC20FMk96MwrZ
	PBEis+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eLy-0000000EON7-2art;
	Thu, 10 Sep 2026 12:58:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eLy-0000000EOMC-0G7n
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=; b=bezJnMq4QcF0hBaIN9xuZHOR9w
	ZOX4ZfNiUsFsErE1D2r/2qxOn3nrx7l3w+wLQ0qYflUHsNLc5CBq1vLAFgCCDqZ2oDtbd7FSqt58h
	p1DOZgWKLNtgn+gF0/HRpDfuOcLUUqW+kG5NGG/l2f119710pfvl9uirBMrY1u/4a9GNbk7vysZub
	Csw3CLJohkxVQNfkYU6lTPqM5Bb2LhZEEUfArpmykbxSvhJKehi0YrLtapogIW/YzycZg9y6oL/64
	Wgxy+6dNSNKNUGnbR5yongMSMYJcXJ0ti1/dgY8lPHrhA3iLvmXbNKOwfFV0KQwS+7b6r/bPNJgI5
	S0VQk2Aw==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eLv-00000002Ux9-1Gi8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:08 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso1126544a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045085; x=1789649885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=kwrYI8FrA3sEgOjDUuCFLMdD3LDcZBCdTMAkGDad4p277r9eNISrm2a0Wi2VIlcGA1
         ivP4Zdf4A8mZpaua3QqXT/sbBz5v2todPyJv3QCPZPIoGO5+U9OSft2giNKTTOqOHOhg
         KhBI0vjvvoDh3vK44v/dKy/caBRJP3GwmeytYssQzCuKL0V/MjNfIJJFRA3Nz6orZgj4
         C8nCx7tlfB+o5Wg6ND9G8f7F+JYpvgUr+QGCZJ1/WIYh5DbxcOPg3AT6Dznannhzws6l
         NdCVphgeYRlQ1QrmGh9XVa7JVm/uqz8XsYDSrUe2pf5SfIlRHdDfhkSt+0cVkV+6bbbp
         6gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045085; x=1789649885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=LjShnQ6n3uPgstCnT8sLcIAPYSkKg4Bqgo6TfzsxFfBmjbDybzkUT+gVYR3ANgI2Mi
         Ra750vShPWKTXCX3NZy4yZ7KEj2rfx58zD78DfflN0FWJBCqM5SwpRir1czs0tGlBOGd
         VPLaHgb4sZzTHYh50swDMhm0CdBydyGl5ZNTW0vOdQ1ayPjcrDwXpKm2gxjZMHU3qrus
         aUKfgJfbgzMnmGrNdwANXdqjtUihRam1x5Xd1mIF1Bm6s5pk1hpvF+4BrAt5PBrH2Jfb
         10gmL3ac9pBj9WYtkq998IXVgOIZtunOkDv920b3tLUL63dnfdTryYCa4zaXp2Jvv/Bj
         /q8g==
X-Forwarded-Encrypted: i=1; AKwUvBwhfIgX4FAhc+NYdG6ACj7vkG8JyxST91VaIGWcgxjS5OrbgDBmqkZAkYr9u2YjqGQeSTgCajSzVCJUM7akB2Zz@lists.infradead.org
X-Gm-Message-State: AFuF++nekpV0S0lmleORNX1P35Wg7mBgPcA86ubCIcXgyMXJNam4zYaz
	Yf8Agyvnyp5F6Gxx4PTsf44zG5violiV/YC2n1AZNsRHyGfXp92tC2zt
X-Gm-Gg: AYBFou26ID1MUr+4t8AR8sLPekp2UQuEtOx1EQu6MUCtM4VjWWX2zHID33IsPMkCwZt
	jJ+GmLwqiL/9NDAPfueqyGibbiYyLrOFU+LtGWPgE+g94h4SLvzgaCwjK/Xezt8ihS4X0RN0qpe
	0d7Xl6nV7LpULBa3jR/7yp7l5JmPLl5+rSTiF2qTNrXxcX6UmbO9Exhp9dGBE2lwGCZmPunIAPz
	tp3CshRy+gCfI3sixnfKVEsxvX4UQlFDmvs8uEvwVErWy4t2jUnYTJb3yzgNd9KCM8svvKuV7T/
	WxdH/L7FRefF3/e4thMNiFKkc4ZH5LM2Dh9BGozTMqoyr5hK/mY1dYpeE2bgtMs13flCWSRWg2C
	mz0fb2WyLfGvLz4uCM7JQqH/nEMGFLmdqxJWf9DgWhFZXKgBikz5iTcWigiC8vkmFd8HbeawpdV
	+Q14JtS9kAW6wqib1vTdjUz87pmzFN+L+yEk297YNYLrVqZZGYQ2PqmyFkkkPHJlqpgeST6Os3W
	/27rs0eg7giMOoXQtwCDvbL7x1E8satMxjFEh2fWNejz8gt+zivgPecfN63p0R1U4mobx8pq5ua
	/D6EnG484ExlNgkgyPYBeQoCUQ==
X-Received: by 2002:a17:90a:d406:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-39d77b1c378mr4389281a91.10.1789045084933;
        Thu, 10 Sep 2026 05:58:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:04 -0700 (PDT)
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
Subject: [PATCH 01/13] ASoC: mediatek: mt8189: Return error for missing regmap
Date: Thu, 10 Sep 2026 19:57:30 +0700
Message-ID: <20260910125742.150902-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135807_497877_DC415400 
X-CRM114-Status: GOOD (  12.75  )
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

mt8189_afe_enable_top_cg() currently returns success when the AFE
regmap is unavailable.

Return -EINVAL so callers can handle the error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index fc7a7a73b0cf..63e03a40dbbe 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -236,7 +236,7 @@ static int mt8189_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 
 	if (!afe->regmap) {
 		dev_err(afe->dev, "afe regmap is null !!!\n");
-		return 0;
+		return -EINVAL;
 	}
 
 	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
-- 
2.43.0


