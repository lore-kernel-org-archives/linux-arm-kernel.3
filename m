Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09D9C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUzKvb5TvRx6Fh/lfVibG4+MdYfgWiVJxFmOU7Qv3Gc=; b=TIPZt5lu5EXTmtg28P6/WBGWg0
	/DRh4cu+sGCJb3uaaL5BVXu/aFbNah7QdpO4c1am1tHC8al5w8ESLpovf2DSUEyY33ZbQL+tE7ev3
	sIqtupxCoUaKH9n/BK/Zc1UDgudQHV64tQ66gHjC25xyas6Iw0DuTitVntftl3gnrM0Ee4+rRhShM
	FZAdE1ViYJDvRFheBYUGxRbTHS7L2VHMOdGJQ0+qqFVxxWO11Txdzm+tBp6Udm6GSoMNUtCtQZVFx
	kUbnwqaKxSLK7EF7rCaFjSvjc8bDxWsG/dEHXcM6/hY3VBgTVAxLgotAtjNZMDQd2tdg6Y7SkUWUh
	L4pZQj5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0F0Q-000000086qm-3BPs;
	Thu, 03 Apr 2025 07:28:54 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Es2-000000085Jb-0JgJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 07:20:15 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-39123912ff0so230657f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 00:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743664812; x=1744269612; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RUzKvb5TvRx6Fh/lfVibG4+MdYfgWiVJxFmOU7Qv3Gc=;
        b=k8RCU1CkpniJd0mvot9QDjGlDqjJ/zm/GN+cEaYiERgt/1Y8TCrqlZEKwtgHu4vI+O
         Fengk7Q8NQaThHA/TcX4H7S3UHIaLK9SlxqRI4xmk8zUv7w6bOijg7fFvc9JK4PKWzkZ
         Y2/MkpcCdNPa8zxwnPQTvuFiuhenMg4bCwIlPJI1XYNbAYXUDnvuZP499lTYUKoEls4D
         KrZwbUbPxSUtgOH0hb1AYiGBTJhxrzJQk7SEPiBP14KWBOV13jq6VvnoCNo4tA1tpGRw
         Pao4SGEqUxh0sNi31Bp14YPEdX5AFY0RGsoX9liMcWhgJNzKoPPogjXWEvf3sqB47fPH
         0aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664812; x=1744269612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUzKvb5TvRx6Fh/lfVibG4+MdYfgWiVJxFmOU7Qv3Gc=;
        b=HX1jj6bW46VGE2tn9Aja3OwD10EjGUTqZbSzXzm0Hy5tA5lXt1FNG+Zh3HlfZdAo9n
         z/lMIh9Dv1O1Y9cLdBX83gNZvdUrjB8hMY8Y8tDxcSC8mn9WMMEdysVJ3arVxDDPUdo9
         LjDtHQrj8VBqM+QzJgCutvuYG23W4mV0clIznICcoVCzxrtOxR8PoINV01bwkX0iCz7I
         jUtCihozBIOauo9RN0QC5luDvYOl41Yn73WzLQbQdMG7cTPiloVP2rLgcdQBwXHurQeq
         VmcOcPrBxwoVUvNYsP+L5ApJcZu6FfNtw3m5LVq12JhrmIrvjT3Tmfsjsb4pp5NmoJuL
         eSxA==
X-Gm-Message-State: AOJu0YwcXKpAaXxOIC7ebyUVe7M1cznDMmYpXkFCb81djsVETXQrfA0Z
	ze29oIGHJn5KBv1ecYV4yYVxLCLiMkR0QVI3uc1YXTIEAb9Lpm57enXJBQCuYWDEYIIrkw==
X-Google-Smtp-Source: AGHT+IHCRTzzAmaHj71ujYKp+6dY6zspnecNvz85zvBYMg2Wpc0MY3Se5dOynzqdS7ZkhAERQdC4iVFF
X-Received: from wrtx7.prod.google.com ([2002:a5d:60c7:0:b0:39a:bcee:e7a1])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f8c:0:b0:390:eebc:6f32
 with SMTP id ffacd0b85a97d-39c1211c6cemr17627581f8f.48.1743664812405; Thu, 03
 Apr 2025 00:20:12 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:19:57 +0200
In-Reply-To: <20250403071953.2296514-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250403071953.2296514-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940; i=ardb@kernel.org;
 h=from:subject; bh=sXgJMqJU5B13l3xARHILiOCuMf8ZrNcROv+DWkjDfzw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf2d2QLJt3K/10yX3hczIffyuq1TXUovy1Vf6Pow9W2VZ
 4XZzVy9jlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRe08YGU4vWvxzS1krC6/N
 yWkizSxe783bVmxyeFi5XyHywwnTuHBGhlfrOuYaX5Nwv526oul+Rdwrry07OQ1XL3th//3bt0b W1+wA
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250403071953.2296514-8-ardb+git@google.com>
Subject: [PATCH v2 3/3] crypto: ctr - remove unused crypto_ctr_encrypt_walk()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, herbert@gondor.apana.org.au, 
	ebiggers@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_002014_115828_D0F8D344 
X-CRM114-Status: GOOD (  12.12  )
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

From: Ard Biesheuvel <ardb@kernel.org>

crypto_ctr_encrypt_walk() is no longer used so remove it.

Note that some existing drivers currently rely on the transitive
includes of some other crypto headers so retain those for the time
being.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/crypto/ctr.h | 47 --------------------
 1 file changed, 47 deletions(-)

diff --git a/include/crypto/ctr.h b/include/crypto/ctr.h
index da1ee73e9ce9..c41685874f00 100644
--- a/include/crypto/ctr.h
+++ b/include/crypto/ctr.h
@@ -10,56 +10,9 @@
 
 #include <crypto/algapi.h>
 #include <crypto/internal/skcipher.h>
-#include <linux/string.h>
-#include <linux/types.h>
 
 #define CTR_RFC3686_NONCE_SIZE 4
 #define CTR_RFC3686_IV_SIZE 8
 #define CTR_RFC3686_BLOCK_SIZE 16
 
-static inline int crypto_ctr_encrypt_walk(struct skcipher_request *req,
-					  void (*fn)(struct crypto_skcipher *,
-						     const u8 *, u8 *))
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	int blocksize = crypto_skcipher_chunksize(tfm);
-	u8 buf[MAX_CIPHER_BLOCKSIZE];
-	struct skcipher_walk walk;
-	int err;
-
-	/* avoid integer division due to variable blocksize parameter */
-	if (WARN_ON_ONCE(!is_power_of_2(blocksize)))
-		return -EINVAL;
-
-	err = skcipher_walk_virt(&walk, req, false);
-
-	while (walk.nbytes > 0) {
-		const u8 *src = walk.src.virt.addr;
-		u8 *dst = walk.dst.virt.addr;
-		int nbytes = walk.nbytes;
-		int tail = 0;
-
-		if (nbytes < walk.total) {
-			tail = walk.nbytes & (blocksize - 1);
-			nbytes -= tail;
-		}
-
-		do {
-			int bsize = min(nbytes, blocksize);
-
-			fn(tfm, walk.iv, buf);
-
-			crypto_xor_cpy(dst, src, buf, bsize);
-			crypto_inc(walk.iv, blocksize);
-
-			dst += bsize;
-			src += bsize;
-			nbytes -= bsize;
-		} while (nbytes > 0);
-
-		err = skcipher_walk_done(&walk, tail);
-	}
-	return err;
-}
-
 #endif  /* _CRYPTO_CTR_H */
-- 
2.49.0.472.ge94155a9ec-goog


