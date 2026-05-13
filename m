Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDE8CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR1Wv4oMHHpwdm4XGb1XftGJUcGelJg9xckwdNKgGB0=; b=W6DD6MUnpHlMtrxuPwpBYNguTT
	ZMzNsJgRHD3AR0TUfRymTniOFQV/lCt4FWZeYMYwBxqN3zkwJZa00saO4AUnber017U6jDmJnF58/
	hSy2uKjp0pZTG8Y3GQKW0xJYakWkclkw1nhZXH6gCd+pr6qzKIArop/LEyYR5RM+I3OcmtlGNUP6e
	a/3zbDULFUbEmQHEi+0E33oxQbNGZ+UC7JO5fE2sLFC3SdBcBSjT94uSztidPjxlCyjmr9dC9DwAs
	0lXq0s8i5XKVAT67+cu5GRTsKs2xUL/mdZKyvdF21aNu5n19XLBFaIczyrHBVBdZzO6oInit/C3JV
	X0qFwaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHVT-00000003rlb-1Ti9;
	Wed, 13 May 2026 21:52:43 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHVQ-00000003rkT-2Hlx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:52:41 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-44dad1b938fso4350579f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778709158; x=1779313958; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jR1Wv4oMHHpwdm4XGb1XftGJUcGelJg9xckwdNKgGB0=;
        b=JNn65X284ce8R+lOVl3cNxMCaC0TA/kgrXLMjgaefFl+ApVk+w7MYt4yegUayGOVZx
         QC4AQhjIK2YBYFKhHk9RuYxa+qWhPk6rF7ddZZoCbVf4+nTjXmzD5JwtFap4jWb6qnAV
         49lC7u6D4KTBoaSk9A4HEO4geItB/v96xpbinMNE91RRUeLBv+ZUjHOgyrmF0ZM3AT2D
         rb26T7Tb3WPtTs6sfg9vLzDoqIOn7EQEveiPiRPDKeSFlv+gUvPvLxdzw3J2iTS4fTrz
         ezpWFcYfq2mncy7iF9lINQIO78AfX0lUwtFseY02ZvC8LXRzxXSETZGyLaGGAwuxTjLY
         LH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778709158; x=1779313958;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jR1Wv4oMHHpwdm4XGb1XftGJUcGelJg9xckwdNKgGB0=;
        b=CDNd98ECEYC+WzSXK6cobgbrqEzr4NrwrgkesM/Yoe8giiCkAIRuhYdlack0L1ToeN
         jiYFj2zGv6VS8Hv+U/goUpRmChtXj/en3xIn6/Wtt0Tpn/kLXjkrQsv7J3CFjHSi85kp
         opZqLAZ1ozYP4F3w0m+c2syWkd9Slj0K0zWU8i8gk2RRjWppHQOUlcGjvMuj/hWpcCKw
         XIF8YsBeFkyt6kE7XTXurWajjkAIAaEehRUxNNXpXZDasm6PvY0ABIMhZHI/31AOosli
         oD/DE06aMlr3s9VU3/YiCeeQs+ek134eSkbDfRQB+UgU5qdHFo6u6c8cW61lG/69RcSa
         Uudw==
X-Forwarded-Encrypted: i=1; AFNElJ83hvPjrm1VVPL0GGgIlOkQSevwTK7CAXazKerHmTpYW9rYPhWB+c83rOE6GpgC6BqOtVD4ryPzqsZHyXhd5kkL@lists.infradead.org
X-Gm-Message-State: AOJu0YwWqcbyfuBNIWIBhVRV9dewoprl66Fbz52f2jQ0uPf0ZCwqJaL9
	JfZ+mtPz+1bB6MpyOlssCRkHoF16L7qSy+x56AapHQMObR+tggQ9X6bEDnEDXObE9/QsWDPzMmy
	Y9nES3LhE3mqdfg==
X-Received: from wrxk8.prod.google.com ([2002:a05:6000:48:b0:44c:2fb:a56c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4008:b0:446:96b1:f51 with SMTP id ffacd0b85a97d-45c59cd2144mr8466705f8f.22.1778709157467;
 Wed, 13 May 2026 14:52:37 -0700 (PDT)
Date: Wed, 13 May 2026 21:52:01 +0000
In-Reply-To: <20260513215203.3852661-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260513215203.3852661-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260513215203.3852661-2-smostafa@google.com>
Subject: [PATCH 1/3] iommu/io-pgtable-arm: Use consistent sizes for page
 allocation and freeing
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_145240_595560_7F47D593 
X-CRM114-Status: GOOD (  14.49  )
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

At the moment we use alloc_size to allocate memory but then there
is a logical error where we just size in the error and free path,
which might be smaller.
Also we size to do DMA-API operations, which is OK, but confusing.

Instead of this error-prone handling, just set size to alloc_size
and use it everywhere.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0208e5897c29..0cbe545c491d 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -253,7 +253,6 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 				    void *cookie)
 {
 	struct device *dev = cfg->iommu_dev;
-	size_t alloc_size;
 	dma_addr_t dma;
 	void *pages;
 
@@ -261,12 +260,11 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 	 * For very small starting-level translation tables the HW requires a
 	 * minimum alignment of at least 64 to cover all cases.
 	 */
-	alloc_size = max(size, 64);
+	size = max(size, 64);
 	if (cfg->alloc)
-		pages = cfg->alloc(cookie, alloc_size, gfp);
+		pages = cfg->alloc(cookie, size, gfp);
 	else
-		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp,
-						  alloc_size);
+		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, size);
 
 	if (!pages)
 		return NULL;
@@ -303,6 +301,9 @@ static void __arm_lpae_free_pages(void *pages, size_t size,
 				  struct io_pgtable_cfg *cfg,
 				  void *cookie)
 {
+	/* See __arm_lpae_alloc_pages(). */
+	size = max(size, 64);
+
 	if (!cfg->coherent_walk)
 		dma_unmap_single(cfg->iommu_dev, __arm_lpae_dma_addr(pages),
 				 size, DMA_TO_DEVICE);
-- 
2.54.0.563.g4f69b47b94-goog


