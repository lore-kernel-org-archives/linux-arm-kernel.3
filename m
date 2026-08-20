Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA5DC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+gzOxx9oE6eKHxFZ2hWUiqIgHk0IssfaFnjK3QXCWkg=; b=lQuN+V6XOck08qQX08u2x11Ud6
	cLHmjJ98JM43aQTGWkxyBDGfd4LLaFio9OvodT/0mydPfxWzMXtgmzSowsccuZ/OODfjCd5gLtoPT
	3aqKVAVYpn8Dm4OMdw2B4Mkb+Tn1Pyr7oqQy745d8MZRuuH5o/SNMEFEQ2+yH8qcgD2yGZoDu2wKm
	tEUMKd3sicAh3M0YrOxDRAZUsEYszVC5dzVBL+0WLCaUfDHU3tpz7hbTKX6mgJiy2xgaYDfjsDDld
	3BQ4bpsM/yC37Jw9jKOhXji443qzZAz7CFt+qbLpK3jT0e/VnyH9Thsw5Inatzyk+q5QXKwVrqxDS
	qo+4oX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxbh-0000000B6fS-2VHF;
	Thu, 20 Aug 2026 07:54:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxbe-0000000B6eZ-3DLw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 07:54:35 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1076387f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 00:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787212472; x=1787817272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+gzOxx9oE6eKHxFZ2hWUiqIgHk0IssfaFnjK3QXCWkg=;
        b=BQ7U01T2ylOc2/IU8VcIrCwv9q3j+M8+5ACWuiBUY4SGg41nIhc/YPPzOKCTJrubhz
         21Llm2tZyfYk8pX5w+DmrDeE0pOIjB74Y6ikEsCZf3I5t34QssWb1wdAvyjNoq+x54Wa
         kg3OjPjsH/BUkptZZ4Y6h0kgyoD+s5lR3qH0fiVWNu/ClrtmI+vAyNxKN0pf+B5FFMFe
         YYUplVxzav2bEjr4YmYpjUik4N0EcjU79sVfvMWDqtJpwbC2OoKMWszVYdOJEOOGSkQB
         TZEYHyvVQ7F3FA5atzSKc8J936ecNm3VL3oYQiIlQaw/TcDX3z6zsnLT8AkLlQeQSSS/
         g1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212472; x=1787817272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gzOxx9oE6eKHxFZ2hWUiqIgHk0IssfaFnjK3QXCWkg=;
        b=JdWW3FIOxsc0S3yAW7WWShKB/GTcmsiRrGFep4FNqxw1vy4XXJ0TdSMBBVZz/MEpDh
         +B0Oz4l3WWNwiTpaqoidUwRwhhOXWP5gyiFLi2ySB0bYSfEBDxTkSS/oawZHQio/ypcT
         17SddlXFa4hNKfR569BxkEG1UctXLj7YYOkl+DXIer+akcQhsivBzs+5790gGfxk2bYk
         2r6HJZz/y2+Xvnx0oFaDHxs2ncMrw6oPJNBrPgJAqJPXPMthguvGcvYEJoY5QNh7kv8s
         w3Sxw9r/aStQDp5ZII/tJfH1a+G1HHP/R+RMw+z+eLHqq1g7XhD11jreRijfDk7fiWpj
         dljg==
X-Forwarded-Encrypted: i=1; AHgh+RqtHTRujWg6MmUPVyn4m7HAu7mnWYx8IlMMTmwkfsGQqhBTuhhgika6c/ZEZ/qWXpi72fvm55rkimm2wcQvQwcz@lists.infradead.org
X-Gm-Message-State: AFuF++nBwRL6ShiqdNM7eQpIw4EJZGa2/10nvoZBaUTumobwEQKpg2gQ
	/IyTM13IFoh05rqs8rXLKB6tkCbPAWeimDc0ZnVp76Y2MHrAKXdOm+bp2CfwCd+O1hU=
X-Gm-Gg: AR+sD12YBC+3qlxANwmJz6nAdSvLc7b7ucqAqQUlVB6AxQ67jHnop18mq3UnViWBqg0
	B8mT0z76eXH7+U8Ags5Xgb6ZkARdQhJsWGiKB22zc8ZXjcOT/sbx+gjWgECDm8CthFaPHy28Y7b
	pHCp+jXpoRkval5YiM7+eyGI1Pd+DFfsl35TUW8serXm5Mr+wrtJFoTatIFgmo+nJF/YedfvnJE
	eFpvvMLzIw5q6QvwbEGiWkstR1ItEH+uN1mrc3/nHTG5aQUrSf2W0PxylrAvQN9qI2mDxqK2xPN
	udjDABHfb49HSdOqrU/sHvI60auQQROS8P//aHmncVPCjRBXX+0XUoZpeUeT+gXRsVZz7bzJWgg
	5QquyyYLB19641sVRe/pZmP8YdSy8JSeENAvCrSY9bwRhX9TkWlmFGxE0zIr5wXLtWnUsUEh+vm
	YrokUHNNfxdgW0CA3f8wcv1/aErxMQJX0YsmkPHJpbl/DjXWYhKrDORZgB1+rvhAYNG9HSWApRb
	TEQNzbqZYYkkQ==
X-Received: by 2002:a5d:5d0f:0:b0:481:51b5:7503 with SMTP id ffacd0b85a97d-482b1e92a63mr16850901f8f.7.1787212472136;
        Thu, 20 Aug 2026 00:54:32 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.23.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d0360sm10342800f8f.33.2026.08.20.00.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:54:31 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	heiko@sntech.de
Cc: bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH] clk: rockchip: rk3588: let MCLK_SPDIF* rate requests reach the divider
Date: Thu, 20 Aug 2026 10:54:27 +0300
Message-Id: <20260820075427.67050-1-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_005434_825848_BE6D4B44 
X-CRM114-Status: GOOD (  15.39  )
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

Every MCLK_SPDIFn gate is declared with flags 0, while the CLK_SPDIFn mux
immediately above it already carries CLK_SET_RATE_PARENT. The rockchip
S/PDIF driver calls clk_set_rate() on the gate, which has no .set_rate of
its own and, without CLK_SET_RATE_PARENT, no way to pass the request up.
The clock core therefore computes "new rate == current rate", returns 0,
and changes nothing.

The visible effect is that S/PDIF is stuck on whatever divider the
bootloader left behind. On a board whose audio PLL is parked on the
48 kHz family, every 44.1 kHz source goes out at 48 kHz, silently, with
nothing reporting an error. Measured on an RK3588 board playing 44.1 kHz
material, before and after:

  mclk_spdif0   12287999 Hz    48000 x 256
  mclk_spdif0   11289598 Hz    44100 x 256

Add CLK_SET_RATE_PARENT to all eight MCLK_SPDIF gates so the request
propagates to the fractional divider that can satisfy it.

Propagation stops there. Each chain terminates at CLK_SPDIFn_SRC, which
is declared with flags 0, so a rate request cannot reach a shared PLL and
pull unrelated consumers off frequency.

Two pairs of gates share a divider - mclk_spdif2 and mclk_spdif2_dp0 both
sit on clk_spdif2_dp0, and mclk_spdif5 and mclk_spdif5_dp1 on
clk_spdif5_dp1 - so a rate set on one moves the other. That sharing is in
the hardware and is not introduced here; before this change neither of
them could set a rate at all.

Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    Generated against broonie/sound.git for-next. clk-rk3588.c
    carries no ASoC changes, so this should apply to any current tree.
    
    Tested on RK3588 hardware running 7.1.3: without this a 44.1 kHz stream leaves
    the S/PDIF transmitter at 48 kHz; with it mclk_spdif0 retunes and the receiver
    locks at 44.1 kHz.
    
    checkpatch --strict reports "Alignment should match open parenthesis" on the
    touched lines. That continuation indentation is unchanged by this patch and
    matches every other clock entry in the file; realigning only these eight would
    make them the inconsistent ones.

 drivers/clk/rockchip/clk-rk3588.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 2ba9976654c..b3d577dccfc 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -960,7 +960,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(33), 0,
 			RK3588_CLKGATE_CON(9), 0, GFLAGS,
 			&rk3588_spdif0_fracmux),
-	GATE(MCLK_SPDIF0, "mclk_spdif0", "clk_spdif0", 0,
+	GATE(MCLK_SPDIF0, "mclk_spdif0", "clk_spdif0", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(9), 1, GFLAGS),
 
 	GATE(HCLK_SPDIF1, "hclk_spdif1", "hclk_audio_root", 0,
@@ -973,7 +973,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(35), 0,
 			RK3588_CLKGATE_CON(9), 4, GFLAGS,
 			&rk3588_spdif1_fracmux),
-	GATE(MCLK_SPDIF1, "mclk_spdif1", "clk_spdif1", 0,
+	GATE(MCLK_SPDIF1, "mclk_spdif1", "clk_spdif1", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(9), 5, GFLAGS),
 
 	COMPOSITE(ACLK_AV1_ROOT, "aclk_av1_root", gpll_cpll_aupll_p, 0,
@@ -1868,9 +1868,9 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(123), 0,
 			RK3588_CLKGATE_CON(57), 4, GFLAGS,
 			&rk3588_spdif2_dp0_fracmux),
-	GATE(MCLK_SPDIF2_DP0, "mclk_spdif2_dp0", "clk_spdif2_dp0", 0,
+	GATE(MCLK_SPDIF2_DP0, "mclk_spdif2_dp0", "clk_spdif2_dp0", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(57), 5, GFLAGS),
-	GATE(MCLK_SPDIF2, "mclk_spdif2", "clk_spdif2_dp0", 0,
+	GATE(MCLK_SPDIF2, "mclk_spdif2", "clk_spdif2_dp0", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(57), 6, GFLAGS),
 	COMPOSITE(CLK_SPDIF5_DP1_SRC, "clk_spdif5_dp1_src", gpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(124), 7, 1, MFLAGS, 2, 5, DFLAGS,
@@ -1880,9 +1880,9 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(125), 0,
 			RK3588_CLKGATE_CON(57), 9, GFLAGS,
 			&rk3588_spdif5_dp1_fracmux),
-	GATE(MCLK_SPDIF5_DP1, "mclk_spdif5_dp1", "clk_spdif5_dp1", 0,
+	GATE(MCLK_SPDIF5_DP1, "mclk_spdif5_dp1", "clk_spdif5_dp1", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(57), 10, GFLAGS),
-	GATE(MCLK_SPDIF5, "mclk_spdif5", "clk_spdif5_dp1", 0,
+	GATE(MCLK_SPDIF5, "mclk_spdif5", "clk_spdif5_dp1", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(57), 11, GFLAGS),
 	COMPOSITE_NOMUX(CLK_AUX16M_0, "clk_aux16m_0", "gpll", 0,
 			RK3588_CLKSEL_CON(117), 0, 8, DFLAGS,
@@ -2059,7 +2059,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(149), 0,
 			RK3588_CLKGATE_CON(63), 6, GFLAGS,
 			&rk3588_spdif3_fracmux),
-	GATE(MCLK_SPDIF3, "mclk_spdif3", "clk_spdif3", 0,
+	GATE(MCLK_SPDIF3, "mclk_spdif3", "clk_spdif3", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(63), 7, GFLAGS),
 	COMPOSITE(CLK_SPDIF4_SRC, "clk_spdif4_src", gpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(150), 7, 1, MFLAGS, 2, 5, DFLAGS,
@@ -2069,7 +2069,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(151), 0,
 			RK3588_CLKGATE_CON(63), 10, GFLAGS,
 			&rk3588_spdif4_fracmux),
-	GATE(MCLK_SPDIF4, "mclk_spdif4", "clk_spdif4", 0,
+	GATE(MCLK_SPDIF4, "mclk_spdif4", "clk_spdif4", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(63), 11, GFLAGS),
 	COMPOSITE(MCLK_SPDIFRX0, "mclk_spdifrx0", gpll_cpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(152), 7, 2, MFLAGS, 2, 5, DFLAGS,
-- 
2.34.1


