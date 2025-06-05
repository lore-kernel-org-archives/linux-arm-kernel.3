Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645E3C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 20:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5wJ8z5IIgpEu/V2X7F5mJ1HG+C5cXnSuWs7oq4/DAVk=; b=uY7mYsXLZ4zZdlQsJAvI/mC6QB
	r/PRzGBQsj8y/5O3PoCN2AZodnRWjd/osBCR+ThQIYoZWkrDsjBS/pRP2iOA5Vo5x8aU23o3zosFs
	xYOnUYWhrE+idfx2nQUNAtvg3v9Cbe7cxPcODV6Z47jp7QJctAKjaznzyu45fJBihCxiU0QVJAjfU
	dcQOIWRwRdP/l4/BMY0NpiaZDsWPwfVnFTW1sXDu5GkW9+rrHUgU2SSaceXuVzIqwUmOHVLJUG7H2
	KU7LLvKdt2Kp3EHeXkIsjSdDvvF+XKPCUpIiXQNyXk4QToj7Zxrp+tkBE48Br5+JqJQxK8C94KkMs
	MwC5hHVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGt6-0000000GZ7g-1Ytg;
	Thu, 05 Jun 2025 20:08:32 +0000
Received: from mail.nppct.ru ([195.133.245.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGou-0000000GYlU-2wqZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 20:04:15 +0000
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id C03FC1C2AB1
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Jun 2025 23:03:45 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1749153825; x=
	1750017826; bh=o1vWj2peYFzT+9B8W1tqxLwFgYA9lzDCmka4MeMf2gg=; b=K
	I9nhAcIiu7lrXTn3NaSpYUL8bNKN3JuEZPUAtssONVOxwA0OfQrmMVRtqDrTfQST
	kfd5pvsOhmYcS89KLUgIxIfiT1B07gzs9+gNkR1YbWtLTB6hmsD1SiWoIZQ8MmcF
	WObORsAQhNJAosjXCOvEpGDGM+Y6fvXsMWBkPfkouw=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yoUHzQz2zH46 for <linux-arm-kernel@lists.infradead.org>;
	Thu,  5 Jun 2025 23:03:45 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id 786081C0D75;
	Thu,  5 Jun 2025 23:03:40 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: 
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] drm/nouveau/instmem/gk20a: fix overflow in IOVA calculation for iommu_map/unmap
Date: Thu,  5 Jun 2025 20:03:23 +0000
Message-ID: <20250605200332.336245-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_130412_911067_F228703F 
X-CRM114-Status: GOOD (  12.68  )
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

Fix possible overflow in the address expression used as the second
argument to iommu_map() and iommu_unmap(). Without an explicit cast,
this expression may overflow when 'r->offset' or 'i' are large. Cast
the result to unsigned long before shifting to ensure correct IOVA
computation and prevent unintended wraparound.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v4.4+
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 201022ae9214..17a0e1a46211 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -334,7 +334,7 @@ gk20a_instobj_dtor_iommu(struct nvkm_memory *memory)
 	/* Unmap pages from GPU address space and free them */
 	for (i = 0; i < node->base.mn->length; i++) {
 		iommu_unmap(imem->domain,
-			    (r->offset + i) << imem->iommu_pgshift, PAGE_SIZE);
+			    ((unsigned long)r->offset + i) << imem->iommu_pgshift, PAGE_SIZE);
 		dma_unmap_page(dev, node->dma_addrs[i], PAGE_SIZE,
 			       DMA_BIDIRECTIONAL);
 		__free_page(node->pages[i]);
@@ -472,7 +472,7 @@ gk20a_instobj_ctor_iommu(struct gk20a_instmem *imem, u32 npages, u32 align,
 
 	/* Map into GPU address space */
 	for (i = 0; i < npages; i++) {
-		u32 offset = (r->offset + i) << imem->iommu_pgshift;
+		unsigned long offset = ((unsigned long)r->offset + i) << imem->iommu_pgshift;
 
 		ret = iommu_map(imem->domain, offset, node->dma_addrs[i],
 				PAGE_SIZE, IOMMU_READ | IOMMU_WRITE,
-- 
2.43.0


