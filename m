Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26B7CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 17:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmWKsP5LOKB/Z4KYBnWg/ptdbuVXbRt6wtHayHObrME=; b=Fc5i7BbYYdOvNOZ1iQkiDfcYF7
	8gG7fQb5JAgX9tE+vvDvXblJfuT+j2MnWF1ceXX5J+aeh0Wnp90x5xnUUriJllFYy85QtA4x8FIjv
	ljsaaDOfvd9P3UZmOOUcPZldfycrSekBHCkeahBGc/AK8+kcV1oB0LGY5xP7KVYDq9Nj4V7gATQ2l
	9tpykxrRgpkCKXgvVZqoyqMxeToeFdTz47BEY3PGwfbfCmIpEr1NdYA6pyj2C1FR+nkgQ6McxdiNp
	nYmA97IExxHL7AQjoXXT747MB//Sfzg9PgjbSir6LVmN7tOv1wnek0tCBk4PClgcGcnk5Yxcy+g/r
	xjFZCXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVvGu-00000001k39-3NOY;
	Sat, 06 Jun 2026 17:57:24 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVvGs-00000001k2S-0PTh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 17:57:23 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c168baac83so13914365ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 10:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780768641; x=1781373441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmWKsP5LOKB/Z4KYBnWg/ptdbuVXbRt6wtHayHObrME=;
        b=TDo9K9PwPJA1OaFVCDWnZ1XfB1t3eRtjOtqTaUCccYrCxo8WtpFUU/a9CV5OkeVwNQ
         zQTGWvQg8k9Ye3RiUD8Zl59/v5uKGwQ2wGVSMRU2mbNVKYkkLLBLbjpPrOmTCZRMdcBc
         sqASw387/4MXPIpIXHmBZI0u+8riXBo3l/N4oWKOAEDWDFUaybdaIel9HQygupShlCUY
         p3E+wcNr3Us56MkmllsRj76mkMZb29c6myjuQNPi/TBAPl3sicYnPuZ1qt6NEgnWmOyc
         mTJKkYYNLCfH6cWq7HCZJVhiw6BON2tzCKYmdBKSLWJsD53OvoWdTLebRhtT1XA0HFfU
         hSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780768641; x=1781373441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KmWKsP5LOKB/Z4KYBnWg/ptdbuVXbRt6wtHayHObrME=;
        b=XeT+l9fDpK/TQ9PRReX85WrN+EDoT3XLc0l6YkpttXSPJFKejIKXYbVTF1lQ55+aCC
         RfsWjJmQusrAET5hzJpra/2IMybAkbpgUlabGkBlMV12pVBW67/r/QIyP98exL8chriq
         9C/iEEoKANl+zWkP1ymx+ajKWIotoiSeGirDfCQJUUXLW5oIGCBmccLu40oi6JXUEc3F
         0r3IIP4q82FlnfiDjZ8TCsgnk1CMAK7EeBqvp3icReAWY0ANk0rK6Mdi3YLVCAhIk+w/
         aszG/7sFu2z2uY/13L7HeIuUMVPtiD9L/cfYx1kisZybDS26HEt8HRz4SNvsNkOtqAeo
         Wkeg==
X-Gm-Message-State: AOJu0Yz1/DeGpucVMcF4klSpFql8I/byWWuhpz/gJO+wdkSmFudS5C8m
	Kt2lg7FdsIxqIGZ83Tp3orU5LaI+b7Ttmlj4v9WgAm8TatGf0YSxn1zJ
X-Gm-Gg: Acq92OHabvXJr4IkvgC5k4vGPNdjyN22MGZ5NAA1eBe9hNtTTnjU2/yw/7jRZar/WLo
	XEs0u9RbeC+aakH9p2uI0IuptLvvGs6QK+nLYawexXBel9aNFpRTEzqjjMjkN4B/7uBh5qE5Ywk
	LCBAkrHmt5fPWh8s/X78eibw/xwA4ek07p1fPrN9MsJ6k2Fdh/v7b7UOyA4J2Nz8c5JiDFGtbu5
	h65VXL55+6DF8XKO0pHa0BPpYmbIyd6M1qowE6DCWBMjS3e+emJHt2Bz1AVuAD1zASNVlDlR15z
	rI0zKVfh3x9IgQkcyaqu1K48UgEq0dt5srxZnSM8i5JD6KD1x6donx+W9CdQtknf2Hsfb2InYx6
	EC+9Sj5PTD2xJtz/ueSPehKOLM4ePznfblAp/4np1yJ+fpaihicHSkuA8tIGn2KBJ4Aw2DtTZMj
	P831JKmP3SdxXNBhxJgOiQfx2BwPRMVa0Dj1f+HKubedMugVVB39+bUnbk
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr105792125ad.3.1780768641180;
        Sat, 06 Jun 2026 10:57:21 -0700 (PDT)
Received: from v4bel.. ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm129196425ad.2.2026.06.06.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 10:57:19 -0700 (PDT)
From: Hyunwoo Kim <imv4bel@gmail.com>
To: tabba@google.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	stable@vger.kernel.org,
	imv4bel@gmail.com
Subject: [PATCH v3 2/2] KVM: arm64: Bound used_lrs when flushing the pKVM hyp vCPU
Date: Sun,  7 Jun 2026 02:56:11 +0900
Message-ID: <20260606175614.83273-3-imv4bel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260606175614.83273-1-imv4bel@gmail.com>
References: <20260606175614.83273-1-imv4bel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_105722_144315_772BDBCF 
X-CRM114-Status: GOOD (  15.44  )
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

flush_hyp_vcpu() copies the host vGIC state into the hyp's private vCPU
on every run. The vGIC list register save and restore use used_lrs as
their loop bound and expect it to stay within the number of implemented
list registers. While this is generally the case, flush_hyp_vcpu()
copies vgic_v3 verbatim and does not enforce this, so a value provided
by the host is used at EL2 to index vgic_lr[] and access ICH_LR<n>_EL2
(host -> EL2).

Fix by clamping used_lrs to the number of implemented list registers
after the copy, as the trusted path already does in
vgic_flush_lr_state(). The number of implemented list registers is
constant after init, so it is replicated once from
kvm_vgic_global_state.nr_lr into hyp_gicv3_nr_lr rather than read on
every entry.

Cc: stable@vger.kernel.org
Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/include/asm/kvm_hyp.h   | 1 +
 arch/arm64/kvm/arm.c               | 2 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 9 +++++++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 8d06b62e7188..e9b2b0c40ec6 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -157,5 +157,6 @@ extern unsigned long kvm_nvhe_sym(__icache_flags);
 extern unsigned int kvm_nvhe_sym(kvm_arm_vmid_bits);
 extern unsigned int kvm_nvhe_sym(kvm_host_sve_max_vl);
 extern unsigned long kvm_nvhe_sym(hyp_nr_cpus);
+extern unsigned int kvm_nvhe_sym(hyp_gicv3_nr_lr);
 
 #endif /* __ARM64_KVM_HYP_H__ */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9453321ef8c6..9ffd5d4079e6 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2426,6 +2426,8 @@ static int __init init_subsystems(void)
 	switch (err) {
 	case 0:
 		vgic_present = true;
+		if (static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
+			kvm_nvhe_sym(hyp_gicv3_nr_lr) = kvm_vgic_global_state.nr_lr;
 		break;
 	case -ENODEV:
 	case -ENXIO:
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 02c5d6e5abcb..a0da08caa6c2 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -24,6 +24,9 @@
 
 DEFINE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
 
+/* Number of implemented GICv3 LRs. Used by flush_hyp_vcpu(). */
+unsigned int hyp_gicv3_nr_lr;
+
 void __kvm_hyp_host_forward_smc(struct kvm_cpu_context *host_ctxt);
 
 static void __hyp_sve_save_guest(struct kvm_vcpu *vcpu)
@@ -142,6 +145,12 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3 = host_vcpu->arch.vgic_cpu.vgic_v3;
 
+	/* Bound used_lrs by the number of implemented list registers. */
+	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs =
+		min_t(unsigned int,
+		      hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs,
+		      hyp_gicv3_nr_lr);
+
 	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
 }
 
-- 
2.43.0


