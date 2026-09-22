Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB59C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NlrXH2S4Gx6RyWaX9xgNBU26d2RYRNGe8s5uLAI9foA=; b=BpGWoN0khtQnZ4W4Eb61TI213e
	IuL1gD9zaNaOl6imG+8Jium4b86vcIYNH5xWxUhgglp2DKMveIKmbp1N/RGQxZAr8ClSOtQ2vuchx
	4vvCK+qLwBXZaor3cktOHB8rl3+NJRmcjCX0R7iLgG8m2Yjr4u9fXLktODmQe7tCJFSyy2rBd7a1q
	Q5QQ0vFcgwSK/YBgAHoRv/I2UAexE2r325tlnBuE23stZLU+4RU72hodFgbMEMw/4ZcFUHkJrFnA7
	QFPlKaYl5z23zTo562+9FdzKoCjGFXzMB9Ce1kHynU3jpsvgu+SKcjLNEZaiiYf+hV18yyTapJkys
	v69klkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ssg-00000004EZJ-050n;
	Tue, 22 Sep 2026 05:17:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8sse-00000004EZ8-2K5w
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 05:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NlrXH2S4Gx6RyWaX9xgNBU26d2RYRNGe8s5uLAI9foA=; b=k2I1uopDORm1eisHjT3k8NpR10
	cheW8hihmRxxKNey9y1NPODWlCsGvsi0tg4kBYdSXmAIIdQXrknVF+LjLICwcvjyoRvcioOr54MCh
	rUMP29OvPymxBs+HLIDwNgWjigryuaT9k8CZYQMPjUmUuDhLMM0CYO2k45Y7dHKTQ8myYIdWnSXEB
	Rs7UFPXTB+E+RUctrY2Rqr2EslFRXtxmD7nNj2LapnuT8QzMRddxcLy6id516Hzuh5de9eoPSgigM
	eH9KtXVm5a4si0l5R8MX9l7bAESL2+GkSL5jnzvzpIfzHLJLB45UIb2SxPuzbcKFZ2KlIhAmCpQu1
	XmZGXXhw==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8ssY-0000000D74A-235g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:17:22 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874fso1328344f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790054234; x=1790659034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NlrXH2S4Gx6RyWaX9xgNBU26d2RYRNGe8s5uLAI9foA=;
        b=JHFRGk9P/VG2UgVZzrKcnIgjkPguUy2JdNLlbVPSEuCSBrfnxK9rRRoRC7ereRqKai
         zAUfTB2JSMfTYPP6cDmBC2tMhfdICOxdOhOtzFn3lVhuMRSiDRZv+9bRf6s+yR8ID+w/
         PIoWfm/7fVfP6aHvIaPEkggSOqnr/pAfJs3YKFwyKQxpfvDf+g5OglIV3pH4lTU1YL0X
         hrU5KMvVFnl7wFcTnSBtg5243aZXSqDPlHafvg9G3jUmDHSUA618lTPZ2brledjkcEPR
         tvU96i2CwTNfy84rE35Ey036l6yZsJ49QElxJwK4mb65kCDrS5guibHcG/Mq1d8AdN/i
         7Z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790054234; x=1790659034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlrXH2S4Gx6RyWaX9xgNBU26d2RYRNGe8s5uLAI9foA=;
        b=VGC0Lb4eLJXPPiFmS+H6zzB689pxfw1ByxgOkzCVGzfkCmKF8dd920Igkd4jKMP7yR
         /xUxJPtYg839wdejTyWGH6AVuYWNcF+wgGCeMhheaA4+Pd/jVqxS+e8WIXafv97ehzkA
         /fJ9AJGVyYVhhaHH+1Yg1Vz/i5jjS8EJLLsiDpMV1hR+RJ9T9K3B5FbEozayj27yrxZn
         y0XuzAEk9hbUwChg7Bg/DYgWs83AsvxfS+KNVRignpDp2sS9/CDaVGub545PFklrGpMJ
         bgpd7bZYa3GKJTA1+ugZfhjochXg86VK6ECZpc+313g57I5QXi0e9g3OYLcesMT3gBHz
         /YCg==
X-Forwarded-Encrypted: i=1; AKwUvBzHA4HoBAcDK6NjqXoitcoBIOY227kA2JCSdW0eG61fHJFLXWKhAD6SPUCoWIm10moveRbidit9vwGAai476z+2@lists.infradead.org
X-Gm-Message-State: AFuF++kZ6qEsb96l/Un+jxfmIkyvZNE8DgU+WIs4xyvfHrdaUAVX/URE
	7NosVyDdYyqdLN3ht4htc5bbSLrBCR5dNxcDHZIyfx7hgUPtrOr+1VNkGoSCdd/6
X-Gm-Gg: AYBFou2hebpMw0MQpkIcEJ8FAl4Dku9IHbhaqht0pGRSBngw6nn7Wyb1Smp/BK/xzap
	HkMECZdgxhnM2ZjobXUQrZzpYK1C/Lw0KRWsJel14Z6h1IBAq3OsTvfD0xATy0vOZNHgCzAlkHU
	/eY13aJu4/uF0tAnX8ffQU6VU232lrAePALDrz+DUy/F6kXI+HCC7A4CEJq8FRVx4bUnRJUfXsw
	Nm+uhZpSH6BJ07tzxeIsOcCQgCJavBKd+kFtkHgSfbxZHY4rGGNBinhpXSA3sOYczjmJHNwPZq0
	lMy6I5i31AyL4IJjcyyMZYgRqWK05NfxurUQxTZZV3tZa5zqU4gugpkDYoQ4DCIkOktlYKi1ifs
	HzuGpN2cwIN0hrra9rCDuAJOQZHTTmthmL4zHLSm5oq1DnYdnzu6QxnlwoL/PmSj6PURHcB/p1I
	DOpkdEiq1raLigkiz0iKWvICpXbFD9EfpEk8LLw29hvJ0sk8dmS1rz4qy41TQU+5Lx8Sbopq8c0
	FEnqz92EJdp6UN49m2n8WH/nlHJ2LJoVGbNygnlztWyyAturdCWeMk4n6Y7GogdrOfjpSoqmygn
	Nw3QduFJayTlof/4RQV4bkvTy0sAz0eD7h+N4+meYbQP2Kp6wEWGOAeG7ZYzynS69zgs5EmM8/X
	Mc50y7w==
X-Received: by 2002:a05:600c:4f90:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fd8853515mr26364115e9.3.1790054234219;
        Mon, 21 Sep 2026 22:17:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a5e6-3401-ecdc-1e24-2e52-02d6.310.pool.telefonica.de. [2a02:3100:a5e6:3401:ecdc:1e24:2e52:2d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa99b8bsm17264935e9.1.2026.09.21.22.17.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 22:17:12 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel: handle authenc requests without plaintext
Date: Tue, 22 Sep 2026 07:17:04 +0200
Message-Id: <20260922051705.15329-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_061721_279812_99D971EE 
X-CRM114-Status: GOOD (  15.49  )
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

Authenc permits a nonempty associated-data string with no plaintext.  The
Atmel driver accepts such a request, has SHA process the associated data,
and then unconditionally asks AES DMA to transfer zero bytes.  The Atmel
DMA engines reject the zero-length descriptor, so the valid request fails,
normally with -ENOMEM.

Skip the AES transfer when textlen is zero and proceed directly to SHA
finalization.

Once an HMAC transform has cached its inner and outer states, SHA can
complete this path synchronously.  The forced ahash completion callback
then invokes the AES finalizer through a void function and discards its
return value.  This loses -EBADMSG for a mismatched tag and reports
successful decryption.

For synchronous SHA completion, release the SHA device without invoking
the ahash callback and call the AES finalizer directly.  Its result then
propagates through the synchronous call chain.  Keep the existing callback
path for asynchronous completion.

On a SAM9X75, the unpatched driver failed valid AAD-only requests and
returned success for a bad tag after the transform had been used once. With
this change, bad tags return -EBADMSG for both fresh and reused transforms.

Fixes: 89a82ef87e01 ("crypto: atmel-authenc - add support to authenc(hmac(shaX), Y(aes)) modes")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/crypto/atmel-aes.c |  2 ++
 drivers/crypto/atmel-sha.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index 50d97cef75b89..89594b96e28ce 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -1826,6 +1826,8 @@ static int atmel_aes_authenc_transfer(struct atmel_aes_dev *dd, int err,
 		dd->is_async = true;
 	if (err)
 		return atmel_aes_complete(dd, err);
+	if (!rctx->textlen)
+		return atmel_aes_authenc_digest(dd);
 
 	/* Prepare src and dst scatter-lists to transfer cipher/plain texts. */
 	src = scatterwalk_ffwd(rctx->src, req->src, req->assoclen);
diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 48f54b6155042..f1a37d315dd0f 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -2383,11 +2383,25 @@ static int atmel_sha_authenc_final_done(struct atmel_sha_dev *dd)
 {
 	struct ahash_request *req = dd->req;
 	struct atmel_sha_authenc_reqctx *authctx = ahash_request_ctx(req);
+	atmel_aes_authenc_fn_t cb;
+	struct atmel_aes_dev *aes_dev;
 	size_t i, num_words = authctx->digestlen / sizeof(u32);
 
 	for (i = 0; i < num_words; ++i)
 		authctx->digest[i] = atmel_sha_read(dd, SHA_REG_DIGEST(i));
 
+	if (!dd->is_async) {
+		/*
+		 * Return the AES finalizer's status directly for synchronous requests.
+		 * The ahash callback cannot propagate it.
+		 */
+		cb = authctx->cb;
+		aes_dev = authctx->aes_dev;
+		dd->force_complete = false;
+		(void)atmel_sha_complete(dd, 0);
+		return cb(aes_dev, 0, false);
+	}
+
 	return atmel_sha_complete(dd, 0);
 }
 

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.53.0


