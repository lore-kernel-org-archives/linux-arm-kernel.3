Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B13C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuj8A5e7nnoDpMMwZamaJ9ej6ugo57OPNOW4T/OwTNM=; b=VfYUseCYd7+hLMdZJ6nCKZ5MWN
	8xVh/LsG1GFH7Jq5EOU0jm/clrmk5FWXv6tdAPFzV69un3riBbKki7TdG9YoN7tVhPRqF7vnu6xzg
	xa/Fx7XmL5qhDqTxnb2HoQTF3aJvTDY27pvl+lOZDv1Azmle7iFpoBjaCSfYhfpMhTutaPjwVxCQ+
	jHiniGMiSb+X5KS40LDpNR1ZB+f6HMlcgKFjs+MIEHPlZfbkuLuNI7yP8b3pyfLX3jo6BKGspJRS+
	mwY5lc4lxyNkeXUmvL4anIce+K7ClxiF12cs4uAf55CxsGdic03L9mcMBND37V+bBUZ9sMWR0k3mJ
	QrujwnLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12GO-00000009Tkz-2jLg;
	Mon, 31 Aug 2026 13:41:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12G0-00000009TY7-2aFK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:41:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B68E43238;
	Mon, 31 Aug 2026 13:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1EA1F00A3D;
	Mon, 31 Aug 2026 13:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183664;
	bh=uuj8A5e7nnoDpMMwZamaJ9ej6ugo57OPNOW4T/OwTNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A/RskeyIIAoltiMc4OV0S1ZHutI3hX3AY+hkXPOZo36Mg/RrZMWEMHLtBIdCGghjY
	 l1vt8naqQoQQFIVleDrwoLbLUgTexXU1bPt+3TX3A6Fk3daKI39946eT6+Cq69W/5J
	 63xZNCPnE80+fd+ahQA8+7HRe2QZL33ph8fDINgTB4GI91v02ZG3F7ekMdAW9hi23s
	 zMfnZ2F5+c1gd+Y3iJRzJHy4YHhquOqkIcdMla0eXEQCMaXE2KlhrtXUJg9l2Bv9Fl
	 9VHqrtDsIEweTrUiBh4bUROANAn+CZ6JVuwAFe/LjkNUyYkAPYwnrN4ANxqcS4oAXA
	 rN58y5uegq4EA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Mostafa Saleh <smostafa@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] irqchip/gic-v4: Don't advertise VLPIs if no ITS is probed
Date: Mon, 31 Aug 2026 09:24:18 -0400
Message-ID: <20260831133314.4125787-230-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
Content-Transfer-Encoding: 8bit
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

From: Mostafa Saleh <smostafa@google.com>

[ Upstream commit e61654fbc3bc5d07ec9fafe29f33e19b2b5d0fd5 ]

When accidentally setting “kvm-arm.vgic_v4_enable=1” on a system that has
no MSI controller device tree node and GICv4, it results a panic as
“gic_domain” is NULL and the kernel attempts to access it.

    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000028
    Mem abort info:
      ESR = 0x0000000096000006

    CPU: 1 UID: 0 PID: 295 Comm: lkvm-static Not tainted 7.1.0-rc4-ge3f15ad3970e #5 PREEMPT
    Hardware name: linux,dummy-virt (DT)
    pstate: 81402005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
    pc : __irq_domain_instantiate+0x1d4/0x578
    lr : __irq_domain_instantiate+0x1cc/0x578

Set vLPI support to false at init time if the host has no ITS, so it
propagates properly to kvm_vgic_global_state.has_gicv4.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Link: https://patch.msgid.link/20260526125317.3672297-1-smostafa@google.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

# Stable Backport Analysis: irqchip/gic-v4: Don't advertise VLPIs if no
ITS is probed

**Local tree:** `v6.18.44` (`git describe HEAD` → `v6.18.44`, Makefile
`6.18.44`)

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject line
**Record:** `[irqchip/gic-v4]` `[prevent/advertise]` — Don't advertise
VLPIs if no ITS is probed.

### Step 1.2: Tags
**Record:**
- **Suggested-by:** Marc Zyngier `<maz@kernel.org>` (GIC maintainer
  suggested the approach)
- **Signed-off-by:** Mostafa Saleh `<smostafa@google.com>` (author)
- **Signed-off-by:** Thomas Gleixner `<tglx@kernel.org>` (irq
  maintainer)
- **Acked-by:** Marc Zyngier `<maz@kernel.org>` (GIC subsystem
  maintainer ack)
- **Link:**
  https://patch.msgid.link/20260526125317.3672297-1-smostafa@google.com
- No Fixes:, Reported-by:, Tested-by:, or Cc: stable tags (expected for
  manual review)
- Ignore pipeline-added markers per instructions

**Notable:** Maintainer ack from Marc Zyngier; irq maintainer merge
sign-off from Thomas Gleixner.

### Step 1.3: Body analysis
**Record:**
- **Bug:** On GICv4 hardware with no ITS device-tree node, `has_vlpis`
  remains true even though ITS init fails.
- **Symptom:** Kernel panic — NULL pointer dereference in
  `__irq_domain_instantiate` when `kvm-arm.vgic_v4_enable=1` is set.
- **Stack trace:** `__irq_domain_instantiate` on `linux,dummy-virt` with
  `lkvm-static`, kernel `7.1.0-rc4`.
- **Root cause:** `gic_domain` (static in `irq-gic-v4.c`) is never
  initialized because `its_init_v4()` is never reached; KVM still
  believes GICv4 is available via `kvm_vgic_global_state.has_gicv4`.
- **Fix:** Set `rdists->has_vlpis = false` when `its_nodes` list is
  empty, so `gic_v3_kvm_info.has_v4` propagates correctly as false.

### Step 1.4: Hidden bug fix?
**Record:** No — this is an explicit bug fix (NULL deref / kernel
panic), not disguised cleanup.

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
**Record:**
- **Files:** `drivers/irqchip/irq-gic-v3-its.c` (+1 line)
- **Functions:** `its_init()`
- **Scope:** Single-file, surgical one-line fix on an error path

### Step 2.2: Code flow change
**Record:**
- **Before:** `its_init()` finds no ITS nodes → prints warning → returns
  `-ENXIO` with `rdists->has_vlpis` unchanged (still true from hardware
  capability detection).
- **After:** Same path, but `rdists->has_vlpis = false` is set before
  return, so downstream KVM info correctly reports no GICv4 support.

### Step 2.3: Bug mechanism
**Record:** **Logic / correctness fix** — stale capability flag after
failed ITS probe.

Call chain when bug triggers:
1. `gic_update_rdist_properties()` sets `has_vlpis` from
   `GICR_TYPER_VLPIS` hardware bit
2. `its_init()` returns early with no ITS → `has_vlpis` stays true
3. `gic_v3_kvm_info.has_v4 = gic_data.rdists.has_vlpis`
   (```2279:2280:drivers/irqchip/irq-gic-v3.c```)
4. `kvm-arm.vgic_v4_enable=1` → `kvm_vgic_global_state.has_gicv4 = true`
   (```668:670:arch/arm64/kvm/vgic/vgic-v3.c```)
5. `vgic_v4_init()` → `its_alloc_vcpu_irqs()` →
   `irq_domain_create_hierarchy(gic_domain, ...)` where `gic_domain` is
   NULL (```167:169:drivers/irqchip/irq-gic-v4.c```, never set because
   `its_init_v4()` never called)
6. Kernel panic in irq domain instantiation

### Step 2.4: Fix quality
**Record:**
- **Obviously correct:** If no ITS exists, VLPIs cannot work; clearing
  `has_vlpis` is semantically right and consistent with existing pattern
  at lines 5864 and 3274 in the same file.
- **Minimal:** One line, no unrelated changes.
- **Regression risk:** Very low — only affects the no-ITS error path;
  systems with working ITS are untouched.

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
**Record:** Worktree has flattened history (single squash commit
`7e22de67e545d`). The `list_empty(&its_nodes)` early-return path exists
at ```5836:5838:drivers/irqchip/irq-gic-v3-its.c``` without the fix.
GICv4/VLPI infrastructure is present throughout 6.18.

### Step 3.2: Fixes: tag
**Record:** N/A — no Fixes: tag in commit message.

### Step 3.3: Related file history
**Record:** Limited git history in this worktree. The buggy code path
and all related infrastructure (`has_vlpis`, `kvm-arm.vgic_v4_enable`,
`its_init_v4`, `gic_domain`) are present in this 6.18.44 tree.

### Step 3.4: Author context
**Record:** Mostafa Saleh (Google). Marc Zyngier (GIC expert/maintainer)
suggested and acked the fix.

### Step 3.5: Dependencies
**Record:** Standalone — no series dependencies, no prerequisite
commits. Applies to existing `its_init()` error path.

---

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1: Original discussion
**Record:** `b4 dig -c <commit>` could not be run — fix commit SHA not
present in local repos (fix targets 7.1.0-rc4 per commit message; local
tree is 6.18.44). Link fetch to lore/patch.msgid.link blocked by bot
protection (Anubis). Could not retrieve thread discussion.

### Step 4.2: Reviewers
**Record:** UNVERIFIED via b4 dig -w. Commit message confirms Acked-by
Marc Zyngier and Signed-off-by Thomas Gleixner.

### Step 4.3: Bug report
**Record:** Commit message includes full oops trace with reproducible
scenario: `linux,dummy-virt` DT, `kvm-arm.vgic_v4_enable=1`, no ITS
node. Severity: kernel panic.

### Step 4.4: Related patches
**Record:** Standalone fix, not part of a series.

### Step 4.5: Stable list history
**Record:** UNVERIFIED — lore access blocked. No stable discussion found
locally.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: Key functions
**Record:** `its_init()`, `its_alloc_vcpu_irqs()`, `vgic_v4_init()`,
`vgic_v3_probe()`, `irq_domain_create_hierarchy()`

### Step 5.2: Callers
**Record:**
- `its_init()` called from `gic_of_init()` / ACPI init when
  `gic_dist_supports_lpis()` (```2137:2138:drivers/irqchip/irq-
  gic-v3.c```)
- `vgic_v4_init()` called during KVM VM setup when GICv4 is enabled
- `its_alloc_vcpu_irqs()` called from `vgic_v4_init()`
  (```266:266:arch/arm64/kvm/vgic/vgic-v4.c```)

### Step 5.3: Callees
**Record:** `irq_domain_create_hierarchy()` → `irq_domain_instantiate()`
→ `__irq_domain_instantiate()`; uses static `gic_domain` set only by
`its_init_v4()`.

### Step 5.4: Reachability
**Record:** Reachable from userspace via KVM — boot param `kvm-
arm.vgic_v4_enable=1` + creating/running a VM with vITS on GICv4-capable
hardware without ITS. QEMU `virt` platform matches the reported
scenario.

### Step 5.5: Similar patterns
**Record:** Same file already clears `has_vlpis` on GICv4 init failure
(```5864:5864:drivers/irqchip/irq-gic-v3-its.c```) and in other error
paths (```3274:3274```). Fix follows established convention.

---

## PHASE 6: CROSS-REFERENCE AGAINST LOCAL TREE (6.18.44)

### Step 6.1: Buggy code exists?
**Record:** **YES.** At ```5836:5838:drivers/irqchip/irq-
gic-v3-its.c```, the early return on empty `its_nodes` does NOT clear
`has_vlpis`. All prerequisite code (GICv4, KVM vgic_v4_enable,
`gic_domain` in irq-gic-v4.c) exists in 6.18.44.

### Step 6.2: Backport complications
**Record:** **Clean apply expected** — single line insertion in
unchanged context. No refactoring conflicts observed.

### Step 6.3: Related fixes already present?
**Record:** **NO** — grep shows no `rdists->has_vlpis = false` in the
`list_empty(&its_nodes)` path. Fix not yet in this tree.

---

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: Subsystem criticality
**Record:** **IMPORTANT** — ARM64 KVM + GIC interrupt controller.
Affects virtualization hosts on ARM64 with GICv4.

### Step 7.2: Subsystem activity
**Record:** GICv3/v4/ITS actively maintained; GICv4 KVM direct injection
is a supported feature path in 6.18.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Who is affected
**Record:** ARM64 hosts running KVM with `CONFIG_KVM` +
`CONFIG_ARM_GIC_V3_ITS`, GICv4-capable hardware (VLPI in GICR_TYPER), no
ITS in firmware/DT, and `kvm-arm.vgic_v4_enable=1`. Common in QEMU virt
development/testing.

### Step 8.2: Trigger conditions
**Record:**
- Requires explicit boot param `kvm-arm.vgic_v4_enable=1` (not default)
- Requires GICv4 hardware features without ITS node
- Triggered when KVM VM with vITS is initialized
- **Likelihood:** Low in production (param is opt-in), but realistic in
  dev/QEMU environments
- **Unprivileged trigger:** Indirect — root sets boot param; any user
  with KVM access could then trigger VM creation path

### Step 8.3: Failure mode severity
**Record:** **CRITICAL** — kernel NULL pointer dereference → oops/panic.
Host crash.

### Step 8.4: Risk-benefit
**Record:**
- **Benefit:** Prevents host kernel panic on a valid-but-misconfigured
  GICv4-without-ITS scenario; corrects false capability advertisement
- **Risk:** Very low — one line on error-only path, maintainer-acked
- **Ratio:** Strong benefit, minimal risk

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence summary

**FOR backport:**
- Real kernel panic (NULL deref) with stack trace in commit message
- Small, surgical, obviously correct fix
- GIC maintainer (Marc Zyngier) suggested and acked
- Buggy code confirmed present in 6.18.44
- Follows existing `has_vlpis = false` pattern in same file
- Prevents false GICv4 advertisement to KVM

**AGAINST backport:**
- Requires opt-in boot param `kvm-arm.vgic_v4_enable=1` (niche trigger)
- No ITS on GICv4 hardware is an unusual/misconfigured platform

**UNRESOLVED:**
- Full lore review thread inaccessible (bot protection)
- b4 dig could not match commit (not in local git history)

The niche trigger does not outweigh a host panic fix — stable trees
routinely backport fixes that prevent panics on misconfiguration.

### Step 9.2: Stable rules checklist
1. Obviously correct and tested? **PASS** — logically sound; maintainer
   acked; reproducer in commit message
2. Fixes a real bug? **PASS** — NULL deref panic on KVM GICv4 init
3. Important issue? **PASS** — CRITICAL (kernel panic)
4. Small and contained? **PASS** — 1 line, 1 file
5. No new features/APIs? **PASS** — corrects existing capability flag
6. Can apply to local tree? **PASS** — buggy code present; clean apply
   expected

### Step 9.3: Exception categories
**Record:** N/A — standard bug fix, not a quirk/DT/device-ID exception.

### Step 9.4: Decision rationale
For **Linux 6.18.44**, this commit fixes a confirmed host kernel panic
when KVM GICv4 is force-enabled on GICv4-capable hardware without an
ITS. The buggy code exists in this tree, the fix is one maintainer-acked
line on an error path, and it prevents false advertisement of VLPI/GICv4
support to KVM. The opt-in nature of the boot parameter reduces
production exposure but does not diminish the fix's correctness or
stable suitability.

---

## Verification

- [Phase 1] Parsed subject, tags (Acked-by Marc Zyngier, Suggested-by
  Marc Zyngier, Link to patch)
- [Phase 1] Identified explicit NULL deref panic bug, not hidden cleanup
- [Phase 2] Diff: +1 line in `its_init()` at `list_empty(&its_nodes)`
  path
- [Phase 2] Traced bug chain: `has_vlpis` stale → `has_v4` true →
  `has_gicv4` true → `gic_domain` NULL → panic
- [Phase 3] `git describe HEAD`: v6.18.44
- [Phase 3] Buggy code at lines 5836-5838 confirmed without fix
- [Phase 3] No Fixes: tag; standalone patch
- [Phase 4] b4 dig: commit SHA unavailable in local repos — could not
  run
- [Phase 4] WebFetch lore/patch.msgid.link: blocked by Anubis bot
  protection
- [Phase 4] UNVERIFIED: full mailing list review thread
- [Phase 5] Verified callers: `its_init` from gic init, `vgic_v4_init` →
  `its_alloc_vcpu_irqs`
- [Phase 5] Verified `gic_domain` static NULL until `its_init_v4()` at
  ```376:382:drivers/irqchip/irq-gic-v4.c```
- [Phase 5] Verified `gic_v3_kvm_info.has_v4 =
  gic_data.rdists.has_vlpis` at lines 2279, 2639
- [Phase 5] Verified `kvm-arm.vgic_v4_enable` early_param at
  ```615:619:arch/arm64/kvm/vgic/vgic-v3.c```
- [Phase 6] Buggy code EXISTS in 6.18.44 tree
- [Phase 6] Fix NOT yet applied in local tree
- [Phase 6] Clean apply expected (single line insertion)
- [Phase 7] Subsystem: irqchip GIC + ARM64 KVM, IMPORTANT criticality
- [Phase 8] Failure mode: NULL deref panic, CRITICAL severity
- [Phase 8] Trigger: opt-in boot param + no ITS + GICv4 hardware + KVM
  VM init

**YES**The background `git log --all` lookup for when the “No ITS
available, not enabling LPIs” path was introduced was killed after
timing out (and `--all` isn’t appropriate here anyway). That doesn’t
change the backport analysis: the buggy path is present in this
**6.18.44** tree, and the fix is still a one-line, maintainer-acked
correction on the no-ITS error path.

**YES**

 drivers/irqchip/irq-gic-v3-its.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index a1661657391d6..38190c5196936 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5834,6 +5834,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
 		its_acpi_probe();
 
 	if (list_empty(&its_nodes)) {
+		rdists->has_vlpis = false;
 		pr_warn("ITS: No ITS available, not enabling LPIs\n");
 		return -ENXIO;
 	}
-- 
2.53.0


