Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D09C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eec3UsfcgEVhhdwW54XSs3vkceSbxenv80rfbs7M6mU=; b=RrK5qUIVMHWc7uFqw4wmaW1oIC
	dv8OVHxtpHS0OECnwAA8CMpYG9mV8EM054IXKPCWL/MvYy7QOPV0b4jcjTUmqlE3bCgYrsbYiX/Ge
	2ZvG5OvCiy3KF5F0skvykA3VnOvkb/JtOW1U7xdGShMI6TVg9nSv/1l9Blj4Adi2AZY3lzBuPdQ7Z
	9JMeEd12wTOG/cEZkn0RRyD2zn/jCGq3jnZHmPbm2GPSRyGSofOM3XPZclfUeEu6m6g5FdM8hI7rG
	Zv9gvmmuSc2QTNgW/txz3OP93yPLjQoP0/roAs18IG2zkGMRd7aNU2SmbuKHiv+rcHPpbfjaQDXvk
	UNJKsHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q5-0000000DPyj-0E0p;
	Fri, 11 Jul 2025 01:19:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyYl-0000000D2PB-2jMQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eec3UsfcgEVhhdwW54XSs3vkceSbxenv80rfbs7M6mU=;
	b=aMv/vjIe6cc312cTn4nSWw956ZKQjpS8wEDZjeWzK3nJ+NMaqwsVVGZ4ODH/eM5RL516jO
	Bur/6+yqcgSRePHylOi/wDo4R99cLp30s9wWyEQj87PvBtEcntI+L7rOMGuoZzebbLoGGV
	FCv4PsearCX6ZesoDRdd0UIic3B+cuI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-WETaRYyuN_GpHC-tgJlNJg-1; Thu, 10 Jul 2025 17:11:59 -0400
X-MC-Unique: WETaRYyuN_GpHC-tgJlNJg-1
X-Mimecast-MFC-AGG-ID: WETaRYyuN_GpHC-tgJlNJg_1752181919
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2355651d204so13976005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181918; x=1752786718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eec3UsfcgEVhhdwW54XSs3vkceSbxenv80rfbs7M6mU=;
        b=mb6hU2llITztI7JYQZa7JIuMFleJTAQeLmiAHw3E9wYUF8Q4cwD+m+8csREU5T8XSr
         3/BHNkiiksPpRdwTYGgj3kPd+Kc8df6PVsNN65PmEN6khEo6NFnwIQAOhXHr8FaINqDa
         G5O9MJV9Frj3OXN+eUNoyspO2IA9iMllx4TOsVNjuCD6iRztpBo46Ed/dI+SQi/oULVd
         kVxGzvx4DZqqpDSyrfQZorleUxEGpZVJ44r0cdLBvSa+r/EGLNCMQL588jBOGkgeVfN7
         j0EiNevZlFCTklfI8jeK0HHF6SpTQwsZqtyB4peI6oiaNtJk1DqZGU6C1OkY7qXpQFau
         Macg==
X-Forwarded-Encrypted: i=1; AJvYcCW7gONmojQF8dp+2x0to3X6KDkr+1V3jcdSUd7ezVJBK2KsjtMt+0afO6OW0z7yGfxQ2m2JNaFRDtrkboPTS4Zo@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ4uWjqo27yhkga3RTEM5N4C+QbLcfTtt8BNal4BObjfO2DOsN
	GaMqsiFREd2tT/UOVH4uiI2dpy8j8wUvRnYsBob02beBdGQfKTWpgtbqS5njhqPlgteUGxYx5yb
	BVWMpjdvb4R8ZuvcvtgByFXUrCMXeqsdYKBVjt52UjGP2wQW3GH0V5F6mtUItFszOQ2df4rkt3z
	VE
X-Gm-Gg: ASbGnctSMrxUrBZcIJmMIs763PIQGLSUqjS1ZO4SNgvYLwSoT3kBwB96RFpb4Si9nec
	eN3/rSCtgoP31sB7j+iYfrGklQvJ2QbB6yUx/LT+JdD5d5tTZNdhBCI/1HbvqpjFPLQtaljNvHv
	w5KAjf2bUWjyFxXRk4HLk3fyCvheXF7b7HHmiJO/lE4BEJCg1QEdMDKFmBdCVCjqAlJK65e13sR
	7bKo31Vbnt/d0ruomTdppsQtJAq6IuZtXOPLk6jKBXLdGMz3ZceJBweuZQos6SRbcByr8HMJtz0
	MyMe4/FqGnHWvOtiazEk+mk+shsdgcGvbwXXw9+HE+yljg==
X-Received: by 2002:a17:903:7d0:b0:23d:dd63:2cdb with SMTP id d9443c01a7336-23dede396f6mr7862405ad.16.1752181918567;
        Thu, 10 Jul 2025 14:11:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmMHFgZSFsF17fGhsct290lecnQH0glpDdFs3C6QEydqtsPPL9osBYSLMIUTdMcaqaL2jdsQ==
X-Received: by 2002:a17:903:7d0:b0:23d:dd63:2cdb with SMTP id d9443c01a7336-23dede396f6mr7862235ad.16.1752181918207;
        Thu, 10 Jul 2025 14:11:58 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:43 -0400
Subject: [PATCH 11/13] clk: imx: pllv3: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-11-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=6011;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=1Mnzs5hamHNwjD4eoe2Nc0Akysaiis/eMWjsRi17QtU=;
 b=Bn0rholCUM/KYZ+bos9FZIULcmCDJf69FbJGhUfMqhda6v7HWW4+01F8FLLh7G1zCTp5fW4s+
 Pa/glVq7xHrAcqK/CA6g1MuafscKjAGR6zdGyQGptxfaNl1bj9mMzlm
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -r_RELprebXnSopGNgUem3bG3tCFYqXpCEihR9zHwJs_1752181919
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141203_766076_969C3B8F 
X-CRM114-Status: GOOD (  14.15  )
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
 drivers/clk/imx/clk-pllv3.c | 72 +++++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index 11fb238ee8f0ece8116d3d7cebbbb7deaa4aee68..b99508367bcb4d7f3ef12cdbb5f5d5dcbf526c31 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -117,13 +117,14 @@ static unsigned long clk_pllv3_recalc_rate(struct clk_hw *hw,
 	return (div == 1) ? parent_rate * 22 : parent_rate * 20;
 }
 
-static long clk_pllv3_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int clk_pllv3_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
-	unsigned long parent_rate = *prate;
+	unsigned long parent_rate = req->best_parent_rate;
 
-	return (rate >= parent_rate * 22) ? parent_rate * 22 :
-					    parent_rate * 20;
+	req->rate = (req->rate >= parent_rate * 22) ? parent_rate * 22 : parent_rate * 20;
+
+	return 0;
 }
 
 static int clk_pllv3_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -152,7 +153,7 @@ static const struct clk_ops clk_pllv3_ops = {
 	.unprepare	= clk_pllv3_unprepare,
 	.is_prepared	= clk_pllv3_is_prepared,
 	.recalc_rate	= clk_pllv3_recalc_rate,
-	.round_rate	= clk_pllv3_round_rate,
+	.determine_rate = clk_pllv3_determine_rate,
 	.set_rate	= clk_pllv3_set_rate,
 };
 
@@ -165,21 +166,23 @@ static unsigned long clk_pllv3_sys_recalc_rate(struct clk_hw *hw,
 	return parent_rate * div / 2;
 }
 
-static long clk_pllv3_sys_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int clk_pllv3_sys_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	unsigned long parent_rate = *prate;
+	unsigned long parent_rate = req->best_parent_rate;
 	unsigned long min_rate = parent_rate * 54 / 2;
 	unsigned long max_rate = parent_rate * 108 / 2;
 	u32 div;
 
-	if (rate > max_rate)
-		rate = max_rate;
-	else if (rate < min_rate)
-		rate = min_rate;
-	div = rate * 2 / parent_rate;
+	if (req->rate > max_rate)
+		req->rate = max_rate;
+	else if (req->rate < min_rate)
+		req->rate = min_rate;
+	div = req->rate * 2 / parent_rate;
 
-	return parent_rate * div / 2;
+	req->rate = parent_rate * div / 2;
+
+	return 0;
 }
 
 static int clk_pllv3_sys_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -207,7 +210,7 @@ static const struct clk_ops clk_pllv3_sys_ops = {
 	.unprepare	= clk_pllv3_unprepare,
 	.is_prepared	= clk_pllv3_is_prepared,
 	.recalc_rate	= clk_pllv3_sys_recalc_rate,
-	.round_rate	= clk_pllv3_sys_round_rate,
+	.determine_rate = clk_pllv3_sys_determine_rate,
 	.set_rate	= clk_pllv3_sys_set_rate,
 };
 
@@ -226,10 +229,10 @@ static unsigned long clk_pllv3_av_recalc_rate(struct clk_hw *hw,
 	return parent_rate * div + (unsigned long)temp64;
 }
 
-static long clk_pllv3_av_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *prate)
+static int clk_pllv3_av_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	unsigned long parent_rate = *prate;
+	unsigned long parent_rate = req->best_parent_rate;
 	unsigned long min_rate = parent_rate * 27;
 	unsigned long max_rate = parent_rate * 54;
 	u32 div;
@@ -237,16 +240,16 @@ static long clk_pllv3_av_round_rate(struct clk_hw *hw, unsigned long rate,
 	u32 max_mfd = 0x3FFFFFFF;
 	u64 temp64;
 
-	if (rate > max_rate)
-		rate = max_rate;
-	else if (rate < min_rate)
-		rate = min_rate;
+	if (req->rate > max_rate)
+		req->rate = max_rate;
+	else if (req->rate < min_rate)
+		req->rate = min_rate;
 
 	if (parent_rate <= max_mfd)
 		mfd = parent_rate;
 
-	div = rate / parent_rate;
-	temp64 = (u64) (rate - div * parent_rate);
+	div = req->rate / parent_rate;
+	temp64 = (u64) (req->rate - div * parent_rate);
 	temp64 *= mfd;
 	temp64 = div64_ul(temp64, parent_rate);
 	mfn = temp64;
@@ -255,7 +258,9 @@ static long clk_pllv3_av_round_rate(struct clk_hw *hw, unsigned long rate,
 	temp64 *= mfn;
 	do_div(temp64, mfd);
 
-	return parent_rate * div + (unsigned long)temp64;
+	req->rate = parent_rate * div + (unsigned long)temp64;
+
+	return 0;
 }
 
 static int clk_pllv3_av_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -296,7 +301,7 @@ static const struct clk_ops clk_pllv3_av_ops = {
 	.unprepare	= clk_pllv3_unprepare,
 	.is_prepared	= clk_pllv3_is_prepared,
 	.recalc_rate	= clk_pllv3_av_recalc_rate,
-	.round_rate	= clk_pllv3_av_round_rate,
+	.determine_rate = clk_pllv3_av_determine_rate,
 	.set_rate	= clk_pllv3_av_set_rate,
 };
 
@@ -355,12 +360,15 @@ static unsigned long clk_pllv3_vf610_recalc_rate(struct clk_hw *hw,
 	return clk_pllv3_vf610_mf_to_rate(parent_rate, mf);
 }
 
-static long clk_pllv3_vf610_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *prate)
+static int clk_pllv3_vf610_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	struct clk_pllv3_vf610_mf mf = clk_pllv3_vf610_rate_to_mf(*prate, rate);
+	struct clk_pllv3_vf610_mf mf = clk_pllv3_vf610_rate_to_mf(req->best_parent_rate,
+								  req->rate);
+
+	req->rate = clk_pllv3_vf610_mf_to_rate(req->best_parent_rate, mf);
 
-	return clk_pllv3_vf610_mf_to_rate(*prate, mf);
+	return 0;
 }
 
 static int clk_pllv3_vf610_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -389,7 +397,7 @@ static const struct clk_ops clk_pllv3_vf610_ops = {
 	.unprepare	= clk_pllv3_unprepare,
 	.is_prepared	= clk_pllv3_is_prepared,
 	.recalc_rate	= clk_pllv3_vf610_recalc_rate,
-	.round_rate	= clk_pllv3_vf610_round_rate,
+	.determine_rate = clk_pllv3_vf610_determine_rate,
 	.set_rate	= clk_pllv3_vf610_set_rate,
 };
 

-- 
2.50.0


