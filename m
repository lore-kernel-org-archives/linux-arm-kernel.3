Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1205DC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjcjVqcT3PfYTwjN9wXAnWmKWncB0aK3QVDv0kRYNAs=; b=NGcBawmpYVIxrNugdPDKpVkWss
	BgdWaY6P4X9WuXKPtfwxTiH4JYQA82CmSkCTTM0ET5Dhe9VGjEYEurfL1NG9Ku0HbrXqzth4r0qpl
	xB3m+TmOKWy37oibvgo5HwiQ0pRmHrjmDKIgO4/SKSztPgGkB0Fkoszzdv4FlBOKJP5zGbLo9oh3M
	+6pP7SoH0QwlpUIGWeXGEblrLvbelozx8XFGW6bpeE+2S5GLcdXgZGelfDkY10ddVAYKEbjHaG5mj
	64Xga0py8Ubd+vTFcwDavdfrtzTdL++NZiZgze3RQJpe173QU9FQTSlCiU5hpfw91wddagEZC1tLp
	FHlCY/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuio-0000000Ctqp-33SK;
	Thu, 26 Jun 2025 22:05:30 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsrE-0000000Cgkg-01fy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:05 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddbfe1fc8fso28822085ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968363; x=1751573163; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OjcjVqcT3PfYTwjN9wXAnWmKWncB0aK3QVDv0kRYNAs=;
        b=i/twhzWoJyAMvXVFrcVyBV5BB9GoNtVXN4vThncrmMXlQ19H6IiBniAIH5jrh7tmsi
         u6m83hq/K8IR/SygHTolU+CfRLLVOBkUM+oFTquOuAkAVQ+wG5mGsmkuPvebdvgYH1R8
         ikYL9sMtgNBB01zwIFuzx1U2SjAA+RGj6xtxx7ySA/TlSM+KG7V4bysoqsoUn7vo1KMS
         wsCpE6LjOYXXDtDq33jjz7O0LFjmQCYGLNTwMYQERXEaO1BgQkwDAZzBEOU3z2pmks8z
         Xeex5OqQNAQ/pa7z0lehsUk+TIEQCXW4xNMSD6aL3GNskBe4cwrECskOn4tY2V6F83Tx
         8xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968363; x=1751573163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjcjVqcT3PfYTwjN9wXAnWmKWncB0aK3QVDv0kRYNAs=;
        b=bq2DFclxSyuQ1N0BS0BZIH43mN63n++/q6N3Gjwsjhw+/Hb1HQzNuK9bAiCC/c6pKK
         G4LsIazylZcNnV/sCEAsLNFZviRxKcg83d+LsidPQdh4Ca4MOPkusXqNdWmernsLA4Wc
         jowD+6ulYMJfBfGI5V8mP65EchoyLsghKWkjEiB0OXzaJ4FenA7Z+UoiV2odXBH1RsCY
         bhUYZBS7PytujmdM6rt65uqkOAujjrKi8yCHOi1DwknMACx7dvK0fCkqp4HIAT6OS2gV
         BWpz7MAxUA5K4xqDhCRhRSS4ia55tYanGaXqVcuKzwjjjRzR+Iz0yrAZ9gi0Bn5Qhcch
         EA1w==
X-Forwarded-Encrypted: i=1; AJvYcCUuyiR0iUSBB6c777qOvwXJ5180NiIlpJKltqSRStfDPCohOH0UfihEffG16PrI5JJ/2vqqqQ93yhtwo2BivBvN@lists.infradead.org
X-Gm-Message-State: AOJu0YxS2no0GbJZj0k4ypJGI2nA6Zbvk3P1m3GhzcltcoRYq6cveCUi
	2AcZLSw7vMx/huGfQIBoeM10t3p845POYOB5PJu6FNs5UNBWxXfqwnZrXFLGzOiQScDw+5XDYkD
	looiTDBdujD8Lf+c5nxt9MlWK0w==
X-Google-Smtp-Source: AGHT+IFUddqpSua+e1bwkQXI4ID0eoYsJI6Flt9aCdAiBQPdjrY96T7W5A1qLJU1ATtwnMWwgss2F2B6rdL1cwzbcQ==
X-Received: from ilbec6.prod.google.com ([2002:a05:6e02:4706:b0:3df:16fc:af6f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1c03:b0:3df:3464:ab86 with SMTP id e9e14a558f8ab-3df4ab61d98mr11788385ab.9.1750968362685;
 Thu, 26 Jun 2025 13:06:02 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:47 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-12-coltonlewis@google.com>
Subject: [PATCH v3 11/22] KVM: arm64: Writethrough trapped PMEVTYPER register
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
X-CRM114-CacheID: sfid-20250626_130604_046978_88FD29B2 
X-CRM114-Status: GOOD (  14.21  )
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
 arch/arm64/kvm/sys_regs.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index eaff6d63ef77..49e8e3dcd306 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -18,6 +18,7 @@
 #include <linux/printk.h>
 #include <linux/uaccess.h>
 #include <linux/irqchip/arm-gic-v3.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf/arm_pmuv3.h>
 
 #include <asm/arm_pmuv3.h>
@@ -1037,6 +1038,30 @@ static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+				   u64 reg, u64 idx)
+{
+	u64 eventsel;
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		eventsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
+	else
+		eventsel = p->regval & kvm_pmu_evtyper_mask(vcpu->kvm);
+
+	if (vcpu->kvm->arch.pmu_filter &&
+	    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
+		return false;
+
+	__vcpu_assign_sys_reg(vcpu, reg, eventsel);
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		write_pmccfiltr(eventsel);
+	else
+		write_pmevtypern(idx, eventsel);
+
+	return true;
+}
+
 static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			       const struct sys_reg_desc *r)
 {
@@ -1063,7 +1088,9 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	if (!pmu_counter_idx_valid(vcpu, idx))
 		return false;
 
-	if (p->is_write) {
+	if (kvm_vcpu_pmu_is_partitioned(vcpu) && p->is_write) {
+		writethrough_pmevtyper(vcpu, p, reg, idx);
+	} else if (p->is_write) {
 		kvm_pmu_set_counter_event_type(vcpu, p->regval, idx);
 		kvm_vcpu_pmu_restore_guest(vcpu);
 	} else {
-- 
2.50.0.727.gbf7dc18ff4-goog


