Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1EEC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzO8DkUvhWLKnOUfdtsb9HGsluFZoqS1EuEZMi0Rqzw=; b=QJf6nYH4rElD7uPoBW3hjtor26
	YQgxyyUNxDULrp+BWUkNTAy1xvIhxaiYsdAuhb9pIDCWhQTx+QEkQ955kmxenkZkjHjevYQ0K/LSx
	3ey6YR1R98zKm8Fe0DtMysFxGBy9vKbcP+yCWwCXWxJkkOQgeqR1UBZR/3BjTPnWKdE9aa4k7Z/ME
	E1me+pCouD6Ken8u0JGOP16fQxqy3nzwznu56/glWxyRln6DnJETwFGRrL1y9zj8AyFhoz+6nqmh0
	tAhDZ5R54fwxg+nC/BSTG0CezJNwDvEV/76sXzc8/jlmrRZCe6q1iWL53BeiAsHgxgHOwkdnVdqaP
	9vNrgYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r3y-000000043cz-3hGT;
	Tue, 22 Sep 2026 03:20:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r3s-000000043az-18LI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 03:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kzO8DkUvhWLKnOUfdtsb9HGsluFZoqS1EuEZMi0Rqzw=; b=PRl5uaO/uzaFD9n47tGOiIng8m
	yHvx+aIF/taF+itctleHjT2G48c4s93i8PjD1C13ZOoYZIqaQIkhXZ+LjJBE0zYSr6/OxG+4zxB+t
	3vRQBeCWOnma32VFMOYz9Mza/ioBfM4QPtuLNWhKVAHCUsHOwWqsrp/qBBDfhhZJGCOV0RKlItz5b
	03MSO3CcS5E/M2TBwh6lE2TMdhA0GUF9tFTZqT+X6eNjUMYZ6N5o7J5m/qnqViw34xAQGf+F/raMa
	irsfOudutAqv7ycTUwyFkIWtf68mA8BFNiF4Tbot3XiDV7K9sDkHOE2AUjjMXyc4QNxiWI4t9uokO
	LSTqbMCA==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8r3l-0000000D39e-0S4K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:20:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2caced6038eso5958255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 20:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047243; x=1790652043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzO8DkUvhWLKnOUfdtsb9HGsluFZoqS1EuEZMi0Rqzw=;
        b=Fez/ryJAohJ9qQeUPy7gNyHyDG5RJAnrtNhC3rvuPm+TiG8rznoIWZKita7G30VZk2
         qFOpuGt/B5bnWS/v/Fde6SJRan7gz3LXQzsM74pafUyIoYE3O4YBTBUxmT0B2zMAzS+W
         aeM0fukwlch9GRrtXK9YsGQCgVG4dEp+CXdE3D82ltkrVM7L5M47VcrSstMyZSbCuKcc
         h/7fNK10RpWl5T8fTexwpyMvsSPQnnBrBrBYHEOjxxlmx8l+OFU8qJ6ciNGoLw8MRdK8
         OHpp/3efQ6T7eNZA+muJWiB7VhK1/hNvq7z3jZakJ0mi6Nc1FlZxceC6VM4K+o8UuUWv
         55TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047243; x=1790652043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzO8DkUvhWLKnOUfdtsb9HGsluFZoqS1EuEZMi0Rqzw=;
        b=lNFbJtfwmVi9Zglrix8M8i+9PNQ7nCrpYmH8iJKrNalEDzOvdlUZr/lniOWylSeUt8
         Zq7aecNJEoTSurGsY2aFY+ANZRgi0BeUOCVHidnyaEjK775QFI43tSqe2Ek/jTo7yUoN
         aip7paL/59M3HTsAIq82QQdPE/y50Thlsj1C0no498p6Jjj0H+SIlTNFzZ1Wgontbu56
         o8Tgt3nqW+8uR/Vr9yLMG5lJua3iEA3rMglAlPXzOJBDAGHRyqEq24/sjFf9tum1F3at
         lpnbJQKwAnmhm5eGeIC/BQEY9NSSQAKNDcdLyi/fAnGRQM5IwMFnBezi31fhyUSKPvRZ
         D++g==
X-Forwarded-Encrypted: i=1; AKwUvBwpAEGoWqk3Y+i+eAgvMf0wg47OmJhq18bmHAkkYPyxKP9CjIRAAhiwcHVKqS9+hlKxftoVLxQ5HirtI36Mdfnq@lists.infradead.org
X-Gm-Message-State: AFuF++m8a1xLNyrVltTpoHtlV8jZrqsKiu9FBnji4PLbyKSWLxttfN0L
	EFSkjfUiY1uYS2Nl8zBF6Ix1sv2BCu8fDpbB8wUfLwnBjTrfZQhiohsU
X-Gm-Gg: AYBFou0pCrm9q0+MGp2DeeaUfS2RxeHqC2fl1r9/TAgASOfwMLV3Mccvdb2255znpce
	3rpj9gCmVzyASxX6pOkac+WjSS+P2r7oLZy5MRqaX9+7zJPtpXXMPfEip2H3WuY8lEF8ZGblw1p
	LadfOfdgDg/fq29qy64/bm32tMA6l4C2UdxwIn/y4fGBON/q6A5KwaYWGAcQJb1HpNtvTVQQ8ap
	UDVIDi358flXsyOmM3Mp3YxJdm7BfusJd7Z9y9md2L0oG3EgpDvPV/L/UBtMvzjfBNSVu8GMwSZ
	vwlNrr+HOMR3QWzcuB8d7efaqjKF3rz0umFHJEFFOEqDDEVMx3+dPTDKgE9KHr7I/PQybKSffXM
	deX/PDy5UXd98Q2Ka8OQwg1H887dPYKftJv2kWjNOE2v505YNVrMYKU0+ErSEgbCzpuD+Tt6TAl
	gJDmg4R43zwACz5huOCUkgRRA6VwFebNdhr0S3+fscIpd0GaH/K5mmvtB3o7fk60PKFbp/ISoiU
	tGC8HYKxL9Wkokx7KoFe2ujFRmmuxt1o8Zv47VPj+Of2sOHi+PWTovfs70klR1mHvc2e32574XG
	3oy7/BaKoLxzfVY=
X-Received: by 2002:a17:903:1983:b0:2dd:a937:9bfb with SMTP id d9443c01a7336-2df597ad4d4mr12177235ad.10.1790047242649;
        Mon, 21 Sep 2026 20:20:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5cf83512sm1940355ad.5.2026.09.21.20.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:20:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] crypto: sun8i-ss - Use pm_runtime_resume_and_get()
Date: Tue, 22 Sep 2026 10:19:52 +0700
Message-ID: <20260922031954.320895-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922031954.320895-1-phucduc.bui@gmail.com>
References: <20260922031954.320895-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_042047_031062_283D144A 
X-CRM114-Status: GOOD (  11.00  )
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

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 36a1ebca2e70..56ba4ff6d5ff 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -120,12 +120,11 @@ int sun8i_ss_hash_init_tfm(struct crypto_ahash *tfm)
 	memcpy(algt->fbname, crypto_ahash_driver_name(op->fallback_tfm),
 	       CRYPTO_MAX_ALG_NAME);
 
-	err = pm_runtime_get_sync(op->ss->dev);
+	err = pm_runtime_resume_and_get(op->ss->dev);
 	if (err < 0)
 		goto error_pm;
 	return 0;
 error_pm:
-	pm_runtime_put_noidle(op->ss->dev);
 	crypto_free_ahash(op->fallback_tfm);
 	return err;
 }
-- 
2.43.0


