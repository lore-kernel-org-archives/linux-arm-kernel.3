Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1512C98318
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 01:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lelMh14JrGavtZ6asWUfZuJNFtBWesyUfwFCF+GGQWw=; b=YzEvOkkd6iB9mkHnaWubBtc5uu
	jXyyeO/q2Ky1b/Vd1hNzPACQP0JjQz3QckPJSh3WdTm3q61L0z9VaJhj+m2DcEwsJIJcBl83+8LVW
	l/0a3eHbTLmASm8UV4mlCnI7dC/ceH7TUplknN3nVmeVQVvRbXjHLecvpooCuZlH270daUnLFFy6M
	0cPrIQ4NSy50Py2X3Zdmvr90lgPuO5h+3LbWhih8OWTjqs0a8xi2tGp/IfLNdpouYQNGeBtnZ/rsM
	SN4nj35OK/1HhJ7QHMWFgkSl0MUH7lrKGp3cj2fH6qC/jp9MmvsX63cuIyzdeA5iwqwiPrLCu32un
	cCrPg/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9uV3-0000000CU4v-2hSk;
	Fri, 25 Sep 2026 01:13:17 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9uV0-0000000CU3U-20X2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 01:13:16 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-869b8d63e28so462581b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 18:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790298793; x=1790903593; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lelMh14JrGavtZ6asWUfZuJNFtBWesyUfwFCF+GGQWw=;
        b=tDmnk3SHGx2EgV9s3L4b3qas9aRJCF4Jna1iyfZ0+hZesvbFjNdOcuAy+EBwLNBzR/
         1RJmCTRdI+2qnPefpfdao2x94gcJCGwTTMPH3/X4xLgs+Mcmr4x9ci0RSkKEbSvvj+rQ
         WFJIXY7dBBmiPvWTS2T7aq46TUXCJF7YjJ9k6ri8ZYx2GALMUjMScvWRrz1p3tbc5FJX
         z6DdGFXhvJB3VvkpNeHj2ShQfPm+zV8GEK26SiUKoprnDlThwwa/UxziNlr2az95/C6z
         hlJe7pRvQ9u0/cADIU97bKw39o5C9pVQK0WVkCfEUSJhZ7Ad3zsJPZkKMLZR3bPmcbTA
         ClLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790298793; x=1790903593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lelMh14JrGavtZ6asWUfZuJNFtBWesyUfwFCF+GGQWw=;
        b=X37/0zTlzyiMZKvZZLY53yauRzc5auCgZovinfxEv94TuCDIgb7RL8AyizwdrSlrZR
         kj9at0Gtq6h3bMZwI+qTwLjEsJQDE763dgQ2CrV2ksAAZp3+4muOBZxcMlIGx+cIl+nx
         8Zhkt6nyT9AbdO5cb9289tTyCsjiM8i7u4lSXdLU9WXWnvnBWUm6M1k7s7JxCd292tlV
         zH11IrjhiPG75Cx8Qst8mE4Vt43SIHxHZCefKhEzbkQgyDhpNQ8aGKkEqtpCGiQAk2sR
         q/zvFTBWUDKDtW0pPvtoMbgCD97I2oBKvcIcZpYo+RdlaOlLNQ57AGXCiheVqzQ31KaP
         6AHA==
X-Forwarded-Encrypted: i=1; AKwUvBwC73UWoximzdrBy488+YYV4sMMmunwDYnUHfexEWnJR9nXHVi7ZbiuwDrMxNXEjvkifC+oUzTOjRSy2X4yxdrn@lists.infradead.org
X-Gm-Message-State: AFuF++nZSX+xiGKImLjCogHXb4PtkDpWRTE869AKGqq1W4hy/8Ql1Ejr
	tgJnUn7aULSwnA+ssEqK2Dt1XRIuc2yrkRfHZlryJgBFPJW6ifwXzPAkAj6vPi0li7wCP2S+MP0
	nCDsGhweBYpY0uQ==
X-Received: from pfbg5.prod.google.com ([2002:a05:6a00:ae05:b0:87f:c4bd:8a29])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:28c3:b0:87d:3894:198d with SMTP id d2e1a72fcca58-87e9ca1ea12mr4000958b3a.58.1790298792751;
 Thu, 24 Sep 2026 18:13:12 -0700 (PDT)
Date: Fri, 25 Sep 2026 01:13:05 +0000
In-Reply-To: <20260925011308.3381953-1-skhawaja@google.com>
Mime-Version: 1.0
References: <20260925011308.3381953-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925011308.3381953-2-skhawaja@google.com>
Subject: [RFC PATCH 1/3] vfio: selftests: Add support of creating iommus from iommufd
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_181314_526533_47399550 
X-CRM114-Status: GOOD (  16.47  )
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

Add API to init a struct iommu using an already opened iommufd instance
and attach devices to it.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 .../vfio/lib/include/libvfio/iommu.h          |  2 +
 .../lib/include/libvfio/vfio_pci_device.h     |  2 +
 tools/testing/selftests/vfio/lib/iommu.c      | 60 +++++++++++++++++--
 .../selftests/vfio/lib/vfio_pci_device.c      | 25 ++++++--
 4 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
index e9a3386a4719..62f1e8affd2b 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
@@ -29,10 +29,12 @@ struct iommu {
 	int container_fd;
 	int iommufd;
 	u32 ioas_id;
+	u32 hwpt_id;
 	struct list_head dma_regions;
 };
 
 struct iommu *iommu_init(const char *iommu_mode);
+struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id);
 void iommu_cleanup(struct iommu *iommu);
 
 int __iommu_map(struct iommu *iommu, struct dma_region *region);
diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index e19bd94b8dd2..4dcc23bc9b78 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -19,6 +19,7 @@ struct vfio_pci_device {
 	const char *bdf;
 	int fd;
 	int group_fd;
+	u32 dev_id;
 
 	struct iommu *iommu;
 
@@ -82,6 +83,7 @@ static inline void vfio_pci_cmd_clear(struct vfio_pci_device *device, u16 bits)
 	vfio_pci_config_writew(device, PCI_COMMAND, cmd & ~bits);
 }
 
+void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu);
 void vfio_pci_irq_enable(struct vfio_pci_device *device, u32 index,
 			 u32 vector, int count);
 void vfio_pci_irq_disable(struct vfio_pci_device *device, u32 index);
diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
index b6f3c5c84e01..6d2d5c82813c 100644
--- a/tools/testing/selftests/vfio/lib/iommu.c
+++ b/tools/testing/selftests/vfio/lib/iommu.c
@@ -405,6 +405,18 @@ struct iommu_iova_range *iommu_iova_ranges(struct iommu *iommu, u32 *nranges)
 	return ranges;
 }
 
+static u32 iommufd_hwpt_alloc(struct iommu *iommu, u32 dev_id)
+{
+	struct iommu_hwpt_alloc args = {
+		.size = sizeof(args),
+		.pt_id = iommu->ioas_id,
+		.dev_id = dev_id,
+	};
+
+	ioctl_assert(iommu->iommufd, IOMMU_HWPT_ALLOC, &args);
+	return args.out_hwpt_id;
+}
+
 static u32 iommufd_ioas_alloc(int iommufd)
 {
 	struct iommu_ioas_alloc args = {
@@ -415,17 +427,25 @@ static u32 iommufd_ioas_alloc(int iommufd)
 	return args.out_ioas_id;
 }
 
-struct iommu *iommu_init(const char *iommu_mode)
+static struct iommu *iommu_alloc(const char *iommu_mode)
 {
-	const char *container_path;
 	struct iommu *iommu;
-	int version;
 
 	iommu = calloc_assert(1, sizeof(*iommu));
 
 	INIT_LIST_HEAD(&iommu->dma_regions);
 
 	iommu->mode = lookup_iommu_mode(iommu_mode);
+	return iommu;
+}
+
+struct iommu *iommu_init(const char *iommu_mode)
+{
+	const char *container_path;
+	struct iommu *iommu;
+	int version;
+
+	iommu = iommu_alloc(iommu_mode);
 
 	container_path = iommu->mode->container_path;
 	if (container_path) {
@@ -449,10 +469,42 @@ struct iommu *iommu_init(const char *iommu_mode)
 	return iommu;
 }
 
+struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id)
+{
+	struct iommu *iommu;
+
+	iommu = iommu_alloc("iommufd");
+
+	iommu->iommufd = dup(iommufd);
+	VFIO_ASSERT_GT(iommu->iommufd, 0);
+
+	iommu->ioas_id = iommufd_ioas_alloc(iommu->iommufd);
+	iommu->hwpt_id = iommufd_hwpt_alloc(iommu, dev_id);
+
+	return iommu;
+}
+
+static void iommufd_cleanup(struct iommu *iommu)
+{
+	struct iommu_destroy args = {
+		.size = sizeof(args),
+	};
+
+	if (iommu->hwpt_id) {
+		args.id = iommu->hwpt_id;
+		ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);
+	}
+
+	args.id = iommu->ioas_id;
+	ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);
+
+	VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
+}
+
 void iommu_cleanup(struct iommu *iommu)
 {
 	if (iommu->iommufd)
-		VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
+		iommufd_cleanup(iommu);
 	else
 		VFIO_ASSERT_EQ(close(iommu->container_fd), 0);
 
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 774d1e90ec0e..81d3879d064f 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -469,15 +469,15 @@ int __vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
 	if (ioctl(device_fd, VFIO_DEVICE_BIND_IOMMUFD, &args))
 		return -errno;
 
-	return 0;
+	return args.out_devid;
 }
 
-static void vfio_device_bind_iommufd(int device_fd, int iommufd,
-				     const char *vf_token)
+int vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
 {
 	int ret = __vfio_device_bind_iommufd(device_fd, iommufd, vf_token);
 
-	VFIO_ASSERT_EQ(ret, 0, "Failed VFIO_DEVICE_BIND_IOMMUFD ioctl\n");
+	VFIO_ASSERT_GE(ret, 0, "Failed VFIO_DEVICE_BIND_IOMMUFD ioctl\n");
+	return ret;
 }
 
 static void vfio_device_attach_iommufd_pt(int device_fd, u32 pt_id)
@@ -503,10 +503,25 @@ static void vfio_pci_iommufd_setup(struct vfio_pci_device *device,
 				   const char *bdf, const char *vf_token)
 {
 	vfio_pci_cdev_open(device, bdf);
-	vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
+	device->dev_id = vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
 	vfio_device_attach_iommufd_pt(device->fd, device->iommu->ioas_id);
 }
 
+void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu)
+{
+	u32 pt_id = iommu->ioas_id;
+
+	/* Only iommufd supports changing struct iommu attachments */
+	VFIO_ASSERT_TRUE(iommu->iommufd);
+
+	if (iommu->hwpt_id)
+		pt_id = iommu->hwpt_id;
+
+	VFIO_ASSERT_NE(pt_id, 0);
+	vfio_device_attach_iommufd_pt(device->fd, pt_id);
+	device->iommu = iommu;
+}
+
 struct vfio_pci_device *vfio_pci_device_alloc(const char *bdf, struct iommu *iommu)
 {
 	struct vfio_pci_device *device;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


