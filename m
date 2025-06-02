Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F93C5B555
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 19:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkgTT4wWRbZ1NUmf838c82NeTMr3HJQoA5BVqQ/v/iI=; b=ITXJY6AISDMZ+xtwqINjuMKTvm
	KrL8GrzW+I3aJMPW7nDZqWoMJMywvTO6UNR5Az/SISQ+MgI6wNKfVrt3yggm8G3lQIgB8cpqlsCX2
	4Q/sdTpzMkSfDhCRMHxE+Eb4QuNevA0JYfa11a4c6DoFxUlabaA5EgzyST5hM6Illsp1x0WAwPxva
	p1Gqkd4LFLmfElwQ90YzRK+JaYCDUQQr7VXcvTtxxc5/VJXA2MYKrtoRrHcPLEyWhQM04MmT/F/h/
	vPDgiGTc+end2pYjiLDQs73QOjQKZCEMrrIY9QiwC9RIgKVnZOPgPCsvZY3WcPlvTmGSqTQlwJiwy
	zv1fDa+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBIo-00000008e1F-1X4K;
	Mon, 02 Jun 2025 19:58:34 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqN-00000008UKq-0JFI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:12 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3dd759fd518so53100795ab.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892550; x=1749497350; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hkgTT4wWRbZ1NUmf838c82NeTMr3HJQoA5BVqQ/v/iI=;
        b=KJwdB5adO310xdwiZH4QjeVjecF3+y6VRon50MCQdkSqhB4IpqAlJ93sn767MUlpMj
         DnT2OUOKHXSp4h7QHKZtgOHCkcqjQkEuwke2XJqwh4RmkxRjB6K6Z/+ClHJZ17+dUEL6
         wR1Sm1BI/1Q+UL9Apd9cTslHpQysNav258cw9akuPfzLLrhHKykTf15SRTinxgOOYuWt
         DvioYMDc9EVVahq1g6LtEd1tRcz51LLRKvqVTmwB5Xuz+B/E47Cl/9sCUzBf7lRfgfYu
         iM0Mtpu0U3MeU9ZsvQ2u0FqJ77SI6f9NK6mdDiaRSdG8i+dN1fEBikR9imeuWOiMdXiq
         kAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892550; x=1749497350;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkgTT4wWRbZ1NUmf838c82NeTMr3HJQoA5BVqQ/v/iI=;
        b=YHMWCQQmhbLlxwW6nfVRI0p2l2u8ygNg0YwPBTtAoR+0QDG3D3ZGGIftKoz5DI3Q8I
         /MjWAUdkBHCiZ0gnCr21jKao2/MptF3+JlH36OaNznLxKvHvOhAikzeljdrejziVG53F
         NVY2Vlw+BXMOhR7rpIb8YdLweX9SRaihZKSJwebnhP4YyD6er6Lqba3wrUamCy0ZqbxV
         6c7j2ANAmmFEUZ24DeVcg8d+ZQrShJsOX+xSJV7Fg0SByaqwPnm2JGB5Pg1XjqxCxUvk
         wdiGXxXErGGxaehkhLstjP6Cy8XQi3EgCHy/4TmWCVMt9G/LAHfs3OayubF9kyqiof9y
         rIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXncegIFIQCdDKtSRGsBG0eo3+syrojpsT799USLOYFUiLkIM53OrrRqKmPjtMfHIK2dqX8im6ttg97eJZNxa4Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5s4sRIOZ4LwhrNr1Rt5pn4nuYRblNFN5HoPfKsUT5BpCNVRuA
	xB/UUCai/YJybNd7TnIn10LIJckKL5BeqHqAo/dfKqiy1arbZZmvDy/mXNmJtcKaXgloSJ9ORZw
	t+Ti63p4xLb5TVHQqfXWFTVrfuQ==
X-Google-Smtp-Source: AGHT+IH/msiP+hJPT5a6q/xsva/w/itdMQOY/9ZqIFVxoo9pak9WnZnc3ACatvAhfPGVJEVfjUEYVcYY8x4wERvcsQ==
X-Received: from ilbbl7.prod.google.com ([2002:a05:6e02:32c7:b0:3dc:7303:c8cf])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1fec:b0:3dc:8b57:b76c with SMTP id e9e14a558f8ab-3dd99be4926mr150059925ab.9.1748892549700;
 Mon, 02 Jun 2025 12:29:09 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:57 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-13-coltonlewis@google.com>
Subject: [PATCH 12/17] KVM: arm64: Writethrough trapped PMOVS register
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
X-CRM114-CacheID: sfid-20250602_122911_112645_6DDDCE7C 
X-CRM114-Status: GOOD (  14.11  )
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
index 8eee8cb218ea..5d01ed25c4ef 100644
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
index 377fa7867152..81a4ba7e6038 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1169,6 +1169,19 @@ static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	return true;
 }
 
+static void writethrough_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p, bool set)
+{
+	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+	if (set) {
+		__vcpu_sys_reg(vcpu, PMOVSSET_EL0) |= (p->regval & mask);
+		write_pmovsset(p->regval & mask);
+	} else {
+		__vcpu_sys_reg(vcpu, PMOVSSET_EL0) &= ~(p->regval & mask);
+		write_pmovsclr(~(p->regval & mask));
+	}
+}
+
 static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
 {
@@ -1177,7 +1190,9 @@ static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
-	if (p->is_write) {
+	if (kvm_vcpu_pmu_is_partitioned(vcpu) && p->is_write) {
+		writethrough_pmovs(vcpu, p, r->CRm & 0x2);
+	} else if (p->is_write) {
 		if (r->CRm & 0x2)
 			/* accessing PMOVSSET_EL0 */
 			__vcpu_sys_reg(vcpu, PMOVSSET_EL0) |= (p->regval & mask);
-- 
2.49.0.1204.g71687c7c1d-goog


