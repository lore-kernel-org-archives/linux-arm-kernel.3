Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5825EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 00:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScAyHBVfs5HWRQcwNPAG1fCXHMLzKFfYfnZtLva146o=; b=DoQSIzatkhUsq04/VpOWjCSEWq
	D7a+4cPWc4pbeUh33mJibOMw4HiPnkp4g+4+91q7KqFLsQTv0TsPtOyoSdedH97lMNalFKNyeSKmR
	Riej2FgrZwHXgcwVC9CtCuZs9TCXfvm+iHb+xr8yMwDUk7EuLqqhULutB1ID6fcux8SDZDVDYnvOs
	9a/YZv17DGols1djEISvH90Rv/8aVZPBc1+FTPnjfAfYsMiUCQXaS/CEaLNtLTHnhQOXBU7mVSgoK
	Ob6GOSRMAplOvXX3Ps9UYh60FOtVap0OiW4xOYpckweeWiOBNepLxygeK4dEpLdW0HBfqU7NrVoWz
	9eBOrJdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2JBt-00000005ldf-2fjj;
	Wed, 09 Apr 2025 00:21:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Izs-00000005kIC-0k8y
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 00:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ScAyHBVfs5HWRQcwNPAG1fCXHMLzKFfYfnZtLva146o=; b=JB9aewuRzOpBkwwTGwfvE5b9nB
	uZyFuBRRaD8hfAQ/QqKX2KziA1STTHG36xvSnWkvLKNaq/eyOS/zvxDeUdI6uOK9XF9pxz7BfKrdP
	yemCNFY0apFj5fwpQEpjeHRPvd6RKvONBNL7OICjHFb064RWq4P8kfD92YdzmIr35rvBh5EPuwz43
	YEeeHQhRURhsFXksMNCaP4d/Kv4dpD9rgTOXCkWvZpRT1G9ZWiYzzv0HJEVZiodFerORazMt6WFoa
	Keefpcfcv2uAjf0h5GOdbvfpUTVd/s7Arg6jPnjbgxLg+ggDDF/O3k0FciReQ0ne+eDtSLR4yhKIZ
	AWWDA0bg==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Izl-00000008SIr-2yZs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 00:08:49 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id A01E62113E9C;
	Tue,  8 Apr 2025 17:08:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A01E62113E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744157319;
	bh=ScAyHBVfs5HWRQcwNPAG1fCXHMLzKFfYfnZtLva146o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=McGLXv4AovBaCa6ogzUN2QbkWjq82U9bygyOzdxyboM+WLaIEHEN+Ia0S8Ca4osN3
	 081VZK6aLeK1NFOE/z9NdXVB2oiEouMbfcZ/idTfeY4xhVRysMWSvM6MC9aUJi+dvn
	 xTq8hwe3HwPc6kMOXjjJKIwUkcfda/7qxlVcUWd4=
From: Roman Kisel <romank@linux.microsoft.com>
To: aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bp@alien8.de,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	gregkh@linuxfoundation.org,
	haiyangz@microsoft.com,
	hch@lst.de,
	hpa@zytor.com,
	James.Bottomley@HansenPartnership.com,
	Jonathan.Cameron@huawei.com,
	kys@microsoft.com,
	leon@kernel.org,
	lukas@wunner.de,
	luto@kernel.org,
	m.szyprowski@samsung.com,
	martin.petersen@oracle.com,
	mingo@redhat.com,
	peterz@infradead.org,
	quic_zijuhu@quicinc.com,
	robin.murphy@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next 5/6] arch, drivers: Add device struct bitfield to not bounce-buffer
Date: Tue,  8 Apr 2025 17:08:34 -0700
Message-ID: <20250409000835.285105-6-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409000835.285105-1-romank@linux.microsoft.com>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_010846_280164_3BD2D70E 
X-CRM114-Status: GOOD (  14.66  )
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

Bounce-buffering makes the system spend more time copying
I/O data. When the I/O transaction take place between
a confidential and a non-confidential endpoints, there is
no other way around.

Introduce a device bitfield to indicate that the device
doesn't need to perform bounce buffering. The capable
device may employ it to save on copying data around.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
---
 arch/x86/mm/mem_encrypt.c  | 3 +++
 include/linux/device.h     | 8 ++++++++
 include/linux/dma-direct.h | 3 +++
 include/linux/swiotlb.h    | 3 +++
 4 files changed, 17 insertions(+)

diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 95bae74fdab2..6349a02a1da3 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -19,6 +19,9 @@
 /* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
 bool force_dma_unencrypted(struct device *dev)
 {
+	if (dev->use_priv_pages_for_io)
+		return false;
+
 	/*
 	 * For SEV, all DMA must be to unencrypted addresses.
 	 */
diff --git a/include/linux/device.h b/include/linux/device.h
index 80a5b3268986..4aa4a6fd9580 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -725,6 +725,8 @@ struct device_physical_location {
  * @dma_skip_sync: DMA sync operations can be skipped for coherent buffers.
  * @dma_iommu: Device is using default IOMMU implementation for DMA and
  *		doesn't rely on dma_ops structure.
+ * @use_priv_pages_for_io: Device is using private pages for I/O, no need to
+ *		bounce-buffer.
  *
  * At the lowest level, every device in a Linux system is represented by an
  * instance of struct device. The device structure contains the information
@@ -843,6 +845,7 @@ struct device {
 #ifdef CONFIG_IOMMU_DMA
 	bool			dma_iommu:1;
 #endif
+	bool			use_priv_pages_for_io:1;
 };
 
 /**
@@ -1079,6 +1082,11 @@ static inline bool dev_removable_is_valid(struct device *dev)
 	return dev->removable != DEVICE_REMOVABLE_NOT_SUPPORTED;
 }
 
+static inline bool dev_priv_pages_for_io(struct device *dev)
+{
+	return dev->use_priv_pages_for_io;
+}
+
 /*
  * High level routines for use by the bus drivers
  */
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index d7e30d4f7503..b096369f847e 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -94,6 +94,9 @@ static inline dma_addr_t phys_to_dma_unencrypted(struct device *dev,
  */
 static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
+	if (dev_priv_pages_for_io(dev))
+		return phys_to_dma_unencrypted(dev, paddr);
+
 	return __sme_set(phys_to_dma_unencrypted(dev, paddr));
 }
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 3dae0f592063..35ee10641b42 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -173,6 +173,9 @@ static inline bool is_swiotlb_force_bounce(struct device *dev)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 
+	if (dev_priv_pages_for_io(dev))
+		return false;
+
 	return mem && mem->force_bounce;
 }
 
-- 
2.43.0


