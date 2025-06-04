Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79AEC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 01:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhtDR0nxnNSaNBAYFKaWg4W6CvEuRy4L6IeZL65Wjtc=; b=O7PbbTazjY66wIw6YhwUOVomvP
	c6LfKuaVjYVyhHaMhWk/BAUlFov2xC2KAqkkO6jyY2j7s7Zet7YJIQm+6jb2GKbUlfc0F9Iqy0LiS
	RItBI1O8S3wa+6yPuJZi/FbBPOqxEZTb/NW/9uVc+wshu8tCwUpvZpTXx+RNqwD3tfaHBC70juVIE
	yVR+OFcsjKP1YhWDe/dJftn2zNwDIFYFaKqoJ0JqLP/elEFPnFbmZXDea3idRsXRCAGsKrBgVvami
	daLbA+SJ9z0DvLsj6s2mXayzj8juPA3aNk5i+uD05EfZRQGXO3yekbisi3Mru/0HfyWKwtog0ZA03
	GDqjKREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMdPp-0000000CGHc-2E4U;
	Wed, 04 Jun 2025 01:59:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcRd-0000000C7Pi-1Q4m;
	Wed, 04 Jun 2025 00:57:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE2D6A4FE56;
	Wed,  4 Jun 2025 00:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47C3C4CEED;
	Wed,  4 Jun 2025 00:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998648;
	bh=06/5TxgtZvM86mGzgWzAncs8N5P1lWHeSCmjUPHc7FI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=teuvQhVUKnG3ZSVPiR+AxFiQK26psRGoxOs8b0/SBgX6yqLTgtBd1BVcSB06WIvEp
	 f5jbrXv9E64dgegixgX5+Wj0YBO+Yn7UkwNSRnSh2jyyAvEGnW2YLygU9hlDnTM+iP
	 xTAkNeVk1pm/S7Ai7SnhNJDn7ttJIx46s1o4Ak37uBlsqIzKezUwdFijJYhY8BDOs5
	 fh5l8+Q5QXJY4JT1kSdqNcXQ17fgd8OjSroAIe9ZDmT7tDu3epznhY6A38TBdXRNLg
	 gALqz/PCKAeFWPOsPaE63rWLU9Bfc+9uTenhP6SaV/RKE3r6NOmvMJ71VyP9zpymRl
	 FmAQxdt7eghhw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 056/108] clk: rockchip: rk3036: mark ddrphy as critical
Date: Tue,  3 Jun 2025 20:54:39 -0400
Message-Id: <20250604005531.4178547-56-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005531.4178547-1-sashal@kernel.org>
References: <20250604005531.4178547-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_175729_494583_68970B5C 
X-CRM114-Status: GOOD (  13.82  )
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

From: Heiko Stuebner <heiko@sntech.de>

[ Upstream commit 596a977b34a722c00245801a5774aa79cec4e81d ]

The ddrphy is supplied by the dpll, but due to the limited number of PLLs
on the rk3036, the dpll also is used for other periperhals, like the GPU.

So it happened, when the Lima driver turned off the gpu clock, this in
turn also disabled the dpll and thus the ram.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://lore.kernel.org/r/20250503202532.992033-4-heiko@sntech.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should absolutely be backported to stable kernel
trees. Here's my detailed analysis: ## Critical System Stability Issue
The commit fixes a **critical system stability problem** where the DDR
PHY clock can be disabled, causing the system to lose access to RAM and
crash. This is evidenced by: 1. **Root Cause Analysis**: The commit
message clearly explains that "when the Lima driver turned off the gpu
clock, this in turn also disabled the dpll and thus the ram" - this is a
shared resource conflict that can brick the system. 2. **Hardware
Limitation**: The RK3036 has "limited number of PLLs" where the DPLL is
shared between the DDR PHY (memory controller) and GPU, creating an
inherent conflict when GPU clock management affects memory access. ##
Code Change Analysis The fix is **minimal and safe**: ```c static const
char *const rk3036_critical_clocks[] __initconst = { "aclk_cpu",
"aclk_peri", "hclk_peri", "pclk_peri", "pclk_ddrupctl", + "ddrphy", //
<-- Single line addition }; ``` - **Single line change**: Adding
"ddrphy" to the critical clocks array - **No functional changes**: Uses
existing critical clock infrastructure - **No API modifications**:
Compatible with all kernel versions that support Rockchip clocks - **No
dependencies**: Self-contained fix within the clock driver ##
Backporting Criteria Evaluation ✅ **Fixes important bug**: System
crashes when GPU driver disables clocks ✅ **Small and contained**: One
line addition to existing array ✅ **Minimal regression risk**: Only
prevents clock from being disabled, no new functionality ✅ **Clear side
effects**: Explicitly intended to keep DDR PHY always enabled ✅
**Critical subsystem**: Memory controller availability is fundamental to
system operation ## Similar Commit Pattern Analysis Looking at the
provided similar commits, this follows the **exact same pattern** as
Similar Commit #3 (Status: YES) which fixed "unrecoverable freezes and
rcu_sched stall warnings" - both address critical system stability
issues through clock configuration fixes. Unlike the other commits
marked "NO" which were feature additions or exports, this is a **pure
bugfix** addressing a **hardware design limitation** that causes system
crashes. ## Conclusion This commit prevents **complete system failure**
through a **trivial, safe change** that has **zero risk of regression**.
The fix addresses a fundamental hardware limitation in the RK3036 where
shared PLLs can cause memory controller clock starvation. This is
exactly the type of critical stability fix that stable trees are
designed to include.

 drivers/clk/rockchip/clk-rk3036.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index d341ce0708aac..e4af3a9286379 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -431,6 +431,7 @@ static const char *const rk3036_critical_clocks[] __initconst = {
 	"hclk_peri",
 	"pclk_peri",
 	"pclk_ddrupctl",
+	"ddrphy",
 };
 
 static void __init rk3036_clk_init(struct device_node *np)
-- 
2.39.5


