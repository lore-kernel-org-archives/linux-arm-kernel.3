Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15010FD2D6F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToBQfETgLJjiDxh0mdZ0jWyVKcLeeqGXYElZ0/3fbdc=; b=cQl/QYESSutP48l95Kls5b0TKD
	0W0/5aM9/O5bJCDnbtlfEWg5R0DsYYuanCd8TaWpNxFt66/zFT8l6w9Bi2Z3Co8+kLck4uqG/C3sX
	fwatwb2UTPNGKDp7ke11FPJGWHY4o/TL94tgGpTqGuF1Dsrz7h0Y7s2T94HFrisEBBZQKvbGG5GDK
	iobblB1gp1ijuHBwsRvd6NM7VWslpGAqUvzNzmxe3XBc+5UmVDDM8KM5EjGbCYoIPqnOxVs0UqFpd
	4+l1+tXl+cGoh8Q/PGV3sKH6gNCpmNheFJ1xWAjKwIgFTX522EtKBy6V5ldnQQI8Zgx9EAJESP/ER
	/gjVl5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwX4-00000009W7u-3kQJ;
	Tue, 10 Mar 2026 12:49:54 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwWy-00000009W3E-0zmH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:49:49 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-439c794ec8eso7132690f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146986; x=1773751786; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ToBQfETgLJjiDxh0mdZ0jWyVKcLeeqGXYElZ0/3fbdc=;
        b=DFdU5BoVqwzPaW8bWYg8YZ5jeYNC23Dcf2vegu64ZHi5SAvAVuHbEb0490DC0G1dkK
         Tnda268J5Ndl3W6fb6tRUFi7pF/GMN8pUhLUWgk8yIxJyLVcDgJPvCYSUBQRTxkRTKbq
         yBfOTqWx5OE2h1kdENiPGugt5uihJ1nh82SfOLahF4oiE9YWUYdt3cpWouiP6TECj8rH
         AAUyOy6ZN9CROpFg1cYnIB6vlQ1r/kmy3CvqrnMvX5AoLSRllmAAYV7jyNE/2hiUpQFB
         nMWVGCV+QOPEupAzN8OiNpKKOfuBUt8maBg9VyQcjp14ULM5YcvkJwfNtdSTBpOTuVHk
         E3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146986; x=1773751786;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ToBQfETgLJjiDxh0mdZ0jWyVKcLeeqGXYElZ0/3fbdc=;
        b=hnEab24yxou0d6CY2Rno0VOCAGQO8KVjf7m+lj7PhY6vfYiFbSS68ST5hYafBRED2D
         KEn4YpUTSBbkqfumlKtgWcLKXI3H3Fdz8CGhUFqg/EgZjiv4pUKSTzczVgTeK6M709CP
         SvHLbwNUKTwuFTxlasKVeNMb2CO7ywNARIjQUTyVjZ6QH7POUL+msePS6926MS7ANTsx
         2LesoYpflUkYsQuFuAOj7t27cqcW0VphbLNXDBkrOS3HCMRN3h5XOVLHTZ/o+CzUcfb6
         RIubrcze6R7gg0XkJxZsq5bXQTrAVv0dnt9+AkNAs1vb6Hj4EKotQqeUvlkM1tTvTeQo
         chtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDdVIZBcQjlc/A0p83C9vyVLnBCsyEAudraIqd12cENVzgli3hVkOY3X5q8i5Va78oGsjES/FgcIjE2I+H1+cg@lists.infradead.org
X-Gm-Message-State: AOJu0YxfDTAD8ypb1AqkZdFTmIe63ljTHoY7/lHwLUOL+TNs1zfqRFc8
	fVttVa1my8PBL875Lt7TL+HRCcNuYulSFvGjTbhprzqZ6G8D2jcKKoybrjzwe43eFa+rNUddZ/N
	0pb9ZjaSRnueo/3ApmzUanVcD95uSBg==
X-Received: from wrdf12.prod.google.com ([2002:a5d:58ec:0:b0:439:b20b:f16a])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2285:b0:439:ba69:101d with SMTP id ffacd0b85a97d-439da354ccbmr25716640f8f.1.1773146985467;
 Tue, 10 Mar 2026 05:49:45 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:22 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-4-sebastianene@google.com>
Subject: [PATCH 03/14] KVM: arm64: Support host MMIO trap handlers for
 unmapped devices
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054948_314695_52313F8A 
X-CRM114-Status: GOOD (  17.56  )
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

Introduce a mechanism to register callbacks for MMIO accesses to regions
unmapped from the host Stage-2 page tables.

This infrastructure allows the hypervisor to intercept host accesses to
protected or emulated devices. When a Stage-2 fault occurs on a
registered device region, the hypervisor will invoke the associated
callback to emulate the access.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/include/asm/kvm_arm.h      |  3 ++
 arch/arm64/include/asm/kvm_pkvm.h     |  6 ++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 41 +++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c       |  3 ++
 4 files changed, 53 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 3f9233b5a130..8fe1e80ab3f4 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -304,6 +304,9 @@
 
 /* Hyp Prefetch Fault Address Register (HPFAR/HDFAR) */
 #define HPFAR_MASK	(~UL(0xf))
+
+#define FAR_MASK	GENMASK_ULL(11, 0)
+
 /*
  * We have
  *	PAR	[PA_Shift - 1	: 12] = PA	[PA_Shift - 1 : 12]
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 48ec7d519399..5321ced2f50a 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -19,9 +19,15 @@
 
 #define PKVM_PROTECTED_REGS_NUM	8
 
+struct pkvm_protected_reg;
+
+typedef void (pkvm_emulate_handler)(struct pkvm_protected_reg *region, u64 offset, bool write,
+				    u64 *reg, u8 reg_size);
+
 struct pkvm_protected_reg {
 	u64 start_pfn;
 	size_t num_pages;
+	pkvm_emulate_handler *cb;
 };
 
 extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 7c125836b533..f405d2fbd88f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -13,6 +13,7 @@
 #include <asm/stage2_pgtable.h>
 
 #include <hyp/fault.h>
+#include <hyp/adjust_pc.h>
 
 #include <nvhe/gfp.h>
 #include <nvhe/memory.h>
@@ -608,6 +609,41 @@ static int host_stage2_idmap(u64 addr)
 	return ret;
 }
 
+static bool handle_host_mmio_trap(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
+{
+	u64 offset, reg_value = 0, start, end;
+	u8 reg_size, reg_index;
+	bool write;
+	int i;
+
+	for (i = 0; i < num_protected_reg; i++) {
+		start = pkvm_protected_regs[i].start_pfn << PAGE_SHIFT;
+		end = start + (pkvm_protected_regs[i].num_pages << PAGE_SHIFT);
+
+		if (start > addr || addr > end)
+			continue;
+
+		reg_size = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
+		reg_index = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
+		write = (esr & ESR_ELx_WNR) == ESR_ELx_WNR;
+		offset = addr - start;
+
+		if (write)
+			reg_value = host_ctxt->regs.regs[reg_index];
+
+		pkvm_protected_regs[i].cb(&pkvm_protected_regs[i], offset, write,
+					  &reg_value, reg_size);
+
+		if (!write)
+			host_ctxt->regs.regs[reg_index] = reg_value;
+
+		kvm_skip_host_instr();
+		return true;
+	}
+
+	return false;
+}
+
 void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 {
 	struct kvm_vcpu_fault_info fault;
@@ -630,6 +666,11 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	 */
 	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
 	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
+	addr |= fault.far_el2 & FAR_MASK;
+
+	if (ESR_ELx_EC(esr) == ESR_ELx_EC_DABT_LOW && !addr_is_memory(addr) &&
+	    handle_host_mmio_trap(host_ctxt, esr, addr))
+		return;
 
 	ret = host_stage2_idmap(addr);
 	BUG_ON(ret && ret != -EAGAIN);
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index ad5b96085e1b..f91dfebe9980 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -296,6 +296,9 @@ static int unmap_protected_regions(void)
 			if (ret)
 				goto err_setup;
 		}
+
+		if (reg->cb)
+			reg->cb = kern_hyp_va(reg->cb);
 	}
 
 	return 0;
-- 
2.53.0.473.g4a7958ca14-goog


