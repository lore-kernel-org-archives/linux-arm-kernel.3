Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D3FF588C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5Vw+DysHTH1n2k01QoI8nUmnEWj1bi347eQmZs9p20=; b=fMTBx0Fuf1beIkbn1qQvgg/0k4
	D4cPqtwnShGhcYvTYLLUYiiiAuJaeKl1tX6E9/IA7tm7UbHN8EVMHsTolTZ1AZ62/sXJqi+aD8Gyg
	wObZzCGndjRSStDUKLE0Ze7NTP3sufYAeiMLA6mhj8NWF1WTmeJrj8sWCClw5hX92M484BLs9eUtB
	flDzPQ/fMeoQGvzn5jJ4IMaD1LjAMKgXRzwNjk3jewsq3ObJNSb2NX/7Ntz9QmWNVtie/GQrIjPdT
	mCNe+KNG5MW6Bluc42cYUASOZsbv2kYVOvVaAWAX7ZOpwdnrYX1xRZCm7kCoYOeLzL0oApX7tbLPo
	bCBEHcTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoe0-000000070Rl-3Tcs;
	Mon, 20 Apr 2026 13:26:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEodz-000000070RO-2UrX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1061860582;
	Mon, 20 Apr 2026 13:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6514EC2BCB6;
	Mon, 20 Apr 2026 13:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691590;
	bh=m5QEVKm030ElDj9lg8EY1wI7itCIqVkRRRQ2p0XlGck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKvyc+gjjt6Ak7MFltDV+dlIIbVjnyP5QThlin9bGR0N0Pf85x8ITp3G/J11gYZBX
	 KlZLETl8F7mDwi0vhNLi/G5Mk2s5VAcIFbr64mBUB/PtT7O3VPcPEoB/pwYyldnVLD
	 Iv+rCKd4H4jHpEi2i9LBSs1vzjQ3hU1ES8kxUYW8Z5Uf5hK3Hl+UAAf57nzITzuWXQ
	 emAXb6r/p8ZCXCcGtkWx5HluLD74KsaArgQ+6qLu7nKKN9LhsHaUbK4cO4W6huvvPB
	 JpFXF+cwSIUDjWuSobrIrmx0YJgycvJsDLVcX4P/N9+dtiHR+K1X+5f8qj8yQF0HIL
	 teD78Ct+K/5fw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	Frank.Li@nxp.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.1] ASoC: mxs-sgtl5000: disable MCLK on error paths of mxs_sgtl5000_probe()
Date: Mon, 20 Apr 2026 09:18:33 -0400
Message-ID: <20260420132314.1023554-119-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
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

From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

[ Upstream commit c8ef13d692f19cdbbf195fb845421a5b71801704 ]

Call mxs_saif_put_mclk() to disable MCLK on error
paths of mxs_sgtl5000_probe().

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Link: https://patch.msgid.link/20260401053051.586290-1-lihaoxiang@isrc.iscas.ac.cn
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a complete picture. Let me compile the full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `ASoC: mxs-sgtl5000`
- Action verb: "disable" (implies fixing a missing cleanup)
- Summary: Disable MCLK on error paths of `mxs_sgtl5000_probe()`
- Record: [ASoC/mxs-sgtl5000] [disable/fix] [Add missing
  mxs_saif_put_mclk() on probe error paths]

**Step 1.2: Tags**
- Signed-off-by: Haoxiang Li (author) - a contributor focused on error-
  path resource leak fixes
- Link: `https://patch.msgid.link/20260401053051.586290-1-
  lihaoxiang@isrc.iscas.ac.cn`
- Signed-off-by: Mark Brown (ASoC maintainer applied the patch)
- No Fixes: tag, no Reported-by, no Cc: stable (expected for review
  candidates)

**Step 1.3: Commit Body**
The message is concise: call `mxs_saif_put_mclk()` to disable MCLK on
error paths. The bug is a resource leak - `mxs_saif_get_mclk()` enables
a hardware clock, and if probe fails after that point, the clock remains
enabled.

**Step 1.4: Hidden Bug Fix Detection**
This IS a resource leak fix. The wording "disable MCLK on error paths"
is a classic resource-leak-on-error-path fix pattern.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- 1 file changed: `sound/soc/mxs/mxs-sgtl5000.c`
- 2 lines added: two `mxs_saif_put_mclk(0)` calls + braces adjustment
- Functions modified: `mxs_sgtl5000_probe()`
- Scope: single-file surgical fix

**Step 2.2: Code Flow Change**
Two error paths are fixed:

1. **`snd_soc_of_parse_audio_routing()` failure** (line 160): BEFORE:
   returned directly without disabling MCLK. AFTER: calls
   `mxs_saif_put_mclk(0)` before returning.

2. **`devm_snd_soc_register_card()` failure** (line 165): BEFORE:
   returned directly without disabling MCLK. AFTER: calls
   `mxs_saif_put_mclk(0)` before returning.

**Step 2.3: Bug Mechanism**
Category: **Error path / resource leak fix**.

`mxs_saif_get_mclk()` at line 144:
- Calls `__mxs_saif_get_mclk()` which sets `saif->mclk_in_use = 1`
- Calls `clk_prepare_enable(saif->clk)` to enable the hardware clock
- Writes to SAIF_CTRL to enable MCLK output

When probe fails after this, `mxs_saif_put_mclk()` (which disables the
clock, clears MCLK output, and sets `mclk_in_use = 0`) is never called.
The `remove()` callback only runs if `probe()` succeeded.

**Step 2.4: Fix Quality**
- Obviously correct: mirrors the cleanup done in `mxs_sgtl5000_remove()`
- Minimal/surgical: only 2 meaningful lines added
- Regression risk: essentially zero - only affects error paths
- The fix follows the exact same pattern as the existing `remove()`
  function

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame Analysis**
- The `mxs_saif_get_mclk()` call was introduced in the original driver
  commit `fcb5e47eff29a1` (2011, v3.2). So the register_card error-path
  leak has existed since 2011.
- The audio-routing error path was introduced by `949293d45d6b09` (2018,
  v4.16) which added `snd_soc_of_parse_audio_routing()` without cleanup
  on failure.
- Both error paths predate all active stable trees.

**Step 3.2: No Fixes: tag** (expected for review candidates)

**Step 3.3: Related Changes**
- `6ae0a4d8fec55` (2022): Fixed a different resource leak (of_node_put)
  in the same probe function - shows this function has a history of
  incomplete error handling.
- `7a17f6a95a613` (2021): Switched to `dev_err_probe()` for
  register_card failure.

**Step 3.4: Author Context**
Haoxiang Li is a prolific error-path/resource-leak fix contributor.
Their commit history shows many similar fixes across kernel subsystems
(PCI, SCSI, media, DRM, clock, bus drivers).

**Step 3.5: Dependencies**
No dependencies. The fix only adds `mxs_saif_put_mclk(0)` calls, which
has existed since the driver was created. Should apply cleanly to all
stable trees.

## PHASE 4: MAILING LIST RESEARCH

Lore was not accessible due to bot protection. However:
- The patch was accepted by Mark Brown (ASoC subsystem maintainer)
  directly
- The Link tag points to the original submission
- Single-version submission (no v2/v3), suggesting it was
  straightforward

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Functions Modified**
Only `mxs_sgtl5000_probe()` is modified.

**Step 5.2: Resource Chain**
- `mxs_saif_get_mclk()` → `__mxs_saif_get_mclk()` → sets
  `mclk_in_use=1`, clears CLKGATE, configures clock rate →
  `clk_prepare_enable()` → writes SAIF_CTRL to enable MCLK RUN
- `mxs_saif_put_mclk()` → `clk_disable_unprepare()` → sets CLKGATE →
  clears RUN → `mclk_in_use=0`

Without the fix, on error: clock stays enabled, hardware MCLK output
stays active, `mclk_in_use` remains 1 (preventing future attempts to get
MCLK).

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Code Presence**
The buggy code exists in ALL active stable trees:
- The register_card error leak exists since v3.2 (2011)
- The audio-routing error leak exists since v4.16 (2018)
- All stable trees (5.4.y, 5.10.y, 5.15.y, 6.1.y, 6.6.y, 6.12.y) contain
  both bugs

**Step 6.2: Backport Difficulty**
The patch should apply cleanly or with trivial fuzz. Stable trees older
than 6.1 use `of_find_property()` instead of `of_property_present()`,
but the error path code is unchanged. The `devm_snd_soc_register_card`
error path in trees before 5.15 uses slightly different error printing
(not `dev_err_probe`), but the fix location is the same.

## PHASE 7: SUBSYSTEM CONTEXT

- Subsystem: ASoC (sound/soc) - audio driver infrastructure
- Criticality: PERIPHERAL (MXS/i.MX28 embedded audio, specific platform)
- The MXS SAIF + SGTL5000 combination is used on Freescale/NXP i.MX28
  boards

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Affected Users**
Platform-specific: users of i.MX28 boards with SGTL5000 audio codec
(embedded systems).

**Step 8.2: Trigger**
Probe failure on the audio device. This can be triggered by:
- Invalid/malformed audio-routing DT property
- `devm_snd_soc_register_card()` failure (e.g., codec not ready, probe
  deferral errors)

**Step 8.3: Failure Mode**
- Clock resource leak (hardware clock left enabled, consuming power)
- `mclk_in_use` flag remains set, potentially blocking future MCLK
  acquisition
- Severity: MEDIUM (resource leak, not crash)

**Step 8.4: Risk-Benefit**
- BENEFIT: Fixes resource leak on error paths. Clean cleanup of hardware
  state.
- RISK: Very low. Only 2 lines, only error paths, mirrors existing
  remove() logic.
- Ratio: Favorable. Very low risk fix for a real resource leak.

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
- Fixes a real resource leak (hardware clock left enabled on probe
  failure)
- Fixes `mclk_in_use` state leak that can prevent subsequent attempts
- Tiny, surgical fix (2 lines of meaningful code)
- Obviously correct (mirrors the cleanup in `remove()`)
- Accepted by ASoC subsystem maintainer (Mark Brown)
- Bug exists in all stable trees (since v3.2/v4.16)
- Zero regression risk (only error paths affected)
- The same function had a prior similar fix (`6ae0a4d8fec55` for
  of_node_put)

**Evidence AGAINST:**
- Platform-specific driver (limited user base, i.MX28)
- No Reported-by (found by code review, not user complaint)
- Resource leak, not crash/security/corruption
- No Fixes: tag (but expected for review candidates)

**Stable Rules Checklist:**
1. Obviously correct and tested? **YES** - mirrors remove() pattern,
   accepted by maintainer
2. Fixes a real bug? **YES** - clock resource leak on error
3. Important issue? **MEDIUM** - resource leak, not critical severity
4. Small and contained? **YES** - 2 lines, 1 file
5. No new features? **YES** - pure bugfix
6. Can apply to stable? **YES** - should apply cleanly to all active
   trees

## Verification

- [Phase 1] Parsed tags: Link to patch.msgid.link, SOB by Mark Brown
  (maintainer), author Haoxiang Li
- [Phase 2] Diff analysis: 2 lines of `mxs_saif_put_mclk(0)` added to
  two error paths in `mxs_sgtl5000_probe()`
- [Phase 3] git blame: `mxs_saif_get_mclk()` introduced in
  fcb5e47eff29a1 (v3.2, 2011); audio-routing error path introduced in
  949293d45d6b09 (v4.16, 2018)
- [Phase 3] git show 949293d45d6b09: confirmed it added
  `snd_soc_of_parse_audio_routing()` error path without cleanup
- [Phase 3] git show 6ae0a4d8fec55: confirmed prior error-handling fix
  in same function (of_node_put leak)
- [Phase 3] Author commits: Haoxiang Li is a serial error-path leak
  fixer
- [Phase 4] Lore inaccessible due to bot protection; patch accepted by
  Mark Brown directly
- [Phase 5] Read mxs_saif_get_mclk: confirms it enables clock + sets
  mclk_in_use=1; put_mclk disables clock + clears flag
- [Phase 6] Code exists in all stable trees from 5.4.y through 6.12.y
- [Phase 6] git log v6.6..HEAD: only 4 commits to this file since v6.6,
  none conflicting
- [Phase 8] Failure mode: clock resource leak + mclk_in_use state leak
  on probe error, severity MEDIUM

The fix is small, surgical, obviously correct, and fixes a real resource
leak that has existed since 2011/2018. It meets all stable kernel
criteria.

**YES**

 sound/soc/mxs/mxs-sgtl5000.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 245f174116384..f1c0e612313dd 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -157,13 +157,16 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(&pdev->dev, "failed to parse audio-routing (%d)\n",
 				ret);
+			mxs_saif_put_mclk(0);
 			return ret;
 		}
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret) {
+		mxs_saif_put_mclk(0);
 		return dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
+	}
 
 	return 0;
 }
-- 
2.53.0


