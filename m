Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D6BC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oR9vFP5SFauEza8dTMYPljjE6wfKaScNOs3wNYF4UAU=; b=we71fE84lgUS6Mg4taXhqERPYA
	2dLkM35pjgRIKK798f4VRQNfq2E8RI8o1ibVdP3NfLLi5/15zrMRlx68Jvz9SuZL7lxPB/5YG32r4
	jU+nJFqTx3JaimPXvKTWQyX265S6EPNgtopHdrw4VN7G3+PqpbvbJ4eSEUK0R5MnDJR8y+2An3evV
	12nvmQsK5ioJePFw8rDVMTFYa+vK4QfXsl/juADMEsbDLPlo2k5BKQqGDdSZXN0EH2muR25XSa8aQ
	q6iwBkqFrJNDNwDryQfwgpca26wnAQkMN46cevIOYdUDg5GpS8PuadHTEzX6huGD5EOSL0Z/HpF5H
	xkhVVDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUunH-0000000CuFc-0umr;
	Thu, 26 Jun 2025 22:10:07 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsrF-0000000Cglo-3vDY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:07 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-40b2c2e52easo646099b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968365; x=1751573165; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oR9vFP5SFauEza8dTMYPljjE6wfKaScNOs3wNYF4UAU=;
        b=VTAIkrFgxJcUwqWNQqby+J0QOeJXq12tUFasobCEu4cILRVu2L3BbPFuJGw22D99lN
         w2sH+WI/cY0l0gJUD6HzZAhndB9sKGnf2qlRe3HW9nVd0OT5y8H9MPangz4q9cIXUM1h
         SnGK5jecZizdcFIxK8BrS0mNJv3bn9ay1iYad7nxM5FzXf/LBJIPwfEf5iJdPO04hS56
         0vUa8h8GjKeqxq3G730lvF0+jIH582FW3tvKm4gu6khYdi8NytdApPI6IkreZAJx4aSS
         3mKCpx4uMNFqIH+m8PLPgC+glKILkcthoy7MEqAGI6VA9qVydqlila/7eN6wcu15Jw0G
         eCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968365; x=1751573165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oR9vFP5SFauEza8dTMYPljjE6wfKaScNOs3wNYF4UAU=;
        b=EWBu/UOdSZfaSfJg/LxBKcsur4LKjJxL9B5VeTGbhODOdaSdtfq3fGcHxB5MgD+0dX
         L8zwS6lPUwodDGTunb6IkZHWT8z1FYlweZ+X7PWd3KshjB8/dXsd1KKTUv8NnjgPYfCA
         LUZ32UBbUjOur04CB6y6LAheXPvoiTAG6MvWY2ym2yxEJa/RQhz7EHg6IgRNnnLSePwX
         uZVkI2oDIsxUZ3rP3B3BnoieOGRnmJ5EzfJAXhKuFHexSMC1ut7W13W36xeXJF6jm1t1
         Jz7x6gasMf3dZPvF7AjijBElAZ22GnIlUSrzaPkxfYtuBss5KXo+k8cdzCWnELFB7I07
         Cdgw==
X-Forwarded-Encrypted: i=1; AJvYcCUwavdeTqnhywnXue45XXnNjA8ADDHG0ddmZQdTB//Cwmglk4xLKoaFtzTotrvzvIHhqUAKzXhNpSbQRYOM3zvv@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg4HBMHPGYEh8yNsrmGYX1lzejYL/UClhO+77FGtorT0BlViSt
	JJhZ0v5mT4Yb4q9GYmbpsyX/oeelQLMbVCBj1SeN8GFjEZckWSStszRL40ZOxraLwE42SXPtJ+U
	fCnr8Yr1HYQayxP1STdIoiUabew==
X-Google-Smtp-Source: AGHT+IHKPzqyXuHjLhNaVF48d4dlM1ddP8qVK1Z3JzzP3RzzSVDOilpZen/JKG4nnFQT/I6NY42YIxRN76XnpGTzTw==
X-Received: from oobbq3.prod.google.com ([2002:a05:6820:1a03:b0:60e:fcff:daa1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3196:b0:401:e721:8b48 with SMTP id 5614622812f47-40b33c31cf5mr524973b6e.8.1750968364756;
 Thu, 26 Jun 2025 13:06:04 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:49 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-14-coltonlewis@google.com>
Subject: [PATCH v3 13/22] KVM: arm64: Writethrough trapped PMOVS register
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
X-CRM114-CacheID: sfid-20250626_130605_970200_3A565174 
X-CRM114-Status: GOOD (  13.67  )
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

With FGT in place, the remaining trapped registers need to be written
through to the underlying physical registers as well as the virtual
ones. Failing to do this means delaying when guest writes take effect.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h | 10 ++++++++++
 arch/arm64/kvm/sys_regs.c          | 17 ++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 1880e426a559..3bddde5f4ebb 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -142,6 +142,16 @@ static inline u64 read_pmicfiltr(void)
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
index 771d73451b9a..cfbce4537b4c 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1173,6 +1173,19 @@ static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
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
@@ -1181,7 +1194,9 @@ static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
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
2.50.0.727.gbf7dc18ff4-goog


