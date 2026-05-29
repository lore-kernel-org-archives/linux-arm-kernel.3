Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25ECCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHsYUQL54hNw2QROnq3wPwSZgX1sTOMq/1V6++TLrJk=; b=w/R1g0ZQSQM4sU8mzjANTB0vye
	HnNcVox+GGWh6wBWxDlM21RhOWAEXtibXNc0JfUt5WcU5NrCS3q9E/S10CBnUpjUYhR2vQdkxS+sV
	Q0KKAQNNjtv6D+7qTXkXtXqsy07/KWYU5ScedLkSnjySxlts7MHpfE/BI/9B/+8aeEqynHnbIitI0
	tJ3zzE4I0aOW5Z/Elo0QeKsvzr9GTuvLNj/h5HOHuEqsSrd+EzaiZrv5xITzn8ykWcpQ27tGTYP5c
	gO54kYPxZfjl/DYXTQ2D04fOHnZEuFLUwwgzTrkdTyxYRXtZvSHy4+dwSpfYAfDbZVO+E98Cq9jAo
	hhQTLKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzUs-00000007jmj-0BXj;
	Fri, 29 May 2026 15:51:42 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzUZ-00000007jVq-26aT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:51:32 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TFD4G11467855;
	Fri, 29 May 2026 15:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zHsYUQL54hNw2QROn
	q3wPwSZgX1sTOMq/1V6++TLrJk=; b=QP2ho3vdVyXPpQYvxroKi3aAS7kcDyVJP
	P7gBuyfogXNCYzkEcfD7xaUyP1hh86bRYDEhX4fciPn/A0SUoTyGZDYVLYWCnwRf
	yAa2K5gqiW5GJFNWzHSWUde0XjrKDrGgtApU8MkDowdi7oqIgn58HJqdHUCd0huc
	M2g4W9bRY9gOHDf0ztyXG4Ubt+tq3R9PtSdI6MJxATBoAXGsf6v8jJKHnuP9xkvc
	ejccof0jO96FU3/WqbxYO+4DRpzrBl+/nZEgn+iei3XI5nQrgX3b1VrqYtYdaXNC
	1p08gSDWcZuEjmkBAAGNsB6j1sKIfAvKbnO4CNZSm876SqD/sdvew==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ee886mb3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:51:02 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64TFd6sR030521;
	Fri, 29 May 2026 15:51:01 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4edjrbggep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:51:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64TFopBQ49807844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 15:50:51 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3182B2004F;
	Fri, 29 May 2026 15:50:51 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1EFD2004B;
	Fri, 29 May 2026 15:50:50 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 May 2026 15:50:50 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v3 01/27] VFIO: take reference to the KVM module
Date: Fri, 29 May 2026 17:50:15 +0200
Message-ID: <20260529155050.2902245-2-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529155050.2902245-1-seiden@linux.ibm.com>
References: <20260529155050.2902245-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: htZPN-I11LORZlgl7bt_-_J9wX25Qkr0
X-Authority-Analysis: v=2.4 cv=Z8Dc2nRA c=1 sm=1 tr=0 ts=6a19b5e6 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8 a=r1p2_3pzAAAA:8
 a=U3YOjIjXimIOwXAI40wA:9 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE1NiBTYWx0ZWRfXz0+8PflztSON
 iE1DSm0ryF8ZC8LARuCfgvmvbpP/hX/BGMhHoq6fgXdvzvcgOD+dMWITnpsQDD9hUxmVfjw4uHY
 NMaCva3CRqQKm+s6FcQVKZCRI0FfG5//wm0YntxsHWOVEkvRQzPfJCl3Fc5J900Yc6PYEczF5zN
 CiTkqFZeqzbe2EHFbm/kScqUCVJgeSxgpMpW5EXGizD6Zqv1lpxk126RsVeWLu9DF+yQ3JoeCRm
 wXwAwPb3dAY+JKhsW/o48gRYCKGViK6WcSyb//OEreNJSBD8Z/1jU6GlxCt2ujFYHVInoDKPH46
 /maEx1Kl++FqW9jhWpfHZoaoPs30Va3rPYZ4IyjpYEdI6zQGUAeNr5Ph4LysCvCCIErKXqyduZ+
 rRRbYWkMkYIHxZ6xLEiFdvNAnAgjzU6k95Bb3K4KrwTCIppFLHpbNlvhhrSkMjSwxTP9iIwZ+QD
 sU3vu4PtiMKxh3yHlAA==
X-Proofpoint-ORIG-GUID: htZPN-I11LORZlgl7bt_-_J9wX25Qkr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085123_607303_E0A2C2B2 
X-CRM114-Status: GOOD (  21.25  )
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

VFIO is implicitly taking a reference to the KVM module between
vfio_device_get_kvm_safe and vfio_device_put_kvm, thanks to
symbol_get and symbol_put.

In preparation for removing symbol_get and symbol_put themselves
from VFIO, actually store a pointer to the KVM module and use
module_get()/module_put() to keep KVM alive.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Acked-by: Alex Williamson <alex@shazbot.org>
---
 drivers/vfio/device_cdev.c |  2 +-
 drivers/vfio/group.c       |  5 +++--
 drivers/vfio/vfio.h        | 15 ++++++++++-----
 drivers/vfio/vfio_main.c   | 37 +++++++++++++++++++++++--------------
 include/linux/vfio.h       |  3 ++-
 virt/kvm/vfio.c            |  4 ++--
 6 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 54abf312cf04..a729be99d06c 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -56,7 +56,7 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
 static void vfio_df_get_kvm_safe(struct vfio_device_file *df)
 {
 	spin_lock(&df->kvm_ref_lock);
-	vfio_device_get_kvm_safe(df->device, df->kvm);
+	vfio_device_get_kvm_safe(df->device, df->kvm, df->kvm_module);
 	spin_unlock(&df->kvm_ref_lock);
 }
 
diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index b2299e5bc6df..fc24c0b2cc6f 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -163,7 +163,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 static void vfio_device_group_get_kvm_safe(struct vfio_device *device)
 {
 	spin_lock(&device->group->kvm_ref_lock);
-	vfio_device_get_kvm_safe(device, device->group->kvm);
+	vfio_device_get_kvm_safe(device, device->group->kvm, device->group->kvm_module);
 	spin_unlock(&device->group->kvm_ref_lock);
 }
 
@@ -860,10 +860,11 @@ bool vfio_group_enforced_coherent(struct vfio_group *group)
 	return ret;
 }
 
-void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
+void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm, struct module *kvm_module)
 {
 	spin_lock(&group->kvm_ref_lock);
 	group->kvm = kvm;
+	group->kvm_module = kvm_module;
 	spin_unlock(&group->kvm_ref_lock);
 }
 
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index e4b72e79b7e3..8209da17246c 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -22,8 +22,9 @@ struct vfio_device_file {
 
 	u8 access_granted;
 	u32 devid; /* only valid when iommufd is valid */
-	spinlock_t kvm_ref_lock; /* protect kvm field */
+	spinlock_t kvm_ref_lock; /* protect kvm and kvm_module fields */
 	struct kvm *kvm;
+	struct module *kvm_module;
 	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
 };
 
@@ -89,6 +90,7 @@ struct vfio_group {
 	enum vfio_group_type		type;
 	struct mutex			group_lock;
 	struct kvm			*kvm;
+	struct module			*kvm_module;
 	struct file			*opened_file;
 	struct iommufd_ctx		*iommufd;
 	spinlock_t			kvm_ref_lock;
@@ -107,7 +109,7 @@ void vfio_device_group_unuse_iommu(struct vfio_device *device);
 void vfio_df_group_close(struct vfio_device_file *df);
 struct vfio_group *vfio_group_from_file(struct file *file);
 bool vfio_group_enforced_coherent(struct vfio_group *group);
-void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm);
+void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm, struct module *kvm_module);
 bool vfio_device_has_container(struct vfio_device *device);
 int __init vfio_group_init(void);
 void vfio_group_cleanup(void);
@@ -170,7 +172,8 @@ static inline bool vfio_group_enforced_coherent(struct vfio_group *group)
 	return true;
 }
 
-static inline void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
+static inline void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm,
+				      struct module *kvm_module)
 {
 }
 
@@ -434,11 +437,13 @@ static inline void vfio_virqfd_exit(void)
 #endif
 
 #if IS_ENABLED(CONFIG_KVM)
-void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm);
+void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm,
+			      struct module *kvm_module);
 void vfio_device_put_kvm(struct vfio_device *device);
 #else
 static inline void vfio_device_get_kvm_safe(struct vfio_device *device,
-					    struct kvm *kvm)
+					    struct kvm *kvm,
+					    struct module *kvm_module)
 {
 }
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 6222376ab6ab..78b9cad348b1 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -442,7 +442,7 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
 
 #if IS_ENABLED(CONFIG_KVM)
-void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
+void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm, struct module *kvm_module)
 {
 	void (*pfn)(struct kvm *kvm);
 	bool (*fn)(struct kvm *kvm);
@@ -453,25 +453,31 @@ void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
 	if (!kvm)
 		return;
 
+	if (!try_module_get(kvm_module))
+		return;
+
 	pfn = symbol_get(kvm_put_kvm);
 	if (WARN_ON(!pfn))
-		return;
+		goto out_put_mod;
 
 	fn = symbol_get(kvm_get_kvm_safe);
-	if (WARN_ON(!fn)) {
-		symbol_put(kvm_put_kvm);
-		return;
-	}
+	if (WARN_ON(!fn))
+		goto out_put_sym;
 
 	ret = fn(kvm);
 	symbol_put(kvm_get_kvm_safe);
-	if (!ret) {
-		symbol_put(kvm_put_kvm);
-		return;
-	}
+	if (!ret)
+		goto out_put_sym;
 
 	device->put_kvm = pfn;
 	device->kvm = kvm;
+	device->kvm_module = kvm_module;
+	return;
+
+out_put_sym:
+	symbol_put(kvm_put_kvm);
+out_put_mod:
+	module_put(kvm_module);
 }
 
 void vfio_device_put_kvm(struct vfio_device *device)
@@ -490,6 +496,8 @@ void vfio_device_put_kvm(struct vfio_device *device)
 
 clear:
 	device->kvm = NULL;
+	module_put(device->kvm_module);
+	device->kvm_module = NULL;
 }
 #endif
 
@@ -1513,7 +1521,7 @@ bool vfio_file_enforced_coherent(struct file *file)
 }
 EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
 
-static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
+static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm, struct module *kvm_module)
 {
 	struct vfio_device_file *df = file->private_data;
 
@@ -1524,6 +1532,7 @@ static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 	 */
 	spin_lock(&df->kvm_ref_lock);
 	df->kvm = kvm;
+	df->kvm_module = kvm_module;
 	spin_unlock(&df->kvm_ref_lock);
 }
 
@@ -1535,16 +1544,16 @@ static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
  * When a VFIO device is first opened the KVM will be available in
  * device->kvm if one was associated with the file.
  */
-void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
+void vfio_file_set_kvm(struct file *file, struct kvm *kvm, struct module *kvm_module)
 {
 	struct vfio_group *group;
 
 	group = vfio_group_from_file(file);
 	if (group)
-		vfio_group_set_kvm(group, kvm);
+		vfio_group_set_kvm(group, kvm, kvm_module);
 
 	if (vfio_device_from_file(file))
-		vfio_device_file_set_kvm(file, kvm);
+		vfio_device_file_set_kvm(file, kvm, kvm_module);
 }
 EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
 
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 31b826efba00..5bfec0339804 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -55,6 +55,7 @@ struct vfio_device {
 	unsigned int migration_flags;
 	u8 precopy_info_v2;
 	struct kvm *kvm;
+	struct module *kvm_module;
 
 	/* Members below here are private, not for driver use */
 	unsigned int index;
@@ -377,7 +378,7 @@ static inline bool vfio_file_has_dev(struct file *file, struct vfio_device *devi
 #endif
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
-void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
+void vfio_file_set_kvm(struct file *file, struct kvm *kvm, struct module *kvm_module);
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index 9f9acb66cc1e..515ed445d8e1 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -37,13 +37,13 @@ struct kvm_vfio {
 
 static void kvm_vfio_file_set_kvm(struct file *file, struct kvm *kvm)
 {
-	void (*fn)(struct file *file, struct kvm *kvm);
+	void (*fn)(struct file *file, struct kvm *kvm, struct module *kvm_module);
 
 	fn = symbol_get(vfio_file_set_kvm);
 	if (!fn)
 		return;
 
-	fn(file, kvm);
+	fn(file, kvm, kvm ? THIS_MODULE : NULL);
 
 	symbol_put(vfio_file_set_kvm);
 }
-- 
2.53.0


