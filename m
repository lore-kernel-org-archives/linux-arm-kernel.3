Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF959CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wHUnnXFLKyxNLD+EvpucYoAufuRZ6w5hpv0Yeic6fcw=; b=sY0NoOc1jyLqxgFBZf0vnLX0i2
	h2lFq72O3K9vwErvcSu88Av2iB3WlTJS/HFtpqy91+Sfedyb5wbVa6TLo+jBmJYZRIkQZltK5LGBf
	WClMhatieeESooQ/wPXavEW5gZpEokci2HCYaPrzpU1WLirF1RtLEUHcoFBYOP/KLI3MQN+mGJZRb
	qYjfKMUdnDzm3fGRVeHtegmroAfjGb84X6OYdWNo/QQeC0XZmy2gQoFzVV1Dysy95GNmsdHnucr/L
	OmK3RB7ZgIa1YoKl1l8fybJjoFJRvkcLjdx0M9/z56YYfvxaM3t2rBxschJKZAXIKyZK/yoPtPRKR
	tyI/dptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiWZ-00000004v5Q-3goW;
	Wed, 20 May 2026 15:07:55 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiWW-00000004v4D-3Yuf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:07:54 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c828ab3b033so7114151a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779289671; x=1779894471; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wHUnnXFLKyxNLD+EvpucYoAufuRZ6w5hpv0Yeic6fcw=;
        b=S4OVLOySIixNu0zfngHpcXQqx+lfLA+a24NsDDWQkHZ/n5SLbpNT4AX0mm0eqCPw9w
         IjAkFTCOw7WHRDdUeD2hGFov9Ej9iUH0PiF8bBQC/ghY5icewgon8db6P6WvjJBJo0Eg
         wDS6S0oxYXWjJIyobIarj7NBQN7/vucDOOzQPdthoHrtgim++tUP7s+JR1qggsd3VN+e
         RNv7dA+7aBMXffXPKA2A2LBg7mmbenAlm5srXNMAzEtTFTAAbar258eBu5bR6DocT9Lq
         nBrdkJAFXmbVRPn8KAVp1UuTAZxOcyCQ7C7Dsu4YWNeeAYwq9LhibNNHXB3Zu49kHA99
         EO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289671; x=1779894471;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wHUnnXFLKyxNLD+EvpucYoAufuRZ6w5hpv0Yeic6fcw=;
        b=hDIh/SJZP08HF4gyR+8teceqAtkwDD4AZONs/pyx6y4/su4wFlXhcUnCx73At9ts2q
         ayZulra0pqa6QU4EfHiYSkscWzb5F0XyiKwkgyEdbLz4+KHCSY1SoVdKnTpj402wI7Wv
         DLanDUNDtm3a4kfGQSpVsIi5O4xYYpTqdNbvSBHj73a59S5LAsZmsZi9LmGEGulY8g6b
         o23Qz7qNj+UZXWsDzP+GgM41DW/1/BxEaqaiYUULvJOB+JgvMOkvJGhP1NqTkEZokPwG
         8MkkSgVuYgz/lRIzytkAeuolMZYxVRPIUf7glaoIcpSZ5Eh2IXgHm4WSGPG3K78bIc/E
         m7xQ==
X-Forwarded-Encrypted: i=1; AFNElJ91iIeGRsMvOqfV/ZIqSiD1Y+IYLQmAotF1odX9NEap03KaSp+ik+f0daM7R4cVstu/M4Y26O/m06IvpR2w3bKx@lists.infradead.org
X-Gm-Message-State: AOJu0YzhEGjbVrVruyV+r1PXPiUT7TryLD6qKJf+2qjmzO43inrSCo56
	f8i/5dJL9GjWJcztBCvxTOnfpad+cQwU2s7mGxsldsJw22Ci9Wvn4bEJ9iqG/Ub6Fr5KdPJ3dRc
	AQibjGR3o1UamiH8hrE+NRjud/Q==
X-Received: from pfbem50.prod.google.com ([2002:a05:6a00:3772:b0:82f:6a57:a9aa])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:ab0d:b0:82f:5125:a327 with SMTP id d2e1a72fcca58-83f33d97ad5mr24114337b3a.27.1779289670994;
 Wed, 20 May 2026 08:07:50 -0700 (PDT)
Date: Wed, 20 May 2026 15:07:43 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520150743.727106-1-joonwonkang@google.com>
Subject: [PATCH v2] iommu: Allow device driver to use its own PASID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: jgg@ziepe.ca, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	jpb@kernel.org
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com, 
	baolu.lu@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	jacob.jun.pan@linux.intel.com, kees@kernel.org, kevin.tian@intel.com, 
	nicolinc@nvidia.com, praan@google.com, smostafa@google.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, peterz@infradead.org, sohil.mehta@intel.com, kas@kernel.org, 
	alexander.shishkin@linux.intel.com, ryasuoka@redhat.com, xin@zytor.com, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joonwonkang@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_080752_904698_82BA079F 
X-CRM114-Status: GOOD (  34.36  )
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
from IA32_PASID, which is per-process; when a process wants to
communicate with multiple devices with the ENQCMD instruction, it cannot
change its PASID for each device without the kernel's intervention. Also
note that ARM introduced a similar instruction, which is ST64BV0.

Due to this nature, SVA with ARM SMMU v3 has been found not working in
our environment when other modules/devices compete for PASID. The
environment looks as follows:

- The device is not a PCIe device.
- The device is to use SVA.
- The supported SSID/PASID space is very small for the device; only 1 to
  3 SSIDs are supported.

With this setup, when other modules have allocated all the PASIDs that
our device is expected to use from the global PASID space via APIs like
iommu_alloc_global_pasid() or iommu_sva_bind_device(), SVA binding to
our device fails due to the lack of available PASIDs.

This commit resolves the issue by allowing device driver to maintain its
own PASID space and assign a PASID from that for the process-device bond
via a new API called `iommu_sva_bind_device_pasid(dev, mm, pasid)`. Doing
that, however, will disallow the process to execute the ENQCMD-like
instructions at EL0. It is because the process cannot change its PASID in
IA32_PASID(or ACCDATA_EL1 on ARM) for each device without the kernel's
intervention. For this reason, calling `iommu_sva_bind_device()` and then
`iommu_sva_bind_device_pasid()` for the same process will not be allowed
and vice versa.

Currently, there is a limitation that a process simultaneously doing SVA
with multiple devices with different PASIDs is not supported. So, calling
`iommu_sva_bind_device_pasid()` multiple times for the same process with
different devices will not be allowed for now while that for
`iommu_sva_bind_device()` will be.

Another limitation is that a process cannot do `iommu_sva_bind_device()`
if it has ever done `iommu_sva_bind_device_pasid()` even though it has
been unbound after use.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Suggested-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Joonwon Kang <joonwonkang@google.com>
---
v2: Reuse iommu_mm->pasid after SVA bound by iommu_sva_bind_device_pasid()
    is unbound.
v1: Initial version.

 arch/x86/kernel/traps.c   |   9 +--
 drivers/iommu/iommu-sva.c | 151 +++++++++++++++++++++++++++++---------
 include/linux/iommu.h     |  14 +++-
 3 files changed, 134 insertions(+), 40 deletions(-)

diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 0ca3912ecb7f..0131c8e5fb10 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -857,13 +857,12 @@ static bool try_fixup_enqcmd_gp(void)
 		return false;
 
 	/*
-	 * If the mm has not been allocated a
-	 * PASID, the #GP can not be fixed up.
+	 * If the mm has not been allocated a PASID or ENQCMD has been
+	 * disallowed, the #GP can not be fixed up.
 	 */
-	if (!mm_valid_pasid(current->mm))
-		return false;
-
 	pasid = mm_get_enqcmd_pasid(current->mm);
+	if (pasid == IOMMU_PASID_INVALID)
+		return false;
 
 	/*
 	 * Did this thread already have its PASID activated?
diff --git a/drivers/iommu/iommu-sva.c b/drivers/iommu/iommu-sva.c
index bc7c7232a43e..a83333651ad0 100644
--- a/drivers/iommu/iommu-sva.c
+++ b/drivers/iommu/iommu-sva.c
@@ -10,6 +10,9 @@
 
 #include "iommu-priv.h"
 
+/* Whether pasid is to be allocated from the global PASID space */
+#define IOMMU_PASID_GLOBAL_ANY IOMMU_NO_PASID
+
 static DEFINE_MUTEX(iommu_sva_lock);
 static bool iommu_sva_present;
 static LIST_HEAD(iommu_sva_mms);
@@ -17,10 +20,11 @@ static struct iommu_domain *iommu_sva_domain_alloc(struct device *dev,
 						   struct mm_struct *mm);
 
 /* Allocate a PASID for the mm within range (inclusive) */
-static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct device *dev)
+static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm,
+						 struct device *dev,
+						 ioasid_t pasid)
 {
 	struct iommu_mm_data *iommu_mm;
-	ioasid_t pasid;
 
 	lockdep_assert_held(&iommu_sva_lock);
 
@@ -30,8 +34,27 @@ static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct de
 	iommu_mm = mm->iommu_mm;
 	/* Is a PASID already associated with this mm? */
 	if (iommu_mm) {
+		if ((pasid == IOMMU_PASID_GLOBAL_ANY && !iommu_mm->pasid_global) ||
+		    (pasid != IOMMU_PASID_GLOBAL_ANY && iommu_mm->pasid_global))
+			return ERR_PTR(-EBUSY);
+
+		if (!iommu_mm->pasid_global) {
+			if (list_empty(&iommu_mm->sva_domains))
+				iommu_mm->pasid = pasid;
+
+			if (pasid != iommu_mm->pasid) {
+				/*
+				 * Currently, a process simultaneously doing
+				 * SVA with multiple devices with different
+				 * PASIDs is not supported.
+				 */
+				return ERR_PTR(-ENOSPC);
+			}
+		}
+
 		if (iommu_mm->pasid >= dev->iommu->max_pasids)
 			return ERR_PTR(-EOVERFLOW);
+
 		return iommu_mm;
 	}
 
@@ -39,37 +62,30 @@ static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct de
 	if (!iommu_mm)
 		return ERR_PTR(-ENOMEM);
 
-	pasid = iommu_alloc_global_pasid(dev);
-	if (pasid == IOMMU_PASID_INVALID) {
-		kfree(iommu_mm);
-		return ERR_PTR(-ENOSPC);
+	if (pasid == IOMMU_PASID_GLOBAL_ANY) {
+		pasid = iommu_alloc_global_pasid(dev);
+		if (pasid == IOMMU_PASID_INVALID) {
+			kfree(iommu_mm);
+			return ERR_PTR(-ENOSPC);
+		}
+		iommu_mm->pasid_global = true;
+	} else {
+		if (pasid >= dev->iommu->max_pasids) {
+			kfree(iommu_mm);
+			return ERR_PTR(-EOVERFLOW);
+		}
+		iommu_mm->pasid_global = false;
 	}
 	iommu_mm->pasid = pasid;
 	iommu_mm->mm = mm;
 	INIT_LIST_HEAD(&iommu_mm->sva_domains);
-	/*
-	 * Make sure the write to mm->iommu_mm is not reordered in front of
-	 * initialization to iommu_mm fields. If it does, readers may see a
-	 * valid iommu_mm with uninitialized values.
-	 */
-	smp_store_release(&mm->iommu_mm, iommu_mm);
+
 	return iommu_mm;
 }
 
-/**
- * iommu_sva_bind_device() - Bind a process address space to a device
- * @dev: the device
- * @mm: the mm to bind, caller must hold a reference to mm_users
- *
- * Create a bond between device and address space, allowing the device to
- * access the mm using the PASID returned by iommu_sva_get_pasid(). If a
- * bond already exists between @device and @mm, an additional internal
- * reference is taken. Caller must call iommu_sva_unbind_device()
- * to release each reference.
- *
- * On error, returns an ERR_PTR value.
- */
-struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
+static struct iommu_sva *iommu_sva_bind_device_internal(struct device *dev,
+							struct mm_struct *mm,
+							ioasid_t pasid)
 {
 	struct iommu_group *group = dev->iommu_group;
 	struct iommu_attach_handle *attach_handle;
@@ -84,7 +100,7 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm
 	mutex_lock(&iommu_sva_lock);
 
 	/* Allocate mm->pasid if necessary. */
-	iommu_mm = iommu_alloc_mm_data(mm, dev);
+	iommu_mm = iommu_alloc_mm_data(mm, dev, pasid);
 	if (IS_ERR(iommu_mm)) {
 		ret = PTR_ERR(iommu_mm);
 		goto out_unlock;
@@ -96,7 +112,7 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm
 		handle = container_of(attach_handle, struct iommu_sva, handle);
 		if (attach_handle->domain->mm != mm) {
 			ret = -EBUSY;
-			goto out_unlock;
+			goto out_free_iommu_mm;
 		}
 		refcount_inc(&handle->users);
 		mutex_unlock(&iommu_sva_lock);
@@ -105,17 +121,17 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm
 
 	if (PTR_ERR(attach_handle) != -ENOENT) {
 		ret = PTR_ERR(attach_handle);
-		goto out_unlock;
+		goto out_free_iommu_mm;
 	}
 
 	handle = kzalloc_obj(*handle);
 	if (!handle) {
 		ret = -ENOMEM;
-		goto out_unlock;
+		goto out_free_iommu_mm;
 	}
 
 	/* Search for an existing domain. */
-	list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
+	list_for_each_entry(domain, &iommu_mm->sva_domains, next) {
 		ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
 						&handle->handle);
 		if (!ret) {
@@ -143,6 +159,15 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm
 		list_add(&iommu_mm->mm_list_elm, &iommu_sva_mms);
 	}
 	list_add(&domain->next, &iommu_mm->sva_domains);
+	if (!mm->iommu_mm) {
+		/*
+		 * Make sure the write to mm->iommu_mm is not reordered in
+		 * front of initialization to iommu_mm fields. If it does,
+		 * readers may see a valid iommu_mm with uninitialized values.
+		 */
+		smp_store_release(&mm->iommu_mm, iommu_mm);
+	}
+
 out:
 	refcount_set(&handle->users, 1);
 	mutex_unlock(&iommu_sva_lock);
@@ -153,12 +178,66 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm
 	iommu_domain_free(domain);
 out_free_handle:
 	kfree(handle);
+out_free_iommu_mm:
+	if (!mm->iommu_mm) {
+		if (iommu_mm->pasid_global)
+			iommu_free_global_pasid(iommu_mm->pasid);
+		kfree(iommu_mm);
+	}
 out_unlock:
 	mutex_unlock(&iommu_sva_lock);
 	return ERR_PTR(ret);
 }
+
+/**
+ * iommu_sva_bind_device() - Bind a process address space to a device
+ * @dev: the device
+ * @mm: the mm to bind, caller must hold a reference to mm_users
+ *
+ * Create a bond between device and address space, allowing the device to
+ * access the mm using the PASID returned by iommu_sva_get_pasid(). If a
+ * bond already exists between @device and @mm, an additional internal
+ * reference is taken. Caller must call iommu_sva_unbind_device()
+ * to release each reference.
+ *
+ * On error, returns an ERR_PTR value.
+ */
+struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
+{
+	return iommu_sva_bind_device_internal(dev, mm, IOMMU_PASID_GLOBAL_ANY);
+}
 EXPORT_SYMBOL_GPL(iommu_sva_bind_device);
 
+/**
+ * iommu_sva_bind_device_pasid() - Bind a process address space to a device
+ * with a designated pasid
+ * @dev: the device
+ * @mm: the mm to bind, caller must hold a reference to mm_users
+ * @pasid: the pasid to assign to the bond
+ *
+ * Create a bond between device and address space, allowing the device to
+ * access the mm using the PASID returned by iommu_sva_get_pasid(). If a
+ * bond already exists between @device and @mm, an additional internal
+ * reference is taken. Caller must call iommu_sva_unbind_device()
+ * to release each reference.
+ *
+ * It is the caller's responsibility to maintain the PASID space for @pasid.
+ * After the bond is created, the process for @mm will not be able to execute
+ * ENQCMD or similar instructions at EL0. To allow those instructions at EL0,
+ * iommu_sva_bind_device() must be used instead.
+ *
+ * On error, returns an ERR_PTR value.
+ */
+struct iommu_sva *iommu_sva_bind_device_pasid(struct device *dev,
+					      struct mm_struct *mm,
+					      ioasid_t pasid)
+{
+	if (pasid == IOMMU_PASID_GLOBAL_ANY)
+		return ERR_PTR(-EINVAL);
+	return iommu_sva_bind_device_internal(dev, mm, pasid);
+}
+EXPORT_SYMBOL_GPL(iommu_sva_bind_device_pasid);
+
 /**
  * iommu_sva_unbind_device() - Remove a bond created with iommu_sva_bind_device
  * @handle: the handle returned by iommu_sva_bind_device()
@@ -198,9 +277,12 @@ EXPORT_SYMBOL_GPL(iommu_sva_unbind_device);
 
 u32 iommu_sva_get_pasid(struct iommu_sva *handle)
 {
-	struct iommu_domain *domain = handle->handle.domain;
+	struct iommu_mm_data *iommu_mm = handle->handle.domain->mm->iommu_mm;
+
+	if (!iommu_mm)
+		return IOMMU_PASID_INVALID;
 
-	return mm_get_enqcmd_pasid(domain->mm);
+	return iommu_mm->pasid;
 }
 EXPORT_SYMBOL_GPL(iommu_sva_get_pasid);
 
@@ -211,7 +293,8 @@ void mm_pasid_drop(struct mm_struct *mm)
 	if (!iommu_mm)
 		return;
 
-	iommu_free_global_pasid(iommu_mm->pasid);
+	if (iommu_mm->pasid_global)
+		iommu_free_global_pasid(iommu_mm->pasid);
 	kfree(iommu_mm);
 }
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e587d4ac4d33..5b6116e7152d 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1140,6 +1140,7 @@ struct iommu_sva {
 
 struct iommu_mm_data {
 	u32			pasid;
+	bool			pasid_global;
 	struct mm_struct	*mm;
 	struct list_head	sva_domains;
 	struct list_head	mm_list_elm;
@@ -1626,7 +1627,7 @@ static inline u32 mm_get_enqcmd_pasid(struct mm_struct *mm)
 {
 	struct iommu_mm_data *iommu_mm = READ_ONCE(mm->iommu_mm);
 
-	if (!iommu_mm)
+	if (!iommu_mm || !iommu_mm->pasid_global)
 		return IOMMU_PASID_INVALID;
 	return iommu_mm->pasid;
 }
@@ -1634,6 +1635,9 @@ static inline u32 mm_get_enqcmd_pasid(struct mm_struct *mm)
 void mm_pasid_drop(struct mm_struct *mm);
 struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 					struct mm_struct *mm);
+struct iommu_sva *iommu_sva_bind_device_pasid(struct device *dev,
+					      struct mm_struct *mm,
+					      ioasid_t pasid);
 void iommu_sva_unbind_device(struct iommu_sva *handle);
 u32 iommu_sva_get_pasid(struct iommu_sva *handle);
 void iommu_sva_invalidate_kva_range(unsigned long start, unsigned long end);
@@ -1644,6 +1648,14 @@ iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct iommu_sva *
+iommu_sva_bind_device_pasid(struct device *dev,
+			    struct mm_struct *mm,
+			    ioasid_t pasid)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void iommu_sva_unbind_device(struct iommu_sva *handle)
 {
 }
-- 
2.54.0.631.ge1b05301d1-goog


