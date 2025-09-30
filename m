Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A291CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 09:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dkzk3vxqpb/P80O/AtjQfdSasxiM8GmotDRMcgl8gA=; b=fHxRDWsRPBkqC2jmhs8cnNfF9x
	tx/mzY9jBDuZ3IkNmQP73jdUo1fA/d27pw56brErZ+kIvK7YABP9FrAML7cGTlmQVBbPCw8gFZprK
	ikcQnG0Rj2LgX+105edMpXQmSzZXLdL0IvedzERvDUrnQBtGGgyCcQ7L2FCNHcr/NqBIb+9wBTDad
	qQiWVXRLZLrbtdgXl26PnmXea++wXZqQeARpnwa7DJFtw5OjCWsopkuvEavmeLM8zXzVhdpTsGBZV
	ZlO33wNGU9Nr0n+XHumuB+yZmj0mnRsPJKDLmXAg0QflNlVH5JL+fqsvG7YOSn8EBaQ6hkLefaeIf
	vDtgUQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wpj-00000004rt1-0Qi4;
	Tue, 30 Sep 2025 09:39:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wnc-00000004q0N-29WA;
	Tue, 30 Sep 2025 09:37:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB1AB4826D;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98B3FC2BCAF;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759225051;
	bh=YxnyBmHxHXzYw9b8hnimJetb+1Ax5l5URVrr4n8BLuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nbowOD043XUfT4f0Yxlyoo5OVZnB40eqlO5t0xPQxBSSD9JI7WyKAUgg3Q8OfWhw5
	 RL6MIcbXGMn+URG1vzBPntmntV7sXXl6IbzkuhO8LnmJzt9vdTVv6dVgOQmZkcGWz3
	 HkmGGkBwypfBdybroOOoeFnkeg0fUwYQUi8Or6c2d8xc+Djo3M4H52l+RxDKZKFbcN
	 U9UZ6eKq1HDUc8r3kAD5Th0ozB2gGSCcLNxYFAcVW8U7D4LrTfDFLSJhGwKbChaxDk
	 DdS21jjICCK6FLPJdR56svsHekatDhrJAzw/ycwQEEw7zjiCFCcQhn8r5Yeh3k7QpH
	 wwyPZ8KAlP92g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F50CCCA46F;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 30 Sep 2025 17:37:19 +0800
Subject: [PATCH 06/19] clk: amlogic: Fix out-of-range PLL frequency setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-a4_a5_add_clock_driver-v1-6-a9acf7951589@amlogic.com>
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759225047; l=799;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=N/UanqAAstFKaIoQ6E9vlI4RDukLeWAnvo1MhrWVBkQ=;
 b=NIGYgjmhjY3pQ4TkcHp0Hu/MXYaxJFmjLqUACPK6UAcYyXgxSZv9INdR2f7JW4NPfchtH+Zg6
 xq0i+9MDrAkDlwweTsVFFpVntkLGXyDpWktoIks9BoSUXNbAlLfgsdA
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_023732_581915_4D81A86E 
X-CRM114-Status: GOOD (  11.07  )
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
index c1e4c5710015..602c93aba3cc 100644
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



