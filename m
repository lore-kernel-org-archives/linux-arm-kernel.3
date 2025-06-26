Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171D5C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOCWgCxa5TuHqEzs7P/Xd0Uu+UeKSk+lfEEEEay9BLo=; b=qfs/Eoh7oHWnWVOID75cKi0zCz
	et8AwPLl6vYzGxSlctzbALa78gIo0XSLrB/ZpsyN1+8pohbTl70y9WbDAwV4iG4KR+V4RoGaJVkAg
	P4248KeQCaAMvAtQ76/zHy/wqf47Wwueefw5xsZPlUDBJHMnLtwMRzzDPGU/rvbf7OdxNLWxkAKDb
	QJKG3N8WZ8BzPvVENtIujSojlO3Ju1LPmmnS66zvKGIf1/dXca7ex7Hp1pncVIj8zpXQFzQhGAeP0
	xonrSAYciV3bgEpg1oNuXbAtA+f2yqIyQ4t54yX/8iBJWpg/HFP6KQlNNVNiCnwlCd/8gF+wPcUjr
	PQSRjW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkh0-0000000BNzQ-2uoL;
	Thu, 26 Jun 2025 11:22:58 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjOA-0000000BDtp-3HQ7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:59:27 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so151347966b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931965; x=1751536765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOCWgCxa5TuHqEzs7P/Xd0Uu+UeKSk+lfEEEEay9BLo=;
        b=JgMloBXLKvFqsT1jfrAkkT9Xr4hlH9R0GDWVW915xWin3kVPqvoWja3eqf40p8FAmP
         z7kQ3FRs/UfpVqQGAbPhr9h4gIh7NWDoGA2kYTDrDX0FKBoLCrCkPZa6ECdgjgJ0SE0T
         OYPWQxTPTY5W7uCe8aU9N1e8meTm+iBPJx5QRrK+SrLrCRImzHU42Id3vE0raz6ud72v
         XCphStNikUfvUOGBlycVoChcpBxwGEe6t7nB81pJmd5C0Y5BgPOZoEEASi2UqR0V5VUp
         1X6lnUKEHKPxkye2ePnGcgbtv9jx3npjPO2zpA0e3G2k+FjVK+Uvfn7w4gkLxkL8tRkg
         gCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931965; x=1751536765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOCWgCxa5TuHqEzs7P/Xd0Uu+UeKSk+lfEEEEay9BLo=;
        b=EjoJkf4/dhEqy4IuRE9NMwoKGZjt/jSpiL4XjlihtLa/8VHoo4KkWv8fgXU2vMdnyD
         09ZaT+iSvlXPJAWA0MVJ8gWvIWdB6Y2qr2nf4FS+M4FvIIiyZe8lUtY5roWbBkUZNG96
         qDEeIdNjN/pc6rc1hUQ1ZOZQVpLM7ObmUuNylcsm4zgn7xikespH2Pnpefyy+lT5lCNk
         n73c3jwNveWGPBgsOAN6FhBgfwdXBSrplTLXteQQB4aPqtHT1UPIMToPm+beeCfXoLbW
         0l8mgmtOPezWwhw2dGTjIjscBnF1XwqHTs4xP46fpDsN+7Thf72R0zcT6Ip4WCneiIsC
         mdtg==
X-Forwarded-Encrypted: i=1; AJvYcCWgzgbOWMKHw+WHGMvqgb9HzrLmYyapUmxN8HKFykcOTIFDiQGZNK6/TZfIlgQqKnd1+y6iEIG3ddAXXQB5SYqm@lists.infradead.org
X-Gm-Message-State: AOJu0YxdmhEnbgO4POkEprgUDQ6qZbl4fILigcHTIZcCld0svQwDkLfj
	1Z6vUKpGW8mwDO4Hx0jtsutdwuhhDkm69FgFmQgkWu8G9vt/iY062qAM
X-Gm-Gg: ASbGncv6fhtLTxZ3hF3k4HVxooVPLsEp5xE/agbSMNhu7myuT4l3njvViBlZDd2dKGL
	5BWyywcr7HAmMNUxU3H3K5KwEeQsWrxI/a/X5OETN97U8a+Ssg1X4gVe37QU7yOkTjdLioPIpdg
	jlHAMYkocLDY/BSWGplQLtqBO7K6pv9S6Xuw7/tvacQgaDFqsSQ3XUjqlFkASKt4cTnuiUgvuls
	VfYq1TEwTWDpXS/zw2iWogupcP1bR7vh0zx8dBgwErXa4i9wXJa8nu2Bobk3oBoRJrxz4MilT3n
	3MpB/U9HPEtL3KR8U1Nbt4CLEq8A4+JviuYd7gnZ+JwXfVkMv2ifGrBtk64ylxpUMkP8B4HnOUO
	utWTiJol+u+aOQg==
X-Google-Smtp-Source: AGHT+IFXLtDWsVLMRJFKSM7ZfKEbTxaY7obk208Kuz4qR9WlO3f5+snTWFaRNwrAjl6SXIyIm+JgZw==
X-Received: by 2002:a17:906:33d5:b0:ade:cdec:7085 with SMTP id a640c23a62f3a-ae0be893190mr488892666b.26.1750931964994;
        Thu, 26 Jun 2025 02:59:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:24 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH v2 06/10] crypto: sun8i-ce - fold sun8i_ce_cipher_run() into sun8i_ce_cipher_do_one()
Date: Thu, 26 Jun 2025 12:58:09 +0300
Message-ID: <20250626095813.83963-7-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025926_820375_3C4B5818 
X-CRM114-Status: GOOD (  12.86  )
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

Fold sun8i_ce_cipher_run() into it's only caller, sun8i_ce_cipher_do_one(),
to eliminate a bit of boilerplate.

This will also make it a bit more clear that the skcipher do_one_request()
callback follows the usual prepare -> run -> unprepare pattern.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 34 ++++++++-----------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 9963e5962551..5fdb6a986b1f 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -360,31 +360,27 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
 }
 
-static void sun8i_ce_cipher_run(struct crypto_engine *engine, void *areq)
-{
-	struct skcipher_request *breq = container_of(areq, struct skcipher_request, base);
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(breq);
-	struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
-	struct sun8i_ce_dev *ce = op->ce;
-	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(breq);
-	int flow, err;
-
-	flow = rctx->flow;
-	err = sun8i_ce_run_task(ce, flow, crypto_tfm_alg_name(breq->base.tfm));
-	sun8i_ce_cipher_unprepare(engine, areq);
-	local_bh_disable();
-	crypto_finalize_skcipher_request(engine, breq, err);
-	local_bh_enable();
-}
-
 int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 {
-	int err = sun8i_ce_cipher_prepare(engine, areq);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
+	struct skcipher_request *req = skcipher_request_cast(areq);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct sun8i_ce_dev *ce = ctx->ce;
+	int err;
 
+	err = sun8i_ce_cipher_prepare(engine, areq);
 	if (err)
 		return err;
 
-	sun8i_ce_cipher_run(engine, areq);
+	err = sun8i_ce_run_task(ce, rctx->flow,
+				crypto_tfm_alg_name(req->base.tfm));
+	sun8i_ce_cipher_unprepare(engine, areq);
+
+	local_bh_disable();
+	crypto_finalize_skcipher_request(engine, req, err);
+	local_bh_enable();
+
 	return 0;
 }
 
-- 
2.49.0


