Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DFBCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYboog93vW/rV6NkBi6WvFnPVp9ZPwp+odMN+NEszDc=; b=GjHdiX6x2dUdANyHoGGLZE4yJb
	P0gIzsq64BzczHq5vr0+ga0DxMlMDzwf2bHMbUTBx1Y84YgQGGrNRIGIKxmLArNH068/9Pu35mNd0
	gjIsgdY+gBYZcYwkAywY6xW3yBrUjm9oSZ7jeWWTwu0EUcdvJtBocNjsfAUCO0naVRYcQ9OTMYqge
	txZHL0NJ2t4EGU8e6sWs9QmY5OACVG0MwTW3ADTnHzUprzWlW3Q5U2VWgg2X63X8R0AJ7Hwi5c/yQ
	wPnIGMG8UClB4xHu3VAo14/dtruMwnBZyNKDXB2UajYI94w5IPY5Q15RpXoO3glhd19GHIsLGKAK4
	LGFe+AQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD25k-0000000CSd5-3PQc;
	Sun, 26 Oct 2025 14:51:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD25g-0000000CSZF-1utw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 14:51:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E39560431;
	Sun, 26 Oct 2025 14:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06643C4CEF1;
	Sun, 26 Oct 2025 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490287;
	bh=8nsVpQVtNVpmV3fm9Jme7NuegNhWqMUpue44vydCMqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V2OW88DcnU+tMFM74K3zFh6b2on5gymtS5srKNUfc1l0nacUa5zOrlqfAASi5S4qG
	 BjHcuqqbB5UaY6ICvq8ULZ/caS8IPBz01jqfYUYwQlBco+O9lfnT9tPcfJF1uFZ0ao
	 xMarniUHXdTOFnkFKkmfiCWa2jZIvOqT0CAZXl/8x1qroCrexMhZG9CAS2Q15shgmQ
	 0LCQL/vIhadPZBaEYbJyqOGMfyevTOKvM/A73Ci2QBAHz2CSubONXGs63BTzAmV2+l
	 hSdyzappLcXEc7eNm33dWQVZThSEHiS1I+ZrX4UVei5UiStuD0hMVIMlzqo3kdNIH6
	 Fglyi4sE8i+kA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	michal.simek@amd.com,
	anatoliy.klymenko@amd.com,
	alexander.deucher@amd.com,
	alexandre.f.demers@gmail.com,
	bmasney@redhat.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.12] clk: clocking-wizard: Fix output clock register offset for Versal platforms
Date: Sun, 26 Oct 2025 10:49:18 -0400
Message-ID: <20251026144958.26750-40-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
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

From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

[ Upstream commit 7c2e86f7b5af93d0e78c16e4359318fe7797671d ]

The output clock register offset used in clk_wzrd_register_output_clocks
was incorrectly referencing 0x3C instead of 0x38, which caused
misconfiguration of output dividers on Versal platforms.

Correcting the off-by-one error ensures proper configuration of output
clocks.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES – the change in `drivers/clk/xilinx/clk-xlnx-clock-wizard.c:1120`
moves the Versal per-output divider base from
`WZRD_CLK_CFG_REG(is_versal, 3)` to `... 2`, fixing the off-by-one that
pointed each divider at the wrong MMIO pair.

- With the old offset, `clk_wzrd_ver_register_divider()` handed
  `clk_wzrd_ver_dynamic_reconfig()` a base that skips the first 32-bit
  register. You can see in `clk_wzrd_ver_dynamic_reconfig()`
  (`drivers/clk/xilinx/clk-xlnx-clock-wizard.c:235-262`) that we expect
  `div_addr` to hold the low/high-time bits (`WZRD_CLKFBOUT_PREDIV2`,
  `WZRD_EDGE_SHIFT`, etc.) and we write the high-time value to `div_addr
  + 4`. Starting from `... + 3` caused us to read/write the wrong
  register pair—programming the high-time word first and then trampling
  the next output’s low-time register—so the dividers for every Versal
  output were misconfigured.
- The corrected offset now matches the register map already hard-coded
  elsewhere (e.g., the `DIV_ALL` path in
  `clk_wzrd_dynamic_ver_all_nolock()` uses `WZRD_CLK_CFG_REG(1,
  WZRD_CLKOUT0_1)` where `WZRD_CLKOUT0_1` is 2). That consistency makes
  the fix obviously right and keeps the non-Versal path untouched
  because the change sits under `if (is_versal)`.
- The regression was introduced with Versal support (`Fixes:
  3a96393a46e78`, first in v6.10), so every stable branch carrying that
  commit currently ships broken output clocks; the patch is a tiny,
  self-contained offset adjustment and does not depend on newer
  infrastructure, making it straightforward to backport.

Given the severity (Versal outputs can’t be programmed correctly) and
the minimal, well-scoped fix, this is a strong stable-candidate.
Suggested follow-up: once backported, validate on a Versal board to
confirm the dividers now lock to requested rates.

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 0295a13a811cf..f209a02e82725 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1108,7 +1108,7 @@ static int clk_wzrd_register_output_clocks(struct device *dev, int nr_outputs)
 						(dev,
 						 clkout_name, clk_name, 0,
 						 clk_wzrd->base,
-						 (WZRD_CLK_CFG_REG(is_versal, 3) + i * 8),
+						 (WZRD_CLK_CFG_REG(is_versal, 2) + i * 8),
 						 WZRD_CLKOUT_DIVIDE_SHIFT,
 						 WZRD_CLKOUT_DIVIDE_WIDTH,
 						 CLK_DIVIDER_ONE_BASED |
-- 
2.51.0


