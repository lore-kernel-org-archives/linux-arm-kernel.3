Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1FECA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QMxcDy++DYkjJXJYZyvIubChEwATxZs066mDelscVg=; b=oNK6I33ASXtBZgNE2QHqF3J2OD
	mQvSGZs1fhOiE+GW3CFRcx/ejj5bfdy3xuPu0upmm09c5+lL0941zX2/wLo+ehqOd9SDuBfsozaAq
	HE8zh5C38YFac/18whQDQ3TfCMp7qzrLoXffCeW49QShOunhXMB4sA2++Gcc+YAaRGgt1AyCXdhye
	Ray/M60Bt0CnVlnEOzXojyY0EuMaotAFbtpJVz1Gwu9sDLPIwtA6kZ7Mu1V3UAuPgm+vYZ3i1ZlwQ
	cRz5MJWhntsQOtz7GJMYMlTBf7n3fq9Jk/BCGGxnqj4fdg6ntl5VBY989W+xSmyn8wHhKayHuuWV+
	459L/hpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhBC-00000003aKV-3YHN;
	Thu, 08 Oct 2026 06:00:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhBB-00000003aJt-1AwC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:00:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CBD743C65;
	Thu,  8 Oct 2026 06:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124841F000FF;
	Thu,  8 Oct 2026 06:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791439232;
	bh=5QMxcDy++DYkjJXJYZyvIubChEwATxZs066mDelscVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KQ0uCr3L3qdrwU76AqE7Yax2GKQ5TBVNbUqKyWl6e11lgT1BRT+w9mFT1WZsiMpJA
	 iFdb1B7BMWnXopu7JN0QzFAZm3QT51V8USyWK/hdQt4RpD3RlCoc3ESjolneLIT+py
	 a0l2Cla6XReu0i+VXbj0sQlaWfyj2HVcqgk9vPDYed7yuYtXS281pwpXO52SAv+1uk
	 +qQhkCcu9PQ58JhKpqZfIVUNp1QrSU4x8NRaEIJLHUdfRBnmIFclD0KmSBHfPY+XUy
	 CDxdJxBeBW1KCjoKx+J30KMJy3wVHEBaou6v+l6mrxZIPDjo4wilkf7KpWwehb1aO3
	 FfklXGdLqGCeg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Sean Christopherson <seanjc@google.com>,
	Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH v7 02/16] KVM: Add file back-pointer to struct kvm
Date: Thu,  8 Oct 2026 11:29:41 +0530
Message-ID: <20261008055955.4014342-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Steffen Eiden <seiden@linux.ibm.com>

Add kvm->file as a no-reference back-pointer to the VM file in struct
kvm. The pointer is set at VM creation time and cleared under
WRITE_ONCE() in kvm_vm_release() before the file is freed.
Callers storing the file must take their own reference.

Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
Acked-by: Sean Christopherson <seanjc@google.com>
Acked-by: Janosch Frank <frankja@linux.ibm.com>
---
 include/linux/kvm_host.h | 6 ++++++
 virt/kvm/kvm_main.c      | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index bc3abfde8393..3c5a389361c6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -784,6 +784,12 @@ struct kvm {
 	 * kvm_swap_active_memslots().
 	 */
 	struct mutex slots_arch_lock;
+	/*
+	 * Back-reference to the VM file for subsystems (e.g., VFIO). Holds no
+	 * reference to avoid pinning the VM. Callers storing the file must
+	 * take their own reference.
+	 */
+	struct file *file;
 	struct mm_struct *mm; /* userspace tied to this vm */
 	unsigned long nr_memslot_pages;
 	/* The two memslot sets - active and inactive (per address space) */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 07fc874a38e1..8e49ea809528 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1352,6 +1352,8 @@ static int kvm_vm_release(struct inode *inode, struct file *filp)
 
 	kvm_irqfd_release(kvm);
 
+	WRITE_ONCE(kvm->file, NULL);
+
 	kvm_put_kvm(kvm);
 	return 0;
 }
@@ -5555,6 +5557,8 @@ static int kvm_dev_ioctl_create_vm(unsigned long type)
 		goto put_kvm;
 	}
 
+	kvm->file = file;
+
 	/*
 	 * Don't call kvm_put_kvm anymore at this point; file->f_op is
 	 * already set, with ->release() being kvm_vm_release().  In error
-- 
2.43.0


