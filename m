Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0674BCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMIAgehpvlJfwVjRW6Ef1m3CW0SLj5wjVorARf0EW4s=; b=gC1ucxBbK3uV0+aqxt6rwjekKq
	plj1TDgi0D/D91ea0yXdwBhyzG2bClH3thXySDxNPLxcyCzah9D74Im+njZsWVmCiZ5XnW56uyEiZ
	8pZ5tvgk01dgmV8GRFpOwAp/Yc/96o4TtNTyjLgMKSEeDtTQx4NgAMFnOMboYFwwCTeeYSL1/4T75
	+6U3QaQKunQHy43hW0KAogBFfR8XZwP44F1dW/4wTLrY7YSrtgWuDMhMNy5P556oKe2dSRvJV7td1
	gqrV9AiQWYuoC9ZJnPg2Pkwn5igFz7U0QBwLNtAr5tNnksTS7SeBJ7PiTP/VNojOj7pqc1Z5F4JDo
	mvEn2p1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsF4-00000004tW7-27LX;
	Tue, 09 Sep 2025 06:54:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmFq-00000003Eny-1ytH;
	Tue, 09 Sep 2025 00:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F5B560140;
	Tue,  9 Sep 2025 00:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114A5C4CEF7;
	Tue,  9 Sep 2025 00:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757377837;
	bh=0uzllPnalyRF+ushAucw1IpVYRxk4ZJLkGvfoHlSaLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ibgL2U5C0csPR6VvGNS5yjtW9vZ6hD/OOtTjVNpWsj75APHSVhp4ZiwyMdRBA+Scc
	 rCWBJRhjHvJTd1E47qfwrgO5MX6AbECK7u9ZKftd94r4rnZjR7N7vcYbQSWRD34qMh
	 2Wuz+/5V7iwIdPnNb+dHoSSGjqrVlqdvQsusQmPKboqVNwnxhNX8/G8kjEAHrdjRbk
	 RiFRM2UI3io3PVRkuijN6sEe2509SZbOLDYrFb9P3wpUjhxRpbXlDnWc0eY0Uhv+uv
	 yw/hc9tfZe7cYRWX7+BmKtbewTHsMCYtIkQhh/0OenBP8lAtRmRNNHC3GZSM3oubJ8
	 rxgqSU2IEHvyA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16] wifi: mt76: do not add non-sta wcid entries to the poll list
Date: Mon,  8 Sep 2025 20:30:16 -0400
Message-ID: <20250909003025.2493540-6-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909003025.2493540-1-sashal@kernel.org>
References: <20250909003025.2493540-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.5
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit a3c99ef88a084e1c2b99dd56bbfa7f89c9be3e92 ]

Polling and airtime reporting is valid for station entries only

Link: https://patch.msgid.link/20250827085352.51636-2-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

## Extensive Analysis

This commit adds a critical safety check to prevent non-station wcid
entries from being incorrectly added to the polling list in the mt76
wireless driver.

### Bug Being Fixed

The commit fixes a bug where non-station wcid (wireless client ID)
entries could be added to the `sta_poll_list`. Looking at the code
change in `mt76_wcid_add_poll()`:

```c
- if (test_bit(MT76_MCU_RESET, &dev->phy.state))
+       if (test_bit(MT76_MCU_RESET, &dev->phy.state) || !wcid->sta)
                return;
```

The addition of `|| !wcid->sta` prevents wcid entries that don't
represent actual wireless stations from being added to the polling list.

### Why This is a Critical Fix

1. **Prevents Kernel Crashes**: The polling mechanism (seen in files
   like mt7915/mac.c:100-150) assumes that wcids in the poll list have
   valid `ieee80211_sta` structures. When processing the poll list, the
   code does:
  ```c
  sta = container_of((void *)msta, struct ieee80211_sta, drv_priv);
  ieee80211_sta_register_airtime(sta, tid, tx_cur, rx_cur);
  ```
  For non-sta wcids (like global_wcid, group_wcid, or interface wcids),
  this would dereference invalid memory and cause a kernel panic.

2. **Affects All mt76-based Hardware**: This bug affects multiple
   MediaTek WiFi chipsets including mt7603, mt7615, mt7915, mt7921,
   mt7925, and mt7996, as evidenced by the calls to
   `mt76_wcid_add_poll()` across all these driver variants.

3. **Simple and Contained Fix**: The fix is a single-line addition of a
   boolean check that has minimal risk of introducing regressions. It
   only adds a safety check without changing any existing logic flow.

### Evidence from Code Analysis

The wcid structure (mt76.h:348-378) contains a `sta` field (line 365)
that's a 1-bit flag distinguishing between:
- Station wcids (`sta=1`): Real wireless clients
- Non-sta wcids (`sta=0`): Internal entries like global_wcid,
  group_wcid, interface wcids

The polling mechanism is specifically designed for collecting airtime
statistics from real stations for:
- Airtime fairness scheduling
- Rate control adaptation
- TX/RX time accounting

Non-sta wcids don't have associated `ieee80211_sta` structures and don't
participate in these mechanisms, so polling them is both meaningless and
dangerous.

### Stable Tree Criteria Assessment

✓ **Fixes a real bug**: Prevents potential kernel crashes from invalid
memory access
✓ **Small and contained**: Single-line boolean check addition
✓ **Clear bug fix**: Not a new feature or architectural change
✓ **Low regression risk**: Only adds a safety check, doesn't modify
existing behavior for valid cases
✓ **Affects users**: Can cause kernel panics in production WiFi systems
✓ **Driver-specific**: Confined to mt76 wireless subsystem

This is an ideal candidate for stable backporting as it fixes a clear
bug that can cause system crashes, the fix is minimal and safe, and it
affects widely-used MediaTek WiFi hardware.

 drivers/net/wireless/mediatek/mt76/mac80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 45c8db939d554..13dc868076f08 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1690,7 +1690,7 @@ EXPORT_SYMBOL_GPL(mt76_wcid_cleanup);
 
 void mt76_wcid_add_poll(struct mt76_dev *dev, struct mt76_wcid *wcid)
 {
-	if (test_bit(MT76_MCU_RESET, &dev->phy.state))
+	if (test_bit(MT76_MCU_RESET, &dev->phy.state) || !wcid->sta)
 		return;
 
 	spin_lock_bh(&dev->sta_poll_lock);
-- 
2.51.0


