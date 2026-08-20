Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB89C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzZzqh5T5mzVhtXpiT+2HdPO7fzQTB65KhEpymle1xg=; b=LPAdeQjZ1zV4Kxx6WYX6ukmXsI
	wMl4PSUTQ7hC+1iDnLOKPjkPbizDpV4hqX9lmG3c8kOG39HYUM5BXE0gdl8DFh37s6BaqVSqURS40
	aKEIFnG1nNgaXFgdlXQsv5qNowvg2L6s03d2MiWTvHll4KeIzU3uSqFMRTRRmt+qg4mjfO0mVqj2I
	5rZNMFz5Ce/636rAhgjOyzyEwkil6RMzWDwQ91DB6HOVu78WfxIjP05NjE8Nr023mjgOhbYZRGWCQ
	pEJiEaDtYYxgV/tEGETv8Izx8FZYqBDrgrLFOQUu6rvkIsI3x+AeROpMaWOWQi9j86SkLyq6GtxC3
	9VbyWZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0MN-0000000BNj5-3XlD;
	Thu, 20 Aug 2026 10:50:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0MI-0000000BNhW-32as
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 10:50:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9ED321CDD;
	Thu, 20 Aug 2026 03:50:49 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C18063F66F;
	Thu, 20 Aug 2026 03:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787223053; bh=NNzpHX/+mcqN6PkciZSU1ANfzwjeDq5G33MuimdG0sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W4kE0KL6dNp7OqTRKjIPeZLCk+ii0EBnVG/XxDg0MD3rO7EF/L9D3wU3qboJsdbUS
	 hheGHwUmyv0wPqNomhF2R63ZFm3H+6Jf70rLU7PG0rKvIRRdZoGQ6/9nse4YwFZOgg
	 CciKo6BqLRnmeklVuYxQdzga3B9VQiqUm3w7LMw8=
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
Subject: [PATCH 1/2] irqchip/gic-v3-its: Zero shared pages after conversion
Date: Thu, 20 Aug 2026 11:50:24 +0100
Message-ID: <20260820105026.53208-2-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820105026.53208-1-steven.price@arm.com>
References: <20260820105026.53208-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_035054_801489_71FCF807 
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

its_alloc_pages_node() passes __GFP_ZERO to the page allocator before
calling set_memory_decrypted(). This assumes that converting a page from
private to shared preserves its contents.

For Arm CCA with MEC (Memory Encryption Contexts) the key used to access
the page will change, and so by default the visible data will change.
The host could ensure that it zeros the page, but rather than relying on
the host's behaviour it's best if the guest simply zeros after the
decryption rather than before. Specifically in this case the ITS tables
are required to be zeroed.

Mask out __GFP_ZERO from the allocation request, and do the zeroing as a
separate step after decryption.

Fixes: b08e2f42e86b ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 6f5811aae59c..c954bbe9f4db 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -213,10 +213,12 @@ static gfp_t gfp_flags_quirk;
 static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 					 unsigned int order)
 {
+	bool want_zero = gfp & __GFP_ZERO;
 	struct page *page;
 	int ret = 0;
 
-	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
+	page = alloc_pages_node(node, (gfp & ~__GFP_ZERO) | gfp_flags_quirk,
+				order);
 
 	if (!page)
 		return NULL;
@@ -231,6 +233,9 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 	if (ret)
 		return NULL;
 
+	if (want_zero)
+		clear_pages(page_address(page), 1 << order);
+
 	return page;
 }
 
-- 
2.43.0


