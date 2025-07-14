Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70293C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryTFSv4SUuWjEo9ITdyyZg4InYYKN2XpVG4LgfvjWks=; b=nD/opHfj8b7HoIegn+G6Y5puol
	12VDkiRSXFOO+9qfYVKCEtP12WKB6ckyzAknsUUkJah4gBrJ/jD06QY+O0Pd6rNtHC0VE6oQmFSon
	GYDQiDiaimOLTEfbkhfc8BhWiy3JSsxvoUhQ2H3zWkSGzp4AI2PVTHCcG/xMXhFP3mzw4CiOC5Q2m
	hmzOLapjG0tieg0qRR8y5uDlejO3vLAyEHfDPKnYTcpVp1izYo5gE9Inhv0PO0hcabU2juJCStzsr
	T/tx2pyexEB8K4TXMaRtljqDlHOGGTjhNf+/5k9mw8jiOsVxwTGI3uHlQGCCdfZ4Y5tbFGI2zPsxU
	Mrj67iBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSmM-00000003Z4E-1eLb;
	Mon, 14 Jul 2025 23:40:14 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS9D-00000003SY3-1Tbf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:49 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-413f4f1111fso3909094b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533986; x=1753138786; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ryTFSv4SUuWjEo9ITdyyZg4InYYKN2XpVG4LgfvjWks=;
        b=YPCqETRrtS8cqgRfS1eugJz21auBDO2MC8Gfn4FjnX5tBTwVDW4eNGomSbAwVnTBM9
         T9Iq7ipsppUsUYZgbZVAQpPVVgGCBtcoq2a+hK7A/SJWreunKQqOpLgYdAkkw8xXi70b
         TBpR/qnFBtsHr2pXhNXlXUfTeTiSyJoLw9pneuYR6xFA5F+R+THxeHCHeAAHPyzLc/hw
         zZOpFKo7LxXUvy92E38g/0EHi9Ob02MsAmntozrEaIb5ImWwRtTK+YDiy/g3MVixw+1o
         71AtTm4GD+t3XKBbfsstsQSJRBU3/YadgWD+9ECVT2KiGt7rZmer2qsEqtWC12be0S1/
         fTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533986; x=1753138786;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ryTFSv4SUuWjEo9ITdyyZg4InYYKN2XpVG4LgfvjWks=;
        b=vZrT22JX0S2GW1zb2y0GIc4n51nbdZmHk0S5ZjHjK7KGKDwgmZ9XtiwxGouBoiz8qm
         GNUUxinL9Ph6GA2rt0IoF/o8uMekLvcTghfpIB0bY0LCGFfP182rcLkhjoFlhUN1bGf/
         ykyrdW1BzGRWAftxBnGALqOOJ6UCnG8xkme5tnUDt3OuNpBVTyCyPhhflio6R1y+zFtX
         0Mx4Nx44rvLNbCcRHfqc7bKv3JZBOKRGbHHF7p1bkCIwaMXOQ8P7pa+c2GeGpnaJ0X04
         fig77LEhTFZr4lAIkoKghAlZFu3RPB/plFv6N3t+LzcVNKWGKGv1RwtfxZwwZIckR3p6
         zb6w==
X-Forwarded-Encrypted: i=1; AJvYcCWq4VJO9S/rmKDExQZqGDFJ7BAnMhSc1pWuDzndtglPVs4hFIT4o0EEzekDPLVQeOn0Go6weFmy3KGaZUttW+dd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtj85/i1wF5i7+MUPGITKOJy8S+0o3pFfw8I/cbcndG/h1Vo4O
	Ot1vzYzKLmj83YRj74Q9w8clxSy1fJz0vZtsoEcrkoY4qgeksySeC4PzdcEl6VSn7MzbpXYt3Gf
	gwFbCabF8MXlmuOoMXyWZ/iWsJA==
X-Google-Smtp-Source: AGHT+IH/cZ/kysTLecvFDqp/vKXsI7g6OHRQd1TfsMdUj361wwQB7SXIxVBhNRKY/b1QS1sS6spRQdB4N1nadhlFuA==
X-Received: from oibix7.prod.google.com ([2002:a05:6808:5187:b0:40a:fcea:87ac])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a0e:b0:40b:4208:7fc0 with SMTP id 5614622812f47-4150faa232dmr10429766b6e.30.1752533985740;
 Mon, 14 Jul 2025 15:59:45 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:09 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-16-coltonlewis@google.com>
Subject: [PATCH v4 15/23] KVM: arm64: Account for partitioning in PMCR_EL0 access
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_155947_407001_8B8F2DBF 
X-CRM114-Status: GOOD (  13.53  )
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

For some reason unknown to me, KVM allows writes to PMCR_EL0.N even
though the architecture specifies that field as RO. Make sure these
accesses conform to additional constraints imposed when the PMU is
partitioned.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c      | 2 +-
 arch/arm64/kvm/sys_regs.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 30244eb7bc9b..1e5f46c1346c 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -883,7 +883,7 @@ u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
 u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 {
 	u64 pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
-	u64 n = vcpu->kvm->arch.nr_pmu_counters;
+	u64 n = kvm_pmu_guest_num_counters(vcpu);
 
 	if (vcpu_has_nv(vcpu) && !vcpu_is_el2(vcpu))
 		n = FIELD_GET(MDCR_EL2_HPMN, __vcpu_sys_reg(vcpu, MDCR_EL2));
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ad9c406734a5..e3d4ca167881 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1247,7 +1247,9 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	 */
 	if (!kvm_vm_has_ran_once(kvm) &&
 	    !vcpu_has_nv(vcpu)	      &&
-	    new_n <= kvm_arm_pmu_get_max_counters(kvm))
+	    new_n <= kvm_arm_pmu_get_max_counters(kvm) &&
+	    (!kvm_vcpu_pmu_is_partitioned(vcpu) ||
+	     new_n <= kvm_pmu_hpmn(vcpu)))
 		kvm->arch.nr_pmu_counters = new_n;
 
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.50.0.727.gbf7dc18ff4-goog


