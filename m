Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D92C5DF8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=; b=PJHbO5n+XleAGFcIt5dGbMzWck
	WIp0gdYJkbbBufSn582Pp2vStzEt3/VfpbzqPikIN5AfDHfrGgYEidzy9MvjAGE/6nDgdz2mY+fQL
	ydSka4oqig764ZZKhq9qzpGz3IXw8dmc7h1bGazxOS9UB7F6xnNeKFicCKilgCnOwrFlBgGp9v/Gu
	9I+cVUV5VxkM1vuSAviDLzzITVUQFtSAeH8YCRudpMDvRJnMuTPiMsj05Cz1e/0wjLu3PsVzLDksv
	AVKl0fphb92BTibnu3znXOP/1nmEQOk9BnMISyEMQRMpjzyNY6eukwAoCcCg1t7J5Lr09M6fQoAK8
	PUlHqIhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONu-0000000DJg1-0AnV;
	Fri, 21 Aug 2026 12:30:10 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONm-0000000DJYg-1t3u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:30:03 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so755926b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315401; x=1787920201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=WfF6Hbha3PLuyAPCNM5gC5jsLLKP1zfbxpdwK/bUUNUz3kAkMV8hqMJUZ43v49wKjv
         bDPAnstDPRdTFuL99umq7xuIwaWeP2DHKQisFAcFA2o61jQ8b7Qlrgl+kKPvyVzV7kVO
         y+RWgLzHWEj/lenRbcc23vkrYfwBU0YnOkUKU1R5McB05ov82ksWHZngHECDqYTNhGv8
         V0AmnIS9YrfhBqq0zUy5djMkF22lDYIsnf+k/nPV+Gc1QULMr3F92XBb4zzB//IpKkSm
         OLPtBp0NYCGhjP2ROSJ+y9oVDuO5ZCVeMu2MARQB0d6Dwg7BlnTjX+Xlyp5sqpCD+hhr
         caZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315401; x=1787920201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=mmay1VrDlzeUhRMj2o5lY4A3uG9pKAqFc9gZ7+DVc1ZMmC0ZPdppdfTlJyzzvFISlw
         JiI/dqzGim1LPiqy6Q6aVGn5krXJd2H2IX2Sy2mc3p2lHDB6MzBzPVti2nO2DwaAfY+T
         a/g8hOxjTsHqvf0OsH93IbdaLWIntWSxWEkEYvepG8rQ+J8994oPX1w6By/j0/jyUME6
         eAtDai1/F4rO8utO3q2T1us0Wxmw8i8HeAXrILUeEiQx/VwydR3PNkoltFXWBDy90/yX
         Q4kagTEhKJZUkgGO694q4vJx7WLGyJWq6JORXYaisVDXGn4nspeyoKdEI72QHUAnbjM9
         rJ+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqvrho8onXkTCj9N0dlXsthdL3GKqDTFAXQ1e8lI2wwJ39zasYYyoUklUOFVkiPOHWVbGxuQc9nipvDqngR4tRB@lists.infradead.org
X-Gm-Message-State: AFuF++msXDFE+7bdjalTNCydCZkV+p1B+PaJU/4tERWbYDEuwk8SHZ58
	VrmcK0AXKgPBDwJKEfkUquRsxyaHXr6y1OZigQZduH+6uf9EV+gdN5tY
X-Gm-Gg: AR+sD10kg4N6J8oSKh55uaK8kd4mU7KabohHXwRNJZnIxQp7ieaYqHgSawlE4XBqtYn
	ZwCPcZ5j8jw/YjMMhU8TMSFalvv1+aY7HZL4klMjRF9dAdyxYYhldeFtt/ugKBHS9FIqQdSVJUz
	Sajn1It5D/TNr2XVGwZYPOVa4XsvM+o34XyYoFTbHtSIqIJI7QEhBB60wHZ8GFQsf1Tj988LJIb
	/baSosvbNiHKPtmmyERkWTc5GdEyAsos+VrZACv6B64+DntniMpgqHosE7jNgdq6mET9eo0YgbH
	KNrbDwuMJh4yRdX34zjF84fh2BTPRio/JVLF7Y7sR4pHggk0zETJ5DZkoLcK1JsEw583Rh7+zKs
	FZDsT8h2x7oKM3hiFadVWppn4oE5y5nJGEd268hxJ3LtAmH2F65Kx4DTxgyd0jSAu9YNR0Mbd2y
	NT2dtVE4oboGqa/Sl6Rtjf+hyJEpytC5NK/pmCpIzyfbTjbAs6Caxpc3koMCEdMzxZdqrqGuiEd
	hgc4su6NcMYYK2Sul60YyfAQMyP+XHADtsncoCs1+fO5jlU0gVLQbc5280LfVHv0fqmi+pI1XRk
	ywDq
X-Received: by 2002:a05:6a00:32cb:b0:84a:646f:193 with SMTP id d2e1a72fcca58-851f969b3b6mr10656377b3a.0.1787315401447;
        Fri, 21 Aug 2026 05:30:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:00 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Fri, 21 Aug 2026 19:29:28 +0700
Message-ID: <20260821122928.41343-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122928.41343-1-phucduc.bui@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053002_538765_459715A1 
X-CRM114-Status: GOOD (  12.94  )
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
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


