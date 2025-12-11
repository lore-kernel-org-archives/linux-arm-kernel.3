Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F5FD41C1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mValPcwACRy95uuY5pnqFzrcPHP+hh6+YUkltCWOAGw=; b=AMyTKc5adBXVMaBWDPApul8HT2
	igfugW70ymHtYtj3pjYhR8R9jIZeX1lzgRdCIN3MFj4s16QrTXu5QdO0S8yT31zpk6ue2VTmsAMGI
	iB93kmPcmm8j8c17Ve5hx3ezTnXwXCM8Raf5gkMiFQE8wVqTOehMdTFiEBny2iCxVrYgQ56qw6VxN
	xnG4uXVQNwJn+R9Pq69kwezr9QPhHyzcD2xxuNrfMCpu01P1ESZZfKX4coxXoE7Y6Hm7M3eVRbAzL
	5yynj9N921liHTGgYmm9R9yixXh2i8CUysDfaURO3nHQpm0DkbVDOrqqtfUQaWZ402b4Y6u9bu5WI
	2QpvCHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCe-0000000GUs0-0nuc;
	Thu, 11 Dec 2025 10:47:20 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCZ-0000000GUnw-16mk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 10:47:16 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477bf8c1413so4712885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 02:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765450033; x=1766054833; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mValPcwACRy95uuY5pnqFzrcPHP+hh6+YUkltCWOAGw=;
        b=qvnwWCHedoiMW/WxS9cS09b+sCXhbRfsFPuppPhbp0YYx6dO10/l3Jddi1lni7ABAP
         UHe3mvAxyQq7V2yPqxhW8P8MlazzAOc+cEfFKeNmfDeoh6yz22Qikr0SUazq6iOGg2uN
         5OYOmg95XKm1UKizt43h4gxIteFTfJ9rkvw9+KjEbV+eVQEHWPc2Sdx76vg97ZxuzJ55
         vZwH4yMTkKWzhiRNMfCRjqVkyd/1oy2errK983sTPF+0ZH6mC1J5KeFzxjPR7eQHxhwC
         VWdtMSK9c/0+QEJsAIWdiQNbrkthlT1MdiAwNPtHnEvxrLfFm9Ohcwd1pgQLRnXPOBQn
         Js/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450033; x=1766054833;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mValPcwACRy95uuY5pnqFzrcPHP+hh6+YUkltCWOAGw=;
        b=QhBDW6PNSo9kzOuLajt70/MMIwK/0crj8RbhIK9HFD2AhH5bzTo9ZE2/MJrFuzHoyz
         uHhTgaD6Q6FhTsZM2ixqBolr8uxidbx7IGACY0msmWOmtQKP/sH/pcd5oFbbfbd1X+US
         KJNSTrW90G5UUhpoJ7Xh8RL4vvSRxaO/16ryGUi/R0A2jqoakE+2rjsvsJxWkaz7DKzD
         4OYs1GC121dhxUOsidxsgR8/KfyNdhGYGpVm3BqGKsLlmj+tor+4CgYYb9wcZUGr7gx7
         Shb1hXnXn0S6L5aS8qCoR93pqMD3+s2OE8m7tSnE57pbnxZCXysnWn/yqRIcemdbOmBA
         k+aA==
X-Forwarded-Encrypted: i=1; AJvYcCUEo8Hcbw/m/nfVzwCVTZxqNnTzuUAtkdfvqicfpo7sK+fq9xygmK35ljXol4llJvaBk1uyCgbdPrZjYcZEwxZD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa2jwR+HXU7PZ0fjY1oUC/1cXeECbJY/TjHqa1ky06/f4UondY
	N2+ON6BVM8knwEChtw7VUAsvzVClq2qhXZ6k7rUJU2YTvuZrsMBXbjbD/IoX1It/YKgVsdCnyE6
	JaA==
X-Google-Smtp-Source: AGHT+IErJSD7jfhvgVk4mxext/rgabq/pIMU+ilqufVoZdB7wi8Jy+hGMcGmwSn39so/sLY/KAYqJoxz0g==
X-Received: from wmej11.prod.google.com ([2002:a05:600c:42cb:b0:479:35f9:3b87])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8889:10b0:477:3e0b:c0e3
 with SMTP id 5b1f17b1804b1-47a83e0fbe1mr38543215e9.32.1765450033601; Thu, 11
 Dec 2025 02:47:13 -0800 (PST)
Date: Thu, 11 Dec 2025 10:47:03 +0000
In-Reply-To: <20251211104710.151771-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211104710.151771-4-tabba@google.com>
Subject: [PATCH v6 3/9] KVM: arm64: Fix MTE flag initialization for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_024715_315780_753C9DDD 
X-CRM114-Status: GOOD (  15.27  )
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

The function pkvm_init_features_from_host() initializes guest
features, propagating them from the host. The logic to propagate
KVM_ARCH_FLAG_MTE_ENABLED (Memory Tagging Extension)
has a couple of issues.

First, the check was in the common path, before the divergence for
protected and non-protected VMs. For non-protected VMs, this was
unnecessary, as 'kvm->arch.flags' is completely overwritten by
host_arch_flags immediately after, which already contains the MTE flag.
For protected VMs, this was setting the flag even if the feature is not
allowed.

Second, the check was reading 'host_kvm->arch.flags' instead of using
the local 'host_arch_flags', which is read once from the host flags.

Fix these by moving the MTE flag check inside the protected-VM-only
path, checking if the feature is allowed, and changing it to use the
correct host_arch_flags local variable. This ensures non-protected VMs
get the flag via the bulk copy, and protected VMs get it via an explicit
check.

Fixes: b7f345fbc32a ("KVM: arm64: Fix FEAT_MTE in pKVM")
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index f6f8996c4f97..16d7bf493c18 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -337,9 +337,6 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	/* CTR_EL0 is always under host control, even for protected VMs. */
 	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
 
-	if (test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &host_kvm->arch.flags))
-		set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
-
 	/* No restrictions for non-protected VMs. */
 	if (!kvm_vm_is_protected(kvm)) {
 		hyp_vm->kvm.arch.flags = host_arch_flags;
@@ -354,6 +351,9 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 		return;
 	}
 
+	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_MTE))
+		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_MTE_ENABLED);
+
 	bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
 
 	set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
-- 
2.52.0.223.gf5cc29aaa4-goog


