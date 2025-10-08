Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A4CCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aOpjZgoFTagPU2U7+lhs7TWsUUBL3VjC18ylyP94Gs=; b=QTmCXZ9agEMZBG7U0WgCUx90XF
	iZo0hASFGrZm4xMaP0W2iU87WzrBF2IKpH3QrVgASoG+cjaxQZPMpyarWJxN5vz+eN9JkX+N49jDP
	I+sqihgrhAvGfwnCiLzn7IfEWDtPOnDy959HZx/TrDiwpGFPWwZ2Hrh00ZoK186RN4pJavm8aRABR
	49QrTL7cDAGzucy5xpVU9vwr/nanMMZy/sIATA8cS6MsyXwLEbmGwu5ow2eqPFKxuZ1E+mmgKyKnI
	lvlInIGcuzBEp9Ivu2mizoqHT+CEhZDORHKe8aR2wH+HU0NfmMABtLhCsRrNm/zEf1e3lY4hk/Onw
	R02uwjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNQ-00000004BI5-2Qsv;
	Wed, 08 Oct 2025 15:46:52 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNN-00000004BFO-144G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:46:50 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-6232f49fc79so8748390a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938407; x=1760543207; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0aOpjZgoFTagPU2U7+lhs7TWsUUBL3VjC18ylyP94Gs=;
        b=y4OIBeNEPuTr9tyo2IA3vGRirLJkmA7inIhqKeGKRTUCvv/30HidYZfCgEpZUYzCUH
         gOW6g2w4wV5dOb8lJjhiOwKsFqp6CBE3NNg/drnXijOZlUJh1C03qNlwyKD3lrxEhpNJ
         hIhfMYgUCIO5xVyJP7esSRTAT7hgg7xNwIeBbwIX7BYjQNwz2sT/fb3vyPkCIlLLXRk5
         SvbYG1IGnd5/PQXgVLpjbvBWNaPI0eVE/aBGKvN+X2oz6jroUs9u+EKamr9ry0kKq+RU
         /07mtej2ieIh3yQ++bdZEuiYfNe/4GHTWKHAH1Vmb0g1ArVxZ/23Kz1AdhWb/5hExi4C
         Z//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938407; x=1760543207;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0aOpjZgoFTagPU2U7+lhs7TWsUUBL3VjC18ylyP94Gs=;
        b=ryUIvFCKD2xgRk7p7taWah6OUrZk+XsLYpipmJTiClrTxZMLli4kRaaevSxE0FPJ0X
         jH0EktVrGSj0sr5gWSeOvnyfzPgTuQMxwGH/+wDKTo0UvCXOIzoQTRID0z4F9jMjIJB3
         DmMvcXb3alikoGQ0HDNjpOFn2/tAA9+Gr+oUWLVNob+tooG1OJRfNJGdoUOvp6yn6P2s
         u9WCJrRZSCwe8u1OS40nN2DhED7Q3AX7CWm8mlWqxlSPcCBECdDFxoeyPISaHCbYxPwd
         PTkWzan+PQw+Ob74qxaFs3OHUqfOyo+biLE2QmHCOE2NHtKUfyx2nH3mynoDoqBjfJb9
         zSTw==
X-Gm-Message-State: AOJu0YybP8NjS+qzXbQ9OW3+6OqVTJAs5/+HmhVs4LU8U2ddLuftQtVI
	pmvynE2d7UA/PyL6ZO5oRCmNhT4IDwRCZ24eYuIMbl5EP3tbxBxPsJb/X9XzfzbQrBGN5FAI0SV
	TMal+q/nCAMNnQMhAfav4Iqb/bPYF5b8n0XTI02EtgHiWMgLG4UaQDeedFBqDG9jRXvtrXbAsfQ
	hPcAxeEi/4uLuxSYUuOEHbHe8BNB85FiqiR9LcbstUGVUu
X-Google-Smtp-Source: AGHT+IEjXfSRLqs1LdB6T1FDKUwIpLPy5cDnenPLXjF2fx7wJgZU+J3eEdql/LMEKYHPQ3roG7kHp6XU
X-Received: from edzh6.prod.google.com ([2002:a05:6402:946:b0:637:87fb:3b14])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:518a:b0:639:6bc8:c7bd
 with SMTP id 4fb4d7f45d1cf-639d5b89335mr3498965a12.15.1759938406837; Wed, 08
 Oct 2025 08:46:46 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:36 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857; i=ardb@kernel.org;
 h=from:subject; bh=j9GSsyZWNvCHsZ+73xBchQmAL5ZAXeZZs4NWX80DqD8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu8rfJAkfjdO/9vefY02Zc5ad2+qC2S4lbn8HkaMf6
 6Lv5f/qKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPZbcXwz5j/pePnsrXLRIR8
 Hq0oNPfN4NuQPeX7guViSn0WLx5O92L4n2s8Y/Yhht5nll/sv2RFRi8UzXQ75xt2sXyZqpx+ilA yAwA=
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-25-ardb+git@google.com>
Subject: [PATCH v3 02/21] crypto/arm64: sm4-ce-ccm - Avoid pointless yield of
 the NEON unit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084649_309611_71A775D2 
X-CRM114-Status: GOOD (  14.73  )
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

Kernel mode NEON sections are now preemptible on arm64, and so there is
no need to yield it when calling APIs that may sleep.

Also, move the calls to kernel_neon_end() to the same scope as
kernel_neon_begin(). This is needed for a subsequent change where a
stack buffer is allocated transparently and passed to
kernel_neon_begin().

Acked-by: Eric Biggers <ebiggers@kernel.org>
[ardb: Simplify convoluted logic]
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/sm4-ce-ccm-glue.c | 25 +++++---------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/crypto/sm4-ce-ccm-glue.c b/arch/arm64/crypto/sm4-ce-ccm-glue.c
index e9cc1c1364ec..e92cbdf1aaee 100644
--- a/arch/arm64/crypto/sm4-ce-ccm-glue.c
+++ b/arch/arm64/crypto/sm4-ce-ccm-glue.c
@@ -172,35 +172,22 @@ static int ccm_crypt(struct aead_request *req, struct skcipher_walk *walk,
 	if (req->assoclen)
 		ccm_calculate_auth_mac(req, mac);
 
-	while (walk->nbytes && walk->nbytes != walk->total) {
+	while (walk->nbytes) {
 		unsigned int tail = walk->nbytes % SM4_BLOCK_SIZE;
 
+		if (walk->nbytes == walk->total)
+			tail = 0;
+
 		sm4_ce_ccm_crypt(rkey_enc, walk->dst.virt.addr,
 				 walk->src.virt.addr, walk->iv,
 				 walk->nbytes - tail, mac);
 
-		kernel_neon_end();
-
 		err = skcipher_walk_done(walk, tail);
-
-		kernel_neon_begin();
 	}
 
-	if (walk->nbytes) {
-		sm4_ce_ccm_crypt(rkey_enc, walk->dst.virt.addr,
-				 walk->src.virt.addr, walk->iv,
-				 walk->nbytes, mac);
-
-		sm4_ce_ccm_final(rkey_enc, ctr0, mac);
+	sm4_ce_ccm_final(rkey_enc, ctr0, mac);
 
-		kernel_neon_end();
-
-		err = skcipher_walk_done(walk, 0);
-	} else {
-		sm4_ce_ccm_final(rkey_enc, ctr0, mac);
-
-		kernel_neon_end();
-	}
+	kernel_neon_end();
 
 	return err;
 }
-- 
2.51.0.710.ga91ca5db03-goog


