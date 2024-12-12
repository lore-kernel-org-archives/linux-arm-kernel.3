Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CA8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNmbzxfQZlpDuPsHWgM61suzSUM5uzL/JDk4UedkmbE=; b=ai5TgR1mOKo6iY+up8FqY3wAFd
	r0HJfYXNeuGdQpfd4u82h2BaWgP7iw+FlBNjSl+DALZzN0H/xIP6sNH2RpW1ikRGf3qeiQw+4Ovdw
	wlcJPMChl1bogtQ8i0OXWA5GgvLIAnxglXqr3TYPKdgbQrkK+lFBkCvisXRalfYbapO3ie+Bjq2yh
	dIzjZEY1UVYkvqQzhKXSEOW4h69hFYDgj7EC+rqmIf7dos9pWp7KtuDO95LqO6fzfRGkrJbmDgPIp
	cQjLIGst/6NacSnt5QA3lJs10CAw6Uas3TiVxyN2vEJ2ZwSIJG0isIszQjmefui9aPEYolRfFprrh
	SK3dsekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnxf-00000001QfP-0uzk;
	Thu, 12 Dec 2024 18:30:55 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZ7-00000001JmO-2JYQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:35 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-385e1fd40acso549703f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026732; x=1734631532; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iNmbzxfQZlpDuPsHWgM61suzSUM5uzL/JDk4UedkmbE=;
        b=Hmd9BDzneXBQd8w1rqQyOyTKhzc98rbnmcAkEqzIKvJwOgO7Ma4rBem0kvMeu1zCfC
         m9hTqIajhMlfjFtKTdPfpWaR9kUSz2on+KxsuzbiG1ETQvPx40mHmOfhMKewcvqwEh9u
         AU3hKmKJFor1X5t56dVBxUMMvTirqbcOwsffR6Ri3ZyAs0lDHA2yCTECTZyCFfRyed4w
         bBIKYuy6jPtCUl5cyVuU9R6PT6pIaQQppCi0A23Y4LoS/NWfFkmx/pxDy1xBnvVVZPg2
         iU+MSeKOsICVVU4mi4shqw7fO+AY/rLWOSdgywUdW15E3ZG4xW1tayn/BHP3tBkcOTax
         8wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026732; x=1734631532;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNmbzxfQZlpDuPsHWgM61suzSUM5uzL/JDk4UedkmbE=;
        b=rVAzmEiZqGypiI7LKErRiKm16Demuqy6XrZOCDn2NBllvnqF3/L6th83VLJsCN3Pe/
         Ro7NMkwT4XcomhCDd2X6fX8Z77jwdbUgIwR3ZelZ5MplEOZTYysf+YNS5ks2iL2FjQS7
         ZFdW/Uw257M0bXbfuzHgC3SQAWl7UnJhaL93kG0R5YwtWUV5DsHO3M5tiLEBbUqaFQUJ
         dQWtBZGCF1yAUEVmtAO54kngPcK9xton57tx0vZBxO9XQUKpX9BG84DcFd8shQPp7TLw
         Vy0YkSVvhVcYLP1gNmJcg7PM2dYytgWUZfwjAhdszqtnFZSewWkZ4qdtX3SLwiETApFZ
         Bz8w==
X-Forwarded-Encrypted: i=1; AJvYcCXML9P4ChcK8FoNmRPSIDClPbjNBC8FWDhSyWmH28t5nOaR8vPkzn/bwHF1sVqPBY/sPodkJ6FkA/irRLwE1jfD@lists.infradead.org
X-Gm-Message-State: AOJu0YyW5Xb5Mvomu5Xy1mVWQswg/CtoHD82+g9q7igPtgUgKveepDsd
	LRGJFvmNE84pbMlsz8oety9VcyVhNy+j8sCmdA5dhM6pRvHZ/K6FV5SFvxXpe72Me3V61cBNVZ7
	gfj0hAHKL5w==
X-Google-Smtp-Source: AGHT+IG5u7MltLTltlnPqAoPYJ0zedPyLXzvE96q5dJmxhMlV9Kb2g6bQvckMYIYAkBMBY1CEWyusiJQB7JM4g==
X-Received: from wmnb15.prod.google.com ([2002:a05:600c:6cf:b0:436:1995:1888])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2802:b0:385:df6d:6fc7 with SMTP id ffacd0b85a97d-3864ce9f30amr4398431f8f.25.1734026731871;
 Thu, 12 Dec 2024 10:05:31 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:47 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-24-smostafa@google.com>
Subject: [RFC PATCH v2 23/58] KVM: arm64: iommu: Support power management
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
X-CRM114-CacheID: sfid-20241212_100533_599198_B4C16DF8 
X-CRM114-Status: GOOD (  16.82  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add power domain ops to the hypervisor IOMMU driver. We currently make
these assumptions:

* The register state is retained across power off.
* The TLBs are clean on power on.
* Another privileged software (EL3 or SCP FW) handles dependencies
  between SMMU and endpoints.

So we just need to make sure that the CPU does not touch the SMMU
registers while it is powered off.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c | 33 ++++++++++++++++++++++++++-
 include/kvm/iommu.h                   |  3 +++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index a6e0f3634756..fbab335d3490 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -375,10 +375,41 @@ phys_addr_t kvm_iommu_iova_to_phys(pkvm_handle_t domain_id, unsigned long iova)
 	return phys;
 }
 
+static int iommu_power_on(struct kvm_power_domain *pd)
+{
+	struct kvm_hyp_iommu *iommu = container_of(pd, struct kvm_hyp_iommu,
+						   power_domain);
+
+	/*
+	 * We currently assume that the device retains its architectural state
+	 * across power off, hence no save/restore.
+	 */
+	kvm_iommu_lock(iommu);
+	iommu->power_is_off = false;
+	kvm_iommu_unlock(iommu);
+	return 0;
+}
+
+static int iommu_power_off(struct kvm_power_domain *pd)
+{
+	struct kvm_hyp_iommu *iommu = container_of(pd, struct kvm_hyp_iommu,
+						   power_domain);
+
+	kvm_iommu_lock(iommu);
+	iommu->power_is_off = true;
+	kvm_iommu_unlock(iommu);
+	return 0;
+}
+
+static const struct kvm_power_domain_ops iommu_power_ops = {
+	.power_on	= iommu_power_on,
+	.power_off	= iommu_power_off,
+};
+
 /* Must be called from the IOMMU driver per IOMMU */
 int kvm_iommu_init_device(struct kvm_hyp_iommu *iommu)
 {
 	kvm_iommu_lock_init(iommu);
 
-	return 0;
+	return pkvm_init_power_domain(&iommu->power_domain, &iommu_power_ops);
 }
diff --git a/include/kvm/iommu.h b/include/kvm/iommu.h
index 6ff78d766466..c524ba84a9cf 100644
--- a/include/kvm/iommu.h
+++ b/include/kvm/iommu.h
@@ -3,6 +3,7 @@
 #define __KVM_IOMMU_H
 
 #include <asm/kvm_host.h>
+#include <kvm/power_domain.h>
 #include <linux/io-pgtable.h>
 #ifdef __KVM_NVHE_HYPERVISOR__
 #include <nvhe/spinlock.h>
@@ -51,6 +52,8 @@ struct kvm_hyp_iommu {
 #else
 	u32				unused;
 #endif
+	struct kvm_power_domain		power_domain;
+	bool				power_is_off;
 };
 
 #endif /* __KVM_IOMMU_H */
-- 
2.47.0.338.g60cca15819-goog


