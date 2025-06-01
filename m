Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0269C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 01:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJntOgVILsIRw7ooq2RELczdEnB+OhL6drNsODye+ws=; b=tEaGOgF4mLBouLvoJRw3v50w3j
	Hd/XYvgcLJrs6JfFe7dgvpQFR78OMn0jYjDkri0yCTP1wCnhRaJL/s+pi/ITUuEEj5owIf8NSEk8I
	8WWi0N/mwqa8ZPYQkBvlUI7LMylhwYHYnxpXLEoq0+hqcuV53u6ryZg29T1lXVCehr31L/a5uoK5s
	Kr4WtuNkhkuGIMib/yS9vLXvYJv6Ynco+A+BVKGattopSKbtzwxLwBIIBGM95dpfRChdwNFU38Uut
	rrfiC3JJ5c0Im/1on9wYswjYHBinypgpi0fw9pQIdjKDf9ujpebOMEfO7tuv00XoDM0gMRSzvcaH9
	L/+J86oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLtib-00000006RoU-3CGI;
	Mon, 02 Jun 2025 01:12:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLsL2-00000006A0v-0BHu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Jun 2025 23:43:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A36455C4B5A;
	Sun,  1 Jun 2025 23:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA08C4CEE7;
	Sun,  1 Jun 2025 23:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821414;
	bh=lz6HZW0YPk7zKbjNFmy7h+kpF5GL+p0B2ua3GPSZIrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LBG67Pj2etkpi35ewIEA/CMcnmTPVWsVR8VpjVQnJT27X/L4C54yTlynsLA9H1fNb
	 kUVTzS1rvWhBEZY+Cowuv1MDWbgdxzmZFoOd+oT03VBDknrUltZp6GO0M+RxZyrVl1
	 7jyslTRNZoELsZNU5uUhAcQ4FX70n0pjLrPmvDeM613k4wxCVRiK65jEO+Izh36orJ
	 qx8FnBegX+zsTLhH7a+WKhSF8H4DWe4lCPdNVV6U4D20aNF5FcdmwRN5/W86m2lVhe
	 urL3VjDW+Hby/JzK+aqqbpxk3d+tDWRXAHWqvdxoWldq2sLqaFF5Ji0vifA611Ifmr
	 PAFxnjdVKBs6w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	krzk@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 30/43] media: platform: exynos4-is: Add hardware sync wait to fimc_is_hw_change_mode()
Date: Sun,  1 Jun 2025 19:42:10 -0400
Message-Id: <20250601234224.3517599-30-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601234224.3517599-1-sashal@kernel.org>
References: <20250601234224.3517599-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_164336_162443_B1D542BE 
X-CRM114-Status: GOOD (  13.78  )
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

From: Wentao Liang <vulab@iscas.ac.cn>

[ Upstream commit bd9f6ce7d512fa21249415c16af801a4ed5d97b6 ]

In fimc_is_hw_change_mode(), the function changes camera modes without
waiting for hardware completion, risking corrupted data or system hangs
if subsequent operations proceed before the hardware is ready.

Add fimc_is_hw_wait_intmsr0_intmsd0() after mode configuration, ensuring
hardware state synchronization and stable interrupt handling.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit and examination of the kernel code,
here is my assessment: **YES** This commit should be backported to
stable kernel trees for the following reasons: ## Analysis of the Code
Change The commit adds a single line
`fimc_is_hw_wait_intmsr0_intmsd0(is);` at line 167 in the
`fimc_is_hw_change_mode()` function in
`drivers/media/platform/samsung/exynos4-is/fimc-is-regs.c`. ## Why This
Should Be Backported 1. **Clear Bug Fix**: The commit message explicitly
states this fixes a race condition where "the function changes camera
modes without waiting for hardware completion, risking corrupted data or
system hangs if subsequent operations proceed before the hardware is
ready." This is a classic hardware synchronization bug. 2. **Consistent
Pattern**: Examining the surrounding code shows that ALL other similar
hardware control functions (`fimc_is_hw_get_setfile_addr()`,
`fimc_is_hw_load_setfile()`, `fimc_is_hw_stream_on()`,
`fimc_is_hw_stream_off()`) already call
`fimc_is_hw_wait_intmsr0_intmsd0()` before writing to hardware
registers. The `fimc_is_hw_change_mode()` function was the only outlier
missing this synchronization. 3. **Minimal and Safe**: The change is
extremely small (one line) and uses an existing, well-tested
synchronization primitive. The `fimc_is_hw_wait_intmsr0_intmsd0()`
function implements a timeout-based wait with proper error handling. 4.
**Critical Subsystem**: This affects camera hardware control in Samsung
Exynos4 SoCs. Hardware synchronization issues in camera drivers can
cause: - System hangs (as mentioned in commit message) - Data corruption
- Unpredictable hardware state 5. **Runtime Safety**: The wait function
has built-in timeout protection (2000 iterations with 1μs delay each),
so it cannot cause infinite hangs even if hardware fails. 6. **Follows
Hardware Protocol**: The pattern clearly shows the proper hardware
protocol is: wait for ready state → write command → trigger interrupt.
The missing wait was a protocol violation. ## Comparison with Historical
References Looking at the provided similar commits marked "NO" for
backporting, they were all: - Documentation/binding changes (commits #1,
#2) - Code cleanup/feature removal (commit #3) - Architecture changes
(commit #4) The one commit marked "YES" (commit #5) was a simple bug fix
correcting a return value check, very similar in nature to this
synchronization fix. This commit fits the stable tree criteria
perfectly: it's a small, contained bug fix addressing a real hardware
synchronization issue that could cause system instability, with minimal
risk of regression.

 drivers/media/platform/exynos4-is/fimc-is-regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/exynos4-is/fimc-is-regs.c b/drivers/media/platform/exynos4-is/fimc-is-regs.c
index 366e6393817d2..5f9c44e825a5f 100644
--- a/drivers/media/platform/exynos4-is/fimc-is-regs.c
+++ b/drivers/media/platform/exynos4-is/fimc-is-regs.c
@@ -164,6 +164,7 @@ int fimc_is_hw_change_mode(struct fimc_is *is)
 	if (WARN_ON(is->config_index >= ARRAY_SIZE(cmd)))
 		return -EINVAL;
 
+	fimc_is_hw_wait_intmsr0_intmsd0(is);
 	mcuctl_write(cmd[is->config_index], is, MCUCTL_REG_ISSR(0));
 	mcuctl_write(is->sensor_index, is, MCUCTL_REG_ISSR(1));
 	mcuctl_write(is->setfile.sub_index, is, MCUCTL_REG_ISSR(2));
-- 
2.39.5


