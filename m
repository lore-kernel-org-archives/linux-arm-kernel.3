Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77678C83F23
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtfKlLhcG/kkS8hkYuoUj/IIA4KAh790Vr1OByvwXU8=; b=JqL0mkHjFNVvrKcrxjhHqFsNLE
	lGWeWK7I2QzvZi9YFFSysfVbn8T2nJnJeZmbu/2ptqGt6FFOkIDmBzsPqBx037Ia7CFMvhHLumc/T
	ztS+tecf1ucrUDaf2Pij0tZYGmAmL/nFWE61G3dlK/ND5Q0UYeNhuKSJZQOsm4pTbEBGVile/gJEX
	/UrBrfgaqlIfwRxfH+Cffx6jaj942bEPQVONqMPAwQ0AmbZpQfKJpwrsa4W9vv/GD0p+tjPbRcfL7
	PF5ZkD9dTW43q3npbR1scCZQXi5GLy0ZGxpS6w3SwNy09lwC5bqeh0X5fck4EN/rdLan+yuGe8gv/
	ssmT2lkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q6-0000000DPzU-1BAb;
	Fri, 11 Jul 2025 01:19:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyYt-0000000D2RZ-2a28
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtfKlLhcG/kkS8hkYuoUj/IIA4KAh790Vr1OByvwXU8=;
	b=GHptntDJX6gB+32f2FdFp2NXEGIKigJSEBHRkWUTrfzLWAYs3yLnTupOLptTWVGmSekfqF
	s23nW2avELyVuT/NSy4kfG/xmzmnbO+Piq5QUTXIo0RL+5SeFSCFduVT7Wehy0ckAV3PLD
	isjp7DSxbqI7U3KozIXV1HUt4z07VKs=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-F-5ZpuIyOHiIazlQInigiQ-1; Thu, 10 Jul 2025 17:12:09 -0400
X-MC-Unique: F-5ZpuIyOHiIazlQInigiQ-1
X-Mimecast-MFC-AGG-ID: F-5ZpuIyOHiIazlQInigiQ_1752181928
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2382607509fso8090245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181928; x=1752786728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtfKlLhcG/kkS8hkYuoUj/IIA4KAh790Vr1OByvwXU8=;
        b=m+ArM19OEJhjG8EcXIOXYxFiUSI7IsKcsBOn/BaNjv0ND95QrLReoDDtEHTDGh4K8+
         XwbAHDWPxbix12PpSgi8kD3zyDWXhjoDow5CV9RWrI+sGprAJitP5dHwW1OabkYowLIF
         6+wyRzcobsOzyW4RYafRQW0rMNt6L2GUs8/S90iuMrsHLATH3y5/UMrepVZ4VAPBiWKt
         f48hzI50XtbMLSt2D6eYMWwxjSuDqOuY71e/623i2fGw0gOenWWUkcqLlZAdIjcFt1ZK
         Xt36kGxXpK8IxUs/HSrfeUFhTmqf4BWO+d+dQLeHU4uJHzn1tI4z0bkBxVeFjpYgE9Yf
         z7BA==
X-Forwarded-Encrypted: i=1; AJvYcCXG4NHjwfuSFXS4Nm63vPlyIMbCisTXgEv4IHaVRvzbGC/23JRf/s9ydFfZOc1UNJDr68UpAmPR3MZ7o7qs9eaC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9qsRCt82zWAydr1NGAagb8qwwjG8hXvsw8zTtaELjaaArnoV2
	q3OoR0WEcm4AhrNh5T9ZAON0Ch9DAa/5hOScEQmiplttAPFSyQda5pDjRr6AF1Kkh9OPvtYvrBE
	OynGMRJmtVLTwQthW8ernCxllLAWeivZYk1NZHMZY7dSHF5cXLssg3Za3V98nVjl9uFD1dA5Zbk
	Ur
X-Gm-Gg: ASbGncv7iwVhfQGFwARUKwgh+9nI4aauyUjRiJv1raH66dDOgFEJNRmkCBTzGHTwV/M
	uJt4MwCE1Lrtdi52O3x8BgnW0l1p3aN7ZryNQRcU6Oh11hPR/8imkknkSQtiA081ihpdXsitnJz
	OlCkl4vLvKcL3uVRxjtoDiDmoAReFgRWSSfDTpceT3XVl0HuzEtn2l473AmFtGFhe/p77Ws/YNG
	sRk28eUXLw9qWmNhfmHfFDAb31sv6Nre6OdCMwtrlw27QGBy/k0HghppwtShHnwYAUEREcGahn2
	fVB4KZCRWin82xFXbJ1Y1g61sQ5BUG0kRfhM/EF3DII3FA==
X-Received: by 2002:a17:903:4b24:b0:23c:7c3b:4c61 with SMTP id d9443c01a7336-23dede2d292mr8885945ad.8.1752181928459;
        Thu, 10 Jul 2025 14:12:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyfqFdZB30s9Ns2OTuViOndMsHrV92VUKAaa3t7UGJI0pLP81WIaExo2hP4WyXbE/2+Ovdog==
X-Received: by 2002:a17:903:4b24:b0:23c:7c3b:4c61 with SMTP id d9443c01a7336-23dede2d292mr8885575ad.8.1752181928069;
        Thu, 10 Jul 2025 14:12:08 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:12:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:45 -0400
Subject: [PATCH 13/13] clk: imx: scu: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-13-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
In-Reply-To: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=3280;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=v3hdhBOHK0qUhvNSpx+BtyoEKUPgUNG99ieRMqbb8UE=;
 b=8ZgfFYF2KZsuweqpz1xsyECauFflmi/TsZyTLp4K/6NlZj8L/AQUvX4HpvZ6yVLmtnZpaXBYR
 CufxM/OrxNxAF1m7eYGGkqwIl0G3siaDy/4VyAsIls9Ss5jZ6J2R9M9
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nJiPfV6GxLDm_fh1KlVY_bKjokE_QufqMngyUOvA25Q_1752181928
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141211_733869_4B2C233C 
X-CRM114-Status: GOOD (  17.18  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

This driver also implements both the determine_rate() and round_rate()
clk ops, and the round_rate() clk ops is deprecated. When both are
defined, clk_core_determine_round_nolock() from the clk core will only
use the determine_rate() clk ops, so let's remove the round_rate() clk
ops since it's unused.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-scu.c | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index b27186aaf2a15628910ea6a3d4aaa5320ec4295a..77c4cde8a72bd71653bbd2e95148bc1357ec1aae 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -269,24 +269,6 @@ static int clk_scu_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
-/*
- * clk_scu_round_rate - Round clock rate for a SCU clock
- * @hw: clock to round rate for
- * @rate: rate to round
- * @parent_rate: parent rate provided by common clock framework, not used
- *
- * Returns the current clock rate, or zero in failure.
- */
-static long clk_scu_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
-{
-	/*
-	 * Assume we support all the requested rate and let the SCU firmware
-	 * to handle the left work
-	 */
-	return rate;
-}
-
 static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -454,7 +436,7 @@ static const struct clk_ops clk_scu_ops = {
 
 static const struct clk_ops clk_scu_cpu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.round_rate = clk_scu_round_rate,
+	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_atf_set_cpu_rate,
 	.prepare = clk_scu_prepare,
 	.unprepare = clk_scu_unprepare,
@@ -462,7 +444,7 @@ static const struct clk_ops clk_scu_cpu_ops = {
 
 static const struct clk_ops clk_scu_pi_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.round_rate  = clk_scu_round_rate,
+	.determine_rate = clk_scu_determine_rate,
 	.set_rate    = clk_scu_set_rate,
 };
 
@@ -766,15 +748,15 @@ static unsigned long clk_gpr_div_scu_recalc_rate(struct clk_hw *hw,
 	return err ? 0 : rate;
 }
 
-static long clk_gpr_div_scu_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int clk_gpr_div_scu_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	if (rate < *prate)
-		rate = *prate / 2;
+	if (req->rate < req->best_parent_rate)
+		req->rate = req->best_parent_rate / 2;
 	else
-		rate = *prate;
+		req->rate = req->best_parent_rate;
 
-	return rate;
+	return 0;
 }
 
 static int clk_gpr_div_scu_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -793,7 +775,7 @@ static int clk_gpr_div_scu_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_gpr_div_scu_ops = {
 	.recalc_rate = clk_gpr_div_scu_recalc_rate,
-	.round_rate = clk_gpr_div_scu_round_rate,
+	.determine_rate = clk_gpr_div_scu_determine_rate,
 	.set_rate = clk_gpr_div_scu_set_rate,
 };
 

-- 
2.50.0


