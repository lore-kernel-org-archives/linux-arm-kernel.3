Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F750CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 05:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2Nk5QrjNr+jjajVbJ7Hj+cR1ECK0znPdvqkIZaAEBU=; b=E3Ic3/Q8UWebKWmfOn0Y8eNlj3
	oebALxES7aErnYOg2XItVvfogSVsH2EuK9DWBiFROouvkt1p6YXWhqIuG2fMBfuB/zVi/ziCg+Fqk
	FrilNzjUsj3vois5V9MxijGz9aM3VSCpKOxxdaLmlBtBm/LFNV1AyuitEF8+gaTIeqVq4507Uuy0J
	W0pr2iQKGiYJVqsNsc6Volw7JH5cA17NWCgNcvDZFxItC1y4jTKL2eKx6EX689rr5qMkcc2V90P0m
	yK+sN+/SjraFWGPGtshBkussGFEyqQ/feOA5uYWXdPpi4skkWuJ2Cv6rfGkNsg3c/9DVSvMRwUXUA
	mV5ON7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL96-00000003Uxc-10l6;
	Thu, 30 Oct 2025 05:24:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL91-00000003Uve-11Uw;
	Thu, 30 Oct 2025 05:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A14F601F8;
	Thu, 30 Oct 2025 05:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4D78C4CEFF;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761801857;
	bh=5tLSRE6BInQejsiPR/fc5RiDlVZ9iOn8Or4TkaTc/g4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d91xdU3DbJl+qQa6lgSQtM7avaR4NNy5V/BBKTRM7wJ+HAfoxiT8FRJTX63UPixo1
	 AJFPG8ySkx0ZyRFxWRRXEbyG1SbzTXHnG+eRluzSORyzg/u/MN4tousMEBE1uNEIGO
	 fsWmpwSrtd4YoejlXGH5+fGOPz42aara+mOHhVrTFrMT2m5yhlVevAPQFW53tHWriK
	 S/DSuVjw1oDxtzGp0BiREnjg9KKiV78RRYc9KYGbcvdDhdBBl89GuHNoCMWsAOw7B0
	 OrTDqQo3r6XJPKOvys5HzBP5VjGlBbAqPMhYGZVKMhiERNLgFa4V58oqDQa3cbVOIR
	 oaazgjXuWGsTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE23CCF9EA;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 30 Oct 2025 13:24:11 +0800
Subject: [PATCH v2 1/5] clk: amlogic: Fix out-of-range PLL frequency
 setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-optimize_pll_driver-v2-1-37273f5b25ab@amlogic.com>
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
In-Reply-To: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>, da@libre.computer
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761801855; l=991;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=6onhzW3ODDG4bFoHZLKVZ14BJkN4o2IaabjNVGrsFP0=;
 b=1KGZg2CEt0fhJufxEmdvITvTntwRDyum3Rdl62EXQsiDSKUog/TKBEitbhD1QajWng+8BLt18
 T+rrPWVi0uQBAvwQMD9AjZ6uyKVd2rP99mLY1neIEaParGQ9LNvQWUW
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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

If the calculated 'm' falls into the range:

    pll->range->max < m < (1 << pll->m.width)

Here an incorrect 'm' value could be obtained, so an additional
condition is added to ensure that the calculated 'm' stays within a
valid range.

Fixes: 8eed1db1adec6 ("clk: meson: pll: update driver for the g12a")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..629f6af18ea1 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -191,7 +191,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 	*m = meson_clk_get_pll_range_m(rate, parent_rate, *n, pll);
 
 	/* the pre-divider gives a multiplier too big - stop */
-	if (*m >= (1 << pll->m.width))
+	if (*m > pll->range->max || *m >= (1 << pll->m.width))
 		return -EINVAL;
 
 	return 0;

-- 
2.42.0



