Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91D8CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=; b=2yin1eOGFJqmZRQGqCbPyUPVcy
	x1VrZbNj8FYAR3hpPOpbV89XUJIS1xp8EIznVy8nj5m0HuPIChm6oQJrIZ0ADofW0/eTfilkm1lAf
	F8shEZbNV1/lFOhUdc6tp9UHqSFf86Zqq9yONNY2tgilS1LXv3Nf9IsUdh2Pi9WbSRh5YFC3FUl2j
	vQPQ8JbmADUeT3ivob9lYdggSs0Aim8SBFSGd+cA1tccFM4R2R/D1mHqQI2mhzrO90+g3JfGpErpN
	9Vjp+vrLxqkD53vXJHTkAUKFE49ZPjeH1Wmi0a/wFB+2qJ6fZqb81utqLqRObR+/apwq8WgTjTisc
	tQ06ujCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4e-00000002Poo-2f3K;
	Tue, 29 Sep 2026 06:12:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4d-00000002Pnx-0vM2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=; b=WBkOVkaPDJ1iPxBm6UgIFpvuVq
	ydIDw8k6vPeOWkSgqIaQsVMTWSt8Rhg9m5/dlHYmDj/CWnl2wIsv8jIoxblnR0IcaX686lsDPxYZI
	0QAlu73saZ5pyrVMKzgid/7R7cCLSegM0l7WJdNCt3MaLtQrSicF1rfzjGvUwtfkjnEyCfVZbeGKZ
	4DPzCuuNxaDd4YpYxZdZmQwDDi5bMz3B53EhX7ip4ieixFXH4PKgMnhXYVDp1HWXD+kEQbyvNa7Bc
	DOafuwfC9FiyScoCJnpn+qfIGIMClSgzHN1oqKF9QX+6QoWk6bymXYaPXHQtQ7DAU6goDj3b+aDa5
	Ar9G1XHA==;
Received: from mail-pz2-x2a.google.com ([2607:f8b0:4864:3b::2a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4X-00000002EWV-0fuM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:16 +0000
Received: by mail-pz2-x2a.google.com with SMTP id 41be03b00d2f7-cc79a5bdf9fso489134a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662331; x=1791267131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=;
        b=rM503SCsWjqL3EC9t0z0lzVdqEXvXco5HtpAmoFaWzwBn7y6VyDptiWemmCrYgQd1b
         DP7ck/ay8rsHOehH9JLgIWBxu8f3WUyfP5n3Ed08Fp931//25VB5wfQz4pGYGFlpgUxH
         i8ARdcJkijm6KamoIiHuiGXq4UKF87mpVN05NInbFeAOmJyUwXVJWONVMerdXe6ydrQW
         C+4hV+LanKQBc01hYmB1lvOg17VYbW6ecFco0tmy6kVOtl8Hog4rZJFCg7EYFmql7Pou
         6cH6CKBdE1nN+rNEgr8cZdjOnjbqsFm5ENOTmrDbvSvpUbFd4dsFd3RbcGwdvIAvZFgW
         D5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662331; x=1791267131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=;
        b=gS/JHbvNB9ylIMqmbQt+B9rpb5HvaWeH7ZrIZyztyXeb/HZBovvWFpmkj++677KkZj
         c2SDDqiq1fVkKZ3YT/pGZ0kiOztqhFrg9qzmxb8HrPvvUY9fGx+OCL8Wc1cxRQD+DHzP
         Nf4J3haCuozlbvp0pQx50YLBh1Uf++lHDEZgftMQywClOQX5eZ2qpHMydAZEjcwPRRKf
         fbOxLT3uJkRVQ2XQMQd1lmhwKh9A5fGcSGnU9e05KnVjRpMcOuflKRYDD7j2zp9i/FeK
         l23dbbcP3ADVSPGuzishvVj7lgk/1KmnZQ3WmNPXl0Y0uMTT9ckNYlK3ByzJH5rT/4Nk
         dE/g==
X-Forwarded-Encrypted: i=1; AKwUvByfQrg/shziAJYWP7evXLt5ow6+mmIfbRpWjIJ2vBBDbhXbB5dvXWq9ltNMBpCr/i93L5i7P18SAc2KFuCrraCb@lists.infradead.org
X-Gm-Message-State: AFq9FYLcqIUAnfDAG6vUGTYgOsQqIhSLeVO5EZxtIKAzafP0djqiakWc
	T58DpxytH0uVuOEX7cTr1TAccRtB+1FGOt/yk7HluCNV82kdTJ5PYS6A
X-Gm-Gg: AYBFou3MZkFYOrw/RLUOwYNaKkUud3z7t6tP3Wk09IrCyyuQA4/e4woujD2zNmjmS8r
	f4jwaqSYmFcxToUMy4PXiVtGCp5oWFNyce8g+U8mnCNbtRRsWLtiIXdd9+eUy0K78mFW00GyAoY
	qsIV3S1IwrZJm9BGQdWXwxIDuF20JoM3AY7F5IpIEjkdM6Yrk3c0h2WrSkiW0l5Z41IAUPIjLSU
	YE/Ru/+RiwJS3WLX95sLQOwXXUol1A4PLDdoP84wbxj4gBJLlTFNPT7POsgOWrC1cbZTAv3hL1O
	pRpcmCXg1ArKNJ5lAkMiswcW6RlzkE1QE6EemsCBwkZNUFRnJDIcqa++X+r3Q5XbeZiJq93b4CE
	+hgVBxQoxQcErKyIUm2mYQS9WTL0zKslbC+Fdpjtg85egPW/OnCrzrRLFLQT0ucHtkAcAFQihhJ
	LNE1JcuUL8zjcdhR9ozJUG7LCnoX40XiJI2OykCpFZkwSUEP5HFg5P0VCMFdEIKrSmr0Fs2Q3EK
	/TOwr1AqtqBL/ZPeVJGzqUP/3llqS5fak81VEbVzYmkSYG+vox/OVSxkcDx/K0YL2km7o4wTvLt
	b+ARGN7FeAtv6g==
X-Received: by 2002:a17:90a:e7cb:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a49c1a1183mr871310a91.32.1790662330868;
        Mon, 28 Sep 2026 23:12:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/10] ASoC: mediatek: mt8196: fix MCK error handling
Date: Tue, 29 Sep 2026 13:11:14 +0700
Message-ID: <20260929061121.124001-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071214_473403_46D85443 
X-CRM114-Status: GOOD (  14.27  )
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

Disable the clock if setting its rate fails after the clock has been
enabled, preventing it from being left enabled on the error path.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 1dc4210e58c7..1d107b85d03c 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -502,8 +502,10 @@ int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		return ret;
 
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
-	if (ret)
+	if (ret) {
+		mt8196_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0


