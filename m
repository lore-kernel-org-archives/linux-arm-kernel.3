Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA27CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 04:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fzCODy95V1TQUD+WUGs6bhrpfOjqEZmbSInszcweVo=; b=TVTwP4SzBxUMV8a/DLh74/JMR0
	nkE4I2uXByI2Rfkg1HsE01bgKHdtlngszbPIge44Jy+SzS5IeqdaJBzCa3XC8w33fH7Stgqi+bTOc
	faQTe0ai+HuTCKxfCUDrZogADFBTLLBv2PSk3/Pb5nQTuuvce907lqbbswEzXgK+BvljQP624Dwa5
	Lx9oWG16wk2y0AYUD8i1D9Yes6mQBkQfKHi6aTvJoDT5uaETNZFF7vPsYCB9+c53kxuTrgChe0wvt
	sLOsEmjdZru9OX5kO/64lm9oecXytz0wJCVU7YplcKhd9vYuOZq0Bhu930HKGJ63V35lXKBke8R9N
	tgFMPpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89Yz-0000000GigB-05ik;
	Thu, 02 Apr 2026 04:21:49 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89Yt-0000000Gibn-3xh2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 04:21:45 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631HURiK2903666;
	Thu, 2 Apr 2026 04:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9fzCODy95V1TQUD+W
	UGs6bhrpfOjqEZmbSInszcweVo=; b=rko/DeGGG7vhDeXrtMg7dS9UKMcGjjK2N
	7g6kVPSGSRT2pnp9dhtYzXb3Nlu7+TAcUYlIKQ9HkDcfANeV5NJW4XXilp4jYgJR
	967HrzOjZoW8VlsNEGYZ4mv4u5eh9lzg8/uV6k3cFThWM0KLKirv1IYdS+rT/mlh
	8v0fhRt7u/lWr3aQRlMhWkwRxYDcAcgNNKitPYMw8gUDd8bmGZxdYdVo033Ay/H3
	X+TnvYA03NamijuVmXrFtfSI5xzKRlZDkxnBLjAMV6xY4eic3ZbOBGYjpNvMCFM7
	Uv0ViDkMQhHVTkWOynLVnK7tSbmxRWAeIjWmf59kAMZcAT/aMG+QQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d66nnu7su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 04:21:31 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63212o7j030990;
	Thu, 2 Apr 2026 04:21:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4d6uhk0ee0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 04:21:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6324LRtL35324310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Apr 2026 04:21:27 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36FF920043;
	Thu,  2 Apr 2026 04:21:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E087B2004B;
	Thu,  2 Apr 2026 04:21:26 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Apr 2026 04:21:26 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Andreas Grapentin <Andreas.Grapentin@ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v1 03/27] KVM, vfio: remove symbol_get(kvm_put_kvm) from vfio
Date: Thu,  2 Apr 2026 06:20:59 +0200
Message-ID: <20260402042125.3948963-4-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260402042125.3948963-1-seiden@linux.ibm.com>
References: <20260402042125.3948963-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hQBMhy9HLCCQzxvZtKP_zmRNQVxIyBUJ
X-Authority-Analysis: v=2.4 cv=KslAGGWN c=1 sm=1 tr=0 ts=69cdeecb cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8
 a=Iid1VeoRPhL8jyw1u-UA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzNCBTYWx0ZWRfXxRFLOg61Tfgd
 r3j6Kfo7hL2jY55oEhYtWiMqNkPghLtwGjOQ2OH54mLzLprTA8BxCqXBVd5GDI2GNVn/GBKFaWo
 72btgVmGMYyyqqwQRNirCd1pBFPvN9XdNPZGrhn26A7PCarfSdi81e3QIfDOyPD7JnVC2u8Ohi2
 8qRrsqyaTIJmPm1RXzWXLn0E8P0xhGL7hFtYrrYzE6K7pVDTcUV90pzAEAp9vhuhhvgCZmY73vs
 3bCBrMoyRE/LcDuADMPrQ4oWhCKPcP5kk+N1pA0hLxoQxl45GoJER2N1B+cmG2RwDxVlVYhgFAe
 7mDAapmOtic4S1x01/Ymn74AMROIuThySzGlUYKKKor/p6vVveDS8x4P6f/g1dUbh/7xxXxWv/E
 jF+900F6Gm+DTecd67/iImwQZMV/qKy355cwJ942/ndxeP9gaq9Pt2gKVzMLYL1EV0bL79aGEer
 O7qnA68CJ3mFVzX8o5A==
X-Proofpoint-ORIG-GUID: hQBMhy9HLCCQzxvZtKP_zmRNQVxIyBUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_212143_994027_414337DB 
X-CRM114-Status: GOOD (  20.81  )
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

From: Paolo Bonzini <pbonzini@redhat.com>

Right now, KVM and VFIO are using symbol_get to access each other's
symbols because of a circular reference between the modules, as well
as to avoid loading them unnecessarily.

The remaining use in VFIO is for kvm_put_kvm, which is not inline
because it needs to call kvm_destroy_vm.  However, storing the
address of kvm_destroy_vm in the "struct kvm" is enough to remove
the dependency from VFIO.

This also makes it possible to direct kvm_put_kvm to different
implementations of kvm_destroy_vm.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 drivers/vfio/vfio_main.c  | 29 +++++------------------------
 include/linux/kvm_host.h  |  1 -
 include/linux/kvm_types.h |  9 +++++++++
 include/linux/vfio.h      |  1 -
 virt/kvm/kvm_main.c       |  9 ++-------
 5 files changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 42f515519d87..e9c6353c74d8 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -17,7 +17,7 @@
 #include <linux/idr.h>
 #include <linux/iommu.h>
 #if IS_ENABLED(CONFIG_KVM)
-#include <linux/kvm_host.h>
+#include <linux/kvm_types.h>
 #endif
 #include <linux/list.h>
 #include <linux/miscdevice.h>
@@ -436,9 +436,6 @@ EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
 void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm,
 			      struct module *kvm_module)
 {
-	void (*pfn)(struct kvm *kvm);
-	bool ret;
-
 	lockdep_assert_held(&device->dev_set->lock);
 
 	if (!kvm)
@@ -447,19 +444,10 @@ void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm,
 	if (!try_module_get(kvm_module))
 		return;
 
-	pfn = symbol_get(kvm_put_kvm);
-	if (WARN_ON(!pfn))
-		return;
-
-	ret = kvm_get_kvm_safe(kvm);
-	if (!ret) {
-		symbol_put(kvm_put_kvm);
-		return;
+	if (kvm_get_kvm_safe(kvm)) {
+		device->kvm = kvm;
+		device->kvm_module = kvm_module;
 	}
-
-	device->put_kvm = pfn;
-	device->kvm = kvm;
-	device->kvm_module = kvm_module;
 }
 
 void vfio_device_put_kvm(struct vfio_device *device)
@@ -469,15 +457,8 @@ void vfio_device_put_kvm(struct vfio_device *device)
 	if (!device->kvm)
 		return;
 
-	if (WARN_ON(!device->put_kvm))
-		goto clear;
-
-	device->put_kvm(device->kvm);
-	device->put_kvm = NULL;
-	symbol_put(kvm_put_kvm);
-
-clear:
 	module_put(device->kvm_module);
+	kvm_put_kvm(device->kvm);
 	device->kvm_module = NULL;
 	device->kvm = NULL;
 }
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index dc18ee99bba4..13f903993ed0 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1065,7 +1065,6 @@ static inline void kvm_irqfd_exit(void)
 int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module);
 void kvm_exit(void);
 
-void kvm_put_kvm(struct kvm *kvm);
 bool file_is_kvm(struct file *file);
 void kvm_put_kvm_no_destroy(struct kvm *kvm);
 
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index add7cc2016e8..aadee536771a 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -144,6 +144,7 @@ struct kvm_vcpu_stat_generic {
 
 struct kvm_refcount {
 	refcount_t users_count;
+	void (*destroy)(struct kvm *kvm);
 };
 
 static inline void kvm_get_kvm(struct kvm *kvm)
@@ -164,6 +165,14 @@ static inline bool kvm_get_kvm_safe(struct kvm *kvm)
 	return refcount_inc_not_zero(&rc->users_count);
 }
 
+static inline void kvm_put_kvm(struct kvm *kvm)
+{
+	struct kvm_refcount *rc = (struct kvm_refcount *)kvm;
+
+	if (refcount_dec_and_test(&rc->users_count))
+		rc->destroy(kvm);
+}
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __KVM_TYPES_H__ */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 69a8d527b0e8..5c69532d6127 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -65,7 +65,6 @@ struct vfio_device {
 	unsigned int open_count;
 	struct completion comp;
 	struct iommufd_access *iommufd_access;
-	void (*put_kvm)(struct kvm *kvm);
 	struct inode *inode;
 #if IS_ENABLED(CONFIG_IOMMUFD)
 	struct iommufd_device *iommufd_device;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cb5e01f92503..642f9e9638cc 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -120,6 +120,7 @@ static struct dentry *kvm_debugfs_dir;
 
 static const struct file_operations stat_fops_per_vm;
 
+static void kvm_destroy_vm(struct kvm *kvm);
 static long kvm_vcpu_ioctl(struct file *file, unsigned int ioctl,
 			   unsigned long arg);
 #ifdef CONFIG_KVM_COMPAT
@@ -1154,6 +1155,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 		goto out_err_no_irq_routing;
 
 	refcount_set(&kvm->rc.users_count, 1);
+	kvm->rc.destroy = kvm_destroy_vm;
 
 	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		for (j = 0; j < 2; j++) {
@@ -1316,13 +1318,6 @@ static void kvm_destroy_vm(struct kvm *kvm)
 	mmdrop(mm);
 }
 
-void kvm_put_kvm(struct kvm *kvm)
-{
-	if (refcount_dec_and_test(&kvm->rc.users_count))
-		kvm_destroy_vm(kvm);
-}
-EXPORT_SYMBOL_GPL(kvm_put_kvm);
-
 /*
  * Used to put a reference that was taken on behalf of an object associated
  * with a user-visible file descriptor, e.g. a vcpu or device, if installation
-- 
2.51.0


