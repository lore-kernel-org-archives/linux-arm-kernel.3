Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DBACD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 08:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yhw+U5U0mRKAveZkpb01TNee8kz0XAwdmr1c41j2p0=; b=BdyoaXtJhPAJEtPl1UN9qJI3CK
	+nVTKHETbnMw7A6voLBVjJzVLFrjCAGCC77JWQYQO1Tjzk2my1TLk9+TwBtA+DV6y5kwxkOBtHbHG
	mNdUylsmh6JjHYxKk5eegedsHRatoe6/h5uTBi1tSS27A+honP4/QgiTz5P/blp04nlOnm/BQZGvj
	Ix0Va7Py8A+fAUoeIHcqQrFvgDeGv+EGnChdM9HO00/8nOtf88wO6Mxk7RB/8aBVXLkE4R0OMRyTi
	HJ42vTBF/Yyt1Do3JvYBDFQhZwk4B/GYVOaqFI85/GLD5xt55CI/o7vHwEOE3RKmjoQ3bhm8TAAiq
	2GNwAZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVmlM-00000001Ww6-0M6r;
	Sat, 06 Jun 2026 08:52:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVmlK-00000001WvI-0AYI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 08:52:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c0b944f6edso28868325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 01:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780735932; x=1781340732; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2yhw+U5U0mRKAveZkpb01TNee8kz0XAwdmr1c41j2p0=;
        b=m3Wie5Y4/FnmMiaII/iT2H3bdcGiUOuDIzFHEFiiHPCk5VGw3ZPxvTjOtV5QPdoeWx
         kk4B/fjq5vkPfGimFI19Uys9pmg2E9XXbbLdyDmpZEJZqirpN/QBcAPlmP/fMeZrxw2+
         vBSlXvJARJWfXjl9nzz+wx+V9Di/WC8YXjhhFozFPwi0/St4CZKSmM4xkoH5UB1efAxz
         GH3DQShrmV2lofRlPy7DeswjX/VpwAz1dA9K98rjKR20+2J8G28avryeV8tpcHOKvxqK
         QvAUp/Jjvnbrn60Uxtskj/Kn/y8DySA/FbIVUeYnteiQbmCOzk68QiE1xmwZnx8NdITd
         ZYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780735932; x=1781340732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yhw+U5U0mRKAveZkpb01TNee8kz0XAwdmr1c41j2p0=;
        b=F3pXIMeiMt7Px+GN3pPfCCH9vR6E3xidNve5G2rYfZtwm5mr9RfM9Crm2u56YkiIwH
         FSehsu7QHW2Y3b5idl128Pf1zDNTRfzKC9mOj+Sjw3aCXCleUoXXi0Sx2D1NPikDTa0O
         ib7xQilHulhScox0p1sIT0jAQvPhH3PpQEuPF7L9yGqncxJ+OwvwqnkecaBa5LqcQqgG
         1fCcjNzk5XL/6fhbmLpqKGho3b+ZA2/ztshJf1RD0ar3YGcjcvSzrnZ6JvxffszEBgSX
         gdHH7oiJUcZQG2VLjk59j6Tzo42uO7e8Cizc7BcNHgyASHXjAqlr/kTpg6LPpRst51Cz
         xeAg==
X-Forwarded-Encrypted: i=1; AFNElJ+dBkC1FKxJKP3G1PAQhbVIYWecmznAnVNLeukn9R3onM64FifmyNhlyEuGwxfsCo2QXLguLk2wXGBpVXTkC0dz@lists.infradead.org
X-Gm-Message-State: AOJu0YwFRqSsD871RwMpEBPPnN4y6UcuTuCTauC1L5KfMCGQRmzenuYo
	f22cEkzYmmGLaEZh/6MnKs5gsemBeWoN/6KT/JT6llCbYq2ssc2TJH7s
X-Gm-Gg: Acq92OF5BdcaTy52P07w8uQk189qc9f0CEwpFdNNCOitcFXvlbcdoEBAxWTILa89WTW
	L64tHiEE3xXfxNsdNt25WUccqBl9+yu3ROquuzlwnEaE86kyhsGy8MdnMjOb5YMaVAU9jU2kTnz
	AQldTZj8QR3gLrP5UJ3/JJ/t2gU/FWm7ic4oULMbT3DVoeOsjpuRW5sybFLVXWlY3KhSPka6Fn2
	lPg0EaApkTqRQMEgX9nDPS9YFbZB/uLp566KHSegIImhpFmrdiDkHxlVbEgaYdYI31lcXFY1N7R
	Ks9Tmkp3vV72WShc1CbUcRABG8pGYpa74hwUXwTp+wBbU3X+X317vMQeF9bCsTZ3+w3dAveTjrI
	bYLI/v4l1iICYNrZ2ekJRo8J8eM6STJgydbxAE7pb8D2uUY3/gcsiY/Oj8OtJZteqo+5GnYWxtt
	HeUijOWbGR7L05gEh6WUXvYGVtWjauv3Je425kyxQM7dfqor4Vix7yxw==
X-Received: by 2002:a17:902:f78d:b0:2bf:175a:db61 with SMTP id d9443c01a7336-2c1e7b35b28mr81493275ad.7.1780735932557;
        Sat, 06 Jun 2026 01:52:12 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm116177535ad.75.2026.06.06.01.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 01:52:12 -0700 (PDT)
Date: Sat, 6 Jun 2026 17:52:08 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: tabba@google.com, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: Re: [PATCH v2 2/2] KVM: arm64: Bound used_lrs when flushing the pKVM
 hyp vCPU
Message-ID: <aiPfuAmM8JbtT6GY@v4bel>
References: <20260604151210.1304051-1-imv4bel@gmail.com>
 <20260604151210.1304051-3-imv4bel@gmail.com>
 <86zf19tlcu.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zf19tlcu.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_015214_091879_C85AB9EC 
X-CRM114-Status: GOOD (  31.99  )
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

On Fri, Jun 05, 2026 at 09:58:09AM +0100, Marc Zyngier wrote:
> On Thu, 04 Jun 2026 16:12:03 +0100,
> Hyunwoo Kim <imv4bel@gmail.com> wrote:
> > 
> > flush_hyp_vcpu() copies the host vGIC state into the hyp's private vCPU
> > on every run. The vGIC list register save and restore use used_lrs as
> > their loop bound and expect it to stay within the number of implemented
> > list registers. While this is generally the case, flush_hyp_vcpu()
> > copies vgic_v3 verbatim and does not enforce this, so a value provided
> > by the host is used at EL2 to index vgic_lr[] and access ICH_LR<n>_EL2
> > (host -> EL2).
> > 
> > Fix by clamping used_lrs to the number of implemented list registers
> > after the copy, as the trusted path already does in
> > vgic_flush_lr_state().
> > 
> > Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
> > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 02c5d6e5abcbf..cd807fdb11ba8 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -7,6 +7,7 @@
> >  #include <hyp/adjust_pc.h>
> >  #include <hyp/switch.h>
> >  
> > +#include <asm/arch_gicv3.h>
> >  #include <asm/pgtable-types.h>
> >  #include <asm/kvm_asm.h>
> >  #include <asm/kvm_emulate.h>
> > @@ -142,6 +143,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  
> >  	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3 = host_vcpu->arch.vgic_cpu.vgic_v3;
> >  
> > +	/* Bound used_lrs by the number of implemented list registers. */
> > +	if (static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
> 
> There is no pKVM support without a GICv3 CPU interface, and absolutely
> everything already assumes it. Why do we need this extra check?
> 
> > +		hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs =
> > +			min_t(unsigned int,
> > +			      hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs,
> > +			      (read_gicreg(ICH_VTR_EL2) & 0xf) + 1);
> > +
> 
> Reading ICH_VTR_EL2 on each entry is going to cause some really heavy
> trapping under NV, and we should avoid this.
> 
> kvm_vgic_global_state.nr_lr contains this information, and it should
> only be a matter of replicating it (or compute it once) at init time.

Does this approach look reasonable to you?

---

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 8d06b62e7188..25199769a1d6 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -157,5 +157,6 @@ extern unsigned long kvm_nvhe_sym(__icache_flags);
 extern unsigned int kvm_nvhe_sym(kvm_arm_vmid_bits);
 extern unsigned int kvm_nvhe_sym(kvm_host_sve_max_vl);
 extern unsigned long kvm_nvhe_sym(hyp_nr_cpus);
+extern unsigned int kvm_nvhe_sym(hyp_vgic_nr_lr);

 #endif /* __ARM64_KVM_HYP_H__ */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9453321ef8c6..891fe2c7b854 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2426,6 +2426,7 @@ static int __init init_subsystems(void)
 	switch (err) {
 	case 0:
 		vgic_present = true;
+		kvm_nvhe_sym(hyp_vgic_nr_lr) = kvm_vgic_global_state.nr_lr;
 		break;
 	case -ENODEV:
 	case -ENXIO:
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 06db299c37a8..8bb9362bc284 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -128,6 +128,9 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)

 	hyp_vcpu->vcpu.arch.ctxt	= host_vcpu->arch.ctxt;

+	/* A guest context must keep a NULL __hyp_running_vcpu. */
+	hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
+
 	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
 	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
 	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
@@ -139,6 +142,12 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)

 	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3 = host_vcpu->arch.vgic_cpu.vgic_v3;

+	/* Bound used_lrs by the number of implemented list registers. */
+	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs =
+		min_t(unsigned int,
+		      hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs,
+		      hyp_vgic_nr_lr);
+
 	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
 }

diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index d461981616d9..ebc6b4afc336 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -20,6 +20,7 @@
 #include <nvhe/trap_handler.h>

 unsigned long hyp_nr_cpus;
+unsigned int hyp_vgic_nr_lr;

 #define hyp_percpu_size ((unsigned long)__per_cpu_end - \
 			 (unsigned long)__per_cpu_start)

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.


Best regards,
Hyunwoo Kim

