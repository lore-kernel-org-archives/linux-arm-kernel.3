Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D753D3B997
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJ1EthCH6ONdnoakqWvxYQ6ZZxvXCgKuA673W4BNIkM=; b=CshhmU+QUKvjoODLN7ThRCtTy6
	qjA0LWsUGHqiZVfd9sqRP7kTkkBBUySdmYeEpQ7PK7g0EriGpH2b6Yer4zCTYAsFSq8RNKcGLTEOK
	emyGoVy1RO0rkH2Llghkdhe5WAZ5HxQJ3TvVa/T5q7YAiP4V20S+12K6VBR7HkHZTu1eisk6PjCMO
	RGJqPzEAuxGI30NF+4U1JZfM4F+3Icqpqp6QIRwMHjWzVOXqkWehhxIgx97NtjH16IgWrOYo8dA9z
	7/mlp2saQ9PiataMmFN2HGW2S3LpMzALyHbYt3Dqx50Y1SPk6Vdg18U4OiQ6Yfq7gQLIRyeWAu0eZ
	rTDmMo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hZ-0000000EkzH-2FiB;
	Tue, 09 Dec 2025 20:52:54 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hM-0000000Ekhg-0y8K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:41 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-6574d564a9eso8079491eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313559; x=1765918359; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AJ1EthCH6ONdnoakqWvxYQ6ZZxvXCgKuA673W4BNIkM=;
        b=SeWzZ5xc5xQrfRe+c03mrK1kgzr0pL1K2S4m8Tx9TSlvAv+x5jTUekqknI0Ib28SIi
         SY2cmJMH0QLbVMta8SrTyEg/jPH9oN3y8ZbT8loSRzUB7N/Jqt49G+2OidJ86JedxGJJ
         t+KVJervTnkLxsyzixbnvj0R7tyfpLIhUHNLJ26ZIUaU9K34uWhy1eiwE2L5vpkEhIxz
         D4yIcrjQ+hC8ycmSIXgB2vR33j3hmf6GyNPrtE7uxcOhA18dgO68dcJW4PXL8JzHr+ri
         kBJxbQZ8u0Wt/5RmplBClUyb1KPDCvjif9B5tu7PxD6KIKjejhw76h7vDINgrVMExL0l
         sA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313559; x=1765918359;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJ1EthCH6ONdnoakqWvxYQ6ZZxvXCgKuA673W4BNIkM=;
        b=Jh/Ptky+p1cnFvIjaFCEwGJjIG8lObLmAzpAuWrVElw0vYMsMYXlGRW4GMB8YqG3Ql
         mpq/uY3F9vIY2O9ypGgkRDaPrwq/oKx1hKD/0K8S94eB8Vl9KNOAeJ1PyDJATSJofmmK
         uE6OgkvN3yadmmCjMtOL/6ZzEiEjCUAPKFpkJMUt6FJCqCotZMdUY0d+7XnmZ0vMklUt
         E8OVOQ5UcHGvhGlAoOKv+7fDo3w8VC6GXL4rmmXGF5qibi0QfmEvLSH4N12OJ/0PwMTC
         oDGT5DiB/BraLGP/kWRQxq5AmIlxByWotK2xXc3yLK4n8f7lZ3zb3zYIulIWizl/QwNX
         A9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXUB6TTTDKiWCS0CigBqr5lxo79PeKeG/WFQQKsWMpKC+Hp9s64QqW+ZL2SmwbT1NJ6zk++Rig/R8thjLEHpXkx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1PPl2nGx0qQPxi0qmEJEJ0BV2a/PhyJE3tTRqT3MLQuv+2P1O
	7W5wP8C1MlTYdrFyiV80pzdijGOyNV+OBVHG1c9WYE6nMgimMHr9S19Nvnod6N/nq3m+JH73blZ
	SdnaiQquVCPboRpcCoGbr1EstZA==
X-Google-Smtp-Source: AGHT+IEXFAGDtIzcAMUsWr76V/QsGbzsYAGUdLx+/ZdxOcslRVX0AGiIPoGFGxMRz56nzOeGb3yai/VbNoKlqj0WOg==
X-Received: from jabgz26.prod.google.com ([2002:a05:6638:6b1a:b0:5b7:27fd:4267])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a4a:ee05:0:b0:657:717a:8c8 with SMTP id 006d021491bc7-65b2abef8e5mr121600eaf.3.1765313559184;
 Tue, 09 Dec 2025 12:52:39 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:10 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-14-coltonlewis@google.com>
Subject: [PATCH v5 13/24] KVM: arm64: Writethrough trapped PMOVS register
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125240_282870_2E2EF71B 
X-CRM114-Status: GOOD (  14.03  )
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

Because PMOVS remains trapped, it needs to be written through when
partitioned to affect PMU hardware when expected.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h | 10 ++++++++++
 arch/arm64/kvm/sys_regs.c          | 17 ++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 60600f04b5902..3e25c0313263c 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -140,6 +140,16 @@ static inline u64 read_pmicfiltr(void)
 	return read_sysreg_s(SYS_PMICFILTR_EL0);
 }
 
+static inline void write_pmovsset(u64 val)
+{
+	write_sysreg(val, pmovsset_el0);
+}
+
+static inline u64 read_pmovsset(void)
+{
+	return read_sysreg(pmovsset_el0);
+}
+
 static inline void write_pmovsclr(u64 val)
 {
 	write_sysreg(val, pmovsclr_el0);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 2e6d907fa8af2..bee892db9ca8b 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1307,6 +1307,19 @@ static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	return true;
 }
 
+static void writethrough_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p, bool set)
+{
+	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+	if (set) {
+		__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, (p->regval & mask));
+		write_pmovsset(p->regval & mask);
+	} else {
+		__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, ~(p->regval & mask));
+		write_pmovsclr(p->regval & mask);
+	}
+}
+
 static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
 {
@@ -1315,7 +1328,9 @@ static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
-	if (p->is_write) {
+	if (kvm_vcpu_pmu_is_partitioned(vcpu) && p->is_write) {
+		writethrough_pmovs(vcpu, p, r->CRm & 0x2);
+	} else if (p->is_write) {
 		if (r->CRm & 0x2)
 			/* accessing PMOVSSET_EL0 */
 			__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, (p->regval & mask));
-- 
2.52.0.239.gd5f0c6e74e-goog


