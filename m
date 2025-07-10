Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C735EC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJwHo4Zhfo+XQdxC69KbVscnMO2afRdyYYJQIDGMOLg=; b=H75U5+nBVF/vj4hH8z4tZ6xmXH
	PM4WtZBi4t8LUYvobguuGsJUuvj/4n5uU/fUucIKJpDj0jFaERqsV4yK/hCga1GxB4QEFCdIzy8yj
	opaeiK8Fs4AeJaRZFjLjUsawVI63NjDBK9n9fAHmdLENlgSevdUSSExzzpcBAW3jVTjXMOfY2WIgo
	pxi7PM09fH0sNer2H9XqN7jtieLoJo5zqacpH4fcF6JMeuG2g275Stsn5V29rK8JYfxM25j8+QWOv
	kcmlHBni4lqrtt3WPM3r1jL6O6/h2G1Muix95CYeSGzyzUl3YmrsW78xbqwALs3x2Y/bKEb4nHvCY
	0McQ6s9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvmO-0000000Cfzm-3MnM;
	Thu, 10 Jul 2025 18:13:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtZ7-0000000CJY9-2uzF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJwHo4Zhfo+XQdxC69KbVscnMO2afRdyYYJQIDGMOLg=;
	b=YtpP05j9+TNZJKPk5z2z7PUQcL6RnP50mbe8dBJdYgk+jMCmOkBjqFfIaHZ1mHt/gsU9Qb
	QnnjS+xtNMJPfZWssyEWjvUHq+9+xRrZJ3mcinX2eFHzVV1+YT7QbE3ZL50YeYbn1/s9o2
	hwBddFOQiEF+v1ijYfogwV429pWi6x4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-hhQrP22BN1i67i01gP6MSg-1; Thu, 10 Jul 2025 11:52:03 -0400
X-MC-Unique: hhQrP22BN1i67i01gP6MSg-1
X-Mimecast-MFC-AGG-ID: hhQrP22BN1i67i01gP6MSg_1752162723
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-704817522b9so16607106d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162723; x=1752767523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJwHo4Zhfo+XQdxC69KbVscnMO2afRdyYYJQIDGMOLg=;
        b=hdl820IumAHSS0OVCa/SraVWBu/6TKRD4iwSURq7HPoGGRw/MPb7z/PsTSqjPd3DJp
         gK0HGnM6gdxrQLb3EaouaDYCd4GkpdwPc8DO6RelfEGoqpgPRBoVT9ygRFXgcRuaXqDz
         R6ohjckvBfYQc3WO4XPKsN12D1LEwr1HkUWIwJB1mo2qdEFefmFw4j+Z+ctjSF7KNWGq
         VXeOxhhhaVZ7EUYRgAMx1Z0YGJS3ukespkyWtlGEnLF9/mPm2JJu1HbOaF5n89oPRa1D
         KaLbMod2kMA3LdVx/eueJCFt4E+nKqaKMKb7ZnfWLJMulfksdldOS7V7yPxe5blF/vzZ
         x+sg==
X-Forwarded-Encrypted: i=1; AJvYcCWqvqOfjWGnxRMix6cUo3g7eiV3f5qORqSFQqR8B9h3BsujA01wzmwWjVrniYlSzVeGzOMPfsA/3hKM5psFYrMK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ksC9K4Tp/XBi7uDPvpe54zOYEjpJNYuZkK4acv7lZ89fAQYd
	oDoVpRoYgPGSXEfjkjBWDxaVASiImJRshoh4SLmB/qSs3XA8QOuGSCJZBtmvjjQF+63LawsIy+N
	Wptk7JjEQbdKZAi3sGJIMTAglhJ6muP3EwFa5RIqiS0Wb7LswcGxLgiEKNkeztmt++fvhCddY4B
	Oz/TmZoXwlr/su2VdLrYCCanm391CyxsyI1yHA10vpuLLvm1oCdXkwJlDBZSY=
X-Gm-Gg: ASbGncvyiVx6vzNsfXf2lKcjdEaHpkjFczRUEFn08nE+hFBsQDhowZfYxms32qAsE3I
	ottH48Ks783mdWjRiofKXxPTgd9bmpBZDgfTVPX91YSzwrnKyzipHqLhX4ESfHv27voYROo1id+
	6DN1KVxIFVuGvpcyAblPE06CP78DVl4WjFGaXIUjHlCh2w9uTNjDnxriQSsTI3SGcUFve7Nb2Kw
	0PfawL294euVpQuMpq3NqHcS7Avhbu5POnvHsIimwqJdIjTRKMzOP/CItjyEAZqq6N0qOF0d6mh
	CorSE+SHxylN7od2fbM1QUsTOvdAQRvqudeL6fYP1LAWAsZAFRobCMwIXmAx
X-Received: by 2002:a05:6214:27ef:b0:700:bae3:e1a5 with SMTP id 6a1803df08f44-70494f70162mr73493916d6.19.1752162721930;
        Thu, 10 Jul 2025 08:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG03Gb2AMowqF+jhr90PyL5QhMQySpCZDY992sVjt31FhV8SI5QbSkQU4E7TgwJWA3WWhabRg==
X-Received: by 2002:a05:6214:27ef:b0:700:bae3:e1a5 with SMTP id 6a1803df08f44-70494f70162mr73489626d6.19.1752162717842;
        Thu, 10 Jul 2025 08:51:57 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:12 -0400
Subject: [PATCH 6/6] sound: soc: stm: stm32_sai_sub: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-6-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1764;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=vZWFDt1fg2g84/6CbpXmdsOPkf8vAndRakJ7mBAnblA=;
 b=qoEKZTVvf/Mg1qqHNBU8HndCgCmiS0GmOJSvOpA45N85Yb6978lTjjiSZ4dbTnh0LPFhTtH2p
 Pn2SWV3e4UADKJGs88lQVhTDLPfehYeojWCySSStGKSngtnmPzV3I8g
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HmGSFzcxaY1b8UvR6G9oMIAsADVwRJkRKx4veY9QqWc_1752162723
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_085205_811036_A02AC341 
X-CRM114-Status: GOOD (  13.81  )
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
 sound/soc/stm/stm32_sai_sub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index bf5299ba11c3c95ad89dfb00612ade7ed42b9d0d..463a2b7d023b9cae802f88041c23a9bcc3219a6a 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -489,20 +489,22 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 	return -EINVAL;
 }
 
-static long stm32_sai_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int stm32_sai_mclk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm32_sai_mclk_data *mclk = to_mclk_data(hw);
 	struct stm32_sai_sub_data *sai = mclk->sai_data;
 	int div;
 
-	div = stm32_sai_get_clk_div(sai, *prate, rate);
+	div = stm32_sai_get_clk_div(sai, req->best_parent_rate, req->rate);
 	if (div <= 0)
 		return -EINVAL;
 
-	mclk->freq = *prate / div;
+	mclk->freq = req->best_parent_rate / div;
 
-	return mclk->freq;
+	req->rate = mclk->freq;
+
+	return 0;
 }
 
 static unsigned long stm32_sai_mclk_recalc_rate(struct clk_hw *hw,
@@ -558,7 +560,7 @@ static const struct clk_ops mclk_ops = {
 	.enable = stm32_sai_mclk_enable,
 	.disable = stm32_sai_mclk_disable,
 	.recalc_rate = stm32_sai_mclk_recalc_rate,
-	.round_rate = stm32_sai_mclk_round_rate,
+	.determine_rate = stm32_sai_mclk_determine_rate,
 	.set_rate = stm32_sai_mclk_set_rate,
 };
 

-- 
2.50.0


