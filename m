Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E12CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 23:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+DG7jBXGZxGQ4XuCOpRWmsZ2ZfXC/o78dYhqpKpX0Y=; b=1IOkINLxQeqR/UM9mpV+9KSqOm
	JMDz4+GPXYbvB5gR8CqnL1fRqLV7ROEixCqnVmW6yHkYnR7en3qIdI7RDWukxfzX2IPMGEsDlMEP5
	f8ouAZqiMeUPw6J9pMHsejiYbCsjBROEwA/ikVrBLLi0l8/f8BMsZZ2UDRIAqBfNxnhwOj82otGFJ
	vLZ3l5b0/c66jPEAU5Ugtkw9FrIKkzq6sRJkMQ0r0bPmPdJyaXFLrEWhDgOsArrcY2TzQeXbojgLG
	/TszNm4er3/VD9oeY0XbDjamQGI7+G6wOWKou00Nh5lf3g0CQekGqWhFLMSl1HOlIDgVh0qS3aLOB
	TWlvJExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoVX6-0000000BpGr-3yNs;
	Tue, 19 Aug 2025 23:14:24 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUFn-0000000BfOW-3xxU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:29 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-afcb62cffd4so28293366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640346; x=1756245146; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W+DG7jBXGZxGQ4XuCOpRWmsZ2ZfXC/o78dYhqpKpX0Y=;
        b=OxD/QvthGq9LVSxLM6Jomw+tj9qZ05Ar7kStZBBrkioQHrw9uWj1GMJMPDhJSraEgE
         7Lm60k5bi7C8PesR5CHaCF6P1SRMjdc85/aTpPjLdXu9PUc0ijy/Tm59IkIa17MnDyGA
         dXbAXXdDlnWX9meprsjfTrU9AP06xkXCV+OrPUHy1uj2D1tUxQkolt9C04zt47rh+InY
         ZIMK3FLKuV1X+mxT8DZYqOFzwzsw92Ue3Nwp+cSAs1Hq5CWhi2Gn84IDCQQzEF8HF6/G
         p3agGv41oaZYDI/I45VfYDp2a+ZAmXadG66UygPDUsxMklBLGuI36UXrTpTIPHQnpFrX
         gz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640346; x=1756245146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+DG7jBXGZxGQ4XuCOpRWmsZ2ZfXC/o78dYhqpKpX0Y=;
        b=DPMZzD0lRYIdys4KC73S0dSl2ywG8cmwxlnVLbhvQeOFFsDKZ2+7Wzmj4hDV6sV8m+
         IcM5v1n2uX6HqTRYKH/QGj6aODu+P64D6W3WB+dHn62mn8pj8pEtOAmAFJL1YupyD0Yx
         SB52KkbXgTaKkDcOMeUDvnslkDFmNghArVWiQNF6L3XeaB8OuFxKrFM2d21OcuPHaf38
         63h/TwJ4Cz5tMfhqVQksX6wTgMcstJC/XS+48AwkSvRQJTU0cyHaNSHj/DKPfUter3lA
         gI0UBp2xhyM5JQapjhmb/+sl43PfZh6bmA6UP3ynj7jozTGg3EMWn72qLVmyhf6GoKMg
         s6FA==
X-Forwarded-Encrypted: i=1; AJvYcCUJPqpVeu4lqZ34wbFUV81IFNYnO6rz/eGJpB6Hpnvf9814PWROJ1vmMZwVXrSg+CqbW4AxMK2KpdbyBPIBMBQx@lists.infradead.org
X-Gm-Message-State: AOJu0YzfHtUCzu/cNxKPgUazaISthv8Fzq6U2qIIUhH6lI0uqNe1+/dm
	uMpw31ct/7k6IXaz39CjQcfyo9tx31w4LFtA3Y06XEGTvEZYJTTeOkQjnikFjqUM0VHm9hiJ2p/
	/YRXSukO7ejSf6w==
X-Google-Smtp-Source: AGHT+IH9p4RnQonIqO2IvBstcQzhGwFgVqersbPBUPhqv5wCNXWBDT/LoPiy2B89sQst64Mbf5itUgGSgohDDQ==
X-Received: from edc12.prod.google.com ([2002:a05:6402:460c:b0:61a:3e52:115a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7fa3:b0:af9:23b:9f9 with SMTP id a640c23a62f3a-afdded25839mr293959566b.24.1755640345755;
 Tue, 19 Aug 2025 14:52:25 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:31 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-4-smostafa@google.com>
Subject: [PATCH v4 03/28] KVM: arm64: pkvm: Add pkvm_time_get()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145227_983604_B483FFBB 
X-CRM114-Status: GOOD (  15.22  )
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

Add a function to return time in us.

This can be used from IOMMU drivers while waiting for conditions as
for SMMUv3 TLB invalidation waiting for sync.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 ++
 arch/arm64/kvm/hyp/nvhe/setup.c        |  4 ++++
 arch/arm64/kvm/hyp/nvhe/timer-sr.c     | 33 ++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index ce31d3b73603..6c19691720cd 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -87,4 +87,6 @@ bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
 void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
 int kvm_check_pvm_sysreg_table(void);
 
+int pkvm_timer_init(void);
+u64 pkvm_time_get(void);
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index a48d3f5a5afb..ee6435473204 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -304,6 +304,10 @@ void __noreturn __pkvm_init_finalise(void)
 	};
 	pkvm_pgtable.mm_ops = &pkvm_pgtable_mm_ops;
 
+	ret = pkvm_timer_init();
+	if (ret)
+		goto out;
+
 	ret = fix_host_ownership();
 	if (ret)
 		goto out;
diff --git a/arch/arm64/kvm/hyp/nvhe/timer-sr.c b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
index ff176f4ce7de..e166cd5a56b8 100644
--- a/arch/arm64/kvm/hyp/nvhe/timer-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
@@ -11,6 +11,10 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
+#include <nvhe/pkvm.h>
+
+static u32 timer_freq;
+
 void __kvm_timer_set_cntvoff(u64 cntvoff)
 {
 	write_sysreg(cntvoff, cntvoff_el2);
@@ -68,3 +72,32 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
 
 	sysreg_clear_set(cnthctl_el2, clr, set);
 }
+
+static u64 pkvm_ticks_get(void)
+{
+	return __arch_counter_get_cntvct();
+}
+
+#define SEC_TO_US 1000000
+
+int pkvm_timer_init(void)
+{
+	timer_freq = read_sysreg(cntfrq_el0);
+	/*
+	 * TODO: The highest privileged level is supposed to initialize this
+	 * register. But on some systems (which?), this information is only
+	 * contained in the device-tree, so we'll need to find it out some other
+	 * way.
+	 */
+	if (!timer_freq || timer_freq < SEC_TO_US)
+		return -ENODEV;
+	return 0;
+}
+
+#define pkvm_time_ticks_to_us(ticks) ((u64)(ticks) * SEC_TO_US / timer_freq)
+
+/* Return time in us. */
+u64 pkvm_time_get(void)
+{
+	return pkvm_time_ticks_to_us(pkvm_ticks_get());
+}
-- 
2.51.0.rc1.167.g924127e9c0-goog


