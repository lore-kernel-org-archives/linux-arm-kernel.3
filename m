Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD09E77183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyZdzXRtf8rptaiCXBMnMziyj8QgYtzTFp7Z15tvNkk=; b=241MN2YUlLL3nzivhLlLbZt1nb
	Irvl4K4b3unxeIiXyrG9CneiAsGZmyF+p5vn5CUSc3jR4yWbvLJueOibFrwJDcQQZ7yu0n/npAOhH
	FCKSptJYmgm96USNtpcx5Mg+6UsxmCFe+scu6sM18uwbm9B2GZe1Bho69LcDOR78aYRaKWqfl6L95
	qpmQOQT9hi+MPfpA1BDJ2ISdpwWCAHjRvSVsFfEPgrJzpa78kqXUfxJgQu4hkrPut+mxgAKAWT6KP
	lu0NV2l0lwFlHXBUF7wVDbSQ1cl/3zTVBVdhA6Rb+b3foQQo8aqKcgLCPeTWI8ZLUBPPexO1QTcuB
	fA58t9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofO-00000001aCn-0gKP;
	Thu, 12 Dec 2024 19:16:06 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnaG-00000001KD6-2y8q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:45 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3862e986d17so428705f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026802; x=1734631602; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tyZdzXRtf8rptaiCXBMnMziyj8QgYtzTFp7Z15tvNkk=;
        b=u+AzUvtYp2FbOofND83jWmc85UeB6i0lJyN39VHJ7eCiYM8uIshLkVtRAU8PahmS+Z
         /gRx17TH+K1LYd6blp5wmxtl2G/L8rmhPIcko0PZelB/fYG8wz79bLAgd7pAJsIOqWhx
         Hoc89wPc5uAMwluM5XMfUeWzw9hNtL3nhWGGSVSahPDsb5jL4s5aYfowTJLNr4jZJUnL
         oGlkiAK3MaxOeE/x8AANejHg3JaVTnCYoZE2SZx3qBik88XdJuYLMDEsqhTh0CROlHuk
         Yrfihc5vSikJRxoPH3ilBRpGHmclAi7u98xrtBKuQhg+vTwhHHNQrnxhNjO3TBqqSVM3
         2WDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026802; x=1734631602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tyZdzXRtf8rptaiCXBMnMziyj8QgYtzTFp7Z15tvNkk=;
        b=NqS6oHZRhI2CPlIoXzNPSmruDuoDf5iwkwk8hZ1Ly0QdBZKd4ClzS5ofmcqXqHO7Gm
         yKdSFHOWcx4QOhhAo74GjUAwFJWQxZXMGCJeGkaWyzvDG7lgLJtbEb2vZ3pBe1RcOzXS
         I7fCzfUWxY2/H6TJZN2RNx1tpRMfZqbuRp05LPLj8Vl8wu4Zkp8Kepre5A1Y+7PUykcU
         IdVl3tmG38FEgfIvpAAw/RVE7uGxgfL4nAKW+O/rQYS4FdZPzqZ+L4BBht1bJLJ0pEIk
         NNfRF6cppaXb5QxFMkOq9inHBQBu3CG1eDQVVDBYP7Ggz1FbWpyO09Wdsbv6HN9PKXmr
         nxag==
X-Forwarded-Encrypted: i=1; AJvYcCW8bsbElDRN0+envweg6eqkCq6ZOxn6y+0JrWUXWKU49X/1Ck1r2wyn0lw/axHwjviotKtyP8Ic7DDkycYUGsgk@lists.infradead.org
X-Gm-Message-State: AOJu0YwtvU9+RRFsNhzQ15LZg+bclnRTodJu3QThXuKQP1tJc0uRLcA0
	7sro1B7NvPbMjuOL2aZKM1gsGhe+lUSJwGPfTdK6AJ3GWV83ZjZgy7I1aLeh9w04D+qKUZVeRn6
	55qq5ndf8sw==
X-Google-Smtp-Source: AGHT+IEWuyPM5Tx5DrErgHedylcB+E6oTYTHFOjRcJ9mqKpISiuwj0ormAbEHASo9YOkKlzy9zSUKaeU8xtaEA==
X-Received: from wmbay15.prod.google.com ([2002:a05:600c:1e0f:b0:434:ff52:1c7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5886:0:b0:385:faad:bfb9 with SMTP id ffacd0b85a97d-3864ce8644emr6392550f8f.8.1734026802739;
 Thu, 12 Dec 2024 10:06:42 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:21 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-58-smostafa@google.com>
Subject: [RFC PATCH v2 57/58] iommu/arm-smmu-v3-kvm: Implement sg operations
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
X-CRM114-CacheID: sfid-20241212_100644_745589_9F8C8750 
X-CRM114-Status: GOOD (  14.00  )
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

Implement the new map_sg ops which mainly populate the kvm_iommu_sg
and pass it in the hypervisor.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index e987c273ff3c..ac45455b384d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -445,6 +445,96 @@ static phys_addr_t kvm_arm_smmu_iova_to_phys(struct iommu_domain *domain,
 	return kvm_call_hyp_nvhe(__pkvm_host_iommu_iova_to_phys, kvm_smmu_domain->id, iova);
 }
 
+struct kvm_arm_smmu_map_sg {
+	struct iommu_map_cookie_sg cookie;
+	struct kvm_iommu_sg *sg;
+	unsigned int ptr;
+	unsigned long iova;
+	int prot;
+	gfp_t gfp;
+	unsigned int nents;
+};
+
+static struct iommu_map_cookie_sg *kvm_arm_smmu_alloc_cookie_sg(unsigned long iova,
+								int prot,
+								unsigned int nents,
+								gfp_t gfp)
+{
+	int ret;
+	struct kvm_arm_smmu_map_sg *map_sg = kzalloc(sizeof(*map_sg), gfp);
+
+	if (!map_sg)
+		return NULL;
+
+	map_sg->sg = kvm_iommu_sg_alloc(nents, gfp);
+	if (!map_sg->sg)
+		return NULL;
+	map_sg->iova = iova;
+	map_sg->prot = prot;
+	map_sg->gfp = gfp;
+	map_sg->nents = nents;
+	ret = kvm_iommu_share_hyp_sg(map_sg->sg, nents);
+	if (ret) {
+		kvm_iommu_sg_free(map_sg->sg, nents);
+		kfree(map_sg);
+		return NULL;
+	}
+
+	return &map_sg->cookie;
+}
+
+static int kvm_arm_smmu_add_deferred_map_sg(struct iommu_map_cookie_sg *cookie,
+					    phys_addr_t paddr, size_t pgsize, size_t pgcount)
+{
+	struct kvm_arm_smmu_map_sg *map_sg = container_of(cookie, struct kvm_arm_smmu_map_sg,
+							  cookie);
+	struct kvm_iommu_sg *sg = map_sg->sg;
+
+	sg[map_sg->ptr].phys = paddr;
+	sg[map_sg->ptr].pgsize = pgsize;
+	sg[map_sg->ptr].pgcount = pgcount;
+	map_sg->ptr++;
+	return 0;
+}
+
+static int kvm_arm_smmu_consume_deferred_map_sg(struct iommu_map_cookie_sg *cookie)
+{
+	struct kvm_arm_smmu_map_sg *map_sg = container_of(cookie, struct kvm_arm_smmu_map_sg,
+							  cookie);
+	struct kvm_iommu_sg *sg = map_sg->sg;
+	size_t mapped, total_mapped = 0;
+	struct arm_smccc_res res;
+	struct kvm_arm_smmu_domain *kvm_smmu_domain = to_kvm_smmu_domain(map_sg->cookie.domain);
+
+	do {
+		res = kvm_call_hyp_nvhe_smccc(__pkvm_host_iommu_map_sg,
+					      kvm_smmu_domain->id,
+					      map_sg->iova, sg, map_sg->ptr, map_sg->prot);
+		mapped = res.a1;
+		map_sg->iova += mapped;
+		total_mapped += mapped;
+		/* Skip mapped */
+		while (mapped) {
+			if (mapped < (sg->pgsize * sg->pgcount)) {
+				sg->phys += mapped;
+				sg->pgcount -= mapped / sg->pgsize;
+				mapped = 0;
+			} else {
+				mapped -= sg->pgsize * sg->pgcount;
+				sg++;
+				map_sg->ptr--;
+			}
+		}
+
+		kvm_arm_smmu_topup_memcache(&res, map_sg->gfp);
+	} while (map_sg->ptr);
+
+	kvm_iommu_unshare_hyp_sg(sg, map_sg->nents);
+	kvm_iommu_sg_free(sg, map_sg->nents);
+	kfree(map_sg);
+	return 0;
+}
+
 static struct iommu_ops kvm_arm_smmu_ops = {
 	.capable		= kvm_arm_smmu_capable,
 	.device_group		= arm_smmu_device_group,
@@ -463,6 +553,9 @@ static struct iommu_ops kvm_arm_smmu_ops = {
 		.unmap_pages	= kvm_arm_smmu_unmap_pages,
 		.iova_to_phys	= kvm_arm_smmu_iova_to_phys,
 		.set_dev_pasid	= kvm_arm_smmu_set_dev_pasid,
+		.alloc_cookie_sg = kvm_arm_smmu_alloc_cookie_sg,
+		.add_deferred_map_sg = kvm_arm_smmu_add_deferred_map_sg,
+		.consume_deferred_map_sg = kvm_arm_smmu_consume_deferred_map_sg,
 	}
 };
 
-- 
2.47.0.338.g60cca15819-goog


