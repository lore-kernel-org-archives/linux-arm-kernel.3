Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4DBCA6018
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 00:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuA9XknANPL6VvC11pYgn0IAp4/AWH6zzAsKWJ2B0W4=; b=Jd7UV1ngnQrVepyUZiJbS6lSrl
	uSkHXeKzLuegpUXzlpiwcX/ET8bgkZVIzAdrOhSj4dwZeFsGPdjBmF3rnEk8AYXhgs6HKgL49EKYA
	/6gHpY8IkJWhRTyz1cRSQbK7u7nMZDaZhfm7srEr85qCzY+u4sQsfp6OOv8ajkw2557w73lecX7D0
	H8bGoletqPfjS/l/Wy9W9UOs8O+QgwI5vlWAdMEClt7FMzO1odejTcFSzY4ycJ1sRhOAmVuAFnMzQ
	19uJPgqIEypJjWEoe/JUVZlsDl6waCzPBwKv9pA6M9Plt8RTK85G/XjLo93nSz/lsb3nI3qjzn+w2
	wTgwhEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyMh-00000005Bhg-1jR1;
	Fri, 09 Oct 2026 00:21:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyMd-00000005BeD-1f8m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 00:21:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a02718da81so27076555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 17:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791505289; x=1792110089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SuA9XknANPL6VvC11pYgn0IAp4/AWH6zzAsKWJ2B0W4=;
        b=d9hbJ83+IvyEFxfvM8m7zloPhbuorzPlaDnDjJETucrmCNAeY5g5vI34/R+7olHqrq
         ZCUAP87JLnIPpoa8PXY3c7EWFjC3w03CR6T4a8XcDEv6ewr0piS82X8CS982eLkO67F7
         h/AhX8/Ul6aW9ZPW1nslafckudcUuKPpweDjMgJCmr7PHX/aK0/u2QWDJxUb4BdQXTkh
         8G4KphAD1D2aP4bT+rczzj0338SIhOeHX+ZD+8XhPE6o32CP1tcixMo5Nf2bAgPF+jj5
         FXB5jz2iXYa9ckYZ2XFOtoIwN7F8G/yMS3PVZ1A3S6ooV65iLpIdATVOzFM+AW3Z7A/4
         1NBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791505289; x=1792110089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SuA9XknANPL6VvC11pYgn0IAp4/AWH6zzAsKWJ2B0W4=;
        b=dIwfydFSO1Or1CLWn0oBf8pcfBIk0IWIIcHEWNOJmqsEcIVTUXceGQQ0ncHhaeAjje
         VsfoaS6Ebfi0sZwf4BvSfVCGQIiZKs2sekHfOchkRsx2WnO+8R5+fri3MFg+wUEighMu
         qKkXHIRyLOGItmUnbLoPUCq/m6fjEXRwDvw0D7q1XHYCe/WroePknXSfhbSaj3ME/LSk
         YyXglaN18fdI4k/2no+zLI6ff7AMw4kr6mS6mhIWy2AUiSpgIss1sr+mGbMHbAWWYfxG
         1lGqFmVuLo4kOxtEnDMwzXER9WYuBg1bg7umvwgPhxXZj3adDlDvoq5kxzmu+m1qVeSf
         KDqg==
X-Forwarded-Encrypted: i=1; AKwUvByp8jHwgSVB3cGvEpxoImtVdLDxycBoDcgZDQQ0Xuo6HuXBh4cVGWne4Qqs8MqByCXGcv9fKpmFU+f9Ov3Wb77L@lists.infradead.org
X-Gm-Message-State: AFuF++l6nj10DZvF1MNLH0rEPLaZbBBV0+iGDALJwZgnntrp0bWor2zJ
	KARqXmH/OQmVdkD30RArHI0ri5/UW/1ioK79F7bJundYuJF4AlgyX55C
X-Gm-Gg: AYBFou1zvTN+LyZd0ycWsViWzv5CP6is93uWVfjLTZrPzmKovO16837tOdcFca0ajI0
	rLkUJm7i6eiYef21Qq+xHfcLldmxy9bv3gVjZOpTxFRSDAgHUcs9zUyqQHsDP6DgUUU8QiGTWEn
	d7oLRRwNqeVJS8b+FwWHujTG7GhB1Mo4UZayvk+wf1ytcXO+IN9HFMe4LU5Z3Yz3aZUpupMwFBV
	gKIVo47oVUvXhXqT5RetpuzoKNwxXMXhpMpvLOeCh4dcS20J9/HF46KuVPgj8okkzTRs0rNR8oI
	kjmRr3x2xvXBkDxWv9tc9HxwFKM9E+ELqmGjcYev4XHFPylr1Ho3rW0HNkfZXGilPp+4RjS26iT
	ri/uWIPZxScm4UZEgBItiFbJFg2ftc3X6cOzNsD3o6sor6Dm+34qwbxoJdIflQAP2EDCJl2TkzL
	3fvX54pSmBduedMH5OgRkB24PFA2+4UHfrc1zVd65sBUDofCyq12R0yTDO3RGRbxppQMm7G2AHB
	CM/YxLLJQGyo/ZvrBRn1Y9jCjlB0ZRvVtdE9vhT2VPaWXCR9VFZkFK4ijHRO1rinfPIkf/dXZwt
	VPjw4W/IZo+gYRPDNeEnWfZd5Q85Rl55PNNNBnDGiaHbp8W4oayKTij9g5/X/7G7v48JdL1H6JB
	hMIZ7vqk=
X-Received: by 2002:a05:600c:8706:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4a18e4b0f6amr2065355e9.20.1791505289240;
        Thu, 08 Oct 2026 17:21:29 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4987casm3364605e9.1.2026.10.08.17.21.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 17:21:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] iommu: Add iommu_map_sgtable_dma()
Date: Fri,  9 Oct 2026 02:21:13 +0200
Message-Id: <20261009002114.67851-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261009002114.67851-1-kmehltretter@gmail.com>
References: <20261009002114.67851-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_172131_477805_2A38ED7F 
X-CRM114-Status: GOOD (  22.01  )
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

DMA-BUF attachments provide DMA addresses, not CPU-side pages.
iommu_map_sgtable() needs those pages, so private-domain importers such
as Rockchip cannot use it with strict DMABUF_DEBUG.

Add an iommu-dma helper to map a live attachment into another domain by
translating through the device's default DMA domain. Roll back target
mappings on error. This still recovers physical addresses internally.

Only non-bounced iommu-dma mappings are supported. Other DMA backends,
marked bus addresses and zero translations return -EOPNOTSUPP, as does
the IOMMU_DMA=n stub. A zero lookup cannot distinguish a hole from PA0.
Reject bounce slots because a second mapping cannot keep them in sync
with writes to the original buffer.

DMABUF_DEBUG currently drops DMA flags from its copy, so the bus-address
check depends on the input retaining that mark.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/dma-iommu.c | 131 ++++++++++++++++++++++++++++++++++++++
 include/linux/iommu.h     |  12 ++++
 2 files changed, 143 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 58c624513cd4..b9a1f91ec5db 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -38,6 +38,137 @@
 #include "dma-iommu.h"
 #include "iommu-pages.h"
 
+/**
+ * iommu_map_sgtable_dma - map the DMA side of an sg_table into a domain
+ * @domain: domain to map into
+ * @iova: IOVA of the first byte
+ * @dev: device for which @sgt is mapped
+ * @sgt: live DMA-API mapping for @dev, backed by non-bounced RAM
+ * @prot: IOMMU protection flags
+ *
+ * Translate the DMA addresses through @dev's default iommu-dma domain and
+ * map the backing memory into @domain without reading the CPU side of @sgt.
+ * Direct DMA and other DMA backends are not supported. Entries marked as
+ * PCI P2P bus addresses and SWIOTLB bounce buffers are also not supported.
+ *
+ * The caller must keep the source mapping, DMA backend and default domain
+ * unchanged until the target mapping is removed. This function may sleep.
+ * DMA addresses and lengths must be aligned to the smaller of the source
+ * and target domains' minimum page sizes. @iova and the total length must
+ * be aligned to the target domain's minimum page size.
+ *
+ * A zero reverse translation is unsupported: iommu_iova_to_phys() cannot
+ * distinguish an absent mapping from a mapping to physical address zero.
+ *
+ * Return: the number of bytes mapped, -EOPNOTSUPP for unsupported source
+ * mappings or source alignment, or another negative errno on error. Any
+ * target mappings installed by this call are removed on error.
+ */
+ssize_t iommu_map_sgtable_dma(struct iommu_domain *domain, unsigned long iova,
+			      struct device *dev, struct sg_table *sgt,
+			      int prot)
+{
+	struct iommu_domain *dma_domain;
+	size_t len = 0, mapped = 0, total = 0;
+	struct scatterlist *sg;
+	size_t granule, target_granule;
+	phys_addr_t start = 0;
+	unsigned long last_iova;
+	unsigned int i;
+	int ret;
+
+	if (!domain->pgsize_bitmap)
+		return -EINVAL;
+
+	target_granule = 1UL << __ffs(domain->pgsize_bitmap);
+	if (!use_dma_iommu(dev))
+		return -EOPNOTSUPP;
+	dma_domain = iommu_get_dma_domain(dev);
+	if (!dma_domain || !dma_domain->pgsize_bitmap)
+		return -EOPNOTSUPP;
+	granule = min(target_granule,
+		      1UL << __ffs(dma_domain->pgsize_bitmap));
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		dma_addr_t last_dma;
+		size_t dma_len = sg_dma_len(sg);
+
+		if (sg_dma_is_bus_address(sg))
+			return -EOPNOTSUPP;
+		if (!dma_len || !IS_ALIGNED(sg_dma_address(sg), granule) ||
+		    !IS_ALIGNED(dma_len, granule))
+			return -EOPNOTSUPP;
+		if (check_add_overflow(sg_dma_address(sg), dma_len - 1,
+				       &last_dma) ||
+		    check_add_overflow(total, dma_len, &total))
+			return -EOVERFLOW;
+	}
+	if (!total)
+		return 0;
+	if (total > SSIZE_MAX || !IS_ALIGNED(iova, target_granule) ||
+	    !IS_ALIGNED(total, target_granule))
+		return -EINVAL;
+	if (check_add_overflow(iova, total - 1, &last_iova))
+		return -EOVERFLOW;
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		dma_addr_t dma_addr = sg_dma_address(sg);
+		size_t dma_len = sg_dma_len(sg);
+
+		while (dma_len) {
+			phys_addr_t next;
+			phys_addr_t phys;
+
+			phys = iommu_iova_to_phys(dma_domain, dma_addr);
+			if (!phys || swiotlb_find_pool(dev, phys)) {
+				ret = -EOPNOTSUPP;
+				goto out_err;
+			}
+
+			if (len && check_add_overflow(start, len, &next)) {
+				ret = -EOVERFLOW;
+				goto out_err;
+			}
+			if (len && phys != next) {
+				ret = iommu_map_nosync(domain, iova + mapped,
+						       start, len, prot,
+						       GFP_KERNEL);
+				if (ret)
+					goto out_err;
+				mapped += len;
+				len = 0;
+			}
+			if (!len)
+				start = phys;
+			if (check_add_overflow(len, granule, &len)) {
+				ret = -EOVERFLOW;
+				goto out_err;
+			}
+			dma_addr += granule;
+			dma_len -= granule;
+		}
+	}
+
+	if (len) {
+		ret = iommu_map_nosync(domain, iova + mapped, start, len, prot,
+				       GFP_KERNEL);
+		if (ret)
+			goto out_err;
+		mapped += len;
+	}
+
+	ret = iommu_sync_map(domain, iova, mapped);
+	if (ret)
+		goto out_err;
+
+	return mapped;
+
+out_err:
+	iommu_unmap(domain, iova, mapped);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_map_sgtable_dma);
+
 struct iommu_dma_msi_page {
 	struct list_head	list;
 	dma_addr_t		iova;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ac43b8b93f14..95d90c7f953b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1604,8 +1604,20 @@ static inline void iommu_debugfs_setup(void) {}
 #endif
 
 #ifdef CONFIG_IOMMU_DMA
+ssize_t iommu_map_sgtable_dma(struct iommu_domain *domain, unsigned long iova,
+			      struct device *dev, struct sg_table *sgt,
+			      int prot);
 int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
 #else /* CONFIG_IOMMU_DMA */
+static inline ssize_t iommu_map_sgtable_dma(struct iommu_domain *domain,
+					    unsigned long iova,
+					    struct device *dev,
+					    struct sg_table *sgt,
+					    int prot)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base)
 {
 	return -ENODEV;
-- 
2.53.0


