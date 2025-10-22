Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFB7CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4NGjshnsRTKJdQuap0oDfpOlITd9UVHkAgwYyEJI4s=; b=XwOEOpV9Q988S7NFKYB9mOW8sJ
	WEoo4gji/d7nvZJCMkdzBS26b8CWQpWoAPEZab866aElUlgLgbO44o4cOfPNM/2MHW88WwadYRFB9
	ln++MTn8/onf/zCeZ/XIlC7ocUpKsG/gx3hmJc+jMQi3AXDnDE6TpHOnWLz3W5TQ9QuVRdDirL+ah
	HEWEjevBNIr1U/Zn85Nfi27XNhgtomsZzcYDghImGJ2zzis7yRm1whLA9+FB3CPVaRYKq13Ukc7Su
	L8hlEiZrLxjFG0888zo5t9nKg9XUTlCn53UEtTBM2tIUQ/IilCf1Rd9geaQ6yhlc4ekE35hI90W2w
	jfUk6hNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSoQ-00000001lDp-02hp;
	Wed, 22 Oct 2025 06:59:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSoJ-00000001l8p-0mcv;
	Wed, 22 Oct 2025 06:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EE0648CC1;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6470DC4CEF7;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761116342;
	bh=I4YsZlslKVYM5XtiEfLCXEYzAjKsoHF2XlksQ5hG6dU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Qe99KiEXbnPS1IW1G/xMz5aP8btVwmr6YKYISN4AXPzR/TrJkaa7rmexGv2Fyhwa+
	 kyIo81o3EuHgTgNEr0tm3u2lmA/8tEWlWkN5qSSkoyVL1Se0cLkjeIiMMZ1KYhPLmG
	 flxLks8isTfKjeJ0mOYaR+4FoDcZadaPAjZiYF3S/9ekuSeZyiRV9DLJqrjKKcobTA
	 vZJLV4b2I7UE02lmtrDRwb1OTr+49aj93ZG+nIFSAUUkCKx6KW4FRRmhkLRAsZGNFE
	 z0lD8bAts0WBhozTaIq4LySgHtY1Nh9kA836I+l5F2+3aIUFUhbkpxW77odBi4L+3e
	 3MMV51s72fxbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560BECCD1AB;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Wed, 22 Oct 2025 14:58:51 +0800
Subject: [PATCH 1/3] clk: amlogic: Fix out-of-range PLL frequency setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-optimize_pll_driver-v1-1-a275722fb6f4@amlogic.com>
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
In-Reply-To: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761116340; l=799;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=p+FnM7SXXWR/Lro1GSMYPZJ+As5vPrIAECBCtFZ7G6Q=;
 b=ClxCqKi3/e4IxKUNaE1WjlZyjocex3l4YrnDTktPBAF0iswWL7CnwzsCJbhDHBjEFrE9p0UnJ
 zF2arI+2lxbBlJNKWfslLsxbjOT66SAmuN6iu1Uxvl9WexL9e5nkpts
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_235903_252005_B290557F 
X-CRM114-Status: GOOD (  10.82  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

meson_clk_get_pll_range_index incorrectly determines the maximum value
of 'm'.

Fixes: 8eed1db1adec6 ("clk: meson: pll: update driver for the g12a")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..b07e1eb19d12 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -191,7 +191,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 	*m = meson_clk_get_pll_range_m(rate, parent_rate, *n, pll);
 
 	/* the pre-divider gives a multiplier too big - stop */
-	if (*m >= (1 << pll->m.width))
+	if (*m > pll->range->max)
 		return -EINVAL;
 
 	return 0;

-- 
2.42.0



