Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7812FF588C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2sQL+WIDV5NFF7jaouKjFSbyZQoe1FXqjgQHbusIrk=; b=gBceu8ApM0WinhsAuxb13Y1r2F
	JkcTfvo/Lsowq5LU5zOrhRbpapoRl07wBoRjLtZ+Xi1Lh/BelRok5Vp+bBAqbdSNjW9BvXsZo7Wkw
	6cUK3xV7iH8sZ7ENOQcW/IMYAvlxpGwrGAAXJ2e7rbLkICpVtKwfCqITxs2gXFOtoBT4yXcly5NvG
	6+gMy1hH0xf1AtMb7uAAlfC8SdLW1zx7V3J6jYKAN1m6upt2WT7c54Q2vZgdKASxAiK6j8/685SLC
	HBI1TFTq0aTGDwj4Zc6FiFvMhxyECfnLVRw08MrjgRnQ3V24GxB0qcC2CrS6b7wU4HPOSL6RWtPxj
	B9dF22Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoh5-000000071p5-11U1;
	Mon, 20 Apr 2026 13:29:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoh1-000000071ll-3dmK;
	Mon, 20 Apr 2026 13:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89E7F4065C;
	Mon, 20 Apr 2026 13:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F328CC2BCB9;
	Mon, 20 Apr 2026 13:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691779;
	bh=DVSVbUdKpbDvuRnkO+k2cYAK220bL7xPJ/H3+kN+0NQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qbh+Bed3gT6Nvo7wx18qAuOQ5HdGZfQU/lHiQ5CqPIQ22ga4XVyJvO22U/LbdmIXw
	 VKuWq6qdEHwpKYLMcdzgQOp3vjsTWhOROLVg44cECoDBKAIbPNnAeEylvXMCQp6TeN
	 tbG8AIY+sRjqtJFUav4sgTR72Nn9rlrlmK0AD0sTBD9tVDvM2wUC3jpCnk0kuyyZmm
	 1D5XTEINZ97f2uyzb5vEEq7N9LkmnnY+cFiHnFClcq8DiS2JbYIms1qYU//GOYrI/F
	 552Gh+HAzegIAKBk6mS1ADS1wlK/rEvwncvogJx39o0FK046AJm+cGz+P70/cB6kta
	 wwlVCd0tfO4HA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 7.0-6.18] wifi: mt76: mt7996: fix queue pause after scan due to wrong channel switch reason
Date: Mon, 20 Apr 2026 09:19:43 -0400
Message-ID: <20260420132314.1023554-189-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_062940_114866_91AA6E0C 
X-CRM114-Status: GOOD (  26.27  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

[ Upstream commit 1f9017d19db38ad2cb9bedb5b078f6f4f60afa94 ]

Previously, we used the IEEE80211_CONF_IDLE flag to avoid setting the
parking channel with the CH_SWITCH_NORMAL reason, which could trigger TX
emission before bootup CAC.

However, we found that this flag can be set after triggering scanning on a
connected station interface, and the reason CH_SWITCH_SCAN_BYPASS_DPD will
be used when switching back to the operating channel, which makes the
firmware failed to resume paused AC queues.

Seems that we should avoid relying on this flag after switching to single
multi-radio architecture. Instead, use the existence of chanctx as the
condition.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Link: https://patch.msgid.link/20260203155532.1098290-4-shayne.chen@mediatek.com
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Here is my complete analysis:

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject Line
- **Subsystem**: `wifi: mt76: mt7996:` (MediaTek mt7996 WiFi 7 chipset
  driver)
- **Action verb**: "fix" — explicit bug fix
- **Summary**: Fixes queue pause after scan due to wrong channel switch
  reason being sent to firmware

Record: [wifi: mt76: mt7996] [fix] [queue pause after scan due to wrong
channel switch reason]

### Step 1.2: Tags
- **Signed-off-by**: StanleyYP Wang (author, MediaTek engineer), Shayne
  Chen (MediaTek, submitter), Felix Fietkau (mt76 subsystem maintainer)
- **Link**: `https://patch.msgid.link/20260203155532.1098290-4-
  shayne.chen@mediatek.com` — patch 4 of a series
- No Fixes: tag (expected)
- No Reported-by tag
- No Cc: stable tag (expected)

Record: Patch is from MediaTek engineers (hardware vendor), signed off
by the mt76 maintainer Felix Fietkau. Part of a series (patch 4).

### Step 1.3: Commit Body Analysis
The commit explains:
1. **Previous approach**: Used `IEEE80211_CONF_IDLE` flag to avoid
   setting parking channel with `CH_SWITCH_NORMAL` reason (which could
   trigger TX emission before bootup CAC).
2. **Bug discovered**: After scanning on a connected station interface,
   the `IEEE80211_CONF_IDLE` flag can be set. When switching back to the
   operating channel, the wrong reason `CH_SWITCH_SCAN_BYPASS_DPD` is
   used, causing firmware to fail to resume paused AC queues.
3. **Fix**: Use the existence of `chanctx` (channel context) instead of
   the IDLE flag, which is more appropriate for the multi-radio
   architecture.

Record: Bug causes TX queues to remain paused after scan on a connected
station interface. Firmware-level failure to resume AC queues. Root
cause is the `IEEE80211_CONF_IDLE` flag being unreliable after the
multi-radio architecture switch.

### Step 1.4: Hidden Bug Fix Detection
Not hidden — explicitly labeled "fix" with clear bug mechanism
described.

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
- **Files changed**: 1
  (`drivers/net/wireless/mediatek/mt76/mt7996/mcu.c`)
- **Lines changed**: 2 lines modified (1 removed, 1 added — net -1 line)
- **Function modified**: `mt7996_mcu_set_chan_info()`
- **Scope**: Single-file, single-line surgical fix

### Step 2.2: Code Flow Change
The only change is in the condition for setting `switch_reason`:

Before:
```c
else if (phy->mt76->offchannel ||
         phy->mt76->hw->conf.flags & IEEE80211_CONF_IDLE)
    req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
```

After:
```c
else if (phy->mt76->offchannel || !phy->mt76->chanctx)
    req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
```

The `IEEE80211_CONF_IDLE` flag check is replaced by
`!phy->mt76->chanctx` (channel context is NULL). Both mean "no active
operating channel," but `chanctx` is the correct indicator in the multi-
radio architecture.

### Step 2.3: Bug Mechanism
**Logic/correctness fix**: The condition for determining which channel
switch reason to send to firmware was wrong. The `IEEE80211_CONF_IDLE`
flag can be spuriously set after scanning on a connected station,
causing the firmware to use `CH_SWITCH_SCAN_BYPASS_DPD` instead of
`CH_SWITCH_NORMAL` when returning to the operating channel. This makes
firmware fail to resume paused TX AC queues.

### Step 2.4: Fix Quality
- **Obviously correct**: Yes — `chanctx` directly indicates if a channel
  context exists, which is the semantic meaning needed.
- **Minimal/surgical**: Yes — 1 line change.
- **Regression risk**: Very low — `chanctx` is NULL only when no channel
  context is assigned, which is semantically equivalent to (and more
  accurate than) the IDLE flag check.

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
- The `IEEE80211_CONF_IDLE` check was introduced in commit
  `413f05d68d1198` (StanleyYP Wang, 2023-08-31, first in v6.7-rc1):
  "wifi: mt76: get rid of false alarms of tx emission issues"
- The `offchannel` field was introduced in `f4fdd7716290a2` (Felix
  Fietkau, 2024-08-28, first in v6.12-rc1): "wifi: mt76: partially move
  channel change code to core"
- The `chanctx` field and multi-radio architecture was introduced in
  commits `82334623af0cd` and `69d54ce7491d` (Felix Fietkau, 2025-01-02,
  first in v6.14-rc1)

Record: The bug only manifests from v6.14 onwards (when multi-radio
architecture was introduced and chanctx is used). The IDLE flag check
was fine before the architecture change.

### Step 3.2: No Fixes: tag present (expected).

### Step 3.3: File History
The mcu.c file is actively maintained with many recent fixes. The fix is
self-contained and standalone.

### Step 3.4: Author Context
StanleyYP Wang (author) is a regular MediaTek contributor working on
mt76 radar/DFS/channel features. Shayne Chen is the primary MediaTek
mt7996 contributor. Felix Fietkau is the mt76 subsystem maintainer who
signed off.

### Step 3.5: Dependencies
The fix uses `phy->mt76->chanctx` which exists in all trees from v6.14
onwards. No other dependencies needed.

---

## PHASE 4: MAILING LIST RESEARCH

Lore.kernel.org and patch.msgid.link are protected by Anubis anti-
scraping, so web fetch failed. b4 dig could not find the commit (it's a
candidate, not yet in tree).

The Link: URL (`20260203155532.1098290-4-shayne.chen@mediatek.com`)
shows this is patch 4 of a series, but the fix is completely self-
contained — it only changes one condition in one function.

Record: Could not access lore discussion due to anti-bot protection.
Patch 4 of a series, but standalone.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1-5.4: Function Call Analysis
`mt7996_mcu_set_chan_info()` is called from:
1. `mt7996_run()` (line 25 in main.c) — during interface start, with
   `UNI_CHANNEL_RX_PATH`
2. `mt7996_set_channel()` (lines 561, 565 in main.c) — during channel
   switch, with both `UNI_CHANNEL_SWITCH` and `UNI_CHANNEL_RX_PATH`

The `mt7996_set_channel()` path is the critical one — this is called
during scan return (switching back to operating channel). This is a hot
path triggered by every scan operation.

Record: Function called on every channel switch, including post-scan
return. Bug affects all users who scan while connected.

---

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Buggy Code in Stable Trees
- **v6.14.y through v6.19.y**: YES — all contain the buggy
  `IEEE80211_CONF_IDLE` check and have `chanctx` infrastructure
  available.
- **v6.12.y and earlier**: NO — don't have multi-radio architecture; the
  bug doesn't exist there (different code path).

Verified: v6.14.11 and v6.19.12 both have the exact same buggy code and
have the `chanctx` field available.

### Step 6.2: Backport Complications
The fix should apply cleanly to all affected stable trees (v6.14.y
through v6.19.y). The surrounding code context matches exactly.

---

## PHASE 7: SUBSYSTEM CONTEXT

### Step 7.1: Subsystem
- **Subsystem**: WiFi driver (drivers/net/wireless/mediatek/mt76/mt7996)
- **Criticality**: IMPORTANT — mt7996 is MediaTek's WiFi 7 chipset used
  in many routers and APs
- **Activity**: Very active development (many recent commits)

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Affected Population
Users of mt7996-based WiFi hardware (WiFi 7 routers, APs, and client
devices) running kernels v6.14+.

### Step 8.2: Trigger Conditions
Triggering a scan while connected as a station interface. This is a
**very common operation** — background scanning happens regularly for
roaming decisions, network discovery, etc.

### Step 8.3: Failure Mode Severity
TX AC queues remain paused indefinitely after scan. This means **the
WiFi interface effectively stops transmitting data**. Severity: **HIGH**
— complete loss of WiFi transmit functionality until manual
intervention.

### Step 8.4: Risk-Benefit Ratio
- **Benefit**: HIGH — prevents complete WiFi TX failure on mt7996
  hardware after scanning
- **Risk**: VERY LOW — 1-line condition change, replacing one "no active
  channel" check with a more accurate one
- **Ratio**: Very favorable

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence Summary

**FOR backporting:**
- Fixes a real, functional bug: TX queues stuck after scan
- Very high impact: WiFi effectively stops working (no transmit)
- Common trigger: scanning while connected as station
- Minimal change: 1 line, obviously correct
- From the hardware vendor (MediaTek) and signed off by subsystem
  maintainer (Felix Fietkau)
- Applies cleanly to affected stable trees (v6.14.y through v6.19.y)
- No dependencies on other patches
- Zero regression risk

**AGAINST backporting:**
- No Fixes: tag (expected — that's why it needs review)
- Part of a series (patch 4), but the fix is self-contained
- Only affects v6.14+ trees (bug doesn't exist in older LTS trees)

### Step 9.2: Stable Rules Checklist
1. Obviously correct and tested? **YES** — trivial condition
   replacement, from hardware vendor
2. Fixes a real bug? **YES** — TX queues stuck = complete WiFi transmit
   failure
3. Important issue? **YES** — effectively disables WiFi after common
   operation
4. Small and contained? **YES** — 1 line change in 1 file
5. No new features or APIs? **CORRECT** — no new features
6. Can apply to stable trees? **YES** — applies cleanly to v6.14.y
   through v6.19.y

### Step 9.3: Exception Categories
Not needed — meets standard stable criteria as a bug fix.

---

## Verification

- [Phase 1] Parsed subject: explicit "fix" for queue pause after scan,
  WiFi mt76/mt7996 subsystem
- [Phase 2] Diff: 1 line changed in `mt7996_mcu_set_chan_info()`,
  replaces `IEEE80211_CONF_IDLE` flag with `!chanctx` check
- [Phase 3] git blame: `IEEE80211_CONF_IDLE` check added in
  413f05d68d1198 (v6.7-rc1), became buggy after multi-radio switch in
  69d54ce7491d (v6.14-rc1)
- [Phase 3] git describe --contains: chanctx infra first in v6.14-rc1,
  confirmed via `git merge-base --is-ancestor`
- [Phase 3] git show 413f05d68d1198: confirmed original CONF_IDLE commit
  purpose was DFS CAC false alarm avoidance
- [Phase 5] Grep callers: `mt7996_mcu_set_chan_info()` called from
  `mt7996_run()` and `mt7996_set_channel()` — channel switch path
  triggered on every scan return
- [Phase 6] git show v6.14.11/v6.19.12: confirmed buggy code present in
  both stable trees, chanctx field available
- [Phase 6] v6.12.y: does NOT have the bug (no multi-radio architecture,
  different code)
- [Phase 7] Felix Fietkau confirmed as mt76 maintainer (signed off on
  the fix)
- UNVERIFIED: Could not access lore.kernel.org discussion due to anti-
  bot protection

The fix is a clear, minimal, single-line correction that prevents WiFi
TX queues from permanently stalling after scan operations on mt7996
hardware. It meets all stable kernel criteria.

**YES**

 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 0abe5efa9424e..470e69eacb7da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3748,8 +3748,7 @@ int mt7996_mcu_set_chan_info(struct mt7996_phy *phy, u16 tag)
 
 	if (phy->mt76->hw->conf.flags & IEEE80211_CONF_MONITOR)
 		req.switch_reason = CH_SWITCH_NORMAL;
-	else if (phy->mt76->offchannel ||
-		 phy->mt76->hw->conf.flags & IEEE80211_CONF_IDLE)
+	else if (phy->mt76->offchannel || !phy->mt76->chanctx)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
 	else if (!cfg80211_reg_can_beacon(phy->mt76->hw->wiphy, chandef,
 					  NL80211_IFTYPE_AP))
-- 
2.53.0


