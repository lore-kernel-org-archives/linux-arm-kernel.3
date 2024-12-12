Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8B0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwdSo/iBYWKLrbHTG+HyNIQbWdtp/PGNH3wAwUOLzAc=; b=ZkwfiKrGPCvsTBJAauDWmhev0E
	UnLXQgEDVeGOI40KCc2ZbQaQgWqlMZd5XyXCz3PDrLvB5JcmHZdFZt8GfqnM8XGP562PtFAzBauL/
	H0SDKHruRD2rlI4pUnUXkCBpyQMJIFlwJMbAIFVzG2Bnbt+scK7fQANSuD4LC0GrDpMXgpUknDMYv
	+TYbQQy+x51nPv0kw+ZRNhI849jXDsTeQIT9DqJuheNyBJkBDnX11lk34fgjIn4KjgB2wv4NziP4n
	RlyBA1jl0AS7ZzZgpNw2bIQJuPm+5CKM2Fes4Gf+vKsp8aRqrwRrs051nfbl3WM2Pv2XThTkvqUkh
	n4mSA6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnoE-00000001Oej-1QuL;
	Thu, 12 Dec 2024 18:21:10 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYp-00000001JeK-1sI3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:16 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-385e1fd40acso549493f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026713; x=1734631513; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cwdSo/iBYWKLrbHTG+HyNIQbWdtp/PGNH3wAwUOLzAc=;
        b=pEtU5t11MklzgY1Xyq8V6YWpbDPmqaQic5L6ZcnvgOLFrTvMefmEGlpYEWs7yuzd/4
         MfUB8MG8sg0Gb3YVw/262LTLw/c2cm9X4soCUwaVkOFVWgpdmmepjoLsqW724/lWcrgK
         2bO5cXYTJXv0iD38q9hBUdMUa/iXkXsJK0Idf3+nbtUaAtJkIHUIU4z2xliu0our1+Dx
         /X2v2RoqZArU7N3/4p243PkkzjMVTwSy3nU1JKjkhjy+FyFFR9pQyJZ3B5nr8Rz7w41+
         eoVYQLqcTt8jtREgz++eJr4oKYt4jHZAvmIEO5cmX2fkzvQStr6bb3rZ/0IY9NP+XWpz
         D1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026713; x=1734631513;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwdSo/iBYWKLrbHTG+HyNIQbWdtp/PGNH3wAwUOLzAc=;
        b=r+bDZaJaRk7Ix0kmx/+UFWp9mKbZo6tYoT66ICREhjo7sZ5/s4rfk4mXkro0+NF31t
         0EsByodnkkK5tQd+FVgSiT93K4mA4xafkPB7JmQATmQfXfQK8MTSKxqqO+bvCAEw53uF
         7JMmMyo7m/0mHtrCKyW3+GSA1z+Y0iDbDD6K6C5OLsBktL7QIi+BGoHjVFztQlklQQP/
         aP5LUPXcZJTR2ftZtEM8YXiWzsvQ9vqB6m23DNpN49jqFHPaXWDZ77pYSanGbMQAo9ek
         97qae0oWPEpYiPwy1+Q06LqzRmXUXKT9oc2fhHBujeZxn1upUhmghqK9m9Nw+iS44GD6
         lO1A==
X-Forwarded-Encrypted: i=1; AJvYcCV4D7dKgbChCcSGKQc1nf0vxovGRcOR7/GuzbMMcsORb6cDPbEYtKo3Za6CgVSNy89vJnCPXCgJkXdDJSAeAIJy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0jCZlbldC3KrdiE1xHUP12CCYuHZ75MA24FWs9HXXackGn/JN
	veeRyL3ZBJ4D8B+U3kLW50fgYE2rWr5ZDuxnK+BRf3Hi2W97rVBJrI5ueR4WDCAXW5L2VaKqiQf
	sZLGNF0XyiA==
X-Google-Smtp-Source: AGHT+IFmbvEzDhykMqyy8OjOsZ2NeXlkTbt4cjtUEyGjwEAdXiFcByoXchIDeMneglUtq2nV1Br6AHE0eUe6Bg==
X-Received: from wmom6.prod.google.com ([2002:a05:600c:4606:b0:436:16c6:831])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2b0e:b0:386:8ff:d20b with SMTP id ffacd0b85a97d-3864ce9f344mr5120606f8f.27.1734026713289;
 Thu, 12 Dec 2024 10:05:13 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:38 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-15-smostafa@google.com>
Subject: [RFC PATCH v2 14/58] KVM: arm64: pkvm: Add IOMMU hypercalls
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100515_488002_7EC54D10 
X-CRM114-Status: GOOD (  14.26  )
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

The unprivileged host IOMMU driver forwards some of the IOMMU API calls
to the hypervisor, which installs and populates the page tables.

Note that this is not a stable ABI. Those hypercalls change with the
kernel just like internal function calls.

One thing special about some of the IOMMU hypercalls, that they use
newly added hyp_reqs_smccc_encode() to encode memory requests in
the HVC return, leveraging X1, X2 and X3 registers as allowed SMCCC.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/include/asm/kvm_asm.h        |  7 ++
 arch/arm64/kvm/hyp/include/nvhe/iommu.h | 14 ++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 89 +++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 40 +++++++++++
 4 files changed, 150 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index e4b391bdfdac..9ea155a04332 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -107,6 +107,13 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_alloc_mgt_refill,
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_alloc_mgt_reclaimable,
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_alloc_mgt_reclaim,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_alloc_domain,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_free_domain,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_attach_dev,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_detach_dev,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_map_pages,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_unmap_pages,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_iova_to_phys,
 
 	/*
 	 * Start of the dynamically registered hypercalls. Start a bit
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 1ac70cc28a9e..908863f07b0b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -4,6 +4,20 @@
 
 #include <asm/kvm_host.h>
 
+/* Hypercall handlers */
+int kvm_iommu_alloc_domain(pkvm_handle_t domain_id, int type);
+int kvm_iommu_free_domain(pkvm_handle_t domain_id);
+int kvm_iommu_attach_dev(pkvm_handle_t iommu_id, pkvm_handle_t domain_id,
+			 u32 endpoint_id, u32 pasid, u32 pasid_bits);
+int kvm_iommu_detach_dev(pkvm_handle_t iommu_id, pkvm_handle_t domain_id,
+			 u32 endpoint_id, u32 pasid);
+size_t kvm_iommu_map_pages(pkvm_handle_t domain_id,
+			   unsigned long iova, phys_addr_t paddr, size_t pgsize,
+			   size_t pgcount, int prot);
+size_t kvm_iommu_unmap_pages(pkvm_handle_t domain_id, unsigned long iova,
+			     size_t pgsize, size_t pgcount);
+phys_addr_t kvm_iommu_iova_to_phys(pkvm_handle_t domain_id, unsigned long iova);
+
 struct kvm_iommu_ops {
 	int (*init)(void);
 };
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 08c0ff823a55..9b224842c487 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -19,6 +19,7 @@
 #include <nvhe/alloc.h>
 #include <nvhe/alloc_mgt.h>
 #include <nvhe/ffa.h>
+#include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/modules.h>
 #include <nvhe/mm.h>
@@ -1592,6 +1593,87 @@ static void handle___pkvm_hyp_alloc_mgt_reclaim(struct kvm_cpu_context *host_ctx
 	cpu_reg(host_ctxt, 2) = mc.nr_pages;
 }
 
+static void handle___pkvm_host_iommu_alloc_domain(struct kvm_cpu_context *host_ctxt)
+{
+	int ret;
+	DECLARE_REG(pkvm_handle_t, domain, host_ctxt, 1);
+	DECLARE_REG(int, type, host_ctxt, 2);
+
+	ret = kvm_iommu_alloc_domain(domain, type);
+	hyp_reqs_smccc_encode(ret, host_ctxt, this_cpu_ptr(&host_hyp_reqs));
+}
+
+static void handle___pkvm_host_iommu_free_domain(struct kvm_cpu_context *host_ctxt)
+{
+	int ret;
+	DECLARE_REG(pkvm_handle_t, domain, host_ctxt, 1);
+
+	ret = kvm_iommu_free_domain(domain);
+	hyp_reqs_smccc_encode(ret, host_ctxt, this_cpu_ptr(&host_hyp_reqs));
+}
+
+static void handle___pkvm_host_iommu_attach_dev(struct kvm_cpu_context *host_ctxt)
+{
+	int ret;
+	DECLARE_REG(pkvm_handle_t, iommu, host_ctxt, 1);
+	DECLARE_REG(pkvm_handle_t, domain, host_ctxt, 2);
+	DECLARE_REG(unsigned int, endpoint, host_ctxt, 3);
+	DECLARE_REG(unsigned int, pasid, host_ctxt, 4);
+	DECLARE_REG(unsigned int, pasid_bits, host_ctxt, 5);
+
+	ret = kvm_iommu_attach_dev(iommu, domain, endpoint,
+				   pasid, pasid_bits);
+	hyp_reqs_smccc_encode(ret, host_ctxt, this_cpu_ptr(&host_hyp_reqs));
+}
+
+static void handle___pkvm_host_iommu_detach_dev(struct kvm_cpu_context *host_ctxt)
+{
+	int ret;
+	DECLARE_REG(pkvm_handle_t, iommu, host_ctxt, 1);
+	DECLARE_REG(pkvm_handle_t, domain, host_ctxt, 2);
+	DECLARE_REG(unsigned int, endpoint, host_ctxt, 3);
+	DECLARE_REG(unsigned int, pasid, host_ctxt, 4);
+
+	ret = kvm_iommu_detach_dev(iommu, domain, endpoint, pasid);
+	hyp_reqs_smccc_encode(ret, host_ctxt, this_cpu_ptr(&host_hyp_reqs));
+}
+
+static void handle___pkvm_host_iommu_map_pages(struct kvm_cpu_context *host_ctxt)
+{
+	unsigned long ret;
+	DECLARE_REG(pkvm_handle_t, domain, host_ctxt, 1);
+	DECLARE_REG(unsigned long, iova, host_ctxt, 2);
+	DECLARE_REG(phys_addr_t, paddr, host_ctxt, 3);
+	DECLARE_REG(size_t, pgsize, host_ctxt, 4);
+	DECLARE_REG(size_t, pgcount, host_ctxt, 5);
+	DECLARE_REG(unsigned int, prot, host_ctxt, 6);
+
+	ret = kvm_iommu_map_pages(domain, iova, paddr,
+				  pgsize, pgcount, prot);
+	hyp_reqs_smccc_encode(ret, host_ctxt, this_cpu_ptr(&host_hyp_reqs));
+}
+
+static void handle___pkvm_host_iommu_unmap_pages(struct kvm_cpu_context *host_ctxt)
+{
+	unsigned long ret;
+	DECLARE_REG(pkvm_handle_t, domain, host_ctxt, 1);
+	DECLARE_REG(unsigned long, iova, host_ctxt, 2);
+	DECLARE_REG(size_t, pgsize, host_ctxt, 3);
+	DECLARE_REG(size_t, pgcount, host_ctxt, 4);
+
+	ret = kvm_iommu_unmap_pages(domain, iova,
+				    pgsize, pgcount);
+	hyp_reqs_smccc_encode(ret, host_ctxt, this_cpu_ptr(&host_hyp_reqs));
+}
+
+static void handle___pkvm_host_iommu_iova_to_phys(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, domain, host_ctxt, 1);
+	DECLARE_REG(unsigned long, iova, host_ctxt, 2);
+
+	cpu_reg(host_ctxt, 1) = kvm_iommu_iova_to_phys(domain, iova);
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -1649,6 +1731,13 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_hyp_alloc_mgt_refill),
 	HANDLE_FUNC(__pkvm_hyp_alloc_mgt_reclaimable),
 	HANDLE_FUNC(__pkvm_hyp_alloc_mgt_reclaim),
+	HANDLE_FUNC(__pkvm_host_iommu_alloc_domain),
+	HANDLE_FUNC(__pkvm_host_iommu_free_domain),
+	HANDLE_FUNC(__pkvm_host_iommu_attach_dev),
+	HANDLE_FUNC(__pkvm_host_iommu_detach_dev),
+	HANDLE_FUNC(__pkvm_host_iommu_map_pages),
+	HANDLE_FUNC(__pkvm_host_iommu_unmap_pages),
+	HANDLE_FUNC(__pkvm_host_iommu_iova_to_phys),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index 3bd87d2084e9..9022fd612a49 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -16,3 +16,43 @@ int kvm_iommu_init(void)
 
 	return kvm_iommu_ops->init();
 }
+
+int kvm_iommu_alloc_domain(pkvm_handle_t domain_id, int type)
+{
+	return -ENODEV;
+}
+
+int kvm_iommu_free_domain(pkvm_handle_t domain_id)
+{
+	return -ENODEV;
+}
+
+int kvm_iommu_attach_dev(pkvm_handle_t iommu_id, pkvm_handle_t domain_id,
+			 u32 endpoint_id, u32 pasid, u32 pasid_bits)
+{
+	return -ENODEV;
+}
+
+int kvm_iommu_detach_dev(pkvm_handle_t iommu_id, pkvm_handle_t domain_id,
+			 u32 endpoint_id, u32 pasid)
+{
+	return -ENODEV;
+}
+
+size_t kvm_iommu_map_pages(pkvm_handle_t domain_id,
+			   unsigned long iova, phys_addr_t paddr, size_t pgsize,
+			   size_t pgcount, int prot)
+{
+	return 0;
+}
+
+size_t kvm_iommu_unmap_pages(pkvm_handle_t domain_id, unsigned long iova,
+			     size_t pgsize, size_t pgcount)
+{
+	return 0;
+}
+
+phys_addr_t kvm_iommu_iova_to_phys(pkvm_handle_t domain_id, unsigned long iova)
+{
+	return 0;
+}
-- 
2.47.0.338.g60cca15819-goog


