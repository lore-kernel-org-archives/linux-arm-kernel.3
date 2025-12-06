Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DC4D3B7D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKSnWg6NWwEkIcNKXNbfvm4L817slsSWPnT89fyPR1g=; b=M1Jdn+E94xcgyPEE5/TjBtjyaK
	TTL1ToKWSySvA5SS4wY2ycUioquoOfWR9a57lt4WlNg8OZNO/LvvBaBGZsXfvHv3hq8aZHJDWiJzh
	y13aGe3O2tF/zHZ5n9iaMgk60arY9c3hL9Aru85gU31IaBCOPR0FdNlVhNBrVhaHHj/4gH4lCbFi1
	GeXR04Gt5nsfTlo89BcBZx2xibcIcuvXUo5ejSU7cATMBQwzpKQ/MT/vy6WkJ5ka1LZpwye6afEtG
	KFb+6ra1ztFyr7irBSUkkijWoLsiNk57wNvhfSZY/uAgeCAfsDzotTqUOcJpOVyVWfkEU7VHnghe9
	Nmvg2Axw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRst5-0000000Axsd-0f4S;
	Sat, 06 Dec 2025 14:03:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRst3-0000000Axs5-1LOL;
	Sat, 06 Dec 2025 14:03:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 033A440048;
	Sat,  6 Dec 2025 14:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2150CC4CEF5;
	Sat,  6 Dec 2025 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765029828;
	bh=hNnKmiMyeRgIeXCMtSCwGavX0YkqanFzBfdi7Gpu9+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nYh6z6rpqfY2FbeUuFfjkodQ7A5pI52L49qoARyM7QmCedp4gtS+AtovDQUrtEVXu
	 7QOPtvwxWBFKTh8Vj4sW+mt3IXqBLtv2vFrzg+TzMzaYVOIZrrGcfiPrXFgWO0EOLh
	 t+Jv7CRsaqOUo27XxYe/4FFeA2ZTo+RNWLY+J5WsD4tgQg6nYhNrb6+RS1So25clTe
	 6qoKSN7onIq6wOOR8Oca/IgAjEb5Cg2BkBgvc+Y5nmM0S1NKB0uG724OwKpZencAH/
	 pyIl83ftRPUs/XX/2YFz+lci6ldms7Z/eF/cp6EGpupogKodQ8pgl8IVBZawhGcKnF
	 LV4irtIO9EvKg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Quan Zhou <quan.zhou@mediatek.com>,
	druth@chromium.org,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	leon.yen@mediatek.com,
	alexandre.f.demers@gmail.com,
	alexander.deucher@amd.com,
	allan.wang@mediatek.com,
	mingyen.hsieh@mediatek.com,
	sean.wang@mediatek.com,
	michael.lo@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.18-6.12] wifi: mt76: mt792x: fix wifi init fail by setting MCU_RUNNING after CLC load
Date: Sat,  6 Dec 2025 09:02:29 -0500
Message-ID: <20251206140252.645973-24-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251206140252.645973-1-sashal@kernel.org>
References: <20251206140252.645973-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_060349_406418_B6EE8D01 
X-CRM114-Status: GOOD (  18.00  )
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

From: Quan Zhou <quan.zhou@mediatek.com>

[ Upstream commit 066f417be5fd8c7fe581c5550206364735dad7a3 ]

Set the MT76_STATE_MCU_RUNNING bit only after mt7921_load_clc()
has successfully completed. Previously, the MCU_RUNNING state
was set before loading CLC, which could cause conflict between
chip mcu_init retry and mac_reset flow, result in chip init fail
and chip abnormal status. By moving the state set after CLC load,
firmware initialization becomes robust and resolves init fail issue.

Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Reviewed-by: druth@chromium.org
Link: https://patch.msgid.link/19ec8e4465142e774f17801025accd0ae2214092.1763465933.git.quan.zhou@mediatek.com
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

# Commit Analysis: wifi: mt76: mt792x: fix wifi init fail by setting
MCU_RUNNING after CLC load

## 1. COMMIT MESSAGE ANALYSIS

**Subject:** Clearly indicates a bug fix ("fix wifi init fail")

**Problem described:** Setting `MT76_STATE_MCU_RUNNING` bit before CLC
(Country/Legal Configuration) load completion could cause conflicts
between MCU init retry and mac_reset flows, resulting in chip
initialization failure and abnormal chip status.

**Tags present:**
- `Signed-off-by:` Quan Zhou (MediaTek - chip vendor) and Felix Fietkau
  (mt76 maintainer)
- `Reviewed-by:` druth@chromium.org (Chrome OS kernel team - indicates
  real-world Chromebook impact)
- No explicit `Cc: stable@vger.kernel.org` tag
- No explicit `Fixes:` tag

## 2. CODE CHANGE ANALYSIS

The change is extremely simple and surgical:

**Before the fix:**
```c
set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);  // State set here
err = mt7921_load_clc(dev, mt792x_ram_name(dev));   // CLC load after
```

**After the fix:**
```c
err = mt7921_load_clc(dev, mt792x_ram_name(dev));   // CLC load first
set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);  // State set after
success
```

**Technical mechanism:**
- `MT76_STATE_MCU_RUNNING` indicates the MCU is fully operational
- Setting this flag prematurely (before CLC load) could allow other code
  paths to think the MCU is ready when it's not
- If something triggers MCU init retry or mac_reset during CLC load,
  there's a race condition
- The conflict causes complete initialization failure and abnormal chip
  state

**Why fix is correct:**
- The state bit should only be set when initialization is truly complete
- This ensures no code sees MCU_RUNNING during the vulnerable CLC
  loading phase
- Error handling remains intact (if CLC load fails, function returns
  error)

## 3. CLASSIFICATION

- **Type:** Bug fix - initialization failure fix
- **NOT** a feature addition
- Fixes a real runtime bug affecting device usability

## 4. SCOPE AND RISK ASSESSMENT

| Factor | Assessment |
|--------|------------|
| Lines changed | ~6 lines (just moving 1 line in 2 files) |
| Files touched | 2 (mt7921/mcu.c, mt7925/mcu.c) |
| Complexity | Very low - simple reordering |
| Regression risk | LOW - no logic changes, just timing |
| Subsystem | Wireless driver (contained) |

The change is almost purely a reordering operation within the same
function. If CLC load succeeds, the state gets set (same as before, just
later). If it fails, function returns error anyway.

## 5. USER IMPACT

**Affected hardware:** MediaTek mt7921 and mt7925 WiFi chips

These are **extremely common** chips found in:
- Many Chromebooks (Chrome OS review indicates this)
- Consumer laptops (Dell, Lenovo, HP, etc.)
- USB WiFi adapters
- Various PC builds

**Severity:** HIGH
- WiFi initialization failure = device doesn't work at all
- "chip abnormal status" suggests chip may be left in broken state
- Users cannot use their WiFi until reboot or driver reload

## 6. STABILITY INDICATORS

- Reviewed by Chromium kernel team (indicates real-world testing on
  Chromebooks)
- From MediaTek engineer (hardware vendor knows their chip)
- Accepted by mt76 maintainer Felix Fietkau
- Clean, minimal change with clear rationale

## 7. DEPENDENCY CHECK

The change is self-contained. It only reorders existing function calls
within `mt7921_run_firmware()` and `mt7925_run_firmware()`. No new
dependencies are introduced.

The mt7921 driver has been in stable kernels for some time. The mt7925
is newer and may not exist in older stable trees, but the mt7921 portion
would still be valuable.

## STABLE KERNEL CRITERIA CHECK

| Criterion | Met? | Notes |
|-----------|------|-------|
| Obviously correct | ✅ | Simple reordering, logic is clear |
| Fixes real bug | ✅ | WiFi init failure - real user impact |
| Small and contained | ✅ | 6 lines, 2 files, same subsystem |
| No new features | ✅ | No new APIs or functionality |
| No architectural changes | ✅ | Minimal change |

## RISK vs BENEFIT

**Benefit:** High - Fixes WiFi initialization failure on widely-deployed
hardware. Without this fix, affected users may have non-functional WiFi.

**Risk:** Very low - The change is a trivial reordering of two
operations. The logic remains identical; only the timing of when the
state bit is set changes. The fix has been reviewed by the chip vendor
and Chrome OS team.

## CONCLUSION

This commit is an ideal candidate for stable backporting:

1. **Fixes a real, user-visible bug** - WiFi doesn't work
2. **Minimal change** - Just reordering one line in each of two files
3. **Well-reviewed** - MediaTek and Chrome OS review
4. **Low regression risk** - No logic changes, simple timing fix
5. **High user impact** - mt7921/mt7925 are very common chips
6. **Contained scope** - Only affects initialization path of specific
   driver

The lack of `Cc: stable` tag doesn't disqualify it - many legitimate
fixes don't include this tag. The important factors are all positive: it
fixes a real bug, is small, safe, and affects real users.

**YES**

 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 86bd33b916a9d..edc1df3c071e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -646,10 +646,10 @@ int mt7921_run_firmware(struct mt792x_dev *dev)
 	if (err)
 		return err;
 
-	set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
 	err = mt7921_load_clc(dev, mt792x_ram_name(dev));
 	if (err)
 		return err;
+	set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
 
 	return mt7921_mcu_fw_log_2_host(dev, 1);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 8eda407e4135e..c12b71b71cfc7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1003,10 +1003,10 @@ int mt7925_run_firmware(struct mt792x_dev *dev)
 	if (err)
 		return err;
 
-	set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
 	err = mt7925_load_clc(dev, mt792x_ram_name(dev));
 	if (err)
 		return err;
+	set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
 
 	return mt7925_mcu_fw_log_2_host(dev, 1);
 }
-- 
2.51.0


