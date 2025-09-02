Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBE9CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=; b=IgbXIOItsZ9SdNpRQiTvaksgHR
	XhLocF0R5gxr1DyZkgPGrRJtiIZTeZsxhUMPVVdDsL5zwrxXxGldinQq2R/CocnV4l2yDsD1JP3H/
	jDV/ko6MYO6WgcdKfzdO605Fc9pBbgS6qhgslYg5hJ7q1xmFIksYm9RJJP3beDbzjn0/GUOvGJ6U3
	zXG3U8VbPgZD+yjWksFVKygAhhJzTGqWA+IfjUiNCTjCY7KqXTaa0odW2YaDaMlsm+EBX8UfDxWJk
	iHqueiPIJrUtLtKD2ALYngdHcQHYpLVz8mWq24qGyrFZJXR+PrjSfjpBiU219cElQv4kpMZT5Yjr3
	drFhcvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWOk-00000001b8V-3rnG;
	Tue, 02 Sep 2025 19:10:30 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQyW-0000000010d-1Gmq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:23:06 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3d2564399a5so1068139f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819383; x=1757424183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=k07WOSFaK+Cav4+5i03WfrPSAIc6m+4THhG1X/pdnY2uoaq1MtGKfakAq6DGfey/Ug
         /diu+poxT/BxvfTjlEBK+Ph/EK7DpjipcYa1GF0u9geUCgdyOF+qs9jDnUMUnTMt8r5T
         nX3K1uMlkEiF7BxmuLiyf0QQA3BtaXefk3kQRMD5X0JRc+Qs6/I9dTK43aQN4lvvNAuX
         xuZ+n/pYPIUalrj1rCwsVJrCDJYsbzXJONun43dc1gVN/LghAm5DP+4VjQ5X/cy2vphI
         UDAYiFVMr6YF/LCfF+i/mi74xJLCfo4OLhenkglE3L5/SWntboYcc4Wqh8L3BSxtMPVM
         5QRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819383; x=1757424183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=UjyPTaECXxY09RKymZrzH8pWMlVKtE6m9EMd4JpeI9RuE0xMDF8QsVJNFn9OpcprOr
         oFYfQxjCWAOclotnN6Lwxg0+sAiad2NNX0VHqrfRzskPKcBNSZ9zUQncgN9syV6F+4pc
         /qa//MXUzB82oko73XVfNINQOV6GDJuUzfYJYsBNJFIWWEb7FtSk+nhMdz+Lkm0hvoiO
         +rrk7bnay5J6UFLei+D8NJ4D+/NF9hCpfOcN1EKY9v8MVvmvEf8og4AdWBepeUuf0eND
         rJiWRr+RTQ+EcIZAJt5kk7YEeuxVnZynlbVgZ/CqNTPWXBzZWOUxTxfQimvoYjAjBqiA
         1cCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5y8jPwSnVh14mJtkrbOJce9zdulQVp4QhPki5LYtooY8bbhZ74tm/JIryHS3GoprnzrYUAdd+e8TIURBt/HS1@lists.infradead.org
X-Gm-Message-State: AOJu0YyuxKt3Et+QvPj5gNWnntG6wMuGap+oiSB/cznCcIiK7GBXfV71
	70dfIVpEB9D+2pVAPqk3MczvlmJUe9GGca/KuJ6OUMh4pLXBT/9YDlFu
X-Gm-Gg: ASbGncvbXcITHYxaXwaYH1UpaMMO5VYZ5TIVpYuBashD9R9UgJVO9p5A6W1wW+06nPC
	AIuHnum0bK++SsTQTU2xHjTr0XK93JVG1xA2A1pbPA+ffbcRSAhYOXkqlGAHYp02LNDm97RzhLx
	j4txlfK0zRnSpxot5hgbeDgc2gYzUdQPd5pSP44EXZhCvT+q1/YA7ABfhTpOi+seaCAoALoXlJ5
	1WxPIyOdisObjRNySyA/Cws5WCdmWpYRhRigkbEXY5YYZdSoM/R1kMLngCh6vGYdHbHxskfFhht
	dIsZlqdniShHP46Lltd7kbNnkeQvYX9tjiSrbsp0b4pXCoLYNbVh9aj1kAtQ6YLLNfJCq+p/i3Z
	AfH72rGvZ6Ckhuor2aVHfQL/Tn04+Bcl+3w==
X-Google-Smtp-Source: AGHT+IHVnaSqlqqL4i33vbnl8DxH3Zomz9ikQnMsjbbKikajW7iV7MsBCgP8xKySewSnOuFEhpUjVQ==
X-Received: by 2002:a05:6000:1ace:b0:3cf:3fe7:2203 with SMTP id ffacd0b85a97d-3d1dd81d0a4mr8042987f8f.7.1756819382532;
        Tue, 02 Sep 2025 06:23:02 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:23:02 -0700 (PDT)
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
Subject: [PATCH v3 6/9] crypto: sun8i-ce - fold sun8i_ce_cipher_run() into sun8i_ce_cipher_do_one()
Date: Tue,  2 Sep 2025 16:21:31 +0300
Message-ID: <20250902132134.3287515-7-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062304_341701_F72C3E0A 
X-CRM114-Status: GOOD (  12.74  )
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

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 35 +++++++++----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 69ba8236cf2d..f63d21cd1e52 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -360,31 +360,28 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
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
+	struct skcipher_request *req = skcipher_request_cast(areq);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(req);
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
+
+	sun8i_ce_cipher_unprepare(engine, areq);
+
+	local_bh_disable();
+	crypto_finalize_skcipher_request(engine, req, err);
+	local_bh_enable();
+
 	return 0;
 }
 
-- 
2.50.0


