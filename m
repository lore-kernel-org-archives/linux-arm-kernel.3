Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5401FC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kjJqO5Tkx7QkqQKX+O7z966c27TyW/hoTQBkhU3dCmM=; b=Z58fG+zqqZIAssjKx+jsGxPUE8
	38KHMJ5O/8RlEoSlo89iz0bTRgyC3rnKzZoNWVhvU+P4GS3JnBBIpV2XNdUgwmnlsW3zTHq+93vY4
	LG/5zWUt/6HnDyKnCXfEoGRuUTDutmtsgCIub0RfK/IThoAlg6vTIWEvB2gB9KifW2w1ytB996yED
	nqkXsMS64tFE+UrYZ0ZIZhbNjZua/2RHRUaEyc4LmeGU0dBfbtemBVYUCnP8h5ZkBNG+vXiwSFK6W
	bFaheYc6JkND9lI30+Gn7wOPNdnUvtJ/rV7DqNcwpjG9hM2J7Ol8QNjqUCkuKxqaH9yoUerLdSpU6
	hGij0ftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcar-00000009Pl1-1t5u;
	Wed, 19 Aug 2026 09:28:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcan-00000009PiV-3eLG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:28:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49954b88fffso7966765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 02:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787131693; x=1787736493; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjJqO5Tkx7QkqQKX+O7z966c27TyW/hoTQBkhU3dCmM=;
        b=TsY5uzPKoQyGBPZV+qcRY4nlaWIuqxdr6e1cFUfwvZrvOpt/32DnJGGr23KAnf5N56
         I7ZH+G+CBFrGlCOipQtqK9SrxAWTHGJjtWt2VkAHz3g4HwkyS4QhlbIkQY9Dmw6wzu2n
         bXjPdhogrippbsQmqzCsnneJ1SvBWuPZ2U6Ng4jfpkueYS8bTLt2W/CyFm7e8pqKY7zi
         onlrKqcoiVmlDasE1ReJc0XWC0zWy2M3lBWnQl5PI+1SjI9o4qpqWL2o9tB5YZRDbJus
         dgKpLNsh+7Vt38lM79g0VhtCpWs01bZoyjuYGoamg+G16cQeKcv36v3SyHOVdB8FtNw0
         DIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131693; x=1787736493;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjJqO5Tkx7QkqQKX+O7z966c27TyW/hoTQBkhU3dCmM=;
        b=WIe3VE3DoIhcMn7A1169Z2o1+/yWrkjfOVRXZfnYVq00vkgV2qGdvzFXiJR+oo4s9N
         IN8p9Da1NYaL9bbhHQhDF35EjSVk8Tz703EgyxsLT617K8HBuJyNZHOUM4XWoyvo/04N
         DCSWdRB4LcwqQ22bqZUNjwmPNXJH4Gz8P8cgKWJjZf/lvA9/ii0IHVhgi/ySJucC9UoT
         ZIYrW4Lrsb+6JXBTQkWCdTXMBPqEWiLmbTBxYSp2XopPA+/S/Tj8czYGvYH9kcP+cPi8
         r0JMn/69uJMEgCsioghDfV7KP8pyLQS8mKtAfz98JVPFH8lCQ10wMfS8MQ8Gjrj9MntD
         cYag==
X-Forwarded-Encrypted: i=1; AHgh+RoaHLDDZGfV2VeYbVnZIt0kmekLlJmoa24w3DgoiUGfhXQ6A2oJ6QdAD4nwLge6sWh8/OAKKCNDstKZZJvJMp8d@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjj2Vac3Y6EWU9oqYYUCh1e9rKstG/AOIRz+/vCbLjl8A7kZ88
	xLUdQhw8OwE8saQ8VMtMMWGd2ispwGFGP24PdsEeZPS6z83aMqCorHJ2
X-Gm-Gg: AR+sD11/tN1yBs2nTv3HKXdTOAegPx0ajZM8zZnZoUgjwep2P/DWbzXu5dQ5aeNCa1g
	eqRUsjDlNJFcJQsfer7qUhuRHm/sp1dnWl4q7F6N3vBcW3uP4N3dWK/zrqtynpoUqhO4vr1vfTx
	8GCbfuT+YWCWawrvX3kpzjbfAMLyyYCTn/R6F5EsNZ+lAYsFzQbAQ9kpH0fwZr7PmpNbDQ1Xopt
	xN7S6BAm4yLCuHHVBkzfZNj+wLadBDKaubHR1OJOLbJOfoUh6Uquupjpn1lK+U3miyQ8RmHqlA7
	QaDex5hEEu8nF/hXfBkZ9ouvHIrBbePb8gl1XlthNEuvIdp+DpBxlCoD813NxdItHfnr0HFTiLl
	tcGEDMvGZrY9J8ycTCj6Ade1O+E4LzzrOTyTCZdkJRpsk+dWsB5qoA8xurRe2CyMTRNdJGpoezY
	c0uXG5/voYmrTaMBWVEDNOFbsZ0hwzFuo+ulUvkTKFkBTho8e5AHEKBfX/nKl3KA97mw2dj5cbQ
	wcU3T1pEOjt820Lwocu3HNOjQ==
X-Received: by 2002:a05:600c:8b65:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-499aa1722f5mr58865455e9.6.1787131693443;
        Wed, 19 Aug 2026 02:28:13 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa11fd3asm42234935e9.8.2026.08.19.02.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 02:28:13 -0700 (PDT)
Date: Wed, 19 Aug 2026 12:28:12 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: verisilicon: rockchip: Fix leaks in init
Message-ID: <aoV3LLy5hSoKL4QP@michalis-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_022817_965590_6B4B00AD 
X-CRM114-Status: GOOD (  13.37  )
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

if one of the dma_alloc_coherent in the init fucntion fails then
the previously allocated ones leak.

Fix by freeing them in the error path.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 68 +++++++++++++++----
 1 file changed, 55 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4e21ad37323..fa77fd402412 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -369,6 +369,7 @@ void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
 
 int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 {
+	int ret = 0;
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 
@@ -377,39 +378,54 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
 						       &av1_dec->global_model.dma,
 						       GFP_KERNEL);
-	if (!av1_dec->global_model.cpu)
-		return -ENOMEM;
+	if (!av1_dec->global_model.cpu) {
+		ret = -ENOMEM;
+		goto global_model_cpu_err;
+	}
+
 	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
 
 	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
 						    &av1_dec->tile_info.dma,
 						    GFP_KERNEL);
-	if (!av1_dec->tile_info.cpu)
-		return -ENOMEM;
+	if (!av1_dec->tile_info.cpu) {
+		ret = -ENOMEM;
+		goto tile_info_cpu_err;
+	}
+
 	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
 
 	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
 						     ALIGN(sizeof(struct rockchip_av1_film_grain), 2048),
 						     &av1_dec->film_grain.dma,
 						     GFP_KERNEL);
-	if (!av1_dec->film_grain.cpu)
-		return -ENOMEM;
+	if (!av1_dec->film_grain.cpu) {
+		ret = -ENOMEM;
+		goto film_grain_cpu_err;
+	}
+
 	av1_dec->film_grain.size = ALIGN(sizeof(struct rockchip_av1_film_grain), 2048);
 
 	av1_dec->prob_tbl.cpu = dma_alloc_coherent(vpu->dev,
 						   ALIGN(sizeof(struct av1cdfs), 2048),
 						   &av1_dec->prob_tbl.dma,
 						   GFP_KERNEL);
-	if (!av1_dec->prob_tbl.cpu)
-		return -ENOMEM;
+	if (!av1_dec->prob_tbl.cpu) {
+		ret = -ENOMEM;
+		goto prob_tbl_cpu_err;
+	}
+
 	av1_dec->prob_tbl.size = ALIGN(sizeof(struct av1cdfs), 2048);
 
 	av1_dec->prob_tbl_out.cpu = dma_alloc_coherent(vpu->dev,
 						       ALIGN(sizeof(struct av1cdfs), 2048),
 						       &av1_dec->prob_tbl_out.dma,
 						       GFP_KERNEL);
-	if (!av1_dec->prob_tbl_out.cpu)
-		return -ENOMEM;
+	if (!av1_dec->prob_tbl_out.cpu) {
+		ret = -ENOMEM;
+		goto prob_tbl_out_cpu_err;
+	}
+
 	av1_dec->prob_tbl_out.size = ALIGN(sizeof(struct av1cdfs), 2048);
 	av1_dec->cdfs = &av1_dec->default_cdfs;
 	av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
@@ -420,11 +436,37 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 						   AV1_TILE_SIZE,
 						   &av1_dec->tile_buf.dma,
 						   GFP_KERNEL);
-	if (!av1_dec->tile_buf.cpu)
-		return -ENOMEM;
+	if (!av1_dec->tile_buf.cpu) {
+		ret = -ENOMEM;
+		goto tile_buf_cpu_err;
+	}
+
 	av1_dec->tile_buf.size = AV1_TILE_SIZE;
 
-	return 0;
+	return ret;
+
+tile_buf_cpu_err:
+	dma_free_coherent(vpu->dev, av1_dec->prob_tbl_out.size,
+			  av1_dec->prob_tbl_out.cpu,
+			  av1_dec->prob_tbl_out.dma);
+prob_tbl_out_cpu_err:
+	dma_free_coherent(vpu->dev, av1_dec->prob_tbl.size,
+			  av1_dec->prob_tbl.cpu,
+			  av1_dec->prob_tbl.dma);
+prob_tbl_cpu_err:
+	dma_free_coherent(vpu->dev, av1_dec->film_grain.size,
+			  av1_dec->film_grain.cpu,
+			  av1_dec->film_grain.dma);
+film_grain_cpu_err:
+	dma_free_coherent(vpu->dev, av1_dec->tile_info.size,
+			  av1_dec->tile_info.cpu,
+			  av1_dec->tile_info.dma);
+tile_info_cpu_err:
+	dma_free_coherent(vpu->dev, av1_dec->global_model.size,
+			  av1_dec->global_model.cpu,
+			  av1_dec->global_model.dma);
+global_model_cpu_err:
+	return ret;
 }
 
 static int rockchip_vpu981_av1_dec_prepare_run(struct hantro_ctx *ctx)
-- 
2.43.0


