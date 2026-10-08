Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0110ECA6002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+zl3nAXL+EyGLgki8rh3fu7i1/takcs2cpm2L+B+co=; b=3aoFFIi7Ttl912ZQMafllQRH5a
	JMFcnOhBNYhDsaQixo/JfocTuR9ncO4z5pGW5DMUaSv/pqFHEI3lEZufTVfQ9HiGpLEFSpRoYoWt1
	F5Rt/UkKrvAuGJYFzGdzRbcX34je6EJgeKw3xZyyksVDOeWHE6Z2I0B3kwIfEaY+GZ18RCtVyKJEq
	sRVmUd/aHA80H4Hdg8Vmooe5tPuwuUh4zSBUtIJn7X3LIbKaFD+r78+GYB5vHgBxMQpolg8UuvBpA
	QZnc4o3Z/X01Cjtv8o3TrbmFRM3fQFlR2P9HZhC/Jic5wJVk/FHn0Jmt27CcPWHfjbu3xS6QrWrV/
	KUPUBL5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhBo-00000003aeX-2W3E;
	Thu, 08 Oct 2026 06:01:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhBn-00000003adu-2m1x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:01:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6126841525;
	Thu,  8 Oct 2026 06:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630801F00893;
	Thu,  8 Oct 2026 06:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791439271;
	bh=R+zl3nAXL+EyGLgki8rh3fu7i1/takcs2cpm2L+B+co=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T3g3JYtcIyBzdvox31W6b+TsIRQL1hsZajFPo0wk+e5Ez2Uk4c/I/aSrDkEQ+X5qv
	 v9PcUI4v5JKBa7U/wFj/It3xCdQmnWopj/IzLoL1MxBq79y5FJl/ZmQ8Qa3++dFUCF
	 QIEsTfyOn3W+BPzPEv4tJ/r+mJOUZLnHDqhDRVR5fqHWVS1Iqy6tDtWfgLpUKZd+z/
	 962CdnQJOKy3D+WEjgwsW/4iOclbCZlsjFTpz285RE4nH/Ko/Cx3HglLE+0DaHuPHy
	 7vnST6tv4jkCH/7hJJyIbhwpOELZmEpsSN3tHQg6fZISxcpJ7pFthofbMjD1Eb+w1z
	 aw9F427KJ0jvQ==
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
Subject: [PATCH v7 06/16] KVM: Remove unused file_is_kvm
Date: Thu,  8 Oct 2026 11:29:45 +0530
Message-ID: <20261008055955.4014342-7-aneesh.kumar@kernel.org>
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

Remove the now unused file_is_kvm function.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
Acked-by: Sean Christopherson <seanjc@google.com>
Acked-by: Janosch Frank <frankja@linux.ibm.com>
---
 include/linux/kvm_host.h | 1 -
 virt/kvm/kvm_main.c      | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3c5a389361c6..586f6e8bb81b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1087,7 +1087,6 @@ void kvm_exit(void);
 void kvm_get_kvm(struct kvm *kvm);
 bool kvm_get_kvm_safe(struct kvm *kvm);
 void kvm_put_kvm(struct kvm *kvm);
-bool file_is_kvm(struct file *file);
 
 /*
  * Architectures define kvm_file_to_kvm_arch to <arch>
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ff4fab9753ca..60e614795a36 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5515,12 +5515,6 @@ static struct file_operations kvm_vm_fops = {
 	KVM_COMPAT(kvm_vm_compat_ioctl),
 };
 
-bool file_is_kvm(struct file *file)
-{
-	return file && file->f_op == &kvm_vm_fops;
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(file_is_kvm);
-
 #ifdef kvm_file_to_kvm_arch
 struct kvm *kvm_file_to_kvm_fn(struct file *file)
 {
-- 
2.43.0


