Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88861D3E2BA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rF/BajsA4u9lnrpfeqsxR/4AwVRpiKJbattjpDj/5to=; b=EY5ZpfhOiovREyRxaQudWA3Bkj
	Fi/rvF74hU6ob1ZOw82Tuq3hcKId0gylp89T5gTOASmUw1lqBKd2vU/EtoZH6xEClYzC8/JY1hyBW
	2W7Iv69uyVspRcfknQEABrT+4lb0857tIfMDNb2b0TACKQ7biwsYEKK/mhqE0XXCeoM9OYDbAThJY
	CfXfHT6sbZDmEce4JdZT7X2Q19rMOQlrNz/hPolPpqP2pvRDpZ8pDd0CyUddWSm3CLXgP8s+tskOs
	y+zfw9DrxqUZBGeghQ1BcHa+QJYGfB5divQ0BO4JHUX75lLK7AtGyGt60Zb2wIod6o3ey8mhR3Kfe
	qj/giqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5V8F-0000000BxgG-06x9;
	Mon, 28 Oct 2024 19:10:27 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5V0c-0000000Bvxt-1DF2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:02:35 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4316e350d6aso33496725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 12:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730142152; x=1730746952; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rF/BajsA4u9lnrpfeqsxR/4AwVRpiKJbattjpDj/5to=;
        b=F6hI2T3uV2TSTQk41rO5ZVv/WZuvHxftpINkW+mDrhmqHlIDGfiwx1EhoGqdGVQvZy
         zAJmzw4JfZLina67DpnBcJSyj1fcPMmntgAulNcClJhdWHqvBDsQ0xSt8ahzKi7X/iBy
         8Ph+0RtyEt1acWQivGRQFb6DSOGFk6hrBCPYGnEOmwVuAoO3S4hRRfJJ2wQ1jBxcOIu0
         4JVjvA/9UzpX0fCuy1QyXA5PLTtSZiAMpkxLh69Nfsgcoxw/U/31CWmDWpAp20asOrP9
         11SUG6S0XthOF7OgqwwIVySKP+M9PcUrWShVK9JgflJ2CgddVUvLI/pKqGNMD6aazybh
         WwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142152; x=1730746952;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rF/BajsA4u9lnrpfeqsxR/4AwVRpiKJbattjpDj/5to=;
        b=kseO9xfeJUyi3FZHGnwfirzXtCQvA8X+I1JJ2zI4/wQCaxHCfEyBswqL1Jm8WHUbrb
         6OrRLZh/Xho7BgoYGZWyNZn6OXN+SD1AwgBdH284uLTb7GMt/SACG/z5gDsjK8XUP4Sa
         8p1XTpl7bhE1n8snT5sD6KxBaTowv+NwLYgCdzShXNzhnkjC/yaZGn9Do4oyX1h4izSb
         vVTfmD7MZN6ZHc4Tqr2nPJnt8Caqti7qU31aywhb3XopvLGgERRzJ1pPBNk9GNH9L2QH
         0zy88w10Z6C/Sb0GKeDYOk7nU4AbU+zHm+9WpfYN/gOFNPLQaNXp5y5cTzvAxEtWrRK3
         H28w==
X-Gm-Message-State: AOJu0YwqtG8U9+rCHVZKofB9acssXarUybmn3UzaHjh0JfjfNfOYe6x9
	lJAEtUAFup6AvOiT+YjFkF/Ya2z8l0Pgrh3k/164sP+LwvVmgHcT+085McxkoRaUtzkQbQ==
X-Google-Smtp-Source: AGHT+IHnKiYkcGHQSPrTxUsrUDubZTKuRI+DKoCgVg6SVEfpN0Ad0Wkc6hbgZTQpyG+ynHifIYyUvtxr
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5d:6605:0:b0:37d:5134:fdd with SMTP id
 ffacd0b85a97d-38061238a43mr5286f8f.11.1730142151662; Mon, 28 Oct 2024
 12:02:31 -0700 (PDT)
Date: Mon, 28 Oct 2024 20:02:09 +0100
In-Reply-To: <20241028190207.1394367-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241028190207.1394367-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040; i=ardb@kernel.org;
 h=from:subject; bh=/q+jS0d+3r8GHzPCkmD3ZWCsmDV9ozYENJWU6Pwv9u8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV3+/sYNYuXnd/Tz9v7avEL+xMo6W3MvT/XnAUIr9B3de
 U61hEd2lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIk8CGRkmFO9T69Y62N2abPk
 umULOm3W3XXqjjv3fUXXS8+DE+d4/Gf4p9au/aeo8tia+wcr9ktzRcYfPiXkf+bg7bBpYd0X7d/ fZQYA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241028190207.1394367-9-ardb+git@google.com>
Subject: [PATCH 1/6] crypto: arm64/crct10dif - Remove obsolete chunking logic
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, ebiggers@kernel.org, 
	herbert@gondor.apana.org.au, keescook@chromium.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_120234_354480_3AB72520 
X-CRM114-Status: GOOD (  13.25  )
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

This is a partial revert of commit fc754c024a343b, which moved the logic
into C code which ensures that kernel mode NEON code does not hog the
CPU for too long.

This is no longer needed now that kernel mode NEON no longer disables
preemption, so we can drop this.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/crct10dif-ce-glue.c | 30 ++++----------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/crypto/crct10dif-ce-glue.c b/arch/arm64/crypto/crct10dif-ce-glue.c
index 606d25c559ed..7b05094a0480 100644
--- a/arch/arm64/crypto/crct10dif-ce-glue.c
+++ b/arch/arm64/crypto/crct10dif-ce-glue.c
@@ -37,18 +37,9 @@ static int crct10dif_update_pmull_p8(struct shash_desc *desc, const u8 *data,
 	u16 *crc = shash_desc_ctx(desc);
 
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && crypto_simd_usable()) {
-		do {
-			unsigned int chunk = length;
-
-			if (chunk > SZ_4K + CRC_T10DIF_PMULL_CHUNK_SIZE)
-				chunk = SZ_4K;
-
-			kernel_neon_begin();
-			*crc = crc_t10dif_pmull_p8(*crc, data, chunk);
-			kernel_neon_end();
-			data += chunk;
-			length -= chunk;
-		} while (length);
+		kernel_neon_begin();
+		*crc = crc_t10dif_pmull_p8(*crc, data, length);
+		kernel_neon_end();
 	} else {
 		*crc = crc_t10dif_generic(*crc, data, length);
 	}
@@ -62,18 +53,9 @@ static int crct10dif_update_pmull_p64(struct shash_desc *desc, const u8 *data,
 	u16 *crc = shash_desc_ctx(desc);
 
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && crypto_simd_usable()) {
-		do {
-			unsigned int chunk = length;
-
-			if (chunk > SZ_4K + CRC_T10DIF_PMULL_CHUNK_SIZE)
-				chunk = SZ_4K;
-
-			kernel_neon_begin();
-			*crc = crc_t10dif_pmull_p64(*crc, data, chunk);
-			kernel_neon_end();
-			data += chunk;
-			length -= chunk;
-		} while (length);
+		kernel_neon_begin();
+		*crc = crc_t10dif_pmull_p64(*crc, data, length);
+		kernel_neon_end();
 	} else {
 		*crc = crc_t10dif_generic(*crc, data, length);
 	}
-- 
2.47.0.163.g1226f6d8fa-goog


