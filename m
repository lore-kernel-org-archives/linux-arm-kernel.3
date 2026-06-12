Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B25CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOZXwEI5Y5B3Y02lgtWh42sCFLWWWettLEzpogbwuYA=; b=uvbGqsbidMKwKHHajdPSIzve1d
	2RUICg0JjrQfM7OZoZ2FMc3Q8xZeRwHrGOn9/2psX5JL21Ot5AG4Bn35121gwsyqfKoU3/Rz0SPQM
	VEx7ndKqDYoZdh/HjWAa2ocaZ40yAEPbWTKo5VNeqCCXlq8yY2z9NrvRjIxsc9MIHlp210Vzj8LV/
	VYkXAJyZLgRs+XcjJC271Ps4WTocpXkbyBsWm3V1KiADj2oHlti3n8C9e5/PavC8certPUXbm9MVu
	T+pwRjNfbSA5VzSCxP7Ha1IpQP8KxpNyvaUAZ9B9ynRhBzVzPbxb1vEQ/t7PZv5gazMngb7FOdJSb
	eym3q0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxdH-0000000AcdH-1uW4;
	Fri, 12 Jun 2026 08:52:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxdE-0000000Acbg-3JAs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781254370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOZXwEI5Y5B3Y02lgtWh42sCFLWWWettLEzpogbwuYA=;
	b=dHgLi7CHcZL3i6ILU4SMa8PV7rxPbHsHLq1bHjVvDdFICbSDOHKxRxrLEXE1yCO3mORLoc
	GXZvlIGdbTNZauXsTAHqbEG9OvnPmfQuwXfCErgvoNIfamQXZc0gr3X0RTooYwp0z78azc
	RiClzw8PPQoMvgvDP1FvHXKV5gkisBU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-aoJHzyQtM6ipX9sYSkNRmg-1; Fri, 12 Jun 2026 04:52:48 -0400
X-MC-Unique: aoJHzyQtM6ipX9sYSkNRmg-1
X-Mimecast-MFC-AGG-ID: aoJHzyQtM6ipX9sYSkNRmg_1781254367
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4601102c30dso429278f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 01:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254367; x=1781859167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OOZXwEI5Y5B3Y02lgtWh42sCFLWWWettLEzpogbwuYA=;
        b=l1ZeXQgdwvlK7M3wy5RSlJ6s/aH3vpLgdBGVVrNYRr5o6ZtQFAgWObM0Td1luQ2W0y
         P5AQNw/NgvEozTCzMg/nAAHdheyZkR4DMGv6fgEZWrKkVCftN/bWDLo2MiV0AqB4mzuQ
         nwKSEnz3LyV7RKIGmAh30Tn6wkOavrckpxQbCoIh7InK4xKEhoojC1PRw0j4RLTzZ7nw
         mxVQJ86bN2Q74jM56VcTVxP/l9HudfQ7siOmkfd3OP+RBEM5osx4zVx82kMNYM9tyCgg
         PD+GIkXLfWJSqFvnND6WIbz4/NAMQxfEuagoiF/qr0cWcqB8taT1yvGVo90ce38ZWj26
         rsXw==
X-Forwarded-Encrypted: i=1; AFNElJ/63nF6As0panwP2dGdnOHc55oPPMgGo4WtQ6WJbXaJ51YVa0JmsoA2mcbQLdNrMUlFLdLsxrDEIkiUmbeXwfpL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzff2Ig6lvy+wzlxpZC9Qoum6e9Crl47F/2rX5umA0KwIU02T9z
	Tw+NCiv8q95lom12H9o94u4LApLx+eq2oS1D7KLy7zDiFXH326+bIB4s6bwCWxIdwMkb/9OOgEw
	DZ11WbZ+6qaQ/oq3AmPlpQQJQdSbZNiX0S3iwLPWAjoISXVmjDNHnzb2JrWsHEbWCWXgpEV7Loo
	tjKso1eOxbIpT88L6Y6KdNjtEg6vayWno0FTwJeDVR7xTJIpk10SY=
X-Gm-Gg: Acq92OEbjLV3mfQeNFkqOkQJNidFrjAh1sRd+BlCX/M8sEWgKps2Fc9D7e4voFMpHxx
	4cHHd0W5QIWAEb4TSOxO8/XXcWgr7438eH6W0OAhwvlD2Hu7ylT+CMEluC4RwzRTN8V9s6DjH7G
	OUReAo4yJoINWGVxft/+JA3KZAyXjVRRlFWJbd889ZHOHCUQKZC01KqaIrIMfw2uykAQB9oVNmj
	iXgGXdWGkgTUca0k8+rNl7EqUHfRN6KZi3Th1MyYkhTeEHRgCq97TqSlwcQ6NCdDLxghXphEiD5
	vrk+TA==
X-Received: by 2002:a05:600d:15a:20b0:490:bbc4:76a6 with SMTP id 5b1f17b1804b1-490ec4fb51fmr15350275e9.21.1781254367145;
        Fri, 12 Jun 2026 01:52:47 -0700 (PDT)
X-Received: by 2002:a05:600d:15a:20b0:490:bbc4:76a6 with SMTP id
 5b1f17b1804b1-490ec4fb51fmr15349825e9.21.1781254366732; Fri, 12 Jun 2026
 01:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260612084835.2992552-1-maz@kernel.org>
In-Reply-To: <20260612084835.2992552-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 12 Jun 2026 10:52:35 +0200
X-Gm-Features: AVVi8CdX7owDuivueK1-dJeSaKhgMulywKYC_yrCRr9BJkyYkQ7RP3nuvUevgwM
Message-ID: <CABgObfZToG=W=g3ex21LSHUgXF7tNDRTH9CX_g9AcDJpkv+1FQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 updates for 7.2
To: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Eric Auger <eric.auger@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>, Jackie Liu <liuyun01@kylinos.cn>, Joey Gouly <joey.gouly@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, 
	Zenghui Yu <zenghui.yu@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3vYT41rlnzpdAracT6tWe6Y_Jo6dS4gB2-3QYhN35w0_1781254367
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_015252_986935_4AFBC3C3 
X-CRM114-Status: GOOD (  30.11  )
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

On Fri, Jun 12, 2026 at 10:48=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Paolo,
>
> This is a bit of an odd merge window on the KVM/arm64 front. There is
> absolutely no new feature in the pull request. It is purely fixes,
> because it is simply becoming too hard to review new stuff when so
> many AI-fuelled fixes hit the list. And even then, I've arbitrarily
> tagged the branch today, knowing that there is quite a backlog of
> fixes that I will send very shortly, probably before -rc1.

No problem. Since I usually wait for the arch code to be merged before
sending my PRs, you have almost a week to send them and have them
included in the very first PRs.

Pulled these for now, thanks.

Paolo

> So here it is: only fixes and very minor improvements, all over the
> place. Details in the tag below.
>
> Please pull,
>
>         M.
>
> The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23=
c8:
>
>   Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-7.2
>
> for you to fetch changes up to 1ee27dacbe5dc4def481794d899d67b0d4570094:
>
>   Merge branch kvm-arm64/nv-mmu-7.2 into kvmarm-master/next (2026-06-12 0=
9:29:34 +0100)
>
> ----------------------------------------------------------------
> KVM/arm64 updates for 7.2
>
> * New features:
>
>   - None. Zilch. Nada. Que dalle.
>
> * Fixes and other improvements:
>
>   - Significant cleanup of the vgic-v5 PPI support which was merged in
>     7.1. This makes the code more maintainable, and squashes a couple
>     of bugs in the meantime.
>
>   - Set of fixes for the handling of the MMU in an NV context,
>     particularly VNCR-triggered faults. S1POE support is fixed
>     as well.
>
>   - Large set of pKVM fixes, mostly addressing recurring issues
>     around hypervisor tracking of donated pages in obscure cases
>     where the donation could fail and leave things in a bizarre
>     state.
>
>   - Fixes for the so-called "lazy vgic init", which resulted in
>     sleeping operations in non-preemptible sections. This turned
>     out to be far more invasive than initially expected...
>
>   - Reduce the overhead of L1/L2 context switch by not touching
>     the FP registers.
>
>   - Fix the way non-implemented page sizes are dealt with when
>     a guest insist on using them for S2 translation.
>
>   - The usual set of low-impact fixes and cleanups all over the map.
>
> ----------------------------------------------------------------
> Fuad Tabba (5):
>       KVM: arm64: Guard against NULL vcpu on VHE hyp panic path
>       KVM: arm64: Fix __deactivate_fgt macro parameter typo
>       KVM: arm64: Seed pkvm_ownership_selftest vcpu memcache
>       KVM: arm64: Pre-check vcpu memcache for host->guest share
>       KVM: arm64: Pre-check vcpu memcache for host->guest donate
>
> Hyunwoo Kim (2):
>       KVM: arm64: Clear __hyp_running_vcpu when flushing the pKVM hyp vCP=
U
>       KVM: arm64: Bound used_lrs when flushing the pKVM hyp vCPU
>
> Jackie Liu (1):
>       KVM: arm64: vgic-its: Make ABI commit helpers return void
>
> Marc Zyngier (29):
>       KVM: arm64: nv: Track L2 to L1 exception emulation
>       KVM: arm64: nv: Don't save/restore FP register during a nested ERET=
 or exception
>       KVM: arm64: timer: Repaint kvm_timer_{should,irq_can}_fire() to kvm=
_timer_{pending,enabled}()
>       KVM: arm64: Simplify userspace notification of interrupt state
>       KVM: arm64: timer: Kill the per-timer irq level cache
>       KVM: arm64: pmu: Kill the PMU interrupt level cache
>       KVM: arm64: vgic-v2: Force vgic init on injection outside the run l=
oop
>       KVM: arm64: vgic-v2: Don't init the vgic on in-kernel interrupt inj=
ection
>       KVM: arm64: vgic-v5: Add for_each_visible_v5_ppi() iterator
>       KVM: arm64: vgic-v5: Move PPI caps into kvm_vgic_global_state
>       KVM: arm64: vgic-v5: Remove use of __assign_bit() with a constant
>       KVM: arm64: vgic-v5: Drop pointless ARM64_HAS_GICV5_CPUIF check
>       KVM: arm64: vgic: Constify struct irq_ops usage
>       KVM: arm64: vgic: Consolidate vgic_allocate_private_irqs_locked()
>       KVM: arm64: vgic-v5: Drop defensive checks from vgic_v5_ppi_queue_i=
rq_unlock()
>       KVM: arm64: vgic: Rationalise per-CPU irq accessor
>       KVM: arm64: vgic-v5: Limit support to 64 PPIs
>       KVM: arm64: Key CPTR_EL2.E0POE propagation on FEAT_S1POE
>       KVM: arm64: Wire AT S1E1A in the system instruction handling table
>       arm64: cpufeature: Expose ID_AA64ISAR2_EL1.ATS1A to KVM
>       KVM: arm64: nv: Avoid dereferencing NULL VNCR pseudo-TLB
>       KVM: arm64: nv: Hold kvm->mmu_lock while initialising vcpu->arch.vn=
cr_tlb
>       Merge branch kvm-arm64/no-lazy-vgic-init into kvmarm-master/next
>       Merge branch kvm-arm64/nv-fp-elision into kvmarm-master/next
>       Merge branch kvm-arm64/nv-granule-sizes into kvmarm-master/next
>       Merge branch kvm-arm64/pkvm-fixes-7.2 into kvmarm-master/next
>       Merge branch kvm-arm64/vgic-v5-PPI-fixes into kvmarm-master/next
>       Merge branch kvm-arm64/misc-7.2 into kvmarm-master/next
>       Merge branch kvm-arm64/nv-mmu-7.2 into kvmarm-master/next
>
> Oliver Upton (5):
>       KVM: arm64: Don't leak PFN when kvm_translate_vncr() races MMU noti=
fier
>       KVM: arm64: nv: Fully update VNCR fixmap state in kvm_translate_vnc=
r()
>       KVM: arm64: nv: Inject SEA TTW when desc update can't write to GPA
>       KVM: arm64: Restart instruction upon race in __kvm_at_s12()
>       KVM: arm64: nv: Restart stage-1 walk if stage-2 desc update fails
>
> Sascha Bischoff (9):
>       KVM: arm64: vgic-v5: Add missing trap handing for NV triage
>       KVM: arm64: vgic-v5: Atomically assign bits to PPI DVI bitmap
>       KVM: arm64: selftests: Add missing GIC CDEN to no-vgic-v5 selftest
>       KVM: arm64: selftests: Cleanup unused vars in GICv5 PPI selftest
>       KVM: arm64: selftests: Improve error handling for GICv5 PPI selftes=
t
>       Documentation: KVM: Fix typos in VGICv5 documentation
>       Documentation: KVM: Clarify that PMU_V3_IRQ IntID requirements for =
GICv5
>       irqchip/gic-v5: Immediately exec priority drop following activate
>       KVM: arm64: Fix arch timer interrupts for GICv3-on-GICv5 guests
>
> Vincent Donnefort (4):
>       KVM: arm64: Reset page order in pKVM hyp_pool
>       KVM: arm64: Fix __pkvm_init_vm error path
>       KVM: arm64: Add fail-safe for refcounted pages in __pkvm_hyp_donate=
_host
>       KVM: arm64: Set a Linux errno on SMCCC error in kvm_call_hyp_nvhe()
>
> Wei-Lin Chang (5):
>       KVM: arm64: nv: Rename vtcr_to_walk_info() to setup_s2_walk()
>       KVM: arm64: Factor out TG0/1 decoding of VTCR and TCR
>       KVM: arm64: nv: Use literal granule size in TLBI range calculation
>       KVM: arm64: Fallback to a supported value for unsupported guest TGx
>       KVM: arm64: Fix block mapping validity check in stage-1 walker
>
> Will Deacon (1):
>       KVM: arm64: Don't populate TPIDR_EL2 in finalise_el2()
>
> Zenghui Yu (Huawei) (1):
>       KVM: arm64: Remove @arch from __load_stage2()
>
> tabba@google.com (4):
>       KVM: arm64: Flush HCR_EL2.VSE to deliver SErrors to pKVM guests
>       KVM: arm64: Free hyp-share tracking node when share hypercall fails
>       KVM: arm64: Avoid host/hyp share desync on unshare hypercall failur=
e
>       KVM: arm64: Roll back partial shares on kvm_share_hyp() failure
>
>  Documentation/virt/kvm/devices/arm-vgic-v5.rst |   6 +-
>  Documentation/virt/kvm/devices/vcpu.rst        |   7 +-
>  arch/arm64/include/asm/kvm_host.h              |   8 +-
>  arch/arm64/include/asm/kvm_hyp.h               |   1 +
>  arch/arm64/include/asm/kvm_mmu.h               |   3 +-
>  arch/arm64/kernel/cpufeature.c                 |   1 +
>  arch/arm64/kernel/hyp-stub.S                   |   4 +-
>  arch/arm64/kvm/arch_timer.c                    | 137 +++++++--------
>  arch/arm64/kvm/arm.c                           |  41 +++--
>  arch/arm64/kvm/at.c                            | 146 +++++++++++----
>  arch/arm64/kvm/emulate-nested.c                |  12 ++
>  arch/arm64/kvm/fpsimd.c                        |  26 +++
>  arch/arm64/kvm/hyp/include/hyp/switch.h        |   2 +-
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h  |   3 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c             |  21 ++-
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c          |  37 ++--
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c           |  21 ++-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                 |   4 +-
>  arch/arm64/kvm/hyp/nvhe/switch.c               |   2 +-
>  arch/arm64/kvm/hyp/nvhe/tlb.c                  |   4 +-
>  arch/arm64/kvm/hyp/vgic-v5-sr.c                |  82 ++-------
>  arch/arm64/kvm/hyp/vhe/switch.c                |   2 +-
>  arch/arm64/kvm/hyp/vhe/tlb.c                   |   4 +-
>  arch/arm64/kvm/mmu.c                           |  39 ++++-
>  arch/arm64/kvm/nested.c                        | 234 ++++++++++++++++---=
------
>  arch/arm64/kvm/pmu-emul.c                      |  31 +---
>  arch/arm64/kvm/sys_regs.c                      |  20 +--
>  arch/arm64/kvm/vgic/vgic-init.c                |  45 ++---
>  arch/arm64/kvm/vgic/vgic-irqfd.c               |   6 +
>  arch/arm64/kvm/vgic/vgic-its.c                 |  21 +--
>  arch/arm64/kvm/vgic/vgic-kvm-device.c          |   9 +-
>  arch/arm64/kvm/vgic/vgic-v5.c                  |  51 ++----
>  arch/arm64/kvm/vgic/vgic.c                     |  33 ++--
>  arch/arm64/kvm/vgic/vgic.h                     |   3 +
>  drivers/irqchip/irq-gic-v5.c                   |  13 +-
>  include/kvm/arm_arch_timer.h                   |   7 +-
>  include/kvm/arm_pmu.h                          |   5 +-
>  include/kvm/arm_vgic.h                         |  19 +-
>  tools/testing/selftests/kvm/arm64/no-vgic.c    |   1 +
>  tools/testing/selftests/kvm/arm64/vgic_v5.c    |  10 +-
>  40 files changed, 651 insertions(+), 470 deletions(-)
>


