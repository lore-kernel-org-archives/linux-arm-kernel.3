Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8083FD32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EsN1AKfVr0DCt3ea+9xEDMwiA7+bJgbMxbEYUcuak9o=; b=FTCJFvjyh7I/Y2+c6MSxM2RLhN
	jwKwoJuV8oiow8lbZ6oFyRx06j5RQM7Ue2ybV1TjSa8sL1qVp0zeoyJixN04QKipuNIN26w0tpBaH
	syo0mrsFQNkIsH1hJhj1Dc69fmSfIvdr5u93Mk8ZKjpeJYLZbXpU7M5ADEdhExNjrpVs4aBVek4di
	qTxQv7mWYLKHqsgo7Dpq7ttDTOlKxXbBLe6Uhx89zPE6NDqj3PmIXV9+s8tBeyvZa43a6uY+Xg5WD
	tamm5GJY87l7WTvMXgMDIrlN3dmksVgHAcqak75Vjv76ajJ5BAP+rqG5rMmyGpYdAHYVhyqdUopGv
	teSYxGwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApY3-00000003Jow-0aw8;
	Tue, 12 Nov 2024 11:59:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoU4-000000037LW-15lD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:50:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so46735455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731408654; x=1732013454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EsN1AKfVr0DCt3ea+9xEDMwiA7+bJgbMxbEYUcuak9o=;
        b=CjGETvT+lHviw93XM0C4mnUhDgznOVtARe0E2DQH1i5W7guk3TLUDn4NTLM6YVW8Q9
         ZbrYgf9G+jDoNvYTUOXdpCzuUuGYn8nIja2NCPG888d4/0pDzBnzxDWHj64DKPx2mx5+
         0sLUj6e5yyrZWXR/2t1F/xbKFcDOIx4NXIYqjnAO83MWfpGwlZ+dOgoQIQd/6R/M7nSd
         sGMg1cXl492/3uWto9YZlESl0uHmNvPC9r1nOUkydbLujOH/lsbITSitNroYOfQvc8Rk
         xPUZyH9MHENFR0S8wWz+aFdV/ecFoXUk7F6bi590eYJvRUcflJE8J5qObxKVxthdknrk
         FmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731408654; x=1732013454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsN1AKfVr0DCt3ea+9xEDMwiA7+bJgbMxbEYUcuak9o=;
        b=C40KPkNvcj16fK73VDP+fYMcUyxohuKDI/JYrCCueZIaqcwHeXvh9j/r7x2ab6HKm7
         jQOLSA85pITIyJ+94ToORczcsa2RR+5PihdCL2ViFXvNcmSQbiXDSDM+ly+oeHCEx4Bm
         mKoWeHnoeCwoGIBsNbhgc/VJTvAtNnrBkihQb81CIUyaMaxGzjIZ/NvZlGwHDfNsEJAa
         4O4Ynhw3/dvBH3NV3WoaLO68Q9PbnKJbxygY9MTjG+F/HxVrswr5RaimxklZAJa0KS6m
         bhhMPkEFn5qaHcTLG1FGXVWEK/Cl6Jyk+dePV0KxdPDiuojlpcYjaTmA5De4kO4KGCQW
         3FSA==
X-Forwarded-Encrypted: i=1; AJvYcCUpLqtpynHHuhYo0HnbjuK53j8QjtRTd+ZZp/LB7vp4bAGCzHZy3vafvzWbUm9VLawYKEgchJhBaCizrY8zZuah@lists.infradead.org
X-Gm-Message-State: AOJu0YwkqQSrF/IfW1ki+2JvQ29OSmffLp0ciw0HK1dpaFD/tAHtVKSp
	bjXabSNf9/jwhqWD6YGtGYmG8zlerWMoFz7pYeaUmztq3lgJ4d2RiKeByhdo7wA=
X-Google-Smtp-Source: AGHT+IEKeBbC4At05ppEunVvuC+fNmBSZ3Q9XWqfiNFLF4QIIvJpGZjKzAWEcxYQGDx0hubsAbMKIw==
X-Received: by 2002:a05:600c:6987:b0:431:3a6d:b84a with SMTP id 5b1f17b1804b1-432bcafc5a6mr109173125e9.4.1731408654402;
        Tue, 12 Nov 2024 02:50:54 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa70a1f8sm248010955e9.30.2024.11.12.02.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:50:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: broonie@kernel.org,
	maz@kernel.org,
	kvmarm@lists.linux.dev
Cc: James Clark <james.clark@linaro.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Don't save FP traps in default cptr_el2 value
Date: Tue, 12 Nov 2024 10:50:31 +0000
Message-Id: <20241112105032.793274-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_025056_330338_7C218C35 
X-CRM114-Status: GOOD (  16.63  )
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

kvm_get_reset_cptr_el2() is called at vcpu init before the vcpu is
loaded. Since the linked commit, the fp state was moved from the vcpu to
host data but it shouldn't be accessed at this point.

Move the bits that require guest_owns_fp_regs() out of the default value
and into just before they're used in activate and deactivate traps. This
fixes the following bug when nvhe && vcpu_has_sve() == true:

 BUG: using smp_processor_id() in preemptible [00000000] code: lkvm/118
 caller is debug_smp_processor_id+0x20/0x30
 CPU: 0 UID: 0 PID: 118 Comm: lkvm Not tainted 6.12.0-rc1+ #35
 Hardware name: FVP Base RevC (DT)
 Call trace:
  dump_backtrace+0xfc/0x120
  show_stack+0x24/0x38
  dump_stack_lvl+0x3c/0x98
  dump_stack+0x18/0x28
  check_preemption_disabled+0xe0/0xe8
  debug_smp_processor_id+0x20/0x30
  guest_owns_fp_regs+0x1c/0xb0
  kvm_arch_vcpu_ioctl+0xcfc/0xe10
  kvm_vcpu_ioctl+0x6c4/0x8a0
  __arm64_sys_ioctl+0x9c/0xe0
  invoke_syscall+0x4c/0x110
  el0_svc_common+0xb8/0xf0
  do_el0_svc+0x28/0x40
  el0_svc+0x4c/0xc0
  el0t_64_sync_handler+0x84/0x100
  el0t_64_sync+0x190/0x198

Fixes: 5294afdbf45a ("KVM: arm64: Exclude FP ownership from kvm_vcpu_arch")
Signed-off-by: James Clark <james.clark@linaro.org>
---

I'm only mildly confident that the logic here is equivalent to before.
Someone with a bit more context about the FP stuff can say, or if there
is a neater way to fix this issue altogether.

 arch/arm64/include/asm/kvm_emulate.h | 15 +++++++++------
 arch/arm64/kvm/hyp/nvhe/switch.c     |  3 ++-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index cf811009a33c..0eefb9fb08a0 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -629,16 +629,12 @@ static __always_inline u64 kvm_get_reset_cptr_el2(struct kvm_vcpu *vcpu)
 			val |= CPACR_EL1_SMEN_EL1EN;
 	} else if (has_hvhe()) {
 		val = CPACR_ELx_FPEN;
-
-		if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
+		if (!vcpu_has_sve(vcpu))
 			val |= CPACR_ELx_ZEN;
 		if (cpus_have_final_cap(ARM64_SME))
 			val |= CPACR_ELx_SMEN;
 	} else {
 		val = CPTR_NVHE_EL2_RES1;
-
-		if (vcpu_has_sve(vcpu) && guest_owns_fp_regs())
-			val |= CPTR_EL2_TZ;
 		if (cpus_have_final_cap(ARM64_SME))
 			val &= ~CPTR_EL2_TSM;
 	}
@@ -648,8 +644,15 @@ static __always_inline u64 kvm_get_reset_cptr_el2(struct kvm_vcpu *vcpu)
 
 static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
 {
-	u64 val = kvm_get_reset_cptr_el2(vcpu);
+	u64 val = vcpu->arch.cptr_el2;
 
+	if (has_hvhe()) {
+		if (!guest_owns_fp_regs())
+			val |= CPACR_ELx_ZEN;
+	} else if (!has_vhe()) {
+		if (vcpu_has_sve(vcpu) && guest_owns_fp_regs())
+			val |= CPTR_EL2_TZ;
+	}
 	kvm_write_cptr_el2(val);
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index cc69106734ca..296c4155e1fc 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -60,7 +60,8 @@ static void __activate_traps(struct kvm_vcpu *vcpu)
 			val |= CPTR_EL2_TFP | CPTR_EL2_TZ;
 
 		__activate_traps_fpsimd32(vcpu);
-	}
+	} else if (!has_hvhe() && vcpu_has_sve(vcpu))
+		val |= CPTR_EL2_TZ;
 
 	kvm_write_cptr_el2(val);
 	write_sysreg(__this_cpu_read(kvm_hyp_vector), vbar_el2);
-- 
2.34.1


