Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02F8CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBsLyy3u3rOhplnfl3DMV6GQeOwFjCQ0fFDaMLqFvas=; b=32kX0qJL1IMnpH6/ymxaIcBFOv
	pUUrYkSbZZxFQqyPo9FKBmqY2ylSWh2FY4eoM0xWl3jVTlr0ZduyWXBdefK2Ctn4X448S38Qujez9
	wSoK9QxZbpgjxjbSQ8O3LocRDKr4cMPTJkbq0hPmGnH51V8x6aioToTlGdjT1VcUo/DewbcHk9AaM
	pj47Gq1i6WM74zTfiKBqivnt8dgVa7N/H2nKosM87Q4rwc2nA7apB0zp4RNnu4zJabHXSbkBxLZCj
	Ltjbm8H3pfurJUsOJMehi1mDFtvHjKHde4teckgvhBsDSpFDLyxt3ryfdCooD6fz5ESpH7DiYe8Mb
	R4qZu8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWGy-0000000BuoZ-2ggB;
	Wed, 20 Aug 2025 00:01:48 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUFx-0000000BfRs-2BRX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:38 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b9dc566cb4so3206715f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640355; x=1756245155; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBsLyy3u3rOhplnfl3DMV6GQeOwFjCQ0fFDaMLqFvas=;
        b=vGnTT76LfIDzkVLtT/KFAGHZPNxb6E8RxXkvOqe/4vVnyvIu2mCmBNJldhtG71K0Jw
         6MC54zIiIHbOcggvIUfHcsDrPgAfKmS+A1u8/DTUS5OZno/6rGexthGc69MZZnYeqKjY
         UeCixADiSlhsN+vuVqfhG74vcc1MsukBLhQGbbMosBygwszV8jyiANNHYtfVO666kSbx
         8Sfjuqrk+xbyoUcGjJ3E8lzLBRTYJ0gboibsqQMG1cx8DH8EomVKqUO/pqvwG2SxYd6G
         kPJi5b1Gb5fncDfjJucPgVTNrnmfXFmXqP9Yl0BYTqAUdDwWNjzbb57OAWgY/uUSO7YN
         gK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640355; x=1756245155;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBsLyy3u3rOhplnfl3DMV6GQeOwFjCQ0fFDaMLqFvas=;
        b=JLujrSwVhMzQil9CZk+nhyWS48rpxCvkAIEZN0WNX/Jhr1GOB4frwSaPtjxPxRFM+n
         O0JxWOo31pRzBjdJztWZ/CtwaqXgTJqcxGkgUfHOsZNCvdnNcFAPzLS0HsUrqWukk1NQ
         TgieHj28UNHKDG9DZnfwL/QgeN9mmDFy57GMxI0JoMJKCd0cOv9DxAAPc51sONqFqu+p
         vr2T2inMlxN08Zz4++m8X3Eh0LQFvC5JlNF5ibA8IWb29eJiRWsOsOzFdHQxgA6LfNjC
         D0gUGVrmHF4NT/PupQXyPTVenYRN4NO5ucHjDO07Bonmo7Rwy/2v8hMU9VhHLzYYxBvC
         jpEw==
X-Forwarded-Encrypted: i=1; AJvYcCX+kwjc7pvss/v4NTEWxHab08cd37UF6w0nWDig2FFFr2EfE4KwgTdiJs5SfY4xb4IAdrRwiU1moXrErfX/J7n6@lists.infradead.org
X-Gm-Message-State: AOJu0YwliCaVzl1z8SbdjMcXu0frbE4k+/vjSnC0t0okeYZkN2Ot88zl
	PUs8e+6TKVQeygUMCXJliQZUtyeLqdMEtkNn9/vPWJqBI71ghZA6N2bTkmeExT2Vdo/nRkZuMpe
	F4ItUPeyZ5XUTMQ==
X-Google-Smtp-Source: AGHT+IGi+MrTYS9vOAkhE2MwbT5in2zuzEYUdbygOz38UpjYqK2AvcuVjizybf9/jK1Tu7dGcGgyI44X4YgECw==
X-Received: from wmsr19.prod.google.com ([2002:a05:600c:8b13:b0:459:8c48:6c34])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:22c4:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3c32eeb8077mr359066f8f.54.1755640355498;
 Tue, 19 Aug 2025 14:52:35 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:40 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-13-smostafa@google.com>
Subject: [PATCH v4 12/28] KVM: arm64: iommu: Support DABT for IOMMU
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
X-CRM114-CacheID: sfid-20250819_145237_558551_61E5F21C 
X-CRM114-Status: GOOD (  16.97  )
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

SMMUv3 driver need to trap and emulate access to the MMIO space as
part of the nested implementation.

Add a handler for DABTs for IOMMU drivers to be able to do so, in
case the host fault in page, check if it's part of IOMMU emulation
first.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_arm.h        |  2 ++
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  3 ++-
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 15 +++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   | 10 ++++++++++
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 1da290aeedce..8d63308ccd5c 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -331,6 +331,8 @@
 
 /* Hyp Prefetch Fault Address Register (HPFAR/HDFAR) */
 #define HPFAR_MASK	(~UL(0xf))
+
+#define FAR_MASK GENMASK_ULL(11, 0)
 /*
  * We have
  *	PAR	[PA_Shift - 1	: 12] = PA	[PA_Shift - 1 : 12]
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 9f4906c6dcc9..10fe4fbf7424 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -8,6 +8,7 @@
 struct kvm_iommu_ops {
 	int (*init)(void);
 	void (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
+	bool (*dabt_handler)(struct user_pt_regs *regs, u64 esr, u64 addr);
 };
 
 int kvm_iommu_init(void *pool_base, size_t nr_pages);
@@ -16,5 +17,5 @@ void kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 				 enum kvm_pgtable_prot prot);
 void *kvm_iommu_donate_pages(u8 order);
 void kvm_iommu_reclaim_pages(void *ptr);
-
+bool kvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr);
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index 1673165c7330..376b30f557a2 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -4,6 +4,10 @@
  *
  * Copyright (C) 2022 Linaro Ltd.
  */
+#include <asm/kvm_hyp.h>
+
+#include <hyp/adjust_pc.h>
+
 #include <linux/iommu.h>
 
 #include <nvhe/iommu.h>
@@ -113,3 +117,14 @@ void kvm_iommu_reclaim_pages(void *ptr)
 {
 	hyp_put_page(&iommu_pages_pool, ptr);
 }
+
+bool kvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
+{
+	if (kvm_iommu_ops && kvm_iommu_ops->dabt_handler &&
+	    kvm_iommu_ops->dabt_handler(regs, esr, addr)) {
+		/* DABT handled by the driver, skip to next instruction. */
+		kvm_skip_host_instr();
+		return true;
+	}
+	return false;
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index bce6690f29c0..7371b2183e1e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -595,6 +595,11 @@ static int host_stage2_idmap(u64 addr)
 	return ret;
 }
 
+static bool is_dabt(u64 esr)
+{
+	return ESR_ELx_EC(esr) == ESR_ELx_EC_DABT_LOW;
+}
+
 void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 {
 	struct kvm_vcpu_fault_info fault;
@@ -617,6 +622,11 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	 */
 	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
 	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
+	addr |= fault.far_el2 & FAR_MASK;
+
+	if (is_dabt(esr) && !addr_is_memory(addr) &&
+	    kvm_iommu_host_dabt_handler(&host_ctxt->regs, esr, addr))
+		return;
 
 	ret = host_stage2_idmap(addr);
 	BUG_ON(ret && ret != -EAGAIN);
-- 
2.51.0.rc1.167.g924127e9c0-goog


