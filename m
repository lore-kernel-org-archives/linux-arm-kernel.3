Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA210C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zl8tqJGsXRRT241pfz1ME5G6IziLWcd0tIVkpvs50QQ=; b=cSb4pGfLs7WOWiBQEH08bbXCI4
	DuMq+tmp20AB0mbJj+eaevOSSWr+/1gds6LDykvKmw2/Elq78ylO/uz8J4vV3MnbVhkAyEjz2lmhx
	Kh8YSifa6rDyXvhOAdNj1f+f0uIOmkyNxD7ZI6olRG+5keEIlJU2lIW/ee/6USrWzlkDJOQq6e3uy
	onnL9wNZRtEvbotwvUijjOykQHTPx08GKGZUlyTt+8OhiJsoc+0DlZ2o4K8aBZkADFouHq/X5/v/V
	LY8f1DkAQU8IpBfEQeI7o9uk2o4I6H9jDx0I2M3/gstvoSqNpx/LH2DQXe9vm/Qun1lDOQbQZv/BI
	hhYNL33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTmU-0000000CtSg-46or;
	Thu, 03 Jul 2025 23:55:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTIq-0000000Cp7Z-476R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 23:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zl8tqJGsXRRT241pfz1ME5G6IziLWcd0tIVkpvs50QQ=;
	b=h0j9L7YzqFkbtu3b31pmcVG9cPTsu67cudRiSyCFbbE50vdJmVKj2t0Hdp9OCGOluyR2Zo
	+6mo0EbldIowqUbHxjoUaUO43ZFCaJ2DUTDTD3vZWYeood+BjjM/8+XNOH5u0gIexHq80P
	cHO3Kagrqx2cSquUqOX2lj21wlzHFC8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-KR4hI1LDMLy2FMu8o1xQGw-1; Thu, 03 Jul 2025 19:23:30 -0400
X-MC-Unique: KR4hI1LDMLy2FMu8o1xQGw-1
X-Mimecast-MFC-AGG-ID: KR4hI1LDMLy2FMu8o1xQGw_1751585009
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb5f71b363so4800026d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 16:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585009; x=1752189809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zl8tqJGsXRRT241pfz1ME5G6IziLWcd0tIVkpvs50QQ=;
        b=fLInLBaqm+3yrKJRlZJJFbizzEy7yQ2521Otd/JbjQ1a4i9sCq1q0FNtEvC2+FiObH
         dbSRyYPJLo89hKYpxo9QZEnDydwtzNFQeUx++K3tvVYDJZ+bZtebBAeR78Rn9mGT3HLQ
         gvkai4d0bjhly4OADJnKnhvlN8Ms3zsUhCLu/PiQCdOpPndiATbck/FXxInyEjyAnkc9
         nP+pVKNKx1OnTJrNoT0u6YGqwKO6f5kCvC3hNVfYZWZAseSDEAy1iBiaHEHLIKxwbIeF
         BBMomWqMtaGquPhaNwTBYBjtUZC/2tFG8jSDw9IcIST86lyfXtX2yEXWcAALGyDRFE38
         xJPg==
X-Forwarded-Encrypted: i=1; AJvYcCUp8ay2G0fgF4t64q1WdO+Bgj5t7qFWceObXi0ii59vFIEB7ez45kgkEA73liF65hVXfWtCN2UYkf0QEFa+ZRBn@lists.infradead.org
X-Gm-Message-State: AOJu0YyWYmX1Zxa9aJIShjD4kCH8krfJud9Ue3/c6PdKqmrJ9ypcc7gv
	oo6I7b3KLkOsm+H3c5mVZHSZBXn/WFb6J/2QBZK1GkhJoR667VrRRtCzGvkANMyO6gkSUjBTa3q
	7vlbgAPWqfVBfeBu25GGJ5/gX7PcSHadFcH2htTKujxNMNeZ11Fe/RrEs7ldsYONqhtFQB62rW2
	ohLoipRS6dL6f+Wk7VW8n80k2jk3F5CArUyHdaUWdDdNkVrYdj9u0B9unetYo=
X-Gm-Gg: ASbGncuMaD3ISyMAyW97iQV9j49KrNXmOa0Flp6PVd6NT6cuLnq7NftMKjMuPTMUUxe
	68eGTT8LfRELCrK722yKLk7mw9msNVp9JYZM2PNo0U/gwDfe6BtZjN8OTkIUe9j8lCtkhEuM919
	e6EjnBAzxrtknAG7joTYCdIKJKl806Q2vyzIZgDAY1s7C5QrQYD8ZDONYke84/av5jEjdv48A3g
	Ox9BB1NK6jG/Px8TJc4TIvHyDlU/RgQLHe0IznlHMExr8p/6ZayCy9RmQdvMm9kgu0PGm++cFts
	A6p9xvf4zSj3U2QtoV8CxTV7CDo/eZzK39/uwFtCQXz1OypdQ0ahzlrz00ogIg==
X-Received: by 2002:a05:6214:202d:b0:6fd:74df:896 with SMTP id 6a1803df08f44-702c6d0108fmr3206566d6.3.1751585008668;
        Thu, 03 Jul 2025 16:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtEKstDD58UA9ynnp87TZzDRG0nHv8TZdipy2JJJ0KGfqawoV2yWwrMW4WiJnElhNazWCQfg==
X-Received: by 2002:a05:6214:202d:b0:6fd:74df:896 with SMTP id 6a1803df08f44-702c6d0108fmr3206086d6.3.1751585008137;
        Thu, 03 Jul 2025 16:23:28 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:33 -0400
Subject: [PATCH 09/10] clk: sunxi-ng: ccu_nkmp: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-9-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=2425;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MG6R6xLI8D2rCtfPyeozFwBeKwPJHUOoxhsT2UMyvnU=;
 b=gtIoYUrg7pKik5I/T79/xPlRf6FIf6RrEY9VaGQ5cG9HAHNGprjV14FnyjTOfqDKEtgskKdxi
 LMUL+S4rLZMAOnlypm4OupDw0dn6pZZJxEd6jy2V8Nc2541mBH3ukUS
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xHQXi7vOCAQIoa2KDg6rkBJgbFizMkdN9XQrYJqJ5js_1751585009
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162517_082674_710B9511 
X-CRM114-Status: GOOD (  14.47  )
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
 drivers/clk/sunxi-ng/ccu_nkmp.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index 6e03b69d402848b237154319d2296ffb4133a213..25efb5b3760759f2943737856246ce93000ebf05 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -127,20 +127,20 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *parent_rate)
+static int ccu_nkmp_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	struct ccu_nkmp *nkmp = hw_to_ccu_nkmp(hw);
 	struct _ccu_nkmp _nkmp;
 
 	if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= nkmp->fixed_post_div;
+		req->rate *= nkmp->fixed_post_div;
 
-	if (nkmp->max_rate && rate > nkmp->max_rate) {
-		rate = nkmp->max_rate;
+	if (nkmp->max_rate && req->rate > nkmp->max_rate) {
+		req->rate = nkmp->max_rate;
 		if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nkmp->fixed_post_div;
-		return rate;
+			req->rate /= nkmp->fixed_post_div;
+		return 0;
 	}
 
 	_nkmp.min_n = nkmp->n.min ?: 1;
@@ -152,12 +152,13 @@ static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
 	_nkmp.min_p = 1;
 	_nkmp.max_p = nkmp->p.max ?: 1 << ((1 << nkmp->p.width) - 1);
 
-	rate = ccu_nkmp_find_best(*parent_rate, rate, &_nkmp);
+	req->rate = ccu_nkmp_find_best(req->best_parent_rate, req->rate,
+				       &_nkmp);
 
 	if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate = rate / nkmp->fixed_post_div;
+		req->rate = req->rate / nkmp->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static int ccu_nkmp_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -227,7 +228,7 @@ const struct clk_ops ccu_nkmp_ops = {
 	.is_enabled	= ccu_nkmp_is_enabled,
 
 	.recalc_rate	= ccu_nkmp_recalc_rate,
-	.round_rate	= ccu_nkmp_round_rate,
+	.determine_rate = ccu_nkmp_determine_rate,
 	.set_rate	= ccu_nkmp_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_nkmp_ops, "SUNXI_CCU");

-- 
2.50.0


