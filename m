Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D944ECD1297
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ie7kpsh7J/uc1PtC1eN/9i9Vh9NVRgm/2OIk7X5wYpo=; b=JwXHsHrAN022PlZlhIMkGuAUS7
	mxQKGYMLc4O2fNTlOjDsMyp/sA32i5V/J6fYA/O2GQMgcfAfakbzm+yzRiShrIHsPOF+aKbI9UlqE
	Km26ZFGhvbteJjSNZLYTIdozv8NGubkllqzoz4llXkykeGjO46GwGQrN+cvK8GsWaQuPTiznVVfD2
	LPecwofF/VWEyE9sMX/8Sba2ec4SAUnd1frNTfAZ0L2QVEkl/rYE3Fh2eeKrrWTSI6nsg/vrIWUHh
	3rHuDXN9/IJXBQLf4Ll986qqZxU0s0X5ARIX1OROwl/RZhz4DqpU6ZN2dFfCKSRSG3gwYJA6YKfl9
	zW3cjSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISDF-00000005Vwy-0WiP;
	Mon, 10 Nov 2025 13:45:41 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD9-00000005Vr3-0TJq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:45:36 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42b30184be7so578569f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762782333; x=1763387133; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie7kpsh7J/uc1PtC1eN/9i9Vh9NVRgm/2OIk7X5wYpo=;
        b=tUBjScVMj68gOnZZtROJ2QXyLPVklpmM4ATvssA9dwJ208pUnrTCAU1NRZZ/meN3M4
         1xhZOp8RsTq6AfJOFuA/xPlo/414m4XFq8eij+6OX2BCg8SsmSqBK/PIz0RAr5rj52UK
         pu0lWDS6GzG4YzSR64b8qoHzzlUK0G6fpMIvOE8t+hjr6j6yspsvMlzb+dU/HeiPEQFV
         Y1LXyJ9iOi/TXk0MbKc6c5obi/A1AhJdNXP27IZWzjekqzKR+DTXjA6vrifQ+GGcZRgA
         IcnVpLmx6DBNJRjL84S1hIP+suhvW8ei00YPS0yRXkTC+cHkOXpuoHjhlPknw7OuKqQ4
         feJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782333; x=1763387133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie7kpsh7J/uc1PtC1eN/9i9Vh9NVRgm/2OIk7X5wYpo=;
        b=m32a2KrvP8DF68D6xkt3VKS/2ml2BGXKZTP6qu2itNZbSvZfQD14vYwS0vYLC69adR
         JaR9kPqZIkrbp046Cy47Zcr8NN6LqmUiY1sI05iHcdcb7ahISSL9vMXopBJ0Hk1xreVP
         Y3btpxisI1AfBD4y952RuTJw4C1FLzWM/5MQw5gq+rUtqjXaoh8seIaJHpCUggvvoYYY
         s3eIg5MmBdIqIuystunDTeJMwf6AkQ4bLWKDeCgX8UIPTizlXv+Z+sH59ugBBhcQECjR
         75Nyyj1L05HiRbWDaeIIvBDiHGssNd4APq1Y/Oz0DdVAcAZ0y2yOmTuDD6+Cn/2SsrK8
         kAYg==
X-Forwarded-Encrypted: i=1; AJvYcCXz0TC1WWYA6lUEx8rQRS6F/dYHC8F2OaACYLLp3T0MKzG0TZntDyPpWOsJguvpl6Dg7rogGzhVRSGSnLS3w7sH@lists.infradead.org
X-Gm-Message-State: AOJu0YzeDPNc90f3Nft3TdKgENCb2dP6PBweJitU09FSXv8VIBq6HfoL
	XtKXhvbv3/yzbQqF2CJ7Y7SjEmLenVV2BvIxXU7stZKnZ2cf2x7CQTvupztP+XgeefYBjKmi9rs
	snw==
X-Google-Smtp-Source: AGHT+IG9ilEUoq2nh7FpIF6KZkR90/4mFzDa0JiXH3DjnqLpk38X37fcPxRyknshTYR2PdDE64CreGe4Bg==
X-Received: from wmbh5.prod.google.com ([2002:a05:600c:a105:b0:475:decb:4c4d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6384:b0:477:5aaa:57a6
 with SMTP id 5b1f17b1804b1-477732372aemr59615955e9.10.1762782333174; Mon, 10
 Nov 2025 05:45:33 -0800 (PST)
Date: Mon, 10 Nov 2025 13:45:24 +0000
In-Reply-To: <20251110134525.3768197-1-tabba@google.com>
Mime-Version: 1.0
References: <20251110134525.3768197-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251110134525.3768197-8-tabba@google.com>
Subject: [PATCH v3 7/8] KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_054535_186310_C8DAA497 
X-CRM114-Status: GOOD (  13.34  )
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
 arch/arm64/include/asm/kvm_pkvm.h | 20 ++++++++++++++++++++
 arch/arm64/kvm/arm.c              |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index ea5d2275d16d..a2b51590bed0 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -52,6 +52,26 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	}
 }
 
+/*
+ * Check whether the KVM IOCTL is allowed in pKVM.
+ *
+ * Certain features are allowed only for non-protected VMs in pKVM, which is why
+ * this takes the VM (kvm) as a parameter.
+ */
+static inline bool kvm_pkvm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
+{
+	switch (ioctl) {
+	case KVM_CREATE_IRQCHIP:
+		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_IRQCHIP);
+	case KVM_ARM_MTE_COPY_TAGS:
+		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_MTE);
+	case KVM_ARM_SET_COUNTER_OFFSET:
+		return kvm_pkvm_ext_allowed(kvm, KVM_CAP_COUNTER_OFFSET);
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


