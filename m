Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85455C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9p5hJOFJmORKeIUrvS9SS3XXjAT2mdEK7agSKoUqt8=; b=24CVA8HkxmcW3SsLXG/bE3DCSi
	C5hPofFzuePqc0u76/TBaMLTKjKnau3BlDbNnYouf8ei2+N3frYzhan7NQXoYRWprWAQcgfA3716o
	kaUg++EkKsErPMUQuog9Yj+c4xdwJY8JSaMTHLiIRpClvHW9bnh+5titnVe28/aCXaQrzh0ayav8W
	oADxyxayvxqO7ZQ/f2lsXaLOi9P5IQ4AyqXldWmrC2eRqbPX7C4+4C5iDIBYmN2nsLNhX6n55pXMs
	XDAUL7fnbOxPGAwXmbinINBtS/phh/u/53y5XyTMDGmGX52Vsp5MRmdM9BkDB9NK6KwpEi/rdluKW
	BLrnXl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHaO-0000000Cp8a-3fSw;
	Tue, 05 Aug 2025 13:20:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHQa-0000000CnSW-2blq;
	Tue, 05 Aug 2025 13:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6902BA56373;
	Tue,  5 Aug 2025 13:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4F3C4CEF0;
	Tue,  5 Aug 2025 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399403;
	bh=j7U811MvCczKTPp55NF7aXier6/JUb9EwI1J0Ri83Gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXegbcCQ2G0703osutbs6z8KjMDuVP3o9t8QXaN1TjpoaRtfu6ilLPqDoZoqaZhow
	 2IZmF6wdTwo6PImNx2GBRF/7QxLAg+0V7HIbR3uwtz5ivW0yYXQRaWf2yp6Kxev6JN
	 FmgwuJirhWvg5Z+vxCcZS+YgtTKcrguOgyjn+3EXINm6bWV8aKDMnmkcMgj8LaiZFO
	 9QIdOWFSgm5Vs1rYnexe0x6W2cytxJ/wq9BkB8Frx3IxsRvsn1ci7qzYSbniEFYpra
	 GhddW1USILHWdqqvgeNtBRVNThtEEKnYlkRhNATxgnnIEJMlu6KWackTAS7C2CXZ8t
	 8NoSnDthFgrmA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16-6.6] phy: rockchip-pcie: Properly disable TEST_WRITE strobe signal
Date: Tue,  5 Aug 2025 09:08:42 -0400
Message-Id: <20250805130945.471732-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_061004_800174_2099FBE9 
X-CRM114-Status: GOOD (  17.66  )
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

From: Geraldo Nascimento <geraldogabriel@gmail.com>

[ Upstream commit 25facbabc3fc33c794ad09d73f73268c0f8cbc7d ]

pcie_conf is used to touch TEST_WRITE strobe signal. This signal should
be enabled, a little time waited, and then disabled. Current code clearly
was copy-pasted and never disables the strobe signal. Adjust the define.
While at it, remove PHY_CFG_RD_MASK which has been unused since
64cdc0360811 ("phy: rockchip-pcie: remove unused phy_rd_cfg function").

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
Link: https://lore.kernel.org/r/d514d5d5627680caafa8b7548cbdfee4307f5440.1751322015.git.geraldogabriel@gmail.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Backport Status: YES

This commit should be backported to stable kernel trees for the
following reasons:

### Bug Analysis
The commit fixes a clear programming bug where `PHY_CFG_WR_DISABLE` was
incorrectly defined as `1` instead of `0`. Looking at the code in
`phy_wr_cfg()` function (lines 100-120), the sequence is:
1. Write data and address to the configuration register
2. Wait 1 microsecond
3. Enable the TEST_WRITE strobe signal by writing `PHY_CFG_WR_ENABLE`
   (value 1)
4. Wait 1 microsecond
5. Intended to disable the strobe signal with `PHY_CFG_WR_DISABLE`

However, since both `PHY_CFG_WR_ENABLE` and `PHY_CFG_WR_DISABLE` were
defined as `1`, the strobe signal was never actually disabled. This
means the PHY configuration writes were leaving the strobe signal
permanently enabled, which is incorrect hardware programming.

### Impact Assessment
1. **Real bug affecting users**: This is a functional bug that affects
   all Rockchip PCIe PHY operations. The strobe signal being left
   enabled could cause:
   - Incorrect PHY configuration behavior
   - Potential power consumption issues
   - Possible hardware state corruption
   - Unpredictable PCIe link behavior

2. **Small and contained fix**: The change is minimal - just changing
   one define from `1` to `0`. This is exactly the type of targeted fix
   suitable for stable.

3. **Clear correctness**: The fix is obviously correct - a disable
   operation should use value `0`, not `1`. The bug appears to be a
   copy-paste error from the initial driver introduction in 2016 (commit
   fcffee3d54fca).

4. **Long-standing issue**: This bug has existed since the driver was
   first introduced in 2016, affecting all kernel versions with this
   driver.

5. **No architectural changes**: The fix doesn't introduce new features
   or change the driver architecture - it simply corrects an incorrect
   constant value.

6. **Low regression risk**: Changing the disable value from 1 to 0 is
   the correct behavior according to typical hardware programming
   patterns. The risk of regression is minimal since this fixes
   incorrect behavior rather than changing working functionality.

### Additional Context
The commit also removes the unused `PHY_CFG_RD_MASK` define as cleanup,
which was left over from commit 64cdc0360811. This is harmless cleanup
that doesn't affect the backport decision.

The commit message clearly describes the issue: the TEST_WRITE strobe
signal should follow a pattern of enable→wait→disable, but the current
code never actually disables it due to the incorrect define value.

This meets all the criteria for stable backports: it fixes a real bug,
is small and self-contained, has minimal risk, and corrects clearly
incorrect behavior that has been present since driver introduction.

 drivers/phy/rockchip/phy-rockchip-pcie.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index bd44af36c67a..63e88abc66c6 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -30,9 +30,8 @@
 #define PHY_CFG_ADDR_SHIFT    1
 #define PHY_CFG_DATA_MASK     0xf
 #define PHY_CFG_ADDR_MASK     0x3f
-#define PHY_CFG_RD_MASK       0x3ff
 #define PHY_CFG_WR_ENABLE     1
-#define PHY_CFG_WR_DISABLE    1
+#define PHY_CFG_WR_DISABLE    0
 #define PHY_CFG_WR_SHIFT      0
 #define PHY_CFG_WR_MASK       1
 #define PHY_CFG_PLL_LOCK      0x10
-- 
2.39.5


