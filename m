Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94DECAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 17:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crxiY9tGRwN9dw+nVFA/3krVGNuaMXqKw46DEWrYr1I=; b=jKrRonhFWPRuXkiGXZi9elQhNu
	Yv0d+kRUmzP1gc1dF5m61kHlGEjbnQyEQfEUcGkChB/GTnxs+mkvEQI/rDlf1Pxf5MXj51J4UQMW6
	QX5u9vj4dJKhCvWIUTUfGPVdnLn6nIQSt88FMRpYv4hMlttRZIV6fzNcezeHUf7Hj8XP29e8E00Yf
	iqgIMSqdh80oob2ovpIHGIpJgNzfGzIJrozsi5Y8VjM7TMKpeKqcQ/xaI21DUmRfEIXecTXj1jo7f
	4Mjqeh6Q5sSwREsOuqjTCr36OaFJnCU/75zWye+iSZSS2GoV3b2rAz5T5+XLqEJ3xuOmeDvkJmtNJ
	nUXK4RVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3duG-00000005r2F-463v;
	Tue, 30 Sep 2025 17:12:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3duD-00000005r1f-40He
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 17:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759252367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crxiY9tGRwN9dw+nVFA/3krVGNuaMXqKw46DEWrYr1I=;
	b=TAzc/VoCTgEhJsASa5LXNS04sm+tuJ5HsScMUzj/v3GcuTTUmR4TgnPywSO5xVmSSUGc+2
	LcCjfBKl46xUYfY5feg+UcK362NbH9GaWGxwZRhT1wZL6t8oWJR/bCsxJ+dBBR5wIGr9NR
	4ve43yQRTev0uS5VEzRjUjfauGnje40=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-caR-k5dmOCuslydh0QMBww-1; Tue, 30 Sep 2025 13:12:45 -0400
X-MC-Unique: caR-k5dmOCuslydh0QMBww-1
X-Mimecast-MFC-AGG-ID: caR-k5dmOCuslydh0QMBww_1759252364
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ee1365964cso4373951f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 10:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759252364; x=1759857164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crxiY9tGRwN9dw+nVFA/3krVGNuaMXqKw46DEWrYr1I=;
        b=C/tZvccb5ritmv/+HIMmFcWbO7rK9IXrSyrPrd6i1k3ZGUxudmRUu6DgMEJR1YIWo3
         yOQWDb2yBJyzd3fQq6aQM4C8hpNb081Co1xv0FkfWW6QX3LmQmGrGOfuZp+pK+xZLI8n
         g3hUf62TgR7f97Rh3otQXheM8pAsR6VBpIrw16UcLfkBW6+BxI1TIDBXQiYcvfxSbz9D
         e6oWqjFo4eno9YCm9m3nopWb6Zm/wWCI20Qn/rN8bs14Nw/i1oltTIfhuYnt9D7tMXJu
         ufHoIMh+r5p+2C5bmvIuIetYNp+0SlSQGmA9YyvqLnNa1vSW3ozOCPdZ4syn64Fnrw7F
         eLsw==
X-Forwarded-Encrypted: i=1; AJvYcCVB1wXNu7vO0tJxSsIbGoD7Zx54Ffh7OuDWYVbA9x3AJ5FL9EM/kfDVcNXKCg67508HZeemFGCyLXL1tpEjP/aE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+egnk2jLbkmcYRzP4kvlB5cgp84xYoKffop+Iy71hvTPF3l3k
	J/PnFydNDIeTVm3HOo9inoyxSsW87GR9kUy4++lAYWkmu2EeclUD/0y5K4j/m+R71VWJCNRGORJ
	k1ILkQgFGCu3SN9p46CrCBwdHtuqRU8xSGTWJzIjWETNlas6PjIuxWkTxuyIj+kAIWcMHwZCUIO
	pjtKW4mhVzd2mPwzVg3XY3QntGyh9SL2vR+qjUuCQsXgdtWlFISec=
X-Gm-Gg: ASbGncugoC/eiIFSU++iSxvlP6kYHu5ZkaveH+xShH4D5us6o2/Et2ydTvEoCU6Fjou
	qMEO5Z9daQmdscObUgVidn6Mw6f5mRObyTzb9hCjWDaIdxKPXxcKSpGceSex54OJ5fnnlyQkHSp
	nPcNVgJr6LankkDsnvRQYIrYLGpa6tK3+6PBFpspq/2NtliRfwINe97O/egNOTnyxOxkt6wRXAU
	FqMJ6FqEdypkgbrdY2D8fNH4cSsZxj/
X-Received: by 2002:a05:6000:420a:b0:3f0:9bf0:a369 with SMTP id ffacd0b85a97d-425577f34e9mr452466f8f.14.1759252363948;
        Tue, 30 Sep 2025 10:12:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtaqrr0vVmcivSg/YJxtVy/BjOxhQ3k2UEwlP01pXmVPiJQoN4zRbSjkS6a+a4z9Ide2LvHaou3Ic7hF4LMS8=
X-Received: by 2002:a05:6000:420a:b0:3f0:9bf0:a369 with SMTP id
 ffacd0b85a97d-425577f34e9mr452422f8f.14.1759252363372; Tue, 30 Sep 2025
 10:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250925182611.2585933-1-maz@kernel.org>
In-Reply-To: <20250925182611.2585933-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 30 Sep 2025 19:12:31 +0200
X-Gm-Features: AS18NWBqfCBUwLAI9xj9-s_mUFVswliDzX1ByAR29CS4xYp5lzSZuLHCxRIhhsA
Message-ID: <CABgObfbq2baD2wuDkX3Wyhh7y+n52tGOJcG_f6w+zUU_6aj3Pg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 updates for 6.18
To: Marc Zyngier <maz@kernel.org>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Ayrton Munoz <ayrton@google.com>, Ben Horgan <ben.horgan@arm.com>, Fuad Tabba <tabba@google.com>, 
	Itaru Kitayama <itaru.kitayama@linux.dev>, James Clark <james.clark@linaro.org>, 
	Jinqian Yang <yangjinqian1@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Keir Fraser <keirf@google.com>, Kunwu Chan <kunwu.chan@linux.dev>, Leo Yan <leo.yan@arm.com>, 
	Li RongQing <lirongqing@baidu.com>, Mark Brown <broonie@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Per Larsen <perlarsen@google.com>, 
	Quentin Perret <qperret@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincent Donnefort <vdonnefort@google.com>, 
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>, Will Deacon <will@kernel.org>, 
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4X_RDY_v4ovM5ligz5mzochpjuvI_3gMNPXe94zmJAI_1759252364
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_101250_148310_EFB4476F 
X-CRM114-Status: GOOD (  36.78  )
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

On Thu, Sep 25, 2025 at 8:26=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> Here's the initial set of updates for 6.18.
>
> As expected, we have a bunch of NV follow-ups, fixing a number of
> issues and working around some architectural misfeatures. Of note is
> the addition of a basic framework to run our EL1 tests at EL2 in a
> more or less transparent way. On the pKVM side, the only new thing is
> the FF-A 1.2 support, which I'm sure will change the world as we know
> it </sarcasm>.
>
> As usual, a whole lot of more or less interesting fixes, details in
> the tag below.
>
> Please pull,

Can't complain about more self tests! Pulled, thanks - sorry for the delay.

Paolo

>         M.
>
> The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afc=
f0:
>
>   Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-6.18
>
> for you to fetch changes up to 10fd0285305d0b48e8a3bf15d4f17fc4f3d68cb6:
>
>   Merge branch kvm-arm64/selftests-6.18 into kvmarm-master/next (2025-09-=
24 19:35:50 +0100)
>
> ----------------------------------------------------------------
> KVM/arm64 updates for 6.18
>
> - Add support for FF-A 1.2 as the secure memory conduit for pKVM,
>   allowing more registers to be used as part of the message payload.
>
> - Change the way pKVM allocates its VM handles, making sure that the
>   privileged hypervisor is never tricked into using uninitialised
>   data.
>
> - Speed up MMIO range registration by avoiding unnecessary RCU
>   synchronisation, which results in VMs starting much quicker.
>
> - Add the dump of the instruction stream when panic-ing in the EL2
>   payload, just like the rest of the kernel has always done. This will
>   hopefully help debugging non-VHE setups.
>
> - Add 52bit PA support to the stage-1 page-table walker, and make use
>   of it to populate the fault level reported to the guest on failing
>   to translate a stage-1 walk.
>
> - Add NV support to the GICv3-on-GICv5 emulation code, ensuring
>   feature parity for guests, irrespective of the host platform.
>
> - Fix some really ugly architecture problems when dealing with debug
>   in a nested VM. This has some bad performance impacts, but is at
>   least correct.
>
> - Add enough infrastructure to be able to disable EL2 features and
>   give effective values to the EL2 control registers. This then allows
>   a bunch of features to be turned off, which helps cross-host
>   migration.
>
> - Large rework of the selftest infrastructure to allow most tests to
>   transparently run at EL2. This is the first step towards enabling
>   NV testing.
>
> - Various fixes and improvements all over the map, including one BE
>   fix, just in time for the removal of the feature.
>
> ----------------------------------------------------------------
> Alexandru Elisei (1):
>       KVM: arm64: Update stale comment for sanitise_mte_tags()
>
> Ben Horgan (1):
>       KVM: arm64: Fix debug checking for np-guests using huge mappings
>
> Fuad Tabba (10):
>       KVM: arm64: Add build-time check for duplicate DECLARE_REG use
>       KVM: arm64: Rename pkvm.enabled to pkvm.is_protected
>       KVM: arm64: Rename 'host_kvm' to 'kvm' in pKVM host code
>       KVM: arm64: Clarify comments to distinguish pKVM mode from protecte=
d VMs
>       KVM: arm64: Decouple hyp VM creation state from its handle
>       KVM: arm64: Separate allocation and insertion of pKVM VM table entr=
ies
>       KVM: arm64: Consolidate pKVM hypervisor VM initialization logic
>       KVM: arm64: Introduce separate hypercalls for pKVM VM reservation a=
nd initialization
>       KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()
>       KVM: arm64: Fix page leak in user_mem_abort()
>
> James Clark (1):
>       KVM: arm64: Add trap configs for PMSDSFR_EL1
>
> Jinqian Yang (2):
>       KVM: arm64: Make ID_AA64MMFR1_EL1.{HCX, TWED} writable from userspa=
ce
>       KVM: arm64: selftests: Test writes to ID_AA64MMFR1_EL1.{HCX, TWED}
>
> Keir Fraser (4):
>       KVM: arm64: vgic-init: Remove vgic_ready() macro
>       KVM: arm64: vgic: Explicitly implement vgic_dist::ready ordering
>       KVM: Implement barriers before accessing kvm->buses[] on SRCU read =
paths
>       KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
>
> Marc Zyngier (39):
>       Merge branch kvm-arm64/ffa-1.2 into kvmarm-master/next
>       Merge branch kvm-arm64/pkvm_vm_handle into kvmarm-master/next
>       KVM: arm64: Fix kvm_vcpu_{set,is}_be() to deal with EL2 state
>       Merge branch kvm-arm64/mmio-rcu into kvmarm-master/next
>       Merge branch kvm-arm64/dump-instr into kvmarm-master/next
>       KVM: arm64: Don't access ICC_SRE_EL2 if GICv3 doesn't support v2 co=
mpatibility
>       KVM: arm64: Remove duplicate FEAT_{SYSREG128,MTE2} descriptions
>       KVM: arm64: Add reg_feat_map_desc to describe full register depende=
ncy
>       KVM: arm64: Enforce absence of FEAT_FGT on FGT registers
>       KVM: arm64: Enforce absence of FEAT_FGT2 on FGT2 registers
>       KVM: arm64: Enforce absence of FEAT_HCX on HCRX_EL2
>       KVM: arm64: Convert HCR_EL2 RES0 handling to compute_reg_res0_bits(=
)
>       KVM: arm64: Enforce absence of FEAT_SCTLR2 on SCTLR2_EL{1,2}
>       KVM: arm64: Enforce absence of FEAT_TCR2 on TCR2_EL2
>       KVM: arm64: Convert SCTLR_EL1 RES0 handling to compute_reg_res0_bit=
s()
>       KVM: arm64: Convert MDCR_EL2 RES0 handling to compute_reg_res0_bits=
()
>       KVM: arm64: Add helper computing the state of 52bit PA support
>       KVM: arm64: Account for 52bit when computing maximum OA
>       KVM: arm64: Compute 52bit TTBR address and alignment
>       KVM: arm64: Decouple output address from the PT descriptor
>       KVM: arm64: Pass the walk_info structure to compute_par_s1()
>       KVM: arm64: Compute shareability for LPA2
>       KVM: arm64: Populate PAR_EL1 with 52bit addresses
>       KVM: arm64: Expand valid block mappings to FEAT_LPA/LPA2 support
>       KVM: arm64: Report faults from S1 walk setup at the expected start =
level
>       KVM: arm64: Allow use of S1 PTW for non-NV vcpus
>       KVM: arm64: Allow EL1 control registers to be accessed from the CPU=
 state
>       KVM: arm64: Don't switch MMU on translation from non-NV context
>       KVM: arm64: Add filtering hook to S1 page table walk
>       KVM: arm64: Add S1 IPA to page table level walker
>       KVM: arm64: Populate level on S1PTW SEA injection
>       KVM: arm64: selftest: Expand external_aborts test to look for TTW l=
evels
>       Merge branch kvm-arm64/52bit-at into kvmarm-master/next
>       Merge branch kvm-arm64/gic-v5-nv into kvmarm-master/next
>       Merge branch kvm-arm64/nv-debug into kvmarm-master/next
>       Merge branch kvm-arm64/el2-feature-control into kvmarm-master/next
>       Merge branch kvm-arm64/nv-misc-6.18 into kvmarm-master/next
>       Merge branch kvm-arm64/misc-6.18 into kvmarm-master/next
>       Merge branch kvm-arm64/selftests-6.18 into kvmarm-master/next
>
> Mark Brown (3):
>       KVM: arm64: Expose FEAT_LSFE to guests
>       KVM: arm64: selftests: Remove a duplicate register listing in set_i=
d_regs
>       KVM: arm64: selftests: Cover ID_AA64ISAR3_EL1 in set_id_regs
>
> Mostafa Saleh (2):
>       KVM: arm64: Dump instruction on hyp panic
>       KVM: arm64: Map hyp text as RO and dump instr on panic
>
> Oliver Upton (29):
>       KVM: arm64: nv: Trap debug registers when in hyp context
>       KVM: arm64: nv: Apply guest's MDCR traps in nested context
>       KVM: arm64: nv: Treat AMO as 1 when at EL2 and {E2H,TGE} =3D {1, 0}
>       KVM: arm64: nv: Allow userspace to de-feature stage-2 TGRANs
>       KVM: arm64: nv: Convert masks to denylists in limit_nv_id_reg()
>       KVM: arm64: nv: Don't erroneously claim FEAT_DoubleLock for NV VMs
>       KVM: arm64: nv: Expose FEAT_DF2 to NV-enabled VMs
>       KVM: arm64: nv: Expose FEAT_RASv1p1 via RAS_frac
>       KVM: arm64: nv: Expose FEAT_ECBHB to NV-enabled VMs
>       KVM: arm64: nv: Expose FEAT_AFP to NV-enabled VMs
>       KVM: arm64: nv: Exclude guest's TWED configuration when TWE isn't s=
et
>       KVM: arm64: nv: Expose FEAT_TWED to NV-enabled VMs
>       KVM: arm64: nv: Advertise FEAT_SpecSEI to NV-enabled VMs
>       KVM: arm64: nv: Advertise FEAT_TIDCP1 to NV-enabled VMs
>       KVM: arm64: nv: Expose up to FEAT_Debugv8p8 to NV-enabled VMs
>       KVM: arm64: selftests: Provide kvm_arch_vm_post_create() in library=
 code
>       KVM: arm64: selftests: Initialize VGICv3 only once
>       KVM: arm64: selftests: Add helper to check for VGICv3 support
>       KVM: arm64: selftests: Add unsanitised helpers for VGICv3 creation
>       KVM: arm64: selftests: Create a VGICv3 for 'default' VMs
>       KVM: arm64: selftests: Alias EL1 registers to EL2 counterparts
>       KVM: arm64: selftests: Provide helper for getting default vCPU targ=
et
>       KVM: arm64: selftests: Select SMCCC conduit based on current EL
>       KVM: arm64: selftests: Use hyp timer IRQs when test runs at EL2
>       KVM: arm64: selftests: Use the vCPU attr for setting nr of PMU coun=
ters
>       KVM: arm64: selftests: Initialize HCR_EL2
>       KVM: arm64: selftests: Enable EL2 by default
>       KVM: arm64: selftests: Add basic test for running in VHE EL2
>       KVM: arm64: selftests: Cope with arch silliness in EL2 selftest
>
> Per Larsen (6):
>       KVM: arm64: Correct return value on host version downgrade attempt
>       KVM: arm64: Use SMCCC 1.2 for FF-A initialization and in host handl=
er
>       KVM: arm64: Mark FFA_NOTIFICATION_* calls as unsupported
>       KVM: arm64: Mark optional FF-A 1.2 interfaces as unsupported
>       KVM: arm64: Mask response to FFA_FEATURE call
>       KVM: arm64: Bump the supported version of FF-A to 1.2
>
> Sascha Bischoff (4):
>       KVM: arm64: Enable nested for GICv5 host with FEAT_GCIE_LEGACY
>       arm64: cpucaps: Add GICv5 Legacy vCPU interface (GCIE_LEGACY) capab=
ility
>       KVM: arm64: Use ARM64_HAS_GICV5_LEGACY for GICv5 probing
>       irqchip/gic-v5: Drop has_gcie_v3_compat from gic_kvm_info
>
> Wei-Lin Chang (1):
>       KVM: arm64: ptdump: Don't test PTE_VALID alongside other attributes
>
> Yingchao Deng (1):
>       KVM: arm64: Return early from trace helpers when KVM isn't availabl=
e
>
>  arch/arm64/include/asm/kvm_asm.h                   |   2 +
>  arch/arm64/include/asm/kvm_emulate.h               |  34 +-
>  arch/arm64/include/asm/kvm_host.h                  |   5 +-
>  arch/arm64/include/asm/kvm_nested.h                |  27 +-
>  arch/arm64/include/asm/kvm_pkvm.h                  |   1 +
>  arch/arm64/include/asm/traps.h                     |   1 +
>  arch/arm64/include/asm/vncr_mapping.h              |   2 +
>  arch/arm64/kernel/cpufeature.c                     |  15 +
>  arch/arm64/kernel/image-vars.h                     |   3 +
>  arch/arm64/kernel/traps.c                          |  15 +-
>  arch/arm64/kvm/arm.c                               |  19 +-
>  arch/arm64/kvm/at.c                                | 376 +++++++++++++++=
------
>  arch/arm64/kvm/config.c                            | 358 +++++++++++++--=
-----
>  arch/arm64/kvm/debug.c                             |  25 +-
>  arch/arm64/kvm/emulate-nested.c                    |   1 +
>  arch/arm64/kvm/handle_exit.c                       |   3 +
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h             |   4 +-
>  arch/arm64/kvm/hyp/include/nvhe/trap_handler.h     |   3 +-
>  arch/arm64/kvm/hyp/nvhe/Makefile                   |   1 +
>  arch/arm64/kvm/hyp/nvhe/ffa.c                      | 217 ++++++++----
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c                 |  14 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c              |   9 +-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                     | 177 +++++++---
>  arch/arm64/kvm/hyp/nvhe/setup.c                    |  12 +-
>  arch/arm64/kvm/hyp/vgic-v3-sr.c                    |  25 +-
>  arch/arm64/kvm/hyp/vhe/switch.c                    |   7 +
>  arch/arm64/kvm/inject_fault.c                      |  27 +-
>  arch/arm64/kvm/mmu.c                               |  16 +-
>  arch/arm64/kvm/nested.c                            |  80 ++++-
>  arch/arm64/kvm/pkvm.c                              |  76 +++--
>  arch/arm64/kvm/ptdump.c                            |  20 +-
>  arch/arm64/kvm/sys_regs.c                          |  55 ++-
>  arch/arm64/kvm/vgic/vgic-init.c                    |  14 +-
>  arch/arm64/kvm/vgic/vgic-v3.c                      |   8 +
>  arch/arm64/kvm/vgic/vgic-v5.c                      |   2 +-
>  arch/arm64/tools/cpucaps                           |   1 +
>  arch/x86/kvm/vmx/vmx.c                             |   7 +
>  drivers/irqchip/irq-gic-v5.c                       |   7 -
>  include/kvm/arm_vgic.h                             |   2 +-
>  include/linux/arm_ffa.h                            |   1 +
>  include/linux/irqchip/arm-vgic-info.h              |   2 -
>  include/linux/kvm_host.h                           |  11 +-
>  tools/testing/selftests/kvm/Makefile.kvm           |   1 +
>  tools/testing/selftests/kvm/arm64/arch_timer.c     |  13 +-
>  .../selftests/kvm/arm64/arch_timer_edge_cases.c    |  13 +-
>  .../testing/selftests/kvm/arm64/external_aborts.c  |  42 +++
>  tools/testing/selftests/kvm/arm64/hello_el2.c      |  71 ++++
>  tools/testing/selftests/kvm/arm64/hypercalls.c     |   2 +-
>  tools/testing/selftests/kvm/arm64/kvm-uuid.c       |   2 +-
>  tools/testing/selftests/kvm/arm64/no-vgic-v3.c     |   2 +
>  tools/testing/selftests/kvm/arm64/psci_test.c      |  13 +-
>  tools/testing/selftests/kvm/arm64/set_id_regs.c    |  44 +--
>  tools/testing/selftests/kvm/arm64/smccc_filter.c   |  17 +-
>  tools/testing/selftests/kvm/arm64/vgic_init.c      |   2 +
>  tools/testing/selftests/kvm/arm64/vgic_irq.c       |   4 +-
>  .../testing/selftests/kvm/arm64/vgic_lpi_stress.c  |   8 +-
>  .../selftests/kvm/arm64/vpmu_counter_access.c      |  75 ++--
>  tools/testing/selftests/kvm/dirty_log_perf_test.c  |  35 --
>  tools/testing/selftests/kvm/dirty_log_test.c       |   1 +
>  tools/testing/selftests/kvm/get-reg-list.c         |   9 +-
>  .../selftests/kvm/include/arm64/arch_timer.h       |  24 ++
>  .../selftests/kvm/include/arm64/kvm_util_arch.h    |   5 +-
>  .../selftests/kvm/include/arm64/processor.h        |  74 ++++
>  tools/testing/selftests/kvm/include/arm64/vgic.h   |   3 +
>  tools/testing/selftests/kvm/include/kvm_util.h     |   7 +-
>  tools/testing/selftests/kvm/lib/arm64/processor.c  | 104 +++++-
>  tools/testing/selftests/kvm/lib/arm64/vgic.c       |  64 ++--
>  tools/testing/selftests/kvm/lib/kvm_util.c         |  15 +-
>  tools/testing/selftests/kvm/lib/x86/processor.c    |   2 +-
>  tools/testing/selftests/kvm/s390/cmma_test.c       |   2 +-
>  tools/testing/selftests/kvm/steal_time.c           |   2 +-
>  virt/kvm/kvm_main.c                                |  43 ++-
>  72 files changed, 1696 insertions(+), 688 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/arm64/hello_el2.c
>


