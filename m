Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35021CCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ap94pVeJZZkbo7tUJgzqZixZK35kctleCNA5GGl6HeE=; b=wi/YZIqy9tsdYB8/PH5UzRju6Y
	LA+ll3ta+nVDZrlIvsg5of0MUYBv5yPAY5iZBp0EwoKnyuNwiHxRgBYW8elwdIZHRHIhEV4MtoYHp
	uW3tyWmOyUafqdo2aU18GO6+VPAL/EknNY6rSwkMVbI1eEbnNzflQXAmeRfMQJDJa6w9JZlnOOvol
	bppN9/jeuFDAmTljZOwWgfoSyxTDP46HrVXuWCGpbeN3e/jjk00dd35dKXbc8XUZrBSZbZhU8OzYv
	Y8oPrKFKqM3oZawIJ7gvM1iDaJrcQx0uVaZ8CIEqG2GLWga1Wp0FyZsfeAI21dALavE+9qadO1vOU
	LTutoKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLZt-0000000Dn73-0VFa;
	Mon, 27 Oct 2025 11:39:57 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLZm-0000000Dn2w-0g6M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 11:39:52 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b6d584a5147so419533866b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761565188; x=1762169988; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap94pVeJZZkbo7tUJgzqZixZK35kctleCNA5GGl6HeE=;
        b=O3rh3YH/grq1nnrFfrWHO+4z1PK6ITyWQcZ6a2aJ4AXhx/LApb3MSdKlEnMsHLBn7g
         /5DgD1+ocJ59mVNbHPmxtK7uthVGRAe6TVnza6PSXYHjySBWZgMW3iXA2eG/HCBi4joX
         pBLy0Hinb7v+GAlD9WRNVYwrQY+fMsfruAuxBSJf0JKZaNw7hBGGON8WjBUp0R2W8An6
         Nv6DaO5pF/4zJ4cdm+q4Nb8EsDCa6nhHNOBp/PYtXeS/uKVgelidowiCtGn6ClNthqZa
         KP1sPrI/EChuDGHVBtqBqsxCdU1JxdVqI7uBcZJXSJIOUw5tr3eO8XSUGF1Hn4zEVqwR
         02dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565188; x=1762169988;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap94pVeJZZkbo7tUJgzqZixZK35kctleCNA5GGl6HeE=;
        b=SgfpUVpFjdnPznzUU3IFzqy8Ly1+JrhecZHW8Et6Z9vPKrgr1QBZNwF7/zqT6JODfN
         Q5FkLsLoQdmEft53jF3jmF/L7DYK96XyD6nJjKh2EZw23gmW2X02byIcLz024Xo837i9
         fW9E6KoHDAgyAk/fM1TAWylqkzVjefXWKG69ZB4COK9zTRaaykgj7H/E8oxTfqTzqq72
         /jv6fiGv1+zyUUIHrqy5iaSsMfaltwwg7U9JRh87tHBvioV7JOLXkggk6NyAqtKe4fKl
         JudVGh7eYS58oyYtwgb1auS3VT5UWl+XJ73+ToRug4zSKQM02EvOw5pcmq2rSFY+2Gjb
         +cLg==
X-Forwarded-Encrypted: i=1; AJvYcCX6XFNLLwgOoZamW44cPbTdY1a0CLfeIkywxF3ELMbdiue6BpGr1/J+qvAYwc9JmXZUZ8MMP8DRHPsoi901zYsO@lists.infradead.org
X-Gm-Message-State: AOJu0YzjFomOpmXtfMC9PIcYcB9zjphplOkx9kBCfDAWVpPL7Qxu0AJv
	D9exQmGhZUdxCRQYmKS2wNU//a/Rym1D0RQlg0R1I4rfBKM3dU8LJOZdFtknVq2F066iYLXrvXN
	VcQ==
X-Google-Smtp-Source: AGHT+IEScGbQWgMIwv19VMFWWRVfMiY9MCUgqr470ew7BdFYncsGhLIeFlTXYgFnqeoynaMCqmdqQeqXTA==
X-Received: from ejed21.prod.google.com ([2002:a17:906:1755:b0:b55:f065:b57a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:6d0f:b0:b0c:b51b:81f6
 with SMTP id a640c23a62f3a-b647423c403mr4390703766b.43.1761565187382; Mon, 27
 Oct 2025 04:39:47 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:39:42 +0000
In-Reply-To: <20251027113943.1282568-1-tabba@google.com>
Mime-Version: 1.0
References: <20251027113943.1282568-1-tabba@google.com>
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
Message-ID: <20251027113943.1282568-4-tabba@google.com>
Subject: [PATCH v1 3/4] KVM: arm64: Add compile-time type check to vcpu_write_sys_reg()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_043950_238756_C316C968 
X-CRM114-Status: GOOD (  16.25  )
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

The vcpu_write_sys_reg() function, like __vcpu_assign_sys_reg(),
is susceptible to parameter transposition bugs where the 'u64 val' is
accidentally passed in the 'reg' slot.

Even with the now-consistent parameter ordering, this remains a risk.

To apply the same compile-time checks, vcpu_write_sys_reg() is converted
into a macro. The original function implementation is converted into a
helper as _vcpu_write_sys_reg(). The new macro wrapper performs the same
type compatibility check as its `__vcpu_assign_sys_reg` counterpart,
preventing the 'reg' parameter from being a 'u64'.

This patch also includes related cleanups made necessary or apparent by
this change:
* The 'reg' parameters for __vcpu_read_sys_reg() and
  __vcpu_write_sys_reg() are tightened from 'int' to 'enum vcpu_sysreg'.
* The 'struct sys_reg_desc.reg' field is changed from 'int' to 'enum
  vcpu_sysreg'.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 8 +++++++-
 arch/arm64/kvm/hyp/exception.c    | 4 ++--
 arch/arm64/kvm/sys_regs.c         | 2 +-
 arch/arm64/kvm/sys_regs.h         | 2 +-
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 2c33ea5fdb1c..2b7c8ba8802d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1168,7 +1168,13 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 	})
 
 u64 vcpu_read_sys_reg(const struct kvm_vcpu *, enum vcpu_sysreg);
-void vcpu_write_sys_reg(struct kvm_vcpu *, enum vcpu_sysreg, u64);
+void _vcpu_write_sys_reg(struct kvm_vcpu *, enum vcpu_sysreg, u64);
+
+#define vcpu_write_sys_reg(v, r, val)						\
+	do {									\
+		BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(r), u64));\
+		_vcpu_write_sys_reg(v, r, val);					\
+	} while (0)
 
 struct kvm_vm_stat {
 	struct kvm_vm_stat_generic generic;
diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index a5e5eda7aba0..6f8b1b5f2cab 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -20,7 +20,7 @@
 #error Hypervisor code only!
 #endif
 
-static inline u64 __vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
+static inline u64 __vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 {
 	if (has_vhe())
 		return vcpu_read_sys_reg(vcpu, reg);
@@ -28,7 +28,7 @@ static inline u64 __vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
 	return __vcpu_sys_reg(vcpu, reg);
 }
 
-static inline void __vcpu_write_sys_reg(struct kvm_vcpu *vcpu, int reg, u64 val)
+static inline void __vcpu_write_sys_reg(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val)
 {
 	if (has_vhe())
 		vcpu_write_sys_reg(vcpu, reg, val);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index d0d696d0819a..8e323353383c 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -338,7 +338,7 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 	return __vcpu_sys_reg(vcpu, reg);
 }
 
-void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val)
+void _vcpu_write_sys_reg(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val)
 {
 	struct sr_loc loc = {};
 
diff --git a/arch/arm64/kvm/sys_regs.h b/arch/arm64/kvm/sys_regs.h
index b3f904472fac..a98c3aadcdbd 100644
--- a/arch/arm64/kvm/sys_regs.h
+++ b/arch/arm64/kvm/sys_regs.h
@@ -78,7 +78,7 @@ struct sys_reg_desc {
 	u64 (*reset)(struct kvm_vcpu *, const struct sys_reg_desc *);
 
 	/* Index into sys_reg[], or 0 if we don't need to save it. */
-	int reg;
+	enum vcpu_sysreg reg;
 
 	/* Value (usually reset value), or write mask for idregs */
 	u64 val;
-- 
2.51.1.838.g19442a804e-goog


