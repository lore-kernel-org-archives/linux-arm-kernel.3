Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E83AD41C1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 10:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+mal7HTHfWe8plwjg0zx4lZB8mal6cIfV5WaXbVuko=; b=QbqWa72rcxcoqas++zte3RAPlr
	1xC6meqyWZU4LJ/7e9WilcWuXS/GtZoJskUl5/GoinI7TN5d5x8t56V0rhMdeYGAi3nPmi5hY6s3L
	tG0o4c6LYqNxZXBrWh4YmXul0pn0iaqu9a+J/46KFgBzI8MI8kuHNF7w5EWgsMMZmoDoVt+fp1M+T
	1yBCT8nWb+KYqGeybROUh+tKHPF3AwXGLJv83mUati0tYuvslk0jNvEq/I3F0DOKMR56NXFXOcbHG
	6xqsivRo/byJumvVpi3PD3EkpTNzmGhVSUPV3ay0Pr2SgAixgaHoaLlAlHpsUccxhfFJhgaBOm7Gx
	GkJlFvVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCk-0000000GUyi-0od2;
	Thu, 11 Dec 2025 10:47:26 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCd-0000000GUq8-0Jn7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 10:47:20 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47777158a85so9004645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 02:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765450036; x=1766054836; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a+mal7HTHfWe8plwjg0zx4lZB8mal6cIfV5WaXbVuko=;
        b=bmuLSVdHKiuBG63q6n7NoG13opltObgckIEwUgftm2ckRMP8OEgpA/rVB5Dw+4bkhl
         FotKn1wmC+nxhN23DjTiyBsPcXybiNXpxCtGK4rfnqqmH+D61zIgaxcWq9C4xySv+M0M
         vLcrqcwUwPEIT9m8/YTWL3ur4InLJE2lmX//uNEKY/wTP1IJ32lxY/S4Mbe0AuXxnYMB
         la995gMBKtStB+7y4aOcqNP/K1Vak2gRn2w7AJwOmGHIdxWj/EoKMgJOw//qOlC+jzkY
         Y5qYc5ngYfXkk/tlodu5CMdSOTpCTa9w0DPYnHOErNDtJK9bYsmy4VxBYP6BaAFLSGzt
         xhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450036; x=1766054836;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+mal7HTHfWe8plwjg0zx4lZB8mal6cIfV5WaXbVuko=;
        b=lD03zuR/2UpzFJ6+Tr6sIlVbCP1tJHufMyJqUBNCJRWyzxM+/BdHgbz7mDjzIBCXb1
         If9OOrLn2JGdNwSgxX7/GFj/FVpcsf6VtlKat5KiYvb56ICWOxp2WdiRZjhBU6Mieij/
         l3hgE2VCnKvV09WZR3EGeP4LAab0ZRRh73koRDIWa7bhFMJ+mnMN/lCz0Zzy0CyR5NRQ
         L56K5X7s0yHc9uQN3kQMcVSCm2JIg3a6Z7F5NiYwDQX++HTaEwcThqsDmjnDRsXe7QBm
         00WrrJqeXKuSYadIM/3BRuz3O4B5SQGUMavR/CZ3+2NQLnfykrPAeKn1Gqd1vg7IJUkm
         XbOg==
X-Forwarded-Encrypted: i=1; AJvYcCVsCddApaAPzlNv9IEq6JFOVLyqAbPFZ6qidOEAMaa1Bx8P4MrUh4AlhoCYLQYrAgmb6w/T8dkei/QsIiPAZHeR@lists.infradead.org
X-Gm-Message-State: AOJu0YxPl+1qsIMkkaRQxSKd8cDJogzWlIgqKQ8+0yFhlG+f+apAkXNC
	3dvFNjX1NHxSDppWw1KEj0yVuEnu/4FUiIkZBZ3MkbS00IbB3DnT7Keisy7bpx8Tg0mhlKECxE4
	ZNA==
X-Google-Smtp-Source: AGHT+IFxAJYh0RoX2PIWUW9yyln89JmGUy0/gLNAYgixKLIv4qxLnqP1L3/Y/kl9MfOpk7khjJD8Njv25w==
X-Received: from wmbb8.prod.google.com ([2002:a05:600c:5888:b0:477:5a0f:1860])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b37:b0:477:b734:8c53
 with SMTP id 5b1f17b1804b1-47a8375a595mr56402235e9.12.1765450036730; Thu, 11
 Dec 2025 02:47:16 -0800 (PST)
Date: Thu, 11 Dec 2025 10:47:07 +0000
In-Reply-To: <20251211104710.151771-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211104710.151771-8-tabba@google.com>
Subject: [PATCH v6 7/9] KVM: arm64: Track KVM IOCTLs and their associated KVM caps
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_024719_133943_F32D16D7 
X-CRM114-Status: GOOD (  16.05  )
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

Track KVM IOCTLs (VM IOCTLs for now), and the associated KVM capability
that enables that IOCTL. Add a function that performs the lookup.

This will be used by CoCo VM Hypervisors (e.g., pKVM) to determine
whether a particular KVM IOCTL is allowed for its VMs.

Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/arm.c              | 42 +++++++++++++++++++++++++++++++
 include/uapi/linux/kvm.h          |  1 +
 3 files changed, 45 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 64302c438355..9def5e1f536c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1652,4 +1652,6 @@ static __always_inline enum fgt_group_id __fgt_reg_to_group_id(enum vcpu_sysreg
 		p;							\
 	})
 
+long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext);
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index e4936cb9c8c3..1bbba79e2686 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -58,6 +58,48 @@ enum kvm_wfx_trap_policy {
 static enum kvm_wfx_trap_policy kvm_wfi_trap_policy __read_mostly = KVM_WFX_NOTRAP_SINGLE_TASK;
 static enum kvm_wfx_trap_policy kvm_wfe_trap_policy __read_mostly = KVM_WFX_NOTRAP_SINGLE_TASK;
 
+/*
+ * Tracks KVM IOCTLs and their associated KVM capabilities.
+ */
+struct kvm_ioctl_cap_map {
+	unsigned int ioctl;
+	long ext;
+};
+
+/*
+ * Sorted by ioctl to allow for potential binary search,
+ * though linear scan is sufficient for this size.
+ */
+static const struct kvm_ioctl_cap_map vm_ioctl_caps[] = {
+	{ KVM_CREATE_IRQCHIP, KVM_CAP_IRQCHIP },
+	{ KVM_ARM_SET_DEVICE_ADDR, KVM_CAP_ARM_SET_DEVICE_ADDR },
+	{ KVM_ARM_MTE_COPY_TAGS, KVM_CAP_ARM_MTE },
+	{ KVM_SET_DEVICE_ATTR, KVM_CAP_DEVICE_CTRL },
+	{ KVM_GET_DEVICE_ATTR, KVM_CAP_DEVICE_CTRL },
+	{ KVM_HAS_DEVICE_ATTR, KVM_CAP_DEVICE_CTRL },
+	{ KVM_ARM_SET_COUNTER_OFFSET, KVM_CAP_COUNTER_OFFSET },
+	{ KVM_ARM_GET_REG_WRITABLE_MASKS, KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES },
+	{ KVM_ARM_PREFERRED_TARGET, KVM_CAP_ARM_BASIC },
+};
+
+/*
+ * Set *ext to the capability.
+ * Return 0 if found, or -EINVAL if no IOCTL matches.
+ */
+long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vm_ioctl_caps); i++) {
+		if (vm_ioctl_caps[i].ioctl == ioctl) {
+			*ext = vm_ioctl_caps[i].ext;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 DECLARE_KVM_HYP_PER_CPU(unsigned long, kvm_hyp_vector);
 
 DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 52f6000ab020..861733b8f159 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -963,6 +963,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
 #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
 #define KVM_CAP_GUEST_MEMFD_FLAGS 244
+#define KVM_CAP_ARM_BASIC 245
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.52.0.223.gf5cc29aaa4-goog


