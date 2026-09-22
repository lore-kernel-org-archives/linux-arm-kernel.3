Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CACAC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KdouqcGP2aK9amza9KjvVb0/pTilK0YyRjfvlBEitiA=; b=CUfclCXfm9Udlz
	QpA/kAmshr7dXhkyw+S8qS8lclD8YETvweCZ4eh1OsguWAZ2xcvGsknNwKtBqtwKIZxuBkrDSlthM
	hqLWDIXcCXDp8ihOph/jNqy+ik01u8jngi0T7n6iriOyoNu+fT3Y6cNfNRtj0F8KXnMN3xivhZIin
	4yuvApCnodugvEiYprSXjBFt2uVCUTJJp2ZqJ9ofvyoenuxCP2P44FgWBcPcw6a2DT1Fvq3QCU0AN
	yPWI8ohL2als/m6lohT4MLjHv3RyxTjiOh2b9PRAa0hwEBoJBxTOpzQuKlVYfl/3eTfi+mpYnqV54
	TzsiTt8jw6jfGLJkmauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Jy-00000005e8V-4ArH;
	Tue, 22 Sep 2026 14:18:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Jx-00000005e8K-2vZp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:18:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D84B435BD;
	Tue, 22 Sep 2026 14:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A3E1F000FF;
	Tue, 22 Sep 2026 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790086689;
	bh=KdouqcGP2aK9amza9KjvVb0/pTilK0YyRjfvlBEitiA=;
	h=From:Subject:Date:To:Cc;
	b=BlCb2Du8PZQBNTSeRGSvWR+5/gkYm0aHN1A9FwF5whorJy4m166ZI9pfS1yQao2QS
	 Vl3TjcLds3vh/gCYUVvBszAvuiYhEpYt8eitWwG8JXHHgfIxRRh/dZhorU2hq3kt5S
	 nfp99fDINtl9dsld6IVGIzZMZSoi6kAv7fXieK9DQTOFP+k8KoLiOD1g9ziYIUofVC
	 Hc2D+QiwoGcBTByUnAXcVPapTGB0sqyrMXERGxHP/8wlKUJzd8VF6JL9yRljlGTO2s
	 UM5J4m3mEqFg4mKzuW9I10eE7sT84pi7W+kQUyIOconrqWPkewW6zCHPEyH8kMon+v
	 1P0pKl8MQTWZw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: [PATCH v3 00/14] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
Date: Tue, 22 Sep 2026 15:17:54 +0100
Message-Id: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NwQ6CMAyA4VchOzuzjcmYJ9/DeGDSwQIM0+GiI
 by7g5gYE45/m36dSQB0EMg5mwlCdMGNPkV+yMi9rXwD1NWpiWCiYCU/0S4OtMKBPhBs9ewnqo2
 RnJui1Kom6WxduNdGXm+pWxemEd/bh8jX6RcTO1jklFEDFkotlWICLh2gh/44YkNWLYqfoLncE
 UQSRGGNVFZJo/I/YVmWD3n4KnfzAAAA
X-Change-ID: 20260815-kvm-arm-prefault-9bb411b6897d
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Randy Dunlap <rdunlap@infradead.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8027; i=ljs@kernel.org;
 h=from:subject:message-id; bh=rNQEXQsaxDJSKzNBYt0YgJEboocRsjszFp6TuWfcKYQ=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI29YlHi2R8Lbd5fX3TTMPNVyysdf6Hvy9812M+645f7
 u8O7riYjlIWBjEuBlkxRZbnX8T3B4mEzeu84O8GM4eVCWQIAxenAFwknOGftnX0t+5zm0LsOtQP
 r3AwlLWpqHpqwvDlkc30+jQJlWlJDH9lK+617ORjSZzxr/+K8JXEvo5ZpwMWvfvTW8y8N1BSVZQ
 HAA==
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

1. Providing a generic kvm_arch_vcpu_allow_pre_fault_memory() hook.

This allows arm64 to reject an uninitialised vCPU from being specified on
pre-fault, avoiding loading a vCPU that is not correctly initialised yet.

2. Updating kvm_s2_fault_desc to independently store the exception syndrome
   register (ESR) value, and updating all code paths to use this value
   exclusively.

This is needed so we can later generate a synthetic fault to perform the
pre-faulting - we need to be sure the code doesn't grab an incorrect ESR
from elsewhere.

3. Updating kvm_s2_fault_desc to independently store the kvm_s2_mmu and
   updating all code paths to use this value exclusively.

Similarly this is needed so we can generate a synthetic fault against the
canonical stage 2 MMU (it would make no sense for it to touch nested shadow
page tables) - we need to be sure that the code doesn't grab an incorrect
MMU from elsewhere.

4. Updating the abort paths which consume kvm_s2_fault_desc to also return
   a kvm_s2_fault_result data structure.

To perform pre-faulting the code must know the granule size of what was
just walked. So the abort paths have to tell us what that was.

5. Pass walk flags to kvm_pgtable_get_leaf() to permit walking page tables
   under the MMU read lock.

This is Jack's patch which allows the use of the KVM_PGTABLE_WALK_SHARED
flag to walk page tables under the MMU read lock.

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

Additionally, in pKVM mode, the stage 2 page tables are owned by the
hypervisor rather than the host - the host can neither walk them nor
populate them directly, so it's not clear that the pre-fault mechanism
correctly maps onto pKVM.

== Credits ==

This series is based, with gratitude, on Jack Thomson's series and their
respins (links provided below) as well as the feedback he received.

The series includes Jack's v5 "KVM: arm64: Pass walk flags to
kvm_pgtable_get_leaf()" patch (verbatim bar a one-line rebase fixup) and
two of his test patches (with minor fixups), plus a nested pre-fault test
based on his.

Link: https://patch.msgid.link/20260612162354.73378-1-jackabt.amazon@gmail.com/
Link: https://patch.msgid.link/20260113152643.18858-1-jackabt.amazon@gmail.com/
Link: https://patch.msgid.link/20251119154910.97716-1-jackabt.amazon@gmail.com/
Link: https://patch.msgid.link/20251013151502.6679-1-jackabt.amazon@gmail.com/
Link: https://patch.msgid.link/20250911134648.58945-1-jackabt.amazon@gmail.com/

== Reviewer Notes ==

I synced with maintainers on this who asked me to take a look, as there hadn't
been progress on the series for some time.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
v3:
* Rebased on next, fixed up a new caller to kvm_pgtable_get_leaf() to
  account for additional parameter passed.
* Adjusted: cover letter, added [ljs: ...] note to commit msg for 9/14 to
  reflect the fixup.
* Introduced and wired up kvm_arch_vcpu_allow_pre_fault_memory() as a
  separate commit at the start of the series, as per Oliver.
* Updated the pre-fault implementation to disallow uninitialised vCPU on
  pre-fault as per Oliver, and updated cover letter to reflect it.
* Extended pKVM reasoning in cover letter, commit message.

v2:
* Split series - Added 1/13 for the esr.h helpers, 2/13 for converting
  callers to use them, and move what was 1/8 to 3/13 to propagate
  s2fd->esr, as per Marc.
* Made esr helpers __always_inline as per Marc.
* Renamed esr_trap_get_class() -> esr_get_ec() + dropped churn as per Marc.
* Updated 5/13 (was 3/8) to drop the kvm_s2_fault_result.mapped flag.
* Also updated 5/13 so abort handlers return -EAGAIN instead of swallowing, as
  per Marc.
* Split implementation patch further -> topup_mmu_memcache() change to 6/13,
  EHWPOISON change -> 7/13 and docs change -> 10/13, as per Marc.
* No longer mkyoung existing walked ranges, updated docs to reflect, as per
  Marc.
* Eliminated s2fd->pre_fault as per Marc.
* Eliminated the redundant page table level in pre_fault_s2() as per Marc.
* Put the commit message for 9/13 on a diet as per Marc.
* Fixed up commit message for 11/13 (was 6/8) to correct reasoning about
  exit-reason assert, as per Fuad.
* Simplified: nested test 13/13 (was 8/8), dropping the empty nested-S2
  setup and using test_supports_el2() to handle NV=0 opt-out, as per
  Wei-Lin and Fuad.
* Re-authored patch 13/13 to me as the changes are substantial enough to
  require it. Updated commit message to give Jack credit for original.
https://lore.kernel.org/r/20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org

v1:
https://lore.kernel.org/r/20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org

---
Jack Thomson (3):
      KVM: arm64: Pass walk flags to kvm_pgtable_get_leaf()
      KVM: selftests: Enable pre_fault_memory_test for arm64
      KVM: selftests: Add option for different backing in pre-fault tests

Lorenzo Stoakes (ARM) (11):
      KVM: Allow architectures to disallow pre-fault
      arm64: Add ESR fault helpers
      KVM: arm64: Use ESR helpers in guest abort handling
      KVM: arm64: Propagate and use esr in s2fd when handling guest aborts
      KVM: arm64: Propagate and use mmu in s2fd when handling guest aborts
      KVM: arm64: Propagate and use kvm_s2_fault_result on S2 fault
      KVM: arm64: Size the stage-2 memcache from the fault MMU
      KVM: arm64: Propagate EHWPOISON in kvm_s2_fault_pin_pfn()
      KVM: arm64: Implement KVM_PRE_FAULT_MEMORY
      Documentation: KVM: document arm64 KVM_PRE_FAULT_MEMORY
      KVM: selftests: Add nested pre-fault test for arm64

 Documentation/virt/kvm/api.rst                     |  19 +-
 arch/arm64/include/asm/esr.h                       |  44 +++
 arch/arm64/include/asm/kvm_emulate.h               |  52 +---
 arch/arm64/include/asm/kvm_pgtable.h               |   5 +-
 arch/arm64/include/asm/kvm_pkvm.h                  |   2 +-
 arch/arm64/kvm/Kconfig                             |   1 +
 arch/arm64/kvm/arm.c                               |   1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c              |  10 +-
 arch/arm64/kvm/hyp/nvhe/mm.c                       |   2 +-
 arch/arm64/kvm/hyp/pgtable.c                       |   5 +-
 arch/arm64/kvm/mmu.c                               | 306 +++++++++++++++++----
 arch/arm64/kvm/nested.c                            |   2 +-
 include/linux/kvm_host.h                           |   1 +
 tools/testing/selftests/kvm/Makefile.kvm           |   2 +
 .../selftests/kvm/arm64/nv_pre_fault_memory_test.c | 158 +++++++++++
 .../testing/selftests/kvm/pre_fault_memory_test.c  | 152 ++++++++--
 virt/kvm/kvm_main.c                                |   8 +
 17 files changed, 632 insertions(+), 138 deletions(-)
---
base-commit: 23ddf997ab16b5f4aa9f948f5a68f5b35e4e398f
change-id: 20260815-kvm-arm-prefault-9bb411b6897d

Best regards,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>


