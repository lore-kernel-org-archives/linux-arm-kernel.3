Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60ECC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwV3+W7/ehj+b6ug0rN7nGCOEi4xiU5YZ2CQkSQ6/UA=; b=yyU5HMj7+GZVBwMJjuRPj5a5o7
	+VSqmCjbCzz3aXTqXTvYqYt3xTptsp93qghO+qV3UwVQ6AyUreqWELLJrCEs5MF2OqZHOwOviRiPc
	ho3qMQRqSYbRYIqXvMuFO2N97Qcm+FiJEoS2ERbCLM6lNvvOMWUiOeQHNMOupECu43ZpX5ZJom0Uu
	EyxuY8HIRKa1hRyXEfe1YKgrBdbFbsWvkAPO7MNRCrHat+fT/YIZveBDUFRJ3hDiACU4sDSbqDpqk
	Lrlxu2KAajAzOlgXBmqgDRFb5Z/R6NgffMPdc26iw27V3zyzNaDR+AzJXS/3A1rsHkagHa1HWU383
	sCW/SsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubScm-00000003Xwt-0aU6;
	Mon, 14 Jul 2025 23:30:20 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS98-00000003SUx-10Po
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:43 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-876a8bb06b0so880632939f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533981; x=1753138781; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwV3+W7/ehj+b6ug0rN7nGCOEi4xiU5YZ2CQkSQ6/UA=;
        b=UyxflylWZg4eqgxFpiGksUH4KPw4DcUa5k982THatbSSGOrPJoHhvypKGlclNMwhKX
         yy8anTRrgQFNnR9du+U5Qd13wrtZecPZhC2pvGVqPDnCUN/YDkdz0p+uB+OQtddr2qhD
         cnn2lrI5hxT0L5/BirfCOtkRwbNS9uzHgLj+YfEDstvxk6ip0qwRnsnlbrOF8/FwJTfm
         ypd8YaoCyQ04jxzaa+Z+D/pjAwVQNxA5oHdzdlXORfWXqCz6UI2ay1mV9rAr0Ltb8lmC
         q3Jrg22UFj5DFw29oA5pL3bsnrOtZanrtuBPkga2SFii/vTj/aG4etOXQKGxNrjOEj0L
         60TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533981; x=1753138781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwV3+W7/ehj+b6ug0rN7nGCOEi4xiU5YZ2CQkSQ6/UA=;
        b=FOVqbzO60X8nAJZ+ByKqkhuP2GW+w3LBpcteeKRd1PIpMBgcBZGneaOVR2Hgh+x8CA
         HKPmX3wwvZ1LW47O3XGBp/aLRX3v8trECcGayv1sbgmfAlQXN+e3pKQhCKKxPR7P7rTH
         wqjtMKGAo6dCFpdzL0Y6wZVJo6UVPrSr2Dk6CeiIdKcFs97nTlZRPSN1GGxkAbF1dIiH
         D5hQRsasQYqCbBxFd/tJPEXV5Kydt39o0iuG/naiqzaWCtAmssKhJje3kHbw2DTbd5Os
         9NTWNoT8PEeLfNBFhJTRapBD1EqLcW42eggA763j/vfLak4LMRYGYX7cguV4aElex5Is
         BfDw==
X-Forwarded-Encrypted: i=1; AJvYcCUvQWVHvJqSO4s8wV+UKJyrjsc6MgqKLQyt2SOo5kyaUM0PV6h7Y2og6ax30g7tiCcDsOGx1CNlS6c0od/IVOUx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Vxf+BuRhJPoWd95WDFlxeNRVf7vhHw6k9bZcUbI7EQbT5lxI
	PU+mk+89ykzxDVVRSFPaBkz/mibOmqOJqf0rT8agc3lBBsVLXdv5P4sBmvjSJU7MBLhbjeKksYY
	/bFQJzddRe1/WWAieaUUDmgw8wg==
X-Google-Smtp-Source: AGHT+IG6/Fx4XUt6OiaJ27GEFxRfFyj/zm2cocalWyZGbwfyqaLHqaZuCwZo40dqJJR4NG/NpTcvClqhKJzVbklHQw==
X-Received: from ioge24.prod.google.com ([2002:a6b:f118:0:b0:867:188d:7f6c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:2c95:b0:861:d8ca:3587 with SMTP id ca18e2360f4ac-87977f7198dmr1861411639f.4.1752533981283;
 Mon, 14 Jul 2025 15:59:41 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:05 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-12-coltonlewis@google.com>
Subject: [PATCH v4 11/23] KVM: arm64: Use physical PMSELR for PMXEVTYPER if partitioned
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
X-CRM114-CacheID: sfid-20250714_155942_277939_F87465A0 
X-CRM114-Status: GOOD (  14.23  )
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

Because PMXEVTYPER is trapped and PMSELR is not, it is not appropriate
to use the virtual PMSELR register when it could be outdated and lead
to an invalid write. Use the physical register.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h | 7 ++++++-
 arch/arm64/kvm/sys_regs.c          | 9 +++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 27c4d6d47da3..60600f04b590 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -70,11 +70,16 @@ static inline u64 read_pmcr(void)
 	return read_sysreg(pmcr_el0);
 }
 
-static inline void write_pmselr(u32 val)
+static inline void write_pmselr(u64 val)
 {
 	write_sysreg(val, pmselr_el0);
 }
 
+static inline u64 read_pmselr(void)
+{
+	return read_sysreg(pmselr_el0);
+}
+
 static inline void write_pmccntr(u64 val)
 {
 	write_sysreg(val, pmccntr_el0);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 704e5d45ce52..e761538e1e17 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1063,14 +1063,19 @@ static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params
 static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			       const struct sys_reg_desc *r)
 {
-	u64 idx, reg;
+	u64 idx, reg, pmselr;
 
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
 	if (r->CRn == 9 && r->CRm == 13 && r->Op2 == 1) {
 		/* PMXEVTYPER_EL0 */
-		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, __vcpu_sys_reg(vcpu, PMSELR_EL0));
+		if (kvm_vcpu_pmu_is_partitioned(vcpu))
+			pmselr = read_pmselr();
+		else
+			pmselr = __vcpu_sys_reg(vcpu, PMSELR_EL0);
+
+		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, pmselr);
 		reg = PMEVTYPER0_EL0 + idx;
 	} else if (r->CRn == 14 && (r->CRm & 12) == 12) {
 		idx = ((r->CRm & 3) << 3) | (r->Op2 & 7);
-- 
2.50.0.727.gbf7dc18ff4-goog


