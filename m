Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD35C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0UWZ5amjuDuz5NxB+UBQVKLusjTJjNvSXdFmO8uoJLU=; b=38UfDNMohZ5UCb
	veK944Dcuihj61AuaGUSmCgEz4/wRxzfWHGEPbY0fpsW992U9Yshv5gQP2uh69x58LRMg0EfF7w/z
	y2RLzOK4pa59UVfj2jToBt0P7jDyUo9lD+VrMsRZgyZWG/s0r8Xx4Lm0FT1fmoeIWARf4rV4UfBOW
	S3HPn++6qWMIgHOGAXUCArHQS7gwJp19tnRmayoMYHVtgawjVENF2TieOdRxVbCwFdeLsFO6g6kOq
	NE2w7xDba+3X5EBf2lYCWXvGPRribiRfxkSGLuEUlcTX2FYMfQ5fLblXLZqxvUFNOfhWOP2/vhsYe
	/TYgwv8160UVbjl+PlLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytaO-000000014Uj-25GT;
	Tue, 25 Aug 2026 16:01:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytaM-000000014UY-2kd9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:01:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92BB1601E9;
	Tue, 25 Aug 2026 16:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5681F000E9;
	Tue, 25 Aug 2026 16:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787673673;
	bh=0UWZ5amjuDuz5NxB+UBQVKLusjTJjNvSXdFmO8uoJLU=;
	h=From:Subject:Date:To:Cc;
	b=Ar2uwwun9E+GAnctXWPBo12NcRgbRk8j7SLZV8gbV1A3osQAyzyUx4CPw/tOz/kPp
	 XEXxZ4DgeolskSEIGxUXXSP8OkioSdv3k4urTIPJsg59Vna8moQ/DmcAcq22P6ALH1
	 KyA5ngiOVDGxFU6oybyDKr74CTlBbS7fsl0bThU0iogWxKi42cHP02vWV0QsTwXb6X
	 5TEIf6o6guYYaPPpSt30Ep96YTrqC57eBz7n4bIB7D4u2p8qdzlmIVTinMoSZ0mXxu
	 pY97bxnxk5iczGyJPPLO2T1NMv/pGx5UYLv/HVpnMdFj0q7ZzSLBC+q6TtjG3c0dBW
	 DGx77mzSKlyYw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: [PATCH 0/8] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
Date: Tue, 25 Aug 2026 17:00:34 +0100
Message-Id: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0NT3eyyXN3EolzdgqLUtMTSnBJdy6QkE0PDJDMLS/MUJaA2kERmBdj
 I6NjaWgB0ns9XYgAAAA==
X-Change-ID: 20260815-kvm-arm-prefault-9bb411b6897d
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5144; i=ljs@kernel.org;
 h=from:subject:message-id; bh=shQu2ja8FKYpxwmft95PQDnR4lutE8cOna4MUXeJkaA=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJ69zgpbqu+wXsyfM3+Pc//BZRP4Cm8mpD614CD7UqQZ
 u+nDgnfjlIWBjEuBlkxRZbnX8T3B4mEzeu84O8GM4eVCWQIAxenAExEn5fhr4DtqQdGhxvvP3QR
 2MYn/Dtv1t6g6QIb81smzJjoLfGX0ZKR4YGBQYXBhTUqu1RXv7r2oPr9grcsFpPrw273vjvVtdV
 5CQcA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

This series implements the KVM stage 2 page table pre-faulting feature for
arm64.

== Foundations ==

The series begins by establishing required foundations:

1. Updating kvm_s2_fault_desc to independently store the exception syndrome
   register (ESR) value, and updating all code paths to use this value
   exclusively.

This is needed so we can later generate a synthetic fault to perform the
pre-faulting - we need to be sure the code doesn't grab an incorrect ESR
from elsewhere.

2. Updating kvm_s2_fault_desc to independently store the kvm_s2_mmu and
   updating all code paths to use this value exclusively.

Similarly this is needed so we can generate a synthetic fault against the
canonical stage 2 MMU (it would make no sense for it to touch nested shadow
page tables) - we need to be sure that the code doesn't grab an incorrect
MMU from elsewhere.

3. Updating the abort paths which consume kvm_s2_fault_desc to also return
   a kvm_s2_fault_result data structure.

To perform pre-faulting the code must know the granule size of what was
just walked. So the abort paths have to tell us what that was.

4. Pass walk flags to kvm_pgtable_get_leaf() to permit walking page tables
   under the MMU read lock.

This is Jack's patch, verbatim, which allows the use of the
KVM_PGTABLE_WALK_SHARED flag to walk page tables under the MMU read lock.

Pre-faulting requires it to be able to work in parallel as specified by the
API. The read lock precludes page tables being torn down behind our back.

== Implementation ==

Pre-faulting is implemented in kvm_arch_vcpu_pre_fault_memory() whose job
is to pre-fault the stage 2 page tables which map a specific GPA (which,
for arm64, is the guest's IPA).

This function is called by kvm_vcpu_pre_fault_memory() for each GPA in the
range, which itself is ultimately invoked by userland via the
KVM_PRE_FAULT_MEMORY ioctl.

The implementation is simple - try to walk to the stage 2 page table
mapping the GPA - if unmapped, fault it in through a synthetic page fault.

pKVM is not supported regardless of whether the VM is protected or
not.

This is because pKVM instantiates vCPUs upon run, but pre-faulting is
typically performed before a vCPU is run. It would be confusing and
inconsistent to error out on non-running vCPUs but to pre-fault running
ones.

Jack's original test suite is also included in the series.

== Credits ==

This series is based, with gratitude, on Jack Thomson's series and their
respins (links provided below) as well as the feedback he received.

The series includes Jack's v5 "KVM: arm64: Pass walk flags to
kvm_pgtable_get_leaf()" patch verbatim, and all three of his test patches,
two of which required minor fixups.

Link: https://patch.msgid.link/20260612162354.73378-1-jackabt.amazon@gmail.com/
Link: https://patch.msgid.link/20260113152643.18858-1-jackabt.amazon@gmail.com/
Link: https://patch.msgid.link/20251119154910.97716-1-jackabt.amazon@gmail.com/
Link: https://patch.msgid.link/20251013151502.6679-1-jackabt.amazon@gmail.com/
Link: https://patch.msgid.link/20250911134648.58945-1-jackabt.amazon@gmail.com/

== Reviewer Notes ==

I synced with maintainers on this who asked me to take a look, as there hadn't
been progress on the series for some time.

Am happy to rebase again after -rc1.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
Jack Thomson (4):
      KVM: arm64: Pass walk flags to kvm_pgtable_get_leaf()
      KVM: selftests: Enable pre_fault_memory_test for arm64
      KVM: selftests: Add option for different backing in pre-fault tests
      KVM: selftests: Add nested pre-fault test for arm64

Lorenzo Stoakes (ARM) (4):
      KVM: arm64: Propagate and use esr in s2fd when handling guest aborts
      KVM: arm64: Propagate and use mmu in s2fd when handling guest aborts
      KVM: arm64: Propagate and use kvm_s2_fault_result on S2 fault
      KVM: arm64: Implement KVM_PRE_FAULT_MEMORY

 Documentation/virt/kvm/api.rst                     |  17 +-
 arch/arm64/include/asm/esr.h                       | 129 +++++---
 arch/arm64/include/asm/kvm_emulate.h               |  52 +---
 arch/arm64/include/asm/kvm_pgtable.h               |   5 +-
 arch/arm64/include/asm/kvm_pkvm.h                  |   2 +-
 arch/arm64/kvm/Kconfig                             |   1 +
 arch/arm64/kvm/arm.c                               |   1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c              |  10 +-
 arch/arm64/kvm/hyp/pgtable.c                       |   5 +-
 arch/arm64/kvm/mmu.c                               | 324 +++++++++++++++++----
 arch/arm64/kvm/nested.c                            |   2 +-
 tools/testing/selftests/kvm/Makefile.kvm           |   2 +
 .../selftests/kvm/arm64/nv_pre_fault_memory_test.c | 206 +++++++++++++
 .../testing/selftests/kvm/pre_fault_memory_test.c  | 152 ++++++++--
 14 files changed, 736 insertions(+), 172 deletions(-)
---
base-commit: aa8e5dc6a7a2a1141ab40706a51010adcd0e57d2
change-id: 20260815-kvm-arm-prefault-9bb411b6897d

Best regards,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>


