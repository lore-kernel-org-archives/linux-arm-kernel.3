Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B80AC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCeKccnUmGK0t6piLYL2X+QAR4eGmRxuwVO46fLii9o=; b=al/QVJYAfjxYIRJmUuN6sXYsy5
	SchqpzYnpW2v9hUz/emJoUq51aKSqTpLl411xpSb880TpDyhVZU0y5hTXvK5PBghOHsXYaXD4V8ZW
	Sx5S68WGB/G8ZryRyka2BmHJ5IELFAvdPW4BK2830u48RIS9olN0/XfkTXAMcG4YDoqtHKonp3dh9
	5r4K7KhZDB/wjOWzMzMVSKFI3nAAAgAG8fpKUy/D4x4lLZAB/qShjBzfgG2tZBj5j/2yS/daQebCa
	EEHuPrhBMhoZ3SAEjPqxdm5junRfXZ3/Tkj+tey+AsjxKVpDA53HD85Dk9ImXnKZQBGlXuo1L6qny
	JhaDcXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSki5-0000000Gm1P-1LNL;
	Fri, 20 Jun 2025 22:59:49 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4W-0000000Gh9L-1IKH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:57 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddc9e145daso42729145ab.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457935; x=1751062735; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCeKccnUmGK0t6piLYL2X+QAR4eGmRxuwVO46fLii9o=;
        b=TXZprVUJwzJF54Hgi4cM2swrVPTPB9oCygwREh5E8uohsKXUKNn+7d7OCvIKkw8cuK
         UNb4jBkutBhhNrbl+uKerGCIlT1wlVag0ceqmMQCYR/JKKwqAu7TASBdoJdRhySfE6J8
         Q/BZtADiDKWai65AzE07KIf6zqLQGyzmcxbnAqYty8NdCUDi5PHesFAMxqO7pVDFLUDd
         ND3xNZdJ3R5OuOOXcNXo6gRjcfadI0Twz2bsQW86c4gqZETfgOfCbberATc9+rtc4Dfh
         kQ5vFfizfn0fQP0G4cvoH3mZm3DDF5qzhYbI3ERPF2ZIUFfmiqElqEcD75WF9zV4oaNB
         c5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457935; x=1751062735;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCeKccnUmGK0t6piLYL2X+QAR4eGmRxuwVO46fLii9o=;
        b=VGonkL34ctYXhM/ijhzbpuCycjVKczM/IRZwe+3Y3kDi9GO1AjXl5lxEkkN85ra2i1
         nCgkq19FePjPf4P/zU+ehBmKbjl+4rx0cWw8OGJkdoesxf/XfU51UvAjMzLWELn0Zo1u
         9uJxkPkB1mXFvhT4PUGv+Y9HzvGqJ0uVEULMUlt1ASlyWolLeSfo2iuByStLCDALeklb
         +MLjzKC084i+F3EVF8AVW05DKgT7LgFtCSJ58t0OkWkX6w0sMUa6ssLLm6Gq7hUq6wsy
         sor1STU4b/Uq2Zum24h4i1D730IDf/jiUzSzGSEr3K+N5gMNJaE54Mx67os9iNLwPm1l
         O3/g==
X-Forwarded-Encrypted: i=1; AJvYcCXtOwmIxkJssyYpJWr+J14sCPYSovtTPQjs9rGoWbYBFl74LavTVKZgaW6A0DQnjpEN0F+Y2R7OLK6KTYO7A2Oi@lists.infradead.org
X-Gm-Message-State: AOJu0YwotqLLHB0aYzXbj3NxHGLgFnDUA45HayvEwhfDQv441vumStZr
	Kt9V/sdYI5DTHETeTETG5aIzZ0QnpX7tx7mstuIiA5ugtrtp0ftUdu2ynnsfgUpJzxUMUdNq639
	/q86jYqHMUbolzXrlV1YrmbqVYg==
X-Google-Smtp-Source: AGHT+IGAgAXt4VAt9nwcok51fvIV/dFkwYe009yCTofFAGBTMKz3erZRuxZTNNWRigmqT+1olC2QwZa0BzFYekCXXQ==
X-Received: from ilbdi5.prod.google.com ([2002:a05:6e02:1f85:b0:3dd:754f:1dc4])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1fc9:b0:3dd:edef:894c with SMTP id e9e14a558f8ab-3de38cc04cfmr43152805ab.14.1750457935204;
 Fri, 20 Jun 2025 15:18:55 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:18 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-19-coltonlewis@google.com>
Subject: [PATCH v2 17/23] KVM: arm64: Account for partitioning in PMCR_EL0 access
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_151856_345025_7F350811 
X-CRM114-Status: GOOD (  12.96  )
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
index 90fc088ce3d3..5f0847dc7d53 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -884,7 +884,7 @@ u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
 u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 {
 	u64 pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
-	u64 n = kvm_pmu_hpmn(vcpu);
+	u64 n = kvm_pmu_guest_num_counters(vcpu);
 
 	if (vcpu_has_nv(vcpu) && !vcpu_is_el2(vcpu))
 		n = FIELD_GET(MDCR_EL2_HPMN, __vcpu_sys_reg(vcpu, MDCR_EL2));
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 1ea7d092ec59..b64b60e297bd 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1266,7 +1266,9 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	 */
 	if (!kvm_vm_has_ran_once(kvm) &&
 	    !vcpu_has_nv(vcpu)	      &&
-	    new_n <= kvm_arm_pmu_get_max_counters(kvm))
+	    new_n <= kvm_arm_pmu_get_max_counters(kvm) &&
+	    (!kvm_vcpu_pmu_is_partitioned(vcpu) ||
+	     new_n <= kvm->arch.arm_pmu->hpmn_max))
 		kvm->arch.nr_pmu_counters = new_n;
 
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.50.0.714.g196bf9f422-goog


