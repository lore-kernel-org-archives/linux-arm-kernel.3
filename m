Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE121C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 20:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5wJ8z5IIgpEu/V2X7F5mJ1HG+C5cXnSuWs7oq4/DAVk=; b=OpgqN9OURiRbqwGEEYGDxHX3az
	WDRWNruX8evQYFmuFQSMqzvBKKu6R5nO+o7hwxVMuFucqk9DbLzmN3T1laUGYW8tWSnTy94EmXbS8
	VbGOKMyP1zqEfvkpOCde0IkxqRk/T2M1TTzgoGIzj9lKCHq7JEvvmhbnq1glL7Tl/3NuVwaIVyaOk
	dCVgeplbylEuJyfBUDGw4fk2MpdpNllbGgK+tOrb3IajsqL/hkp4wYcxHP+WwKwO10VYBor05rVWh
	tcmusJB1SJUGsfAHPkUnT+Y91H/eBaHMUGbK6ITUHEElb6JQaZ8UGNsVlviV1YuP3bEGek8YuzyBQ
	N3OjCnLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNH6H-0000000GaLI-2QyH;
	Thu, 05 Jun 2025 20:22:09 +0000
Received: from mail.nppct.ru ([195.133.245.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNH48-0000000Ga66-1fFU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 20:19:59 +0000
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 3CF821C2AB6
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Jun 2025 23:19:51 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1749154788; x=
	1750018789; bh=o1vWj2peYFzT+9B8W1tqxLwFgYA9lzDCmka4MeMf2gg=; b=k
	hF9e8vSQzQ1D0bX9rXoVD8dUdk/GBze+XY5UHF8WTd1goY2kojEhFJ2fAuIajGK1
	/odE+YTug3EEwn8372WTIl72uY9wtEZ5rXEwWCPRwbNh+hFZvuwpMgeifficseWF
	PywKKVF10Qu96TCHr9TdUHPxyEy5t8Ob+CM0yti9Sw=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fHFI8i3p6Nap for <linux-arm-kernel@lists.infradead.org>;
	Thu,  5 Jun 2025 23:19:48 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id 5176C1C0D75;
	Thu,  5 Jun 2025 23:19:43 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Lyude Paul <lyude@redhat.com>
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
Subject: [PATCH v2 1/2] drm/nouveau/instmem/gk20a: fix overflow in IOVA calculation for iommu_map/unmap
Date: Thu,  5 Jun 2025 20:19:20 +0000
Message-ID: <20250605201927.339352-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_131957_618826_CEC6FA79 
X-CRM114-Status: GOOD (  12.92  )
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


