Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C257CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8r3QIAGejqa8NPmAEDiNAoce3SvTXlMmEJ2PuS5pgns=; b=Xu1DhkHZvTCEYShh1tcrOL6s1D
	xZlm7wdZ03c0Ga0QG82C70vPy4F+GRHNJg8z+Am8WPWAfI20pUMoOLIyQ/Qm9Fekn6eaZPnygnNnL
	rQ2HTbpVxG1fLyiElCIIGe522GZRaSFxzGXmqOdBzTOP+cePBCThtqjq9xaOuj509LlQjRfiIWFPn
	YLYgOeJtCDgoOrZc5mQ/Fcf+F5Rftuf86m7/batEtGmJFtuvleV98Xfxywl43/cB6keNeFhybb/8s
	rIreG+aWOC6jA7Y5y0dIW/FPIjrMxEc9tJQJuoHX4EuTK/hXPF+iQeLky1Pt9tAbw27m7IUDBEPrl
	Z3WOrpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmZ4-00000005voI-056y;
	Fri, 31 Oct 2025 10:41:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY8-00000005vG6-3NaF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 31 Oct 2025 10:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8r3QIAGejqa8NPmAEDiNAoce3SvTXlMmEJ2PuS5pgns=; b=OKkWEo8Ap5qXWMeScJInsfn/SE
	gmV6b5eveOVqSgCjhno9pO1NJjPYCfDlwU0DmUQJ4pj3TBt6lHaAI5HjsLrqdXh9YnjLOcbXPw+NH
	NeHE5qFZ2q9vitYMy/ifaP4/x/qUQMcuRE4CjEaNPpxyf0TCCjoiNgI+CqeqR6qQQhjtaHMIA4afj
	+7Y3eoxdPBYOV+i9EIN4pcbb6xEw5ZRwaHtrqu/C169957N3T20Cj+OX7rdHRPIZsytRHeBAl6FW5
	JwS4Rgd9eUTnH/u6uw+uGDa3YAoofLt0k97IXs6enRCDTl4Emqin8awJ1/3hvSacga0U8SqJNdF0N
	XP5mQCrg==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElgN-0000000B3AP-0Lpq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 09:44:32 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-427015f63faso1237860f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907199; x=1762511999; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8r3QIAGejqa8NPmAEDiNAoce3SvTXlMmEJ2PuS5pgns=;
        b=i6lMLlh8xNB0R92P+gmisd7+PTutA/r5zWRUceS+T0KqAxX/IVeTeIIx4W9TudUhfh
         2zTPwhPmINRUOzb+8iPrbbjtKy5ibd7Q9Txhza0X8mIGCo6eR39dIrBGytuYZeDjiHRe
         AZVo543q4D+M4sBIluUmxOSGToF1KK6EmE8oNnFSkZ1tdC9s3bA1iV7BD06VvgCdhyI7
         PU0Q7F6PDLzHzM9GIUYTPp9yEoKwZQeDVCYTrlayR1SLjmCdNy5XUqt3Jqg/pPz5F/Y1
         XOIgnAJ7xxDDJajgzhk+rAxxZtzt4WyYiv9E/dgkQf5kNW1SiCpXSRqd7XAKEfOHbN1O
         8GDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907199; x=1762511999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8r3QIAGejqa8NPmAEDiNAoce3SvTXlMmEJ2PuS5pgns=;
        b=V1VnALsas4W1Q1IF/m+3nD6c3b7gVobWkzAm7zf/0z+nW2woBS5g5x2mfkrOye3x4a
         DqlZzfIOKpKwfayTe06IGiVBb28jrIV2PP8dAfoUiHtGTNatGIp3YG1ghYes0SbUMwAV
         ZHQGdbFrOdEIXlujxaqbjsVsrLRWCmIIsrEin8UqX/P6gVen70x9dJ9A+lxAlW1OlGna
         1WTLhH/zcqRmcApnNRP+h+dt7dQD8sB29FMc6MdcGkamTxSY9KpS97RBGmDs6it6Ad+K
         bRprANZIc6lCHNth0i4xal30ut/tg88RImUeHd8azWDIzlabzx4CzKBe3J8vnZF1yja8
         2YrA==
X-Gm-Message-State: AOJu0YxYJN5QgpYAum6a/xJNfXsqa58hlQoRJhf9h58oeMX9NICCJ7vH
	xHzuS6uLEa2cTGJITQBvUNQj09aSJd/5YFzCjmPumwMRyAFoaGt1bBEG4M4iwc8kwNDaW6ZKyqv
	N7Ea3pDGAaOaTdCcUzWULxgO0yQHNB9ybKuiPfRyBwgJcuh65Q0ng3cIdXUB/ScRuHZkB8si920
	AyzyHDHamTw7HH9wxHDhA5DjWYxpaLXqRcgFCILBObXtNc
X-Google-Smtp-Source: AGHT+IHA3+sT6jB9B/KN6RWBYWXqri0+R/04SATB2rPp1zUItDUhniCQ0O44BM/cLxoWHqbEStWH964U
X-Received: from wmdd17.prod.google.com ([2002:a05:600c:a211:b0:475:da28:9004])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:3107:b0:3eb:5ff:cb2e
 with SMTP id ffacd0b85a97d-429bd6c18c6mr2345917f8f.29.1761907199634; Fri, 31
 Oct 2025 03:39:59 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:13 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693; i=ardb@kernel.org;
 h=from:subject; bh=OwQNFyTd57ahcVrUrGlQonZMFcw8cHUaJECkttM55ZY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4vX9e1blpTIus+YpZ055on81Z6uG6Kzv/3bW/3FVt
 VieGfW2o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEyE/TAjw+ZcN4knofcXpPy4
 84prj+PpMyWG05oFHEREzzJYzPdvVWX4Hy/3sbJlSWGW+WfZ7pZugYuliV1rvwfdWbFudeXKb3f zmAA=
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-37-ardb+git@google.com>
Subject: [PATCH v4 14/21] crypto/arm64: polyval - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_094431_225405_C45D7C52 
X-CRM114-Status: GOOD (  10.83  )
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

Switch to the more abstract 'scoped_ksimd()' API, which will be modified
in a future patch to transparently allocate a kernel mode FP/SIMD state
buffer on the stack, so that kernel mode FP/SIMD code remains
preemptible in principe, but without the memory overhead that adds 528
bytes to the size of struct task_struct.

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/polyval-ce-glue.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/crypto/polyval-ce-glue.c b/arch/arm64/crypto/polyval-ce-glue.c
index c4e653688ea0..51eefbe97885 100644
--- a/arch/arm64/crypto/polyval-ce-glue.c
+++ b/arch/arm64/crypto/polyval-ce-glue.c
@@ -15,7 +15,7 @@
  * ARMv8 Crypto Extensions instructions to implement the finite field operations.
  */
 
-#include <asm/neon.h>
+#include <asm/simd.h>
 #include <crypto/internal/hash.h>
 #include <crypto/polyval.h>
 #include <crypto/utils.h>
@@ -45,16 +45,14 @@ asmlinkage void pmull_polyval_mul(u8 *op1, const u8 *op2);
 static void internal_polyval_update(const struct polyval_tfm_ctx *keys,
 	const u8 *in, size_t nblocks, u8 *accumulator)
 {
-	kernel_neon_begin();
-	pmull_polyval_update(keys, in, nblocks, accumulator);
-	kernel_neon_end();
+	scoped_ksimd()
+		pmull_polyval_update(keys, in, nblocks, accumulator);
 }
 
 static void internal_polyval_mul(u8 *op1, const u8 *op2)
 {
-	kernel_neon_begin();
-	pmull_polyval_mul(op1, op2);
-	kernel_neon_end();
+	scoped_ksimd()
+		pmull_polyval_mul(op1, op2);
 }
 
 static int polyval_arm64_setkey(struct crypto_shash *tfm,
-- 
2.51.1.930.gacf6e81ea2-goog


