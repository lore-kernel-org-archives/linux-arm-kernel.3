Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E38CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sk6Hz5L1RfWRmUoFy7wusKFzTs3nYi+DeP2g2Ii9slI=; b=T0c3l059tN4Ifq2iiYPdYErRB3
	r5gqL9EnMgNWMiapwCAq4tQZIQ6cwtGuN+xX9I3Sxke0bMJ2W7QDKuiadOVWLPMTURKL+oHGRkuOc
	uQxlkFFjRN83jYTvR/t32/uAyXVXThAyZoxdHoVeInWOet5JRFd59vmVvKI3HpB1yvIMPYP370kRh
	PWKU1c28zvye9caUlkUxWXdkdMRYxZhgEkcRdbz+i39O775OYSsslnzYj2koTBxoksOgLceI9e+g1
	uLFl2+N/8Ik5rxFtgchQujTcVQq+OfVR/3c4IGhD+1l6LOdQrX+qGlhK07KNJZLpnI4MYkiN05+is
	4bOn/hHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD25l-0000000CSdZ-0bXP;
	Sun, 26 Oct 2025 14:51:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD25h-0000000CSZv-2iNB
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 26 Oct 2025 14:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Sk6Hz5L1RfWRmUoFy7wusKFzTs3nYi+DeP2g2Ii9slI=; b=hwxr+qfBpVOPu9hVIoABTDc4gL
	HIjkxvJi06uTv8D0ZUjUkEhPp+on7rmtVAPrgNvHZ+TFsMV9f4GDnfzWjPHAoCsGK4U8vc24pOHXr
	ng4rY55ZTJz++OWgkBKbnWUiwYdG4FWyzEdkrAYrDTqNSX88RBDTqLQ06XgdJTgGut3cIqu7YfCoN
	OAiHnREVvxIODjs1ueQopbfLoV1T+cn4E0zFLISoEWGNvbTGkokjWSPN6FCBn6h/LqUQZ8JNcncDF
	31ZIooqBgrPqAndjIjBWC9BDsTlMBrbu+5z29nmPAY3r4f4rDppncc7un6PpYPIRdr3GtNSdeNeCm
	EdBHp/qA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1Du-00000000fcf-04Gq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 13:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABE7E44FB8;
	Sun, 26 Oct 2025 14:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9A2C116B1;
	Sun, 26 Oct 2025 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490284;
	bh=zcvqXRuTUF9jQBSa3cAUl/qxhCMKR5cmmCS0GeuQS14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XUgZ4DWLbQfcPvJj2d5ZHUbufuCTKqlo+aHoe2pu1AaF1S2YsgMWhWUDqLk0bSMZF
	 ABNRXeF2cq5jh4snF600YVPQSvai2+nLnoLQ7lBouHwN1oHes1lI5ZOidG++H8uBUk
	 vR3TVVTe6ENdc7PV/Z/AAKZfm6CEs7v0a2Qv2hxvxigGw4rQJ6woHPqYv5gbDULPrs
	 JgyHv9QPve0X+3dfopKoWCKfnk5ab2qqqjqZeWGfOBzrIhxo34qKxmjFvCr6lggMt/
	 +8ZdtCFrnPfqT/t4oJzA07Cit5XVpbR+MgOg/QlJsCAzq+Lkj+LVSkbbCcgwLY8IW1
	 sRjnaDM9bQgtw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Brian Masney <bmasney@redhat.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.12] clk: scmi: migrate round_rate() to determine_rate()
Date: Sun, 26 Oct 2025 10:49:17 -0400
Message-ID: <20251026144958.26750-39-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_135554_409869_167ED9EA 
X-CRM114-Status: GOOD (  20.91  )
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

From: Brian Masney <bmasney@redhat.com>

[ Upstream commit 80cb2b6edd8368f7e1e8bf2f66aabf57aa7de4b7 ]

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops.

The existing scmi_clk_determine_rate() is a noop implementation that
lets the firmware round the rate as appropriate. Drop the existing
determine_rate implementation and convert the existing round_rate()
implementation over to determine_rate().

scmi_clk_determine_rate() was added recently when the clock parent
support was added, so it's not expected that this change will regress
anything.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95-19x19-EVK
Signed-off-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES The patch restores the SCMI clock driver's ability to return a valid
rounded rate when the framework asks for it.

- With the regression-introducing stub in `scmi_clk_determine_rate()`
  every request fell through without touching `req->rate`, so
  `clk_core_determine_round_nolock()` would return the caller’s original
  value whenever both ops were present (`drivers/clk/clk.c:1596-1613`),
  making `clk_round_rate()` lie about the hardware outcome on platforms
  that advertise min/max/step limits.
- The new implementation in `drivers/clk/clk-scmi.c:57-90` moves the
  logic that used to live in `.round_rate()` into `.determine_rate()`,
  clamping to `min_rate`/`max_rate` and quantising by `step_size`,
  exactly reproducing the behaviour that worked before the noop
  `determine_rate()` was introduced.
- Discrete-rate clocks remain unchanged—the function still bails out
  early (`drivers/clk/clk-scmi.c:63-71`), matching the old behaviour—and
  the ops table simply stops advertising the deprecated `.round_rate()`
  callback (`drivers/clk/clk-scmi.c:299-304`), so risk is minimal and
  confined to SCMI clocks.
- The bug has shipped since the recent parent-support work (first seen
  in v6.10), so stable kernels carrying that change are returning
  incorrect values to consumers today.

Because this is a regression fix with low risk and no architectural
churn, it is a good candidate for backporting to every stable series
that contains the broken noop `determine_rate()`.

 drivers/clk/clk-scmi.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index d2408403283fc..78dd2d9c7cabd 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -54,8 +54,8 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int scmi_clk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	u64 fmin, fmax, ftmp;
 	struct scmi_clk *clk = to_scmi_clk(hw);
@@ -67,20 +67,27 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * running at then.
 	 */
 	if (clk->info->rate_discrete)
-		return rate;
+		return 0;
 
 	fmin = clk->info->range.min_rate;
 	fmax = clk->info->range.max_rate;
-	if (rate <= fmin)
-		return fmin;
-	else if (rate >= fmax)
-		return fmax;
+	if (req->rate <= fmin) {
+		req->rate = fmin;
+
+		return 0;
+	} else if (req->rate >= fmax) {
+		req->rate = fmax;
 
-	ftmp = rate - fmin;
+		return 0;
+	}
+
+	ftmp = req->rate - fmin;
 	ftmp += clk->info->range.step_size - 1; /* to round up */
 	do_div(ftmp, clk->info->range.step_size);
 
-	return ftmp * clk->info->range.step_size + fmin;
+	req->rate = ftmp * clk->info->range.step_size + fmin;
+
+	return 0;
 }
 
 static int scmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -119,15 +126,6 @@ static u8 scmi_clk_get_parent(struct clk_hw *hw)
 	return p_idx;
 }
 
-static int scmi_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
-{
-	/*
-	 * Suppose all the requested rates are supported, and let firmware
-	 * to handle the left work.
-	 */
-	return 0;
-}
-
 static int scmi_clk_enable(struct clk_hw *hw)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
@@ -300,7 +298,6 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 
 	/* Rate ops */
 	ops->recalc_rate = scmi_clk_recalc_rate;
-	ops->round_rate = scmi_clk_round_rate;
 	ops->determine_rate = scmi_clk_determine_rate;
 	if (feats_key & BIT(SCMI_CLK_RATE_CTRL_SUPPORTED))
 		ops->set_rate = scmi_clk_set_rate;
-- 
2.51.0


