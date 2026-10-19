Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEF1CCF2E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ttW6Xwu84Ja9gEy06XJgOr5fUPFdW2KSIAQeSluxBk=; b=rdvnnlnfSIFEsEu1lG6CeTYCva
	h0feHDls0F/LH+ZOIX1cqZcPQwHF52Li8no+Iky/F1L1/407M5ZdXFDC1zU/Otgg9rJHtOGZbTh+j
	hNSFAgr1kvLolobhXEfgFk6nopR1dAIGA+cly/gg2dSHidtNfJy4D3STO6RrAzGrYjBVsaICkQjfI
	wLE/cjaT+17Qyd3y+46C7HKXl8a4KyJdv+u2Ee63qENz+R/0HSD3c8EyWXo00wwoqVxCwB2Pl5Edm
	6CfGkM37YAemSuyTpcEoo6/P59zM/l1uDCIRVo8BMLCP2Y9QQ6saF1VIUXuEfbK7l8M1hzI0W2x3p
	uL6D7mHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInpI-00000007ZgP-3JMn;
	Mon, 19 Oct 2026 13:54:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInpF-00000007ZeF-2Hpo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:54:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B90D46021C;
	Mon, 19 Oct 2026 13:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498271F000C7;
	Mon, 19 Oct 2026 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792418092;
	bh=+ttW6Xwu84Ja9gEy06XJgOr5fUPFdW2KSIAQeSluxBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I/j8LvVprINv46Kx5a6228wHfi/w2wdUqH2bdbMc5zzuri8OGvcvT4U0wz213ZDlR
	 9cywME0UJ0uPQ5o2h0ZT9OtQSbSm+b7kiJ5APQ2J3StgKAwAvCRNoZ7Y6rhrJybuAd
	 H0Jh14Visy5+3hGn9UFdoGEsxErvWFFRrn0vx3Rdwv1MQWI5zHxR1gI1thLoB+eOmr
	 DD1vlRwBe5GCTVxnHZomYt6Ev1UCXfoOxCqmKVzXj2fSoDc3nLgyG/2tVnkHYvpzNW
	 6V7QuklJumEOP1uRzhahwknV5/2aox10+kZE4RD3y1WtkcBulcw0VrK7oH5fibFqph
	 qB/RJDo63hXWw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	robin.clark@oss.qualcomm.com,
	joro@8bytes.org,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-6.6] iommu/qcom: Enable clocks before hardware access in qcom_iommu_ctx_probe()
Date: Mon, 19 Oct 2026 09:44:58 -0400
Message-ID: <20261019135441.1420968-7-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019135441.1420968-1-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.57
Content-Type: text/plain; charset=UTF-8
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

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

[ Upstream commit cb776a03a53429aa59e25a8cbc3d1a48bd11afdb ]

qcom_iommu_ctx_probe() reads and writes the CB_FSR register to clear any
stale IRQ left by the bootloader. This happens during
devm_of_platform_populate() which is called from the parent device's
probe before any pm_runtime_get(). The parent's clocks (iface, bus, tbu)
are therefore not guaranteed to be on, making the register access
unreliable on rebind or after a suspend cycle.

Use pm_runtime_resume_and_get() on the parent device to ensure clocks
are enabled before the register access, and release the reference
immediately after.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Phase 1: Commit message forensics

**Step 1.1: Subject line**
Record: **[iommu/qcom] [Enable] clocks before hardware access in
`qcom_iommu_ctx_probe()`**
“Enable” here is a missing power/clock step before MMIO, not a new
feature.

**Step 1.2: Tags**
Record:
- `Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>`
- `Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>` (author)
- `Signed-off-by: Will Deacon <will@kernel.org>` (IOMMU/SMMU maintainer)
- No `Fixes:`, `Reported-by:`, `Tested-by:`, `Acked-by:`, `Link:`, or
  `Cc: stable` (absence is expected)

**Step 1.3: Body**
Record:
- **Bug:** `qcom_iommu_ctx_probe()` reads/writes `CB_FSR` to clear a
  stale bootloader IRQ during `devm_of_platform_populate()`, which runs
  from the parent probe **before** any `pm_runtime_get()`. Parent clocks
  (`iface`, `bus`, `tbu`) may be off.
- **Symptom:** Register access is **unreliable on rebind or after a
  suspend cycle**.
- **Root cause:** Child MMIO without a runtime-PM resume of the parent
  that actually enables the clocks.
- **Fix:** `pm_runtime_resume_and_get(dev->parent)` around the FSR
  access, then `pm_runtime_put_sync()`.
- No stack trace, syzbot, or version range in the message.

**Step 1.4: Hidden bug fix?**
Record: Yes. The subject sounds like enablement, but this is a
correctness fix for MMIO with clocks gated.

---

## Phase 2: Diff analysis

**Step 2.1: Inventory**
Record:
- File: `drivers/iommu/arm/arm-smmu/qcom_iommu.c` (+6 / −1)
- Function: `qcom_iommu_ctx_probe()`
- Scope: single-file, surgical

**Step 2.2: Flow change**
Record: **Before:** if the context is not secure, immediately
`readl`/`writel` `ARM_SMMU_CB_FSR`. **After:** same access, but only
after a successful parent `pm_runtime_resume_and_get()`, then
`pm_runtime_put_sync()`. Resume failure fails probe. This is the child
probe path invoked from parent `devm_of_platform_populate()`.

**Step 2.3: Bug mechanism**
Record: **Hardware access / PM correctness.** Clocks are enabled only in
`qcom_iommu_resume()` via `clk_bulk_prepare_enable()`. Parent probe
order is `devm_pm_runtime_enable()` then `devm_of_platform_populate()` —
RPM enable does not turn clocks on. The parent already wraps its own
`SMMU_INTR_SEL_NS` write with resume/get; the child FSR access did not.

**Step 2.4: Fix quality**
Record: Obviously correct and matches the parent’s existing pattern.
`pm_runtime_resume_and_get()` drops the usage count on failure, so there
is no extra `put` needed. Regression risk is low: resume runs after
clocks/drvdata are set; multiple context banks each get/put
independently. No API or data-structure change.

---

## Phase 3: Git history

**Step 3.1: Blame**
Record: FSR-clear comment and access come from **`0ae349a0f33fb0`
(“iommu/qcom: Add qcom_iommu”, Rob Clark, 2017-08-09)**, first in
**v4.14-rc1**. Secure-ctx skip is from `e30c960d3f44b7` (2023). The bug
is old, not recent.

**Step 3.2: Fixes: tag**
Record: None. The introducing commit is `0ae349a0f33fb0`, present in
this tree (`git merge-base --is-ancestor` succeeded).

**Step 3.3: Related file history**
Record: Same-day series by Mukesh Ojha (v2 6/6 “Misc Fixes”):
1. `1f33b8208a197` inverted fault report
2. `bf69e515b1802` `devm_pm_runtime_enable()` (cleanup)
3. `e910315ae08a2` check RPM return on parent `SMMU_INTR_SEL_NS` write
4. `3c748a5554f96` pgtbl_ops leak
5. `a05b67cd45ad0` pgtbl_ops publish vs mutex
6. **this commit** `cb776a03a5342`

This patch does not need 2–5. It only uses
`pm_runtime_resume_and_get()`, present since `dd8088d5a8969`.

**Step 3.4: Author**
Record: Qualcomm engineer; series reviewed by Konrad Dybcio (Qualcomm)
and applied by Will Deacon. Not a drive-by.

**Step 3.5: Dependencies**
Record: Standalone. Applies to the pre-commit `ctx_probe` body in this
tree. No new helpers.

---

## Phase 4: Mailing list

**Step 4.1: Original discussion**
Record:
- Lore/msgid: https://patch.msgid.link/20260717144608.3216274-7-
  mukesh.ojha@oss.qualcomm.com
- v1: `[PATCH 7/8]` 2026-06-23, same diff
- v2: `[PATCH v2 6/6]` 2026-07-17 (dropped unrelated 6/8 and 8/8)
- Cover: “Series to address fixes in legacy qcom_iommu driver”
- Konrad Reviewed-by on v1 7/8 with no requested changes; v2 unchanged
- Will: “Applied to iommu (arm/smmu/updates)”
- No NAK, no `Cc: stable` request

**Step 4.2: Recipients (`b4 dig -w`)**
Record: Will Deacon, Joerg Roedel, Robin Murphy, Rob Clark, Konrad
Dybcio, iommu@lists.linux.dev, linux-arm-msm, linux-arm-kernel.

**Step 4.3: Bug report**
Record: No external bugzilla/syzbot. Qualcomm-authored; trigger
described as rebind / post-suspend.

**Step 4.4: Series**
Record: Independent of the other five patches. Same pattern as patch 3/6
on the parent.

**Step 4.5: Stable list**
Record: **UNVERIFIED** — lore.kernel.org returned 403; no stable thread
in the saved mbox.

---

## Phase 5: Code semantics

**Step 5.1: Functions**
Record: `qcom_iommu_ctx_probe()` only.

**Step 5.2: Callers**
Record: Sole caller is `.probe = qcom_iommu_ctx_probe` on
`qcom_iommu_ctx_driver`. Invoked from `qcom_iommu_device_probe()` →
`devm_of_platform_populate()`. Device-init / bind path, not a syscall
hot path.

**Step 5.3: Callees**
Record: `pm_runtime_resume_and_get(parent)` → `qcom_iommu_resume()` →
`clk_bulk_prepare_enable()` (and optional `qcom_scm_restore_sec_cfg`);
then `iommu_readl`/`iommu_writel` `ARM_SMMU_CB_FSR`; then
`pm_runtime_put_sync()`.

**Step 5.4: Reachability**
Record: Yes, on every non-secure context probe for `qcom,msm-iommu-v1` /
`v2`. DT users include MSM8916/8917/8937/8939/8953/8976. First boot
often still has bootloader clocks; **rebind, deferred probe after
`clk_disable_unused`, and probe after suspend/remove** can have clocks
off. Unprivileged users do not trigger this directly; driver
bind/suspend does.

**Step 5.5: Similar patterns**
Record: Parent already does resume/get around `SMMU_INTR_SEL_NS`
(`e910315ae08a2`). This is the matching child-side hole.

---

## Phase 6: This checkout

**Step 6.1: Buggy code in this tree?**
Record: **Yes.** Tree is **v7.3-rc4** (`VERSION=7 PATCHLEVEL=3
SUBLEVEL=0 EXTRAVERSION=-rc4`, `git describe`:
`v7.3-rc4-27-gf0100363d8c37`). Driver and FSR-clear exist since v4.14.
Candidate `cb776a03a5342` is already an ancestor of HEAD (merged via
`iommu-updates-v7.3`, in v7.3-rc1). Pre-commit code still has the
unguarded FSR access.

**Step 6.2: Backport difficulty**
Record: Clean apply on this file’s `ctx_probe`. Needs
`linux/pm_runtime.h` (already included) and
`pm_runtime_resume_and_get()` (in this tree).

**Step 6.3: Related fixes already here**
Record: The candidate itself is already in this 7.3-rc4 tree. No
alternate FSR-clock fix besides this commit.

---

## Phase 7: Subsystem

**Step 7.1**
Record: **iommu / Qualcomm legacy SMMU** (`drivers/iommu/arm/arm-
smmu/qcom_iommu.c`). **IMPORTANT** for those SoCs (DMA/IOMMU), not core-
mm/VFS. `CONFIG_QCOM_IOMMU`, `depends on ARCH_QCOM`.

**Step 7.2**
Record: Mature “legacy qcom_iommu” driver; low churn except this 2026
fix series.

---

## Phase 8: Impact and risk

**Step 8.1: Who**
Record: Qualcomm MSM IOMMU v1/v2 platforms (older/mid-range SoCs still
in LTS images), not all machines.

**Step 8.2: Trigger**
Record: Child probe with parent clocks off: driver rebind, probe after
`pm_runtime_force_suspend` on remove, deferred probe after unused clocks
are gated. Not every boot. Not a userspace exploit path.

**Step 8.3: Failure mode**
Record: MMIO to a clock-gated SMMU context bank. On these platforms that
is typically a **bus timeout / NOC hang / SError**, or a failed FSR
clear so a bootloader IRQ fires as soon as `devm_request_irq()` runs.
Severity: **HIGH** (probe hang/abort), not a confirmed UAF/CVE.

**Step 8.4: Risk-benefit**
Record: **Benefit: medium-high** for affected hardware (prevents bad
MMIO during probe). **Risk: low** (6 lines, existing RPM API, same
pattern as parent). Ratio favors backport.

---

## Phase 9: Synthesis

**For:**
- Real bug: FSR MMIO before parent clocks are enabled; present since
  v4.14.
- Can hang or fail IRQ clear on rebind / post-suspend / deferred probe.
- 6-line, obviously correct; reviewed by Konrad, applied by Will.
- Standalone; no new API.
- Same RPM wrap the parent already uses for `SMMU_INTR_SEL_NS`.
- Driver still used (MSM8916-class DT).

**Against:**
- No `Reported-by` / syzbot / crash log.
- Message says “unreliable”, not “panic”.
- Not a universal hot path.
- Lore stable search could not be fetched (403).

**Unresolved:** Exact production crash vs silent bad read on every SoC
variant — not verified beyond Qualcomm’s description.

**Stable rules:**
1. Obviously correct and tested? **PASS** (review + maintainer apply;
   pattern already in-tree)
2. Real user-facing bug? **PASS** (clock-gated MMIO on probe/rebind)
3. Important (crash/hang/corruption)? **PASS** (HIGH: interconnect hang
   / SError / stale IOMMU IRQ)
4. Small and contained? **PASS** (6 lines, one function)
5. No new features/APIs? **PASS**
6. Applies to this tree? **PASS** (driver and RPM API present)

**Exception category:** none (not an ID/quirk/DT/build/doc add). It is a
normal small driver bugfix.

This tree is v7.3-rc4 and already contains `cb776a03a5342`; that is the
upstream commit, not a reason to reject on merit. The buggy FSR-without-
clocks path is in this driver and has been since v4.14. The fix is
small, local, and prevents a real probe-time hardware access failure on
Qualcomm IOMMU platforms.

### What it solves for stable users
Without the RPM get, context-bank probe can touch `CB_FSR` while
iface/bus/tbu clocks are off. That is the same class of bug the parent
already fixed for `SMMU_INTR_SEL_NS`. On rebind or after suspend/remove
(and on deferred probe after unused clocks are disabled), that access is
a hang or a missed IRQ clear, then a surprise fault IRQ.

### Risk vs benefit
Benefit is avoiding probe-time MMIO with clocks gated on still-shipping
MSM IOMMU v1/v2 boards. Risk is a few lines of standard
`resume_and_get`/`put_sync` around an existing register poke. No locking
or API change.

### Concerns
No public reproducer. Independent of the rest of the “Misc Fixes”
series. `pm_runtime_resume_and_get()` is already in this tree.

Verification:
- [Phase 1] Tags: Reviewed-by Konrad Dybcio; SOBs Mukesh Ojha, Will
  Deacon; no Fixes/Reported-by/Cc-stable
- [Phase 2] Diff: +6/−1 in `qcom_iommu_ctx_probe()` wrapping FSR MMIO
  with parent RPM get/put
- [Phase 3] Blame: FSR clear from `0ae349a0f33fb0` (v4.14-rc1); ancestor
  of HEAD
- [Phase 3] Series mates `bf69e515b1802` / `e910315ae08a2` are not
  prerequisites
- [Phase 3] `pm_runtime_resume_and_get` from `dd8088d5a8969`; ancestor
  of HEAD
- [Phase 4] `b4 dig -c cb776a03a5342`: https://patch.msgid.link/20260717
  144608.3216274-7-mukesh.ojha@oss.qualcomm.com
- [Phase 4] `b4 dig -a`: v1 7/8 identical diff; Konrad R-b; v2 applied
  by Will; no NAK
- [Phase 4] Cover letter: “fixes in legacy qcom_iommu driver”
- [Phase 4] UNVERIFIED: lore.kernel.org/stable HTTP 403
- [Phase 5] Only caller: platform `.probe` via
  `devm_of_platform_populate()` from parent probe
- [Phase 5] Resume path enables clocks in `qcom_iommu_resume()` →
  `clk_bulk_prepare_enable()`
- [Phase 6] `git describe HEAD` = v7.3-rc4-27-gf0100363d8c37; `make
  kernelversion` = 7.3.0-rc4
- [Phase 6] `git merge-base --is-ancestor cb776a03a5342 HEAD` succeeded
  (fix already in this 7.3 tree)
- [Phase 6] Pre-image of the commit still has unguarded
  `iommu_writel`/`iommu_readl` on `ARM_SMMU_CB_FSR`
- [Phase 8] Failure mode: clock-gated SMMU MMIO → hang/SError or stale
  fault IRQ; severity HIGH
- UNVERIFIED: no captured oops from a reporter

**YES**

 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index fbe4bd3ec0c42..792585321bd11 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -704,8 +704,13 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 	/* clear IRQs before registering fault handler, just in case the
 	 * boot-loader left us a surprise:
 	 */
-	if (!ctx->secured_ctx)
+	if (!ctx->secured_ctx) {
+		ret = pm_runtime_resume_and_get(dev->parent);
+		if (ret)
+			return ret;
 		iommu_writel(ctx, ARM_SMMU_CB_FSR, iommu_readl(ctx, ARM_SMMU_CB_FSR));
+		pm_runtime_put_sync(dev->parent);
+	}
 
 	ret = devm_request_irq(dev, irq,
 			       qcom_iommu_fault,
-- 
2.53.0


