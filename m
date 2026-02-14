Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22DEEF99ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 01:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUevCZYsNR3eI5AfJfh6Vg/S/Re2JnbV+9wNQxpMVwM=; b=U+kZZSyLK54HQML1hGaMJdTUfd
	xQIz09nZDmH/qc3QptY82VdqVFH4GcgwSxlSVocoe3nTjudf+EVnDAsKbLU9e7cVbQZ1gYzyAjOfE
	8BEbxq9FAfJlJIgmqZOnHqN2K96dTw6r5ptQIwU4/zsglZl5yL+0fMT32A4/MOOGzBV3JLadAGnLk
	AnnxQHAP7ckoTpv3hhQexgFz0Lftg5uyL5mwPLFxcG+APcyv5xxTZ4FWijZv//Xqpi3BMp1yxdvJB
	rhaQ2ifcuf0DlxhmaB9cqNOZiHC9cImSQoBRqej/djakR60gfs8oT69qGslzuKP+Eethllp/kmbi6
	atzRZhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr44V-0000000462a-3kQY;
	Sat, 14 Feb 2026 01:03:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr44U-0000000461f-0SMf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 01:03:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3690760140;
	Sat, 14 Feb 2026 01:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA34C116C6;
	Sat, 14 Feb 2026 01:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031020;
	bh=7oaLobErMN+TqGfRqdKOgM0ev89zKKixrOyBKVO11YY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jGJbC/McbabnXVMb/Zb7aN5nhUu7eH98WB/EZ9OdLsMZDIFM6wCmxkPWWSZM+CW3F
	 NHySveadHLrGcTf4JzxG4B2F0FX87xLhnQJasMEFKyyh+XULLwASQ3qIQH/jXfsDme
	 5H9sK2/DcPwlTZq0mGpg55HdJn2TRZ4Oe3oDZ8oKSTK/8bcmB1ur8xuB/coQfXypa4
	 SSs73x4CPktLV+gDJhDzfS5e1OtzBuPDx61exnNtN4ArUgazCtFRdho6bLKnIq7lRI
	 5swWxVkmLAShzIxBXy+2ggbSaUEYy/on7GajOzlys77ysn7vMFXeKV1uXFth+ZqKx7
	 h9MRbg63UpAgA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Deepak Kumar <deepak.kumar01@st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-5.15] spi: stm32: fix Overrun issue at < 8bpw
Date: Fri, 13 Feb 2026 19:58:26 -0500
Message-ID: <20260214010245.3671907-26-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
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

From: Deepak Kumar <deepak.kumar01@st.com>

[ Upstream commit 1ac3be217c01d5df55ec5052f81e4f1708f46552 ]

When SPI communication is suspended by hardware automatically, it could
happen that few bits of next frame are already clocked out due to
internal synchronization delay.

To achieve a safe suspension, we need to ensure that each word must be
at least 8 SPI clock cycles long. That's why, if bpw is less than 8
bits, we need to use midi to reach 8 SPI clock cycles at least.

This will ensure that each word achieve safe suspension and prevent
overrun condition.

Signed-off-by: Deepak Kumar <deepak.kumar01@st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Link: https://patch.msgid.link/20251218-stm32-spi-enhancements-v2-2-3b69901ca9fe@foss.st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed for a comprehensive analysis.

## Comprehensive Analysis

### 1. COMMIT MESSAGE ANALYSIS

The subject line is **"spi: stm32: fix Overrun issue at < 8bpw"** -- a
clear bug fix. The body explains a hardware-level problem on the STM32H7
SPI controller: when SPI communication is suspended by the hardware
automatically, a few bits of the next frame can already be clocked out
due to internal synchronization delay. To achieve safe suspension, each
word must be at least 8 SPI clock cycles long. When `bits_per_word`
(bpw) is less than 8, the MIDI (Minimum Inter-Data Idleness) delay must
be increased to pad the total word time to at least 8 SPI clock cycles.

The commit is authored by an ST Microelectronics engineer (Deepak Kumar
at `st.com`), co-authored/signed by Alain Volmat (STM32 SPI maintainer
at `foss.st.com`), and merged by Mark Brown (SPI subsystem maintainer).
This lends high credibility.

### 2. CODE CHANGE ANALYSIS

The diff modifies `stm32h7_spi_data_idleness()` in `drivers/spi/spi-
stm32.c`:

**Old code (lines 1909-1912):**
```c
u32 midi = min_t(u32,
                 DIV_ROUND_UP(spi->cur_midi, sck_period_ns),
                 FIELD_GET(STM32H7_SPI_CFG2_MIDI,
                 STM32H7_SPI_CFG2_MIDI));
```

**New code:**
```c
u32 midi = DIV_ROUND_UP(spi->cur_midi, sck_period_ns);

if ((spi->cur_bpw + midi) < 8)
    midi = 8 - spi->cur_bpw;

midi = min_t(u32, midi, FIELD_MAX(STM32H7_SPI_CFG2_MIDI));
```

The changes are:
1. **Core fix (3 lines):** After computing the initial midi value, check
   if `bpw + midi < 8`. If so, increase midi to `8 - bpw`, ensuring a
   minimum total of 8 SPI clock cycles per word. This prevents the
   overrun condition.
2. **Style cleanup:** Replace `FIELD_GET(STM32H7_SPI_CFG2_MIDI,
   STM32H7_SPI_CFG2_MIDI)` with `FIELD_MAX(STM32H7_SPI_CFG2_MIDI)`. Both
   evaluate to 15 (the field is GENMASK(7,4), a 4-bit field), but
   `FIELD_MAX` is the semantically correct macro for getting the maximum
   field value.
3. **Reorder:** The clamping to maximum is now done AFTER the overrun
   adjustment, ensuring the adjustment isn't clamped away prematurely.

**Example scenario:** With bpw=4 and midi=1 (from a 100ns delay at 10MHz
clock):
- **Old:** Total = 4+1 = 5 cycles/word. Hardware suspension can corrupt
  next frame. → Overrun
- **New:** Since 4+1 < 8, midi is set to 4. Total = 4+4 = 8 cycles/word.
  → Safe suspension

### 3. THE BUG AND ITS IMPACT

When the STM32H7 SPI controller's overrun condition fires
(`STM32H7_SPI_SR_OVR`), the interrupt handler at line 1111-1113 logs
`"Overrun: RX data lost"` and sets `end = true`, which terminates the
transfer. This means:
- **Data loss** - received SPI data is discarded
- **Transfer failure** - the SPI communication is aborted
- Any device using bpw < 8 with MIDI configured experiences
  corrupted/failed SPI transfers

This is a real hardware bug affecting real STM32H7/STM32MP25 users with
SPI devices that use fewer than 8 bits per word.

### 4. SCOPE AND RISK ASSESSMENT

- **Lines changed:** Net +3 lines of logic. Very small.
- **Files touched:** 1 file (`drivers/spi/spi-stm32.c`).
- **Risk:** Very low. The new logic only activates when `spi->cur_bpw <
  8` AND `cur_midi > 0`. For all transfers with bpw >= 8 (the vast
  majority), behavior is completely unchanged. Even for bpw < 8 cases,
  the fix just increases the inter-data delay slightly, which is correct
  per the hardware spec.
- **Side effects:** Slightly longer word timing for bpw < 8. This is the
  desired behavior to prevent overrun.

### 5. DEPENDENCY ANALYSIS

This is the most significant concern. The function
`stm32h7_spi_data_idleness()` was significantly modified by:
- **`4956bf4452439`** ("spi: stm32: deprecate `st,spi-midi-ns`
  property", June 2025, v6.17-rc1): Changed the function signature from
  `(struct stm32_spi *spi, u32 len)` to `(struct stm32_spi *spi, struct
  spi_transfer *xfer)` and added the `spi_delay_ns` word_delay logic.
- **`244bc18e5f187`** ("spi: stm32: delete stray tabs", June 2025,
  v6.17-rc1+): Fixed indentation.

Both of these are post-6.16. Stable trees (6.12.y, 6.6.y, 6.1.y, 5.15.y)
have the **old** version of this function with the simpler `(spi, len)`
signature. However, the critical MIDI calculation block exists in ALL
versions since the driver's inception:

```c
if ((len > 1) && (spi->cur_midi > 0)) {
    u32 sck_period_ns = DIV_ROUND_UP(NSEC_PER_SEC, spi->cur_speed);
    u32 midi = min_t(u32,
                     DIV_ROUND_UP(spi->cur_midi, sck_period_ns),
                     FIELD_GET(STM32H7_SPI_CFG2_MIDI,
STM32H7_SPI_CFG2_MIDI));
```

The core 3-line overrun fix can be applied to the old function with
trivial context adjustment. The fix does not depend on the new function
signature -- it only uses `spi->cur_bpw` which has existed since the
driver was added.

### 6. CLASSIFICATION

This is a **hardware bug workaround / driver bug fix**. It's analogous
to a hardware quirk -- the STM32H7 SPI hardware requires at least 8
clock cycles per word for safe suspension, and the driver was not
enforcing this. The fix adds the enforcement.

### 7. VERDICT

**Positive factors:**
- Fixes a real, documented hardware issue (overrun = data loss +
  transfer failure)
- Extremely small and surgical (3 lines of logic)
- Very low regression risk (only affects bpw < 8 with midi configured)
- Authored by the hardware vendor (ST Microelectronics) who understands
  the hardware
- Reviewed and merged by the SPI subsystem maintainer
- The affected code exists in all stable trees since the driver was
  added (2017)

**Concerns:**
- The patch as-is won't apply cleanly to stable trees due to the
  function signature change from `4956bf4452439`, but the fix logic is
  self-contained and can be trivially adapted
- The fix only applies when `cur_midi > 0` (some inter-data delay is
  configured), so overrun with zero midi is not addressed (but this
  appears intentional)

The fix is small, surgical, and meets all stable kernel criteria. It
fixes a real hardware bug causing data loss for STM32H7 SPI users using
bpw < 8.

**YES**

 drivers/spi/spi-stm32.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 2c804c1aef989..80986bd251d29 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1906,11 +1906,12 @@ static void stm32h7_spi_data_idleness(struct stm32_spi *spi, struct spi_transfer
 	cfg2_clrb |= STM32H7_SPI_CFG2_MIDI;
 	if ((len > 1) && (spi->cur_midi > 0)) {
 		u32 sck_period_ns = DIV_ROUND_UP(NSEC_PER_SEC, spi->cur_speed);
-		u32 midi = min_t(u32,
-				 DIV_ROUND_UP(spi->cur_midi, sck_period_ns),
-				 FIELD_GET(STM32H7_SPI_CFG2_MIDI,
-				 STM32H7_SPI_CFG2_MIDI));
+		u32 midi = DIV_ROUND_UP(spi->cur_midi, sck_period_ns);
 
+		if ((spi->cur_bpw + midi) < 8)
+			midi = 8 - spi->cur_bpw;
+
+		midi = min_t(u32, midi, FIELD_MAX(STM32H7_SPI_CFG2_MIDI));
 
 		dev_dbg(spi->dev, "period=%dns, midi=%d(=%dns)\n",
 			sck_period_ns, midi, midi * sck_period_ns);
-- 
2.51.0


