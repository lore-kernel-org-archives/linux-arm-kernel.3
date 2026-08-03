Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF5EC5518E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiJzzJADjveCPh12e/Ztx0Pt2Ia4qulsBujpLhp70Zo=; b=mXcZdvJt3f41/Drpnp2BckV8E6
	V63gOQzEMr9Jlne3Xt6Ih0VAHfjr5fU57aUZcNyCdPr6KuDRqX7m6CF3WsNUQAVcZc2wW7BnPrQ+B
	4mwIFB6llmHO+4TbmMbkhY4jOAhrkWaL4hrFd+pTjmTMEtDRzyuFIJw3U+GFINQ9Du8/UknPYFDEs
	PjebD9FtEjeqV6qbfpe59/WAytllOgYp3NHuxn6krsaiaHqygq5f0rYljvDSJYJ7hecI69qNNnCe1
	NILE+p8o0rNpdAS1qUoMnjAiAPCM2tIt785o0r5Dujq7y4TLBl/3Nn+T+Jm0YNIxbcUKZRCWjZ6KJ
	7UaEoYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdM-0000000Gmou-2gxr;
	Mon, 03 Aug 2026 10:11:00 +0000
Received: from mail-lf1-x148.google.com ([2a00:1450:4864:20::148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdK-0000000GmmW-1Nr3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:10:59 +0000
Received: by mail-lf1-x148.google.com with SMTP id 2adb3069b0e04-5b29e7e8ab6so1929057e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751855; x=1786356655; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HiJzzJADjveCPh12e/Ztx0Pt2Ia4qulsBujpLhp70Zo=;
        b=n/HXXhAqmA+edeEZR4zFEealrG9bXVxz9KsXooR1Le5GfTVjDEs0MxYpyWNG/hTA1q
         8oo0S65sRfTotSeVBF1OaAO27To/brGrYrg/cihEo1jEL2IFk1uHftPHshdkVTq7G2OO
         hW9lXB3Pl82TJSulgOTTJj6qwX1DvqmnJ52cMSdW4A9ueQ7x6XSuimtcu1OKOJqNYcOv
         MuU3G34UpPMDczrQdzSK9ounlNV5SPV9s5w/ke58/EvrrfVPne9t1yFsmd2CEIBqanqy
         1l5W6OmB+Iu+xrZXjbiOLKKrABn3eNGa+H3g1onHnxAG/YQsUNsBunO6osfxml7lBZ8U
         RxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751855; x=1786356655;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HiJzzJADjveCPh12e/Ztx0Pt2Ia4qulsBujpLhp70Zo=;
        b=Bm4YwTB6kHeopR2AZ2tV2OLYTADt8QZbfTpLE3cj6/TAQg28cnHetv8IUw2V1TeG+U
         oxWFKKoWHMQcf2e8rOoFMRds3GPw6PfMA7DOeJVgfXmQotsQgOUMIuud8QEqYgF2NWzB
         fvWLLEj5N28wOBZGA3uGV4dpVg+pSissK8chfYF/fbuOZ2YiQSefrdPnWSkwx8Uy1d2U
         Gygsq2UFYZGXPFxbHdUAXu7gwlT3OGVv5dZQzAzR6M0DhLLkJBA/URyRE8s58xC4FcS+
         sJv0XJf08H4BqVhprF8JXysrDxLInBrRVydxxa2vr7TfjpEsXodJyKDm46kwLNGv5XBX
         AmzQ==
X-Forwarded-Encrypted: i=1; AHgh+RpobUV9qmWAn/t6w0OexiHoGNN5ZAD97c8HuYAM2gTiF7wNa+W3dxxDVOT+uuOT3rw52DHOJwkEIeawW3QMinjQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2atjDQxdaOXhWeZEOWRlbss4CyRi6s0gcJT/BDZyy/QcgvU7t
	qu3aFRLZQDtKShJHGS6ksLKWpeiuuvNVLs47AKfd7rwguyeNAHTIEHF7HkTrgEaZyaA5amS8RYW
	sYMPSQCoVsH6JYTIpmqsZgA==
X-Received: from lfbbp27.prod.google.com ([2002:a05:6512:159b:b0:5b1:5972:ebc4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6512:1083:b0:5ae:a4a4:b6ca with SMTP id 2adb3069b0e04-5b2e4f16ddamr1441640e87.14.1785751854334;
 Mon, 03 Aug 2026 03:10:54 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:46 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-3-vdonnefort@google.com>
Subject: [PATCH 02/20] KVM: arm64: Propagate host stage-2 annotated entries on
 block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031058_388942_0891BA47 
X-CRM114-Status: GOOD (  11.95  )
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

Propagate ownership refcounts for invalid stage-2 entries mapped on
block split. This intends to allow splitting host stage-2 blocks while
keeping existing page ownership and metadata annotations.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 34f78a58cded..0ca157ecee64 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1033,15 +1033,28 @@ static int stage2_map_walk_table_pre(const struct kvm_pgtable_visit_ctx *ctx,
 static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t *ptep)
 {
 	kvm_pte_t block_pte = ctx->old;
+	bool counted, valid;
 	u64 pa;
 	int i;
 
-	if (!kvm_pte_valid(block_pte))
+	counted = stage2_pte_is_counted(block_pte);
+	valid = kvm_pte_valid(block_pte);
+
+	if (!valid && !counted)
+		return;
+
+	/*
+	 * Shared walks not supported: cannot rollback refcounts on break
+	 * failure.
+	 */
+	if (counted && WARN_ON_ONCE(kvm_pgtable_walk_shared(ctx)))
 		return;
 
 	pa = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level));
 	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pa += kvm_granule_size(ctx->level + 1)) {
-		kvm_pte_t pte = kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1);
+		kvm_pte_t pte = valid ?
+			kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1) :
+			block_pte;
 
 		/*
 		 * Skip ptes in the range being modified by the caller if we're
@@ -1053,8 +1066,11 @@ static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, k
 		 * that should happen very infrequently.
 		 */
 		if ((ctx->level < (KVM_PGTABLE_LAST_LEVEL - 1)) ||
-		    (pa < ctx->addr) || (pa >= ctx->end))
+		    (pa < ctx->addr) || (pa >= ctx->end)) {
 			*ptep = pte;
+			if (counted)
+				ctx->mm_ops->get_page(ptep);
+		}
 	}
 }
 
-- 
2.55.0.508.g3f0d502094-goog


