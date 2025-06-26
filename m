Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60A8C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EggI+2LInzJ3wRO1GPi9TTSrlVG7gA6O9HYI2Cdzh00=; b=HNul6QyMQsF5FNn6rPdgKqOYgt
	RAbZiHqNLGjyYiM2eUtcWsCamIQQPxWWjQ1Ql/QJKXt4M3QqO/XmI6+AtNyfXmEciyRry8WksyMkp
	uogQQqGzdJLoKLT+/9ij688orFP7wN5tsGvku/CSswg6JIxVzasfkmXa2TpS54EKWsaJotvCgogoh
	GY6r+YQITLdJkxWvBSWJQEokCd447/PBpXHjLskR4Tot8hYcyue2LSUlMjEKXlQ7mumZf++Y0qjED
	YGakWcQVpppm3IJgxfFng9baLhB0NKp3+hQu6swk1wH7MTHYuPcyp4KwuM7ugxT3ufzz5p0w+1444
	f02jT5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuty-0000000Cuyf-1siS;
	Thu, 26 Jun 2025 22:17:02 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsrJ-0000000CgoT-2E9h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:11 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-40a793c36aaso1080829b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968368; x=1751573168; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EggI+2LInzJ3wRO1GPi9TTSrlVG7gA6O9HYI2Cdzh00=;
        b=F7QJto8n3d5moxD6EurQcLFs5ZEeOuDxNtFVlqkFwvx9rlHoDtD4lrzzm+QsefZtuS
         Yi8FiwrnERY7j13nrrjjV2XRX869RoktEIPqCPDSLl7c+FI/fa5QGzq4nFFZxdcl2PUl
         WK3RKZcaZs4drIrmh2z1Iz+1Bwz1cqQR/pPHffSmc3xmFSWsTp+2F6BCEffXLg0ZoFlz
         vUGXDm6YFpReJC+ZSNfRMsQBnzewx5Sl67hwDHZ7zyOxk1Shga+pd069p2xYovH7VcAE
         TsPjxTOfgo660SOn/bw/UcMZNOwUdE4g+0Ao8rIPR/5WtzaAafebjA/5GFu21iEkLpPZ
         h3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968368; x=1751573168;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EggI+2LInzJ3wRO1GPi9TTSrlVG7gA6O9HYI2Cdzh00=;
        b=ZehLwDZEmeOAbagEKjofkZ14dv52z6WwvzM9iVTujjp4iCQ1FgMabU4vMYx6Q3vA6p
         GE6DleOGPM2zf69V4A7+T3fa8P21Vr0CPMTfMI+H9G9lAM0YvpxyFIZAXSVOFxMH3cvv
         FqcyP4WUYdYuVqtzzbIPUhykhwXnZJQITBKYLw+0dabYG6r9lJT7InrIEi+atm8kU2vV
         vMlhyfqKhASoghgHPlfqi8zDGWqnjif0RChtQc9JGb9jP3Fjk3H9PXqQMpWd1OUchcsr
         DZF7o93agKlpKyz8ni0NMAnJES05zPa/Giuz1On+LdDNY8TkdHT+X9oIy4cT86YZfOSU
         dVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEzKxcYfIeRpaBG1TaiHPCcz6/pr1MJyjywogJalPg5uYMT4TT+KdtFSHGd3q1s165ktW0/PmrdvyKos7eMNdf@lists.infradead.org
X-Gm-Message-State: AOJu0YwUt4fJFMw6Egqs+VyVdtQTFpfFqWZiNgDoRkOUZwXk8UrJUcID
	LzsaLsBwgbUq18066Yw23PPtksldE93mF/+uFwsfc1goHh4xLqY2I6D2wfqto7I6XcqGBxDkW9v
	55JXHcmgYEqaFHbggKx2g95ae7w==
X-Google-Smtp-Source: AGHT+IEDQi6MUvs/OOb8kHvz1Lzcrs7koLOsO+Cfk8AV6zjNya1DxUg2y1UQDMm5ESpCnmdsnoP82zEcgDNAL2N1IQ==
X-Received: from oigs15-n2.prod.google.com ([2002:a05:6808:68cf:20b0:40a:f58a:e126])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3a14:b0:408:fef8:9c91 with SMTP id 5614622812f47-40b341ca298mr321047b6e.5.1750968368200;
 Thu, 26 Jun 2025 13:06:08 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:52 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-17-coltonlewis@google.com>
Subject: [PATCH v3 16/22] KVM: arm64: Account for partitioning in PMCR_EL0 access
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
X-CRM114-CacheID: sfid-20250626_130609_573625_3A9A9D20 
X-CRM114-Status: GOOD (  13.64  )
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
index 338e7eebf0d1..9469f1e0a0b6 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -884,7 +884,7 @@ u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
 u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 {
 	u64 pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
-	u64 n = vcpu->kvm->arch.nr_pmu_counters;
+	u64 n = kvm_pmu_guest_num_counters(vcpu);
 
 	if (vcpu_has_nv(vcpu) && !vcpu_is_el2(vcpu))
 		n = FIELD_GET(MDCR_EL2_HPMN, __vcpu_sys_reg(vcpu, MDCR_EL2));
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index b80cf6194fa3..e3d53f2da60b 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1249,7 +1249,9 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	 */
 	if (!kvm_vm_has_ran_once(kvm) &&
 	    !vcpu_has_nv(vcpu)	      &&
-	    new_n <= kvm_arm_pmu_get_max_counters(kvm))
+	    new_n <= kvm_arm_pmu_get_max_counters(kvm) &&
+	    (!kvm_vcpu_pmu_is_partitioned(vcpu) ||
+	     new_n <= kvm_pmu_hpmn(vcpu)))
 		kvm->arch.nr_pmu_counters = new_n;
 
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.50.0.727.gbf7dc18ff4-goog


