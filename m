Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463D5CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55AGVVkYakMhSKq7jdoT4Ydc3YlHaQUlYhRGsZGie9E=; b=tntvS7kBc3a2cdIFlGHH0P6b5c
	zWRmH0bF2GMtxqcobfdQs7kTTYkTxM+P02bLiuaFfzr47qdoamaXMINp1rkQfcP9Y6A0A0dPyNCUQ
	q+UajbUNfoyutumn9F4C5Z3bGUayldEpg6W1knZcPylabAvCzZq0iG0rEsRgcOF7zO+Y3BSqeOULM
	dZTEeQXqcGj8/xp+EB4nNoeoFNczqRLkewk00hbLY4L0c7jXXHjIw67zTgGKUfkFtVMX9ULSqni+y
	QDA6PRUwszDE4JKlj7VlyEaxqkbHHhrmw4yaDUlzH3F4zEed9DV/NWkrjEmraftrtQXw6xyCFstJl
	cqkehm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HV-0000000GdjP-0anT;
	Mon, 17 Nov 2025 18:48:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HG-0000000GdT3-3H1u
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=55AGVVkYakMhSKq7jdoT4Ydc3YlHaQUlYhRGsZGie9E=; b=KGwnV9nIWfFnbAQG5aJPcg0THh
	MWg+2jxM/oz3bN923AqIBXcl6BvB+OMxqr7Np/aBw1mdAPM9WapCS6ukx1LH86NLwNG36amkrnaUu
	/opS3q97EN3xbxVZpm9AgtyB/XpN3dpR9bNx6rmis51aOhJIvNEG4MEwcpnZTIp58IT/n8v3j3YQq
	gI3ODk+J64+cVVKGXlCt4N9mWVGc8rTqsquYhOKdH0cZxE3P8aPd+HxvhUFo0AasmoomdRKe4J1rQ
	YMSN0q/16ApimsYmxqk9sQ7NG/zDdgdc3ZcbBHm6vRUC6zFYukqSxgjlhWBsPCXtGGXqGiYlsQj3X
	llO7WWbA==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Pa-00000007wZs-1xf9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:12 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47799717212so19713895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405314; x=1764010114; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=55AGVVkYakMhSKq7jdoT4Ydc3YlHaQUlYhRGsZGie9E=;
        b=1MPDsHfF0XNoFKTkfEIW2HSILbw39pfwn1RwdoweWIQ9P1WxwcB0q55g4ZfwgDX0JT
         ZD5o1giFww3IkU+h7RTRGadeAwUnLlLzDrSpnBPUhyh2o76ZbFOM6guYtsKy21zgabOr
         zmWOz2bVIGrRh70D9yjVVggifXQ4l4imrjJGKMA5f2TG8J5XFXkiT0op5MfFDUlc9oYS
         /tBLIzcxYil8nGK0KdRJpS/XBSuPrsDyG4pDDOuPOfriC+HHmpXRn0+Fd+yn71aqxIQv
         TScBjLpnAmSV0goiLRUx29DqV7hVV8NcvqcQQT/L4QWZdz6c+nVgwgAuiY7IMh1SxxxX
         /Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405314; x=1764010114;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55AGVVkYakMhSKq7jdoT4Ydc3YlHaQUlYhRGsZGie9E=;
        b=KCMfyXxIW80ZK9a8JNlx7bcnR994FJmpggv4YhvARV9gEdPf0KMqPRFxc+wd2hWuim
         EAkdnKkJ09A0/N6BLuzwFmNR+l3rol4+f85yfa9B9nGHQGwtCy8hGeFNQ1X+D23fcbO8
         BVPaCeSBGjXw0Vv4AOJX1Sq+6FJ0LaVhPu6yKIXLUlSLCQCDJpNw6zBDUVGp8dQC1Rpp
         4MM3K3/KugZEbxxhbFykXI26t3zBUkRUGU/2J6FPixZGgQkzbeuoJ+WgV97lwuge+63M
         5BUoSEkOtCBOpuWb6ioQFZdIVtKRIlmH7Zcoiqpg+4B+UEAuTRby097Qyl/Ua9IrkGoi
         G4CA==
X-Gm-Message-State: AOJu0YzFCq7r0pB0BxynxDYN8ujL8dzKdByA2i7FRjR9vJTiW367/5Fn
	qWRyVrNCySx2MEgW97Af+MyLaBHGYwEt2RR3FWSAKDt9JuV4L+7pBhlYVbprLCxMCE+OL+XYkeW
	1d8ifTtbtkvapkQc4RB92ywVPle5vmc9Pc18/Stw6/Z5NiElM7zbZoDmmMSqXIue3ICjMx/BtzS
	mz7VMO9dsFg+7SYvKTjRrfX1fOx9I1k9e/c6GwemTzJX12OmzMijWzJiBH3Eg+Pn3KeQ==
X-Google-Smtp-Source: AGHT+IETdIxY/B60kJGZ2vxQfTV572Z6M9F03+Q3FJ5EaaTwe2O+lpK+vSDpNGyLrCO0Jqd9FsK+JMhkS2KL/g==
X-Received: from wmkz11.prod.google.com ([2002:a7b:c7cb:0:b0:477:98b9:1e26])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:630d:b0:471:1765:839c with SMTP id 5b1f17b1804b1-4778fea2bf7mr111910515e9.20.1763405314472;
 Mon, 17 Nov 2025 10:48:34 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:55 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-9-smostafa@google.com>
Subject: [PATCH v5 08/27] KVM: arm64: iommu: Introduce IOMMU driver infrastructure
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_175310_580126_30311C25 
X-CRM114-Status: GOOD (  20.10  )
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

To establish DMA isolation, KVM needs an IOMMU driver which provide
ops implemented at EL2.

Only one driver can be used and is registered with
kvm_iommu_register_driver() by passing pointer to the ops.

This must be called before module_init() which is the point KVM
initializes.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h       |  5 +++++
 arch/arm64/kvm/Makefile                 |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h | 13 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/Makefile        |  3 ++-
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 18 ++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c         |  5 +++++
 arch/arm64/kvm/iommu.c                  | 15 +++++++++++++++
 7 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 64302c438355..fb2551ba8798 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1652,4 +1652,9 @@ static __always_inline enum fgt_group_id __fgt_reg_to_group_id(enum vcpu_sysreg
 		p;							\
 	})
 
+#ifndef __KVM_NVHE_HYPERVISOR__
+struct kvm_iommu_ops;
+int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops);
+#endif
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 3ebc0570345c..66959c048492 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -24,7 +24,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
-	 vgic/vgic-v5.o
+	 vgic/vgic-v5.o iommu.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
new file mode 100644
index 000000000000..1ac70cc28a9e
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ARM64_KVM_NVHE_IOMMU_H__
+#define __ARM64_KVM_NVHE_IOMMU_H__
+
+#include <asm/kvm_host.h>
+
+struct kvm_iommu_ops {
+	int (*init)(void);
+};
+
+int kvm_iommu_init(void);
+
+#endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index a244ec25f8c5..8210788d6f88 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -24,7 +24,8 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
 
 hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
 	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
-	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
+	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
+	 iommu/iommu.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-y += ../../../kernel/smccc-call.o
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
new file mode 100644
index 000000000000..a01c036c55be
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IOMMU operations for pKVM
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <nvhe/iommu.h>
+
+/* Only one set of ops supported */
+struct kvm_iommu_ops *kvm_iommu_ops;
+
+int kvm_iommu_init(void)
+{
+	if (!kvm_iommu_ops || !kvm_iommu_ops->init)
+		return -ENODEV;
+
+	return kvm_iommu_ops->init();
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index eff76be89329..de79803e7439 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -13,6 +13,7 @@
 #include <nvhe/early_alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/gfp.h>
+#include <nvhe/iommu.h>
 #include <nvhe/memory.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -328,6 +329,10 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	ret = kvm_iommu_init();
+	if (ret)
+		goto out;
+
 	ret = hyp_ffa_init(ffa_proxy_pages);
 	if (ret)
 		goto out;
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
new file mode 100644
index 000000000000..c9041dcb6c57
--- /dev/null
+++ b/arch/arm64/kvm/iommu.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Mostafa Saleh <smostafa@google.com>
+ */
+
+#include <linux/kvm_host.h>
+
+extern struct kvm_iommu_ops *kvm_nvhe_sym(kvm_iommu_ops);
+
+int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
+{
+	kvm_nvhe_sym(kvm_iommu_ops) = hyp_ops;
+	return 0;
+}
-- 
2.52.0.rc1.455.g30608eb744-goog


