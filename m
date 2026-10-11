Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFA6CA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 19:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybYSdKsTtQmBTL9u8kO8sl68Iedi9IlFuOT60yw2EWU=; b=fL7Gf+Z2525cBX9ILYz5plwbUs
	AhIydA3c+5kHWEiywG5JqO7GxN9YmGwTN9YnbqjKPi2OQ0tf973w/nofPvaRtqqmm0OrQyK4l8f2o
	jYYCIUY9qmbW1NbardyXx8xh0JuaFK9QKoxvpmOnZrPy7nh8iiDNgW4sj1IR+4P8X+rDoeX/f4tW/
	bejHEx5q0iQo4FEJOCukRk4/qqKkcrJGSgnkxskb0nMQaFo9uIMlQ7rdwFITEAfAYVECiAehv9Q6k
	2nIXC4xuzSB0ASoYcHWA5Io5zTIBlTAAx5MqWPVB61bEwV5Fhu2hJsCyxyRZOuhfgmSUi/9dEwcpc
	4i6kbhaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFzfh-00000009NAX-1cHI;
	Sun, 11 Oct 2026 19:57:25 +0000
Received: from mail-qk2-x0a.google.com ([2607:f8b0:4864:34::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFzfc-00000009N9S-233I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 19:57:22 +0000
Received: by mail-qk2-x0a.google.com with SMTP id af79cd13be357-93e67431372so120100285a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 12:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748639; x=1792353439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybYSdKsTtQmBTL9u8kO8sl68Iedi9IlFuOT60yw2EWU=;
        b=rCpwegb+Uw6DkVPOIBNGrvhj8cGpmUVo1wtcJk4m0VF+TvRNz9cGI9Setq1kroOpJX
         ViNC2fy6FBHhARPb3xx6XLzkqjQ3lzdWJLm4Gf8dhpTlakbUDkwYaDErxcez9XXtWzkC
         MzqPSdWnJpjqMKp8DCF8nAkjb7apNuAHw7auj50KFhHSODFngftMOiH8R2ZNHrr879rB
         G7mVdHe5lMNR6FAy4IEeJ/9nZMlt2TwLi51cb+yrtn+XAzzl2cNpKla97lV9YflQpG/T
         KfqkrexpNfp+b/sxFLucec843BhKvO/e6BUNBmpty0RivMZzqp77GwH+9fQEolKzPNoM
         f1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748639; x=1792353439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybYSdKsTtQmBTL9u8kO8sl68Iedi9IlFuOT60yw2EWU=;
        b=M0U6HShonsKG0Z34hcGuDEiEunwi9ii2HIPLmij0HvK9NFSDIdj85R1y6tnhlPfFCN
         8G6C9H074OfI0RjGLM7qvXspxbzPe3j9i5aiy9D98OGSynuKkPFfMsU8ZIs72t/OIenN
         Bm4ImV5YbvTuh8QoxVOsEJ8d6ZVlPG6VuVMqkGJ3xEh3pqly/aIDq9ZymvtLyCCaYJoo
         CNwl8CJ2xkCz1sabxMlrmfmmGG6IL6hRnevuoADL3umc7xgx8fAcUTggM6t6mXOwBA3a
         BpvjsY1LvdLecbZG0hU7fz30UDitQkeCHI/J1yGJ2VRwBcN8JJ3qTA1saibRXiEGzgxQ
         +STg==
X-Forwarded-Encrypted: i=1; AKwUvBzdHxJy1oJJN7d7vvdlie4N9AA1wK8blvBC0M6T6befbNmAPYl3fLWbOvB2fECbvonsd9oLVBHJG5MijrOeiPwT@lists.infradead.org
X-Gm-Message-State: AFq9FYJauiX72TPox/FoAbWo3NFy/iMU/F2bnO7tOJafD54Aq9s58vsr
	z221oWAiYmu2XqMt7Idj6onloGFsN4xF5aZaPMdsZDWnjz6ju8+xJFz/
X-Gm-Gg: AYBFou2j8ThBJvQIM5sNiRZPLhC08oLbI7wQISCrr+2vlrncrIAWEKhrhKUhQAnTg24
	CBe2m+jteQxhNPXl46APb0IamQNg6VkabrtWZHqcR5WBhYCd/vKZBucs03AT1HRaPBrI50jUbhG
	kZq99l5ROCgNnUa6Yqti0YpHrroXin9zXLF3JwNsO/8BRtr4zziDH92tp21v+SoS2lI7CSFaymf
	Ia5Snr7y0uOj3pdroEV/leSP6Q+6AZ7YEHRAfKsGnPdplMLFEWzv+9KBOFdlnrDsnBfmza/oro5
	Hc1ASvAU7LmzTN1jrHAiuKReGhZNa2tz7OAS7fVQvmRcn+9bRGTy6olaA2WshjYzvinvh4LXUk0
	SjsC5gEaWrfKVvTETgp4G9J9FkVHMyKk8HB8eX2qm+DxMpmFLptcMKVzuBpCivTgTGs5kr8CbE2
	e1oD/fWDTt2WCbTacK7vVlhhYDCwzW3nDko4u1ybgiFd1cecmVo2/5NRijlhMbWnHE/VQ=
X-Received: by 2002:a05:620a:2912:b0:93e:a818:c8b1 with SMTP id af79cd13be357-93ebd0d01edmr1283130285a.9.1791748639122;
        Sun, 11 Oct 2026 12:57:19 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e832edsm77803306d6.4.2026.10.11.12.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:57:18 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8189: Don't let the GPU reference mux retune MAINPLL
Date: Sun, 11 Oct 2026 15:56:12 -0400
Message-ID: <20261011195612.1663714-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-19-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-19-5df247f56938@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_125720_539994_9B4BDDDA 
X-CRM114-Status: GOOD (  14.83  )
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

mfg_sel_mfgpll selects the GPU clock from mfg_ref_sel or mfgpll and has
CLK_SET_RATE_PARENT, so a GPU rate request (Panfrost devfreq) goes
through __clk_mux_determine_rate(), which evaluates both parents.
mfg_ref_sel is a MUX_GATE_CLR_SET_UPD() and so also has
CLK_SET_RATE_PARENT, as does its mainpll_d6 parent: through it, any GPU
OPP can be met exactly by retuning MAINPLL to six times the requested
rate. mfg_ref_sel is parent 0, so it wins over mfgpll whenever both match.

On an MT8189 Chromebook, MAINPLL therefore followed the GPU: 2340 MHz
for the 390 MHz OPP instead of the 2184 MHz the firmware sets, and 3360
or 3570 MHz while the GPU ran at 560 or 595 MHz. Everything else derived
from MAINPLL moved with it: the peripheral and memory buses, and the
display PWM, whose backlight frequency jumped from 2 to about 3 kHz for
tens of milliseconds under GPU load. That showed as a visible brightness
flicker.

mfg_ref_sel is only the reference/bypass parent that the mux notifier
switches to while MFGPLL relocks. Don't let it propagate rate changes,
as MT8195 does for its top_mfg_core_tmp. The GPU then gets its rates
from MFGPLL, and MAINPLL stays at its firmware rate.

Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---
Found on top of v6 ("[PATCH v6 19/27] clk: mediatek: Add MT8189 topckgen
clock support"); it applies to that patch and can be squashed into it.

Testing: Lenovo IdeaPad Slim 3 Chromebook (MT8189, "quigon"),
next-20261008 plus this series and local board support, Panfrost on the
Mali-G57 with devfreq. Before: MAINPLL 2340 MHz at idle and 3360/3570 MHz
under GPU load, read from clk_summary; the display PWM's actual period
(debugfs/pwm) went from 500 us to 348/328 us with it. After: every GPU
OPP from 390 to 1100 MHz forced through devfreq min/max_freq, and
scrolling a busy page: the GPU always on mfgpll, MAINPLL fixed at
2184 MHz, the PWM steady, no flicker. No device tree change needed (the
mux selects mfgpll by itself). Built with W=1.

 drivers/clk/mediatek/clk-mt8189-topckgen.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/mediatek/clk-mt8189-topckgen.c
index 6ed7661119b8..ff9fd5115c5b 100644
--- a/drivers/clk/mediatek/clk-mt8189-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c
@@ -818,9 +818,13 @@ static const struct mtk_mux top_muxes[] = {
 			     dxcc_parents, 0x100, 0x104, 0x108,
 			     24, 2, 31, 0x0c, 1),
 	/* CLK_CFG_16 */
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
-			     mfg_ref_parents, 0x110, 0x114, 0x118,
-			     0, 2, 7, 0x0c, 2),
+	/*
+	 * Reference/bypass parent of mfg_sel_mfgpll: don't propagate rate
+	 * requests, or GPU DVFS retunes MAINPLL through mainpll_d6.
+	 */
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
+				   mfg_ref_parents, 0x110, 0x114, 0x118,
+				   0, 2, 7, 0x0c, 2, 0),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_MDP0_SEL, "mdp0_sel",
 			     mmsys_parents, 0x110, 0x114, 0x118,
 			     8, 4, 15, 0x0c, 3),
-- 
2.43.0


