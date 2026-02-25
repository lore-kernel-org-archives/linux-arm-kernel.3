Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D40BEFD211
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGuxkMX0kM60aNE9QHAj3qrKDisClRlnBUy8ZVl16+8=; b=36/iD00DDM6E4zdW1iDN8qz85g
	95i5ZxelGC9zKB5yO9p/GUT6aXrxvzd5Y5qLrh5O3s1oT+53FOD3gmT9njGBeRhahpsAs6VrzCli8
	wYAhZjzQMlNA+gNuYjvsYkvxvW0jUWt6t1aaMidiZK3RKzcA1V5UL+gS0MVG6NGOYRD9Y24j6Ess+
	gbMv8zKK/zCUG2gv3I7uLc31R4IRsyl63zHCbpZ+2Nut2rqfUkRdWI8VvXpIgCeGUHrvAT2BpDM0w
	upJBnijyfVFecOXST4ak5VS9MrixtxQbSQxjKcSCJ9tu5wOBoQbYB50fzLlIs4bmga30ay+WGx1v6
	4UFhIu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB6S-00000003fO2-1NCe;
	Wed, 25 Feb 2026 09:22:44 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB6P-00000003fN5-0632
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:22:42 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-65f812e0d93so1236746a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 01:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772011359; x=1772616159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGuxkMX0kM60aNE9QHAj3qrKDisClRlnBUy8ZVl16+8=;
        b=pwB0+sb9bYEYLaMiZfbyw28Kirjteh1rkRLmqy3HeNF+sro29Xz5rYAyRMVGG2KX98
         Js2g8BhAfVLsDHkzTdBOX2SLw70jw9U+G02IVgRcdMCaEhjNOcJ4QlDYjRiqKM8NwZGq
         ufz98xXVZGckqCdaVwt17x/5U32SO8hmfPuwXnh5BwFU2pnNKLi5GCkV1HO01qWsGtKw
         4dNaQjMbcxhvOhR/avZpGZPaep5NXvApOVuWMce7dC8u/BWmR9/sA0bP8KlXuf1ORD6X
         LglzuAyvxZcWIIunHbGmLuUbsleysfOXjATeSL0SjHkwUvD0kdwR8WFgju1NdExYBdVi
         cADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011359; x=1772616159;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGuxkMX0kM60aNE9QHAj3qrKDisClRlnBUy8ZVl16+8=;
        b=YR9pNswgxDExl6VMTgEiM1VmiFnzj/ucFsEOuVO1mWTiCtVOF2AlffBlYTIMMEW8E8
         a17s+gVtzrlXWJJd3t1YwItOQtEYMUMYW5VyqAyJaVr7vdg5dEwLgfILq7js7ZgrXTCM
         TNJS3y4DHrsVRwq5b+iIGBFF72U1EseJGQyiTSPAeeDJNohvC6sQXcpGdlASJw4qXKAo
         yFQu3erb8QaFMdtPdQfFAawZv0TUsBEBEoSWq96jRMquzazuOpMu2Rz+LWIBpALWohvu
         sTynmOq2QLoelVtSSC1wUVBTqUBUGM1LJoj1B1jF1tJ1LPTF/8DjDT0btPN70COKUP0b
         s1Og==
X-Forwarded-Encrypted: i=1; AJvYcCVNl1bywMy/PHSLM4oWlOtmW3+ImvqZ/oTUtPDeCtdnYd/2N0CfwQAOg1SgoTh62qtXKMFHieSfYB2FX40fPT3o@lists.infradead.org
X-Gm-Message-State: AOJu0YyCbzMol0Az1LxDuTlgS3dAqVMjuVbgUCQtkoCZhAbNtFwmMep8
	KRZen27sZTu1toMaNNRX7u/zhMQ4dc5c5XfwuZccjE7URyw4a6So4yDF6LwGGwrUAuQ=
X-Gm-Gg: ATEYQzzJ7N9N+mOzFfQdEUkoML1B7t2XwiQy3r6mR03UqcQMy3khCkOw3jbRky8O/br
	yAutUOzZ6IxL0EkKuz6t/fsmaZPpfctpdrYPQrC4cw01oqlpThdMv3+SVKGdcxEgydat/z0ceSq
	D7tYgNRnleGIxmaItq7K9cS8ZqJeIa/GvW99uQBfmzKVSWMQNfHHsLgRDuIQe0vDyGFei2gFd/B
	nWOFLxB5pO9/+p+sCuboLR8NBrsWF1KaSA7M7tNWsRWfsclzG9Y9Y/TmLQ3HneStixdWYfV33lQ
	tWroL6l8TmfQq70402vTdBwlY6646WP5IVwDkgCqi16x46s5rO690WxaR0InO7lStvG3OUSxCa1
	O3HHaf0Hl/rGIyTTiz21oACVH7bz8oI5vHifDTBVGg8a5Xg1ObJ34Un4pWIcXK7qBkhuPHBMZke
	ExniDn8gXvXmkobRKBI4RXeHU=
X-Received: by 2002:a17:907:d8c:b0:b8f:a8bc:a081 with SMTP id a640c23a62f3a-b9081a02587mr927550166b.19.1772011358547;
        Wed, 25 Feb 2026 01:22:38 -0800 (PST)
Received: from draig.lan ([185.124.0.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eaba1375dsm4099202a12.21.2026.02.25.01.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:22:37 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id EAB235F834;
	Wed, 25 Feb 2026 09:22:36 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,  Joey Gouly <joey.gouly@arm.com>,
  Catalin Marinas <catalin.marinas@arm.com>,  Suzuki K Poulose
 <suzuki.poulose@arm.com>,  Will Deacon <will@kernel.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <shuah@kernel.org>,  Oliver Upton <oupton@kernel.org>,  Dave Martin
 <Dave.Martin@arm.com>,  Fuad Tabba <tabba@google.com>,  Mark Rutland
 <mark.rutland@arm.com>,  Ben Horgan <ben.horgan@arm.com>,
  linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
  linux-kernel@vger.kernel.org,  kvm@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v9 00/30] KVM: arm64: Implement support for SME
In-Reply-To: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> (Mark
	Brown's message of "Tue, 23 Dec 2025 01:20:54 +0000")
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Wed, 25 Feb 2026 09:22:36 +0000
Message-ID: <87fr6p2n4z.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_012241_140007_0BF8EF47 
X-CRM114-Status: GOOD (  52.25  )
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

Mark Brown <broonie@kernel.org> writes:

> I've removed the RFC tag from this version of the series, but the items
> that I'm looking for feedback on remains the same:
>
>  - The userspace ABI, in particular:
>   - The vector length used for the SVE registers, access to the SVE
>     registers and access to ZA and (if available) ZT0 depending on
>     the current state of PSTATE.{SM,ZA}.
>   - The use of a single finalisation for both SVE and SME.
>

Hi Mark,

Richard has posted an initial QEMU RFC series here:

  Message-ID: <20260216034432.23912-1-richard.henderson@linaro.org>
  Date: Mon, 16 Feb 2026 13:44:19 +1000
  Subject: [RFC PATCH 00/13] target/arm: Support SME for KVM
  From: Richard Henderson <richard.henderson@linaro.org>

For those that would like to test. Given the residency of SME2 context
and the timing of running everything under TCG it might be worth adding
some SME2 workloads to the kvm-unit-tests similar to how the GIC ITS
migration is tested.

>  - The addition of control for enabling fine grained traps in a similar
>    manner to FGU but without the UNDEF, I'm not clear if this is desired
>    at all and at present this requires symmetric read and write traps like
>    FGU. That seemed like it might be desired from an implementation
>    point of view but we already have one case where we enable an
>    asymmetric trap (for ARM64_WORKAROUND_AMPERE_AC03_CPU_38) and it
>    seems generally useful to enable asymmetrically.
>
> This series implements support for SME use in non-protected KVM guests.
> Much of this is very similar to SVE, the main additional challenge that
> SME presents is that it introduces a new vector length similar to the
> SVE vector length and two new controls which change the registers seen
> by guests:
>
>  - PSTATE.ZA enables the ZA matrix register and, if SME2 is supported,
>    the ZT0 LUT register.
>  - PSTATE.SM enables streaming mode, a new floating point mode which
>    uses the SVE register set with the separately configured SME vector
>    length.  In streaming mode implementation of the FFR register is
>    optional.
>
> It is also permitted to build systems which support SME without SVE, in
> this case when not in streaming mode no SVE registers or instructions
> are available.  Further, there is no requirement that there be any
> overlap in the set of vector lengths supported by SVE and SME in a
> system, this is expected to be a common situation in practical systems.
>
> Since there is a new vector length to configure we introduce a new
> feature parallel to the existing SVE one with a new pseudo register for
> the streaming mode vector length.  Due to the overlap with SVE caused by
> streaming mode rather than finalising SME as a separate feature we use
> the existing SVE finalisation to also finalise SME, a new define
> KVM_ARM_VCPU_VEC is provided to help make user code clearer.  Finalising
> SVE and SME separately would introduce complication with register access
> since finalising SVE makes the SVE registers writeable by userspace and
> doing multiple finalisations results in an error being reported.
> Dealing with a state where the SVE registers are writeable due to one of
> SVE or SME being finalised but may have their VL changed by the other
> being finalised seems like needless complexity with minimal practical
> utility, it seems clearer to just express directly that only one
> finalisation can be done in the ABI.
>
> Access to the floating point registers follows the architecture:
>
>  - When both SVE and SME are present:
>    - If PSTATE.SM =3D=3D 0 the vector length used for the Z and P registe=
rs
>      is the SVE vector length.
>    - If PSTATE.SM =3D=3D 1 the vector length used for the Z and P registe=
rs
>      is the SME vector length.
>  - If only SME is present:
>    - If PSTATE.SM =3D=3D 0 the Z and P registers are inaccessible and the
>      floating point state accessed via the encodings for the V registers.
>    - If PSTATE.SM =3D=3D 1 the vector length used for the Z and P registe=
rs
>  - The SME specific ZA and ZT0 registers are only accessible if SVCR.ZA i=
s 1.
>
> The VMM must understand this, in particular when loading state SVCR
> should be configured before other state.  It should be noted that while
> the architecture refers to PSTATE.SM and PSTATE.ZA these PSTATE bits are
> not preserved in SPSR_ELx, they are only accessible via SVCR.
>
> There are a large number of subfeatures for SME, most of which only
> offer additional instructions but some of which (SME2 and FA64) add
> architectural state. These are configured via the ID registers as per
> usual.
>
> Protected KVM supported, with the implementation maintaining the
> existing restriction that the hypervisor will refuse to run if streaming
> mode or ZA is enabled.  This both simplfies the code and avoids the need
> to allocate storage for host ZA and ZT0 state, there seems to be little
> practical use case for supporting this and the memory usage would be
> non-trivial.
>
> The new KVM_ARM_VCPU_VEC feature and ZA and ZT0 registers have not been
> added to the get-reg-list selftest, the idea of supporting additional
> features there without restructuring the program to generate all
> possible feature combinations has been rejected.  I will post a separate
> series which does that restructuring.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Changes in v9:
> - Rebase onto v6.19-rc1.
> - ABI document clarifications.
> - Add changes dropping asserts on single bit wide bitfields in set_id_reg=
s.
> - Link to v8: https://lore.kernel.org/r/20250902-kvm-arm64-sme-v8-0-2cb21=
99c656c@kernel.org
>
> Changes in v8:
> - Small fixes in ABI documentation.
> - Link to v7: https://lore.kernel.org/r/20250822-kvm-arm64-sme-v7-0-7a65d=
82b8b10@kernel.org
>
> Changes in v7:
> - Rebase onto v6.17-rc1.
> - Handle SMIDR_EL1 as a VM wide ID register and use this in feat_sme_smps=
().
> - Expose affinity fields in SMIDR_EL1.
> - Remove SMPRI_EL1 from vcpu_sysreg, the value is always 0 currently.
> - Prevent userspace writes to SMPRIMAP_EL2.
> - Link to v6: https://lore.kernel.org/r/20250625-kvm-arm64-sme-v6-0-114cf=
f4ffe04@kernel.org
>
> Changes in v6:
> - Rebase onto v6.16-rc3.
> - Link to v5: https://lore.kernel.org/r/20250417-kvm-arm64-sme-v5-0-f469a=
2d5f574@kernel.org
>
> Changes in v5:
> - Rebase onto v6.15-rc2.
> - Add pKVM guest support.
> - Always restore SVCR.
> - Link to v4: https://lore.kernel.org/r/20250214-kvm-arm64-sme-v4-0-d64a6=
81adcc2@kernel.org
>
> Changes in v4:
> - Rebase onto v6.14-rc2 and Mark Rutland's fixes.
> - Expose SME to nested guests.
> - Additional cleanups and test fixes following on from the rebase.
> - Flush register state on VMM PSTATE.{SM,ZA}.
> - Link to v3: https://lore.kernel.org/r/20241220-kvm-arm64-sme-v3-0-05b01=
8c1ffeb@kernel.org
>
> Changes in v3:
> - Rebase onto v6.12-rc2.
> - Link to v2: https://lore.kernel.org/r/20231222-kvm-arm64-sme-v2-0-da226=
cb180bb@kernel.org
>
> Changes in v2:
> - Rebase onto v6.7-rc3.
> - Configure subfeatures based on host system only.
> - Complete nVHE support.
> - There was some snafu with sending v1 out, it didn't make it to the
>   lists but in case it hit people's inboxes I'm sending as v2.
>
> ---
> Mark Brown (30):
>       arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
>       arm64/fpsimd: Update FA64 and ZT0 enables when loading SME state
>       arm64/fpsimd: Decide to save ZT0 and streaming mode FFR at bind time
>       arm64/fpsimd: Check enable bit for FA64 when saving EFI state
>       arm64/fpsimd: Determine maximum virtualisable SME vector length
>       KVM: arm64: Pay attention to FFR parameter in SVE save and load
>       KVM: arm64: Pull ctxt_has_ helpers to start of sysreg-sr.h
>       KVM: arm64: Move SVE state access macros after feature test macros
>       KVM: arm64: Rename SVE finalization constants to be more general
>       KVM: arm64: Document the KVM ABI for SME
>       KVM: arm64: Define internal features for SME
>       KVM: arm64: Rename sve_state_reg_region
>       KVM: arm64: Store vector lengths in an array
>       KVM: arm64: Implement SME vector length configuration
>       KVM: arm64: Support SME control registers
>       KVM: arm64: Support TPIDR2_EL0
>       KVM: arm64: Support SME identification registers for guests
>       KVM: arm64: Support SME priority registers
>       KVM: arm64: Provide assembly for SME register access
>       KVM: arm64: Support userspace access to streaming mode Z and P regi=
sters
>       KVM: arm64: Flush register state on writes to SVCR.SM and SVCR.ZA
>       KVM: arm64: Expose SME specific state to userspace
>       KVM: arm64: Context switch SME state for guests
>       KVM: arm64: Handle SME exceptions
>       KVM: arm64: Expose SME to nested guests
>       KVM: arm64: Provide interface for configuring and enabling SME for =
guests
>       KVM: arm64: selftests: Remove spurious check for single bit safe va=
lues
>       KVM: arm64: selftests: Skip impossible invalid value tests
>       KVM: arm64: selftests: Add SME system registers to get-reg-list
>       KVM: arm64: selftests: Add SME to set_id_regs test
>
>  Documentation/virt/kvm/api.rst                   | 120 ++++++++---
>  arch/arm64/include/asm/fpsimd.h                  |  26 +++
>  arch/arm64/include/asm/kvm_emulate.h             |   6 +
>  arch/arm64/include/asm/kvm_host.h                | 163 ++++++++++++---
>  arch/arm64/include/asm/kvm_hyp.h                 |   5 +-
>  arch/arm64/include/asm/kvm_pkvm.h                |   2 +-
>  arch/arm64/include/asm/vncr_mapping.h            |   2 +
>  arch/arm64/include/uapi/asm/kvm.h                |  33 +++
>  arch/arm64/kernel/cpufeature.c                   |   2 -
>  arch/arm64/kernel/fpsimd.c                       |  89 ++++----
>  arch/arm64/kvm/arm.c                             |  10 +
>  arch/arm64/kvm/config.c                          |  11 +-
>  arch/arm64/kvm/fpsimd.c                          |  28 ++-
>  arch/arm64/kvm/guest.c                           | 252 +++++++++++++++++=
+++---
>  arch/arm64/kvm/handle_exit.c                     |  14 ++
>  arch/arm64/kvm/hyp/fpsimd.S                      |  28 ++-
>  arch/arm64/kvm/hyp/include/hyp/switch.h          | 168 +++++++++++++--
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h       | 110 ++++++----
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c               |  86 ++++++--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                   |  85 ++++++--
>  arch/arm64/kvm/hyp/nvhe/switch.c                 |   4 +-
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c               |   6 +
>  arch/arm64/kvm/hyp/vhe/switch.c                  |  17 +-
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c               |   7 +
>  arch/arm64/kvm/nested.c                          |   3 +-
>  arch/arm64/kvm/reset.c                           | 156 ++++++++++----
>  arch/arm64/kvm/sys_regs.c                        | 140 ++++++++++++-
>  arch/arm64/tools/sysreg                          |   8 +-
>  include/uapi/linux/kvm.h                         |   1 +
>  tools/testing/selftests/kvm/arm64/get-reg-list.c |  15 +-
>  tools/testing/selftests/kvm/arm64/set_id_regs.c  |  84 ++++++--
>  31 files changed, 1367 insertions(+), 314 deletions(-)
> ---
> base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
> change-id: 20230301-kvm-arm64-sme-06a1246d3636
>
> Best regards,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

