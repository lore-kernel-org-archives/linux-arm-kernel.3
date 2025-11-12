Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A70CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kjn3ziG+riq1CP7p6ieagwSWj8kSfInnE/GY9lPyPvY=; b=xf+fjd1QlQNQ9KzkF1bpIzWYz4
	fwEmK32kfjyvzBjxt96y1k+5TXpghgKAJ6A8bCEqO+sjba8V2RiMlFkOjNT+7rbLESkKhkihHnbE7
	sAXMzBoJMZodHBMKsg7sw77iegtHlmSKfQ1VWZ1t1CIf1fKnc/nABiwJAtCpnT7SHpgCU2/++PQLy
	1q9bvtH3ys/eWDZyL+wUDlcddStldu8BZVxh4Lb09C7YIw5GU5/1FtC3MZhk0wJ6PXAdPpGTZA4kc
	ikEAUqpOwVW2dnT/El3aroFNZU1uuG/3AhupCqoYYSafC5mBUc3FyYZEWi4y3T++0jrid0qXSTunK
	pbpTWuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72M-00000008RxZ-3eRN;
	Wed, 12 Nov 2025 09:21:10 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72C-00000008Rpu-2Wm3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:21:01 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4777b03b90fso2965635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762939258; x=1763544058; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kjn3ziG+riq1CP7p6ieagwSWj8kSfInnE/GY9lPyPvY=;
        b=Lzu7PDEqgO+CgU+AyhtWj0Eh1wHc37jpCeiLSdOxlmA9yGjt62VIvI6/TJ3PiZeOYl
         +jmZao2fvddkzgtM19ZziPon3LzvOvbZ7YX45sTXmLezTg3NOJg9z2LovE17BBGnB2px
         PRR2WkuX1cedX4arBt4VUmiNSWWos0EwfpWpOQW79BfITyzE/nAnxmXaARFdnyf2QIh1
         6VDmNxTLxCB5rIYkVFqA1OPeq8ysty8SY5yOs+z07yMGZcL2nDqJq1kWFJSTklvMBMz2
         e3XcziXxy3Vz1rA9eGLqyhT9VrJnrju0MUD/wifM3MHLWgNdQP2QxDNTBJQcaW4GHzu3
         6r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939258; x=1763544058;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kjn3ziG+riq1CP7p6ieagwSWj8kSfInnE/GY9lPyPvY=;
        b=Wki0FpIA4f8hA4egXMEfz0HAYoQF+SlNUWhh0S+9RW94HTte8OAIxG4MT4ipS7p1DA
         8ZNvljA8G9noJ1Xd9CqvYdzMSoz64DZXaMavm4HtFI0rE7yovX9hmJnmXuKfmz94+5+2
         hMgksR5Q8g6QxZpxelsloGs9NNH7++qMIVrYDtuYi6bXTPpEPhfI2piBA4FVOduvo8+L
         eKphy+bzX9q4Z5zeiqgwzgMsNfLLN7XAtZQF4GvtGtAEsPQNHd2kKEciLXDNiu2xAMI0
         3MDaAMrTluFAzgVuYzR2qakm2GPyC11vMYC6EwZnvBrcyE6QA/ljqCVelOhNOfAqLL6z
         KJqA==
X-Forwarded-Encrypted: i=1; AJvYcCXm/zrNnwEd06I4V/Bq4FG9ofYUtDUmUpd5dywLnDeCKol1fvg3bDFkvuURrvCQfWggax2J6MSnzM2hiOatMTd+@lists.infradead.org
X-Gm-Message-State: AOJu0YxDfCu1rUS9eAL79xmzw/+h5qLzDyzm1POchvk/Sdxmx8ESv91F
	mN/qO6VumSWQowYG0zLvI3R2tvonL0JdT2/W0flBCAIWhWE8K+ykIif8PxGmher3bkmU4/4v9IS
	JNQ==
X-Google-Smtp-Source: AGHT+IFlnpNWQQd8XzhD9WlKKZvHlxlXUiwVjk/aG1tNnEUZSrorzKTWftWmWdZMx5mRwqTHrZhOi18TUw==
X-Received: from wmbjn5.prod.google.com ([2002:a05:600c:6b05:b0:46f:aa50:d716])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f8f:b0:477:1709:1f32
 with SMTP id 5b1f17b1804b1-477870b9830mr16518165e9.26.1762939258700; Wed, 12
 Nov 2025 01:20:58 -0800 (PST)
Date: Wed, 12 Nov 2025 09:20:50 +0000
In-Reply-To: <20251112092051.1376245-1-tabba@google.com>
Mime-Version: 1.0
References: <20251112092051.1376245-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112092051.1376245-8-tabba@google.com>
Subject: [PATCH v4 7/8] KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_012100_663172_A03477DF 
X-CRM114-Status: GOOD (  13.19  )
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

Certain VM IOCTLs are tied to specific VM features. Since pKVM does not
support all features, restrict which IOCTLs are allowed depending on
whether the associated feature is supported.

Use the existing VM capability check as the source of truth to whether
an IOCTL is allowed for a particular VM by mapping the IOCTLs with their
associated capabilities.

Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h | 29 +++++++++++++++++++++++++++++
 arch/arm64/kvm/arm.c              |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 5b564576160d..7a418ea276d1 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -51,6 +51,35 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	}
 }
 
+/*
+ * Check whether the KVM VM IOCTL is allowed in pKVM.
+ *
+ * Certain features are allowed only for non-protected VMs in pKVM, which is why
+ * this takes the VM (kvm) as a parameter.
+ */
+static inline bool kvm_pkvm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
+{
+	switch (ioctl) {
+	case KVM_CREATE_IRQCHIP:
+		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_IRQCHIP);
+	case KVM_ARM_SET_DEVICE_ADDR:
+		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SET_DEVICE_ADDR);
+	case KVM_ARM_MTE_COPY_TAGS:
+		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_MTE);
+	case KVM_ARM_SET_COUNTER_OFFSET:
+		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_COUNTER_OFFSET);
+	case KVM_HAS_DEVICE_ATTR:
+	case KVM_SET_DEVICE_ATTR:
+	case KVM_GET_DEVICE_ATTR:
+		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_DEVICE_CTRL) ||
+		       kvm_pkvm_ext_allowed(kvm, KVM_CAP_VM_ATTRIBUTES);
+	case KVM_ARM_GET_REG_WRITABLE_MASKS:
+		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES);
+	default:
+		return true;
+	}
+}
+
 extern struct memblock_region kvm_nvhe_sym(hyp_memory)[];
 extern unsigned int kvm_nvhe_sym(hyp_memblock_nr);
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 10d853f2722e..020cadd811a3 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1879,6 +1879,9 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 	void __user *argp = (void __user *)arg;
 	struct kvm_device_attr attr;
 
+	if (is_protected_kvm_enabled() && !kvm_pkvm_ioctl_allowed(kvm, ioctl))
+		return -EINVAL;
+
 	switch (ioctl) {
 	case KVM_CREATE_IRQCHIP: {
 		int ret;
-- 
2.51.2.1041.gc1ab5b90ca-goog


