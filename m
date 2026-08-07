Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7E0C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LMvLSIyRJoS17MqrfOagB9BtwOQBhza88CokriU1a0=; b=AEFV0XsXKXCWuCJdNW/vOuwhYj
	a6o9LIQVV5p+POqdaDsIGrUMJqlgD0Gt/jXi8J9B4/sFE6K0HEUCstXocNU3pACBop8K27V7pIrHJ
	80oFqUxuj9bFeBL5teP4QYiEOqBJw15FuSgV+sA0gm6eUcU6xKVaP+kNnHy9BAq7woyO49boXQfvb
	pjaGMOPcdy5Uyj/co13dftqs+UP82R6IB1Fcr2OC5bwjPVdOOVQ+PcVw51V6yvLaAWZnEkL+UUjJU
	18YHvTOyOKjQ42AgPzlhPB+VIgJoNI/TmkRnbPvvz/hHw5jNZ40vjINQd0KQes6mq0ESjRS+IggY5
	OgVBYPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfg-00000008S3j-2Ki3;
	Fri, 07 Aug 2026 16:43:48 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfc-00000008RzO-12sh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:45 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4955d314945so19118415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121021; x=1786725821; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LMvLSIyRJoS17MqrfOagB9BtwOQBhza88CokriU1a0=;
        b=e8435G0HvP4HuvnVe8eN1xPbji9nP4607t9wfsJ6Gpiu6M+BwqEv6f24KD+zrBZWps
         54T3M+KsROM1LfaFcxNPsTPS1c+ilySk2RrJKhBaugu/QI3jHTQ1dr761SMsfwtwoS7F
         NsyqMM+5yRB1yMPVu2RScQ18mUq18YlnknEc0GhLe8Mjrl/jl5HPvc6OYBdQ8L58YHZS
         ZxfYpS7q62Eva4hchOoYtUb5HtMyx/yZ5cenoJAddmbfGKihyh4+jpHmsxWye3mcxO03
         x7/kt2e0QT3bfIa/d8KNSGJZaQ6t7jO0tQRAZRZBUD4WLsl0Kino7A2aZPi01Ly7RJvI
         ZgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121021; x=1786725821;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9LMvLSIyRJoS17MqrfOagB9BtwOQBhza88CokriU1a0=;
        b=Ke4jDHVLsK/vrjD3VxWQh20Rmi5nIFjlReW7WLecfX7zS6tKUTR4sr4HahbCF7uYC9
         AvqMU26W5LHt2vyH9HjvTVwF4F8mdXaNUT43ZYks6CQtp2Mwyq6h8nDwM/wfbr7hFiyb
         hosLoTv5XuSW7BI/uB04RwU8yvFWOlAo3IsPDVMFceiGI7cfQoIn8dmUyccAm4rZT9VE
         vqFQw2m9utvQlVqSz79UPoTT6e2iPt7SoPA3NENiLpuJWWQN7HxKpmg5aHcn/5salW/o
         VeSNiwtSFkbXpuMYLuqIGWoh9Q6M9eIVN7mNovv7r3S4nzAPwazUC3thal80G04xZYUx
         vrWA==
X-Forwarded-Encrypted: i=1; AHgh+RqqHNWMdm+7iJ9prR2frPCOtLuwAqYaEDpC7D5PBfDeWnEAWiG8F94Ee0D39veCO5TvIgBAl2J7EQvnxFWgWH2P@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2EqiXxy14kyks1np2brNw/AWcaTuj1uQtUFLvJkXWzqm71X2A
	OLyuYikge9+4f55FbNRBMjC0mABrTw5BMt9RtVk4ZitI9swCBjZh7oxnuk2LaIQDfqbZIjFeft6
	WhV0vrZUcv139/bJGkrTsiCaEBcjcJg==
X-Received: from wrrq16.prod.google.com ([2002:adf:f950:0:b0:47f:8ed4:b07f])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e12:b0:499:61bb:6c78 with SMTP id 5b1f17b1804b1-49961bb71abmr15660795e9.14.1786121021370;
 Fri, 07 Aug 2026 09:43:41 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:12 +0000
In-Reply-To: <20260807164322.2970811-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-4-sebastianene@google.com>
Subject: [PATCH v2 02/13] KVM: arm64: Track host-unmapped MMIO regions in a
 static array
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org
Cc: kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, sebastianene@google.com, 
	seiden@linux.ibm.com, smostafa@google.com, tglx@kernel.org, 
	vdonnefort@google.com, vladimir.murzin@arm.com, yuzenghui@huawei.com, 
	zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094344_302063_1F4CE7A5 
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

Introduce a registry to track protected MMIO regions that are unmapped
from the host stage-2 page tables. These regions are stored in a
fixed-size array and their ownership is donated to the hypervisor during
initialization to ensure host-exclusion and persistent tracking.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h     | 11 +++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  3 +++
 arch/arm64/kvm/hyp/nvhe/setup.c       | 24 ++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 74fedd9c5ff0..ab26bec079d6 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -17,6 +17,17 @@
 
 #define HYP_MEMBLOCK_REGIONS 128
 
+/* The maximum number of hypervisor protected regions from the host */
+#define PKVM_PROTECTED_REGS_NUM	8
+
+struct pkvm_protected_reg {
+	u64 pfn;
+	u64 nr_pages;
+};
+
+extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
+extern unsigned int kvm_nvhe_sym(num_protected_reg);
+
 int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 5cf7c4a0ed20..500c18c2fd48 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -28,6 +28,9 @@ struct host_mmu host_mmu;
 
 static struct hyp_pool host_s2_pool;
 
+unsigned int num_protected_reg;
+struct pkvm_protected_reg pkvm_protected_regs[PKVM_PROTECTED_REGS_NUM];
+
 static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
 #define current_vm (*this_cpu_ptr(&__current_vm))
 
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 75b00c323310..64c0290da888 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -284,6 +284,26 @@ static int fix_hyp_pgtable_refcnt(void)
 				&walker);
 }
 
+static int donate_protected_mmio_regions(void)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < num_protected_reg; i++) {
+		ret = __pkvm_host_donate_hyp_mmio(hyp_pfn_to_phys(pkvm_protected_regs[i].pfn),
+						  pkvm_protected_regs[i].nr_pages << PAGE_SHIFT);
+		if (ret)
+			goto err_setup;
+	}
+
+	return 0;
+err_setup:
+	while (--i >= 0)
+		__pkvm_hyp_donate_host_mmio(hyp_pfn_to_phys(pkvm_protected_regs[i].pfn),
+					    pkvm_protected_regs[i].nr_pages << PAGE_SHIFT);
+	return ret;
+}
+
 void __noreturn __pkvm_init_finalise(void)
 {
 	struct kvm_cpu_context *host_ctxt = host_data_ptr(host_ctxt);
@@ -324,6 +344,10 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	ret = donate_protected_mmio_regions();
+	if (ret)
+		goto out;
+
 	ret = hyp_ffa_init(ffa_proxy_pages);
 	if (ret)
 		goto out;
-- 
2.55.0.654.g21b8a5bc05-goog


