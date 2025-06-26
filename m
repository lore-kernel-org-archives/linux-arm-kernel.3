Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2D5C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbU44eJvfJDBcTZ+xWKQo+1cPwZ/TlkyCXqSjcDCqLQ=; b=28mH0W3hLwbZQcjeBPTYMbwMPq
	5WWhdCEWUveoLnMTj8bGn2nOTZCRaahZJXy9xd+ZvFdcfliAM/oB4ytSSbTQkSvrSHGH67HyRVK2y
	B1LP7lEmM/4aJKb/2O+1MvSK/l5dJh51QxGSSS7UGradh647ZEEc0bzNlYnhoDj0KS6XXv8Oe0qV+
	F9EJk8EJBNt56ZFPEiNEvlIf+HlcLA5YewZoTfsKvADWOgGwHHeLPHK9/eTLWXz6lQszxk98sJ7i4
	xvFUYmHZYFQTAsu558/f/gDLdqI7DIHF2HqmvoU3QKeJUyZJ6oNtk/o/P/FA4S4RXvpMjOrzHVX2q
	L8xz15ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkgx-0000000BNwc-30Hr;
	Thu, 26 Jun 2025 11:22:55 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjO4-0000000BDrh-1XYy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:59:21 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so1429812a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931959; x=1751536759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbU44eJvfJDBcTZ+xWKQo+1cPwZ/TlkyCXqSjcDCqLQ=;
        b=JgIEFxZ1O5bnVuUFlXqqN8SXVxKZAYrzE730FjKT0tBXjNMMzj+f0eVLcO/XABNbfp
         Z78N+kuyOnxQEaQkz8EJB0O9ll7/tbHVnkuKTeGeNjccFkLMXyQmQokCtd9W+LkSjYvh
         s5l2yFw3ejmMMZKJgiN2VmuM4HifVMErW5jZ4u6zmgLMpjxj/aneP7EYkPJIceMzeLjK
         OoGzEjZ/l3k9diPSogQFrSSEsT5sQmzRThUdAj+vIK1UPPM/EqD7MvVgR4zcJfk8PjLC
         3g4uneJFbvE43j61y3n26+Wif25y62ieRbnX+o8O4VbpIFrLFxEIWrUnjcYPcAggooCK
         4N0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931959; x=1751536759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbU44eJvfJDBcTZ+xWKQo+1cPwZ/TlkyCXqSjcDCqLQ=;
        b=qshsfYpfolB55UXwv6+oLbPB80WypMOLSc9jHr9O9qCPci27iO4FCc4iQCFKmYVy/j
         v8XJIRHVm4oYjz9xmchVjPEJgNeBS5eA0fBLVDpm8iSk5Ax8v+NXoW14f7zfCieGY4zM
         JMfAihYfgfFoD59RokftGiqqc4YsAZ8mOBLg6fZAOpDfT755tjdmpEPMlQMSyS/HsvSB
         x9PWS0PAIcC3E1cb9AvJv5E+TdZ6QCdVuDLr0rdL/WTNipg69HsQiCVmbRMNN/CHHpGq
         q3izZBgcntp0ipEsZiOfy5Z7c/FiYvIUherBxXk5Ki54dYI3X7RTJ8FVZp92o/gCvV2x
         BGag==
X-Forwarded-Encrypted: i=1; AJvYcCV8PgJwFt0/qMCwvcUUyInNbejvwzGKjcaJo0LZaQDY7Xlc/Pdl9Uyn0XB0G+ryMyjypsF3civTVevbH6hilvVF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+LUFQZ/V6hh98QIRaOrRnsPSSNngbVZtnOyglbgnOdyiSRFCe
	SpTLchWe5ZUhEBTR7fUiKuut76vsgBkObzgkvHuczJQP4i02GHv0FoWa
X-Gm-Gg: ASbGncsbBVni6Yu7gbPbyuMMc+DJ6RbuVTFx+egIA/ziRTHadQVpLfIIZyQiBBc0HDD
	luR/RgdA5TYUKJzqXp/q4HNPk8TYXK7YhqS3w02v9dfV5WqchhLJlRYaN08ifiiULPz63LwlWek
	oEtCcI+6XPJSCj18uPpVCQfFaWm4g4vJ9P2OMxpKcBU3ZpkUCwrFTDnB5S8rrKcQVUr8/oT8JPP
	NBYuHLoYzoopzitLlfo7p7zBX6dB8fwMj5g3MzPWiJEkIWU5+Ly0Jr879cc+2rFWvdwKOF9yIBJ
	mbqWcVSyx0lBPjEJQhKZEa7TeVWy341gTImDnr236o4tJnjscN+j3Mg60BdgAQfI+AGNrwmDT8i
	idBhzh+VFVSsX/g==
X-Google-Smtp-Source: AGHT+IEaMXp6A7i8DWJAL63v7SwwWZbY3qhE9qWDgXfE0g+LUPmTke+IYpv3zr+vGVl6rNn5ZDE3ag==
X-Received: by 2002:a17:906:360f:b0:ae0:bc2b:61cc with SMTP id a640c23a62f3a-ae0be84e3e8mr577634666b.14.1750931958448;
        Thu, 26 Jun 2025 02:59:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:18 -0700 (PDT)
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
Subject: [PATCH v2 01/10] crypto: sun8i-ce - remove channel timeout field
Date: Thu, 26 Jun 2025 12:58:04 +0300
Message-ID: <20250626095813.83963-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025920_404686_AD492293 
X-CRM114-Status: GOOD (  15.25  )
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

Using the number of bytes in the request as DMA timeout is really
inconsistent, as large requests could possibly set a timeout of
hundreds of seconds.

Remove the per-channel timeout field and use a single, static DMA
timeout of 3 seconds for all requests.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 5 ++---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 --
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c   | 1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c   | 1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h        | 2 +-
 6 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 5663df49dd81..113a1100f2ae 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -276,7 +276,6 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 		goto theend_sgs;
 	}
 
-	chan->timeout = areq->cryptlen;
 	rctx->nr_sgs = ns;
 	rctx->nr_sgd = nd;
 	return 0;
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 658f520cee0c..79ec172e5c99 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -210,11 +210,10 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 	mutex_unlock(&ce->mlock);
 
 	wait_for_completion_interruptible_timeout(&ce->chanlist[flow].complete,
-			msecs_to_jiffies(ce->chanlist[flow].timeout));
+			msecs_to_jiffies(CE_DMA_TIMEOUT_MS));
 
 	if (ce->chanlist[flow].status == 0) {
-		dev_err(ce->dev, "DMA timeout for %s (tm=%d) on flow %d\n", name,
-			ce->chanlist[flow].timeout, flow);
+		dev_err(ce->dev, "DMA timeout for %s on flow %d\n", name, flow);
 		err = -EFAULT;
 	}
 	/* No need to lock for this read, the channel is locked so
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 13bdfb8a2c62..b26f5427c1e0 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -446,8 +446,6 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	else
 		cet->t_dlen = cpu_to_le32(areq->nbytes / 4 + j);
 
-	chan->timeout = areq->nbytes;
-
 	err = sun8i_ce_run_task(ce, flow, crypto_ahash_alg_name(tfm));
 
 	dma_unmap_single(ce->dev, addr_pad, j * 4, DMA_TO_DEVICE);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
index 762459867b6c..d0a1ac66738b 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
@@ -137,7 +137,6 @@ int sun8i_ce_prng_generate(struct crypto_rng *tfm, const u8 *src,
 
 	cet->t_dst[0].addr = desc_addr_val_le32(ce, dma_dst);
 	cet->t_dst[0].len = cpu_to_le32(todo / 4);
-	ce->chanlist[flow].timeout = 2000;
 
 	err = sun8i_ce_run_task(ce, 3, "PRNG");
 	mutex_unlock(&ce->rnglock);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
index e1e8bc15202e..244529bf0616 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
@@ -79,7 +79,6 @@ static int sun8i_ce_trng_read(struct hwrng *rng, void *data, size_t max, bool wa
 
 	cet->t_dst[0].addr = desc_addr_val_le32(ce, dma_dst);
 	cet->t_dst[0].len = cpu_to_le32(todo / 4);
-	ce->chanlist[flow].timeout = todo;
 
 	err = sun8i_ce_run_task(ce, 3, "TRNG");
 	mutex_unlock(&ce->rnglock);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 0f9a89067016..f12c32d1843f 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -106,6 +106,7 @@
 #define MAX_SG 8
 
 #define CE_MAX_CLOCKS 4
+#define CE_DMA_TIMEOUT_MS	3000
 
 #define MAXFLOW 4
 
@@ -196,7 +197,6 @@ struct sun8i_ce_flow {
 	struct completion complete;
 	int status;
 	dma_addr_t t_phy;
-	int timeout;
 	struct ce_task *tl;
 	void *backup_iv;
 	void *bounce_iv;
-- 
2.49.0


