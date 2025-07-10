Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4D1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eG1BadWZpL7H715pVBNXXfvnkpwspQ8t98toz4xLpZQ=; b=ejwHi7aIiPJ9Mk6UiqHhaMt3Qc
	1R+e8MNcbcD/JgnkgWHSvKWvXtzXBtaOQ97Tq/9SJHrcqL/F6W1mbqRIyWNesbI5XlRhIIjS6wfeA
	kQa+ouAhcG1Pu5qNsdmH9fLMydmAUOiboObc1qWHYSeXUErFphp5v2osQ3G7eIctP5nFnDtCinPMm
	6thNsq4p82Y1TzyBndLLYTgI+7z2I/l1MWpSdpQDukutNCNqcfoiw5k4xv8Wn31N/bh3hfCeTZIW7
	PmMz6O9lsgZWiBhskDSzXd8p5UuMa3fMyGOlXzHVJjJMdb7aaDTL5LKiOXFAzlodo0kvaUuheVwet
	I2Vf70DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvk6-0000000Cfg4-0CoF;
	Thu, 10 Jul 2025 18:11:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtZ2-0000000CJVn-1Mrb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eG1BadWZpL7H715pVBNXXfvnkpwspQ8t98toz4xLpZQ=;
	b=B0sUOcD70osFzeY7TInxqnfuzabpXqT/OuFl2fY8OqLNolzdO6xcVGurGO30a28xtYVleg
	FRFllpj7E5o2WwPTMgAExjuDM+L3FXeyKiQq1X8fkxGiluQxdQeX+o+yyv9EcXuwuisxwB
	2oqQvoAiHkSO761bT11/VyQPZppofyc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-_uCD1j3GN-2lENXsKs7ygg-1; Thu, 10 Jul 2025 11:51:58 -0400
X-MC-Unique: _uCD1j3GN-2lENXsKs7ygg-1
X-Mimecast-MFC-AGG-ID: _uCD1j3GN-2lENXsKs7ygg_1752162718
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fab979413fso18705616d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162717; x=1752767517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eG1BadWZpL7H715pVBNXXfvnkpwspQ8t98toz4xLpZQ=;
        b=XUGfHH4Rv6WPo6s3yeeb9//hLG/bR+rPizWeRiwuJgzZa/Ill4eQXZccNgHqkV1USe
         b63G8Pqb77cnagJBA3xvd6Ut1fo64NMZ1WeoQVsUhR3yPg6E2Yjz82G66TzBTo7Eyl0+
         HxUqHb57YgvXArOREnOJK5oTOgFaJaFgp6CUZpe0r788phuPYB+HNHTfX70qerlvqsd/
         1t44fn5kpJ4BZiSojms8xBOO4v5oF9oo+HxI/fo2fKfbgw2HF7UqYSP7g/2Uc5ne+k50
         eS5o1+EB0JKMeERwwOz7wwSbl9yWTXSyH7I+H4jKeF7c7vLkf+VMKQQx0kQggDVSAb8R
         wurw==
X-Forwarded-Encrypted: i=1; AJvYcCVPYoLLVlaqBpSwe7Wy5CK6NXNWKUqVES3YXT+K6EGZSaQjbUfk7Yy9O8B/MnzuX9/UeBPdz7GZbMMzwqCpGx0j@lists.infradead.org
X-Gm-Message-State: AOJu0YyB/R8A689uFQaMtFPOwBb+dVoQaXWzxhvorIIAJcap3fy+Q+9f
	q7BNH/SR+85sUhMcNEB+fB3sZw+48zw3/kPuOSG91PwhU8FJj80BwJnl1sG0msBaE8LqQiPuLXX
	0Hl7cbN6w3JDiPjdyLavfyoXx3pYbJH1lsU4v46o+kLeD6gkUQJNIsKDFdlA9LMYyoTfLhzFPhk
	UzKGjHoZ4MYrs6HC5ok0K88+6tiII5pPkGl495vumHicwOfaLU2gYKtAGSo1I=
X-Gm-Gg: ASbGncveolfvK3Dd2V0rjeBAYCZGz0iqRBAps8v5efz9EcV9+FTfmuSjCmJ/BzEneuk
	chFBRFfz9u+MUBAukHtFyTxOuZVM24CrGV8gVAMiMurWqRO0RToBPoercBARhVxvgylUnwViwbd
	YXRT6324IM7cNHAPq4wP82D/YC0Y+n1QNfiOHkfHczzKWPOZwz8TtW++1ihxjL6UOnuT4Manqx2
	6fQUOeaDCc3Pb1LKmKIkywIbH2n1160NZxHBGZ7p+pghYYOEQAvNeFJ+TWnP9Ube6/plnfvrGhe
	pma1JvYJJJaDNoSvZiX4JntPDPE8wFLbasokpWfosTO8/aFx32/7SOe3085/
X-Received: by 2002:a05:6214:2e92:b0:704:9588:f0b5 with SMTP id 6a1803df08f44-7049588f0d2mr46868056d6.16.1752162716558;
        Thu, 10 Jul 2025 08:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhATSlh+JJuRzkMWsk8YJM8HUQ4igJGizu8oIXouI4tsZbHB3hz8OxedljaxwZ18b6yh4tAA==
X-Received: by 2002:a05:6214:2e92:b0:704:9588:f0b5 with SMTP id 6a1803df08f44-7049588f0d2mr46864246d6.16.1752162715355;
        Thu, 10 Jul 2025 08:51:55 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:11 -0400
Subject: [PATCH 5/6] sound: soc: stm: stm32_i2s: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-5-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1800;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=irsEjDFgWLJcIRLSdB719V4Ehwxr6Hq/ROabLh9M7vY=;
 b=w46CeQJbLms7jsanP0xDGuQgHsJotX9gQmmNfNXgBWY+HckWjmp9QYjCSEVuxHqbdfSej7iYE
 m2Ah4xmtB30AIx+iZaZOBsQNN8TYWOwYh9Bcz8BF3HVHSMRZ3eurvHX
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0iVvVR4Rk5kcjw7Wi9j53j6G9xxFO5UCyLLMYht4vbU_1752162718
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_085200_436240_CE369A36 
X-CRM114-Status: GOOD (  14.05  )
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
 sound/soc/stm/stm32_i2s.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 6037b7a9c97bf25621fccb1feb59c4caee3250ca..0e489097d9c1086efcd9e3d1013acffeb0a46d4a 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -461,20 +461,25 @@ static int stm32_i2s_set_parent_rate(struct stm32_i2s_data *i2s,
 	return -EINVAL;
 }
 
-static long stm32_i2smclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int stm32_i2smclk_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct stm32_i2smclk_data *mclk = to_mclk_data(hw);
 	struct stm32_i2s_data *i2s = mclk->i2s_data;
 	int ret;
 
-	ret = stm32_i2s_calc_clk_div(i2s, *prate, rate);
-	if (ret)
-		return ret;
+	ret = stm32_i2s_calc_clk_div(i2s, req->best_parent_rate, req->rate);
+	if (ret) {
+		req->rate = ret;
 
-	mclk->freq = *prate / i2s->divider;
+		return 0;
+	}
 
-	return mclk->freq;
+	mclk->freq = req->best_parent_rate / i2s->divider;
+
+	req->rate = mclk->freq;
+
+	return 0;
 }
 
 static unsigned long stm32_i2smclk_recalc_rate(struct clk_hw *hw,
@@ -530,7 +535,7 @@ static const struct clk_ops mclk_ops = {
 	.enable = stm32_i2smclk_enable,
 	.disable = stm32_i2smclk_disable,
 	.recalc_rate = stm32_i2smclk_recalc_rate,
-	.round_rate = stm32_i2smclk_round_rate,
+	.determine_rate = stm32_i2smclk_determine_rate,
 	.set_rate = stm32_i2smclk_set_rate,
 };
 

-- 
2.50.0


