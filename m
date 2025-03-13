Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCB6C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7fhBUFv13S4cZKboUgbYf/t6ZbQKDXA1phxFoEaqP4=; b=zs91RuHfPHM5yJ9zAxDevFVES3
	NPHiLNmEbYJZMiTlCcpgfjTIioVA04vtLKjKNk8GWEqSWf6FWrRtqUaduxTHNfhgS9qpRJ7kmCgj2
	bZegn6vU8cUDOzlwvM323BiZVgmnd8P/J6KoJdJzX0na39u71WCLe84uVA7rSG+w86M4iNoWmK/HX
	z+gofLFsqC8Na7Sfsbgnh11QIgzKg5VGE2ONTAnlvf7PCQJqREpK11i33JmBCBFY6rI/13vKIEyhB
	7bTaW+1PGHPlqG49evwlA38vRGgeN4u+tptvxcoNpiqH3Xpg4sljAgaAwl2U/93xQQ/AKq7mmRyP1
	H1M9qaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tscj2-0000000AJz4-1yny;
	Thu, 13 Mar 2025 07:11:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tscWT-0000000AH5H-0whw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 06:58:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-223959039f4so11262505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 23:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849108; x=1742453908; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7fhBUFv13S4cZKboUgbYf/t6ZbQKDXA1phxFoEaqP4=;
        b=JvSxVGfBZLBVtFbB7sCzN7W1qYFRHLabev0QUSTCfD9DwM+EiY4pQjbUQdW7gELt7h
         v+W7XggfTlLTRhB/srbNvbC/oYu1hDF9IxwuczswaNnXqpgiqN62rMrjT3cruTt4t5dB
         xmm1BalJ/lVVAgMY8Z4EuzDfE4E6hBSwxfcUqtUjn7G7IqT+MbuD9JszABkLGbqEiFNH
         maJ99SVXxklOXg85jp/WctwRGn41JDFHCJ9kCRmVJ85lSM72ST57rZxO2Snq4wLp3i0n
         dGGRNJehXDxB7Fx5lS4x6Q+oofNx6ZEqXP0vY80DeiP+9Z/JpwSA1mE8X923S52XKytN
         BRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849108; x=1742453908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7fhBUFv13S4cZKboUgbYf/t6ZbQKDXA1phxFoEaqP4=;
        b=T637xBG3TMImPAhhXlcIl9aZMp+vEmrQwY41aVtdT4VhEsH85dj8KrfTE2qFoX4n/I
         A9XO/QezOfzoB71Zapevqn/yFdL85XHm2mikiZlTR0Cd/2Z/3Epc+a2d9Xjbz9UFU5jM
         2L1FD5/VvUC39effNS3DSEQZ4xnf/dShbLAcSQW4qpKh0dDvezmKfeeFPboCkGKb3yhJ
         bZx4jYc+CFryPimSSQYsXKUViXF+MEiqsc3ec5dTkT4KvD03LUJ1Ayl4LPbQ/CDsskGm
         Qk/xRojh7Dys4yHjLaeM/aUKPkSP6AgmIuhV6bnUjClf3MXw4TrmAVtQ0FdRpHNiIjf1
         pQrA==
X-Gm-Message-State: AOJu0YzUvhlqvVuAmj2krCF7FWgvC5bNXtjQ4WMBTKUEmrl+Z8TgVoH/
	UlbYe++Gl30cXYaY4KP/8g4u8YPxQ9ZRY/UuLlvWhPNNmC2hulgTARVB+aRvzB4=
X-Gm-Gg: ASbGnctIfEXw7HIyEfUIfZMycQ2JDJu7MSn9tHwT104uN+/UlZzl5HGa7geIPygOrgd
	i6ugHQMy1mMZZ4ZI1SrynQnTs6C6sOZcBLKgeePc4sScYO6Vb1UWx6pk+9zYlwXS2X1qpNdb9NT
	Wp7loCVy5xv4W9CuYaky9GLsCCg2c35DkPmtJqn2bawP01do1ZvZrkN2gqU6vNUA7bpfb5y5FUt
	pExA3VnidDu11NUzVFIlpCth+O3ceewPu6qioDtEgBQ729LumOIvClM8dWohaFFb00mOxNZOtmb
	iDQn2HjQg9IqyDnujP9aYwXy/rHoHeQzwWB3X4Eakdc+mTOp
X-Google-Smtp-Source: AGHT+IF+TgNoMe5M/byYKEN+EBcKDv/E4YdTnk5/x7Qy9/IKHZJiaku/6SW8IuLAbysNFNl6dwBYew==
X-Received: by 2002:a17:902:ec91:b0:223:5e54:c521 with SMTP id d9443c01a7336-22428407e93mr350878545ad.0.1741849108400;
        Wed, 12 Mar 2025 23:58:28 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6bd4dabsm6447105ad.233.2025.03.12.23.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 23:58:28 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 15:57:48 +0900
Subject: [PATCH v4 7/7] KVM: arm64: PMU: Reload when resetting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-pmc-v4-7-2c976827118c@daynix.com>
References: <20250313-pmc-v4-0-2c976827118c@daynix.com>
In-Reply-To: <20250313-pmc-v4-0-2c976827118c@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_235829_267261_873FBBC8 
X-CRM114-Status: GOOD (  12.55  )
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

Replace kvm_pmu_vcpu_reset() with the generic PMU reloading mechanism to
ensure the consistency with system registers and to reduce code size.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 14 --------------
 arch/arm64/kvm/reset.c    |  3 ---
 arch/arm64/kvm/sys_regs.c |  3 +++
 include/kvm/arm_pmu.h     |  2 --
 4 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index dfa7048a3e2a..62b1deba9856 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -248,20 +248,6 @@ void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu)
 		pmu->pmc[i].idx = i;
 }
 
-/**
- * kvm_pmu_vcpu_reset - reset pmu state for cpu
- * @vcpu: The vcpu pointer
- *
- */
-void kvm_pmu_vcpu_reset(struct kvm_vcpu *vcpu)
-{
-	unsigned long mask = kvm_pmu_valid_counter_mask(vcpu);
-	int i;
-
-	for_each_set_bit(i, &mask, 32)
-		kvm_pmu_stop_counter(kvm_vcpu_idx_to_pmc(vcpu, i));
-}
-
 /**
  * kvm_pmu_vcpu_destroy - free perf event of PMU for cpu
  * @vcpu: The vcpu pointer
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 0b0ae5ae7bc2..7f44539bc822 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -201,9 +201,6 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.reset_state.reset = false;
 	spin_unlock(&vcpu->arch.mp_state_lock);
 
-	/* Reset PMU outside of the non-preemptible section */
-	kvm_pmu_vcpu_reset(vcpu);
-
 	preempt_disable();
 	loaded = (vcpu->cpu != -1);
 	if (loaded)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 11718c635e2f..307ce37d0434 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4262,6 +4262,9 @@ void kvm_reset_sys_regs(struct kvm_vcpu *vcpu)
 	}
 
 	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
+
+	if (kvm_vcpu_has_pmu(vcpu))
+		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
 }
 
 /**
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 9c062756ebfa..8ec6296c5917 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -45,7 +45,6 @@ void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu, u64 select_idx, u64 v
 u64 kvm_pmu_valid_counter_mask(struct kvm_vcpu *vcpu);
 u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1);
 void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu);
-void kvm_pmu_vcpu_reset(struct kvm_vcpu *vcpu);
 void kvm_pmu_vcpu_destroy(struct kvm_vcpu *vcpu);
 void kvm_pmu_disable_counter_mask(struct kvm_vcpu *vcpu, u64 val);
 void kvm_pmu_enable_counter_mask(struct kvm_vcpu *vcpu, u64 val);
@@ -108,7 +107,6 @@ static inline u64 kvm_pmu_valid_counter_mask(struct kvm_vcpu *vcpu)
 	return 0;
 }
 static inline void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu) {}
-static inline void kvm_pmu_vcpu_reset(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_vcpu_destroy(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_disable_counter_mask(struct kvm_vcpu *vcpu, u64 val) {}
 static inline void kvm_pmu_enable_counter_mask(struct kvm_vcpu *vcpu, u64 val) {}

-- 
2.48.1


