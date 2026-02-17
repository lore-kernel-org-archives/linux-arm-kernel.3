Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEFAE8384B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 01:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4NIgF+PpgcqGfc8+it4Z2GsbbrwEy02AOFQUOkvsp0=; b=O01Coabl8cXqiVG/aPCZh5Jp04
	3KkC8q2voYHo9T+aD3wokrfCmasjP4sSJhP7EbbEfPg0hm2Eb2fOaUGJ6ePvjgXlD9DXmh8wKU9KJ
	Od7hUNSr8yW9WYx47E9DiSxErxj/UnqsvUnRk0crmiQPyHFmQ2EfTFdFyMR6CSXwOA+llgZYA+NML
	n+7VvIifn9lZdPZ4Irg3VNn80cGdD9HVkOL8n6xnJlQ04Q4uJXFZDXvmM41FdAEaLoNPUltnss4Mi
	zGdcaU/QMd6/4QtogT+Ng7YlfMZV/Qp315Fu6lLhVrO8nA/Ufuiezibc19nD9toPmknRk2g3aVYhJ
	cw6XGjkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs9T0-00000007SQM-42js;
	Tue, 17 Feb 2026 01:01:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs9Sw-00000007SPr-46H7;
	Tue, 17 Feb 2026 01:01:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 462994453B;
	Tue, 17 Feb 2026 01:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46A6C2BC87;
	Tue, 17 Feb 2026 01:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771290085;
	bh=3CQR8MNuLy3NsGjQSjNTddHYGKdbU4uYpOwzcupblxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bwp48MMihd4Al5ZmBb87Sv8KwQ+2c4ApUINj/56l4mXnIWAagnXfdVj8+oPOdmjWS
	 XLhl0JT3dSeNtMHMaAk00BldL/EIAE1PF8Bf65ZpsIfzcBVPrO7jwoFoCI5HRi55ZX
	 C6PSli29FLb3zNn1UB1C9nxQK9SYSMh3hFiJvXBednk4Ne7VeAUVznVgL0+O9izm1H
	 DnsgSwjCacZ9HILf5+sfE8yyH0Y/pq+a7Ljwp/pzvT45Vr5tDzNZ+k2MC70J6rWoXB
	 vKjdz2Gt3ZX83NxwnyvN/gRmVSlbCR0PytP/iAn6onlcBC/TAL+Zfk7x4EsNhayAaS
	 CmzJLF9zcDSpw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chuan Liu <chuan.liu@amlogic.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Sasha Levin <sashal@kernel.org>,
	neil.armstrong@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.18] clk: amlogic: remove potentially unsafe flags from S4 video clocks
Date: Mon, 16 Feb 2026 20:01:15 -0500
Message-ID: <20260217010118.3503621-4-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260217010118.3503621-1-sashal@kernel.org>
References: <20260217010118.3503621-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_170127_091112_0F127292 
X-CRM114-Status: GOOD (  18.94  )
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

From: Chuan Liu <chuan.liu@amlogic.com>

[ Upstream commit 4aca7e92023cac5018b4053bae324450f884c937 ]

The video clocks enci, encp, vdac and hdmitx share the same clock
source. Adding CLK_SET_RATE_PARENT to the mux may unintentionally change
the shared parent clock, which could affect other video clocks.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Link: https://lore.kernel.org/r/20250919-add_video_clk-v6-3-fe223161fb3f@amlogic.com
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Wait, this is very confusing. The mailing list says patch 2 adds new
clocks, but git blame shows these video clock muxes (`cts_enci_sel`,
`cts_encp_sel`, etc.) were already in the original commit from 2023. Let
me re-read the diff more carefully.

Looking at the diff again: the commit removes `CLK_SET_RATE_PARENT` from
`s4_cts_enci_sel`, `s4_cts_encp_sel`, `s4_cts_vdac_sel`, and
`s4_hdmi_tx_sel`. Git blame confirmed these structures were added in
`57b55c76aaf1b` (2023, v6.7). The patch 2 of the series adds **new**
clocks (encl, cdac, demod, adc), but the ones being **fixed** in patch 3
already existed.

This means patch 3 (our commit) is **self-contained** with respect to
the bug fix — it removes flags from clocks that already exist in stable
trees. It does NOT depend on patch 2.

## Final Analysis

### Problem Description
The `CLK_SET_RATE_PARENT` flag on the video clock mux selectors
(`cts_enci_sel`, `cts_encp_sel`, `cts_vdac_sel`, `hdmi_tx_sel`) allows
rate change requests to propagate from these muxes up to their shared
parent clock. Since all four muxes share the same parent clock sources
(vclk_div and vclk2_div families), any one of them requesting a rate
change could alter the parent, breaking the other video outputs.

### Impact Assessment
- **Real bug**: Yes — when one video output (e.g., HDMI) requests a
  clock rate change, it can modify the shared parent clock, causing
  other video outputs (CVBS, encoder) to use the wrong clock rate. This
  could result in display corruption or loss of video signal.
- **Scope**: Affects all Amlogic S4 SoC users with multiple active video
  outputs, since v6.7.
- **Severity**: Medium — display corruption/failure when multiple video
  outputs are active simultaneously.

### Stable Kernel Criteria Assessment
- **Obviously correct**: Yes — removing `CLK_SET_RATE_PARENT` from
  shared mux selectors is a well-understood pattern for preventing
  unintended parent clock modifications.
- **Fixes a real bug**: Yes — prevents unintended shared parent clock
  modification affecting other video clocks.
- **Small and contained**: Yes — removes 4 lines (flag declarations)
  from a single file.
- **No new features**: Correct — purely a bug fix.
- **Risk**: Very low — removing `CLK_SET_RATE_PARENT` means the mux
  won't propagate rate changes upward, which is the desired behavior for
  shared clock sources. The downstream gate clocks still have
  `CLK_SET_RATE_PARENT`, so rate requests still propagate from the gate
  to the mux; they just stop there instead of going further up.

### Concerns
- **Dependency check**: The fix is self-contained. The affected clock
  structures exist since v6.7 (commit `57b55c76aaf1b`). No dependency on
  other patches in the series.
- **Behavioral change**: Users who relied on `CLK_SET_RATE_PARENT`
  propagation through the mux to the parent might see different
  behavior, but this "reliance" was always incorrect since it could
  break other video outputs.

## Verification

- **git blame** confirmed `s4_cts_enci_sel`, `s4_cts_encp_sel`,
  `s4_cts_vdac_sel`, `s4_hdmi_tx_sel` with `CLK_SET_RATE_PARENT` were
  introduced in `57b55c76aaf1b` (v6.7, September 2023).
- **git tag --contains 57b55c76aaf1b** confirmed the buggy code is in
  v6.7+ and v6.12.y LTS.
- **lore.kernel.org** confirmed this is patch 3/3 of the "add video-
  related clocks for S4 SoC" series, accepted December 2025 by Jerome
  Brunet.
- **lore.kernel.org patch 2** confirmed patch 2 adds **different**
  clocks (encl, cdac, demod, adc), not the ones being fixed here — the
  fix is independent.
- **Code inspection** confirmed `s4_cts_encl_sel` already lacked
  `CLK_SET_RATE_PARENT` (consistent architecture — encl was already
  correct).
- **Code inspection** confirmed downstream gate clocks (`s4_cts_enci`,
  `s4_cts_encp`) retain `CLK_SET_RATE_PARENT`, so rate propagation still
  works from gate to mux but stops at the mux level.
- **Could NOT verify** any user reports of actual display corruption
  from this bug (unverified — but the mechanism is sound and the fix is
  obvious).

The fix is small, surgical, self-contained, fixes a real clock-tree
correctness issue affecting all Amlogic S4 users since v6.7, and carries
extremely low regression risk. It meets all stable kernel criteria.

**YES**

 drivers/clk/meson/s4-peripherals.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 6d69b132d1e1f..bab4f5700de47 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1106,7 +1106,6 @@ static struct clk_regmap s4_cts_enci_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_cts_parents,
 		.num_parents = ARRAY_SIZE(s4_cts_parents),
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1122,7 +1121,6 @@ static struct clk_regmap s4_cts_encp_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_cts_parents,
 		.num_parents = ARRAY_SIZE(s4_cts_parents),
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1138,7 +1136,6 @@ static struct clk_regmap s4_cts_vdac_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_cts_parents,
 		.num_parents = ARRAY_SIZE(s4_cts_parents),
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1169,7 +1166,6 @@ static struct clk_regmap s4_hdmi_tx_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_hdmi_tx_parents,
 		.num_parents = ARRAY_SIZE(s4_hdmi_tx_parents),
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.51.0


