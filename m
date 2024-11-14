Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA66D68B36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbDsYv7cu08zbtXV8EEGOIH5VNm7Wy08SWYNwx6otmY=; b=B62asXb9ZcLv/Vn2E/2ITMqlOu
	M+/wX6v9O5HutAXvZaT0tsG6cKHiOq4rKjvR1podAYIhvHvQ4KHOEeCFzG/ztbz0iw1OFvYreD0MK
	JFB64gUwISGCpxSMXwXqzqCxFks0Y0u7TOyOfTxNcAtu7GPiCPpq2DmS2/T//GbMLorWvT5od1nVu
	1HcPJDgda91fO79lQRndbKSz6hL96AiDIn5Mw+IYy3u3Xe4KgZcPiVc6v7dwtttNYq6a4HM0a7eBh
	+1UufLQqCCZFLK6HAsgCTcv6Bpl9T94YrdhZFba0DduwBWiUsOQ6uafJiX67qZOwdj+pTO2IH/q5R
	nl9CuvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcv2-00000000Arn-1Ekv;
	Thu, 14 Nov 2024 16:42:08 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcqy-00000000A3h-1jl7;
	Thu, 14 Nov 2024 16:37:59 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8BABA10000C;
	Thu, 14 Nov 2024 19:29:33 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8BABA10000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1731601773;
	bh=JbDsYv7cu08zbtXV8EEGOIH5VNm7Wy08SWYNwx6otmY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=cRYHmOKy71p5KWR12GjiWXenLnWqyKys4w2AHNuy595SGRvgGn172jchZ6RKVcCjM
	 mErqV1uRjmk+7nlV0tt4EWlpql1PZtyI79N4mu7PqI3nfw9V1xev+h4usF26O1hVEX
	 3JoKbOHvcy8dBaiUfilfKK6QgRp0+E5c4uFl1WG2Ah+7QUDsgpwzn/IvHPgCFISawY
	 T+jDqaqwyBHxhYbphEdOI8BARSB3rl6u95vkO251h/SNObIH3cgOvq94aqDGjx0a3p
	 IzQYPB+r9lpai3pvgem0kwX8UJpIrr7W4dXWKm1vwf0SMmbLdZjJV66Txuvl0D+OvF
	 ZhFi1bN9YBSOw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Nov 2024 19:29:33 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH 3/3] clk: amlogic: axg-audio: get the rid of *_clk_regmaps
Date: Thu, 14 Nov 2024 19:29:26 +0300
Message-ID: <20241114162926.3356551-4-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114162926.3356551-1-jan.dakinevich@salutedevices.com>
References: <20241114162926.3356551-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.45]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189183 [Nov 14 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_smtp_not_equal_from}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:7.1.1,5.0.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/14 14:31:00 #26861614
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_083756_789170_BC88B6B3 
X-CRM114-Status: GOOD (  20.30  )
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

The only thing which these arrays used for is to initialize ->map field
during probe. However, the content of them is almost identical to their
*_audio_hw_clks counterparts.

So, we can make do the following: exclude AUD_CLKID_TOP from
*_audio_hw_clks arrays if the clock is not backed by hardware and then
use *_audio_hw_clks for both ->map initialization and for clock's
registering.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 drivers/clk/meson/axg-audio.c | 451 ++--------------------------------
 1 file changed, 15 insertions(+), 436 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 5d2901b2a964..8418c6cd7063 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -954,7 +954,6 @@ static struct clk_hw *axg_audio_hw_clks[] = {
 	[AUD_CLKID_TDMOUT_A_LRCLK]	= &tdmout_a_lrclk.hw,
 	[AUD_CLKID_TDMOUT_B_LRCLK]	= &tdmout_b_lrclk.hw,
 	[AUD_CLKID_TDMOUT_C_LRCLK]	= &tdmout_c_lrclk.hw,
-	[AUD_CLKID_TOP]			= &axg_aud_top,
 };
 
 /*
@@ -1097,7 +1096,6 @@ static struct clk_hw *g12a_audio_hw_clks[] = {
 	[AUD_CLKID_TDM_SCLK_PAD2]	= &g12a_tdm_sclk_pad_2.hw,
 	[AUD_CLKID_TORAM]		= &toram.hw,
 	[AUD_CLKID_EQDRC]		= &eqdrc.hw,
-	[AUD_CLKID_TOP]			= &axg_aud_top,
 };
 
 /*
@@ -1261,427 +1259,6 @@ static struct clk_hw *sm1_audio_hw_clks[] = {
 	[AUD_CLKID_EARCRX_DMAC]		= &sm1_earcrx_dmac_clk.hw,
 };
 
-
-/* Convenience table to populate regmap in .probe(). */
-static struct clk_regmap *const axg_clk_regmaps[] = {
-	&ddr_arb,
-	&pdm,
-	&tdmin_a,
-	&tdmin_b,
-	&tdmin_c,
-	&tdmin_lb,
-	&tdmout_a,
-	&tdmout_b,
-	&tdmout_c,
-	&frddr_a,
-	&frddr_b,
-	&frddr_c,
-	&toddr_a,
-	&toddr_b,
-	&toddr_c,
-	&loopback,
-	&spdifin,
-	&spdifout,
-	&resample,
-	&power_detect,
-	&mst_a_mclk_sel,
-	&mst_b_mclk_sel,
-	&mst_c_mclk_sel,
-	&mst_d_mclk_sel,
-	&mst_e_mclk_sel,
-	&mst_f_mclk_sel,
-	&mst_a_mclk_div,
-	&mst_b_mclk_div,
-	&mst_c_mclk_div,
-	&mst_d_mclk_div,
-	&mst_e_mclk_div,
-	&mst_f_mclk_div,
-	&mst_a_mclk,
-	&mst_b_mclk,
-	&mst_c_mclk,
-	&mst_d_mclk,
-	&mst_e_mclk,
-	&mst_f_mclk,
-	&spdifout_clk_sel,
-	&spdifout_clk_div,
-	&spdifout_clk,
-	&spdifin_clk_sel,
-	&spdifin_clk_div,
-	&spdifin_clk,
-	&pdm_dclk_sel,
-	&pdm_dclk_div,
-	&pdm_dclk,
-	&pdm_sysclk_sel,
-	&pdm_sysclk_div,
-	&pdm_sysclk,
-	&mst_a_sclk_pre_en,
-	&mst_b_sclk_pre_en,
-	&mst_c_sclk_pre_en,
-	&mst_d_sclk_pre_en,
-	&mst_e_sclk_pre_en,
-	&mst_f_sclk_pre_en,
-	&mst_a_sclk_div,
-	&mst_b_sclk_div,
-	&mst_c_sclk_div,
-	&mst_d_sclk_div,
-	&mst_e_sclk_div,
-	&mst_f_sclk_div,
-	&mst_a_sclk_post_en,
-	&mst_b_sclk_post_en,
-	&mst_c_sclk_post_en,
-	&mst_d_sclk_post_en,
-	&mst_e_sclk_post_en,
-	&mst_f_sclk_post_en,
-	&mst_a_sclk,
-	&mst_b_sclk,
-	&mst_c_sclk,
-	&mst_d_sclk,
-	&mst_e_sclk,
-	&mst_f_sclk,
-	&mst_a_lrclk_div,
-	&mst_b_lrclk_div,
-	&mst_c_lrclk_div,
-	&mst_d_lrclk_div,
-	&mst_e_lrclk_div,
-	&mst_f_lrclk_div,
-	&mst_a_lrclk,
-	&mst_b_lrclk,
-	&mst_c_lrclk,
-	&mst_d_lrclk,
-	&mst_e_lrclk,
-	&mst_f_lrclk,
-	&tdmin_a_sclk_sel,
-	&tdmin_b_sclk_sel,
-	&tdmin_c_sclk_sel,
-	&tdmin_lb_sclk_sel,
-	&tdmout_a_sclk_sel,
-	&tdmout_b_sclk_sel,
-	&tdmout_c_sclk_sel,
-	&tdmin_a_sclk_pre_en,
-	&tdmin_b_sclk_pre_en,
-	&tdmin_c_sclk_pre_en,
-	&tdmin_lb_sclk_pre_en,
-	&tdmout_a_sclk_pre_en,
-	&tdmout_b_sclk_pre_en,
-	&tdmout_c_sclk_pre_en,
-	&tdmin_a_sclk_post_en,
-	&tdmin_b_sclk_post_en,
-	&tdmin_c_sclk_post_en,
-	&tdmin_lb_sclk_post_en,
-	&tdmout_a_sclk_post_en,
-	&tdmout_b_sclk_post_en,
-	&tdmout_c_sclk_post_en,
-	&tdmin_a_sclk,
-	&tdmin_b_sclk,
-	&tdmin_c_sclk,
-	&tdmin_lb_sclk,
-	&axg_tdmout_a_sclk,
-	&axg_tdmout_b_sclk,
-	&axg_tdmout_c_sclk,
-	&tdmin_a_lrclk,
-	&tdmin_b_lrclk,
-	&tdmin_c_lrclk,
-	&tdmin_lb_lrclk,
-	&tdmout_a_lrclk,
-	&tdmout_b_lrclk,
-	&tdmout_c_lrclk,
-};
-
-static struct clk_regmap *const g12a_clk_regmaps[] = {
-	&ddr_arb,
-	&pdm,
-	&tdmin_a,
-	&tdmin_b,
-	&tdmin_c,
-	&tdmin_lb,
-	&tdmout_a,
-	&tdmout_b,
-	&tdmout_c,
-	&frddr_a,
-	&frddr_b,
-	&frddr_c,
-	&toddr_a,
-	&toddr_b,
-	&toddr_c,
-	&loopback,
-	&spdifin,
-	&spdifout,
-	&resample,
-	&power_detect,
-	&spdifout_b,
-	&mst_a_mclk_sel,
-	&mst_b_mclk_sel,
-	&mst_c_mclk_sel,
-	&mst_d_mclk_sel,
-	&mst_e_mclk_sel,
-	&mst_f_mclk_sel,
-	&mst_a_mclk_div,
-	&mst_b_mclk_div,
-	&mst_c_mclk_div,
-	&mst_d_mclk_div,
-	&mst_e_mclk_div,
-	&mst_f_mclk_div,
-	&mst_a_mclk,
-	&mst_b_mclk,
-	&mst_c_mclk,
-	&mst_d_mclk,
-	&mst_e_mclk,
-	&mst_f_mclk,
-	&spdifout_clk_sel,
-	&spdifout_clk_div,
-	&spdifout_clk,
-	&spdifout_b_clk_sel,
-	&spdifout_b_clk_div,
-	&spdifout_b_clk,
-	&spdifin_clk_sel,
-	&spdifin_clk_div,
-	&spdifin_clk,
-	&pdm_dclk_sel,
-	&pdm_dclk_div,
-	&pdm_dclk,
-	&pdm_sysclk_sel,
-	&pdm_sysclk_div,
-	&pdm_sysclk,
-	&mst_a_sclk_pre_en,
-	&mst_b_sclk_pre_en,
-	&mst_c_sclk_pre_en,
-	&mst_d_sclk_pre_en,
-	&mst_e_sclk_pre_en,
-	&mst_f_sclk_pre_en,
-	&mst_a_sclk_div,
-	&mst_b_sclk_div,
-	&mst_c_sclk_div,
-	&mst_d_sclk_div,
-	&mst_e_sclk_div,
-	&mst_f_sclk_div,
-	&mst_a_sclk_post_en,
-	&mst_b_sclk_post_en,
-	&mst_c_sclk_post_en,
-	&mst_d_sclk_post_en,
-	&mst_e_sclk_post_en,
-	&mst_f_sclk_post_en,
-	&mst_a_sclk,
-	&mst_b_sclk,
-	&mst_c_sclk,
-	&mst_d_sclk,
-	&mst_e_sclk,
-	&mst_f_sclk,
-	&mst_a_lrclk_div,
-	&mst_b_lrclk_div,
-	&mst_c_lrclk_div,
-	&mst_d_lrclk_div,
-	&mst_e_lrclk_div,
-	&mst_f_lrclk_div,
-	&mst_a_lrclk,
-	&mst_b_lrclk,
-	&mst_c_lrclk,
-	&mst_d_lrclk,
-	&mst_e_lrclk,
-	&mst_f_lrclk,
-	&tdmin_a_sclk_sel,
-	&tdmin_b_sclk_sel,
-	&tdmin_c_sclk_sel,
-	&tdmin_lb_sclk_sel,
-	&tdmout_a_sclk_sel,
-	&tdmout_b_sclk_sel,
-	&tdmout_c_sclk_sel,
-	&tdmin_a_sclk_pre_en,
-	&tdmin_b_sclk_pre_en,
-	&tdmin_c_sclk_pre_en,
-	&tdmin_lb_sclk_pre_en,
-	&tdmout_a_sclk_pre_en,
-	&tdmout_b_sclk_pre_en,
-	&tdmout_c_sclk_pre_en,
-	&tdmin_a_sclk_post_en,
-	&tdmin_b_sclk_post_en,
-	&tdmin_c_sclk_post_en,
-	&tdmin_lb_sclk_post_en,
-	&tdmout_a_sclk_post_en,
-	&tdmout_b_sclk_post_en,
-	&tdmout_c_sclk_post_en,
-	&tdmin_a_sclk,
-	&tdmin_b_sclk,
-	&tdmin_c_sclk,
-	&tdmin_lb_sclk,
-	&g12a_tdmout_a_sclk,
-	&g12a_tdmout_b_sclk,
-	&g12a_tdmout_c_sclk,
-	&tdmin_a_lrclk,
-	&tdmin_b_lrclk,
-	&tdmin_c_lrclk,
-	&tdmin_lb_lrclk,
-	&tdmout_a_lrclk,
-	&tdmout_b_lrclk,
-	&tdmout_c_lrclk,
-	&g12a_tdm_mclk_pad_0,
-	&g12a_tdm_mclk_pad_1,
-	&g12a_tdm_lrclk_pad_0,
-	&g12a_tdm_lrclk_pad_1,
-	&g12a_tdm_lrclk_pad_2,
-	&g12a_tdm_sclk_pad_0,
-	&g12a_tdm_sclk_pad_1,
-	&g12a_tdm_sclk_pad_2,
-	&toram,
-	&eqdrc,
-};
-
-static struct clk_regmap *const sm1_clk_regmaps[] = {
-	&ddr_arb,
-	&pdm,
-	&tdmin_a,
-	&tdmin_b,
-	&tdmin_c,
-	&tdmin_lb,
-	&tdmout_a,
-	&tdmout_b,
-	&tdmout_c,
-	&frddr_a,
-	&frddr_b,
-	&frddr_c,
-	&toddr_a,
-	&toddr_b,
-	&toddr_c,
-	&loopback,
-	&spdifin,
-	&spdifout,
-	&resample,
-	&spdifout_b,
-	&sm1_mst_a_mclk_sel,
-	&sm1_mst_b_mclk_sel,
-	&sm1_mst_c_mclk_sel,
-	&sm1_mst_d_mclk_sel,
-	&sm1_mst_e_mclk_sel,
-	&sm1_mst_f_mclk_sel,
-	&sm1_mst_a_mclk_div,
-	&sm1_mst_b_mclk_div,
-	&sm1_mst_c_mclk_div,
-	&sm1_mst_d_mclk_div,
-	&sm1_mst_e_mclk_div,
-	&sm1_mst_f_mclk_div,
-	&sm1_mst_a_mclk,
-	&sm1_mst_b_mclk,
-	&sm1_mst_c_mclk,
-	&sm1_mst_d_mclk,
-	&sm1_mst_e_mclk,
-	&sm1_mst_f_mclk,
-	&spdifout_clk_sel,
-	&spdifout_clk_div,
-	&spdifout_clk,
-	&spdifout_b_clk_sel,
-	&spdifout_b_clk_div,
-	&spdifout_b_clk,
-	&spdifin_clk_sel,
-	&spdifin_clk_div,
-	&spdifin_clk,
-	&pdm_dclk_sel,
-	&pdm_dclk_div,
-	&pdm_dclk,
-	&pdm_sysclk_sel,
-	&pdm_sysclk_div,
-	&pdm_sysclk,
-	&mst_a_sclk_pre_en,
-	&mst_b_sclk_pre_en,
-	&mst_c_sclk_pre_en,
-	&mst_d_sclk_pre_en,
-	&mst_e_sclk_pre_en,
-	&mst_f_sclk_pre_en,
-	&mst_a_sclk_div,
-	&mst_b_sclk_div,
-	&mst_c_sclk_div,
-	&mst_d_sclk_div,
-	&mst_e_sclk_div,
-	&mst_f_sclk_div,
-	&mst_a_sclk_post_en,
-	&mst_b_sclk_post_en,
-	&mst_c_sclk_post_en,
-	&mst_d_sclk_post_en,
-	&mst_e_sclk_post_en,
-	&mst_f_sclk_post_en,
-	&mst_a_sclk,
-	&mst_b_sclk,
-	&mst_c_sclk,
-	&mst_d_sclk,
-	&mst_e_sclk,
-	&mst_f_sclk,
-	&mst_a_lrclk_div,
-	&mst_b_lrclk_div,
-	&mst_c_lrclk_div,
-	&mst_d_lrclk_div,
-	&mst_e_lrclk_div,
-	&mst_f_lrclk_div,
-	&mst_a_lrclk,
-	&mst_b_lrclk,
-	&mst_c_lrclk,
-	&mst_d_lrclk,
-	&mst_e_lrclk,
-	&mst_f_lrclk,
-	&tdmin_a_sclk_sel,
-	&tdmin_b_sclk_sel,
-	&tdmin_c_sclk_sel,
-	&tdmin_lb_sclk_sel,
-	&tdmout_a_sclk_sel,
-	&tdmout_b_sclk_sel,
-	&tdmout_c_sclk_sel,
-	&tdmin_a_sclk_pre_en,
-	&tdmin_b_sclk_pre_en,
-	&tdmin_c_sclk_pre_en,
-	&tdmin_lb_sclk_pre_en,
-	&tdmout_a_sclk_pre_en,
-	&tdmout_b_sclk_pre_en,
-	&tdmout_c_sclk_pre_en,
-	&tdmin_a_sclk_post_en,
-	&tdmin_b_sclk_post_en,
-	&tdmin_c_sclk_post_en,
-	&tdmin_lb_sclk_post_en,
-	&tdmout_a_sclk_post_en,
-	&tdmout_b_sclk_post_en,
-	&tdmout_c_sclk_post_en,
-	&tdmin_a_sclk,
-	&tdmin_b_sclk,
-	&tdmin_c_sclk,
-	&tdmin_lb_sclk,
-	&g12a_tdmout_a_sclk,
-	&g12a_tdmout_b_sclk,
-	&g12a_tdmout_c_sclk,
-	&tdmin_a_lrclk,
-	&tdmin_b_lrclk,
-	&tdmin_c_lrclk,
-	&tdmin_lb_lrclk,
-	&tdmout_a_lrclk,
-	&tdmout_b_lrclk,
-	&tdmout_c_lrclk,
-	&sm1_tdm_mclk_pad_0,
-	&sm1_tdm_mclk_pad_1,
-	&sm1_tdm_lrclk_pad_0,
-	&sm1_tdm_lrclk_pad_1,
-	&sm1_tdm_lrclk_pad_2,
-	&sm1_tdm_sclk_pad_0,
-	&sm1_tdm_sclk_pad_1,
-	&sm1_tdm_sclk_pad_2,
-	&sm1_aud_top,
-	&toram,
-	&eqdrc,
-	&resample_b,
-	&tovad,
-	&locker,
-	&spdifin_lb,
-	&frddr_d,
-	&toddr_d,
-	&loopback_b,
-	&sm1_clk81_en,
-	&sm1_sysclk_a_div,
-	&sm1_sysclk_a_en,
-	&sm1_sysclk_b_div,
-	&sm1_sysclk_b_en,
-	&earcrx,
-	&sm1_earcrx_cmdc_clk_sel,
-	&sm1_earcrx_cmdc_clk_div,
-	&sm1_earcrx_cmdc_clk,
-	&sm1_earcrx_dmac_clk_sel,
-	&sm1_earcrx_dmac_clk_div,
-	&sm1_earcrx_dmac_clk,
-};
-
 static struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -1689,8 +1266,6 @@ static struct regmap_config axg_audio_regmap_cfg = {
 };
 
 struct audioclk_data {
-	struct clk_regmap *const *regmap_clks;
-	unsigned int regmap_clk_num;
 	struct meson_clk_hw_data hw_clks;
 	unsigned int max_register;
 	const char *rst_drvname;
@@ -1702,7 +1277,6 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	const struct audioclk_data *data;
 	struct regmap *map;
 	void __iomem *regs;
-	struct clk_hw *hw;
 	struct clk *clk;
 	int ret, i;
 
@@ -1728,19 +1302,30 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to reset device\n");
 
-	/* Populate regmap for the regmap backed clocks */
-	for (i = 0; i < data->regmap_clk_num; i++)
-		data->regmap_clks[i]->map = map;
+	/*
+	 * If AUD_CLKID_TOP is not listed data->hw_clks then 'aud_top' clock
+	 * doesn't have underlying hardware and it should be registered
+	 * separately of other clocks to provide respective signal name.
+	 */
+	if (data->hw_clks.num < AUD_CLKID_TOP ||
+	    !data->hw_clks.hws[AUD_CLKID_TOP]) {
+		ret = devm_clk_hw_register(dev, &axg_aud_top);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register clock aud_top\n");
+	}
 
 	/* Take care to skip the registered input clocks */
 	for (i = AUD_CLKID_DDR_ARB; i < data->hw_clks.num; i++) {
+		struct clk_hw *hw = data->hw_clks.hws[i];
+		struct clk_regmap *clk_regmap = to_clk_regmap(hw);
 		const char *name;
 
-		hw = data->hw_clks.hws[i];
 		/* array might be sparse */
 		if (!hw)
 			continue;
 
+		clk_regmap->map = map;
+
 		name = hw->init->name;
 
 		ret = devm_clk_hw_register(dev, hw);
@@ -1761,8 +1346,6 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 }
 
 static const struct audioclk_data axg_audioclk_data = {
-	.regmap_clks = axg_clk_regmaps,
-	.regmap_clk_num = ARRAY_SIZE(axg_clk_regmaps),
 	.hw_clks = {
 		.hws = axg_audio_hw_clks,
 		.num = ARRAY_SIZE(axg_audio_hw_clks),
@@ -1771,8 +1354,6 @@ static const struct audioclk_data axg_audioclk_data = {
 };
 
 static const struct audioclk_data g12a_audioclk_data = {
-	.regmap_clks = g12a_clk_regmaps,
-	.regmap_clk_num = ARRAY_SIZE(g12a_clk_regmaps),
 	.hw_clks = {
 		.hws = g12a_audio_hw_clks,
 		.num = ARRAY_SIZE(g12a_audio_hw_clks),
@@ -1782,8 +1363,6 @@ static const struct audioclk_data g12a_audioclk_data = {
 };
 
 static const struct audioclk_data sm1_audioclk_data = {
-	.regmap_clks = sm1_clk_regmaps,
-	.regmap_clk_num = ARRAY_SIZE(sm1_clk_regmaps),
 	.hw_clks = {
 		.hws = sm1_audio_hw_clks,
 		.num = ARRAY_SIZE(sm1_audio_hw_clks),
-- 
2.34.1


