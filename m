Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E3DC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 01:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8WxcCWRE+LsVuWv5E6OF/wCr2NQ/egFEQk0kG2izEQ=; b=a8R93HurRQafETJIvrg1K4tQPK
	0/SyIV8W6uvuJISrxaxzMiPDayQzaKA2P0TUTHhX/toc2ImimpFqX3Qa3PvEdC99FpQvywYeMDYo0
	LvdXjb8SqpXEZH1HJrRZhkBmc2fh5cvlJZvUT3QSqmKS9c4N7fr2CX1DYMi6sK9kjaGYGOL8JSQfV
	iO99tttbYPdqBTxwUXPneHLyvoJUZlIuKJx4jT6KfMpVGVFo2ZrjoihcriCUwI0mM9mDIhjdvmgKD
	HnpxO/uHSSnH8pi130zL0T9XolT84M7k/KMSp0HPxAPYO3bFEA17oh6BV0e5R5IbqeXcceMvK63+8
	pppa9CSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9uVH-0000000CU8D-3uHt;
	Fri, 25 Sep 2026 01:13:31 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9uV1-0000000CU3k-13DI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 01:13:16 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so715628a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 18:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790298794; x=1790903594; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8WxcCWRE+LsVuWv5E6OF/wCr2NQ/egFEQk0kG2izEQ=;
        b=rILAlx7YzukzJlt4KED/H5HsYAKvlk5vyxuwMHekDljZvYZYgfTgsDhe6EfRuhTXIP
         q61wtJhQ5KlTlzhq35gqq18ZGjpxVr2LG+7Gd5bJCXmsw2uOc8aLi1hjKAH3y5kbfDr/
         5ELx3eTVeHH5F8tQs3t/P2ZHdvSpcd74Zho2xVDZKZarxcrU3GQDAGJ+hkWMu6IdryuZ
         tAio+sL51jFUsQ+8x+bVCFKkf79q9kb0q9L81Ku3HaqyUxbsQdJxonFIn5OxS3TajNxe
         I5UZofDiR6kIu2u5/H3U7mPAl+rXR/Iwqzzg7TOXqHIQq2rDi0PxB3u57n+5gcpkT/Ao
         xSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790298794; x=1790903594;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L8WxcCWRE+LsVuWv5E6OF/wCr2NQ/egFEQk0kG2izEQ=;
        b=EZ6IDC2ssLkEhHsi50Y/4XS5EXqQms8PXRWLr4ket0/1vStqeKURCuIjrHHTJiFvuK
         hYzmqy7w98fCiFIzHuj5AGXgchcjxjIy73XRzqmV4PGADedvMsImc3zT5wRMjaAmNNNF
         a0Ruii67tlLXRe8TRoTJIGGZG+RBs/WMmJ9Hbho9Wp+U3Hg3wNovHSZZN3F1ROZeB6AK
         6JowcgV44CaRKRrk6eqT7DpaHtdCgXwcSQgtZsn+5VhPMicyw52wYpcNef7d6coEcsS4
         xA/Hw6jzwKxtKM6QwluqF6nLaCua9sBfP0mMIQkShv2cbX6ZS1DqJgTor5QlvSare+aP
         xxSw==
X-Forwarded-Encrypted: i=1; AKwUvBxpGpCJldItJtUQGjt1jLpJLl5NXJC9urnCT88sEPaOEKQZNl0mc+ay1pGouGYJ3EnGt3PXK/KaGMAC7TyOw9Mi@lists.infradead.org
X-Gm-Message-State: AFuF++mmTiWEebv28zSdUwnR7ae6hycEuByphPUrsDzAkJ0WHPyEeHDs
	sPX6ijmqD3G877ynpN+4uz26sq/7fPPvJQfVzSHphQPGiWLr2Hsgx24116ftQuF1OkSvzxVJdU5
	Z0i/560GRWzSM6A==
X-Received: from pgbdk13.prod.google.com ([2002:a05:6a02:c8d:b0:cc7:573b:6115])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4d85:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3a098ae21c7mr4203805a91.12.1790298793622;
 Thu, 24 Sep 2026 18:13:13 -0700 (PDT)
Date: Fri, 25 Sep 2026 01:13:06 +0000
In-Reply-To: <20260925011308.3381953-1-skhawaja@google.com>
Mime-Version: 1.0
References: <20260925011308.3381953-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925011308.3381953-3-skhawaja@google.com>
Subject: [RFC PATCH 2/3] vfio: selftests: Add iommufd hwpt replace test
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_181315_297678_A9E728B0 
X-CRM114-Status: GOOD (  20.48  )
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

Add a test that does iommufd hwpt replace while a DMA is ongoing. This
verifies the hitless replace of IOMMU domain without disrupting the DMA.

Note that the new domain is attached after mapping the required DMA
memory at the same IOVA in the new domain.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 tools/testing/selftests/vfio/Makefile         |   1 +
 .../vfio/vfio_iommufd_hwpt_replace_test.c     | 171 ++++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100644 tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 2c32c48db509..01d0e808871b 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -8,6 +8,7 @@ else
 CFLAGS = $(KHDR_INCLUDES)
 TEST_GEN_PROGS += vfio_dma_mapping_test
 TEST_GEN_PROGS += vfio_dma_mapping_mmio_test
+TEST_GEN_PROGS += vfio_iommufd_hwpt_replace_test
 TEST_GEN_PROGS += vfio_iommufd_setup_test
 TEST_GEN_PROGS += vfio_pci_device_test
 TEST_GEN_PROGS += vfio_pci_device_init_perf_test
diff --git a/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c b/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
new file mode 100644
index 000000000000..3ec243aae626
--- /dev/null
+++ b/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+
+#include <linux/sizes.h>
+#include <linux/vfio.h>
+
+#include <libvfio.h>
+
+#include "kselftest_harness.h"
+
+static const char *device_bdf;
+
+static void region_setup(struct iommu *iommu,
+			 struct iova_allocator *iova_allocator,
+			 struct dma_region *region, u64 size)
+{
+	const int flags = MAP_SHARED | MAP_ANONYMOUS;
+	const int prot = PROT_READ | PROT_WRITE;
+	void *vaddr;
+
+	vaddr = mmap(NULL, size, prot, flags, -1, 0);
+	VFIO_ASSERT_NE(vaddr, MAP_FAILED);
+
+	region->vaddr = vaddr;
+	region->iova = iova_allocator_alloc(iova_allocator, size);
+	region->size = size;
+
+	iommu_map(iommu, region);
+}
+
+static void region_teardown(struct iommu *iommu, struct dma_region *region)
+{
+	iommu_unmap(iommu, region);
+	VFIO_ASSERT_EQ(munmap(region->vaddr, region->size), 0);
+}
+
+FIXTURE(vfio_iommufd_replace_hwpt_test) {
+	struct iommu *iommu;
+	struct vfio_pci_device *device;
+	struct iova_allocator *iova_allocator;
+	struct dma_region memcpy_region;
+
+	u64 size;
+	void *src;
+	void *dst;
+	iova_t src_iova;
+	iova_t dst_iova;
+};
+
+FIXTURE_SETUP(vfio_iommufd_replace_hwpt_test)
+{
+	struct vfio_pci_driver *driver;
+
+	self->iommu = iommu_init("iommufd");
+	self->device = vfio_pci_device_init(device_bdf, self->iommu);
+	self->iova_allocator = iova_allocator_init(self->iommu);
+
+	driver = &self->device->driver;
+
+	region_setup(self->iommu, self->iova_allocator, &self->memcpy_region, SZ_2M);
+	region_setup(self->iommu, self->iova_allocator, &driver->region, SZ_2M);
+
+	if (driver->ops)
+		vfio_pci_driver_init(self->device);
+
+	self->size = self->memcpy_region.size / 2;
+	self->src = self->memcpy_region.vaddr;
+	self->dst = self->src + self->size;
+
+	self->src_iova = to_iova(self->device, self->src);
+	self->dst_iova = to_iova(self->device, self->dst);
+}
+
+FIXTURE_TEARDOWN(vfio_iommufd_replace_hwpt_test)
+{
+	struct vfio_pci_driver *driver = &self->device->driver;
+
+	if (driver->ops)
+		vfio_pci_driver_remove(self->device);
+
+	region_teardown(self->iommu, &self->memcpy_region);
+	region_teardown(self->iommu, &driver->region);
+
+	iova_allocator_cleanup(self->iova_allocator);
+	vfio_pci_device_cleanup(self->device);
+	iommu_cleanup(self->iommu);
+}
+
+FIXTURE_VARIANT(vfio_iommufd_replace_hwpt_test) {
+	u32 attaches;
+};
+
+FIXTURE_VARIANT_ADD(vfio_iommufd_replace_hwpt_test, domain_replace) {
+	.attaches = 1000,
+};
+
+FIXTURE_VARIANT_ADD(vfio_iommufd_replace_hwpt_test, noreplace) {
+	.attaches = 0,
+};
+
+TEST_F_TIMEOUT(vfio_iommufd_replace_hwpt_test, memcpy, 120)
+{
+	struct dma_region memcpy_region = {}, driver_region = {};
+	struct vfio_pci_driver *driver = &self->device->driver;
+	struct iommu *iommu2 = NULL;
+	u64 size = 0;
+	int ret;
+	u32 i;
+
+	if (variant->attaches) {
+		iommu2 = iommufd_iommu_init(self->iommu->iommufd,
+					    self->device->dev_id);
+
+		memcpy_region = self->memcpy_region;
+		driver_region = self->device->driver.region;
+
+		iommu_map(iommu2, &memcpy_region);
+		iommu_map(iommu2, &driver_region);
+	}
+
+	if (driver->ops) {
+		memset(self->src, 'x', self->size);
+		memset(self->dst, 'y', self->size);
+
+		size = min_t(u64, driver->max_memcpy_size, self->size);
+
+		/*
+		 * Fill the device's queue. memcpy_start() returns with
+		 * max_memcpy_count transfers still outstanding.
+		 */
+		vfio_pci_driver_memcpy_start(self->device,
+					     self->src_iova,
+					     self->dst_iova,
+					     size, driver->max_memcpy_count);
+	}
+
+	/*
+	 * Replace the domain repeatedly while that transfer is in flight. Since
+	 * domain replacement is a race with the translation requests, it needs
+	 * to be done multiple times to capture the small window where iommu
+	 * faults can occur.
+	 *
+	 * The loop ends on the original domain, so the teardown below is safe.
+	 */
+	for (i = 0; i < variant->attaches; i++) {
+		vfio_pci_device_attach_iommu(self->device, iommu2);
+		vfio_pci_device_attach_iommu(self->device, self->iommu);
+	}
+
+	if (driver->ops) {
+		ret = vfio_pci_driver_memcpy_wait(self->device);
+
+		ASSERT_EQ(0, ret);
+		ASSERT_EQ(0, memcmp(self->src, self->dst, size));
+	}
+
+	if (iommu2) {
+		iommu_unmap(iommu2, &memcpy_region);
+		iommu_unmap(iommu2, &driver_region);
+		iommu_cleanup(iommu2);
+	}
+}
+
+int main(int argc, char *argv[])
+{
+	device_bdf = vfio_selftests_get_bdf(&argc, argv);
+
+	return test_harness_run(argc, argv);
+}
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


