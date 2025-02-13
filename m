Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524BCC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 22:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CTvlTgh9FkYy1gsP0z8BmLVeMXguz+BQdutA7bg9psA=; b=lsL8fhhUDEbpMO8jXpvWa547Az
	kkLjeZgiAmG5L4OJTlMExw4Rau0R8Q29Y1iDGVN9oaeIjllwcunAV03xVnlQmmY2vpDgVFv8OjPqv
	7Pq9j/EwYRnKNlG3u5l0QfQKXZ5ZUIqVj0Mzrqvg9SbOWw8JbJmh01slUaUp1jhY/Kqd8PecdDDGJ
	1ssFyGsHNbqLREVIEKhjTuD/DGT+lER8X3aZ2AxKJ/gbbVkR8396cEofut15l31NzA53xu0/rJjc2
	ZYQ3tmk2I7cTsLhoc1Gtt2eCQBckLc7Y2Z4S/dDP5s3qhfdoZ/gOg0aoTfwgsLoPaMvLzOknC0cQp
	UCAQ89YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihYD-0000000Co05-2jvy;
	Thu, 13 Feb 2025 22:19:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihWm-0000000Cnp9-3Ya5;
	Thu, 13 Feb 2025 22:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CTvlTgh9FkYy1gsP0z8BmLVeMXguz+BQdutA7bg9psA=; b=kVO9DdzZW6U+DJV0WVxNb1eC8i
	gZhCN+ihtwFru1vdjujaGM5FQLDiUl7WkZLpR/jx0KnvwF9/bvjNPhB+VdYPhexjtYGYY/dAiWtMw
	KWDz4DdEJeCXiPvYRpP8tHInMEcyLtY+19KNzZsTYbOkJDfEqSEV89Ev/FLKHu5NXByOwSEBvpOtD
	iD4cX5oZECiBwmmSFwJi3WpjdY0mEiIoCig7l4c74QWYgIPMLg8TDPx8Se0bxENQZGs/ZkWrxBcls
	iJ+Z0H6FzycaHwA4Ltn/yRi1UeNPVfVSEz4mRWTZN5lxRcOuVu7fPN7nf+22aIMplRxROZfQGso6L
	GYnz5EDA==;
Received: from mail.mvand.net ([185.229.52.35])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihWQ-000000017X9-46uz;
	Thu, 13 Feb 2025 22:17:46 +0000
Received: from xrossbuild.mvand.net (mail.mvand.net [185.229.52.35])
	by mail.mvand.net (Postfix) with ESMTPSA id 4E4D21FF3D;
	Thu, 13 Feb 2025 23:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=martijnvandeventer.nl; s=default; t=1739485043;
	bh=++zlBheuf2ghp6IKg2VkyhrcpY1H9g9JvPugZj9lb6c=;
	h=From:To:Cc:Subject:Date:From;
	b=wQ+otXL/AsRnI0M5Wli7eTKcR1/hhmmL/vCU/O1IhJgNCGT7hTbuBSjpI+2RlDVQ2
	 vNBKUGLbrLt7BuIbR/sr98pFGcsxJpO4V6wg7ZEfTK9x9PtOAL8a0vwBYaW0+jDfSE
	 yv3oblxoousTZWjoAWLYGD3akzcFCRTO+f5jC51/VEjvVR7dUubb0MD8Rl0fSQWVdN
	 QaXHBZkqMHh6HClJNQBSgndP8VJwIZ2HXQ2a4NZsoiEWa+ItYcVlLje011BRFs8yKe
	 6CMAAdUy04lLaOLmm2IIYfOIZefKiENDwZzArE4ADVmbMHRE6EXVPKJTX1Y2yDE8yb
	 PT6ice7j7RwIw==
From: Martijn van Deventer <linux@martijnvandeventer.nl>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: g12a: Fix kernel warnings when no display attached
Date: Thu, 13 Feb 2025 23:17:01 +0100
Message-Id: <20250213221702.606-1-linux@martijnvandeventer.nl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_221728_107542_DBD5CD1A 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

When booting SM1 or G12A boards without a dislay attached to HDMI,
the kernel shows the following warning:

[CRTC:46:meson_crtc] vblank wait timed out
WARNING: CPU: 2 PID: 265 at drivers/gpu/drm/drm_atomic_helper.c:1682 drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
CPU: 2 UID: 0 PID: 265 Comm: setfont Tainted: G         C
Tainted: [C]=CRAP
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
lr : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
Call trace:
 drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
 drm_atomic_helper_commit_tail_rpm+0x84/0xa0
 commit_tail+0xa4/0x18c
 drm_atomic_helper_commit+0x164/0x178
 drm_atomic_commit+0xb4/0xec
 drm_client_modeset_commit_atomic+0x210/0x270
 drm_client_modeset_commit_locked+0x5c/0x188
 drm_fb_helper_pan_display+0xb8/0x1d4
 fb_pan_display+0x7c/0x120
 bit_update_start+0x20/0x48
 fbcon_switch+0x418/0x54c
 el0t_64_sync+0x194/0x198

This happens when the kernel disables the unused clocks.
Sometimes this causes the boot to hang.

By (re)adding the flag CLK_IGNORE_UNUSED to the VCLK2 clocks, these
clocks will not be disabled.

This partially reverts commit b70cb1a21a54 ("clk: meson: g12a:
make VCLK2 and ENCL clock path configurable by CCF").

Fixes: b70cb1a21a54 ("clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF").
Signed-off-by: Martijn van Deventer <linux@martijnvandeventer.nl>
---
 drivers/clk/meson/g12a.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index cfffd434e998..1651898658f5 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3234,7 +3234,7 @@ static struct clk_regmap g12a_vclk2_div = {
 			&g12a_vclk2_input.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_GATE,
+		.flags = CLK_SET_RATE_GATE | CLK_IGNORE_UNUSED,
 	},
 };
 
@@ -3270,7 +3270,7 @@ static struct clk_regmap g12a_vclk2 = {
 		.ops = &meson_vclk_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 	},
 };
 
@@ -3354,7 +3354,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 	},
 };
 
@@ -3368,7 +3368,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 	},
 };
 
@@ -3382,7 +3382,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 	},
 };
 
@@ -3396,7 +3396,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 	},
 };
 
-- 
2.39.2


