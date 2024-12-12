Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89757E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4ydbokuahZg3cDVv89OzbKDX3WmaOYi25/RZtMZGlA=; b=dWWWlQiY8Vipy9Gpz1IZh3Ifi3
	3jLva1bb8Zqc8lbHl8YhDDQLn1JYB1IMpLehdZvELaIP05MRjGdNwYEU0AkbIXqo6FV93B+uehJNi
	a4QxESNieZJVOzITFbngP8nUvdh+hvRT1bSxZI1qQ3mV7TqsQTS1BJ+j8CwfQJzASOlriJFAMcWZn
	R/Pl7F5KZa5CO2CtqoMNBZKT+r47IvZN0eO1V49Gp0eH3M0JC4eyBeor4xyqvUpAWQWa2qmKpw9w6
	8yaJqjxg0xw5qO1GTMPXu1DhmNJfzxY0TkPwOK8bRPmA215dAPkpEL0KSOHIA9bOdSHEdCHL2g/Ev
	vNTYEqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoNp-00000001XHO-3Sbt;
	Thu, 12 Dec 2024 18:57:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZx-00000001K5x-3Jze
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:26 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434fb9646efso8355115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026784; x=1734631584; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o4ydbokuahZg3cDVv89OzbKDX3WmaOYi25/RZtMZGlA=;
        b=jmv3I2PJ/Jbx5bb9rsnTSiGvOmrlEoy6S2X/0TOh5t6r6gRhLcIr+rWotHs9Lc2mtB
         X9fRNnHy7TZKiF0aQ0M29GdFXYC+HjMBOGkdD93/MbEeHogXKsJAWvkrnowbcWEbgxNb
         qSDwxNkgHJeSZE+DDKe7oCvnEXCl5Nc8HwKoig8M2gUnRIpBfvrtYzrqCOUACNeiHp98
         s5/I7rDrm0P6uhcHgA08gee/Q9qhZNVLlchuKlS2e4ksCtKJG1gzDEiWd9zWy0yye+pj
         fqVhgLcG8Fi3VFvOwASWSdjG7g38Mq+wwFAZI7aNyrvC3P2E6UfL00HCR1OjC18Dc9uG
         sw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026784; x=1734631584;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4ydbokuahZg3cDVv89OzbKDX3WmaOYi25/RZtMZGlA=;
        b=b/QrM+xtR362MF511rZZZvXlqYtCRdJngE4WXGJ26yC+ON7hbg6lnxdUkzwNPSH9Gc
         PluxVoityEsEUGNjqXsr0RRh1kgxRktxzCfHtQRwk+FGo5vaS1LfSg5UXKLjT0gJ5+Hj
         +O+bC/9x4ffqXiojpEcE2Y8obwFc0BxiB0K743y7PEyJuypekBwpsSHA0shCRI68lOyO
         lfMq5QVwjnZ3Wnz4pKs0K+BGUJQEoygNIHKrCB27F2MeYDKyGcZ7CNxO2XOaf7j8VMUv
         gnhh/8FO1/CAEAvKvhsSqCmoGmQFphgaRt1bttRF2iYXuzi5a7onQQsteoRtRx68rvYJ
         s/aA==
X-Forwarded-Encrypted: i=1; AJvYcCVfgD71naut9ECa4iDHZra3/0cugqbedCJQ3iHpy6aL3Fy1CErXBczWzOIjRkPchRqx7hM1x/Wq2Nk5c2vjoGTI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7y0qWdpwk9mOCoeopQoKDj4tkx9qXwfh0kxnT7dXwh8vzTKLd
	wzNfYFrTeYIhAiCBJwdrGfZp88T3X9F7nDMil/C9ZymjzBrSkvkFNjrPzhSo3eyvx4+QLVWV6Js
	1kuQZnMVlgg==
X-Google-Smtp-Source: AGHT+IFIxg+lr22IOTf3dy5thifj/3GcNWa+J/d4+646pOPogroeM/O6SnmhU5jaKgRShKweTmltoDzKqk0iIg==
X-Received: from wmph6.prod.google.com ([2002:a05:600c:4986:b0:434:e96f:86b0])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c9:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-4361c42e361mr77955515e9.31.1734026784111;
 Thu, 12 Dec 2024 10:06:24 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:12 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-49-smostafa@google.com>
Subject: [RFC PATCH v2 48/58] iommu/arm-smmu-v3-kvm: Add function to topup
 IOMMU allocator
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
X-CRM114-CacheID: sfid-20241212_100625_841987_20B39120 
X-CRM114-Status: GOOD (  14.52  )
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

The hypervisor returns requests for memory allocation in HVCs
encoded in the return registers.

Add a function that checks those returns and topup the IOMMU
alloctor in response to requests, and a macro that calls
this function around calling an HVC.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index e4a5bdc830bc..dab2d59b5a88 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2022 Linaro Ltd.
  */
+#include <asm/kvm_pkvm.h>
 #include <asm/kvm_mmu.h>
 
 #include <linux/of_platform.h>
@@ -28,6 +29,45 @@ static size_t				kvm_arm_smmu_cur;
 static size_t				kvm_arm_smmu_count;
 static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
 
+static int kvm_arm_smmu_topup_memcache(struct arm_smccc_res *res, gfp_t gfp)
+{
+	struct kvm_hyp_req req;
+
+	hyp_reqs_smccc_decode(res, &req);
+
+	if ((res->a1 == -ENOMEM) && (req.type != KVM_HYP_REQ_TYPE_MEM)) {
+		/*
+		 * There is no way for drivers to populate hyp_alloc requests,
+		 * so -ENOMEM + no request indicates that.
+		 */
+		return __pkvm_topup_hyp_alloc(1);
+	} else if (req.type != KVM_HYP_REQ_TYPE_MEM) {
+		return -EBADE;
+	}
+
+	if (req.mem.dest == REQ_MEM_DEST_HYP_IOMMU) {
+		return __pkvm_topup_hyp_alloc_mgt_gfp(HYP_ALLOC_MGT_IOMMU_ID,
+						      req.mem.nr_pages,
+						      req.mem.sz_alloc,
+						      gfp);
+	} else if (req.mem.dest == REQ_MEM_DEST_HYP_ALLOC) {
+		/* Fill hyp alloc*/
+		return __pkvm_topup_hyp_alloc(req.mem.nr_pages);
+	}
+
+	pr_err("Bogus mem request");
+	return -EBADE;
+}
+
+#define kvm_call_hyp_nvhe_mc(...)					\
+({									\
+	struct arm_smccc_res __res;					\
+	do {								\
+		__res = kvm_call_hyp_nvhe_smccc(__VA_ARGS__);		\
+	} while (__res.a1 && !kvm_arm_smmu_topup_memcache(&__res, GFP_KERNEL));\
+	__res.a1;							\
+})
+
 static bool kvm_arm_smmu_validate_features(struct arm_smmu_device *smmu)
 {
 	unsigned int required_features =
-- 
2.47.0.338.g60cca15819-goog


