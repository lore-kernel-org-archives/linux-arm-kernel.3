Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3116CD6A224
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWFM2OIDny8aQRNfF/FtlMduc/pXhoIYLcpFwT4ifvg=; b=kPyxH9Em238p0n5/Qk/kRtR658
	bjEPyWM9hKnK2KtXmMI/6LGiTVqSHQBkot4ThCCm+I1s0Ld6pi2aau+PF50VCvC7ZjvKAe7SUHecp
	LJrFqxSKiK2pKgKQ31Dv6qWsVw3Lr6+Ji5LmSS5nGcGKhKoYbpJX3TDIa27T1cdyBpdtwSPaLePvS
	WqFIG54Kp46v80Coqw8R5NlTNfnUjtryXZhXqi+AXW9EeURDTlLXmy0VSZOF1DMww63EeuXotYPs0
	zfJa8wWz3ZtRnpFj7yKi6qMoMozzfYdvjsBIeTRqhwv6bRgG3eaBU5fj0TIMAIMC5gxIX+tEXS9bD
	js9D57NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBduN-00000000N6J-3aPw;
	Thu, 14 Nov 2024 17:45:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcoh-000000009OV-1w52;
	Thu, 14 Nov 2024 16:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=uWFM2OIDny8aQRNfF/FtlMduc/pXhoIYLcpFwT4ifvg=; b=jZ19qofm/ftD1RzWGfZRaGRvY7
	6sdz14Q5KagH4j4UKWfOJSxOeqtH2pZK5KccD5hEIR5onTqlcIn5G2kgKZB7Dk+ezGLt+YrG9h8do
	+Eqvkr9MDYUTxUmCnrJoRSM8qKQ06XJOrC5D/KDG/p3X13ozTkwvn8fJMYLjV2oCdJ5FTTI6eyRPQ
	jbcfJ6nX2gy7ncPSIQUsVYihONxK8HDZ1fbNj9kjQ9HjGmwd5XMg7odA3qwqwI3BaTvFuSh35b159
	ywD5l9yF7o1T/upy+ykzDK+FYbpiaBk6PgnsWaCwVOrJtx3uDzFmrGf9krjofkMfyAAkSZag7hc0z
	kU6u8i6A==;
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcod-000000007pt-025q;
	Thu, 14 Nov 2024 16:35:33 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 488DB12000F;
	Thu, 14 Nov 2024 19:29:33 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 488DB12000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1731601773;
	bh=uWFM2OIDny8aQRNfF/FtlMduc/pXhoIYLcpFwT4ifvg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=NTk0EQQq1dTOoLVAR6GaTO++UVCib4kqHgC5/08c3yFCw4g/2aPtLZLuSqF5Iu77/
	 4afD9B1yly2t5vKet6TX2wtmprg6tC217vm7GHcKy2mVpRIN4SNSBKIOm/Ylo1hvFG
	 MycBb4j0nIYBd/sQRWscVnsTdtyYYSDNe+xQjghLZPxHSKW4MRF7bWtb/E5jeXGL8m
	 1J56xNkZApekA3xLCyCEJgQswh2pmiZQ+PvOZYkgX1nWIFH5YXlafBrQgbf6cvCaOR
	 7qIXDkkXiMCxb/j1b00WSIrrkbP/xPmDAaAb7RMFqfZ46CO5KZgVRqZZIKj4tP8PNm
	 TR/k7qKZIe4rA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
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
Subject: [RFC PATCH 2/3] clk: amlogic: axg-audio: synchronize *_audio_hw_clks and *_clk_regmaps arrays
Date: Thu, 14 Nov 2024 19:29:25 +0300
Message-ID: <20241114162926.3356551-3-jan.dakinevich@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_smtp_not_equal_from}, salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/14 14:31:00 #26861614
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_163531_374817_63BCF1D4 
X-CRM114-Status: GOOD (  10.76  )
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

To simplify review, synchronize the content and order of clocks listed
in these arrays.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 drivers/clk/meson/axg-audio.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 05a72a199ebd..5d2901b2a964 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1095,6 +1095,8 @@ static struct clk_hw *g12a_audio_hw_clks[] = {
 	[AUD_CLKID_TDM_SCLK_PAD0]	= &g12a_tdm_sclk_pad_0.hw,
 	[AUD_CLKID_TDM_SCLK_PAD1]	= &g12a_tdm_sclk_pad_1.hw,
 	[AUD_CLKID_TDM_SCLK_PAD2]	= &g12a_tdm_sclk_pad_2.hw,
+	[AUD_CLKID_TORAM]		= &toram.hw,
+	[AUD_CLKID_EQDRC]		= &eqdrc.hw,
 	[AUD_CLKID_TOP]			= &axg_aud_top,
 };
 
@@ -1428,6 +1430,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&spdifout_clk_sel,
 	&spdifout_clk_div,
 	&spdifout_clk,
+	&spdifout_b_clk_sel,
+	&spdifout_b_clk_div,
+	&spdifout_b_clk,
 	&spdifin_clk_sel,
 	&spdifin_clk_div,
 	&spdifin_clk,
@@ -1508,9 +1513,6 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&tdmout_a_lrclk,
 	&tdmout_b_lrclk,
 	&tdmout_c_lrclk,
-	&spdifout_b_clk_sel,
-	&spdifout_b_clk_div,
-	&spdifout_b_clk,
 	&g12a_tdm_mclk_pad_0,
 	&g12a_tdm_mclk_pad_1,
 	&g12a_tdm_lrclk_pad_0,
@@ -1565,6 +1567,9 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&spdifout_clk_sel,
 	&spdifout_clk_div,
 	&spdifout_clk,
+	&spdifout_b_clk_sel,
+	&spdifout_b_clk_div,
+	&spdifout_b_clk,
 	&spdifin_clk_sel,
 	&spdifin_clk_div,
 	&spdifin_clk,
@@ -1645,9 +1650,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&tdmout_a_lrclk,
 	&tdmout_b_lrclk,
 	&tdmout_c_lrclk,
-	&spdifout_b_clk_sel,
-	&spdifout_b_clk_div,
-	&spdifout_b_clk,
 	&sm1_tdm_mclk_pad_0,
 	&sm1_tdm_mclk_pad_1,
 	&sm1_tdm_lrclk_pad_0,
-- 
2.34.1


