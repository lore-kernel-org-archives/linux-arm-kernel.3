Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940D6C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7TxIVacK4CiPP85Zm/zWINHMIm3Lw/0BaBVswTN6EM=; b=FVFfTZHzy1A4/LIerYiw/Pyj5Y
	+l8J9gvAjEJspkt7bgYYdDwQOu8bQcqZ4BFBU8bTIHpTmeBNeaO2ol7smA3dKAyLKacx0vzjO1fBU
	RjEwjm6xTru6gjn2DW6v3YurgH3VWc2wWTgH6CYn6xaq1WJ4hXtl14tEZ60OK8e7d63PeD4tCg2AC
	ywQAGl5Y9BRGcr0Dj9avQzJIG6T3iTzpUF2uuHjVh7Cu1EivStK6/zS3Xaxw9Nj5XShPjH29cNdwV
	vv3pVRDr/iEWSkfEjOhzFpgfuWafqG782oIrwHBFPPUvuBuC6fkhmSsiHreCK9CH7xHRaUGynGJbQ
	CDRWsxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r3y-000000043dH-47lq;
	Tue, 22 Sep 2026 03:20:58 +0000
Received: from mail-pj2-f42.google.com ([74.125.227.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r3r-000000043ar-3nmo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:20:53 +0000
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so14901235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 20:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047251; x=1790652051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7TxIVacK4CiPP85Zm/zWINHMIm3Lw/0BaBVswTN6EM=;
        b=Gh1y3rV4aWrhrYSUNV+6Alkzwa/6jyrmdM7aqZLu7nlTH3aR28wKQMZ8mlobaHix1F
         Q+lCXREo10xmRWAAieWzElZLiUQj9p1182jdTzYvPR10ZM6vOH4zLxWuEhHqYnYCzBtx
         FCzBMUnH+SXsDFNT5U6Nzshu86z7XD9euSUaM1QFsrSoYnwIMsAuK8z7vuIPQiRE0F5n
         TR+2chTtwQy/yD7apTIHbeJoweOXkn6Jmfm22TxrM/Ledr4+UhNqA1iajLboHMGJRhNh
         Uqf1CngrdMNKPUe099eDTfCozwHWiuhHhJhSCuH152fEBZMMDC1gLUTB/aqfocU9NMRu
         Gg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047251; x=1790652051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7TxIVacK4CiPP85Zm/zWINHMIm3Lw/0BaBVswTN6EM=;
        b=Qbp62LsWVlYnxTBXE1GPh/PNUw1NF1w4fROkjo7fg0RGvh6JeJ/jSyHP8mvDdVi7z+
         oxZP8TfAs487x3UfYwpt/0rkIW5wGwxukORuqJHzmSugSdc3A9CCCyZYcNq95ysBFz7g
         HB/JwuzexxhFsDHqy0I3tMjCMuQNKN4WYi0wRq2spKeiA6N0ZCaKyB10Op6v3H+2j7ga
         FAhG6pr1NEQ6Jq4Lwp78pFHCGPa7h5R3YO5ED7mTrwlPIpZt+d7Tcta6eBpUZHA7yqWt
         2+WV8Fl/qI4wIMnxEo2lIFuC+muvycOL/5JdU/XNYbhBe+/VuVR6jYUIKOnKbQ2M5w4v
         6xYA==
X-Forwarded-Encrypted: i=1; AKwUvBwj6l7+JXyq10MsVNprLv3kovo2R08S32C4WhmDcpz0r4YX+ShJcdQ2nJZin1KjVLssX5o2IvaI15CAPgVPEtuA@lists.infradead.org
X-Gm-Message-State: AFuF++lUNwsfhpwFqkJQdIxm2MzZOieS0m0rCtQOU7K6m4buUuPzhkRf
	HfXLL33w97sev3+ySBvhHOkd/VUCpcIrsa829t8jYhwhoUVSp7yuFUhT
X-Gm-Gg: AYBFou0aAuh0nAFMHH5F/k/QlAKh3lUjkvyTmi2S63sM0zZRJhQ2WD++wyMfhm+Hlez
	d2SBFSkrqMOaScVLxeBozbrEopAulZDxoHynRx9XBKuI1EUp25+ODBJ6kkSr/S+62wzTdLT/OZJ
	Ypfy/28EAfeS19tkLl7h7AyOAK7CVqiEXTUMBF1Gz5UMyPRf8NIKAvpk/MI3CU7weyBxdGQOM8u
	Ct3OO88X4kxLiUs83NTSu12WSkqpxxADbPR9fNmJWHHmV/93bTMcUHW+b2CQWRJgKGczo8qyLKx
	XWmyXxE+SX8mESQM9ZEQwVnuON6F77lWaBn5phPHiDogxgtSTfYd0eknVzGIaWFxo00MMOIFPLp
	qx9rEb+sWsVE3aee3yHSU63IrQXwGWlPlwc1Jufrnto9lxF4Nf4itAqMH9tW2Xba8iH/UrSiWN8
	dX1kDNHUKvu5zciveF+stB+DFfBmmjzATPohd1o4igOlAZb3KN6WGyuU5mRHGfbvFJNbZxdqv0b
	mL7n7ynvoXA1/rvn6lQq/PG2O2fPV8YNH2H43vk1kfdM9/y8QoLLzC4I0Zrq84P1NXZMImKLOMj
	x3fMZxE6QmGapUTmrcN6Ubft
X-Received: by 2002:a17:903:b84:b0:2dd:c053:82fa with SMTP id d9443c01a7336-2ddc053843cmr122847195ad.49.1790047250783;
        Mon, 21 Sep 2026 20:20:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5cf83512sm1940355ad.5.2026.09.21.20.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:20:50 -0700 (PDT)
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
Subject: [PATCH 3/3] crypto: sl3516 - Use pm_runtime_resume_and_get()
Date: Tue, 22 Sep 2026 10:19:54 +0700
Message-ID: <20260922031954.320895-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922031954.320895-1-phucduc.bui@gmail.com>
References: <20260922031954.320895-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_202051_950048_2E9754DF 
X-CRM114-Status: GOOD (  12.76  )
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
 drivers/crypto/gemini/sl3516-ce-cipher.c | 3 +--
 drivers/crypto/gemini/sl3516-ce-rng.c    | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/gemini/sl3516-ce-cipher.c b/drivers/crypto/gemini/sl3516-ce-cipher.c
index 02ec4282333b..eba46aebf176 100644
--- a/drivers/crypto/gemini/sl3516-ce-cipher.c
+++ b/drivers/crypto/gemini/sl3516-ce-cipher.c
@@ -331,13 +331,12 @@ int sl3516_ce_cipher_init(struct crypto_tfm *tfm)
 		 crypto_tfm_alg_driver_name(&sktfm->base),
 		 crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)));
 
-	err = pm_runtime_get_sync(op->ce->dev);
+	err = pm_runtime_resume_and_get(op->ce->dev);
 	if (err < 0)
 		goto error_pm;
 
 	return 0;
 error_pm:
-	pm_runtime_put_noidle(op->ce->dev);
 	crypto_free_skcipher(op->fallback_tfm);
 	return err;
 }
diff --git a/drivers/crypto/gemini/sl3516-ce-rng.c b/drivers/crypto/gemini/sl3516-ce-rng.c
index 76931ec1cec5..19af03b03e42 100644
--- a/drivers/crypto/gemini/sl3516-ce-rng.c
+++ b/drivers/crypto/gemini/sl3516-ce-rng.c
@@ -24,11 +24,9 @@ static int sl3516_ce_rng_read(struct hwrng *rng, void *buf, size_t max, bool wai
 	ce->hwrng_stat_bytes += max;
 #endif
 
-	err = pm_runtime_get_sync(ce->dev);
-	if (err < 0) {
-		pm_runtime_put_noidle(ce->dev);
+	err = pm_runtime_resume_and_get(ce->dev);
+	if (err < 0)
 		return err;
-	}
 
 	while (read < max) {
 		*data = readl(ce->base + IPSEC_RAND_NUM_REG);
-- 
2.43.0


