Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9422FFE51E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i9nRQWrSO8yCuAghUfsOuR4TVxWLZXmy5/OuspGEKv4=; b=DEi2YKOYVR4sr8nfQaWN5OiA95
	YORZnNcUUtK64qSYW51TutW+yLo24tvcmLgsWe6c0qrO+8+jaswGosWd2QninxcTSV4ZBf/aPCvGC
	u+etiIWbpKBw4HtYgu0Ah3Uqnvqz7uxfBRjMJ0eVkyf35YonKY6TpF6opFyNn8spYfPKJ3ocP3slX
	26vU3ffDRqcIxpx0QRO5UZOp8WYheBUOkxMAKo7dQFN+zDImcFZbwgnfSXlFjRd+iVjxu0agrR89n
	+vqh87YteiqaXVmvc73C9tZDhdawY9h5gxYgGUU3wbedQThn8E/cchMP76f+ci5mk2uId6TL0tGrN
	gVGsIIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCIF-0000000Ctot-0BQ3;
	Fri, 24 Apr 2026 08:53:47 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCIC-0000000CtoX-38Qg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:53:45 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82f9f49e4beso3952621b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 01:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777020823; x=1777625623; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i9nRQWrSO8yCuAghUfsOuR4TVxWLZXmy5/OuspGEKv4=;
        b=kvdZ5MFYNAsMkfpCeZbwH55qz0OaLlEfPolhDjCy7ge/KJPK6ew2dyAAW9gzHM5NW6
         TanrRvGJy+qBpjBR3b5BudR6tQaJCkZPJWa3G5TgbiHGd3PLoUrtfbPyxWJjLUaV9gly
         Uap1fQbx/mDTYjyuHpyC8pzvCUuTQaVy9107N6UyWS+k03Sg5Ccw8uhf806RFUKSULwK
         POaOlp1T6O/BGajVaHjwH0IoDyilqSYyXpD7twKAFbzY64M19oSzkJZQx6U4yR0FeUMo
         iWhLrR2H/vdG92ucOUffocdPLccwqtPKGUiR6zlbWH2TotgNd1IYVgt1szMSJDw1gGQX
         rGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020823; x=1777625623;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9nRQWrSO8yCuAghUfsOuR4TVxWLZXmy5/OuspGEKv4=;
        b=O36HdSRz9s4lYXeZb4+9fg/8RyviJu7xF3FJJ74DuAZEVe/7aeonzF7u31Vi7k3n0E
         T2iQKh6hBai0SxX7KKv7LkYQRut1wZsEg366L+Tnpe0L+mTa3qZLbdkxrVU+/dAULFQh
         ZeXoEJRuDxU/165rtq9k7NwZK3oePc8rS1p6SgP2YkpjgocFcp+QQ9zwC+SyQCxcTmJP
         WUbl+ODt/FOq2MenUKI3AayTcOIQJoOjH7ePzv+fXH4MMnz41Sy0uiT4gklODKHtyIvt
         ++TDEVwSPbZXtLgBUj3MPT9kMeRoXPfeo9imjBPZZDmXsh2nHCIvH5ZhIknQx6fiZOjm
         ITpg==
X-Forwarded-Encrypted: i=1; AFNElJ/eVbH4qTAOKT9yRaPda4F7YvipdcyZirTi/7WoykLm9Fg83iiQ3U5WkuaHjSvKA53aWBucU9nRdr9Mrp3/ii8U@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ6pnkLmFAvmUu7TU3eqBZddlqaGI18OkjeIoulakJJd+HrjTL
	DATKxMAoV1E9Z8wFOgOQ06cvq5iiD9I9j5r+H5+v6I6RyN1pqIuloeMYbuyP39J9N8Rebo5rzYR
	k+NtQhLmk4l5MF8jTNSCo3wnhjA==
X-Received: from pfbho13.prod.google.com ([2002:a05:6a00:880d:b0:7ba:8e68:3140])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2ea5:b0:82f:1973:4b96 with SMTP id d2e1a72fcca58-82f8c91bc71mr35909962b3a.26.1777020823227;
 Fri, 24 Apr 2026 01:53:43 -0700 (PDT)
Date: Fri, 24 Apr 2026 08:53:39 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424085339.3503582-1-joonwonkang@google.com>
Subject: [PATCH RFC] iommu: Enable per-device SSID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org
Cc: jgg@ziepe.ca, nicolinc@nvidia.com, praan@google.com, kees@kernel.org, 
	amhetre@nvidia.com, Alexander.Grest@microsoft.com, baolu.lu@linux.intel.com, 
	smostafa@google.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Joonwon Kang <joonwonkang@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_015344_810958_49099E39 
X-CRM114-Status: GOOD (  28.56  )
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

For SVA, the IOMMU core always allocates PASID from the global PASID
space. The use of this global PASID space comes from the limitation of
the ENQCMD instruction in Intel CPUs that it fetches its PASID operand
from IA32_PASID, which is per-task.

Due to this nature, SVA with ARM SMMU v3 has been found not working in
our environment when other modules/devices compete for PASID. The
environment looks as follows:

- The device is not a PCIe device.
- The device is to use SVA.
- The supported SSID/PASID space is very small for the device; only 1 to
  3 SSIDs are supported.
- There is a custom way of transmitting the SSID from the kernel to the
  device.

With this setup, when other modules have allocated all the PASIDs that
our device is expected to use from the global PASID space via APIs like
iommu_alloc_global_pasid() or iommu_sva_bind_device(), SVA binding to
our device fails due to the lack of available PASIDs.

Since SSID/PASID is supported per-SID in ARM SMMU v3, this commit
leverages the fact and lifts the use of the global PASID space if
possible. What it does includes:

- Introduce a new IOMMU capability IOMMU_CAP_PER_DEV_PASID_SPACE, which
  represents whether the IOMMU supports an independent PASID space per-
  device, not shared across devices. ARM SMMU v3 is the case.
- Open a new API iommu_attach_device_pasid_any() to allocate any
  available PASID and attach an IOMMU domain to it.
- Opt out the use of the global PASID space for SVA if the IOMMU has
  that capability, and use the new API to allocate a PASID in that case.

Signed-off-by: Joonwon Kang <joonwonkang@google.com>
---
v1: Request comments for this approach, other possible approaches and/or
  other aspects to consider more. Code is not sanitized and commits are
  not separated appropriately in this version.

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  2 +
 drivers/iommu/iommu-sva.c                   | 44 +++++++----
 drivers/iommu/iommu.c                       | 85 ++++++++++++++++++++-
 include/linux/iommu.h                       |  5 ++
 4 files changed, 121 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 4d00d796f078..3a700ab0b5c7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2494,6 +2494,8 @@ static bool arm_smmu_capable(struct device *dev, enum iommu_cap cap)
 		return true;
 	case IOMMU_CAP_DIRTY_TRACKING:
 		return arm_smmu_dbm_capable(master->smmu);
+	case IOMMU_CAP_PER_DEV_PASID_SPACE:
+		return true;
 	default:
 		return false;
 	}
diff --git a/drivers/iommu/iommu-sva.c b/drivers/iommu/iommu-sva.c
index 07d64908a05f..637d8fd29cbf 100644
--- a/drivers/iommu/iommu-sva.c
+++ b/drivers/iommu/iommu-sva.c
@@ -21,6 +21,7 @@ static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct de
 {
 	struct iommu_mm_data *iommu_mm;
 	ioasid_t pasid;
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
 
 	lockdep_assert_held(&iommu_sva_lock);
 
@@ -39,11 +40,18 @@ static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct de
 	if (!iommu_mm)
 		return ERR_PTR(-ENOMEM);
 
-	pasid = iommu_alloc_global_pasid(dev);
-	if (pasid == IOMMU_PASID_INVALID) {
-		kfree(iommu_mm);
-		return ERR_PTR(-ENOSPC);
+	if (ops->capable && ops->capable(dev, IOMMU_CAP_PER_DEV_PASID_SPACE)) {
+		pasid = IOMMU_NO_PASID;
+		iommu_mm->pasid_global = false;
+	} else {
+		pasid = iommu_alloc_global_pasid(dev);
+		if (pasid == IOMMU_PASID_INVALID) {
+			kfree(iommu_mm);
+			return ERR_PTR(-ENOSPC);
+		}
+		iommu_mm->pasid_global = true;
 	}
+
 	iommu_mm->pasid = pasid;
 	iommu_mm->mm = mm;
 	INIT_LIST_HEAD(&iommu_mm->sva_domains);
@@ -114,13 +122,15 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm
 		goto out_unlock;
 	}
 
-	/* Search for an existing domain. */
-	list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
-		ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
-						&handle->handle);
-		if (!ret) {
-			domain->users++;
-			goto out;
+	if (iommu_mm->pasid != IOMMU_NO_PASID) {
+		/* Search for an existing domain. */
+		list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
+			ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
+							&handle->handle);
+			if (!ret) {
+				domain->users++;
+				goto out;
+			}
 		}
 	}
 
@@ -131,8 +141,13 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm
 		goto out_free_handle;
 	}
 
-	ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
-					&handle->handle);
+	if (iommu_mm->pasid != IOMMU_NO_PASID) {
+		ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
+						&handle->handle);
+	} else {
+		ret = iommu_attach_device_pasid_any(domain, dev, &iommu_mm->pasid,
+						    &handle->handle);
+	}
 	if (ret)
 		goto out_free_domain;
 	domain->users = 1;
@@ -211,7 +226,8 @@ void mm_pasid_drop(struct mm_struct *mm)
 	if (!iommu_mm)
 		return;
 
-	iommu_free_global_pasid(iommu_mm->pasid);
+	if (iommu_mm->pasid_global)
+		iommu_free_global_pasid(iommu_mm->pasid);
 	kfree(iommu_mm);
 }
 
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 35db51780954..b882ecad7f57 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1061,7 +1061,7 @@ struct iommu_group *iommu_group_alloc(void)
 	mutex_init(&group->mutex);
 	INIT_LIST_HEAD(&group->devices);
 	INIT_LIST_HEAD(&group->entry);
-	xa_init(&group->pasid_array);
+	xa_init_flags(&group->pasid_array, XA_FLAGS_ALLOC);
 
 	ret = ida_alloc(&iommu_group_ida, GFP_KERNEL);
 	if (ret < 0) {
@@ -3619,6 +3619,89 @@ int iommu_attach_device_pasid(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_attach_device_pasid);
 
+/**
+ * iommu_attach_device_pasid_any() - Allocate a pasid of device and attach a
+ * domain to it
+ * @domain: the iommu domain.
+ * @dev: the attached device.
+ * @pasid: pointer to the pasid of the device to be allocated.
+ * @handle: the attach handle.
+ *
+ * Caller should always provide a new handle to avoid race with the paths
+ * that have lockless reference to handle if it intends to pass a valid handle.
+ *
+ * Return: 0 on success, or an error.
+ */
+int iommu_attach_device_pasid_any(struct iommu_domain *domain,
+				  struct device *dev,
+				  ioasid_t *pasid,
+				  struct iommu_attach_handle *handle)
+{
+	/* Caller must be a probed driver on dev */
+	struct iommu_group *group = dev->iommu_group;
+	const struct iommu_ops *ops;
+	void *entry;
+	u32 new_pasid;
+	int ret;
+
+	if (!group)
+		return -ENODEV;
+
+	ops = dev_iommu_ops(dev);
+
+	if (!domain->ops->set_dev_pasid ||
+	    !ops->blocked_domain ||
+	    !ops->blocked_domain->ops->set_dev_pasid)
+		return -EOPNOTSUPP;
+
+	if (!domain_iommu_ops_compatible(ops, domain) || !pasid)
+		return -EINVAL;
+
+	mutex_lock(&group->mutex);
+
+	/*
+	 * This is a concurrent attach during a device reset. Reject it until
+	 * pci_dev_reset_iommu_done() attaches the device to group->domain.
+	 */
+	if (group->resetting_domain) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	entry = iommu_make_pasid_array_entry(domain, handle);
+
+	struct xa_limit limit = {
+		.min = IOMMU_FIRST_GLOBAL_PASID,
+		.max = dev->iommu->max_pasids - 1,
+	};
+
+	ret = xa_alloc(&group->pasid_array, &new_pasid, XA_ZERO_ENTRY, limit, GFP_KERNEL);
+	if (ret)
+		goto out_unlock;
+
+	ret = __iommu_set_group_pasid(domain, group, new_pasid, NULL);
+	if (ret) {
+		xa_release(&group->pasid_array, new_pasid);
+		goto out_unlock;
+	}
+
+	/*
+	 * The xa_insert() above reserved the memory, and the group->mutex is
+	 * held, this cannot fail. The new domain cannot be visible until the
+	 * operation succeeds as we cannot tolerate PRIs becoming concurrently
+	 * queued and then failing attach.
+	 */
+	WARN_ON(xa_is_err(xa_store(&group->pasid_array,
+				   new_pasid, entry, GFP_KERNEL)));
+
+	*pasid = new_pasid;
+
+out_unlock:
+	mutex_unlock(&group->mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_attach_device_pasid_any);
+
 /**
  * iommu_replace_device_pasid - Replace the domain that a specific pasid
  *                              of the device is attached to
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 54b8b48c762e..1665f9fe1d8a 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -271,6 +271,7 @@ enum iommu_cap {
 	 */
 	IOMMU_CAP_DEFERRED_FLUSH,
 	IOMMU_CAP_DIRTY_TRACKING,	/* IOMMU supports dirty tracking */
+	IOMMU_CAP_PER_DEV_PASID_SPACE,	/* IOMMU supports per-device PASID space */
 };
 
 /* These are the possible reserved region types */
@@ -1136,6 +1137,7 @@ struct iommu_sva {
 
 struct iommu_mm_data {
 	u32			pasid;
+	bool			pasid_global;
 	struct mm_struct	*mm;
 	struct list_head	sva_domains;
 	struct list_head	mm_list_elm;
@@ -1184,6 +1186,9 @@ void iommu_device_release_dma_owner(struct device *dev);
 int iommu_attach_device_pasid(struct iommu_domain *domain,
 			      struct device *dev, ioasid_t pasid,
 			      struct iommu_attach_handle *handle);
+int iommu_attach_device_pasid_any(struct iommu_domain *domain,
+				  struct device *dev, ioasid_t *pasid,
+				  struct iommu_attach_handle *handle);
 void iommu_detach_device_pasid(struct iommu_domain *domain,
 			       struct device *dev, ioasid_t pasid);
 ioasid_t iommu_alloc_global_pasid(struct device *dev);
-- 
2.54.0.545.g6539524ca2-goog


