Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E222C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaK1oUzcvz1jkDbJKv6WqRACiAwdU+kQwRK0SiWLlIE=; b=VscmsWEisdPcFgY7u3bP1YvmWK
	7i5pIsEUtN0g164VZSUDs40IpLqBx5wElAKl8dQWvGkFCTjYgdWVKSx6E96f79cRIZQV64W/NfHGr
	WU3V2FxZpK9UvmF7kWhumXzboGfx4mP7EDpkWnfjtsxzvDEJBY9t9l63PleEsjQGxfEH1+S+qgpIA
	j1xJIcfisUhnJumRnDcwS72FmnPrxSxY9EQbZ54GgVF38ePNv02Z/k1oPxObC1PepUNkkdriVzv3/
	l987w+ZY+4xWZhYqaTgUShpaBqqab5qWRz6H4Zbz7ADED5INDFdVhGUduU+FZ+UCLOcGPk7rcJ1uu
	ygwTV6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4Ga-0000000BlNq-2k7d;
	Thu, 20 Aug 2026 15:01:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4GS-0000000BlJV-3rHR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:01:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BB04153B;
	Thu, 20 Aug 2026 08:01:03 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50FF43F85F;
	Thu, 20 Aug 2026 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787238067; bh=Adowm8TaRmLb4+nhfuTq8XG6Qz8i8b31EokqJq1SBFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AnIbFs3qOe6tXAa76/75xbIi30a6sclahiGuKAa7TNyNiW5Z+k4gQ8FETu4UTPSKO
	 8Juo5IUGdb+gncLLrOLJBF1w9IYh74/rR/FXRuJR7tsoW1Se2JDZh0t2glua/wxv1v
	 ZHr2qdGjJiBb9RZp3FHVr1rdzV1QZD3j0HcXo/HU=
From: Steven Price <steven.price@arm.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 4/4] dma-buf: heaps: Fix shared system heap allocation rollback
Date: Thu, 20 Aug 2026 16:00:33 +0100
Message-ID: <20260820150034.88729-5-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820150034.88729-1-steven.price@arm.com>
References: <20260820150034.88729-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_080109_225517_0004AE13 
X-CRM114-Status: GOOD (  14.40  )
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

If converting one of the allocated pages to shared memory fails, the
cleanup path attempts to convert every page back to private memory.
Pages after the failed page have not been converted yet, so attempting
to convert them back can fail and cause otherwise reusable memory to be
leaked.

Count the pages converted successfully and only convert those and the
failed allocation back during cleanup. If converting the failed
allocation back succeeds it can be freed safely; otherwise it is leaked
because its state is unknown. Allocations that were not converted can be
freed directly.

Fixes: 78b30c50a7ac ("dma-buf: heaps: system: add system_cc_shared heap for explicitly shared memory")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/dma-buf/heaps/system_heap.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index f14930904089..8d3ffeb64e00 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -418,6 +418,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	struct scatterlist *sg;
 	struct list_head pages;
 	struct page *page, *tmp_page;
+	int nr_decrypted = 0;
 	int i, ret = -ENOMEM;
 
 	buffer = kzalloc_obj(*buffer);
@@ -472,6 +473,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 				goto free_pages;
 
 			clear_pages(page_address(page), 1 << compound_order(page));
+			nr_decrypted++;
 		}
 	}
 
@@ -496,9 +498,11 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 		 * Intentionally leak pages that cannot be re-encrypted
 		 * to prevent shared memory from being reused.
 		 */
-		if (cc_shared_buffer(buffer) &&
-		    system_heap_set_page_encrypted(p))
-			continue;
+		if (cc_shared_buffer(buffer)) {
+			if (i <= nr_decrypted &&
+			    system_heap_set_page_encrypted(p))
+				continue;
+		}
 		__free_pages(p, compound_order(p));
 	}
 	sg_free_table(table);
-- 
2.43.0


