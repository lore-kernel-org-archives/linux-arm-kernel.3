Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F08F588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VphNVw0AdeWWJvHIJQ4ioO1zE8MyioIz9Uu2pM96m4w=; b=cRqSRMv7JuqrzQ+vZKBRMCJlyg
	cbDmC/zYFx0q1g27EOHZBdN25WeCNja9ppQMl5mvNlGWeboDjkWVHN6KpgB//Nza27AcHNDX6+APv
	t+QdKs90Wrp4bmrBCB59OgOWzYMkc0Uf+7QOhkjTObJxSosC4tpcefqDFJh0vKIdnED+p2dM6h3s8
	kP8cVGSLRCY7EyXqm5kggun3afP7g21ewdEqYZxridmnpnWKqwnHKtCEFKxoNjr6XoJ8Bkm/asXPJ
	FAWoqB1pngn7zzKoh10Hq4nekEbdYTqzS1d6LGBIzNb6Z9grOAu9AvnRsLNrl3SbbZ0JO6Mw3I01X
	/c5P8nrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEocd-00000006zrC-0CjC;
	Mon, 20 Apr 2026 13:25:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoca-00000006zpy-0WYF;
	Mon, 20 Apr 2026 13:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4F7543F3F;
	Mon, 20 Apr 2026 13:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCF6C19425;
	Mon, 20 Apr 2026 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691503;
	bh=e0MFqXIIiCXoLpaSLqnvXnlhDpUGIyNU3o1ydpzS96M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RLgP5iEm7Sn4ghy39xhbOaLAcHJD7OonX1ApwZBh58UuDGNmpsU1JJD7qjZEDlNCo
	 qgUGtIFiiU2M8+yVFpKrTZluJyed0GH7fW5F3CAaYzi9bkH8DCH8eOOk3xIrK52IIY
	 VsI9lqzWTPcPEsyAssPJwYoRZbn25uKAUDpcmxPh+O6u8ZaRHGdz81mzyvrdbD7PAN
	 +0pwSHMcq6w8ZVNnG7cviwLk2NkIrJ3t0bEbesOGULWUTTTPPd0mH+XiqR8IvKOCVX
	 EkXAflvS1QIbYAhqo0pxwPIksFIyseffTYmCvurDE1aihCKsF4yvDzMbBEhAT/3vnv
	 8RdjYXVii+Q7A==
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
Subject: [PATCH AUTOSEL 7.0-6.19] wifi: mt76: avoid to set ACK for MCU command if wait_resp is not set
Date: Mon, 20 Apr 2026 09:17:42 -0400
Message-ID: <20260420132314.1023554-68-sashal@kernel.org>
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
X-CRM114-CacheID: sfid-20260420_062504_238743_2E3F8B34 
X-CRM114-Status: GOOD (  28.13  )
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

[ Upstream commit 169c83d3df95b57e787174454332e01eb1b823ed ]

When wait_resp is not set but the ACK option is enabled in the MCU TXD,
the ACK event is enqueued to the MCU event queue without being dequeued
by the original MCU command request.

Any orphaned ACK events will only be removed from the queue when another
MCU command requests a response. Due to sequence index mismatches, these
events are discarded one by one until a matching sequence index is found.

However, if several MCU commands that do not require a response continue
to fill up the event queue, there is a risk that when an MCU command with
wait_resp enabled is issued, it may dequeue the wrong event skb,
especially if the queue contains events with all possible sequence
indices.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Link: https://patch.msgid.link/20260203155532.1098290-3-shayne.chen@mediatek.com
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have enough information to compile the full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `wifi: mt76:`
- Action verb: "avoid" (indicating a prevention of incorrect behavior -
  this is a bug fix verb)
- Summary: Prevent setting ACK flag on MCU commands that don't wait for
  a response
- Record: [wifi: mt76] [avoid] [prevent orphaned ACK events in MCU event
  queue]

**Step 1.2: Tags**
- `Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>` -
  author, MediaTek engineer
- `Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>` - regular mt76
  contributor
- `Link: https://patch.msgid.link/20260203155532.1098290-3-
  shayne.chen@mediatek.com` - **patch 3** of a series
- `Signed-off-by: Felix Fietkau <nbd@nbd.name>` - mt76 maintainer,
  merged the patch
- No Fixes: tag (expected for candidates), no Reported-by, no syzbot
- Record: Author is MediaTek HW vendor engineer; committed by subsystem
  maintainer. Part of a series (patch 3).

**Step 1.3: Commit Body**
- Bug: When `wait_resp` is not set, ACK option is still set in MCU TXD.
  Firmware generates ACK events that nobody dequeues.
- Symptom: Orphaned ACK events accumulate in event queue. When a command
  with `wait_resp=true` is issued, it may dequeue a wrong event
  (sequence index mismatch), leading to incorrect MCU communication.
- Failure mode: MCU command/response mismatch, potential driver
  malfunction.
- Record: [MCU event queue pollution by orphaned ACK events] [Wrong
  event dequeued by subsequent commands] [No specific kernel version
  mentioned] [Root cause: ACK option unconditionally set regardless of
  wait_resp]

**Step 1.4: Hidden Bug Fix Detection**
- "avoid to set ACK" = preventing incorrect firmware behavior
- This is explicitly a bug fix disguised with "avoid" rather than "fix"
- Record: Yes, this is a real bug fix. Prevents event queue corruption.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- `drivers/net/wireless/mediatek/mt76/mcu.c`: 1 line changed
- `drivers/net/wireless/mediatek/mt76/mt7996/mcu.c`: ~8 lines changed
  (option logic restructured, SDO special case removed)
- Functions modified: `mt76_mcu_skb_send_and_get_msg()` in mcu.c,
  `mt7996_mcu_send_message()` in mt7996/mcu.c
- Record: [2 files, ~10 lines net change] [Single-subsystem surgical
  fix]

**Step 2.2: Code Flow Change**
- Hunk 1 (mcu.c): Changed `dev->mcu_ops->mcu_skb_send_msg(dev, skb, cmd,
  &seq)` to `dev->mcu_ops->mcu_skb_send_msg(dev, skb, cmd, wait_resp ?
  &seq : NULL)`. Before: always passes seq pointer. After: passes NULL
  when no response needed.
- Hunk 2 (mt7996/mcu.c): Old code always set ACK via
  `MCU_CMD_UNI_QUERY_ACK` or `MCU_CMD_UNI_EXT_ACK`, then special-cased
  SDO to strip ACK. New code builds option from `MCU_CMD_UNI` base,
  conditionally adds `MCU_CMD_SET` and `MCU_CMD_ACK` (only when
  `wait_seq` is non-NULL).
- Record: [Always ACK → conditional ACK based on wait_resp]

**Step 2.3: Bug Mechanism**
- Category: Logic/correctness fix
- Mechanism: The MCU TXD option field had ACK unconditionally set. When
  `wait_resp=false`, the caller never dequeues the resulting ACK event.
  These orphaned events accumulate and can cause subsequent
  `wait_resp=true` commands to get wrong events.
- The fix makes the firmware-facing ACK flag consistent with the driver-
  side intent.
- Record: [Logic/correctness] [Unconditional ACK flag causes orphaned
  events in MCU queue]

**Step 2.4: Fix Quality**
- Verified equivalence: When `wait_seq` is non-NULL, the new option
  values match old values exactly:
  - Query: `MCU_CMD_UNI | MCU_CMD_ACK` = 0x3 = `MCU_CMD_UNI_QUERY_ACK`
  - Non-query: `MCU_CMD_UNI | MCU_CMD_SET | MCU_CMD_ACK` = 0x7 =
    `MCU_CMD_UNI_EXT_ACK`
- The SDO special case removal is correct because SDO commands that
  don't wait will naturally have no ACK.
- Regression risk: Low. All 11 `mcu_skb_send_msg` implementations handle
  NULL `wait_seq` safely (verified via code review).
- Record: [Fix is obviously correct, verified logic equivalence] [Very
  low regression risk]

## PHASE 3: GIT HISTORY

**Step 3.1: Blame**
- mcu.c line 101: Introduced by `e452c6eb55fbfd` (Felix Fietkau,
  2020-09-30) - "mt76: move waiting and locking out of
  mcu_ops->mcu_skb_send_msg". The always-pass-seq behavior has been
  present since 2020.
- mt7996/mcu.c option logic: Introduced by `98686cd21624c7` (Shayne
  Chen, 2022-11-22) - initial mt7996 driver commit.
- SDO special case: `dab5b2025452f9` (Peter Chiu, 2025-11-06) - a
  targeted fix for the same class of bug, already in 7.0 tree.
- Record: [Buggy code from 2020 (mcu.c) and 2022 (mt7996)] [Present in
  all kernels since v6.2]

**Step 3.2: No Fixes: tag** - expected, N/A

**Step 3.3: File History**
- mcu.c has had only 4 changes since v6.6 (relicense, SDIO, retry,
  refcount)
- mt7996/mcu.c has had 149 commits since initial driver
- Record: [mcu.c is stable code; mt7996/mcu.c actively developed]

**Step 3.4: Author**
- StanleyYP Wang and Shayne Chen are regular MediaTek mt76 contributors
  (20+ commits each)
- Felix Fietkau is the mt76 subsystem maintainer who merged this
- Record: [Author is subsystem vendor engineer; merged by maintainer]

**Step 3.5: Dependencies**
- Patch 3 of a series (from message-id). Other patches may affect mt7925
  or other files.
- This patch is self-contained: the mcu.c change is a one-line
  conditional, and the mt7996 change is a local restructuring.
- The SDO commit (`dab5b2025452f9`) is already in 7.0 tree, and this
  patch supersedes it.
- Record: [Part of series but functionally standalone for mt7996]

## PHASE 4: MAILING LIST RESEARCH

- lore.kernel.org was behind anti-bot protection; could not fetch.
- The Link tag points to
  `patch.msgid.link/20260203155532.1098290-3-shayne.chen@mediatek.com`
  confirming it's patch 3 of a series.
- Merged by Felix Fietkau (mt76 maintainer) which implies review and
  acceptance.
- Record: [Could not access lore] [Patch merged by subsystem maintainer]

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Key Functions**
- `mt76_mcu_skb_send_and_get_msg()` - core MCU send/receive path for all
  mt76 drivers
- `mt7996_mcu_send_message()` - mt7996-specific TXD preparation and send

**Step 5.2: Callers**
- `mt76_mcu_skb_send_and_get_msg` is called from
  `mt76_mcu_send_and_get_msg()` and `mt76_mcu_skb_send_msg()` (inline
  wrapper). These are the primary MCU command interfaces used throughout
  all mt76 drivers.
- Record: [Core MCU path, called from dozens of locations in all mt76
  drivers]

**Step 5.4: Call Chain for wait_resp=false**
- `__mt76_mcu_send_firmware` → `mt76_mcu_send_msg(... false)` →
  `mt76_mcu_skb_send_and_get_msg(... false)` → `mcu_skb_send_msg(...,
  NULL)`
- Firmware scatter commands skip TXD option setup via `goto exit`, so
  those are unaffected.
- Record: [Currently, no mt7996 UNI commands are sent with
  wait_resp=false in this tree, but the fix is architecturally correct]

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Code Exists in Stable**
- mt7996 driver was introduced in v6.2 (commit `98686cd21624c7`)
- The buggy ACK-always-on pattern exists in all kernels since v6.2
- Record: [Present in stable trees 6.6.y and later]

**Step 6.2: Backport Complications**
- The mcu.c change should apply cleanly (context is stable since 2024).
- The mt7996/mcu.c change context includes the SDO special case
  (`dab5b2025452f9`), which was merged in v6.14 cycle. For older stable
  trees (6.6.y, 6.1.y), this SDO commit may not exist, requiring minor
  context adjustment.
- Record: [Clean apply for 7.0; may need minor adaptation for older
  stables]

## PHASE 7: SUBSYSTEM CONTEXT

- Subsystem: wifi (drivers/net/wireless/mediatek/mt76) - WiFi driver
- Criticality: IMPORTANT - mt76 is a widely-used WiFi chipset family
  (MediaTek)
- mt7996 is the Wi-Fi 7 (802.11be) driver, relatively new but growing
  user base
- Record: [IMPORTANT subsystem; growing user base for mt7996]

## PHASE 8: IMPACT AND RISK

**Step 8.1: Affected Users** - mt7996/mt7992 WiFi users (Wi-Fi 7
hardware)

**Step 8.2: Trigger Conditions** - Multiple MCU commands without
response need to be sent. Currently the SDO case is already fixed
separately. The broader fix is defensive/architectural.

**Step 8.3: Failure Mode** - MCU command/response mismatch → WiFi driver
malfunction, potential command timeouts. Severity: MEDIUM-HIGH (not a
crash/panic, but WiFi stops working correctly).

**Step 8.4: Risk-Benefit**
- Benefit: MEDIUM - fixes architectural correctness issue, prevents
  class of MCU communication bugs
- Risk: LOW - changes are minimal, all implementations verified to
  handle NULL safely
- Record: [Medium benefit, low risk = favorable ratio]

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
- Fixes a real architectural bug in MCU event handling
- Small and contained (2 files, ~10 lines)
- Obviously correct (verified logic equivalence for all option values)
- All 11 `mcu_skb_send_msg` implementations handle NULL safely
- Merged by subsystem maintainer (Felix Fietkau)
- Authors are MediaTek vendor engineers who understand the hardware
- Bug present since mt7996 introduction (v6.2)
- Subsumes the SDO-specific band-aid fix

**Evidence AGAINST backporting:**
- Part of a series (patch 3/N) - unclear if fully standalone for all
  scenarios
- Immediate practical impact limited: SDO case already fixed separately
- No user reports or syzbot triggers documented
- Changes the interface contract for `mcu_skb_send_msg` across all mt76
  drivers
- Broader fix is somewhat "preventive" for future commands that may be
  added

**Stable Rules Checklist:**
1. Obviously correct? YES (verified logic equivalence)
2. Fixes real bug? YES (orphaned events can corrupt MCU command
   handling)
3. Important? MEDIUM (WiFi malfunction, not crash)
4. Small and contained? YES (~10 lines, 2 files)
5. No new features? YES (pure bug fix)
6. Applies to stable? YES for 7.0 (SDO commit context matches)

**Verification:**
- [Phase 1] Parsed subject: "avoid" verb indicates bug prevention; patch
  3 of series
- [Phase 2] Diff: 1 line in mcu.c (conditional NULL), ~8 lines
  restructured in mt7996/mcu.c
- [Phase 2] Logic equivalence verified: MCU_CMD_UNI|MCU_CMD_ACK =
  MCU_CMD_UNI_QUERY_ACK (0x3), MCU_CMD_UNI|MCU_CMD_SET|MCU_CMD_ACK =
  MCU_CMD_UNI_EXT_ACK (0x7)
- [Phase 3] git blame: mcu.c line from e452c6eb55fbfd (2020), mt7996
  from 98686cd21624c7 (2022)
- [Phase 3] SDO fix dab5b2025452f9 confirmed in 7.0 tree
- [Phase 3] mt7996 mcu.c option code originates from initial driver
  (98686cd21624c7)
- [Phase 5] All 11 mcu_skb_send_msg implementations verified to handle
  NULL wait_seq safely (subagent confirmed no NULL dereferences)
- [Phase 5] No mt76_mcu_skb_send_msg(..., false) calls found in mt7996
  for UNI commands; firmware scatter skips TXD
- [Phase 6] mt7996 exists in stable 6.6.y and later
- [Phase 8] Failure: MCU response mismatch → WiFi malfunction, severity
  MEDIUM-HIGH
- UNVERIFIED: Could not access lore.kernel.org to check full series
  context and reviewer feedback

The fix is architecturally correct and addresses a real design flaw in
the MCU command path. While the immediate practical impact is somewhat
mitigated by the existing SDO fix, this is the proper general solution
that prevents the entire class of orphaned ACK events. The change is
small, safe, and merged by the subsystem maintainer. The risk is very
low given all implementations handle the NULL parameter correctly.

**YES**

 drivers/net/wireless/mediatek/mt76/mcu.c        |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 535c3d8a9cc0d..cbfb3bbec5031 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -98,7 +98,7 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	/* orig skb might be needed for retry, mcu_skb_send_msg consumes it */
 	if (orig_skb)
 		skb_get(orig_skb);
-	ret = dev->mcu_ops->mcu_skb_send_msg(dev, skb, cmd, &seq);
+	ret = dev->mcu_ops->mcu_skb_send_msg(dev, skb, cmd, wait_resp ? &seq : NULL);
 	if (ret < 0)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 54776f0703876..0abe5efa9424e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -322,13 +322,12 @@ mt7996_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 		uni_txd->pkt_type = MCU_PKT_ID;
 		uni_txd->seq = seq;
 
-		if (cmd & __MCU_CMD_FIELD_QUERY)
-			uni_txd->option = MCU_CMD_UNI_QUERY_ACK;
-		else
-			uni_txd->option = MCU_CMD_UNI_EXT_ACK;
+		uni_txd->option = MCU_CMD_UNI;
+		if (!(cmd & __MCU_CMD_FIELD_QUERY))
+			uni_txd->option |= MCU_CMD_SET;
 
-		if (mcu_cmd == MCU_UNI_CMD_SDO)
-			uni_txd->option &= ~MCU_CMD_ACK;
+		if (wait_seq)
+			uni_txd->option |= MCU_CMD_ACK;
 
 		if ((cmd & __MCU_CMD_FIELD_WA) && (cmd & __MCU_CMD_FIELD_WM))
 			uni_txd->s2d_index = MCU_S2D_H2CN;
-- 
2.53.0


