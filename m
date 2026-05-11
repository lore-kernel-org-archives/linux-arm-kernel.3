Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D12FCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePxOw9Ci1S25n1qSGFm9vwwZyRBjuwMPlscJU/tIS9I=; b=W2a2ZQn78JKXkWbbHInnvznGNG
	qS2Grv9aBGBtFiqoK3/KeNTMRhJ/0K1TrzeiU7Misvu2Tvz7yCIQwNS93qN779RnziU5JMkskM8jv
	aWIlPxr2LNwc1CyJN5JeOUoJ+Wfnn6V5d3/fGj5MyX+Pwj3gVnTad3dsrs7+3QR7h4C7XOp55H9YT
	yD8pF9ziZInnN2Kaoka36keNREAxdpG85eOWY3SCplFtg+hKyTCD/8aNADqlie0gK4b/RSndcbCCZ
	JcxTMVzsBPKqaZ+H/O9QHnVQSYHN91J12WEAFQhnW6HIgMDvLhjxbpAKvojDv1d6VBCb0srH6iAs0
	SNDid/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQ31-0000000DbEU-1XBu;
	Mon, 11 May 2026 12:47:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQ2t-0000000Db3h-1KlK;
	Mon, 11 May 2026 12:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB59644597;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8730EC2BD01;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778503657;
	bh=Apb4S2Jq8LIpHTHjJayHCM7ik9Uly3uNsSNFkwFnHLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RV7qJIEyAxu9FeFI/E2hTCz/ZEaWajN2I9N/p6MCVuSc0xfufNGXALusiGHZR+v4m
	 zC+IU18CyV0nAvDYdCRoc/7xu8F5lUtr33ieMNqaNxlz3cduBb2hASq4Z1DNUR1Ddm
	 GUi7PISASTGUiM5OCAoAiK04Qy89XWpIAuhuq0BYIeOtFvKOvzcIQmqrTNt3rqxkOi
	 ENIBh9qEFi7SpJ+tmk6mYCj0AepKyq7DQKgxtgIC7BZCEPGxmuUXla/ugMKMgbVfHA
	 0efZ+A93WqJwA6L1kZJFFV2Fwty0FruXaMWIB1gKJzM40wDWUyWz/z/qF+MDpGRnwL
	 RqvmHMjLZ9Khg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E02ECD37AC;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Mon, 11 May 2026 20:47:27 +0800
Subject: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
In-Reply-To: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503655; l=1711;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=DXN+IQPJ4BKXUT+MsvhFjUrvj1rynvZ3xsZLA9vL75E=;
 b=xYUqx+WQEC8C0eWT8llqWOt68I4oN7NE6r3Glr5Ph/So3/wLTVAkTES95+7mvotxuaXyx8vQG
 SKinXt7bnDUBdwGt2ZpbVm4qaKXOnjov17nNSG0qVxzEjahD5ujrvak
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_054739_466257_013F5E9F 
X-CRM114-Status: GOOD (  11.65  )
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jian Hu <jian.hu@amlogic.com>

l_detect controls the enable/disable of the PLL lock-detect module.

For A9, the l_detect signal is active-high:
0 -> Disable lock-detect module;
1 -> Enable lock-detect module.

Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
like A9, where the signal is active-high.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 9 +++++++--
 drivers/clk/meson/clk-pll.h | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..5a0bd75f85a9 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -388,8 +388,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 	}
 
 	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
-		meson_parm_write(clk->map, &pll->l_detect, 1);
-		meson_parm_write(clk->map, &pll->l_detect, 0);
+		if (pll->flags & CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH) {
+			meson_parm_write(clk->map, &pll->l_detect, 0);
+			meson_parm_write(clk->map, &pll->l_detect, 1);
+		} else {
+			meson_parm_write(clk->map, &pll->l_detect, 1);
+			meson_parm_write(clk->map, &pll->l_detect, 0);
+		}
 	}
 
 	if (meson_clk_pll_wait_lock(hw))
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 949157fb7bf5..97b7c70376a3 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -29,6 +29,8 @@ struct pll_mult_range {
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
 #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
+/* l_detect signal is active-high */
+#define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.47.1



