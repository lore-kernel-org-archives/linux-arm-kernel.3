Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE13C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 01:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fyl+UtwnFe9bTJq1Nroq8JP5bYJ46o0xscttxEcc4oY=; b=0wsNPaO6P1k0r/blQXQc/ML+je
	Kqjd6pTtGL15TCaWb61k9csE03hehIIt9DBwfvtxpaaPScdMFhTj2w3/tNkFNuxVCJYL9/8PHtjL8
	72bLSBNsPx84mQw1m6HjyNpF2eJW66v0KFk6J36PKZ91L/0RxYP3d38Xyh5yEP3lX3+QlKYQ/ijNk
	UwQW7Jdwh/5hkeNrU2bxTtV/XfAE1vFW0spsnauxNfT8vATQwVdaWDReoWrcc6HSGm7C8VEb5HTRS
	k+WEyYWTvl3udoTtURp9LebKOeONR/JYgzJLEhqDCXgAD7lxcX0i6huUczsBro7swGhSad3D+FoVG
	GVL22EwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcei-0000000C9gx-0C98;
	Wed, 04 Jun 2025 01:11:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcM0-0000000C6O5-0j5D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 00:51:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1DA25C2458;
	Wed,  4 Jun 2025 00:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983B3C4CEEF;
	Wed,  4 Jun 2025 00:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998299;
	bh=i2guXKq/zzHATlE+CQ8FXCickmwgBEE1jP63DXsldoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AQVzTD85R3zrqLUEBtuwoLPt3sLfaFkf4E4JD493Y8scQ4dlavKM0xbsuWwXgqvUQ
	 zX1fxUCY0Ym1A/CHBS/KZEPe01OVlliHYl5zxB9YFZVJdrPiDhYRNB+ZXKhTGlXZhs
	 43Ghr2QGrL4SRglSo89kUspDtaNZA0IdDg8VJx7j31YoeM8ZxrWm18ciaM/cqppYSl
	 CnHuBQURdr7VfjMlrxJpf1m7abogAtpF+O/0dBemhHBteBIV8mEHT+3qyV5DpZGqfj
	 78D2ZxbLmIz763WKOLzuowCXMtOM5Fszccdw10LVfpcfI3LmFzbmh1WZd/3ZMkyccL
	 BT4JUbSpGZuUQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hector Martin <marcan@marcan.st>,
	Neal Gompa <neal@gompa.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	sven@kernel.org,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 024/118] i2c: pasemi: Enable the unjam machine
Date: Tue,  3 Jun 2025 20:49:15 -0400
Message-Id: <20250604005049.4147522-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005049.4147522-1-sashal@kernel.org>
References: <20250604005049.4147522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_175140_302266_6C041B2D 
X-CRM114-Status: GOOD (  15.85  )
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

From: Hector Martin <marcan@marcan.st>

[ Upstream commit 88fe3078b54c9efaea7d1adfcf295e37dfb0274f ]

The I2C bus can get stuck under some conditions (desync between
controller and device). The pasemi controllers include an unjam feature
that is enabled on reset, but was being disabled by the driver. Keep it
enabled by explicitly setting the UJM bit in the CTL register. This
should help recover the bus from certain conditions, which would
otherwise remain stuck forever.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
Link: https://lore.kernel.org/r/20250427-pasemi-fixes-v3-1-af28568296c0@svenpeter.dev
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my thorough analysis of the commit and the surrounding
codebase, I can now provide a comprehensive assessment. **YES** ##
Extensive Analysis ### Nature of the Fix This commit addresses a **real
hardware bug** where I2C buses can become permanently stuck under
certain conditions. The analysis shows: 1. **Hardware Feature**: CTL_UJM
is defined as `BIT(8)` in the control register and stands for "UnJaM
mode" - a hardware feature specifically designed to automatically detect
and recover from bus jam conditions. 2. **Real Problem**: The codebase
reveals extensive jam detection mechanisms: - `SMSTA_JAM` (BIT(24)) and
`SMSTA_JMD` (BIT(25)) status bits for detecting jams - Bus status
polling that specifically waits for `!(status & SMSTA_JAM)` - Automatic
resets triggered when `SMSTA_JMD` is detected 3. **User Impact**: The
commit message states "The I2C bus can get stuck under some conditions
(desync between controller and device)" and "would otherwise remain
stuck forever" - indicating this causes **complete system functionality
loss** for affected I2C peripherals. ### Code Change Analysis The fix is
**minimal and surgical**: ```c -u32 val = (CTL_MTR | CTL_MRR |
(smbus->clk_div & CTL_CLK_M)); +u32 val = (CTL_MTR | CTL_MRR | CTL_UJM |
(smbus->clk_div & CTL_CLK_M)); ``` This single-line change adds
`CTL_UJM` to the control register value during reset, enabling the
hardware unjam feature that was previously being disabled. ### Stability
Criteria Assessment ✅ **Fixes Important Bug**: Resolves permanent I2C
bus lockups affecting system functionality ✅ **Small and Contained**:
Single bit flip in one register during reset operation ✅ **Minimal
Risk**: - Uses existing hardware feature (CTL_UJM already defined) -
Only affects reset behavior - Hardware designed to handle this bit
safely - No architectural changes ✅ **Clear Side Effects**: Only enables
a hardware recovery mechanism - no negative side effects expected ✅
**Critical Subsystem**: I2C is fundamental infrastructure used by many
system components ### Platform Context This affects **production
hardware**: - Apple Silicon (M1, M2, etc.) devices - Maintained by
active Asahi Linux team - Real users depend on functional I2C for USB-
PD, audio, and other critical peripherals ### Comparison to Similar
Commits This aligns closely with **Similar Commit #2** (marked YES)
which also addressed I2C bus recovery by improving lockup detection and
triggering recovery mechanisms. Both commits: - Fix real I2C bus lockup
issues - Make minimal, targeted changes - Improve hardware recovery
capabilities - Have low regression risk ### Conclusion This commit
represents an ideal stable backport candidate: it fixes a serious
hardware issue that completely breaks I2C functionality with a minimal,
low-risk change that enables an existing hardware recovery feature. The
fix prevents permanent system failures on affected hardware platforms.

 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index bd128ab2e2ebb..27ab09854c927 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -71,7 +71,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+	u32 val = (CTL_MTR | CTL_MRR | CTL_UJM | (smbus->clk_div & CTL_CLK_M));
 
 	if (smbus->hw_rev >= 6)
 		val |= CTL_EN;
-- 
2.39.5


