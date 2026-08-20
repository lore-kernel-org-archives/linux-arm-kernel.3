Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8B9C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFKUrXl0NJQNkAPPXBPGjGKfTkgrSi45VPRiC5YltDc=; b=XLkywpR37yQuPj+x/ogdVmMjNO
	WUyUvVPJ6M1pjmHi4dN685Mi1TRIMbXjCO/ld2EkVL0323skyxuSt/Fup/hRATlUUlp7lIiYGUuhJ
	dxiG02IOek7uVlw4iJN5SyCxKBZCYWiOgL16pFGSsL/GCxzVX5rXKxdjlEcg8Lr3Z1LiYt29Z4uSA
	q1yAxKhS469JuN/LLxqWTzPp50EnIl0vkx1v5bUnEYqxlRPOtoHqNwpq3a8ugt3jszTN3D2zEzVAp
	Z9jVSx3G5QuEBBdf6/Dqmh9qP7sJehmYSYf8cWFb1naKel1B7VZBQ4c3JQvP0Nk7wgxtkqjMPNRFf
	bjukrELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0MU-0000000BNkp-0D2n;
	Thu, 20 Aug 2026 10:51:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0ML-0000000BNiQ-3ynl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 10:50:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BED0153B;
	Thu, 20 Aug 2026 03:50:53 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2E963F66F;
	Thu, 20 Aug 2026 03:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787223057; bh=hOdOjYlA+iI1ah2K1oi47SLi3OkvE+2GFQdWf32mYks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sb9jepZyTzEBEx3PSvl7y2pZ9slsxHg0OsepC2gx/KBftfiVWC/rgugZBJ0dKfHb8
	 01cdi9VtjSIGkOoLhQk05JrfNDl2ywnlJXC5RRdMOvn2T8QUX9mR8RbfL1qELEepL4
	 d58f5eXCxif2CMnxSb2Rbv+YMgBhJNPUMkTja3VA=
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
Subject: [PATCH 2/2] dma-buf: heaps: Zero system shared heap pages after conversion
Date: Thu, 20 Aug 2026 11:50:25 +0100
Message-ID: <20260820105026.53208-3-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820105026.53208-1-steven.price@arm.com>
References: <20260820105026.53208-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_035058_088870_64BCED44 
X-CRM114-Status: GOOD (  15.99  )
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

The system_cc_shared heap allocates pages with __GFP_ZERO before converting
them from private to shared with set_memory_decrypted(). This assumes that
the conversion preserves the contents of the pages.

For Arm CCA with MEC (Memory Encryption Contexts) the key used to access
the page will change, and so by default the visible data will change.
The host could ensure that it zeros the page after decryption, but
rather than relying on the host's behaviour it's best if the guest
simply zeros after the decryption rather than before.

For CC shared buffers, defer zeroing until each page has been converted
successfully. For other buffers keep the existing behaviour.

Fixes: 78b30c50a7ac ("dma-buf: heaps: system: add system_cc_shared heap for explicitly shared memory")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/dma-buf/heaps/system_heap.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index c8959eadc71d..f14930904089 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -376,7 +376,8 @@ static const struct dma_buf_ops system_heap_buf_ops = {
 };
 
 static struct page *alloc_largest_available(unsigned long size,
-					    unsigned int max_order)
+					    unsigned int max_order,
+					    bool defer_zero)
 {
 	struct page *page;
 	int i;
@@ -388,6 +389,9 @@ static struct page *alloc_largest_available(unsigned long size,
 		if (max_order < orders[i])
 			continue;
 		flags = order_flags[i];
+		/* Decryption can change the contents, so clear it afterwards. */
+		if (defer_zero)
+			flags &= ~__GFP_ZERO;
 		if (mem_accounting)
 			flags |= __GFP_ACCOUNT;
 		page = alloc_pages(flags, orders[i]);
@@ -438,7 +442,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 			goto free_buffer;
 		}
 
-		page = alloc_largest_available(size_remaining, max_order);
+		page = alloc_largest_available(size_remaining, max_order,
+					       cc_shared_buffer(buffer));
 		if (!page)
 			goto free_buffer;
 
@@ -461,9 +466,12 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 
 	if (cc_shared_buffer(buffer)) {
 		for_each_sgtable_sg(table, sg, i) {
-			ret = system_heap_set_page_decrypted(sg_page(sg));
+			page = sg_page(sg);
+			ret = system_heap_set_page_decrypted(page);
 			if (ret)
 				goto free_pages;
+
+			clear_pages(page_address(page), 1 << compound_order(page));
 		}
 	}
 
-- 
2.43.0


