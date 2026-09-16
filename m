Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23ED8C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56iSjO7FRXuM+w7Fs70EXqmyAa954nz93o1jUYoMU2o=; b=UxMAMhR4uYqDfsYrt/uPQlEW9I
	ORoeqWw2vHCf9MtllTSxiwtCmGLIW9xKMJiMYi3vdnGujV9IVpbGjN/5Y8YoOdqxU+o7otGAdL4FJ
	KYAIzVvmUCC3cqQPGYyYUvcIQcY7KQ2ScexHqOWuXLy2G4qzRDjtoBzpVpH0a524s1SW62eViAoDW
	SDaYtji/LJsiRKUK+Zkzxpq96OfvAt8bUPlYQuhwN+AoCvwim+Cdjkr/eOfbTrWIqalQFM/CwdGbS
	Va+1Sy/6eAeV+cV0r5UjuLTpkbi3NX/mHHGLI3ZMPOvcCWA+oQLXqID3UEMuodRktmGg2260W3dBz
	HaocAIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wua-0000000A7c4-0M3U;
	Wed, 16 Sep 2026 21:11:24 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuT-0000000A7YY-2NZ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:18 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4qwp.prod.antispam.mailspamprotection.com; s=arckey; t=1789593077;
	 b=MVOtcgpGKHxiIXkf0AnWAGGrh9vd+KRxe67NevZTOCgYd7GdbPpG5Fv8xSa8TnqPno0LM8tnri
	  poDJmuwUb6kC4OvvUkM84kG7iHN0v0auzmh6RIKqqMPignxqGUdGBOj/QWluiJHYhwLycojLzL
	  HDT4OtZ2qG4dBYIOlXpaYqK3DqTcSaRwdNZxfi7x0Br74QwJ+GlU5NrL4xbacPJOyY2VAxzp4A
	  eZNdALlMjRKfQL92SiSkkZNgL7mf0dRJnwLTjYDHKFYYpt56Oo9SC2L/gNvQ79YciRgcKYTKlW
	  kAc4z1P0w+0S0tD4Mx5Mh9nIMiYpNpbOlnH7rzBxKmrTWA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4qwp.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4qwp.prod.antispam.mailspamprotection.com; s=arckey; t=1789593077;
	bh=EM4cT5DF36wycIZJ99PdoUjz8wtAbUGcA4G0bW53vug=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=aENz3+EXka1sO0HOTRBdAoIm3SX5F7HKc4Mbz4EpqWHTJZ0Oncz01t5pXg7KaP7ptuafc6WZb9
	  n7DwmeEyeVbs8gJ18Ym2uZquwj2Yo7GOMg2QDQ/qGX8PMFvEb2hycYlX5H7rGd/gq6ZnzH+reF
	  qGdfVuBcoy6D1/5YWo7tl2lg375vmfZEwZyFI8JmXbC5TaS0jjYPxWujTKkrs9ngTMpgbchszu
	  InuTdy9M2u4UAoEFOrWSY2doJwsXddIDeZT2cRUgate4KyBayic2yvQVOFgk6qI80KEH2XGDrj
	  rDbpZm4a+m6gmxEFhMDIMdYC1MxZrVgrWOvAK4uRqAgWnA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=56iSjO7FRXuM+w7Fs70EXqmyAa954nz93o1jUYoMU2o=; b=P3YweC7ZnAdgXaTCN5nRtNCZzi
	2VtgW5AvgGacmOKD/pOqKB82C1ZrqxHbHB2XPDn+Z1FO6nxNg21ME0xeagdNYTVMlrFQ557fUjk0O
	thVBdxZoYMYvsyJzHToq06T6UK1nMlCVeSzDAAJUgjUGiE1mX7kPGAE8+hsgxVdENcn0=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4qwp.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuQ-000000066iH-2kHa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=56iSjO7FRXuM+w7Fs70EXqmyAa954nz93o1jUYoMU2o=; b=kYT+VEN/4dxyq6uhh/D+wBnDGu
	eKblrwstxuw51BXNgrbDMo3IZOFp7F93C/GpxEXToL0ykKtlIWQ3kKoxqeNga1GgNRg1SshuCAiEg
	2UknAcyr10AHBEzqBsqH387OYyzVfs4gRPGpzBDHdqy008sMN3x2vDyxyKeA7AONvgWo=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuM-0000000058P-1hov;
	Wed, 16 Sep 2026 21:11:10 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:51 +0200
Subject: [PATCH RFC 06/12] remoteproc: virtio: add bounce buffering for
 data buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-6-dac8c5eb4aa9@valla.it>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10534; i=francesco@valla.it;
 h=from:subject:message-id; bh=EM4cT5DF36wycIZJ99PdoUjz8wtAbUGcA4G0bW53vug=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWZ80fxX1OfHdb/rc5atC+b4/2dRvX244b1ZUklvQo
 fdxa1pkO0pZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJ6L1mZOiv+8da+2pdae+H
 840f8u0No2/PX/dx4eu31wufzV4vaHWLkeHE9evbHXq77szWtblybzbHLs+b8sdLxCPZ+w+KvDi
 5s4ADAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 7b01e3d2ab43d79bb15b09459cc4925c
X-AntiAbuse: ID - 7b01e3d2ab43d79bb15b09459cc4925c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuQ-000000066iH-2kHa-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4qwp.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_141117_835834_F2A176B1 
X-CRM114-Status: GOOD (  26.41  )
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

Depending on the driver originating them, data buffers used for virtio
communication can either:

  - already be allocated from the coherent memory area that is
    accessible by the remote processor; this is the case of rpmsg
    and the rproc flavor of virtio-console;
  - be allocated from generic kmem, and thus not accessible directly by
    the remote processor.

Exploiting the map operations, which are used by the virtio framework
when VIRTIO_F_ACCESS_PLATFORM is part of a vdev's feature flags, add
bounce buffering for the second case: when the map() callback is called
for a buffer, one or more pages of coherent memory are allocated and
data is copied to them, then they are exposed to the remote processor;
the data is  then bounced back on unmap().

The first case is not impacted, since buffers already suitable for
remote transmission are passed through.

With the bounce buffering in place, any kind of virtio device can be
supported through the remoteproc-virtio transport, at least from a
data exchange standpoint.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 182 +++++++++++++++++++++++++++++++--
 include/linux/remoteproc.h             |  14 +++
 2 files changed, 190 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index cfd66d9d1c9e..d21b3b8044df 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -241,7 +241,14 @@ static void rproc_virtio_reset(struct virtio_device *vdev)
 	dev_dbg(&vdev->dev, "reset !\n");
 }
 
-/* provide the vdev features as retrieved from the firmware */
+/* Provide the vdev features as retrieved from the firmware, plus the following
+ * additional ones:
+ *   - VIRTIO_F_VERSION_1 that is required by some non-rpmsg virtio devices
+ *   - VIRTIO_F_ACCESS_PLATFORM to force usage of the map operations
+ */
+#define RPROC_VIRTIO_STATIC_FEATURES \
+	((1ULL << VIRTIO_F_VERSION_1) | (1ULL << VIRTIO_F_ACCESS_PLATFORM))
+
 static u64 rproc_virtio_get_features(struct virtio_device *vdev)
 {
 	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
@@ -249,7 +256,7 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
 
 	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
 
-	return rsc->dfeatures | (1ULL << VIRTIO_F_VERSION_1);
+	return rsc->dfeatures | RPROC_VIRTIO_STATIC_FEATURES;
 }
 
 static void rproc_transport_features(struct virtio_device *vdev)
@@ -275,16 +282,16 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 	/* Give virtio_rproc a chance to accept features. */
 	rproc_transport_features(vdev);
 
-	/* Make sure we don't have any features > 32 bits except VIRTIO_F_VERSION_1 */
+	/* Make sure we don't have any features > 32 bits */
 	if (WARN_ON_ONCE((u32)vdev->features !=
-			 (vdev->features & ~(1ULL << VIRTIO_F_VERSION_1))))
+			 (vdev->features & ~RPROC_VIRTIO_STATIC_FEATURES)))
 		return -1;
 
 	/*
 	 * Remember the finalized features of our vdev, and provide it
 	 * to the remote processor once it is powered on.
 	 */
-	rsc->gfeatures = vdev->features & ~(1ULL << VIRTIO_F_VERSION_1);
+	rsc->gfeatures = vdev->features & ~RPROC_VIRTIO_STATIC_FEATURES;
 
 	return 0;
 }
@@ -337,6 +344,151 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
 	.set		= rproc_virtio_set,
 };
 
+static inline unsigned int rproc_virtio_bounce_slot(struct device *dma_dev,
+						    dma_addr_t dma_handle)
+{
+	const dma_addr_t dma_base = dma_dev_coherent_base(dma_dev);
+
+	return (dma_handle - dma_base) >> PAGE_SHIFT;
+}
+
+static dma_addr_t rproc_virtio_map_page(union virtio_map map, struct page *page,
+					unsigned long offset, size_t size,
+					enum dma_data_direction dir,
+					unsigned long attrs)
+{
+	struct device *dev = map.dma_dev;
+	struct rproc_vdev *rvdev = dev_get_drvdata(dev);
+	dma_addr_t dma_base = dma_dev_coherent_base(dev);
+	size_t dma_size = dma_dev_coherent_size(dev);
+	phys_addr_t paddr = page_to_phys(page) + offset;
+	void *vaddr = page_to_virt(page) + offset;
+	struct rproc_map_record *record;
+	dma_addr_t map_handle;
+	void *bounce;
+
+	// No need to allocate a bounce buffer if the memory to map is already
+	// part of the device's coherent pool.
+	if (paddr >= dma_base && paddr < (dma_base + dma_size)) {
+		// The allocation details will be recorded also in this case,
+		// indicating that no bounce buffer was allocated.
+		map_handle = (dma_addr_t)paddr;
+		bounce = NULL;
+	} else {
+		// Allocate bounce buffer from device coherent memory
+		bounce = dma_alloc_coherent(dev, size, &map_handle, GFP_KERNEL | __GFP_ZERO);
+		if (!bounce)
+			return DMA_MAPPING_ERROR;
+
+		// Copy data to bounce buffer
+		memcpy(bounce, vaddr, size);
+	}
+
+	// Save bounce details
+	record = &rvdev->map_records[rproc_virtio_bounce_slot(dev, map_handle)];
+
+	record->original = vaddr;
+	record->size = size;
+	record->bounce = bounce;
+
+	return map_handle;
+}
+
+static void rproc_virtio_unmap_page(union virtio_map map, dma_addr_t map_handle,
+				    size_t size, enum dma_data_direction dir,
+				    unsigned long attrs)
+{
+	struct device *dev = map.dma_dev;
+	struct rproc_vdev *rvdev = dev_get_drvdata(dev);
+	unsigned int slot = rproc_virtio_bounce_slot(dev, map_handle);
+	struct rproc_map_record *record = &rvdev->map_records[slot];
+
+	WARN_ON(size != record->size);
+
+	// If a bounce buffer was used, copy data back to original one
+	if (record->bounce) {
+		memcpy(record->original, record->bounce, record->size);
+
+		dma_free_coherent(dev, record->size, record->bounce, map_handle);
+	}
+
+	record->original = NULL;
+	record->size = 0;
+	record->bounce = NULL;
+}
+
+static void rproc_virtio_sync_single_for_cpu(union virtio_map map,
+					     dma_addr_t map_handle,
+					     size_t size,
+					     enum dma_data_direction dir)
+{
+	struct device *dev = map.dma_dev;
+
+	dma_sync_single_range_for_cpu(dev, (map_handle & PAGE_MASK),
+				      offset_in_page(map_handle), size, dir);
+}
+
+static void rproc_virtio_sync_single_for_device(union virtio_map map,
+						dma_addr_t map_handle,
+						size_t size,
+						enum dma_data_direction dir)
+{
+	struct device *dev = map.dma_dev;
+
+	dma_sync_single_range_for_device(dev, (map_handle & PAGE_MASK),
+					 offset_in_page(map_handle), size, dir);
+}
+
+static void *rproc_virtio_alloc(union virtio_map map, size_t size,
+				dma_addr_t *map_handle, gfp_t gfp)
+{
+	struct device *dev = map.dma_dev;
+
+	return dma_alloc_coherent(dev, size, map_handle, gfp);
+}
+
+static void rproc_virtio_free(union virtio_map map, size_t size, void *vaddr,
+			      dma_addr_t map_handle, unsigned long attrs)
+{
+	struct device *dev = map.dma_dev;
+
+	dma_free_coherent(dev, size, vaddr, map_handle);
+}
+
+static bool rproc_virtio_need_sync(union virtio_map map, dma_addr_t map_handle)
+{
+	struct device *dev = map.dma_dev;
+
+	return dma_need_sync(dev, map_handle);
+}
+
+static int rproc_virtio_mapping_error(union virtio_map map, dma_addr_t map_handle)
+{
+	if (unlikely(map_handle == DMA_MAPPING_ERROR))
+		return -ENOMEM;
+
+	return 0;
+}
+
+static inline size_t rproc_virtio_max_mapping_size(union virtio_map map)
+{
+	struct device *dev = map.dma_dev;
+
+	return dma_dev_coherent_size(dev);
+}
+
+static const struct virtio_map_ops rproc_virtio_map_ops = {
+	.map_page = rproc_virtio_map_page,
+	.unmap_page = rproc_virtio_unmap_page,
+	.sync_single_for_cpu = rproc_virtio_sync_single_for_cpu,
+	.sync_single_for_device = rproc_virtio_sync_single_for_device,
+	.alloc = rproc_virtio_alloc,
+	.free = rproc_virtio_free,
+	.need_sync = rproc_virtio_need_sync,
+	.mapping_error = rproc_virtio_mapping_error,
+	.max_mapping_size = rproc_virtio_max_mapping_size,
+};
+
 /*
  * This function is called whenever vdev is released, and is responsible
  * to decrement the remote processor's refcount which was taken when vdev was
@@ -355,6 +507,8 @@ static void rproc_virtio_dev_release(struct device *dev)
 	of_reserved_mem_device_release(&rvdev->pdev->dev);
 	dma_release_coherent_memory(&rvdev->pdev->dev);
 
+	kvfree(rvdev->map_records);
+
 	put_device(&rvdev->pdev->dev);
 }
 
@@ -429,13 +583,29 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 		of_reserved_mem_device_init_by_idx(dev, np, 0);
 	}
 
+	/* Allocate one tracking record for each page of the device reserved
+	 * memory. Contiguous memory is not required for this array, which can
+	 * also be quite big (depending on the size of the coherent memory), so
+	 * let's use vmalloc for this allocation.
+	 */
+	rvdev->map_records = kvcalloc(dma_dev_coherent_size(dev) >> PAGE_SHIFT,
+				      sizeof(*rvdev->map_records),
+				      GFP_KERNEL);
+	if (!rvdev->map_records) {
+		dev_err(dev, "failed to allocate memory for map records\n");
+		return -ENOMEM;
+	}
+
 	/* Allocate virtio device */
 	vdev = kzalloc_obj(*vdev);
-	if (!vdev)
+	if (!vdev) {
+		kvfree(rvdev->map_records);
 		return -ENOMEM;
+	}
 
 	vdev->id.device = id;
 	vdev->config = &rproc_virtio_config_ops;
+	vdev->map = &rproc_virtio_map_ops;
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index c3ba51fe9e54..2ff48b505ac0 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -339,10 +339,23 @@ struct rproc_vring {
 	struct virtqueue *vq;
 };
 
+/**
+ * struct rproc_map_record - remoteproc map record
+ * @original:	original virtual address
+ * @num: allocation size
+ * @bounce: bounce buffer virtual address (NULL if not used)
+ */
+struct rproc_map_record {
+	void *original;
+	size_t size;
+	void *bounce;
+};
+
 /**
  * struct rproc_vdev - remoteproc state for a supported virtio device
  * @subdev: handle for registering the vdev as a rproc subdevice
  * @pdev: remoteproc virtio platform device
+ * @map_records: array of map records
  * @id: virtio device id (as in virtio_ids.h)
  * @node: list node
  * @rproc: the rproc handle
@@ -358,6 +371,7 @@ struct rproc_vdev {
 	unsigned int id;
 	struct list_head node;
 	struct rproc *rproc;
+	struct rproc_map_record *map_records;
 	u32 rsc_offset;
 	u32 index;
 	unsigned int num_vrings;

-- 
2.55.0


