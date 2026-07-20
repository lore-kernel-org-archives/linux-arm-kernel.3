Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AF5C44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAdxUjfA4mlAH5vwcdO3zwF53s9GTPaw5wLgiyMnbFI=; b=CAQgu+k/HTs+5vcJ/2f3bVBjDU
	DdUI5Eur3x54mDr/1SL3t8m0oyeEPHG1Z3TM/Fx+gdOkxtCU/f0VJxOVR2dxpn11OI4HyaSqXMt2T
	lVt7kII6JDho03mB4wpdx8su4/gK+2oyTFFyiek9HYlDgD07YVcl06n/Tp1NmCN7QjavUutwxj5jE
	l7sHXuXNZgsq0eE+e4nzS0LmfMEiyWinRHlYm6D4S36rVguhsvkA6YTnRhiORrjkH5EWTtIjpL2jo
	OIIkCT4qDIoip1fZEnPRz/wZIklKACkEDvxNhbTJXj3dvksxZM7UkCA6e91yMJjoBCbE70d8Om411
	ogsTd97A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlicx-000000067TY-374D;
	Mon, 20 Jul 2026 07:41:27 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlicr-000000067Pn-0UNX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:41:22 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-383cb94f742so8898240a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533280; x=1785138080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PAdxUjfA4mlAH5vwcdO3zwF53s9GTPaw5wLgiyMnbFI=;
        b=lnOHxbH8rKzRqd8n5jcE+mvzMdRUGj3FMexQb61KhV2Sy3l4GI2ORb2qdWOQWL/A99
         a5AmqkGWvF4peSzB/rdIq0QdCQ9PaWBFOOZGRB5Z0UFRDyA6503EWqh3hOvur9gpckoD
         kncBrwBFlyZwWF//ksLGlMDWzc/POcO0/44R2QsPnUHrWT+KHYCO+l+keiSAbf6/p3RT
         Clybl9B2icwQ/oo1z00If9cGPnew3YjBkXkThnU+2QkIO6IEymGlgYzj+dXRHmODauJH
         Kx2EFZIp096gR5cWJIhJ3b/twCsmjiSTfx6md+lCq5sr6nErxzDgYQ8GOknD1z7+7uY0
         Gjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533280; x=1785138080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PAdxUjfA4mlAH5vwcdO3zwF53s9GTPaw5wLgiyMnbFI=;
        b=HAMygNjv6ZZNczJI+JOCQarJUsPvvi3cMaYYiEM1cmUnIboAwEwtb3q5h4yO1GUhtS
         iXYwDdVgOHIJYX+ln4+aWRdWaH/JOOcUqxl5cpbutQChJbvze7pzXYtV9aaFemmjK+rg
         mD5MIFpNHjyPyPSyEsTxAurtrWWdho95ZmYN2R/uuZrRpaRO+wWkIoRgyIx8FRIwEL1m
         mNOntbkSlL4wCZW4YtlrlzY5jomiyLyg61ONQZf4KVYU0ytqu9vbJbVLAZ/iGTd2xlmV
         /gWcPnkmeI3Lnzo/bA2pu9DO5Wa5dMbQP+pNMKMhfA8Ae32oHgZGbLvyGZbj9pD45RGl
         /Tcw==
X-Forwarded-Encrypted: i=1; AHgh+RqkgKs0/cF7p2dlsJhAdLSFsIWtwbUetcMWtJI5v0Cr0JhKSIKZoC76GivqzEBxLePeQVX/ZZGwB3RrKRvBlPzx@lists.infradead.org
X-Gm-Message-State: AOJu0YxSTD1JAc0IZNChTAboF7LMrEw6mDg8EomzHomnOeQprmSfjdUV
	dDcR2qraWRyYID4GiDHdT+8jnvNnid9FheAie9sVNXMOGpQRR/YXjbRU
X-Gm-Gg: AfdE7cko75jtGW03kdwCzoo68SmvF1TZYBepBzQV45TBPsmGTG/UVd6GBxxoxTJEd5J
	v+kRgDVXFSsYzu2wErkijb4IgeLgT6269ytz+ForHZTVvdgFKJUA/hyzU73ypHzogNFKG6Rl81A
	HZpmfajb48xWx1w0pasPpCOdHrK1W+p2RbVvJ1aQEPQ8GVUm4FIoPD42oyK7PBXeV4ZFMCbcIvh
	YJcDEciDClYSoyjD9s0rgXCJX1E2A8/5tGkkt7WHjy3IT7QMz9gXGmrzK9x3UTM/vCaxQGCpHhN
	q7Z051tKulIIo1DaLQnqu5aYzEBB11rG7UaCwYIzFOIFYJcwBtAB6/3e6RNdDqIeTVlIDqfs71W
	6ZP3ctvQpjldJe0R0R7/RvsBhDVpb+b6PstsYc6Zs9FwwSwNitxb1fEEnRkUtt8WoB/xulpG8HG
	Im5S318wVvAijReQ1PX1Uz+Dbpsg3ntiFQ5rZxK0Z5MP2V7dA=
X-Received: by 2002:a17:90b:4d01:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-38e4b56d65cmr13606083a91.21.1784533280225;
        Mon, 20 Jul 2026 00:41:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm470171a91.4.2026.07.20.00.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:41:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] ASoC: stm: stm32_sai_sub: Drop redundant error messages
Date: Mon, 20 Jul 2026 14:40:42 +0700
Message-ID: <20260720074044.87528-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720074044.87528-1-phucduc.bui@gmail.com>
References: <20260720074044.87528-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_004121_162876_6BA12B4F 
X-CRM114-Status: GOOD (  11.88  )
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

Both devm_request_irq() and snd_dmaengine_pcm_register() already log
failures internally. Drop the redundant error messages and return the
original errors directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_sai_sub.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index ea9e8bddd63f..9a201bdb306f 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1696,19 +1696,15 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, sai->pdata->irq, stm32_sai_isr,
 			       IRQF_SHARED, dev_name(&pdev->dev), sai);
-	if (ret) {
-		dev_err(&pdev->dev, "IRQ request returned %d\n", ret);
+	if (ret)
 		goto err_unprepare_pclk;
-	}
 
 	if (STM_SAI_PROTOCOL_IS_SPDIF(sai))
 		conf = &stm32_sai_pcm_config_spdif;
 
 	ret = snd_dmaengine_pcm_register(&pdev->dev, conf, 0);
-	if (ret) {
-		ret = dev_err_probe(&pdev->dev, ret, "Could not register pcm dma\n");
+	if (ret)
 		goto err_unprepare_pclk;
-	}
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
 					 &sai->cpu_dai_drv, 1);
-- 
2.43.0


