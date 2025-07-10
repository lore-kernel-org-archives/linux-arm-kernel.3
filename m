Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E9BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+vFXF+6sAs+f0qJzoysFGKJfCbzyDXKLN+W95anZkc=; b=4RI69pvX/sStOCdq+kTgJAdtUi
	JC3URpCHR1yZ2fklk2wY5QSL3czxddfFmPABFPw3t8ikRLuBoLP71fapWrRMIls1qJW+98QeMFliU
	Ilf2BGObVOtqQLbJmhoULlmHRAYbOZWkcCZYC8fJ+fAtwXWuPc+71VZBC4Lnc6zy3Az0H175JHgRn
	17bpjJGiihb23FshUMARkDQO0ZuxNCm/scP5Rl9olWTEp+pfbFkV4X0TEIjVw06sVHPF08Kwd9yIt
	wGqzcA7TQ8qlPpN6diPrCxwb/Fv4kmVQn8ZvUuQ1auoRwTV30vUyK4vmoAM12KpW1WA9mZwlBA3Bi
	OdLOwVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2RT-0000000DRyZ-31OB;
	Fri, 11 Jul 2025 01:20:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0uT-0000000DInF-3A1v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 23:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752190956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+vFXF+6sAs+f0qJzoysFGKJfCbzyDXKLN+W95anZkc=;
	b=i64FZEJhXjGvXhvXLvzkdKrU6uCY2hCWbUdiQiI7LrYJo3zQAc/t4hPXMMLMlrXj683rKG
	NOul4WVh9h8Yv1st91sOe+T/IZQpR7M7EwQrfi1cIyahY9m7w6T6nyb+F52Y9reoc+Owkx
	iwJqFS/a6KL+ejnTE4mO/L70pv6CVFs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-BmQnEqUOPnGfeIvqGVUcMA-1; Thu, 10 Jul 2025 19:42:35 -0400
X-MC-Unique: BmQnEqUOPnGfeIvqGVUcMA-1
X-Mimecast-MFC-AGG-ID: BmQnEqUOPnGfeIvqGVUcMA_1752190955
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7048ed0751fso30478816d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752190955; x=1752795755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+vFXF+6sAs+f0qJzoysFGKJfCbzyDXKLN+W95anZkc=;
        b=G/xINCmrQequwPrcpEstwyJifWwcA9/1jE8awrmmGh/cZrI2+s/7esjOyqGA6XabdI
         9jwNX2vmLWHnW+2LwwNFL2vTIuIl5KWWeGDWpw9arPF6gshrlzpN9RbWL02+KGP3UfbM
         RwhAynZHi6AqjdhHJnK5eCwHdXpke3ooGwWwfLptDdVO7njI7IpmvKtUk98GgtTh9bP5
         MeY3W/kGl3TEXS3diR3m0gK0Luq7HK9+sMKLeAWpQHmyhHACmdeGVRNvL8Zy3myFQkWR
         WeaiTQIqKPk+RO2+Uh5PJk6mMcJ2RJaRmqlSjcXU2nrWQJ7lV0bw79oEfoRnKK9G4qkK
         GnTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4cCwEzXEZr7H0/Ndd07HqibfgUjeTThCl2jwDSrQGymlCnCjfHe9SI9wK6HAQhUxDRZ2voi+wAj77Hr2TdVna@lists.infradead.org
X-Gm-Message-State: AOJu0YxhZ7C0ZThvuPHH48MLF4xw56gFbhqWCilmdwjzffIdgkEyqXQn
	cDRSq8b2dS6MM7mXINaRt8bkRsB3WI0SnnbJhHpFgMb4qRk3RnMgXWiBeorNNHq7JCXhF9vjBTG
	k0OeqyyilQI/9sz64zaC5/+7zXhukXF0Kqr1aTC+WcpTjGWRCXpfNQspxcUl/+v8gBMrTaXIqHP
	Rq
X-Gm-Gg: ASbGncuPzDUZoad3QyLBBBSuAwstYZJb3RZF8jHEV2AeKd4M1tCa5WI1+ShrLXEuSII
	pOiii+RlO9NhMDhe8d2XR8eOJCd+a6O/PxKk1QsA7V9GImkVI5gwz39NGZEN0/XZqzGbKv7mGIo
	ENsKmThYrwHNc+D2jC6g0EAvuWeWypckw90ivhJGjD73eHUYheNXXeX8syYG5ZpxiyxNY0YN0ep
	00nGUSPnhynOw2u9XouNrmnEalYs7wZjI9hallD1ooPJbFmLlgyzP+8YcgAq5nfjXZYtnf/S9ys
	a9z17v+vKRucmkxsTgYYS0kWXn3093AzCOtTD/5/BN6q4/TWKvOiVvSQkGwpUbCSBjcfudrzkR1
	uodo=
X-Received: by 2002:a05:6214:2b0f:b0:6fa:ab49:4482 with SMTP id 6a1803df08f44-704a39c69b2mr21404246d6.35.1752190955046;
        Thu, 10 Jul 2025 16:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFumn70XFYKB3ncuCZuDvnrY3eq7TQ8pExUAVWgvlsUQZnKHPa4PRg6OW5Hg6N9pNtleWcQuQ==
X-Received: by 2002:a05:6214:2b0f:b0:6fa:ab49:4482 with SMTP id 6a1803df08f44-704a39c69b2mr21403936d6.35.1752190954732;
        Thu, 10 Jul 2025 16:42:34 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422e03sm153989385a.69.2025.07.10.16.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:42:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 19:42:16 -0400
Subject: [PATCH 1/3] ARM: OMAP1: clock: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-arm32-clk-round-rate-v1-1-a9146b77aca9@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752190949; l=2053;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Mg6lKUg0ZmZeW6JyF1mVcF9O9A9v/XbSlh+3Q+sOozQ=;
 b=ov92GEq3BT5OONUOsWz17TkRNeO7aRt0ZTlbqbGGEi2UetR1fyivK2G2OnOxYZ6sBy6ucti7a
 gdJoDFLK4SjCrEBjFyAn/syo/iDX4IRPGYT5L0Z4Z0c9YriPb7H9LJX
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lJntwrRzRSYqGUcqcaHKK1Ofh4ryTAjYbtNIYqYbMzU_1752190955
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_164237_867159_28296502 
X-CRM114-Status: GOOD (  15.46  )
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
 arch/arm/mach-omap1/clock.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index 83381e23fab983522ca01b8feffb861b02fee730..afc6404f62d39c4ddbac6f1ee04d889be6c47186 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -705,14 +705,21 @@ static unsigned long omap1_clk_recalc_rate(struct clk_hw *hw, unsigned long p_ra
 	return clk->rate;
 }
 
-static long omap1_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *p_rate)
+static int omap1_clk_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct omap1_clk *clk = to_omap1_clk(hw);
 
-	if (clk->round_rate != NULL)
-		return clk->round_rate(clk, rate, p_rate);
+	if (clk->round_rate != NULL) {
+		req->rate = clk->round_rate(clk, req->rate,
+					    &req->best_parent_rate);
 
-	return omap1_clk_recalc_rate(hw, *p_rate);
+		return 0;
+	}
+
+	req->rate = omap1_clk_recalc_rate(hw, req->best_parent_rate);
+
+	return 0;
 }
 
 static int omap1_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long p_rate)
@@ -771,7 +778,7 @@ const struct clk_ops omap1_clk_gate_ops = {
 
 const struct clk_ops omap1_clk_rate_ops = {
 	.recalc_rate	= omap1_clk_recalc_rate,
-	.round_rate	= omap1_clk_round_rate,
+	.determine_rate = omap1_clk_determine_rate,
 	.set_rate	= omap1_clk_set_rate,
 	.init		= omap1_clk_init_op,
 };
@@ -784,7 +791,7 @@ const struct clk_ops omap1_clk_full_ops = {
 	.disable_unused	= omap1_clk_disable_unused,
 #endif
 	.recalc_rate	= omap1_clk_recalc_rate,
-	.round_rate	= omap1_clk_round_rate,
+	.determine_rate = omap1_clk_determine_rate,
 	.set_rate	= omap1_clk_set_rate,
 	.init		= omap1_clk_init_op,
 };

-- 
2.50.0


