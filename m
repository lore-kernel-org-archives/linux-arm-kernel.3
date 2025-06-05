Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B38C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxQJiw6KehtsmawjILJfcN0IbIxuxAumV+XFX5XH8hI=; b=3oWnRp+9JHgB9SsdbpB6p+HC3I
	9iaaX4CFzGErNkc50nZcjo2GjsiHJ4LNArnvKoSPd0EJC2yzwVF9xz/EsZJU/a3scq4fvSNRJhrGs
	3b9wuhWujXd6UneitQOy29nejLQHAIFMjAzDEeTaht5YNkyZOrFzH82a3UBhSH2PSRM36Pk9g//jE
	WH9x62fsAqWooKjwRoqjg2DWApw/VHzJUueopyEUndfqFx7bOsWnVh5oBLvLVWRlkM6/9fryEfK19
	BlQXs9qv+vFnDVoOfY4FS0Mfz+aw64setbX6AOhlHQq9omXHMoSGc5/N3q4MH5p5H8+9/Vl6RUx7p
	BYx/NuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNH8N-0000000GaTv-13AL;
	Thu, 05 Jun 2025 20:24:19 +0000
Received: from mail.nppct.ru ([195.133.245.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNH4A-0000000Ga6h-2XMs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 20:20:00 +0000
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 46F871C2ABB
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Jun 2025 23:19:57 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:to:from:from; s=
	dkim; t=1749154796; x=1750018797; bh=TeGhnktdSvFxXreUkwhblyYxGqC
	rkCLuVr00TRFUiKg=; b=rm6yCB+o3Z3hQU5WzYf37ke60L1n2HbJe+h6EnbXih6
	PUVbK5yUD2rjoHyBT10ycx8Dsm2hpwKQVrnM2cN1EOeeZIU+Pg8oPcT+lM3EK50R
	CQwPMc90Ia6mXLIqGX/ivzrwDEqwHV0Ee4xBHyAC6NyOtck6F0kieuB5yDM8I+cA
	=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PJ7YMn1Mwr6u for <linux-arm-kernel@lists.infradead.org>;
	Thu,  5 Jun 2025 23:19:56 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id 11A101C1151;
	Thu,  5 Jun 2025 23:19:48 +0300 (MSK)
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
Subject: [PATCH v2 2/2] drm/nouveau/instmem/gk20a: fix incorrect argument in iommu_unmap
Date: Thu,  5 Jun 2025 20:19:21 +0000
Message-ID: <20250605201927.339352-2-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605201927.339352-1-sdl@nppct.ru>
References: <20250605201927.339352-1-sdl@nppct.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_131958_803838_DD0626EA 
X-CRM114-Status: GOOD (  12.37  )
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

The unmap logic assumes a fixed step size of PAGE_SIZE, but the
actual IOVA step depends on iommu_pgshift, not PAGE_SHIFT. If
iommu_pgshift > PAGE_SHIFT, this results in mismatched offsets and
causes iommu_unmap() to target incorrect addresses, potentially
leaving mappings intact or corrupting IOMMU state.

Fix this by recomputing the offset per index using the same logic as
in the map loop, ensuring symmetry and correctness.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v4.3+
Fixes: a7f6da6e758c ("drm/nouveau/instmem/gk20a: add IOMMU support")
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 17a0e1a46211..f58e0d4fb2b1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -481,8 +481,9 @@ gk20a_instobj_ctor_iommu(struct gk20a_instmem *imem, u32 npages, u32 align,
 			nvkm_error(subdev, "IOMMU mapping failure: %d\n", ret);
 
 			while (i-- > 0) {
-				offset -= PAGE_SIZE;
-				iommu_unmap(imem->domain, offset, PAGE_SIZE);
+				iommu_unmap(imem->domain,
+					    ((unsigned long)r->offset + i) << imem->iommu_pgshift,
+					    PAGE_SIZE);
 			}
 			goto release_area;
 		}
-- 
2.43.0


