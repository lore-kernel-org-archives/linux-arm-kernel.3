Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C34C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/QbCc4ZhrocJak5FMn7/cnZOpnKx6mcm3PWtmF6BV4=; b=YaPx8qx5aXfXzHdXsaUYbsv9A4
	T6F6j4tgWU3kR1HKiGeNkeDZUURkIsYXbeaiPTyVK/xmyClyIbAGoTDqeOCQj7LFQg98swGInXjfo
	z4+lbUSfCb18cHqEMubsU4+Dhpy3j1yWhkiarS54OfoFxnds8Th5qyoLijrQ3Bp9nTt3BX6l9vNRr
	yhnbFapIktogQVoDN5aodne3WyfXtmuo6WD2gOemM59NenfCXdUBAa66KPcUKTYcu7641c4OSa2SM
	BLElhuoESQZbiwMDt9nmM1nFolyoqB096a4743JSMm3P0uOrQYkYeym4Qr9lwK74/48Fy2peIO+1I
	rN76zCHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvfT-0000000Cezr-2Zmj;
	Thu, 10 Jul 2025 18:06:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtYv-0000000CJT5-2wMi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/QbCc4ZhrocJak5FMn7/cnZOpnKx6mcm3PWtmF6BV4=;
	b=UH0FGp+LbCeEiwQDqhbHJkLEjxrR5FPsa1R/o3PtiPDf18pYT/HYQ/R7XyggMnzfrNajyX
	cPSnf60aLSQePenKrY3Ex6crtVPGoTrc2Z0AZZJD0OTJ0TAZVsk2njiCbkynqwtnmi8Wir
	b7qD5aZsotZDtBSE/FxnY56vj9R6Rgs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-9Bbrzi00Mgm0Hyt-qBqMCQ-1; Thu, 10 Jul 2025 11:51:51 -0400
X-MC-Unique: 9Bbrzi00Mgm0Hyt-qBqMCQ-1
X-Mimecast-MFC-AGG-ID: 9Bbrzi00Mgm0Hyt-qBqMCQ_1752162711
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb1f84a448so11619236d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162710; x=1752767510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/QbCc4ZhrocJak5FMn7/cnZOpnKx6mcm3PWtmF6BV4=;
        b=H+UHv0W+CpWouRgg4TC2y/oV7D5Hv6TiKSswFyL84jRtopyjvbb6xyAvcY1a84WJe5
         +cJth8LUFodjdS4LUcs4UNptMVuKa85aVEbNzFUgI2+OBViAqdfPm1TnUJNS0pivbU94
         G4kXauJ5kljll4h3+fGb0YHXM7iwj3DWTiNbQk0SiLQMpRaY/lagNXjFHI5mDDvNo+qA
         6CcJNNR6HrRrMZy0mWu5CMGaqvRBu6nIggXCqm0mfZX5ImioMubazd5DmG52W3yFyZgR
         j6TANH7V1DaK7gAP1uQLIrDSpc3UEVRt8PLpy+DSz8J+oRHaK183I6JG4WEKgpWJku+x
         S37w==
X-Forwarded-Encrypted: i=1; AJvYcCXB3AOHAHaiwouyCB7LkYrg/EC164E70V3yTDI2tyODKVL2gBec7j/a3dzPBUabPPhAZrY6Zc1FynE/MWa1BhjW@lists.infradead.org
X-Gm-Message-State: AOJu0YwUfzUtfn0yDObTvNR3ZzsPFceJevEJjaJg8/MdMLreeYy93D5K
	oEkbhJ5128BnM9WLGkiLfUEfgt5eyhuKoKRQlZ6qIWGulF9N5tB7YiV9JN05+HuwLAOoZOI4Xrn
	l/NHwEY4l7EcUr7Gm0EjxUGOSvXKl6aHssnRFBQRd0YjPFAxrCYFe0i6raQ4Tkl3XxmFQ8u8RjW
	hU1bvL56Srb7yLs6Q7hXkI7xAm5RgHi7yrDOsZ8yJrcmlrniYO6gYIMWrbvio=
X-Gm-Gg: ASbGncvDkbISGREjvPgyq1KMJnVded/ULUAjLsm6X/nq9l4d6bAKKdF99YfewgjTYGA
	QX9Wbp7nvp8C4h+Vd1s07MxA6hwaPuKeTTXzV1H0y40KiWIKHvcd7bRypp6G7OwlhILRaSumEEZ
	IX6Zo5ug+OvMyArTdFa/UlAFENc8b8564K7Do+Yi99g9V5JFZc0Ry6rIipm1wVjh9CGg6S1EnUH
	5d6DreTDBZukSV2hh4X9KpUob8k+mdSlZlvgPwP0tErQVnjLLJ+10VKH3hcIOZsF3e3mEEbUVMV
	etIKYZJzYZ8GDOKORPjZAnTlqYD0US+7WUdoK/JFhYrn8QDDTceKMny5G6Wj
X-Received: by 2002:a05:6214:b62:b0:702:d822:9376 with SMTP id 6a1803df08f44-7049801cd10mr39722696d6.12.1752162710278;
        Thu, 10 Jul 2025 08:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Z7rRnZbhf+h4qqa+7uxIY+dr40XTC3XMOAdTeO370BxlyEUPUGIFiPj6+jcE4rOLalJzHw==
X-Received: by 2002:a05:6214:b62:b0:702:d822:9376 with SMTP id 6a1803df08f44-7049801cd10mr39722176d6.12.1752162709775;
        Thu, 10 Jul 2025 08:51:49 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:49 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:09 -0400
Subject: [PATCH 3/6] sound: soc: codecs: rt5682s: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-3-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3348;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=gJQYtpXBJm648AFk1gtJnD4yQFFqo6H++D/z3O5GbyQ=;
 b=vD7l+nzKA8agktbW8Jzsxd4HfmX/ug18UCk1oQGlijIkHUQB6mZ1qnPnNhOQanXgK2uw/TZG1
 MAryM+LpwAXCVClNThsU6ftx2kQA9I5QEh/lGCP0TGcm3ECu8RsmgOH
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HYPwtxoOidH-it12BD4wi9xfDzhC16bm6hBQwKeTmYQ_1752162711
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_085153_815271_59BFB2BB 
X-CRM114-Status: GOOD (  14.95  )
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

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/codecs/rt5682s.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 73c4b3c31f8c45703d965e6fd1b70aa1817e2926..80b921695e7d1c0506766bd47421c07e5fa7a6d3 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2610,8 +2610,8 @@ static unsigned long rt5682s_wclk_recalc_rate(struct clk_hw *hw,
 	return rt5682s->lrck[RT5682S_AIF1];
 }
 
-static long rt5682s_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682s_wclk_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct rt5682s_priv *rt5682s =
 		container_of(hw, struct rt5682s_priv, dai_clks_hw[RT5682S_DAI_WCLK_IDX]);
@@ -2624,13 +2624,13 @@ static long rt5682s_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * Only accept to set wclk rate to 44.1k or 48kHz.
 	 * It will force to 48kHz if not both.
 	 */
-	if (rate != CLK_48 && rate != CLK_44) {
+	if (req->rate != CLK_48 && req->rate != CLK_44) {
 		dev_warn(component->dev, "%s: clk %s only support %d or %d Hz output\n",
 			__func__, clk_name, CLK_44, CLK_48);
-		rate = CLK_48;
+		req->rate = CLK_48;
 	}
 
-	return rate;
+	return 0;
 }
 
 static int rt5682s_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2719,14 +2719,14 @@ static unsigned long rt5682s_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long rt5682s_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682s_bclk_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct rt5682s_priv *rt5682s =
 		container_of(hw, struct rt5682s_priv, dai_clks_hw[RT5682S_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !rt5682s_clk_check(rt5682s))
+	if (!req->best_parent_rate || !rt5682s_clk_check(rt5682s))
 		return -EINVAL;
 
 	/*
@@ -2736,9 +2736,11 @@ static long rt5682s_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = rt5682s_bclk_get_factor(rate, *parent_rate);
+	factor = rt5682s_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int rt5682s_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2769,12 +2771,12 @@ static const struct clk_ops rt5682s_dai_clk_ops[RT5682S_DAI_NUM_CLKS] = {
 		.prepare = rt5682s_wclk_prepare,
 		.unprepare = rt5682s_wclk_unprepare,
 		.recalc_rate = rt5682s_wclk_recalc_rate,
-		.round_rate = rt5682s_wclk_round_rate,
+		.determine_rate = rt5682s_wclk_determine_rate,
 		.set_rate = rt5682s_wclk_set_rate,
 	},
 	[RT5682S_DAI_BCLK_IDX] = {
 		.recalc_rate = rt5682s_bclk_recalc_rate,
-		.round_rate = rt5682s_bclk_round_rate,
+		.determine_rate = rt5682s_bclk_determine_rate,
 		.set_rate = rt5682s_bclk_set_rate,
 	},
 };

-- 
2.50.0


