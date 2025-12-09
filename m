Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5DDD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 00:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tBFAQRqcERi2gSTNoYa5kzsSm9gXY3m9UfBFDQECVk=; b=4qeAofyerp/E9km+Ko9Ehfg8aT
	j+Dchntx/6Wws15lw7hiJtFR2DGe4S51Z7bk60MTYUY+QNaY40khGYOWFT5+5UqjjVKpr+vqBQQiG
	brwnAleOnJJ0XsNmOqiYX+CvFz5IxO8Sz1xXv7t/Am8iHoGKeIkxUgZdsiNNrQ6SNrlCf40eDU/nH
	RFhb1N2NAvTIycOPsrF8TovgO1N0jD/yM5t/ds2PjBTxeZji1mQE88HDEDEu974gz4Nzg//3WRPaT
	uR9Kh4fe6pjY3g65sqKrPychTFskpCfbYrs6Eesvb9mmxovSwAvg6xIthV72cxz/D3nxg+SzcqxM5
	tbnW+dWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSlPa-0000000Dedk-01Sr;
	Tue, 09 Dec 2025 00:17:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSlPX-0000000DedH-0qiK;
	Tue, 09 Dec 2025 00:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1472043251;
	Tue,  9 Dec 2025 00:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13CDC113D0;
	Tue,  9 Dec 2025 00:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765239417;
	bh=CcoOduBaJKs+Vjdxjvqz8sl0XCzaN235phou1vX6Q7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZT0wrQAdlZg68BobiE6NmgGOvL0AYRawmqvssGrtTPwrbIxbHIW1cqe8Y1ajTOC2l
	 z1RRJiwp25q3phSIkLGZjhKNAY7X1xPpoqr5o7WoHrz3loizZiSvz59yoc4WVy7NW6
	 GmdoyTvlP2k7i2zF+wwgHynrQx1YwMEPHPOzRfs+7N2O2kBqug7THD2UihnbwuwKlF
	 94bDAwsLJDBWKu1u/4xFKGSiYmK4JV0sakphOlwn/Ppm4UewRj6ld30liKdyutpkWW
	 NbmO2lGoS6J7Vl404zaK3l9Uap8Tpb1Qf0/N7Ds7BF6bUMVSZGF2wL7WkMNUw4mVZF
	 VIjdKki0s56Hw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Caleb James DeLisle <cjd@cjdns.fr>,
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
Subject: [PATCH AUTOSEL 6.18-5.10] wifi: mt76: mmio_*_copy fix byte order and alignment
Date: Mon,  8 Dec 2025 19:15:04 -0500
Message-ID: <20251209001610.611575-12-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251209001610.611575-1-sashal@kernel.org>
References: <20251209001610.611575-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_161659_287352_F6B12C43 
X-CRM114-Status: GOOD (  20.87  )
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

From: Caleb James DeLisle <cjd@cjdns.fr>

[ Upstream commit 2df00805f7dbaa46b60c682aad0d76270b7ba266 ]

Update functions which copy to and from MMIO to load bytes as Little
Endian, and also support unaligned buffers.

PCI devices almost universally use Little Endian ordering for MMIO
registers, mt76 is no exception. PCI hardware that is designed to work
with Big Endian CPUs often (but not always) "helps" by transparently
byte-swapping MMIO reads and writes on the wire. If this is enabled
then it cannot be turned off for a single write. On hardware which does
not support this, writel() does the swap in software. When we are
transferring arbitrary bytes to MMIO space, we need them to arrive in
the same order they were in memory, so when the hardware swaps them
this is a problem. Rather than care about how our PCI host controller
works, we instead load bytes as Little Endian - so on a Big Endian
machine this will reverse them, then we use writel() which will put
them back in the right order again. This way we do not make it our
business whether the swapping is done in software or hardware.

Furthermore, inspection of the code shows that these functions are
often called with stack-allocated u8 arrays which have no alignment
guarantees so we now use (get|put)_unaligned_le32().

Fixes this issue:
mt76x2e 0000:02:00.0: ROM patch build: 20141115060606a
mt76x2e 0000:02:00.0: Firmware Version: 0.0.00
mt76x2e 0000:02:00.0: Build: 1
mt76x2e 0000:02:00.0: Build Time: 201607111443____
mt76x2e 0000:02:00.0: Firmware failed to start
mt76x2e 0000:02:00.0: probe with driver mt76x2e failed with error -145

Tested on:
SmartFiber XP8421-B (Big Endian MIPS 34Kc)
  - MT7612 -> 5g / ap / psk2
  - MT7603 -> 2g / sta / psk2
  - MT7603 -> 2g / ap / psk2
TpLink Archer v1200v-v2 (Big Endian MIPS 34Kc)
  - MT7613 -> 5g / ap / psk2
  - MT7603 -> 2g / sta / psk2

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Link: https://patch.msgid.link/20251029184143.3991388-1-cjd@cjdns.fr
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## ANALYSIS SUMMARY

### 1. COMMIT MESSAGE ANALYSIS

**Bug Description:** The commit fixes two issues in mt76 WiFi driver's
MMIO copy functions:
1. **Byte order issue on Big Endian systems:** The original code uses
   `__iowrite32_copy()` and `__ioread32_copy()` which internally use
   `__raw_writel()`/`__raw_readl()` - these do NOT perform byte swapping
2. **Unaligned buffer issue:** Stack-allocated u8 arrays may not be
   4-byte aligned

**User-visible failure:** Complete driver probe failure with "Firmware
failed to start" error -145 on Big Endian systems. WiFi is totally non-
functional.

**Testing:** Tested on real hardware - multiple MT76 devices on Big
Endian MIPS platforms (SmartFiber, TP-Link Archer).

**Notable:** No `Fixes:` or `Cc: stable` tags present.

### 2. CODE CHANGE ANALYSIS

**Root cause:** The generic `__iowrite32_copy()` function (in
`lib/iomap_copy.c:20-28`) uses `__raw_writel()` which writes bytes in
host order without endian conversion. On Big Endian systems, bytes
arrive at the PCI device in the wrong order.

**The fix:**
- Replaces `__iowrite32_copy()` with explicit loop using `writel()` +
  `get_unaligned_le32()`
- Replaces `__ioread32_copy()` with explicit loop using `readl()` +
  `put_unaligned_le32()`

**Why it's correct:**
1. `get_unaligned_le32()` reads 4 bytes interpreting them as little-
   endian (safe for unaligned access)
2. `writel()` handles endian conversion (host→LE for PCI wire format)
3. Combined: bytes arrive at hardware in correct order regardless of
   host endianness
4. On Little Endian systems: behavior is functionally equivalent (no
   regression risk)

**Header dependency:** `<linux/unaligned.h>` is included transitively
via `mac80211.h` → `mt76.h` → `mmio.c`

### 3. CLASSIFICATION

- **Type:** Bug fix (not a feature)
- **Severity:** HIGH - Complete driver failure on affected systems
- **Scope:** mt76 WiFi devices on Big Endian architectures (MIPS
  routers, embedded systems)
- **Security:** Not a security issue

### 4. SCOPE AND RISK ASSESSMENT

| Factor | Assessment |
|--------|------------|
| Lines changed | ~10 lines (very small) |
| Files affected | 1 file (mmio.c) |
| Complexity | Low - uses standard kernel APIs |
| Risk of regression | Low - functionally equivalent on LE systems |
| Self-contained | Yes - no dependencies on other commits |

### 5. USER IMPACT

- **Affected users:** Big Endian systems with mt76 WiFi (OpenWrt
  routers, embedded MIPS devices)
- **Impact severity:** CRITICAL for affected users - WiFi doesn't work
  at all
- **Impact scope:** Minority use case (BE systems are uncommon)

### 6. STABILITY INDICATORS

- ✅ Signed off by subsystem maintainer (Felix Fietkau)
- ✅ Tested on multiple real hardware platforms
- ✅ Uses well-established kernel primitives
- ⚠️ No Reviewed-by tags from others
- ⚠️ No explicit stable request

### 7. DEPENDENCY CHECK

- ✅ Self-contained patch
- ✅ No prerequisite commits needed
- ✅ Code path exists in all stable trees with mt76 (since 2019)

## VERDICT

**Arguments FOR backporting:**
- Fixes a complete driver failure that makes WiFi unusable on Big Endian
  systems
- Small, surgical fix (~10 lines) with well-defined scope
- Uses standard, well-tested kernel APIs (`writel`,
  `get_unaligned_le32`)
- Self-contained with no dependencies
- Accepted by maintainer
- Functionally equivalent on Little Endian systems (no regression risk)

**Arguments AGAINST backporting:**
- No explicit `Cc: stable` tag from maintainer
- No `Fixes:` tag indicating when bug was introduced
- Big Endian systems are a minority use case

**Conclusion:** Despite the lack of explicit stable tagging, this commit
fixes a severe, user-visible bug (complete driver failure) with a small,
obviously correct fix using standard kernel patterns. The risk is low
and the benefit is high for affected users. Big Endian MIPS platforms
with mt76 WiFi (common in OpenWrt/embedded space) deserve working WiFi
support.

**YES**

 drivers/net/wireless/mediatek/mt76/mmio.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/wireless/mediatek/mt76/mmio.c
index cd2e9737c3bf9..865ec910f05a4 100644
--- a/drivers/net/wireless/mediatek/mt76/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mmio.c
@@ -33,13 +33,21 @@ static u32 mt76_mmio_rmw(struct mt76_dev *dev, u32 offset, u32 mask, u32 val)
 static void mt76_mmio_write_copy(struct mt76_dev *dev, u32 offset,
 				 const void *data, int len)
 {
-	__iowrite32_copy(dev->mmio.regs + offset, data, DIV_ROUND_UP(len, 4));
+	int i;
+
+	for (i = 0; i < ALIGN(len, 4); i += 4)
+		writel(get_unaligned_le32(data + i),
+		       dev->mmio.regs + offset + i);
 }
 
 static void mt76_mmio_read_copy(struct mt76_dev *dev, u32 offset,
 				void *data, int len)
 {
-	__ioread32_copy(data, dev->mmio.regs + offset, DIV_ROUND_UP(len, 4));
+	int i;
+
+	for (i = 0; i < ALIGN(len, 4); i += 4)
+		put_unaligned_le32(readl(dev->mmio.regs + offset + i),
+				   data + i);
 }
 
 static int mt76_mmio_wr_rp(struct mt76_dev *dev, u32 base,
-- 
2.51.0


