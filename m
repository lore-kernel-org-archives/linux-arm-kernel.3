Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19969CED602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7Ix1gvDoedoa2VySziNtSICAiph6cR2zcFJA1VxEgw=; b=OdmWCA2CmX2UMD+rxWjFdq292b
	+UjGAemOqdQMmtuHM6pZO6MB0smbxFGgS09ylPlA20XX4WO+iW7yBWW11ammo/euoyd4HX0TvWA0W
	CwN8StiHzJhfQDcuK/SMnmiFEF5CqgYHX9Cwno7eR1YUmOeU3HxNICnJMlX+Ilt1NPHxylxtbvTOg
	SgzSvOMhZ3f9Jw7mYu9qQNWKlOoJeFDarqaRE/WhkTtoe6QVt0GlOseackYz2qcBWCFYayybxk/F9
	QOgvoe2ociaaOWgtGNGgNNiWs6t1Jw7MrUhq99eBwE7kJlS1cLfNTkL7IGva5/Y8ekZi9+CWwNN7q
	kk/8N9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6L-00000000FnO-49LH;
	Tue, 18 Nov 2025 10:38:21 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6G-00000000Fj0-48VU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:38:18 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4779393221aso6682335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462295; x=1764067095; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f7Ix1gvDoedoa2VySziNtSICAiph6cR2zcFJA1VxEgw=;
        b=cMKHYxmE5s/D8HCY8U1u5D0ENfPwTcpPjvn62qPwbEEG68IK0Yo7T+3y4X61owPXwj
         cykN5c7tz36Bos6uZwdcVz1LqoaQ7b/eqoAQS8obqBSxbvb2+wxqE4qJqlNyW6DxnQcM
         s7w+QyT1rhkFxu5V5o5TWmLfjsisLU65vVqKvkdxaxW90y7km1LihV8DN1Tw+BgG5tkA
         I8k2yxBaAZQFgSrpBz5pBU3se6ccLVjgOHAz3dkZL0enfXSOrdZPDJM7BXXouEI8Cyxi
         +cK8Gt5mh0EnBmhc+D3dg5BcnVwsxkrfKeldr8Ryvt7dgg/9ayJ/dbQWPyqu9HuNZDwY
         XOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462295; x=1764067095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7Ix1gvDoedoa2VySziNtSICAiph6cR2zcFJA1VxEgw=;
        b=KjYd5bt2wBzXEs0XwKlbLl22k854aNa5qi57rCkdtoSfPNymd/03HlNA+GWPG8ZVeR
         z7EKIzJt5mFi+3+H5wz5ybtIVgp7NmvhStS6RiXVGsLBeaTKkaqCgC/jtGulU6w8BFII
         I2zQQjN2vMCWlVxdwLlOstedv+VUwdfiCRpeSkDim7B5b/XGUO9rcRLLvrG+wj/fizfU
         uBTi2+wpTpwMrUgsOEzpMmVSZPQes7WecPm1uG9tut4p1E7UrkkVOisGa1vj6oMV0l5i
         6eODjc7OhwLW5JNvszhw+iUsMUI3DcDM+GmnJ/SOPl7R1Uv4HePXbIcgVLC6ImWwt1db
         X3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX83SiZPCyk9NsxKwpoQeyP6Mzeo8LemxzBvg9f0bF59UY/3eIhv9N6LS3mKiG7NWcNFmjqfoaFTQnZB3W5pNFU@lists.infradead.org
X-Gm-Message-State: AOJu0YxUNII3tjo40YeqDDXzpkHyj4LQcQGwSEpXcso/S8746X6fQArF
	UoIwET1Uh9Sc85nobcOEtbBCPfjI0nkWlR1nmQUSSuE7WDLxzt2RjIVOZ+ATZolmMiQH9ezWaLC
	5YA==
X-Google-Smtp-Source: AGHT+IHHaFRT48dnQv9XnnqkCXxSMygY1YzNHot8cTmVJYtqnUnJm6Bhep5tmphH8wELHWrZN7tKJjb/Cg==
X-Received: from wmla8.prod.google.com ([2002:a05:600d:2388:b0:477:9945:466d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b23:b0:477:7bd2:693f
 with SMTP id 5b1f17b1804b1-4778fe60615mr147591815e9.6.1763462295255; Tue, 18
 Nov 2025 02:38:15 -0800 (PST)
Date: Tue, 18 Nov 2025 10:38:05 +0000
In-Reply-To: <20251118103807.707500-1-tabba@google.com>
Mime-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118103807.707500-9-tabba@google.com>
Subject: [PATCH v5 8/9] KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_023817_079662_C863B607 
X-CRM114-Status: GOOD (  15.17  )
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
 arch/arm64/include/asm/kvm_pkvm.h | 21 +++++++++++++++++++++
 arch/arm64/kvm/arm.c              |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 5b564576160d..dcba7f99b88c 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -9,6 +9,7 @@
 #include <linux/arm_ffa.h>
 #include <linux/memblock.h>
 #include <linux/scatterlist.h>
+#include <asm/kvm_host.h>
 #include <asm/kvm_pgtable.h>
 
 /* Maximum number of VMs that can co-exist under pKVM. */
@@ -31,6 +32,7 @@ int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu);
 static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 {
 	switch (ext) {
+	case KVM_CAP_CORE:
 	case KVM_CAP_IRQCHIP:
 	case KVM_CAP_ARM_PSCI:
 	case KVM_CAP_ARM_PSCI_0_2:
@@ -51,6 +53,25 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
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
+	long ext;
+	int r;
+
+	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
+
+	if (WARN_ON_ONCE(r < 0))
+		return false;
+
+	return kvm_pkvm_ext_allowed(kvm, ext);
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
2.52.0.rc1.455.g30608eb744-goog


