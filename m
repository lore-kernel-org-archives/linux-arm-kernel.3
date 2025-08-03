Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3ACC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 19:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SQo1VWDa8L0gOXuwTFV8cUa7G4/T2C+1QUOVeEgYOo=; b=IZNnVWX1skR5ApJp73WhOxSjnd
	W9MTpW1lwbeWxrUyzfpNNHl6DW3tY6fLy2WUHKkX1iQ3TRwIJF88DLQsbk8FOPFo64QgZuLD4ZeTj
	AHfJqYu2KjTh5/sMw7JQCMGf+BOidySeqHPdQo4i8i/z+W4yOH0lYmijSPAiaSjQ4/aMs/5tSCvad
	Nx1ZxjCoRMDoXTwSlBFPoURTQnU8y3/rGFlcX/o18cpwUaVCDamcepgA8ziZbb7EoPdMTquDJ73Za
	J8Dgd31La5vEbWU5DYiqMNObB0YGZipY/rRswq1nVVDfbmdtopNz2GNPDlTtZwyF8IMH3kpEqZ86x
	7uX3hRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uieH0-000000090j4-3eBK;
	Sun, 03 Aug 2025 19:21:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uie6t-00000008zWe-0hGZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 19:11:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so11995685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 12:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248266; x=1754853066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SQo1VWDa8L0gOXuwTFV8cUa7G4/T2C+1QUOVeEgYOo=;
        b=JZ7oC0c69iQBjvh/rMmp5nJxWo9V2ReWeykSruHbU7btCnI5Zua8tMLaweDEAm8FCt
         R7qrj3+xAju0kd7TbnaxwQnmYz3QJcgyYc28/VgGPCiUL98Mg5wEBUADLM1epvWyGaN0
         mt6K+YpdbLM95SAeWmXTNuycIs7WSQ+6IqbH636sViOWAkUc4cjLtqhASdUe/chVSMp6
         On+LEIfzVsH54bxTY44vpaR1fK9IkjL0lyc/5A4GdrTR9CMl2PlxL8QMkwIO28HDETN+
         glFlDC0za/T90/Ci+anKJIMXRsdKT+nTV2cteqDepZt0hz7f6Y7AzuYaQyhHSssjjLPb
         a27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248266; x=1754853066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SQo1VWDa8L0gOXuwTFV8cUa7G4/T2C+1QUOVeEgYOo=;
        b=q4E9sTKQbDvmBMKXkaU/NbCo4fCkV/ig44WqGqQnT0A6A//wjq9dfwM2m6g2yLVOAS
         o85dhxojAKtdiwYmp5LSgkPeTILDxDMQlxktEazJEk2C6j0Q2oBKbH2778be1/+EjK6h
         Kmit/Zsnh5ovh7Ql5Ly0hjqo/vcDqrEvKrXhvVmDr4wF5Xie5iMREpkyAAwA5kNkYo7Z
         JOyTYv2fOXgTM+npHBxJDCdDxJSkw424lJq69/bOK3R5HqifRUhykjKgYS/nYJxdN+kS
         pUz8IcJFZhy5lTUZwRI/cXJAg1J9yB4Zzx0dzNlrd7sgwwFRbWSgEuUPR6oG4W/kVJFP
         Vrdw==
X-Forwarded-Encrypted: i=1; AJvYcCXOUWAckK8OPGV4UO+81i0tAvCE+B46y3AgGnl2ymrrbhLk737PLcCnfmwPiM29fVmBC6QcEPPFUq3459732mbH@lists.infradead.org
X-Gm-Message-State: AOJu0YxM7Ufx4bS7PL7Fy26fqGwqz/IU694X7vmCluiJ8fUE7t88pKwU
	eG4Lfs9gmPcYJC44x2voVLCR/0zTpkHICqpbFZCRZIOkptqJAcn40OHf
X-Gm-Gg: ASbGncs7OicukcxNInFp6LOCa/9vkyK5W9UB728kgSq3mcoeJP5mHEE2k6IhW4og8jW
	zKhjirF//KpVhyzXMxophnvgKvfqBx2/QhUacMMy6wRst0xhJBMuirCMx5Zmx4tq0R0MK9ozLR9
	DAoM8EDpZTyQtPZ3z7XBnu9vGH2ASW7F1ijkiIiHW/3NlDy9gMj39BKzX7vTLFUqT07ChxajPca
	rT6Kc8iz1wYs2a0KzrpttMQnLzji5NEGIxTt++prUML0BTgFhM6AjSuU3ejCa9gUnyClsdzE07z
	uKLnAwUK920rrM9U1AY6FLv+ENInqTP+2jVn1YZZIeyrntb2B4nz/MKJVurVzyMoZd6LNV90Edq
	BkdHOL39phRWCnkFM8Kd9zQTdQkg+IO7aTA==
X-Google-Smtp-Source: AGHT+IGAkLXj89d8+BSh3EqnA4GVIsKBPznnVnW8s4SI6ImldpUHqZ4tb20/Ec2WyIE1Q5fljBDFvA==
X-Received: by 2002:a5d:584e:0:b0:3a4:dfc2:bb60 with SMTP id ffacd0b85a97d-3b8d9481972mr4970990f8f.26.1754248265452;
        Sun, 03 Aug 2025 12:11:05 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:05 -0700 (PDT)
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
Subject: [PATCH v2 3/9] crypto: sun8i-ce - remove unnecessary __maybe_unused annotations
Date: Sun,  3 Aug 2025 22:10:23 +0300
Message-ID: <20250803191029.3592987-4-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_121107_204332_3A4CDAFA 
X-CRM114-Status: GOOD (  13.47  )
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

There are 3 instances of '__maybe_unused' annotations that are not needed,
as the variables are always used, so remove them.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 113a1100f2ae..c57c64a1a388 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -111,7 +111,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
 		struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
-		struct sun8i_ce_alg_template *algt __maybe_unused;
+		struct sun8i_ce_alg_template *algt;
 
 		algt = container_of(alg, struct sun8i_ce_alg_template,
 				    alg.skcipher.base);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 79ec172e5c99..ba30859e749c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -1062,7 +1062,7 @@ static int sun8i_ce_probe(struct platform_device *pdev)
 	pm_runtime_put_sync(ce->dev);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct dentry *dbgfs_dir __maybe_unused;
+		struct dentry *dbgfs_dir;
 		struct dentry *dbgfs_stats __maybe_unused;
 
 		/* Ignore error of debugfs */
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 61e8d968fdcc..df2acef9c679 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -26,7 +26,7 @@
 static void sun8i_ce_hash_stat_fb_inc(struct crypto_ahash *tfm)
 {
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct sun8i_ce_alg_template *algt __maybe_unused;
+		struct sun8i_ce_alg_template *algt;
 		struct ahash_alg *alg = crypto_ahash_alg(tfm);
 
 		algt = container_of(alg, struct sun8i_ce_alg_template,
-- 
2.50.0


