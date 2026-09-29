Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A40CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lfbotW9h5DjJNCJiSoWtaX/OscTKUaTGY49TPTCiQk=; b=m/BFrP8xVzWrK/0TqIdHhnnCyX
	dwreBlA5LYJPrqyeZxliv0CF520tuiosCqxvAdOmoll2NFLvNhkhVU11RFZbX4P7XdLRckV1zrG5V
	V7c8TkEuc7uz93R3xc5OyD/dfiilO55c0HAe5km9mYWQjPMRxqsdV1m9Euc2Ewo05/GELWu988zg9
	fAjf/8V6PMwVGQxNBhDIYZPbQl1CFX6cOZsg3+A7Ac2m38xutPyBI8g0O6yywqSSv5vldKZEYcPsa
	5U+OBdkHGW3R78mbeIw/UUnAKwlwmdCfm3WqxaXXUCLQBVgitq7Ra5ETmzxUeo/rBSyA93bqsxlJ6
	b9S7USjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR5U-00000002QNR-3Bd2;
	Tue, 29 Sep 2026 06:13:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR5B-00000002Q9L-07ZS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7lfbotW9h5DjJNCJiSoWtaX/OscTKUaTGY49TPTCiQk=; b=MTur5Qn6l5PKtPxyVoIhxnZUZ+
	Z2fGDTe3/E/j1vStHCnmKeqDYmADn2YOMqzGdYOrdSBiaJZcnIcQDYM4q8pWr8mb8MJIMB/Lf4Vlo
	miAn2eDh+4eoWd/sBaBPkZu0L3U2UA7/NB3ztmHiJ8uFev4W0xhspzUv3QzzY1Q9FIRL51N8TOF3a
	RR8JyZ4e3yBjSTKghkwJhbVOOUK1/1qMEGq6OP9XCx9ldB6ypNHqySKO+JpWzYae04jZ8sWr8sxvK
	PuI0GjgP0JEl7W3bMJ9sjnybMckfl+rBYoTLhvcLvbFxjsJQM8f4FtYaQhcczJgPNVCVtvrXiPeKj
	qHYXsa2w==;
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4y-00000002EZs-2BxR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:45 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1972799a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662354; x=1791267154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lfbotW9h5DjJNCJiSoWtaX/OscTKUaTGY49TPTCiQk=;
        b=Up3jpCt0EpzWjGc4X1jBZJf9rVmuK/r0tecryYPwW5NKFqjJnC4ShuTx/UYVqHMOjF
         dP5EHuUSpBvVQlgxyT72N9GybMCYfxV6A2BKMBmTTFpBvU0YizQwHdpEufpov2mx5ras
         7mcNZnF8NXEAe5mizgNI8OespDkXAmGGiu6FjrdMOndskTOT27Hm8g38OEGUrvdQwnVX
         JRf2f0eZmkBA86hin9Xjn0VuRLyrWXLLcflCsCdm/zzu0tybBdJaoYTksTsqQPQ7Bl0R
         16RobhRbvcPBrxx1x3Lj+8a9HN5yEj8Db/Z4+95Iv8Sm2tyxnqOZQnu0uLW15TdbMGrl
         v4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662354; x=1791267154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7lfbotW9h5DjJNCJiSoWtaX/OscTKUaTGY49TPTCiQk=;
        b=gkgvjtNIQXSfArHQm+mLzgtDFMN6fpPvgP8DQY6j42X2JTVIM0Jt9dSBZuYjwrt777
         D9x659i1f54IrJxG8KZHZTXt/fUgINXtYzCEh4P3b6mhP7Qiq27TQZPyAxbAupsSlpZz
         jcCVSa62ZEdcBLNalmuVFgNm8j9v8yGPPqV0661xc12SU998BKSuHCPpBzAOgVGvUvnX
         szAFGM84tezLNX48dgjH5cgcxwj/Hcg+fsjBlH9m4ZbicbwDI19HFM0DR9hlo5PkjTsh
         t7qzl69tT9tjvDsd0torUdiNtwisEf8xYC/l/4CK00J0BpMoLm2REWRf9MQtVQ4mC3RN
         9oeg==
X-Forwarded-Encrypted: i=1; AKwUvByRildMyOLxE+uX6yk+M6Ymou9EoESx7F7ujXc5+WJ5KhP+JMYkcSTIh5bzhhPbv2UX5WIQMhQaKlEtuuvVqpcx@lists.infradead.org
X-Gm-Message-State: AFq9FYJCRh+KRPKiSnJP6wYMYbTdEbte9zJfBwxy23PSDhPe5+UBv/fQ
	E9lmwqFZXzqbFU+fQ8YWf1Ij8uAtd5I5fRSmVyoKvMQdE2CG52wLZ7qT
X-Gm-Gg: AYBFou0Rlmsz7UhIIVZijX8bfx0QkMLb6Lt3e6zFr+3xYnbspf1xvt03Lu+SMV7Z0iY
	KPkBmNVlg05+pg29DvEiavmo9KDeHOWKTdENaf7EdxQytKP883W976YZg2o3eGi61sUmByZ8MC7
	43THMxqJcUHYEhMVZBVWPFREbig6fhNwBSg8ItXwcejeDJjSoaL8NdGgzOawEKmNXtXDvPoibfQ
	rJxDJWKbrrMJrATLcBEzOwVQnX3yqlLnom7yHtb+GiAcdIwfCQqr2RetfLpIxeV8+sLum7y2xpb
	CFTHY+Y0jzwPSqo9QSpv1nV5LkJdZUiYj+PVHPAHjY8SE+UTzzHDXZEjmr5reXOol1qbbFg4aIf
	V1+/XEAG2MGdxlW4hz5m5pgFK1A5jbLNnB32roySkRlpFS0r5xNeCMcAJlQO1quLpUCI+qgz2ww
	0w09XCKaOJKH2K1oJaJxoakPbG9cD1bGdSxbzOd7hRIS42Do+0MN5VWAz6RSPjlf8UVJE1FxtZm
	NFi0mfXV9i607+x9CbNoT6VjGe3zSRvL7uuwO2kIIVnpsY6VxHuRPLkmuTF0dxdHks1S/ynYsvo
	iw+pcuKaSCLMNw==
X-Received: by 2002:a17:90b:4fc2:b0:3a0:c276:1ec2 with SMTP id 98e67ed59e1d1-3a0c27621c1mr5466581a91.19.1790662354571;
        Mon, 28 Sep 2026 23:12:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:34 -0700 (PDT)
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
Subject: [PATCH 08/10] ASoC: mediatek: mt8196: remove redundant error message
Date: Tue, 29 Sep 2026 13:11:19 +0700
Message-ID: <20260929061121.124001-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071243_837171_C66F4C6D 
X-CRM114-Status: GOOD (  15.68  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_warn() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index 9888812cd993..fbeba01b086c 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2360,7 +2360,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* init audio related clock */
 	ret = mt8196_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error.\n");
+		return ret;
 
 	/* init memif */
 	/* IPM2.0 no need banding */
@@ -2394,13 +2394,13 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2469,10 +2469,8 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8196_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "afe component err\n");
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 
-- 
2.43.0


