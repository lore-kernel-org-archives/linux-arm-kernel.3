Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396F0CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XOJzH6ZlojNRGhFSQQCm5QvW7MMJvx/jEYA6dtw25WI=; b=Fe82m96GtecPBFGQ232clCAiHd
	HuW19k9LyuyF4ezj5aH94liFtij5w14m+BitpdM3ZrWPFR++VehM0C7Il+rT5UhKyT7JktpmqTs1w
	kiYOTCkdCipgusz3XfeOJcxTqaXfeMixtsWK80lWydcmi5AafekQSS4qhEqKRoflHw2+Ohu+5k1kY
	cbgvFwcnp9YLIUDrGN8PCPqNTh+7D8+enluIgbkmOnKtc561MEs2HeXlXxghtbVo3ZZHCcHJ1cQcN
	C31+Fpp4rfR3JPUqkUt9kkAQ993fJgVJtkOn8QcCIDO17S/XVRUtK6N9j2fzmdmMGlGhYQc67BcMA
	0DISQqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd434-0000000B80b-39jY;
	Fri, 26 Jun 2026 10:44:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd433-0000000B80F-1sxV
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 26 Jun 2026 10:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=XOJzH6ZlojNRGhFSQQCm5QvW7MMJvx/jEYA6dtw25WI=; b=QVRamhBJyiVhqduBn1GIhx6LFK
	mGMiSxf0vy8eR6lSJuKNbXE+DsK/bO5ZCXkOe3t7G39Le8TOTsaCpSdQCcB3e2oHG3qHqHmH+AbTB
	XBjMKiRWSkg1nqqU5KJOw86Cj/Ieo+m4kNCQH7Qk1RkYXxkW/NAxwf7JPn8b8+Ba/CdDk2vw23VOk
	sV+QqeaCNcOOU6V2Lhv8pnH31aVpykspD8AuE98LboJB21dvEKg7erS2yqLFeutnv39LSOFRGB2up
	1OlZF32vg0pMJVVomE1SPOX2wVawkDFUSHosuSyRHUFM2tM7IsDeFJ1fa00PZkmjYwbH9REXB3pQw
	VY7N9n/A==;
Received: from mx20.baidu.com ([111.202.115.85] helo=outbound.baidu.com)
	by casper.infradead.org with smtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd42v-0000000BfnR-2iuE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 10:44:34 +0000
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Russell King <linux@armlinux.org.uk>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Leon Romanovsky <leon@kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, Matthew Wilcox <willy@infradead.org>, Jason
 Gunthorpe <jgg@ziepe.ca>, Li RongQing <lirongqing@baidu.com>, Kees Cook
	<kees@kernel.org>, Douglas Anderson <dianders@chromium.org>, Gregory CLEMENT
	<gregory.clement@bootlin.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ARM: dma-mapping: Fix wrong free function in __iommu_alloc_simple() error path
Date: Fri, 26 Jun 2026 18:11:51 +0800
Message-ID: <20260626101151.2185-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: bjkjy-exc2.internal.baidu.com (172.31.50.46) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1782468734;
	bh=XOJzH6ZlojNRGhFSQQCm5QvW7MMJvx/jEYA6dtw25WI=;
	h=From:To:Subject:Date:Message-ID:Content-Type;
	b=o0ohRgpAYGU37ntKHrDW+F+viJ1noFsDVl/3erxHn0WUSOOfyS77L0kMm8W6XEiXx
	 ZSIt2wsNYOpCTw2Ic8eVLN9PV19FKgzw00zrgTCEYGWhBtW0++XhwrYRUL5TFXttSp
	 t0VuthRsvRy1OtV1E7Lp4K99Mr5sLNGHc2bdtt0GqPuphNNmUBqpqT22A6oOqpSN+P
	 iBkxv+9CW5Y/vYe6zvuVHjJfjoiR/UW6vpj9+/mJdoU7CenAZxp4jY1nMURyFh7L+d
	 HFW4qJcH29T2kcz2MTMv8xcBPoCd0wIRZQIv46KtcBOA2bRtQPEY6UGv1YBo5dMAvW
	 DpJRCuGGKhRNg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_114431_341658_2654437A 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

From: Li RongQing <lirongqing@baidu.com>

In __iommu_alloc_simple(), when IOMMU mapping creation fails, the error
path unconditionally called __free_from_pool() regardless of the
allocation path taken.

For the COHERENT case, memory is allocated via __alloc_simple_buffer(),
which does not use the atomic pool. Calling __free_from_pool() on such
memory silently returns without freeing, causing a page memory leak.

Fix this by matching the free function to the allocation path:
- COHERENT: use __dma_free_buffer(virt_to_page(addr), size)
- non-COHERENT: use __free_from_pool(addr, size)

Fixes: 565068221b905 ("ARM: 8561/4: dma-mapping: Fix the coherent case when iommu is used")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 arch/arm/mm/dma-mapping.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index f9bc53b..55d3d3b 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1056,7 +1056,10 @@ static void *__iommu_alloc_simple(struct device *dev, size_t size, gfp_t gfp,
 	return addr;
 
 err_mapping:
-	__free_from_pool(addr, size);
+	if (coherent_flag == COHERENT)
+		__dma_free_buffer(virt_to_page(addr), size);
+	else
+		__free_from_pool(addr, size);
 	return NULL;
 }
 
-- 
2.9.4


