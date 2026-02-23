Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493DFEC1101
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYgM4TH1DpakGDlknJczUNjWSZ8y9hoVxSTIb4JHaSU=; b=L6fnR9/2jBfUEOeUMdkApUXoR6
	T+gFLZtli1XyRRQkVXKqkFUcF13uKXEML2IlYM3JhDK4evFIOi+v3xMGSqVDTeUuwIUeGmP7QxMdB
	FhyiB+yNE83xXBn9SdAPYAUGetswgFfQ5OZMD1pPtrD/am63xoB5YEV0HxRTjtPRfyWNK+wV0oB9K
	9/8Ekg18APZycCD+vh7pAXngKJz4er49WwjwiNoy1TlM3Yl/yIwXFUOHWvpSzF3BdLz3PEZ6YHCkP
	1G9cYzDdPpRLx3SY6iVrtIgs4xd92P5MuuKQqbMcEQJXGP/z1Y9hR4Lvbz32Fxoe05mtZr2NABIsQ
	GUhQM/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYcW-00000000eV8-3q62;
	Mon, 23 Feb 2026 16:17:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYcT-00000000eUM-3zqq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:17:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 051BF4451D;
	Mon, 23 Feb 2026 16:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA44C19423;
	Mon, 23 Feb 2026 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771863432;
	bh=XK+PXadn+TlLWZTmix1ykoVvNzE32bv+ynARqf+1YAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hpUNSPJmNO7oPx/1iv/Q7WtE3cARfWvR0y2ySUTfgf5bdL2nHfEk+dK/sDhplawEN
	 J0dCp5+lFXmvytXDBKY4QCSY7Tcd0ZIXIkj8o4JlU0DDJnc97Iejvoe0gn+w8BUeGV
	 R3C3oOmoj2/rDG3w8G8FypdJa13OWTpyoro/uoTyhNSPBqFrJhquzXNwOU7md11KYk
	 w4mk0U7uWEI8ph2hqKIMOsW72qsjjpgr0jaFbvMgmkBU7MRQyWGO+AblsbsA9e3jkH
	 a3BO7HYxCm9D/duUF5PYygBqtHCYnjP208JLJYxKpT1J7buMio5Ye267xQxGwj/WbG
	 MganSQkzHrk8g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tomas Melin <tomas.melin@vaisala.com>,
	Harini T <harini.t@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.1] rtc: zynqmp: correct frequency value
Date: Mon, 23 Feb 2026 11:17:07 -0500
Message-ID: <20260223161707.2714732-3-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223161707.2714732-1-sashal@kernel.org>
References: <20260223161707.2714732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.3
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_081714_173150_F53EE5E2 
X-CRM114-Status: GOOD (  20.12  )
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

From: Tomas Melin <tomas.melin@vaisala.com>

[ Upstream commit 2724fb4d429cbb724dcb6fa17953040918ebe3a2 ]

Fix calibration value in case a clock reference is provided.
The actual calibration value written into register is
frequency - 1.

Reviewed-by: Harini T <harini.t@amd.com>
Tested-by: Harini T <harini.t@amd.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
Acked-by: Michal Simek <michal.simek@amd.com>
Link: https://patch.msgid.link/20260122-zynqmp-rtc-updates-v4-1-d4edb966b499@vaisala.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### What the commit fixes

This commit fixes an off-by-one error in the RTC calibration value when
the frequency is obtained from a clock reference (via `clk_get_rate()`).
The ZynqMP RTC hardware register expects a calibration value of
`frequency - 1`, but the code was writing the raw frequency value
directly.

**Evidence:**
- `RTC_CALIB_DEF` = `0x7FFF` = 32767 = 32768 - 1 (the default is already
  correctly decremented)
- The `"calibration"` DT property presumably provides the register-ready
  value (already freq-1)
- But `clk_get_rate()` returns the raw clock rate (e.g., 32768), so it
  needs the `-1` adjustment
- Without the fix, the RTC counts one extra tick per second, causing
  time drift

### Code change assessment

The fix adds an `else` branch with `xrtcdev->freq--` when the frequency
comes from `clk_get_rate()` (i.e., when `xrtcdev->freq` is non-zero from
the clock). This is a 2-line addition, surgically targeted.

### Dependency analysis

The clock name fix `2a388ff22d2cb` ("rtc: zynqmp: Fix optional clock
name property") was already tagged `Cc: stable@kernel.org` and is
targeted at v6.14-rc1. Before that fix, the driver was looking for clock
name "rtc_clk" instead of "rtc" (matching the DT binding), so the clock-
based frequency path was effectively dead code. With `2a388ff22d2cb`
being backported to stable, the clock can now actually be found, making
this off-by-one bug reachable.

The underlying calibration infrastructure was introduced in
`07dcc6f9c762` (v6.0-rc1), so stable trees v6.1.y and later have the
affected code.

### Stable criteria evaluation

- **Fixes a real bug:** Yes - incorrect RTC calibration causes time
  drift
- **Obviously correct:** Yes - the register needs freq-1, this subtracts
  1
- **Small and contained:** Yes - 2 lines in one file
- **No new features:** Correct - purely fixes calibration logic
- **Tested:** Yes - has Tested-by and Reviewed-by from AMD engineer,
  Acked-by from Michal Simek

### Risk assessment

**Very low risk.** The change only affects the path where a clock
reference provides the frequency. It cannot break the default path
(`RTC_CALIB_DEF`) or the DT `"calibration"` property path. The worst
case if something were wrong would be an RTC running at the wrong rate -
exactly the same as the current bug.

### Verification

- Read the full driver source: confirmed `RTC_CALIB_DEF` = 0x7FFF =
  32767 (line 40)
- Verified `clk_get_rate()` returns raw frequency, not register value,
  per kernel API
- `git show 85cab027d4e31`: confirmed previous calibration fix changed
  default from 0x198233 to 0x7FFF (32768-1)
- `git show 07dcc6f9c762`: confirmed this is the commit that introduced
  clock-based calibration (v6.0-rc1)
- `git describe --contains 2a388ff22d2cb`: confirmed clock name fix is
  in v6.14-rc1, already tagged for stable
- `git describe --contains 07dcc6f9c762`: confirmed calibration support
  is in v6.0-rc1, present in all current stable trees
- The fix directly corresponds to the relationship: `RTC_CALIB_DEF`
  (default) = 0x7FFF = 32768 - 1, confirming the register semantics

This is a small, well-tested fix for incorrect RTC timekeeping. It's a
companion to the already-stable-tagged clock name fix. Without this fix,
any board using the ZynqMP RTC with a clock reference will have
incorrect time calibration.

**YES**

 drivers/rtc/rtc-zynqmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 3baa2b481d9f2..856bc1678e7d3 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -345,7 +345,10 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 					   &xrtcdev->freq);
 		if (ret)
 			xrtcdev->freq = RTC_CALIB_DEF;
+	} else {
+		xrtcdev->freq--;
 	}
+
 	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	if (!ret)
 		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));
-- 
2.51.0


