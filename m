Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7073C02196
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x3nz+sLxzv+mI2fev0uHpyDdU92jr9O5Wy0bm9zvTf8=; b=0bdu3vCGznlKwSaqPw7g7R/SxW
	qpBntmAH0j/O0zG+Aa9b5Zymtp2q6VCD3NPk01D13Bs2o9mVQp053vN2UhYmQQJDDyKcdsTczkyGW
	FqMg/ArZbWUUz7JwZbTbbZabEYSCjwE47vuzcEkqzXkQk37yQIGfNbTcc3pZ1z4frFF1PyDiAhcPh
	qNeeFS3Pw2v4kz2HcB2V0hQD9DGQv0/D6kA+28AlUsBWhBQUv4MVp8HDnECBeg/Uyw4xACf+6iRPd
	VldqqcBboF1D/GiXa+e+oh1KEv/BJfmvb1x8oOpzMH5rl9rLLBEX4OBNBhrdwe8xd9BUMkBbBVUEL
	9+goryJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQVe-00000001bOG-27xZ;
	Tue, 04 Feb 2025 21:31:06 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP2t-00000001Rv2-47wb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:57:21 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3cf64584097so47135405ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 11:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738699038; x=1739303838; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x3nz+sLxzv+mI2fev0uHpyDdU92jr9O5Wy0bm9zvTf8=;
        b=QZD5BiHlUd9U25menJPAAs0fdiF/feeg127aO/DPPY4+h2zKaL9LGwMp7HVJCyuX2K
         fqTp5weP88CGBhlwPJavyzWcDWoa6ZrFnW9o0whXyQSd5vqpz0AWlDkmdjCg1d+84JWk
         1oPzTrYG7AC9IR+W0Dh3l5i6tAdhBlUgNR3twUD3UMQpM2hGclB3LRbLTehS3mSYsrDz
         B5OCY7CmFMAsQluSw7gP2YPL6FEmB2fV5NUT+BpfrbwtYUvOKMAgmjRBTBjbsYMRjrwy
         hTqWQ6l+B2l1D6KE5LAiYUchj2BNVlCARkjuhQLu9jJi5ubcG7GF2dnoMWopk/ON2V1D
         3NGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738699038; x=1739303838;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3nz+sLxzv+mI2fev0uHpyDdU92jr9O5Wy0bm9zvTf8=;
        b=bwOLdVE33M7GmBQQXHanZsZpUYdpi+0zS0ifKKtcgxBbgp5mRmWliLUtmqkGGiD15i
         61bGXmSWS+Q8X/GgWyr0lNSLNS/fpt4V/nKUls//0J8T0O7yCjtVmjgeVwbCEYZ+eMYg
         GWQdApAEBrjhdUxL/GSstXCPF8bCZlinMPzsw6ci84p5vvcUtOvCPpNwG6/Flph5Sn5a
         T+4GritSFzpM6DvyXsPQ+HvKfpAXUvIcoF4g4LN3G4qnbh6wBc5nODKP3LUpylmQaGA+
         SXaD7Is3q/+giYEbVcOK+5/A80i6WxHciI/WGv5nmYApjay19bwcDwQ8xfWqxlGPKJSo
         P97w==
X-Forwarded-Encrypted: i=1; AJvYcCU47aTMvLnFgF5SKft/4tLKFBLy898h5pvIKu7Dqg0FKANDH4JP+qtqZcyVk1MNO6n7rrXWAR3xeKvPWsjWx23i@lists.infradead.org
X-Gm-Message-State: AOJu0YwJev8KuoFhDw10Q90p8IW9vLPvNogrou2KT/e9pVyiYL7IvkcL
	CwPK7XIGoQBdiiTUTnc7Gix6VFLfnTEjlvAd6ZRTx3CxwCMWmdCNfrXS2aY4leP2j+eA5YNc8oC
	aYdHcoKozsBCHsqFBHkLaXQ==
X-Google-Smtp-Source: AGHT+IFCbd5TbwVMrhJK2bcQCyfCgg4ls4jmx2Zok6lCN7ChS3uIDAMydUcwYx7x9fORmL8hc1+yBurzn+Nb2fztvw==
X-Received: from ilbcr10.prod.google.com ([2002:a05:6e02:3a8a:b0:3ce:8bff:8b9d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1746:b0:3d0:24c0:bd37 with SMTP id e9e14a558f8ab-3d04f459238mr1943175ab.11.1738699038254;
 Tue, 04 Feb 2025 11:57:18 -0800 (PST)
Date: Tue,  4 Feb 2025 19:57:07 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204195708.1703531-1-coltonlewis@google.com>
Subject: [PATCH 1/2] perf: arm_pmuv3: Remove cyclical dependency with kvm_host.h
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_115720_020370_694968AB 
X-CRM114-Status: GOOD (  12.09  )
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

asm/kvm_host.h includes asm/arm_pmu.h which includes perf/arm_pmuv3.h
which includes asm/arm_pmuv3.h which includes asm/kvm_host.h This
causes confusing compilation problems when trying to use anything in
the chain.

Break the cycle by taking asm/kvm_host.h out of asm/arm_pmuv3.h
because asm/kvm_host.h is huge and we only need a few functions from
it. Move the required declarations to asm/arm_pmuv3.h.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h | 24 ++++++++++++++++++++++--
 arch/arm64/include/asm/kvm_host.h  | 18 ------------------
 include/kvm/arm_pmu.h              |  1 -
 3 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 8a777dec8d88..89fd6abb7da6 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -6,11 +6,31 @@
 #ifndef __ASM_PMUV3_H
 #define __ASM_PMUV3_H
 
-#include <asm/kvm_host.h>
-
 #include <asm/cpufeature.h>
 #include <asm/sysreg.h>
 
+#include <linux/perf_event.h>
+
+#ifdef CONFIG_KVM
+void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
+void kvm_clr_pmu_events(u64 clr);
+bool kvm_set_pmuserenr(u64 val);
+#else
+static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
+static inline void kvm_clr_pmu_events(u64 clr) {}
+static inline bool kvm_set_pmuserenr(u64 val)
+{
+	return false;
+}
+#endif
+
+static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
+{
+	return (!has_vhe() && attr->exclude_host);
+}
+
+void kvm_vcpu_pmu_resync_el0(void);
+
 #define RETURN_READ_PMEVCNTRN(n) \
 	return read_sysreg(pmevcntr##n##_el0)
 static inline unsigned long read_pmevcntrn(int n)
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e18e9244d17a..3eeb762944c9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1362,28 +1362,10 @@ void kvm_arch_vcpu_ctxflush_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu);
 
-static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
-{
-	return (!has_vhe() && attr->exclude_host);
-}
-
 /* Flags for host debug state */
 void kvm_arch_vcpu_load_debug_state_flags(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_put_debug_state_flags(struct kvm_vcpu *vcpu);
 
-#ifdef CONFIG_KVM
-void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
-void kvm_clr_pmu_events(u64 clr);
-bool kvm_set_pmuserenr(u64 val);
-#else
-static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
-static inline void kvm_clr_pmu_events(u64 clr) {}
-static inline bool kvm_set_pmuserenr(u64 val)
-{
-	return false;
-}
-#endif
-
 void kvm_vcpu_load_vhe(struct kvm_vcpu *vcpu);
 void kvm_vcpu_put_vhe(struct kvm_vcpu *vcpu);
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 147bd3ee4f7b..2c78b1b1a9bb 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -74,7 +74,6 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);
 struct kvm_pmu_events *kvm_get_pmu_events(void);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
-void kvm_vcpu_pmu_resync_el0(void);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))

base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
-- 
2.48.1.362.g079036d154-goog


