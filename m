Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6751F5140A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=11+RTC5t0MsdYzyhRjOIFhJd9Jd2+UWG3tuKjDCny7k=; b=13c5N0tfvFBlkJxwRw3Wdh7bBH
	ZwUO8w65qFGzt3SWlX2n18uWCg/yqjtheZYRoz8v75rMAkOYM4cpokFkPDI6IFDnOGFg47qB4RSbZ
	Ibv5pSu/jJ4RGTisowUr0OpHC98BxLmiWOl2QdbeeH5oRR2AvGOMFLQBFrgzOxIkw+T+F1AtzmjGH
	PNgF4TM4iLhZJmYuRTc0A/a/sO9O31cPf8N2pUkxFie+E6p9AgGLZx24gdhONs3A7ZzSmNsZhc83+
	Dz2YOk1wubuwvjL3VkvErDsWmg+BqF0nsYIJ+TRP+CWg9IHHBkz9skxfwOw759LdBsX4DvE8IOhOD
	GV2WokBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOty-000000035pC-2GXh;
	Fri, 06 Mar 2026 06:43:10 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOtw-000000035or-23ex
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:43:09 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c737d3a51bdso1029711a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 22:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772779388; x=1773384188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11+RTC5t0MsdYzyhRjOIFhJd9Jd2+UWG3tuKjDCny7k=;
        b=aHBa0UxI/+WGQrz55WzROqDwzihmNPoidM3i3Cc92udZuaqggTpx7iq66qzIe4fpRB
         y1orWanMJM5u+1e4mmMvvHZmBBq9+v7r/ATMyRzlx+EEXbO/+XhM4qWwSIO0YNNMKCTv
         erYV/+9F73GMU4jSSNmQ5YBb/B9JeqWU56PLo9cDI6J367m3ST1zaSmBxojnGaDwxBib
         DOzC9/g8t+p5DALYupJMNLoJLvy6g+i5vyg70cSibDmR/H6aN4f6eG1B8gzfzgseo92n
         ySifXOqNAIgVWrdghrOHEnYdsx6crGhcLOxpRDcr7zyZaCaZgvLhfdNjD63ywzS3bdSx
         NbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772779388; x=1773384188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11+RTC5t0MsdYzyhRjOIFhJd9Jd2+UWG3tuKjDCny7k=;
        b=nPiH2BPw99JxlCzjw/jKYDTOfykKr+0lDyVpZQtMbg/cfxCtkAbfHecAlyZ1Ydk19L
         rCB+PRpt8VEmmtlZoSx9WMrMttcGPSGWM19CsPXp1TgVC33RpRZ2BtSwl6AYdoH6n9CA
         28ZRZ6HNAOmSTpqmCmYlIb9KNgc2GB+FncEOSIoLbFLabWURw7lq6SL6iHtUUdapQhD1
         iDnlZ8+D+5UFEnNshbhBqI99yz/BMmOu8w8rKOeoqu8egsNQlsBqFyiPQSBpQGKEBABk
         Rx/WVGuvt5l/u/bAwW5kw0EAMHVhIG0YAIZzwr83yNc/K6YFvxqdmdpQjU1lCG12oSF7
         gA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4Z1AW6Yx6cvwsLpwJXTAWyLJt9q1vBhMQdIG/zQDjaaXGPX6h8GecM1biWiOnMH6ZDDlN5wf9tvaKTJojfYF7@lists.infradead.org
X-Gm-Message-State: AOJu0YxUmu+kW4VFaFIxrHdA8/DEpn56IKikWmpBosH1b/FfxzPNHuG5
	gTvfTPETNPhJ5sAt77pxNU9nk05+0ib0KX4MxsqL2Y0urdj9WFgfDajR
X-Gm-Gg: ATEYQzxhnrxMQ+N6GaqL6mqshweiX6wk36fxDjz4U5vhdJNI1ePomI4O29Ld4w+MMEP
	evcxp3umG1GpLslDH08bCUMAk6cLBJUZvm+jAe6eHlchqMgWdOr4Y5qjlowVfsNEFCPM6DRqBqv
	7npIAEWQetpV/rzzohzSm16BnRwjfzIe5KgVhkyJ3Cxn4E9sn0nxw7W0d3aPfbdCW72EZvAEZvd
	KWms+KISFlyxhVUnTk3Xadz+8vb6ohcoh8AODiM3tfOllxWir/hokfQXIjX7P6EX9+2xwjQydcK
	Px3Q164/MVzh4E523zHh/krVWrTyPP4RCo098+alWylritgKMEkB3UoxvBAI8pDFuFTXdRJDrvN
	mPE/cwkaAkzZCeYAm5WeH+/sW+CVJZoJBgtS45T9nAYic1CzV6CQn/2m2pcxReP9befgPmRBPQE
	Bg1X0/9wjkswjeJ/n3hMVsMl3ewIqdiQ==
X-Received: by 2002:a17:902:da8a:b0:2ae:450c:951e with SMTP id d9443c01a7336-2ae82388a53mr13181935ad.17.1772779387493;
        Thu, 05 Mar 2026 22:43:07 -0800 (PST)
Received: from arm-server.. ([2001:288:7001:2724:1a31:bfff:fe58:b622])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm11892375ad.85.2026.03.05.22.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 22:43:07 -0800 (PST)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	ebiggers@kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	yphbchou0911@gmail.com
Subject: [PATCH v2] crypto: arm64/aes-neonbs - Move key expansion off the stack
Date: Fri,  6 Mar 2026 14:42:54 +0800
Message-ID: <20260306064254.2079274-1-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_224308_598344_29387C55 
X-CRM114-Status: GOOD (  11.74  )
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

aesbs_setkey() and aesbs_cbc_ctr_setkey() allocate struct crypto_aes_ctx
on the stack. On arm64, the kernel-mode NEON context is also stored on
the stack, causing the combined frame size to exceed 1024 bytes and
triggering -Wframe-larger-than= warnings.

Allocate struct crypto_aes_ctx on the heap instead and use
kfree_sensitive() to ensure the key material is zeroed on free.
Use a goto-based cleanup path to ensure kfree_sensitive() is always
called.

Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
Changes in v1:
- Replace memzero_explicit() + kfree() with kfree_sensitive()
  (Eric Biggers)
- Link to v1: https://lore.kernel.org/all/20260305183229.150599-1-yphbchou0911@gmail.com/

 arch/arm64/crypto/aes-neonbs-glue.c | 37 ++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/crypto/aes-neonbs-glue.c b/arch/arm64/crypto/aes-neonbs-glue.c
index cb87c8fc66b3..00530b291010 100644
--- a/arch/arm64/crypto/aes-neonbs-glue.c
+++ b/arch/arm64/crypto/aes-neonbs-glue.c
@@ -76,19 +76,24 @@ static int aesbs_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			unsigned int key_len)
 {
 	struct aesbs_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct crypto_aes_ctx rk;
+	struct crypto_aes_ctx *rk;
 	int err;
 
-	err = aes_expandkey(&rk, in_key, key_len);
+	rk = kmalloc(sizeof(*rk), GFP_KERNEL);
+	if (!rk)
+		return -ENOMEM;
+
+	err = aes_expandkey(rk, in_key, key_len);
 	if (err)
-		return err;
+		goto out;
 
 	ctx->rounds = 6 + key_len / 4;
 
 	scoped_ksimd()
-		aesbs_convert_key(ctx->rk, rk.key_enc, ctx->rounds);
-
-	return 0;
+		aesbs_convert_key(ctx->rk, rk->key_enc, ctx->rounds);
+out:
+	kfree_sensitive(rk);
+	return err;
 }
 
 static int __ecb_crypt(struct skcipher_request *req,
@@ -133,22 +138,26 @@ static int aesbs_cbc_ctr_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			    unsigned int key_len)
 {
 	struct aesbs_cbc_ctr_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct crypto_aes_ctx rk;
+	struct crypto_aes_ctx *rk;
 	int err;
 
-	err = aes_expandkey(&rk, in_key, key_len);
+	rk = kmalloc(sizeof(*rk), GFP_KERNEL);
+	if (!rk)
+		return -ENOMEM;
+
+	err = aes_expandkey(rk, in_key, key_len);
 	if (err)
-		return err;
+		goto out;
 
 	ctx->key.rounds = 6 + key_len / 4;
 
-	memcpy(ctx->enc, rk.key_enc, sizeof(ctx->enc));
+	memcpy(ctx->enc, rk->key_enc, sizeof(ctx->enc));
 
 	scoped_ksimd()
-		aesbs_convert_key(ctx->key.rk, rk.key_enc, ctx->key.rounds);
-	memzero_explicit(&rk, sizeof(rk));
-
-	return 0;
+		aesbs_convert_key(ctx->key.rk, rk->key_enc, ctx->key.rounds);
+out:
+	kfree_sensitive(rk);
+	return err;
 }
 
 static int cbc_encrypt(struct skcipher_request *req)
-- 
2.48.1


