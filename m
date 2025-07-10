Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2871C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W339JZdcr7UmhBbOcIPiqXu+Gdd7sYxPv9WXyGXxLMY=; b=cPsWewqosPcqZvEdMEdrZlJfHf
	zZ1cvVfhZueuHGkK9mi+MGmf9VhCrM1WjlcAGAmp9j6mkyWb88PbdsgwQ4tcsovqq+9DhIuArXzq9
	/P/6EiLni/gs77DBIePLd+GS/HvZR7Z5Qwu81M9wDkY6y/GwLrSWf4udmPbKFxib8zNpE7FCRPnAd
	4S+0vfqZM/r1CNJ2V0znbkzWJ7ft1dSxHC9F/cSeEgl/J1YlFAsYklUh8D33AlKcM5VbnvX9DF7GF
	PDH7FoEh4cQLsqnBAoEzm1qBD95J0rpSuV6jg1Jc48vHeOGk/WzfsTrGouZ6rrWcuCoyo0Vii9G6y
	z2ZDNgEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q2-0000000DPx2-2jGc;
	Fri, 11 Jul 2025 01:19:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyYW-0000000D2KK-3hIV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W339JZdcr7UmhBbOcIPiqXu+Gdd7sYxPv9WXyGXxLMY=;
	b=MjL8WW/AhyXGvKlSwqbn8heyC7Fg/BBDJbGC4CYUaZjJn+vQdY7zyp/LsJ/aaUX1Xe/sRJ
	XFZOYx3ZhdDIaTTW4TF/A0dBrBArdRbh7T7rJTSTXLdxw6HrRVAS/1YyFLcobqdAJ3RdKd
	+KTFACYoY43SYcz3CEStCNEJEM6lzmE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-gklkdHnLN76ZBNNBwInzvA-1; Thu, 10 Jul 2025 17:11:41 -0400
X-MC-Unique: gklkdHnLN76ZBNNBwInzvA-1
X-Mimecast-MFC-AGG-ID: gklkdHnLN76ZBNNBwInzvA_1752181901
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-236725af87fso22667365ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181901; x=1752786701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W339JZdcr7UmhBbOcIPiqXu+Gdd7sYxPv9WXyGXxLMY=;
        b=btsYCi/ZB7HWYOcBGCIngp/c+RrCPoK8e1BhX5UKuhdk5BNzG7yTIb0YCh2wfKHdN2
         T7vYlvH+vfb8lNeKRj1itHW6ZTQDII7P7dsC6SDW1Gx3IospqSN592wI/Q2950mwXdJT
         AtB6U8mMhEhGVw4PTAwY+6u6qDWMjM3CzWe2dPY9UUymiXqLMxY5TdUD8JeFeWQVKRrY
         AO/QGMs91bxTC25xZb9OGKKNeZQ79FwrYJkyyyd0p7LIDcD7l4YuySHHgrJDDGlQj0zB
         O5Vqs5nkeN7JBDC0KTGUg6NiLn2hkt03tk047cIGencW08zDVX5ZbxedRhN48ji6ZLW9
         3HyA==
X-Forwarded-Encrypted: i=1; AJvYcCV4LuEDv0LXRfTG1MifXI+KnVEUJGmhEZKrRGAHcec7ZlgGnxHZnI2m8S4xasg/waq11k8YFsnt4XNdnCkpmBta@lists.infradead.org
X-Gm-Message-State: AOJu0YzJMZI+yLvU3ibmMqKUFbSZCxUyuvknYcauN2nMb5Ba2CDnBJ9V
	nx0oTI0hlerxx+xGP4EK3DWJJyTinoByHaKPppQUh3wsKimJiT4Ga06iFTZkadPwhPtDE1SJRVm
	PdqgbRLCbfkv/4/TI9VufXzpjRUJNwuIhuItWEn1e3oeaujiVe40o+y0JYe46cSjtzYFt4/Pcz3
	Pl
X-Gm-Gg: ASbGnctG2LJKB3A/TN/abphiGOIR14zgpSOAQ+bqatghhw/Rr4Rznl4gI+lsZXKkv2N
	PldXybktIhhj+99xBWMkqlF68KM3/W2LTrPMAoQJgK4S0DVqX8nJlb/XOqhYVl6FpLWLdiS24z3
	Vth3rDPAdqOf/BcrkPYCP4lBv9nNMLHAhxlbxrVZrzlECaawV2sVEEFWOk2mykk0te4zjG/sK/e
	iinLYZCLJnIVNovhULqG2UWtBbTHxb8PFqwrslIzgAJ5eGKVWeoFnR5ldd43LY8BaiKl+4EKyxz
	LFIB1XomkXbtNlYukf0Uk45t3FUNg3537pRqRtHZqaUOxw==
X-Received: by 2002:a17:903:11c8:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-23dede81d32mr8954685ad.31.1752181900872;
        Thu, 10 Jul 2025 14:11:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVxsG4cF9e07o0fMM8SypmofzmmXFkufyYymThzTUMbMJcOt8FiqD1GLXyQH26eIqaxdUn2Q==
X-Received: by 2002:a17:903:11c8:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-23dede81d32mr8954465ad.31.1752181900538;
        Thu, 10 Jul 2025 14:11:40 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:39 -0400
Subject: [PATCH 07/13] clk: imx: frac-pll: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-7-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1965;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=NGioEqdKfaiC6BdH82T/f7jr0ImhDC6mx8MiIxU4MxA=;
 b=vLaVKR/Gomur36zH3CqP5lEgRbRlTdzb1/EbzNsI0+mDIrE5MvniljGNo8RYbLE5lZaLSopai
 jwWqi5WbNQ1DJdufnQA1SGqyhwTLz/HV1JEu8Gcj2ppy3By4Yvi6s/v
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mGBdDTtZNfULLqy3kSpJ74by6Qoii2PY_0wLjVwtGQw_1752181901
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141148_997795_D91C86F9 
X-CRM114-Status: GOOD (  13.11  )
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
 drivers/clk/imx/clk-frac-pll.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/imx/clk-frac-pll.c b/drivers/clk/imx/clk-frac-pll.c
index c703056fae85cca492b2edcfaadab58fd13c6b5a..eb668faaa38fd085f90bd1c01811e0deba5d0102 100644
--- a/drivers/clk/imx/clk-frac-pll.c
+++ b/drivers/clk/imx/clk-frac-pll.c
@@ -119,19 +119,19 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *prate)
+static int clk_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
-	u64 parent_rate = *prate;
+	u64 parent_rate = req->best_parent_rate;
 	u32 divff, divfi;
 	u64 temp64;
 
 	parent_rate *= 8;
-	rate *= 2;
-	temp64 = rate;
+	req->rate *= 2;
+	temp64 = req->rate;
 	do_div(temp64, parent_rate);
 	divfi = temp64;
-	temp64 = rate - divfi * parent_rate;
+	temp64 = req->rate - divfi * parent_rate;
 	temp64 *= PLL_FRAC_DENOM;
 	do_div(temp64, parent_rate);
 	divff = temp64;
@@ -140,9 +140,11 @@ static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	temp64 *= divff;
 	do_div(temp64, PLL_FRAC_DENOM);
 
-	rate = parent_rate * divfi + temp64;
+	req->rate = parent_rate * divfi + temp64;
+
+	req->rate = req->rate / 2;
 
-	return rate / 2;
+	return 0;
 }
 
 /*
@@ -198,7 +200,7 @@ static const struct clk_ops clk_frac_pll_ops = {
 	.unprepare	= clk_pll_unprepare,
 	.is_prepared	= clk_pll_is_prepared,
 	.recalc_rate	= clk_pll_recalc_rate,
-	.round_rate	= clk_pll_round_rate,
+	.determine_rate = clk_pll_determine_rate,
 	.set_rate	= clk_pll_set_rate,
 };
 

-- 
2.50.0


