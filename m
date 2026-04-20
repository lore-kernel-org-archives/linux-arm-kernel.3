Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF76AF588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yq8p7uK8lywqpvX0pFgAX/Ui64mP2cVRRthaF3EBUY=; b=CV5Rm8p2mZ2bOj0dwbQoe0L40z
	DcAkI1hgKppRCzgiMUkgxQBowAG5z+plbj9gTrsIkHV7CpiRk0PvCUbP+o2KjggPhffw4Uh9VVDJv
	ldkPhqBVgCf/F0kZ3+U6ZJb2r2SED/HDDbkQz78Jp9HCPhjfYJDVBzC7AI0C1ef0GlGds24cZXW4F
	wWx6nT3OIstyyMB1Y9g2lKDZ61I9ulkOypX82H2bpu7neirmIxMEcmwIBI8cXIbSWKMURy3Tu7w0/
	9oyDPL5CPIi5HMfDqC7CpMjgK+R+JO7Jgex2Z0bmtrBi35dY+jNvA9tUIlbAQmm9eOYMzoRpxS2Oi
	AHQlnT4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoVc-00000006yyF-1JRA;
	Mon, 20 Apr 2026 13:17:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoVZ-00000006yxI-2gkg;
	Mon, 20 Apr 2026 13:17:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EB034043A;
	Mon, 20 Apr 2026 13:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C7FC2BCB4;
	Mon, 20 Apr 2026 13:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691069;
	bh=f3xsyAIWxI4nn00HNYNNjBmimSPNBuKH8vBU5p8iJLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HdAG88NmYH6GuyXj6dySNYWssxcVNOdzdhVyR+KpfwJc259LU5t5tWjs204yFJvRh
	 y8rk/wdANibgQDkz4JRqA1NPX3WsDv6fHqsyMGpP+g/6wbL4b/YMQFihstQub8Ykyb
	 DXO1FJFB4vfg+e45cBgqGddS9vXeMC1fG22Px0KppXDSRvK1vl7+GGkRxwqBE6N1ss
	 tX4cgGVgC2VhT2a+oLBY971QEXvWJqpSUopzF1A/P8Yhoh4viDKkAE1FoQgBfBeBEB
	 HKgGO0k49LpRap3DySWaPNHbpDDf5shFFtg47o5sRqXZQ0zDhuV9XG9JWbL//9OmLi
	 eKUfzB4QNahhg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 7.0-6.18] wifi: mt76: abort ROC on chanctx changes
Date: Mon, 20 Apr 2026 09:09:01 -0400
Message-ID: <20260420131539.986432-75-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420131539.986432-1-sashal@kernel.org>
References: <20260420131539.986432-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_061749_726216_935B08A4 
X-CRM114-Status: GOOD (  26.63  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit de62b24224ac1533c17b3d5bae77164a82ae2e49 ]

mt76_change_chanctx() calls mt76_phy_update_channel() which switches
the hardware channel. If ROC is active on the same phy, this switches
away from the ROC channel and clears offchannel, but leaves ROC state
intact. Mac80211 still thinks the phy is on the ROC channel.

Abort any active ROC before proceeding, matching the pattern already
used in add, remove, assign, unassign, and switch chanctx functions.

Link: https://patch.msgid.link/20260309060730.87840-5-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

I now have all the information needed for a complete analysis. Let me
compile the findings.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `wifi: mt76:` (MediaTek MT76 wireless driver)
- Action: "abort" - stopping an ongoing operation to prevent state
  inconsistency
- Summary: Abort ROC (Remain on Channel) on channel context changes
- Record: [wifi: mt76] [abort] [Abort active ROC when channel context
  changes to prevent state desync]

**Step 1.2: Tags**
- Link: `https://patch.msgid.link/20260309060730.87840-5-nbd@nbd.name`
  (patch 5 in a series)
- Signed-off-by: Felix Fietkau `<nbd@nbd.name>` (mt76 subsystem
  maintainer/author)
- No Fixes: tag (expected for autosel candidates)
- No Reported-by (no external report; author found the issue)
- Record: Author is the mt76 subsystem creator. Patch 5 of a series.

**Step 1.3: Commit Body Analysis**
The commit describes a concrete bug mechanism:
1. `mt76_change_chanctx()` calls `mt76_phy_update_channel()` which
   switches the hardware channel
2. If ROC is active on the same phy, the hardware switches away from ROC
   channel
3. `offchannel` is cleared (set to false), but ROC state (`roc_vif`,
   `roc_link`, `roc_work` timer) remains intact
4. Mac80211 still believes the phy is on the ROC channel

Record: [State inconsistency between driver and mac80211 when chanctx
changes during active ROC] [Symptom: mac80211 and hardware out of sync
on channel state] [Bug introduced with channel.c in v6.14]

**Step 1.4: Hidden Bug Fix Detection**
This is clearly a bug fix, not cleanup. The commit explicitly describes
a state desynchronization between the hardware and the mac80211 layer.

---

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- 1 file changed: `drivers/net/wireless/mediatek/mt76/channel.c`
- +3 lines added (including blank line), 0 removed
- Function modified: `mt76_change_chanctx()`
- Scope: Single-function surgical fix
- Record: [channel.c +3/-0] [mt76_change_chanctx modified] [Single-file
  surgical fix]

**Step 2.2: Code Flow Change**
Before: `mt76_change_chanctx()` directly proceeds to cancel mac_work and
update channel.
After: Before canceling mac_work, checks if ROC is active
(`phy->roc_vif`) and aborts it via `mt76_abort_roc(phy)`.

**Step 2.3: Bug Mechanism**
Verified by reading `__mt76_set_channel()` at mac80211.c:1045:
`phy->offchannel = offchannel;`. When called from
`mt76_phy_update_channel()` with `offchannel = false`, it clears the
offchannel flag. But the ROC state (`roc_vif`, `roc_link`, `roc_work`)
remains set, causing a desynchronization.

Classification: **Logic/correctness fix** - missing cleanup of related
state when switching channels.

**Step 2.4: Fix Quality**
- Obviously correct: follows the exact pattern established by all other
  chanctx functions which abort scans
- Minimal: 2 lines of actual logic
- `mt76_abort_roc()` handles its own locking (takes `dev->mutex`
  internally), so calling it before the existing `mutex_lock` is correct
- Regression risk: extremely low - if ROC is not active (`roc_vif ==
  NULL`), the check is a no-op

---

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
From git blame, the buggy `mt76_change_chanctx()` was introduced by
commit `82334623af0cd` ("wifi: mt76: add chanctx functions for multi-
channel phy support") by Felix Fietkau on 2025-01-02. This commit is in
v6.14.

**Step 3.2: Fixes Tag**
No Fixes: tag present. The implicit target is `82334623af0cd` which
introduced `mt76_change_chanctx` without ROC abort handling.

**Step 3.3: File History**
The file has 7 commits since creation: the original, scanning code, ROC
functions, offchannel link, a deref fix, abort scan/roc on hw restart,
and relicensing. No conflicting changes near the modified area.

**Step 3.4: Author**
Felix Fietkau (nbd@nbd.name) is the creator and maintainer of the mt76
driver. He wrote the original `channel.c` file and all major chanctx
functions.

**Step 3.5: Dependencies**
The commit is patch 5 of a series (msgid `-5-`). However, the fix is
**self-contained**:
- `mt76_abort_roc()` already exists in the tree (since `a8f424c1287cc`,
  in v6.14)
- `phy->roc_vif` already exists in `mt76.h`
- `mt76_abort_roc` is declared in `mt76.h` and accessible from
  `channel.c`
- No other patch from the series is needed for this fix to work
  correctly.

---

## PHASE 4: MAILING LIST RESEARCH

**Step 4.1-4.5**: Lore.kernel.org is behind Anubis anti-bot protection
and could not be accessed. The `b4 dig` also did not find a match for
the message-id (possibly a future date issue). However, the patch URL is
well-formed and the commit is by the subsystem maintainer, providing
strong quality assurance.

Record: [UNVERIFIED: Could not access lore/b4 due to anti-bot
protection] [Author is mt76 maintainer which provides confidence in
quality]

---

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Functions Modified**
- `mt76_change_chanctx()` - modified to add ROC abort call

**Step 5.2: Callers**
`mt76_change_chanctx` is a mac80211 callback assigned via
`ieee80211_ops`. It is called by mac80211 whenever the channel context
configuration changes (width changes, radar detection changes). This is
a normal operation path triggered by AP configuration, DFS, or
regulatory changes.

**Step 5.3: Callees**
`mt76_abort_roc()` calls:
1. `cancel_delayed_work_sync(&phy->roc_work)` - cancels the ROC timeout
2. `mt76_roc_complete(phy)` under mutex - restores main channel, frees
   offchannel link, notifies mac80211

**Step 5.4: Call Chain**
Userspace/regulatory -> mac80211 -> `mt76_change_chanctx` -> bug
triggers if ROC active. This is reachable from normal WiFi operation
(e.g., DFS, bandwidth changes during P2P).

**Step 5.5: Similar Patterns**
All 5 other chanctx functions (`add`, `remove`, `assign`, `unassign`,
`switch`) already call `mt76_abort_scan()`. The fix adds the equivalent
`mt76_abort_roc()` to the one function that was missing it.

---

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Buggy Code in Stable Trees**
- `channel.c` with `mt76_change_chanctx` was introduced in v6.14 (commit
  `82334623af0cd`)
- `mt76_abort_roc` function exists since v6.14 (commit `a8f424c1287cc`)
- `mt76_abort_roc` is declared in `mt76.h` even in v6.14 (confirmed at
  line 1586)
- Bug affects: v6.14.y and later stable trees

**Step 6.2: Backport Complications**
The code in v6.14 matches exactly: `mt76_change_chanctx()` is identical
to the pre-patch state in v7.0. The patch would apply cleanly. No
forward-declaration issues since `mt76_abort_roc` is declared in
`mt76.h`.

**Step 6.3: Related Fixes**
No alternative fix for this specific bug exists in stable trees.

---

## PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1: Subsystem**
- Subsystem: WiFi/wireless drivers (drivers/net/wireless/mediatek/mt76)
- Criticality: IMPORTANT - mt76 is one of the most widely used WiFi
  chipset drivers (MT7921, MT7922, MT7925, MT7996, etc.), found in many
  laptops and routers

**Step 7.2: Activity**
Actively maintained by Felix Fietkau with recent commits in the channel
management area. The multi-radio/chanctx support is relatively new
(v6.14).

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Affected Users**
All users of MediaTek mt76 WiFi chipsets who use P2P, scanning, or any
ROC functionality while channel context changes occur.

**Step 8.2: Trigger Conditions**
- Trigger: Channel context change (width change or radar detection)
  while ROC is active
- Likelihood: Moderate - occurs during DFS, bandwidth negotiation, or
  regulatory changes that happen to coincide with P2P discovery or off-
  channel management frames
- Not directly triggered by unprivileged users (requires wireless state
  machine interaction)

**Step 8.3: Failure Mode**
- Driver/mac80211 state desynchronization
- ROC operations fail silently or behave unpredictably
- P2P connection failures
- Dangling ROC state may cause subsequent operations to fail or produce
  unexpected behavior
- Severity: **MEDIUM-HIGH** (functional failure, not crash, but can
  break WiFi connectivity features)

**Step 8.4: Risk-Benefit**
- Benefit: Fixes real state inconsistency in a widely-used WiFi driver
- Risk: Extremely low - 2 lines, guarded by `if (phy->roc_vif)` check,
  calls well-tested existing function
- Ratio: Very favorable

---

## PHASE 9: FINAL SYNTHESIS

**Step 9.1: Evidence Compilation**

FOR backporting:
- Fixes a real state desynchronization bug between driver and mac80211
- 2-line fix, obviously correct, minimal risk
- Written by the mt76 subsystem maintainer/author (Felix Fietkau)
- Follows the established pattern used by all other chanctx functions
- Self-contained, no dependencies on other patches
- Applies cleanly to v6.14+ stable trees
- mt76 is a widely-used WiFi driver

AGAINST backporting:
- No crash/panic, no data corruption - the bug causes functional issues
  (ROC state desync)
- No user reports (no Reported-by tag)
- Part of a larger series (other patches in series not evaluated)

UNRESOLVED:
- Could not access mailing list discussion due to anti-bot protection
- Could not verify if other patches in the series are also being
  considered

**Step 9.2: Stable Rules Checklist**
1. Obviously correct and tested? **YES** - trivial 2-line check, follows
   existing pattern, by subsystem maintainer
2. Fixes a real bug? **YES** - state desync between driver and mac80211
   during ROC
3. Important issue? **MEDIUM-HIGH** - WiFi functionality failure, not
   crash
4. Small and contained? **YES** - 2 lines in 1 file
5. No new features? **YES** - purely a bug fix
6. Can apply to stable? **YES** - clean apply to v6.14+

**Step 9.3: Exception Categories**
Not an exception category; this is a standard bug fix.

**Step 9.4: Decision**
The fix is small, surgical, obviously correct, written by the subsystem
maintainer, and fixes a real state inconsistency bug in a widely-used
WiFi driver. The risk is minimal and the benefit is clear.

---

## Verification

- [Phase 1] Parsed tags: Link to patch.msgid.link, SOB by Felix Fietkau
  (mt76 maintainer)
- [Phase 2] Diff analysis: +3 lines (2 logic + 1 blank) in
  `mt76_change_chanctx()`, adds ROC abort guard
- [Phase 2] Verified `__mt76_set_channel()` at mac80211.c:1045 sets
  `phy->offchannel = offchannel`, confirming the bug mechanism
- [Phase 3] git blame: `mt76_change_chanctx` introduced by commit
  `82334623af0cd` (v6.14) by Felix Fietkau
- [Phase 3] `mt76_abort_roc` introduced by `a8f424c1287cc` (v6.14),
  declared in mt76.h line 1586
- [Phase 3] Confirmed `b36d55610215a` (EXPORT_SYMBOL_GPL for abort_roc)
  is NOT in v6.14 but not needed since abort_roc is declared in mt76.h
- [Phase 3] Confirmed patch is self-contained: all referenced
  functions/fields exist in v6.14
- [Phase 4] UNVERIFIED: Could not access lore.kernel.org or b4 dig
  results due to anti-bot protection
- [Phase 5] Verified all 5 other chanctx functions call
  `mt76_abort_scan()` - this fix adds the analogous ROC abort
- [Phase 5] Verified `mt76_abort_roc` cancels work, locks mutex, calls
  `mt76_roc_complete`, unlocks - proper cleanup
- [Phase 6] `82334623af0cd` is in v6.14 (confirmed via `git merge-base
  --is-ancestor`)
- [Phase 6] v6.14 `mt76_change_chanctx` code is identical to pre-patch
  v7.0 - clean apply
- [Phase 8] Failure mode: state desynchronization causing ROC/P2P
  failures, severity MEDIUM-HIGH

**YES**

 drivers/net/wireless/mediatek/mt76/channel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index 2b705bdb7993c..a6e45b8d63d6b 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -88,6 +88,9 @@ void mt76_change_chanctx(struct ieee80211_hw *hw,
 			 IEEE80211_CHANCTX_CHANGE_RADAR)))
 		return;
 
+	if (phy->roc_vif)
+		mt76_abort_roc(phy);
+
 	cancel_delayed_work_sync(&phy->mac_work);
 
 	mutex_lock(&dev->mutex);
-- 
2.53.0


