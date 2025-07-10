Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F744C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMxn3qGVHET6C9gd+BL5oIIz2htkls+w6noefj8NRsw=; b=XrlGapIbgb/ZQqi3+CSkkD1j5j
	vZMfcQTbcxYtLEFup2ePAw0fQyLjRU6qEaE5aNZZNbVjK8U4PgKdHfnI+r0k5cKZeI0jKJ5Jr+2W1
	UrfFcquMQ4B9p3CMBYCaLitFxLJJfaSJq1pRz0u6P5olslGI1dd1TTSKJWfoocNBbSBM3HCPvSl6a
	+D1wU/ckL5J0B+WVqQoB6cwpiG/8BBynvo1VrpRhGSMUMhGPP0GTRYIfRgmuAGZFrXjszIua4NXcU
	2SZm+HxmYdC2AFC4VhwgMf6eLyaVnginx7NAoJwzQsYrAjPZ8LGAl1W6h07g52tBA7S+28dqA7+4c
	zZvwDvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q5-0000000DPz6-2vjx;
	Fri, 11 Jul 2025 01:19:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyYo-0000000D2Ql-3m90
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RMxn3qGVHET6C9gd+BL5oIIz2htkls+w6noefj8NRsw=;
	b=dRefkhYZeD9b8MQ6Wox6ZYPS9fLCUrkgVSVLq6QtbyuJzvCwBtQko7fikVC16iUowfV8HU
	e+b2oqmVqfq44nbA2EzSGtAQ88kwlapi+uIhlq8D7ZXuLBcgPJByOhLNm4BXOGMr/pqbtY
	QraLzEXmIj+MN+Rn2TQKpJzY2m0fZAY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-Jg2kLZkrMJyS-wW7Ie7zyQ-1; Thu, 10 Jul 2025 17:12:04 -0400
X-MC-Unique: Jg2kLZkrMJyS-wW7Ie7zyQ-1
X-Mimecast-MFC-AGG-ID: Jg2kLZkrMJyS-wW7Ie7zyQ_1752181924
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so2247223a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181924; x=1752786724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMxn3qGVHET6C9gd+BL5oIIz2htkls+w6noefj8NRsw=;
        b=vir41sDayYvnpVDgVdAc/5eUa5Sz+Jxwt5r7cBoT/NV6hioDzrF9Pn6JDZTH1i8uWE
         L/uFkJWY1dpBFBVYP7ofsHCdeWzaTnppWILs/aZ+Yl2YBTzAwXJFuaSm4bcDr4JR9VuS
         +Mj2+DOvy3WdqXLihN3KUx4tLascw4w/OS4tgMJ10kzSJ4CiKPhWamhv669cDJQCRCul
         8OqPvTm8ZrHjsyukfl3q22QyDJFlPfbyU1QC+AlhhnHju9yXNKtU82F8bGjjqOhJVDFF
         eOiw6bG4E2+xMzM/bl/QWtMB/0pV0i84ZE57wmiUM5QxpNN7J8eTW3gjJoEktAq7vs9h
         /S1w==
X-Forwarded-Encrypted: i=1; AJvYcCX3Ymw0xfgsvNWEGxPpgQYdtiZS/u/u37ccCBdPOzGz0CehMpPSpIGcPNZUWm/kIRnGD0HLaEiwEYgnFz3Tfrkx@lists.infradead.org
X-Gm-Message-State: AOJu0YwELjLaP0BGEktKdZ0y2ncdHIXOUM3D1iZJd/C2TG7ppfSaG7Jq
	tUl9xcPPr+R8sImRT87cNeeX8mu1Xmo0icTcH8G1Fpp5UTCvuo2d6FCbBzhtJatQNQ1lWunASXM
	IeWntZrSySEQBlPOcaoRp5E0PGD99OBnjZeKtjNUaWNlAGZoUb91vDFhuNvuZBNBEm5jeofFSZe
	C8
X-Gm-Gg: ASbGncv6eg5vxwdBIzMDTgcnpVaZlEUYHf1yVIzXxBVF2ZIq9WFGGJzocrWkw6gsUF/
	Ipk68k9FIgY6xUd8aGyCWQZv51Wg0+4z06xZlf1AX0tLNtry83ULgslc9+mcTWxJqGR24LXw1oq
	GAEjZ7F/9QhZjVBbDOkcp6ETgVuV8G8idJV0mDUHYKuXWvLkN8sgqyetnhlfb20QA1OaZMQBMVw
	QHcPCJD7pN54bHWSoSZB91BqG2s1Kv/VM1MDlou+jGlKoD8eVIeu2/Hc/bIE0yeodOpUTU9ZSpu
	eYz9xO5ZvUTM2h6G2wt+HVMrNUp6
X-Received: by 2002:a17:90b:4b83:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-31c4f5d782fmr181009a91.33.1752181923702;
        Thu, 10 Jul 2025 14:12:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZJwG4kbKUPKJJw9NlPg14COmpPc23m7MFfrg7F5+Wtg/2WFXr5ADA1o8ZCRL9BuYnk5dhrA==
X-Received: by 2002:a17:90b:4b83:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-31c4f5d782fmr180978a91.33.1752181923366;
        Thu, 10 Jul 2025 14:12:03 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:12:02 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:44 -0400
Subject: [PATCH 12/13] clk: imx: pllv4: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-12-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=3218;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=eYghFW8p4DYIUBCaUWp+/iE+HslCUlPDg0t9I+XyN/I=;
 b=GlygFKUJrkVpwE7GHwRPUG7uDzpRjwh+PDyr1kcDB3zP0XEHH7Gkt8tVur2GVkNuwZ24eg+r7
 k/5dyQToeGkBYWaTeEwsUjiUla04efU+hrImZBsDIo9uilD8+vVwD3U
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OMvv1jBLUxgIQlCjtk8AhEIMW5eKiktAXnAWhUBMFRo_1752181924
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141207_021846_CEC34AD4 
X-CRM114-Status: GOOD (  17.86  )
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
 drivers/clk/imx/clk-pllv4.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv4.c b/drivers/clk/imx/clk-pllv4.c
index 9b136c951762c23cb7424405e1a66ec70af57d5c..01d05b5d543852c9eb48d1ae2b63e8f32b4f4a89 100644
--- a/drivers/clk/imx/clk-pllv4.c
+++ b/drivers/clk/imx/clk-pllv4.c
@@ -95,11 +95,11 @@ static unsigned long clk_pllv4_recalc_rate(struct clk_hw *hw,
 	return (parent_rate * mult) + (u32)temp64;
 }
 
-static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int clk_pllv4_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct clk_pllv4 *pll = to_clk_pllv4(hw);
-	unsigned long parent_rate = *prate;
+	unsigned long parent_rate = req->best_parent_rate;
 	unsigned long round_rate, i;
 	u32 mfn, mfd = DEFAULT_MFD;
 	bool found = false;
@@ -107,7 +107,7 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 	u32 mult;
 
 	if (pll->use_mult_range) {
-		temp64 = (u64)rate;
+		temp64 = (u64) req->rate;
 		do_div(temp64, parent_rate);
 		mult = temp64;
 		if (mult >= pllv4_mult_range[1] &&
@@ -118,7 +118,7 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 	} else {
 		for (i = 0; i < ARRAY_SIZE(pllv4_mult_table); i++) {
 			round_rate = parent_rate * pllv4_mult_table[i];
-			if (rate >= round_rate) {
+			if (req->rate >= round_rate) {
 				found = true;
 				break;
 			}
@@ -127,14 +127,16 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (!found) {
 		pr_warn("%s: unable to round rate %lu, parent rate %lu\n",
-			clk_hw_get_name(hw), rate, parent_rate);
+			clk_hw_get_name(hw), req->rate, parent_rate);
+		req->rate = 0;
+
 		return 0;
 	}
 
 	if (parent_rate <= MAX_MFD)
 		mfd = parent_rate;
 
-	temp64 = (u64)(rate - round_rate);
+	temp64 = (u64)(req->rate - round_rate);
 	temp64 *= mfd;
 	do_div(temp64, parent_rate);
 	mfn = temp64;
@@ -145,14 +147,19 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * pair of mfn/mfd, we simply return the round_rate without using
 	 * the frac part.
 	 */
-	if (mfn >= mfd)
-		return round_rate;
+	if (mfn >= mfd) {
+		req->rate = round_rate;
+
+		return 0;
+	}
 
 	temp64 = (u64)parent_rate;
 	temp64 *= mfn;
 	do_div(temp64, mfd);
 
-	return round_rate + (u32)temp64;
+	req->rate = round_rate + (u32)temp64;
+
+	return 0;
 }
 
 static bool clk_pllv4_is_valid_mult(struct clk_pllv4 *pll, unsigned int mult)
@@ -229,7 +236,7 @@ static void clk_pllv4_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_pllv4_ops = {
 	.recalc_rate	= clk_pllv4_recalc_rate,
-	.round_rate	= clk_pllv4_round_rate,
+	.determine_rate = clk_pllv4_determine_rate,
 	.set_rate	= clk_pllv4_set_rate,
 	.prepare	= clk_pllv4_prepare,
 	.unprepare	= clk_pllv4_unprepare,

-- 
2.50.0


