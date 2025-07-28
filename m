Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA37C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMj7CyXERBbRhhok3Kl0AYfjJc+Eliaw2DG7Dg7hsI4=; b=xzVwiYW27+Vh8SXwq0/dU6WL49
	WY2D/4qH/df7os2nWo0yWFT66Z6jY3hmyRsoA/ghslpw0hU7PmYgtXMr6gQn7tZExLTraZarCDPUb
	pQNakkPCPxu8ZiDn2ZZaipunzMvQPsVkWwxQ+sfiKu4cVO94x3tkabN85dmy0OODjsYT1HhQOyJNH
	v49dHQ4+bqS9bNW/3VeYgo9LykiCmnRITIJQbVpz8Qxc4WaxCxIsTad38qFOV+S7LZCdmsfRRJQyB
	dBWMt9DYvN7Kq22OpYhySj8lBsJf0/vcHFT+Tnrw6aW2R/sI0Xczg/S/iWGUXHy+g4CEZbLaqw52g
	aBv094Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTil-0000000FHvQ-1RUT;
	Mon, 28 Jul 2025 19:41:15 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2o-0000000F8xa-3OBf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:51 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so22265365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725229; x=1754330029; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMj7CyXERBbRhhok3Kl0AYfjJc+Eliaw2DG7Dg7hsI4=;
        b=VF9kYj0gqmlbrEZr/XSUoCpA2A/22Fqgpg+5smE/oaa7ZVZrrQ+JSEU+EQby5YwcOY
         wHffI6O7t9DjyJVN9EN33AglRvYqgkGFxZQ6+kFi5Y0daCH1KFteJKQFhryxht9fnc+Y
         qnTOOmQ+auPCql24JONiJSnnbN8gKHrc08OnbTszcKke+7tePXgizKh7+PpbEltJuNpd
         wcQX8iipSmqU+cv/ruZT4DNKiRRXTq1F9dH/fPgRCtWLNVugv1C/qJYEvT6O1fAQT0zi
         naHwPUaefghQmasLCTqPM5PNlT56wSWC2yfYfbqQcileZPxiW1WHMAdp9X0qz3nD9phh
         jBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725229; x=1754330029;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMj7CyXERBbRhhok3Kl0AYfjJc+Eliaw2DG7Dg7hsI4=;
        b=iaOefjRzJpKdcnUzglqZ3ZPjk4P8dCBPIC3QT+25WIkWB3zkn9/8gztLcWHLjcYEL4
         FL7ZlYS0w+x9GVEXwKXoiel+gUaHuoq5UZKzQQst+YCred05ySbQEmVgaqgWE+axPnsb
         xbebo5b2bNHfnwVRbwqQ7AdGi1Jw66QL4vxkpjmHtKejJBFQsZbCP/soHk8/o6bEdy03
         pgg0nqDiYSc0zQmOqgxDWvpS3/vDwIlnaoLbxjU4uNzUfoHUIBYGR5TE7trxZ/usAVRM
         Jb1ypuI1HCF8hFjwLrtS7f5/X4dIrpfskbhOR6z+dD+NsCQKcllZnMg6SiQo/gOrBNik
         AMlw==
X-Forwarded-Encrypted: i=1; AJvYcCXIgtZc2MwggLPt8fi+NE5JkgGaFIbowhr+A45KU4WMHgQB7UhjNDKJ+TQllt+z73zcy0DT+7TCAfnO+JrOk7np@lists.infradead.org
X-Gm-Message-State: AOJu0YzyvsB+TK5HJ5MRlsbThn+zjIIDP5oUV5E+eBJjTnYynjZTxMU5
	j/jJi74ko6YqQ4+dKt1ofBiI0yKap7Pyvj9AnVJ9Z95DElxcQEVSSbWJ9o376I9K+lnAHrw8x6r
	ZMPwdd3kD8jlwoQ==
X-Google-Smtp-Source: AGHT+IHGBEMNWMKylKuu/FAAD8mciBjhdEaRLqrqR0Cf/8KRjBl1KjBNnc9kjb20/qxDpGrYsboTcaiSOpQbJA==
X-Received: from wmbdv17.prod.google.com ([2002:a05:600c:6211:b0:442:ea0c:c453])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1992:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-45876554f82mr88636195e9.23.1753725229065;
 Mon, 28 Jul 2025 10:53:49 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:06 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-20-smostafa@google.com>
Subject: [PATCH v3 19/29] iommu/arm-smmu-v3-kvm: Initialize registers
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105350_850520_8F1413D8 
X-CRM114-Status: GOOD (  21.35  )
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

Ensure all writable registers are properly initialized. We do not touch
registers that will not be read by the SMMU due to disabled features.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 149 +++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  12 ++
 2 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 2f43804e08e0..e9bc35e019b6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -7,15 +7,162 @@
 #include <asm/kvm_hyp.h>
 
 #include <nvhe/iommu.h>
+#include <nvhe/mem_protect.h>
 
 #include "arm_smmu_v3.h"
 
+#define ARM_SMMU_POLL_TIMEOUT_US	100000 /* 100ms arbitrary timeout */
+
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
+#define for_each_smmu(smmu) \
+	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
+	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
+	     (smmu)++)
+
+/*
+ * Wait until @cond is true.
+ * Return 0 on success, or -ETIMEDOUT
+ */
+#define smmu_wait(_cond)					\
+({								\
+	int __ret = 0;						\
+	u64 delay = pkvm_time_get() + ARM_SMMU_POLL_TIMEOUT_US;	\
+								\
+	while (!(_cond)) {					\
+		if (pkvm_time_get() >= delay) {			\
+			__ret = -ETIMEDOUT;			\
+			break;					\
+		}						\
+	}							\
+	__ret;							\
+})
+
+static int smmu_write_cr0(struct hyp_arm_smmu_v3_device *smmu, u32 val)
+{
+	writel_relaxed(val, smmu->base + ARM_SMMU_CR0);
+	return smmu_wait(readl_relaxed(smmu->base + ARM_SMMU_CR0ACK) == val);
+}
+
+/* Transfer ownership of structures from host to hyp */
+static int smmu_take_pages(u64 phys, size_t size)
+{
+	WARN_ON(!PAGE_ALIGNED(phys) || !PAGE_ALIGNED(size));
+	return __pkvm_host_donate_hyp(phys >> PAGE_SHIFT, size >> PAGE_SHIFT);
+}
+
+static void smmu_reclaim_pages(u64 phys, size_t size)
+{
+	WARN_ON(!PAGE_ALIGNED(phys) || !PAGE_ALIGNED(size));
+	WARN_ON(__pkvm_hyp_donate_host(phys >> PAGE_SHIFT, size >> PAGE_SHIFT));
+}
+
+static int smmu_init_registers(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u64 val, old;
+	int ret;
+
+	if (!(readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_ABORT))
+		return -EINVAL;
+
+	/* Initialize all RW registers that will be read by the SMMU */
+	ret = smmu_write_cr0(smmu, 0);
+	if (ret)
+		return ret;
+
+	val = FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
+	      FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
+	      FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
+	      FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
+	      FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
+	      FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB);
+	writel_relaxed(val, smmu->base + ARM_SMMU_CR1);
+	writel_relaxed(CR2_PTM, smmu->base + ARM_SMMU_CR2);
+	writel_relaxed(0, smmu->base + ARM_SMMU_IRQ_CTRL);
+
+	val = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
+	old = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
+	/* Service Failure Mode is fatal */
+	if ((val ^ old) & GERROR_SFM_ERR)
+		return -EIO;
+	/* Clear pending errors */
+	writel_relaxed(val, smmu->base + ARM_SMMU_GERRORN);
+
+	return 0;
+}
+
+/* Put the device in a state that can be probed by the host driver. */
+static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int i;
+	size_t nr_pages = smmu->mmio_size >> PAGE_SHIFT;
+
+	for (i = 0 ; i < nr_pages ; ++i) {
+		u64 pfn = (smmu->mmio_addr >> PAGE_SHIFT) + i;
+
+		WARN_ON(__pkvm_hyp_donate_host_mmio(pfn));
+	}
+}
+
+static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int i;
+	size_t nr_pages;
+	int ret;
+
+	if (!PAGE_ALIGNED(smmu->mmio_addr | smmu->mmio_size))
+		return -EINVAL;
+
+	nr_pages = smmu->mmio_size >> PAGE_SHIFT;
+	for (i = 0 ; i < nr_pages ; ++i) {
+		u64 pfn = (smmu->mmio_addr >> PAGE_SHIFT) + i;
+
+		/*
+		 * This should never happen, so it's fine to be strict to avoid
+		 * complicated error handling.
+		 */
+		WARN_ON(__pkvm_host_donate_hyp_mmio(pfn));
+	}
+	smmu->base = hyp_phys_to_virt(smmu->mmio_addr);
+
+	ret = smmu_init_registers(smmu);
+	if (ret)
+		goto out_err;
+	return ret;
+
+out_err:
+	smmu_deinit_device(smmu);
+	return ret;
+}
+
 static int smmu_init(void)
 {
-	return -ENOSYS;
+	int ret;
+	struct hyp_arm_smmu_v3_device *smmu;
+	size_t smmu_arr_size = PAGE_ALIGN(sizeof(*kvm_hyp_arm_smmu_v3_smmus) *
+					  kvm_hyp_arm_smmu_v3_count);
+	phys_addr_t smmu_arr_phys;
+
+	kvm_hyp_arm_smmu_v3_smmus = kern_hyp_va(kvm_hyp_arm_smmu_v3_smmus);
+	smmu_arr_phys = hyp_virt_to_phys(kvm_hyp_arm_smmu_v3_smmus);
+
+	ret = smmu_take_pages(smmu_arr_phys, smmu_arr_size);
+	if (ret)
+		return ret;
+
+	for_each_smmu(smmu) {
+		ret = smmu_init_device(smmu);
+		if (ret)
+			goto out_reclaim_smmu;
+	}
+
+	return 0;
+out_reclaim_smmu:
+	while (smmu != kvm_hyp_arm_smmu_v3_smmus)
+		smmu_deinit_device(--smmu);
+	smmu_reclaim_pages(smmu_arr_phys, smmu_arr_size);
+	return ret;
 }
 
 /* Shared with the kernel driver in EL1 */
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index f6ad91d3fb85..9b1d021ada63 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -4,7 +4,19 @@
 
 #include <asm/kvm_asm.h>
 
+#include "../arm-smmu-v3-common.h"
+
+/*
+ * Parameters from the trusted host:
+ * @mmio_addr		base address of the SMMU registers
+ * @mmio_size		size of the registers resource
+ * @base		Virtual address of SMMU registers
+ * Other members are filled and used at runtime by the SMMU driver.
+ */
 struct hyp_arm_smmu_v3_device {
+	phys_addr_t		mmio_addr;
+	size_t			mmio_size;
+	void __iomem		*base;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.50.1.552.g942d659e1b-goog


