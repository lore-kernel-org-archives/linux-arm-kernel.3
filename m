Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D86D2ED11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwKC6HwtuqTh63I/EcCnX9kz02TP/FLMLkDGVcBN5Jg=; b=Yc6hpuLKH5YiOhdCPs7H6FxABN
	aJkkS2XCJvnURjFUOn8vM4BoIJuwxbYojkoymy3H5bIAKE4yNMCkCUV5y97mhIc4T1ZWZ1eOUB/Dp
	Bqvfd5v5pyFu/pfZJFYdcG/PFEfhnGpQfW8mQoQ+33tHDwhL2Q42hnK/DCbc6+2ksSWORstgtIse/
	EqhQOoDQSFUu7BfOYM+cV1ys5D9G7oT7R9k6TZCYfJDaV5oMA91Wkke913OgGtK0bxy2C9fXf13bT
	ciEQ88TB2f7dbBkpvHmM4eiS6+Il1gFYQhrkG4Ul4K8r0f/RzJnoedOK8qv4F5suAVrMocDA7JQHw
	y/6iPSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5TI-00000003HyB-3S4Q;
	Tue, 20 Jan 2026 06:44:12 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sx-00000003HZw-1iD1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:43:52 +0000
Received: from mrdev.corp.microsoft.com (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id 795D320B716D;
	Mon, 19 Jan 2026 22:43:50 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 795D320B716D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768891431;
	bh=vwKC6HwtuqTh63I/EcCnX9kz02TP/FLMLkDGVcBN5Jg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nPKgQKZQP36at7Pw9ekyrrLYOUWnS9INVzf/0p/e0spMOrWzbrSFIdbBIYmCgu9Yl
	 48+3TE7z+OgQ6l8v5rUbjC5ExL0L5TS/agbqGuSQ32EEIyWVA0e4BzSdoH7oe9rgAX
	 6TseUo1oxO/Z0ZpmEfj8TIL4CIuSoguKL/aCkpmA=
From: Mukesh R <mrathor@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joro@8bytes.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	arnd@arndb.de,
	nunodasneves@linux.microsoft.com,
	mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: [PATCH v0 15/15] mshv: Populate mmio mappings for PCI passthru
Date: Mon, 19 Jan 2026 22:42:30 -0800
Message-ID: <20260120064230.3602565-16-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.51.2.vfs.0.1
In-Reply-To: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_224351_478019_4EDF60A9 
X-CRM114-Status: GOOD (  16.18  )
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

From: Mukesh Rathor <mrathor@linux.microsoft.com>

Upon guest access, in case of missing mmio mapping, the hypervisor
generates an unmapped gpa intercept. In this path, lookup the PCI
resource pfn for the guest gpa, and ask the hypervisor to map it
via hypercall. The PCI resource pfn is maintained by the VFIO driver,
and obtained via fixup_user_fault call (similar to KVM).

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
---
 drivers/hv/mshv_root_main.c | 115 ++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
index 03f3aa9f5541..4c8bc7cd0888 100644
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@ -56,6 +56,14 @@ struct hv_stats_page {
 	};
 } __packed;
 
+bool hv_nofull_mmio;   /* don't map entire mmio region upon fault */
+static int __init setup_hv_full_mmio(char *str)
+{
+	hv_nofull_mmio = true;
+	return 0;
+}
+__setup("hv_nofull_mmio", setup_hv_full_mmio);
+
 struct mshv_root mshv_root;
 
 enum hv_scheduler_type hv_scheduler_type;
@@ -612,6 +620,109 @@ mshv_partition_region_by_gfn(struct mshv_partition *partition, u64 gfn)
 }
 
 #ifdef CONFIG_X86_64
+
+/*
+ * Check if uaddr is for mmio range. If yes, return 0 with mmio_pfn filled in
+ * else just return -errno.
+ */
+static int mshv_chk_get_mmio_start_pfn(struct mshv_partition *pt, u64 gfn,
+				       u64 *mmio_pfnp)
+{
+	struct vm_area_struct *vma;
+	bool is_mmio;
+	u64 uaddr;
+	struct mshv_mem_region *mreg;
+	struct follow_pfnmap_args pfnmap_args;
+	int rc = -EINVAL;
+
+	/*
+	 * Do not allow mem region to be deleted beneath us. VFIO uses
+	 * useraddr vma to lookup pci bar pfn.
+	 */
+	spin_lock(&pt->pt_mem_regions_lock);
+
+	/* Get the region again under the lock */
+	mreg = mshv_partition_region_by_gfn(pt, gfn);
+	if (mreg == NULL || mreg->type != MSHV_REGION_TYPE_MMIO)
+		goto unlock_pt_out;
+
+	uaddr = mreg->start_uaddr +
+		((gfn - mreg->start_gfn) << HV_HYP_PAGE_SHIFT);
+
+	mmap_read_lock(current->mm);
+	vma = vma_lookup(current->mm, uaddr);
+	is_mmio = vma ? !!(vma->vm_flags & (VM_IO | VM_PFNMAP)) : 0;
+	if (!is_mmio)
+		goto unlock_mmap_out;
+
+	pfnmap_args.vma = vma;
+	pfnmap_args.address = uaddr;
+
+	rc = follow_pfnmap_start(&pfnmap_args);
+	if (rc) {
+		rc = fixup_user_fault(current->mm, uaddr, FAULT_FLAG_WRITE,
+				      NULL);
+		if (rc)
+			goto unlock_mmap_out;
+
+		rc = follow_pfnmap_start(&pfnmap_args);
+		if (rc)
+			goto unlock_mmap_out;
+	}
+
+	*mmio_pfnp = pfnmap_args.pfn;
+	follow_pfnmap_end(&pfnmap_args);
+
+unlock_mmap_out:
+	mmap_read_unlock(current->mm);
+unlock_pt_out:
+	spin_unlock(&pt->pt_mem_regions_lock);
+	return rc;
+}
+
+/*
+ * At present, the only unmapped gpa is mmio space. Verify if it's mmio
+ * and resolve if possible.
+ * Returns: True if valid mmio intercept and it was handled, else false
+ */
+static bool mshv_handle_unmapped_gpa(struct mshv_vp *vp)
+{
+	struct hv_message *hvmsg = vp->vp_intercept_msg_page;
+	struct hv_x64_memory_intercept_message *msg;
+	union hv_x64_memory_access_info accinfo;
+	u64 gfn, mmio_spa, numpgs;
+	struct mshv_mem_region *mreg;
+	int rc;
+	struct mshv_partition *pt = vp->vp_partition;
+
+	msg = (struct hv_x64_memory_intercept_message *)hvmsg->u.payload;
+	accinfo = msg->memory_access_info;
+
+	if (!accinfo.gva_gpa_valid)
+		return false;
+
+	/* Do a fast check and bail if non mmio intercept */
+	gfn = msg->guest_physical_address >> HV_HYP_PAGE_SHIFT;
+	mreg = mshv_partition_region_by_gfn(pt, gfn);
+	if (mreg == NULL || mreg->type != MSHV_REGION_TYPE_MMIO)
+		return false;
+
+	rc = mshv_chk_get_mmio_start_pfn(pt, gfn, &mmio_spa);
+	if (rc)
+		return false;
+
+	if (!hv_nofull_mmio) {		/* default case */
+		gfn = mreg->start_gfn;
+		mmio_spa = mmio_spa - (gfn - mreg->start_gfn);
+		numpgs = mreg->nr_pages;
+	} else
+		numpgs = 1;
+
+	rc = hv_call_map_mmio_pages(pt->pt_id, gfn, mmio_spa, numpgs);
+
+	return rc == 0;
+}
+
 static struct mshv_mem_region *
 mshv_partition_region_by_gfn_get(struct mshv_partition *p, u64 gfn)
 {
@@ -666,13 +777,17 @@ static bool mshv_handle_gpa_intercept(struct mshv_vp *vp)
 
 	return ret;
 }
+
 #else  /* CONFIG_X86_64 */
+static bool mshv_handle_unmapped_gpa(struct mshv_vp *vp) { return false; }
 static bool mshv_handle_gpa_intercept(struct mshv_vp *vp) { return false; }
 #endif /* CONFIG_X86_64 */
 
 static bool mshv_vp_handle_intercept(struct mshv_vp *vp)
 {
 	switch (vp->vp_intercept_msg_page->header.message_type) {
+	case HVMSG_UNMAPPED_GPA:
+		return mshv_handle_unmapped_gpa(vp);
 	case HVMSG_GPA_INTERCEPT:
 		return mshv_handle_gpa_intercept(vp);
 	}
-- 
2.51.2.vfs.0.1


