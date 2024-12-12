Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67928E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpD1lhD14fjHF53MLiJhdNjSda5T/6inc9eTWlsnoLw=; b=loy9n6xmAYravo1j4wcvsPf9UD
	QArT7inObjkwkhbhjq9H333+eqD6jO2f5W6vt9TAjs/Vrz3VmherJFYpFir4SDZN4Ntk3xYLF9xwP
	Rc89q8wYLjLWW88qXrvW8M6PJBYwdYZ6ghEwBvsA80hXQuYfut7CcfAaoo0DCqSwryZJK6Sy2YoFY
	8CrN26r9HSylrOvdGsrFAzKoStP7LH4Ri7Tu4ef9xxE3elPYZY1oJNGbhZzENpBbbTJ9vC8m1VKV9
	41md2hjOXGS0Ydup3XxFqqo7IbsDcGohYsarHtmP+jiUm25CQiCUgJ04LqOvgasjPqSEzVhJRJxdz
	sKGt68Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoGU-00000001UyY-1Maq;
	Thu, 12 Dec 2024 18:50:22 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZj-00000001K0q-1Skx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:12 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361eb83f46so8314435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026769; x=1734631569; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EpD1lhD14fjHF53MLiJhdNjSda5T/6inc9eTWlsnoLw=;
        b=SKVwUr4cDafJkSzHb7cLiVyu9BRx80P2vjs3Px6F5J2mZH0j45+1j2nQEo1SylEXOn
         UoiKOodZxT1soLB7d0iGo/u5HCXeAz0DLOLTQila+IfBVBE4E6jRS2TxnJ28cN7N4iKQ
         kLsnxioOo2FALW3397xH6knupecOcoXG6cRH8sPRayH02BrgkQEBh4jz7FvwbBg+PxUd
         X/nHkffR9ipEvKgkuK5lQaXCEDKiro3TmJDgzcsAYtb3HspgnbXyyq/yYbH1ICu0Q1qg
         vw/k3prVXSrfmji0eV2hEQlA4ii2iZg4gvKAZ6fMrXEXeyjACv+2WvtLyyVSS3n2k5P5
         4A6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026769; x=1734631569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpD1lhD14fjHF53MLiJhdNjSda5T/6inc9eTWlsnoLw=;
        b=JvFYGwrLXFUMv00vB1ffFXjtDVTsaTXRWekTVNo5+wSkBNae4CAzJF0zZsNRMDYi3i
         hcnio3TGJwvdS0tNv5F+/NrsG+3INY/Y8y1SJTjbbLnQ7kDEzulLxKkwrGrclqOA7vad
         sZb7uhrCM+02JzAMRFSjKIsDGPweg5t9Oy2jNndQUNyuY7ySS/9aqUI4NTK+TDNLPO/S
         hq9GggDAL0UwR2D2gpjC9BKJINcaffY92cATJXrU8QJLafSasOuiaZQgr6rT//gul5nI
         gohk0oCzS5+vdAoMGz0jPIvWvtM34wWLLSFvepxdPgu7wbdMWi1b92+rf1DjwnfxhgKT
         S8qw==
X-Forwarded-Encrypted: i=1; AJvYcCV5LlAFOig+FgeN9ngQQe9QWTZm8SJIAM5pj+X9oSVzlNS584UCCXny4XjLU093ttVlyLJzn/w7+SRoQQeBK14L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5lZjeno9e+8UwbuAyI9CWZcLHO5vd6BaHBRBUGHv/V6ux38K7
	IUflh6Au1XQPKhk4RIf30AB0Bl0+u6vvHdqxR2UcKGoq5vVRjymiIpoCFsdnSb089mmKheHkbi7
	bqYJ0FBONoQ==
X-Google-Smtp-Source: AGHT+IHoAtLMCXcx0pNbqpLg+273hrX6BxpTnA/fbV1HglY7lURxrvsoWLSyAcKravbhVxC4p30yvMPx2T2q2A==
X-Received: from wmbay15.prod.google.com ([2002:a05:600c:1e0f:b0:434:ff52:1c7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5127:b0:434:fddf:5c0a with SMTP id 5b1f17b1804b1-4361c344c70mr73849075e9.3.1734026769635;
 Thu, 12 Dec 2024 10:06:09 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:05 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-42-smostafa@google.com>
Subject: [RFC PATCH v2 41/58] KVM: arm64: smmu-v3: Add DABT handler
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
X-CRM114-CacheID: sfid-20241212_100611_385989_2285704F 
X-CRM114-Status: GOOD (  15.44  )
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

Add a data abort handler for the SMMUv3, we allow access for
ETVQ and GERROR for debug purpose.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index 1821a3420a4d..2a99873d980f 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -13,6 +13,7 @@
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
 #include <nvhe/pkvm.h>
+#include <nvhe/trap_handler.h>
 
 #define ARM_SMMU_POLL_TIMEOUT_US	100000 /* 100ms arbitrary timeout */
 
@@ -1269,6 +1270,62 @@ static phys_addr_t smmu_iova_to_phys(struct kvm_hyp_iommu_domain *domain,
 	return paddr;
 }
 
+static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
+			     struct kvm_cpu_context *host_ctxt,
+			     u64 esr, u32 off)
+{
+	bool is_write = esr & ESR_ELx_WNR;
+	unsigned int len = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
+	int rd = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
+	const u32 no_access  = 0;
+	const u32 read_write = (u32)(-1);
+	const u32 read_only = is_write ? no_access : read_write;
+	u32 mask = no_access;
+
+	/*
+	 * Only handle MMIO access with u32 size and alignment.
+	 * We don't need to change 64-bit registers for now.
+	 */
+	if ((len != sizeof(u32)) || (off & (sizeof(u32) - 1)))
+		return false;
+
+	switch (off) {
+	case ARM_SMMU_EVTQ_PROD + SZ_64K:
+		mask = read_write;
+		break;
+	case ARM_SMMU_EVTQ_CONS + SZ_64K:
+		mask = read_write;
+		break;
+	case ARM_SMMU_GERROR:
+		mask = read_only;
+		break;
+	case ARM_SMMU_GERRORN:
+		mask = read_write;
+		break;
+	};
+
+	if (!mask)
+		return false;
+	if (is_write)
+		writel_relaxed(cpu_reg(host_ctxt, rd) & mask, smmu->base + off);
+	else
+		cpu_reg(host_ctxt, rd) = readl_relaxed(smmu->base + off);
+
+	return true;
+}
+
+static bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
+{
+	struct hyp_arm_smmu_v3_device *smmu;
+
+	for_each_smmu(smmu) {
+		if (addr < smmu->mmio_addr || addr >= smmu->mmio_addr + smmu->mmio_size)
+			continue;
+		return smmu_dabt_device(smmu, host_ctxt, esr, addr - smmu->mmio_addr);
+	}
+	return false;
+}
+
 /* Shared with the kernel driver in EL1 */
 struct kvm_iommu_ops smmu_ops = {
 	.init				= smmu_init,
@@ -1281,4 +1338,5 @@ struct kvm_iommu_ops smmu_ops = {
 	.map_pages			= smmu_map_pages,
 	.unmap_pages			= smmu_unmap_pages,
 	.iova_to_phys			= smmu_iova_to_phys,
+	.dabt_handler			= smmu_dabt_handler,
 };
-- 
2.47.0.338.g60cca15819-goog


