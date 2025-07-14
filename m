Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EE6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKFKaT34CSY+XrjUi/PaqmOwj/haOI4Kmp3zrewTJxs=; b=k0oT7v6drZcwX4kfTKtJS8NIq9
	JsVXffAZRNjEmV3DzuqxRyUP+5jQ4D25ku+NqzbRdWUoJtmgjzRcWgGo1XKONKUrR/pgReo1k2H89
	FnNRmH8/6zvH+FHHQiIs5KNgrRSOZoPVc8tMwWuu3BMZUKqpf0gxj/jvlLqL45eySqGS6eF1Gjgmv
	rh3vA374AsOeVY/D7Z6bQxMZWUlqBFSnhdbkRJq32vNLuupAGySpjd0DRVIFIIUrZ7nYII99ERqOY
	PhopWIrnGVeb/u+eDL5Ul2hkhl0Im8suo1zzMQCBaIsgyqXWPnwHvOSybPL8fDOmnlhjqNTRcQTh0
	R2fXfL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSfB-00000003YLg-08YK;
	Mon, 14 Jul 2025 23:32:49 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS99-00000003SVR-1EkK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:44 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86cfe68a8bbso350052039f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533982; x=1753138782; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HKFKaT34CSY+XrjUi/PaqmOwj/haOI4Kmp3zrewTJxs=;
        b=KxZYLbClsNTU499fUqae7ezXkxJE6OTE1J0tTT+xj1Ghdp255u1a2hC0CoeR2BfIWE
         wvPca2Rh7+5TPpIEWcg0kc5lYM8CSwoTfTd2KqYKHtpTxjYXKGJd8LOgKFBCa4elvieR
         CCuyIZy5+YePMRHTyEZiTuY5YupiO3jf/VVXfqwDGvQpm1qJnRHxaBEIrBn/ZU/DVuyr
         xpudjqxq5PoNZGfIT3ml7LJ5RWLwWisYozxssclyNYzV2kQTDLk/Qq0ASByB/g1Hk833
         JSshG/wZFrymdx7wq1c3V3Wrb9yXvy5SpivrdfLpN0gYYbIkIsVsuo8fHQaP9XcI6VxA
         gZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533982; x=1753138782;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HKFKaT34CSY+XrjUi/PaqmOwj/haOI4Kmp3zrewTJxs=;
        b=YTucxlArcIAFQCDGc0HT+OEqfRKQWOcVvUGIPfUsCVMcQl/UHsiy5sgitB4RgY25lc
         vtTK96kOEKlaaOnQwAczvhr1eaJCfRekjviEIySFKFRzGaneDcaR7ElM7eH8Qvcl1knd
         9+rkMa4o4xN6D49lO5AXaLvg+eixoEIs8rkqCKgZ+A7KYN7UaeEV9AndJNyd6vV+qIXI
         NwVsmbyZIdwmgKC03qW72K3oOrZQlfaies5qL//7mkMsattTFQ/rX0fz/OxHFxmaaxZL
         COwTMTjvz3f1otR4seQrJamMFXAQSLkLZ3Dk9msOjAu+muW6hwDnfX5NFfyFEC8gdsOT
         sWGw==
X-Forwarded-Encrypted: i=1; AJvYcCVHr8iJSIxaPt69OGU/hm6iP12r5PMUA99QkPsbbXEJyvTB0et3VfeKfysu+ba0ZX/zIU7XD5ANd7MCKshs8RmO@lists.infradead.org
X-Gm-Message-State: AOJu0YyK7h23l26sp60wP8TlkYoVF2S4W+fleUzHtMRmvEzFEKEgCsf6
	aZvl5bVGu2BSArUrur7chtN/pXhtTlXvZx4GY0gBXgRfBxHwnEgs8YUZZX+4iEVVhN45791dnNM
	1vurWGn8Y/rEWLsGjSfQOVgBDeQ==
X-Google-Smtp-Source: AGHT+IFHDkydm6wR47l1+EJ847BUB3r6NTWQGkm6LnVFFK97D4N3qaxOkSTSlfCSEPiOoL+l6dOgeUU/KUc+l3ngkQ==
X-Received: from ioy17.prod.google.com ([2002:a05:6602:a111:b0:876:c211:2aad])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:4019:b0:876:7876:a587 with SMTP id ca18e2360f4ac-87977e98946mr1665370139f.0.1752533982373;
 Mon, 14 Jul 2025 15:59:42 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:06 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-13-coltonlewis@google.com>
Subject: [PATCH v4 12/23] KVM: arm64: Writethrough trapped PMOVS register
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
X-CRM114-CacheID: sfid-20250714_155943_335108_CC0BAFBA 
X-CRM114-Status: GOOD (  13.95  )
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
index 60600f04b590..3e25c0313263 100644
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
index e761538e1e17..68457655a10b 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1171,6 +1171,19 @@ static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
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
@@ -1179,7 +1192,9 @@ static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
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


