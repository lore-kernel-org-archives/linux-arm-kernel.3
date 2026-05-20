Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2145ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jd91yp639XQ14bFokkoWB7YDnxNd0wxZV9sOx0Y2+4c=; b=d9kAYTI//FTiqCo504f6UktWi0
	qkUnlx4zeM7lCB1yK8KmteH1e/F07awewJiyid4HGQn0bWoc3IKYvzzk5dkzEDSUKzxb42moKeoH/
	pAxslWSm2rc442BUzrWPwsZ0jX8v1g/QgIflL0JAEw6dcg5GNWeuUSHeu0gqnncmTU0lYsCR0APvT
	U22BKw2vMuyFFFT+JrH3yoA0Xne8yEBsZXK9aEq1nFbT3DMVdVhTF96aD81mZJb8mrhIIB30m9ugp
	mgC0xAB+VwuIXXG3krWl1fL6Y5Gbi3SiUlcJzlCqhsXVk3zNvGtIzh79G3N6D0iisep6wTlWuO6+C
	C3YF9wmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPey9-00000004Qmk-3zGv;
	Wed, 20 May 2026 11:20:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPey7-00000004QmC-086c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:20:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EA9240704;
	Wed, 20 May 2026 11:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3831F00893;
	Wed, 20 May 2026 11:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779276006;
	bh=Jd91yp639XQ14bFokkoWB7YDnxNd0wxZV9sOx0Y2+4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=grJ+58kyRnbATQD3AWMWh87yn3b/R+nEKPPQAHMnln4Bju85dikTVJRu4N5srF/pt
	 QVyrezaGYAEujcQ2+FWJyjnnf32qnzc/lgiiotLVpTX10rpXRnZvheV2ccvK+0/vy9
	 4Ujx7yAjO0pEa3Ru+b/47FjxYIZfJPo9AMV9wgRVi0YUriyb93SncXbcZH2dWo8LHb
	 lmgxx2QJKKRD2iAGovIV3h4vXA7+xBozz2WQ+xolSpDWdDiyWaTxE5hkJgZxCPsGgc
	 sb4gSkTYLyaNpZUP9ylkTyw5NnmLlJC57HN+sCPxMQZpbwrweH0yqsvAnV9OhtK4Av
	 Y26/uBRFYZQnw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Wei-Lin Chang <weilin.chang@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.12] KVM: arm64: nv: Consider the DS bit when translating TCR_EL2
Date: Wed, 20 May 2026 07:18:47 -0400
Message-ID: <20260520111944.3424570-15-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520111944.3424570-1-sashal@kernel.org>
References: <20260520111944.3424570-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0.9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_042007_126153_03BAB0AB 
X-CRM114-Status: GOOD (  26.02  )
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

From: Wei-Lin Chang <weilin.chang@arm.com>

[ Upstream commit 8d9b9d985ad3a81c751a6b97edaf1d3c0780af7c ]

When running an nVHE L1, TCR_EL2 is mapped to TCR_EL1. Writes to the
register are trapped and written to TCR_EL1 after a translation.
Booting an nVHE L1 with 52-bit VA isn't working because the translation
was ignoring the DS bit set by the guest, hence causing repeating level
0 faults. Add it in the translation function.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
Link: https://patch.msgid.link/20260505144735.1496530-1-weilin.chang@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Stable Backport Analysis

### Phase 1: Commit Message Forensics

Step 1.1 Record: Subsystem is `KVM: arm64: nv`; action verb is
“Consider”; intent is to preserve the `DS` bit when translating
`TCR_EL2` into `TCR_EL1` for nested virtualization.

Step 1.2 Record: Tags present are:
- `Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>`
- `Link: https://patch.msgid.link/20260505144735.1496530-1-
  weilin.chang@arm.com`
- `Signed-off-by: Marc Zyngier <maz@kernel.org>`

No `Fixes:`, `Reported-by:`, `Tested-by:`, `Reviewed-by:`, `Acked-by:`,
or `Cc: stable@vger.kernel.org` tags are present.

Step 1.3 Record: The bug is that an nVHE L1 guest using 52-bit VA cannot
boot because trapped writes to `TCR_EL2` are translated to `TCR_EL1`
without carrying over the guest’s `DS` bit. The recorded failure mode is
repeated level 0 faults. No affected kernel version is stated in the
message. Root cause is an incomplete EL2-to-EL1 TCR translation.

Step 1.4 Record: This is not hidden as cleanup; it is a direct
correctness fix for guest boot failure.

### Phase 2: Diff Analysis

Step 2.1 Record: One file changed:
`arch/arm64/include/asm/kvm_nested.h`, 1 insertion, 0 deletions.
Function modified: `translate_tcr_el2_to_tcr_el1()`. Scope is a single-
file surgical fix.

Step 2.2 Record: Before, `translate_tcr_el2_to_tcr_el1()` preserved
`TBI`, physical size, granule, cacheability, shareability, and `T0SZ`,
but ignored `TCR_EL2_DS`. After, it adds `TCR_DS` to the EL1 value when
`TCR_EL2_DS` is set. This affects the normal path where KVM programs the
physical EL1 `TCR` while running an nVHE L1.

Step 2.3 Record: Bug category is logic/correctness. The specific
mechanism is a missing architectural bit translation: `TCR_EL2_DS` is
bit 32, while `TCR_EL1.DS` is bit 59, so it cannot be preserved by the
existing mask-copy operations and must be explicitly mapped.

Step 2.4 Record: The fix is obviously correct and minimal. Regression
risk is very low: it only sets `TCR_EL1.DS` when the guest already set
the corresponding `TCR_EL2.DS` bit.

### Phase 3: Git History Investigation

Step 3.1 Record: `git blame` shows `translate_tcr_el2_to_tcr_el1()` was
introduced by `3606e0b2e46216` (“KVM: arm64: nv: Add non-VHE-EL2->EL1
translation helpers”), first contained in `v6.8-rc1`. The buggy omission
is long-lived relative to current stable trees.

Step 3.2 Record: No `Fixes:` tag is present, so there is no tagged
introducer to follow. The blame commit above is the practical introducer
of the incomplete translation.

Step 3.3 Record: Recent history of `arch/arm64/include/asm/kvm_nested.h`
shows active nested-virt development, including 52-bit PA/LPA2 related
work. No prerequisite patch for this one-line change was identified
beyond the existing definitions already present in stable tags checked.

Step 3.4 Record: Wei-Lin Chang has multiple recent `KVM: arm64`/nested-
virt commits. Marc Zyngier, listed in `MAINTAINERS` as a KVM/arm64
maintainer, committed the patch.

Step 3.5 Record: `git log --grep=translate_tcr_el2_to_tcr_el1` found no
other commits mentioning the helper. The patch applies cleanly to the
current checked-out stable tree with `git apply --check`.

### Phase 4: Mailing List And External Research

Step 4.1 Record: `b4 dig -c 8d9b9d985ad3a81c751a6b97edaf1d3c0780af7c`
found the original submission at the provided patch link. `b4 dig -a`
found only v1. The thread includes Marc Zyngier’s “Applied to fixes”
reply and no objections.

Step 4.2 Record: `b4 dig -w` shows the patch was sent to `linux-arm-
kernel`, `kvmarm`, `linux-kernel`, and KVM/arm64 maintainers/reviewers
including Marc Zyngier, Oliver Upton, Joey Gouly, Suzuki K Poulose,
Zenghui Yu, Catalin Marinas, and Will Deacon.

Step 4.3 Record: No separate bug report or syzbot report was found in
the commit tags or b4 thread. The commit message itself gives the
observed boot failure.

Step 4.4 Record: The patch is standalone, single-patch v1; no multi-
patch series dependency was found.

Step 4.5 Record: No stable-specific discussion was found. WebFetch to
lore was blocked by Anubis, but b4 successfully retrieved the thread.

### Phase 5: Code Semantic Analysis

Step 5.1 Record: Modified function: `translate_tcr_el2_to_tcr_el1()`.

Step 5.2 Record: Callers found:
- `locate_register()` maps `TCR_EL2` to `TCR_EL1` with this translation
  for loaded nVHE hyp context.
- `__sysreg_restore_vel2_state()` restores nVHE virtual EL2 state by
  translating guest `TCR_EL2` before writing physical `SYS_TCR`.

Step 5.3 Record: Key callees are `tcr_el2_ps_to_tcr_el1_ips()` and the
bit definitions/macros for `TCR_EL2_*` and `TCR_*`. The function has no
allocation, locking, or complex side effects; it returns a composed
register value.

Step 5.4 Record: Reachability is verified through guest sysreg traps:
`ESR_ELx_EC_SYS64` goes to `kvm_handle_sys_reg()`, then
`perform_access()`, then the `TCR_EL2` descriptor with `access_rw()`,
then `vcpu_write_sys_reg()`, which applies `loc.xlate()` when the mapped
register is loaded. This is reachable by an L1 guest using EL2.

Step 5.5 Record: Similar translation helpers exist for `SCTLR_EL2`,
`CPTR_EL2`, and `TTBR0_EL2`; this patch fixes the missing special-case
bit in the TCR helper. `TCR_EL1.DS` and `TCR_EL2.DS` are at different
bit positions, so the existing mask copying cannot handle it.

### Phase 6: Stable Tree Analysis

Step 6.1 Record: The helper commit is present in checked tags `v6.12`,
`v6.18`, `v6.19`, and `v7.0`. The LPA2 DS field definitions are also
present in those tags. The 52-bit PA helper commit checked is present in
`v6.18`, `v6.19`, and `v7.0`, but not `v6.12`.

Step 6.2 Record: Expected backport difficulty is low for trees with this
helper. `b4 am` reported “Base: applies clean to current tree”, and `git
apply --check` succeeded on the current `v7.0.9` checkout.

Step 6.3 Record: No related fix for “Consider the DS bit” is in `v7.0`
or `v7.0.9`; `git merge-base --is-ancestor` returned absent for the
candidate in those tags.

### Phase 7: Subsystem And Maintainer Context

Step 7.1 Record: Subsystem is KVM/arm64 nested virtualization.
Criticality is IMPORTANT: it affects ARM64 KVM users running nested
virtualization with nVHE L1 guests and 52-bit VA.

Step 7.2 Record: Subsystem is actively maintained; recent
`arch/arm64/kvm` history contains multiple KVM/arm64 fixes, and
`MAINTAINERS` marks KVM/arm64 as maintained by Marc Zyngier and Oliver
Upton.

### Phase 8: Impact And Risk Assessment

Step 8.1 Record: Affected population is platform/config-specific: ARM64
KVM users with nested virtualization and an nVHE L1 using 52-bit VA.

Step 8.2 Record: Trigger is booting or running such an nVHE L1 with
`TCR_EL2.DS` set. The path is guest-triggerable through EL2 sysreg
writes, but only for VMs configured with nested virtualization support.

Step 8.3 Record: Failure mode is repeated level 0 faults and failed L1
boot. Severity is HIGH for affected users because the guest hypervisor
cannot boot correctly.

Step 8.4 Record: Benefit is high for affected nested virtualization
users. Risk is very low: one line, no API change, no locking, no data
structure change, and only changes behavior when the guest sets
`TCR_EL2_DS`.

### Phase 9: Final Synthesis

Step 9.1 Record:
Evidence for backporting:
- Fixes a real boot failure for nVHE L1 guests with 52-bit VA.
- One-line, contained architectural bit translation.
- Existing definitions verify this is a required bit-position mapping,
  not a feature addition.
- Maintainer applied it to the KVM/arm64 fixes branch.
- Applies cleanly to the current stable checkout.
- Buggy helper exists in active stable-era tags checked.

Evidence against backporting:
- No `Fixes:`, `Reported-by:`, `Tested-by:`, or explicit stable tag.
- Affected population is narrower than core KVM users.
- Exact user-visible 52-bit VA nested scenario was not fully proven for
  every older stable branch, especially `v6.12`.

Unresolved:
- I did not build-test or boot-test.
- I did not verify clean application to every stable branch
  individually.
- WebFetch could not read lore directly due Anubis, though b4 retrieved
  the thread.

Step 9.2 Stable rules:
1. Obviously correct and tested? Obviously correct by code inspection;
   no explicit Tested-by found.
2. Fixes a real bug? Yes, commit message and code path verify a missing
   required register bit translation causing L1 boot failure.
3. Important issue? Yes, boot failure/repeated translation faults for
   affected nested virtualization guests.
4. Small and contained? Yes, 1 line in one helper.
5. No new features/APIs? Yes.
6. Can apply to stable trees? Yes for current checked stable tree;
   likely straightforward for trees containing this helper.

Step 9.3 Exception category: None. This is not a device ID, quirk, DT,
build, or documentation exception; it is a direct bug fix.

Step 9.4 Decision: Backport. The fix is small, technically clear, and
corrects an architectural register translation bug that prevents a
supported nested-virtualization configuration from booting.

## Verification

- Phase 1: Parsed `git show` for candidate
  `8d9b9d985ad3a81c751a6b97edaf1d3c0780af7c`; confirmed subject, body,
  and tags.
- Phase 2: Inspected exact diff; confirmed 1 insertion in
  `translate_tcr_el2_to_tcr_el1()`.
- Phase 2: Verified `TCR_EL2_DS` is bit 32 in
  `arch/arm64/include/asm/kvm_arm.h`.
- Phase 2: Verified `TCR_EL1.DS` is bit 59 in `arch/arm64/tools/sysreg`
  and `TCR_DS` aliases it in `arch/arm64/include/asm/pgtable-hwdef.h`.
- Phase 3: `git blame` identified `3606e0b2e46216` as introducer of the
  helper.
- Phase 3: `git describe --contains 3606e0b2e46216` reported first
  containment at `v6.8-rc1`.
- Phase 3: `git log` on affected files found related nested-virt/LPA2
  activity and no required adjacent patch.
- Phase 4: `b4 dig -c` found the original patch by patch-id.
- Phase 4: `b4 dig -a` found only v1.
- Phase 4: `b4 dig -w` confirmed KVM/arm64 maintainers and lists were
  included.
- Phase 4: `b4 mbox -c -o -` retrieved Marc Zyngier’s applied-to-fixes
  reply.
- Phase 5: `rg` found callers in `sys_regs.c` and `hyp/vhe/sysreg-sr.c`.
- Phase 5: Read trap path from `handle_exit.c`, `sys_regs.c`, and
  `arm.c`; verified guest sysreg traps can reach the translation.
- Phase 6: `git merge-base --is-ancestor` confirmed the helper and DS
  definitions are present in `v6.12`, `v6.18`, `v6.19`, and `v7.0`.
- Phase 6: `git apply --check` succeeded on the current stable checkout.
- Phase 7: Read `MAINTAINERS`; confirmed Marc Zyngier and Oliver Upton
  maintain KVM/arm64.
- Phase 8: Failure mode verified from commit message and code path;
  exact boot reproduction was not run.
- UNVERIFIED: No build or boot test was performed.
- UNVERIFIED: Clean application to every individual stable branch was
  not tested.
- UNVERIFIED: Exact impact on older stable trees lacking later 52-bit PA
  helper work was not fully established.

**YES**

 arch/arm64/include/asm/kvm_nested.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 091544e6af442..dc2957662ff20 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -23,6 +23,7 @@ static inline u64 tcr_el2_ps_to_tcr_el1_ips(u64 tcr_el2)
 static inline u64 translate_tcr_el2_to_tcr_el1(u64 tcr)
 {
 	return TCR_EPD1_MASK |				/* disable TTBR1_EL1 */
+	       ((tcr & TCR_EL2_DS) ? TCR_DS : 0) |
 	       ((tcr & TCR_EL2_TBI) ? TCR_TBI0 : 0) |
 	       tcr_el2_ps_to_tcr_el1_ips(tcr) |
 	       (tcr & TCR_EL2_TG0_MASK) |
-- 
2.53.0


