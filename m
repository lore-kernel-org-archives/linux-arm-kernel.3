Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E43DE69E9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRZ2cEpW+rSNUfUs/q11EvB+KMkExBUSGtmow/HBwh4=; b=sJT2MxPFIdP4wXNGv5O18lol6J
	Yj48IC0poYbz3wrdDfWrWu4lIrpClb9XEhYiw2SFkEWnTU9Jo252btscbYEM7jUEVl6BJtDvyx+oO
	nFcAdwYK3LEyNqvs650rof81rQmOTDVNCYT7yPZiDAABN8P+2sXwAJ402unjqIf6j6eja3jCCcIq/
	0ARcX0UJoxkrMdHF4E7nXAO12ZA90bLGRFA7IWi5PuBy1gWvnTYKyswgdAQwo3N5c3bJ4kSEFrQcr
	ymSmaa6ngWOk5H4IHDUjFzZdXT0z8XzeunR6PYFLkRbeAi6uNjOGZBX1TR9gXSByfW8izXU+30X8T
	b7HT9wVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQQZ-0000000986P-0kmq;
	Tue, 03 Dec 2024 10:46:47 +0000
Received: from mail-lj1-x249.google.com ([2a00:1450:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQI0-000000095dg-3A9m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:37:57 +0000
Received: by mail-lj1-x249.google.com with SMTP id 38308e7fff4ca-2ffc3b6bb58so32719291fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222274; x=1733827074; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BRZ2cEpW+rSNUfUs/q11EvB+KMkExBUSGtmow/HBwh4=;
        b=b9OgEAa9fqD1U1c2t14BJkp/HPT4tRZoRHhjE5BpSreGJsy1Yx7CDqfS4NmdYTiahi
         94XLvZbsJODZERdw9kVDouv4FVW47pecnlzpI2qbU1euHFckxI0D4g2frQ6hgR8K+ZxM
         gxJAQG9J7BtpPrfbZlxUbgDyQNuTYpJM6Rd74rxu6nGi4dvbq72dXNbrJOHItHV8iPQp
         zdhAElUlvcNK8Ipe2/Rb87YwU85RFLgO7Jl1wwbNccuyJCHS9iAV7M9XDsAX9+MlUDqc
         pemkbsk9zdxSEs0grm9fvudHF9R3QX71t+5rSDIEqQFUrjHvFUW0+ypHanG1w1Kl9a8x
         HjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222274; x=1733827074;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRZ2cEpW+rSNUfUs/q11EvB+KMkExBUSGtmow/HBwh4=;
        b=rzPnxli2VHzDp8isZocyh2n49vr5K5TFeOqzVms6mcoZ2pC2Aue0xYsDbu8AMZRjha
         HsllWDy7o7N/KBr7J+v/e9SMd5oQxyaD59sDe0z0piVQtzFahZo0D7OP6rA6ojvaQCcS
         +MILg0mMHm6DkytMq74B7gCYXEQ8ChXLLDXckWhukPCDy6bFmTQ9+fSsouFHAhNESWZt
         DbY8lV0pvCuP7srS92rYw4wFF4lVrfHGiwv31jN4LU9BU3I30ox43GmeuhrX5gghHquf
         B0ySXFQ7lbKEpBvAfMnbJ7A1S3+Mgc1FW/0t8IOqWq10rGaxN8z6U9Tz3NAk+2l3JExg
         /8AA==
X-Forwarded-Encrypted: i=1; AJvYcCUo+6Vkzr2rRvNLZt0Qg6VGFfanosOSksTqWAhDhS/JS4yMOei5XGakCmNkasb1yCJPZjv5O051RwZ4ea6YsXeX@lists.infradead.org
X-Gm-Message-State: AOJu0YyLkAsrngUWgI8uy8opS+97wH8wHJSwT0azk4jY/BtrO7A4UnAF
	6ThuRuULDcvra+qGK7m8iKYNpWu6L+TnIAXyA9S6SdF8wDSTH1ev6ctwz9Ig/O5sbGbJLV26UW5
	4Jyvu+w==
X-Google-Smtp-Source: AGHT+IEj8AuZHCZpDYFglBJG72MANHTDv565iypJfWiYGscbgWwh2Qi7NN2thjRyh4mSRHfuIeZ5D8lm4Rqv
X-Received: from edxz12.prod.google.com ([2002:aa7:cf8c:0:b0:5cf:ac1b:14fa])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a2e:b890:0:b0:2ff:8e69:77ef
 with SMTP id 38308e7fff4ca-30009c0d863mr13033771fa.1.1733222274568; Tue, 03
 Dec 2024 02:37:54 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:25 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-9-qperret@google.com>
Subject: [PATCH v2 08/18] KVM: arm64: Add {get,put}_pkvm_hyp_vm() helpers
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_023756_792135_42A8E334 
X-CRM114-Status: GOOD (  11.64  )
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

In preparation for accessing pkvm_hyp_vm structures at EL2 in a context
where we can't always expect a vCPU to be loaded (e.g. MMU notifiers),
introduce get/put helpers to get temporary references to hyp VMs from
any context.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 +++
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 24a9a8330d19..f361d8b91930 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -70,4 +70,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 					 unsigned int vcpu_idx);
 void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
 
+struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
+void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm);
+
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 01616c39a810..4db88bedf8d5 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -327,6 +327,26 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	hyp_spin_unlock(&vm_table_lock);
 }
 
+struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
+{
+	struct pkvm_hyp_vm *hyp_vm;
+
+	hyp_spin_lock(&vm_table_lock);
+	hyp_vm = get_vm_by_handle(handle);
+	if (hyp_vm)
+		hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
+	hyp_spin_unlock(&vm_table_lock);
+
+	return hyp_vm;
+}
+
+void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm)
+{
+	hyp_spin_lock(&vm_table_lock);
+	hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
+	hyp_spin_unlock(&vm_table_lock);
+}
+
 static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struct kvm *host_kvm)
 {
 	struct kvm *kvm = &hyp_vm->kvm;
-- 
2.47.0.338.g60cca15819-goog


