Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FCBCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vWPgObsdKIJzCeliFezFTjt9ignIo37wjhJliVpVGZE=; b=FGCDvnmfj6hb5d
	9NtamoO4QqYE0rk/vvow57JYsRBz/IzGJ7ssSkXEdMmkSOqfpy7cV3qDcPe5B3Qr/B8piwBmdlEER
	/uYRji7Y7lLd8oDj94MqoOZKc2jDZyFwFRQYIOJXctxx3zaMy9DbcaWpG8erESHRFRQU6uGfuMQ6g
	eAcfNKiCOQUBRn5D8c5SecbUjnx5jILtvw7Q01+0kreIFKEwubE8pqoiEZKmz0QIv9SbG08TPpPGj
	EB1mnzaeSXLKVATEs1a4bfZ6WqY2aUjSzixZM+R9RPh3NoP21plcsUK5VSNDfLinDpVX8qnP+HZGN
	d42Z84bAbeEA3tuV2kcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLAQ-00000001gVX-1OJP;
	Fri, 22 Aug 2025 06:22:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGz7-00000001BQi-3XqT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:54:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A4A75C5698;
	Fri, 22 Aug 2025 01:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D8FC4CEEB;
	Fri, 22 Aug 2025 01:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827667;
	bh=RNtaMbZ2x4QLJdtSV131dRyufCLa7xFY2p4/ptgxCeY=;
	h=From:Subject:Date:To:Cc:From;
	b=nAxBeZ+ScJCPg8sfuC4+HreXmkxX/b9hzP0U4bN6mKOpkpef2SNRtoihbmkTUU28u
	 0DA4qbaaoT9aT3A5tFTeuiu6qw+uCScIeNmOn1e0CyAsB5N7nsO93kMMEFG08UNPTW
	 xd9+O+LyUK1SR1qKhj4pRnTbD/nth41h3CruL3vWhRum8yTO98m/E/a/Ts1G/O3Uza
	 akwnjRAswqO3QNG4ntRsP+BubWHEH0IBX9h1vMoClmb4cIRDCcBfqJYDAJOZDGXu8/
	 F2h5H6oO2ofuqiG/fFra6vXtm8AnpNcGBVx862NPVe1EvyyaOp2PRFi0Kovh0lwMao
	 xwFzWe+7kIktQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v7 00/29] KVM: arm64: Implement support for SME
Date: Fri, 22 Aug 2025 02:53:29 +0100
Message-Id: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvNp2gC/2XRzW6DMAwH8FdBOS9VbBIDPe09ph3yWaIO6AJDm
 6q++0JRVw2OtvKzHf2vbPQp+pEdiytLfo5jHPpcVC8Fs63uT55Hl2uGAktRCuDnueM6dST52Hk
 uSANKciWVxLIxevTcJN3bdlFTd1m6l+RD/L5veXvPdRvHaUg/96UzLN11foO4mT8DFzwEqF0lD
 TbevZ596v3HYUgntoya8Y8D7jlm7jQiWQO1MGbHyweXmYstLzMXygioLYTg91w+uBIIcsvlsp2
 kphq0sxZ3XD25hGrL1fJ3SY1Gp4Kq5I7TkxOqLafMAaQNQebbxX9+W2NJ/vMrZz6t2azx2aHr4
 nQsZjrkm5KF/Pr2C3Kn8agpAgAA
X-Change-ID: 20230301-kvm-arm64-sme-06a1246d3636
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=10103; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RNtaMbZ2x4QLJdtSV131dRyufCLa7xFY2p4/ptgxCeY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop824Crwk4I+3H8DwqjMBFey8V+yMjbGKqda0V
 PJlavtfYdiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNuAAKCRAk1otyXVSH
 0AxyB/0QPj0pEasZ8zfuSsrsSEhgz4tK1DLW2a5aDmzyrAmq4YY2MteCRzA53bkr1FooVPXBGpC
 kYppAh3SHez1InKhf7twJYONZJ6VOW0V6tkJEcQdVnIi9qLNHBAap5+Aa0+BV9Bvr1DZOqly+CO
 oSU1R+iRGkBEhcSm2tMDi2ql+rLA7cii3jxTXvvQ40QBQJVDRMb/p22yrtJxDqyOAc4uUAKqcyN
 bsgg4btykdOXvgUbqfly/EiCfCW66RbgNXvlYtGcrycq0+nzaGBnRq4xFOdaeapRfoD62YQq3NN
 M04k2/UYubiefdfJZTfDNy0RKzC4DEqaPpAJKEkgsetUChDj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_185429_972982_0BDE7535 
X-CRM114-Status: GOOD (  34.32  )
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

I've removed the RFC tag from this version of the series, but the items
that I'm looking for feedback on remains the same:

 - The userspace ABI, in particular:
  - The vector length used for the SVE registers, access to the SVE
    registers and access to ZA and (if available) ZT0 depending on
    the current state of PSTATE.{SM,ZA}.
  - The use of a single finalisation for both SVE and SME.

 - The addition of control for enabling fine grained traps in a similar
   manner to FGU but without the UNDEF, I'm not clear if this is desired
   at all and at present this requires symmetric read and write traps like
   FGU. That seemed like it might be desired from an implementation
   point of view but we already have one case where we enable an
   asymmetric trap (for ARM64_WORKAROUND_AMPERE_AC03_CPU_38) and it
   seems generally useful to enable asymmetrically.

This series implements support for SME use in non-protected KVM guests.
Much of this is very similar to SVE, the main additional challenge that
SME presents is that it introduces a new vector length similar to the
SVE vector length and two new controls which change the registers seen
by guests:

 - PSTATE.ZA enables the ZA matrix register and, if SME2 is supported,
   the ZT0 LUT register.
 - PSTATE.SM enables streaming mode, a new floating point mode which
   uses the SVE register set with the separately configured SME vector
   length.  In streaming mode implementation of the FFR register is
   optional.

It is also permitted to build systems which support SME without SVE, in
this case when not in streaming mode no SVE registers or instructions
are available.  Further, there is no requirement that there be any
overlap in the set of vector lengths supported by SVE and SME in a
system, this is expected to be a common situation in practical systems.

Since there is a new vector length to configure we introduce a new
feature parallel to the existing SVE one with a new pseudo register for
the streaming mode vector length.  Due to the overlap with SVE caused by
streaming mode rather than finalising SME as a separate feature we use
the existing SVE finalisation to also finalise SME, a new define
KVM_ARM_VCPU_VEC is provided to help make user code clearer.  Finalising
SVE and SME separately would introduce complication with register access
since finalising SVE makes the SVE registers writeable by userspace and
doing multiple finalisations results in an error being reported.
Dealing with a state where the SVE registers are writeable due to one of
SVE or SME being finalised but may have their VL changed by the other
being finalised seems like needless complexity with minimal practical
utility, it seems clearer to just express directly that only one
finalisation can be done in the ABI.

Access to the floating point registers follows the architecture:

 - When both SVE and SME are present:
   - If PSTATE.SM == 0 the vector length used for the Z and P registers
     is the SVE vector length.
   - If PSTATE.SM == 1 the vector length used for the Z and P registers
     is the SME vector length.
 - If only SME is present:
   - If PSTATE.SM == 0 the Z and P registers are inaccessible and the
     floating point state accessed via the encodings for the V registers.
   - If PSTATE.SM == 1 the vector length used for the Z and P registers
 - The SME specific ZA and ZT0 registers are only accessible if SVCR.ZA is 1.

The VMM must understand this, in particular when loading state SVCR
should be configured before other state.  It should be noted that while
the architecture refers to PSTATE.SM and PSTATE.ZA these PSTATE bits are
not preserved in SPSR_ELx, they are only accessible via SVCR.

There are a large number of subfeatures for SME, most of which only
offer additional instructions but some of which (SME2 and FA64) add
architectural state. These are configured via the ID registers as per
usual.

Protected KVM supported, with the implementation maintaining the
existing restriction that the hypervisor will refuse to run if streaming
mode or ZA is enabled.  This both simplfies the code and avoids the need
to allocate storage for host ZA and ZT0 state, there seems to be little
practical use case for supporting this and the memory usage would be
non-trivial.

The new KVM_ARM_VCPU_VEC feature and ZA and ZT0 registers have not been
added to the get-reg-list selftest, the idea of supporting additional
features there without restructuring the program to generate all
possible feature combinations has been rejected.  I will post a separate
series which does that restructuring.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v7:
- Rebase onto v6.17-rc1.
- Handle SMIDR_EL1 as a VM wide ID register and use this in feat_sme_smps().
- Expose affinity fields in SMIDR_EL1.
- Remove SMPRI_EL1 from vcpu_sysreg, the value is always 0 currently.
- Prevent userspace writes to SMPRIMAP_EL2.
- Link to v6: https://lore.kernel.org/r/20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org

Changes in v6:
- Rebase onto v6.16-rc3.
- Link to v5: https://lore.kernel.org/r/20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org

Changes in v5:
- Rebase onto v6.15-rc2.
- Add pKVM guest support.
- Always restore SVCR.
- Link to v4: https://lore.kernel.org/r/20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org

Changes in v4:
- Rebase onto v6.14-rc2 and Mark Rutland's fixes.
- Expose SME to nested guests.
- Additional cleanups and test fixes following on from the rebase.
- Flush register state on VMM PSTATE.{SM,ZA}.
- Link to v3: https://lore.kernel.org/r/20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org

Changes in v3:
- Rebase onto v6.12-rc2.
- Link to v2: https://lore.kernel.org/r/20231222-kvm-arm64-sme-v2-0-da226cb180bb@kernel.org

Changes in v2:
- Rebase onto v6.7-rc3.
- Configure subfeatures based on host system only.
- Complete nVHE support.
- There was some snafu with sending v1 out, it didn't make it to the
  lists but in case it hit people's inboxes I'm sending as v2.

---
Mark Brown (29):
      arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
      arm64/fpsimd: Update FA64 and ZT0 enables when loading SME state
      arm64/fpsimd: Decide to save ZT0 and streaming mode FFR at bind time
      arm64/fpsimd: Check enable bit for FA64 when saving EFI state
      arm64/fpsimd: Determine maximum virtualisable SME vector length
      KVM: arm64: Introduce non-UNDEF FGT control
      KVM: arm64: Pay attention to FFR parameter in SVE save and load
      KVM: arm64: Pull ctxt_has_ helpers to start of sysreg-sr.h
      KVM: arm64: Move SVE state access macros after feature test macros
      KVM: arm64: Rename SVE finalization constants to be more general
      KVM: arm64: Document the KVM ABI for SME
      KVM: arm64: Define internal features for SME
      KVM: arm64: Rename sve_state_reg_region
      KVM: arm64: Store vector lengths in an array
      KVM: arm64: Implement SME vector length configuration
      KVM: arm64: Support SME control registers
      KVM: arm64: Support TPIDR2_EL0
      KVM: arm64: Support SME identification registers for guests
      KVM: arm64: Support SME priority registers
      KVM: arm64: Provide assembly for SME register access
      KVM: arm64: Support userspace access to streaming mode Z and P registers
      KVM: arm64: Flush register state on writes to SVCR.SM and SVCR.ZA
      KVM: arm64: Expose SME specific state to userspace
      KVM: arm64: Context switch SME state for guests
      KVM: arm64: Handle SME exceptions
      KVM: arm64: Expose SME to nested guests
      KVM: arm64: Provide interface for configuring and enabling SME for guests
      KVM: arm64: selftests: Add SME system registers to get-reg-list
      KVM: arm64: selftests: Add SME to set_id_regs test

 Documentation/virt/kvm/api.rst                   | 117 +++++++----
 arch/arm64/include/asm/fpsimd.h                  |  26 +++
 arch/arm64/include/asm/kvm_emulate.h             |   6 +
 arch/arm64/include/asm/kvm_host.h                | 169 ++++++++++++---
 arch/arm64/include/asm/kvm_hyp.h                 |   5 +-
 arch/arm64/include/asm/kvm_pkvm.h                |   2 +-
 arch/arm64/include/asm/vncr_mapping.h            |   2 +
 arch/arm64/include/uapi/asm/kvm.h                |  33 +++
 arch/arm64/kernel/cpufeature.c                   |   2 -
 arch/arm64/kernel/fpsimd.c                       |  89 ++++----
 arch/arm64/kvm/arm.c                             |  10 +
 arch/arm64/kvm/config.c                          |   8 +-
 arch/arm64/kvm/fpsimd.c                          |  28 ++-
 arch/arm64/kvm/guest.c                           | 252 ++++++++++++++++++++---
 arch/arm64/kvm/handle_exit.c                     |  14 ++
 arch/arm64/kvm/hyp/fpsimd.S                      |  28 ++-
 arch/arm64/kvm/hyp/include/hyp/switch.h          | 175 ++++++++++++++--
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h       | 110 ++++++----
 arch/arm64/kvm/hyp/nvhe/hyp-main.c               |  86 ++++++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c                   |  85 ++++++--
 arch/arm64/kvm/hyp/nvhe/switch.c                 |   4 +-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c               |   6 +
 arch/arm64/kvm/hyp/vhe/switch.c                  |  17 +-
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c               |   7 +
 arch/arm64/kvm/nested.c                          |   3 +-
 arch/arm64/kvm/reset.c                           | 156 ++++++++++----
 arch/arm64/kvm/sys_regs.c                        | 141 ++++++++++++-
 arch/arm64/tools/sysreg                          |   8 +-
 include/uapi/linux/kvm.h                         |   1 +
 tools/testing/selftests/kvm/arm64/get-reg-list.c |  15 +-
 tools/testing/selftests/kvm/arm64/set_id_regs.c  |  27 ++-
 31 files changed, 1328 insertions(+), 304 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20230301-kvm-arm64-sme-06a1246d3636

Best regards,
--  
Mark Brown <broonie@kernel.org>


