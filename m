Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40D6C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGKF6eOX7Jk+EpeggU8l+LOb8l3CYbEDXRYR6gPHE9Q=; b=HWPCNlnEZVpPisxnyhKOnCdS2+
	YrhXAkyfxb6jFBKfbQYVFiILMBIh0n1BPcV8aJdYlK8Jdo79pBHg8YT3BIj49ayk6BL4cIsFfe0jQ
	5TkiFWqaB/kHDNeoklLItA3BrkvwiiYElGr/0xhX7vmMdEffLtswDiYfboQDNoJ0KIc1C3ZSB+T07
	liusTJQElSLcaZ971g9pfVmp9eeizoyq6Axq0YrESFXOMrR5ow4zayyWr3Y3ADXWDbDisdE9/+S3R
	3POqprYKrX8cZHkFmrRWqTPOCUyIbgT8A3KT7a0AAfT+evzCTmExQGEffndekuEcoQNAX/eCrKVPe
	TKtp0dHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvdA-0000000Ceo5-3MLS;
	Thu, 10 Jul 2025 18:04:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtYt-0000000CJST-2vJX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGKF6eOX7Jk+EpeggU8l+LOb8l3CYbEDXRYR6gPHE9Q=;
	b=R4ZO+QKJRrLCOQ20jLJ55RZKOUS+0Me8l+wvda5NTB8YkPchpChsVdEwuiSDs7CCVwEuEO
	UXD2MFRiU9XfWr0Aq6cqnuYNpXegQVZLkbEhkdz7cqK2k4jrMiJZFltg+qj+U7ksM/jWje
	/cVPz0pD47LiAUdcG/yXf98vRE2JxMU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-dB6deyw6M82vskZhho0ZLw-1; Thu, 10 Jul 2025 11:51:49 -0400
X-MC-Unique: dB6deyw6M82vskZhho0ZLw-1
X-Mimecast-MFC-AGG-ID: dB6deyw6M82vskZhho0ZLw_1752162709
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb50d92061so16871626d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162708; x=1752767508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGKF6eOX7Jk+EpeggU8l+LOb8l3CYbEDXRYR6gPHE9Q=;
        b=Gtt5nCgvBIliZqVlVF6Gjd/U1Vms6Ey39RXK3V0nZ+96a3Va2geOJTce3wIoDqDBO/
         4NfFlwH1xaHfmVhKxtSOV4mzUxfFwF9wDIsw9EZv3YWE9jbeQMd3cLzk1R2sLAgijU+s
         XNZ5RnBn4JiIRJc9PaDJzVJKOVTMN00cNuY7g4doC32RDFwPaSN60v9hMePVLopBzhp9
         +f53YAHSO/KSuhlb3veyB9LrGy3C4niEhBruHFfvXoCS2y2ze7gAMtVHgpte/oTR3w7s
         Bo9oE5twN0nhObH0UgGhosxT/SKkKViTRfOdSRq9Cf6IYthlYoiFBNkD9mnF734oOS4T
         nUMg==
X-Forwarded-Encrypted: i=1; AJvYcCW6ineARvtdGoLIFCQ/OH6rRht7hI656YFsO9yczTrnLyyMn4qLsI92d3P5WS7IeE1YH1Vac+JFJvGdHFYYOfew@lists.infradead.org
X-Gm-Message-State: AOJu0YwIXPN2EOXFmzxEmsZFB5ysGrq22fwWGSVOJVR8pSjf+snx5g3o
	gUlfohHZurG2MGcCbuzzs2HCr/HmpphOsW5qn1mj7PcNWcORsRYP9cDPZdH9DV3Rt0wofEKYV0C
	LefE58pbyyTs8hEp7mdt0Q2S6hWx+/zxLI8GewS2ctGRQnUEhdZCIAv53bV4qE/pgGqOvGxqD59
	+MrzkB4HNg5NcJcBqUeW6LOHcx6dtx6ezZZ2LiUB8Axp2Eyk+m35TO/ZCior8=
X-Gm-Gg: ASbGnctmXCtqz3IEeQLJHj9xp3SdKUF8oKFLZQtMcVxBqk+D6HCvMcDVU47miB2Em/l
	iSbxvLLCAI4EJNMwzVgUbkdqvy+amZzp39MFlMdqq0sWt/p9JgGNW87Fxxz/9rsWc/0oxgAhe1F
	POy2EnmksS3gnfXYJoSlCUjOkY7dd9gcRNuTllfBOWBGvWBT/mRBkD7lRD+VYhkzyAdcXbIAXFS
	uomcH2ex0y8WsyFLu6iOXvrBzK5Aof4FxRWO9MGkSB/SdNV5V0mF4BMiQ9/g0u4gdgDrPJOlNWT
	FyfYMkpwqmjnLzsX/4ZV3dyTXODWk+HZ5nUO7ph0PRUEd+a6EnbOJLfzKDEp
X-Received: by 2002:a05:6214:246f:b0:702:d6e7:18bf with SMTP id 6a1803df08f44-70494ee3ed9mr73518036d6.3.1752162708016;
        Thu, 10 Jul 2025 08:51:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiBnQKyOU9ItMPJPrgQVPScQNEJSbolGEYy2qaZnVPuAr8zwJYLa8LtkWFTwl7pjIeSY0WKw==
X-Received: by 2002:a05:6214:246f:b0:702:d6e7:18bf with SMTP id 6a1803df08f44-70494ee3ed9mr73517366d6.3.1752162707432;
        Thu, 10 Jul 2025 08:51:47 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:08 -0400
Subject: [PATCH 2/6] sound: soc: codecs: rt5682: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-2-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3278;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=t2hjGCARaRQgI0Ustel3aF+sNP5ba1R6WUsBnvpS8Gw=;
 b=aqGq6Wwv3mN+qouYIGF3pJ+rhEvmpUrlcSVA+xDWGeOk1pwtlMf/NqlX0M/HemN2IEuG5nCBi
 JURzf2JUU/1A51p4xURtCdQ1xTp4/K/hH/dOMIbhw6NBEwmj4I/5xek
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bqCTE8KY7__Drx6JaOFs6hkgIoeOmO6MOkZWbxzghFI_1752162709
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_085151_811665_225E7596 
X-CRM114-Status: GOOD (  15.04  )
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
 sound/soc/codecs/rt5682.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 7c88370e2dee6a4c2332f1e3db885c980f5e8079..a0abd2ce0c1e1f6cf59fecdd426db16136befe66 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2675,8 +2675,8 @@ static unsigned long rt5682_wclk_recalc_rate(struct clk_hw *hw,
 	return rt5682->lrck[RT5682_AIF1];
 }
 
-static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682_wclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
@@ -2689,13 +2689,13 @@ static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * Only accept to set wclk rate to 44.1k or 48kHz.
 	 * It will force to 48kHz if not both.
 	 */
-	if (rate != CLK_48 && rate != CLK_44) {
+	if (req->rate != CLK_48 && req->rate != CLK_44) {
 		dev_warn(rt5682->i2c_dev, "%s: clk %s only support %d or %d Hz output\n",
 			__func__, clk_name, CLK_44, CLK_48);
-		rate = CLK_48;
+		req->rate = CLK_48;
 	}
 
-	return rate;
+	return 0;
 }
 
 static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2795,15 +2795,15 @@ static unsigned long rt5682_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long rt5682_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682_bclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !rt5682_clk_check(rt5682))
+	if (!req->best_parent_rate || !rt5682_clk_check(rt5682))
 		return -EINVAL;
 
 	/*
@@ -2813,9 +2813,11 @@ static long rt5682_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = rt5682_bclk_get_factor(rate, *parent_rate);
+	factor = rt5682_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int rt5682_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2849,12 +2851,12 @@ static const struct clk_ops rt5682_dai_clk_ops[RT5682_DAI_NUM_CLKS] = {
 		.prepare = rt5682_wclk_prepare,
 		.unprepare = rt5682_wclk_unprepare,
 		.recalc_rate = rt5682_wclk_recalc_rate,
-		.round_rate = rt5682_wclk_round_rate,
+		.determine_rate = rt5682_wclk_determine_rate,
 		.set_rate = rt5682_wclk_set_rate,
 	},
 	[RT5682_DAI_BCLK_IDX] = {
 		.recalc_rate = rt5682_bclk_recalc_rate,
-		.round_rate = rt5682_bclk_round_rate,
+		.determine_rate = rt5682_bclk_determine_rate,
 		.set_rate = rt5682_bclk_set_rate,
 	},
 };

-- 
2.50.0


