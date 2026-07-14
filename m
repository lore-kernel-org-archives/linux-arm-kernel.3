Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B73C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 04:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8taiq1gh/0OoOQDBR9j9Bhwzd7P+6aji1UgJtYLJxrs=; b=y7zxCgFaIGJnnUlWNOVyVVtlB2
	Ny7vrKZT0SBeu7/IspvGabX7ruumWbm/wppSHK95Nj5NiJpv5adosHEp5s2vnkmtPq5VUVKRs5og2
	es+uva8CQT6dPjsPIWmAdL1E3cFBYweXDq2ecUF4DoBfPCfSrfIF90E+x36UiRgs2KRy3XgvhflPZ
	wB1lOQ5K3u0yIljYdcgqsPiyPhl0tH4Pz+/wHNNPbv8bag3Qi7YXVRbybyXer6wy0W+kZqBZ4wVzT
	N9HEfPdYxCO4oDa7ya6hbExjqoPzG2NPKHNuPx8ZmsXfWwszhylarZOMPWzilcWGIzjb+h1e65rwI
	OX9qxDXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUlf-0000000AsPk-2MeW;
	Tue, 14 Jul 2026 04:29:15 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUlc-0000000AsOr-4B6z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 04:29:14 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1295306a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 21:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784003352; x=1784608152; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8taiq1gh/0OoOQDBR9j9Bhwzd7P+6aji1UgJtYLJxrs=;
        b=G1j4qTPlmSF3YvCWzJKXMkdXU9ExHtuRMAPFDkmg2lThcfvHCzmcEBIy/KnMEaqPq1
         xBqBZSuqAhIQm1BNnsp4XbiZSM0EIDYR9LfBZvGfiQ0Os/UiV5P7+b47/om8rAo5fo7Y
         XNuu4/e+m3flVwmcw7Qucs2gWAZw1zGpYx0yfOCRkNlHaK2xHoxAAoHOWhEvvIfgMkCh
         4Wb3s/u35XkbO0hah7X6TfXjURuLYQW10SxX1PiVRAsGejI5uj+UI4NhVoviJHFh3cht
         rjfqSkWZm1qZReeEBajkn+bpJQV8fP5IkS6LWYebu6qaZgTZ9o7hu6XhFd21+c43OTuk
         exBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784003352; x=1784608152;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8taiq1gh/0OoOQDBR9j9Bhwzd7P+6aji1UgJtYLJxrs=;
        b=Ym2OXHjJuq4WMPVcDeO+3vv2/vlJj7v0KlLP5DxgTfLpbJOM9GlWaUxqGfCuvSEu/i
         29QBWyk1472EFa2fMnMv5IXAek1icwB+8xZGNzwXi1D1rjxqtjPDLs/fe9TVq8Ud0ift
         3lX+gaAQhOaUFCorUSnzNAqhbDdZi/7saUV4oi0pdcq1FMs4HLJPq5y063HN5MwJOgLT
         tm57JQDFMYsTXU/iXmsODp3HIHZIw3PfIfF1amCy37f0R3dagsU/T8j7XnT833ns6J6H
         +XTIgX6IUzJdAJqP5hAAEUSd8EeGDl8U2PPyzFpNbGOQkWFOVf7CjH8qt1Fb4eaTo4Ex
         O9SA==
X-Forwarded-Encrypted: i=1; AHgh+RoPIVtC2k/M1C0fj1naNwTGByfpauDWveAIfPFP+vj8N+SI56Jb+fmr+y2w1hFREGHW9qG62pnHXVc4AV4/cUy/@lists.infradead.org
X-Gm-Message-State: AOJu0YwX/S/inwqPKsXA33khR4vcT2RZ6L6eqX3461QcEMU/RMHtsq5P
	UgzpPOkSbNSAOZbC9CrLHJ4IprQPRcjd1q0zIdXFJKVinznM2giNrS72LLiHQvdTj9U=
X-Gm-Gg: AfdE7cmVZlYqT6ogg1dxiNqNlmVCBK6SpgP1eQz6AAUu2tu8g7JJHewJv1yvkJxt2ef
	oysnnq0ltZvKWN5EqF+YeJJrHzuyFk2QLslYNkgM761dhukICxVaihQ4Qx3aIF4BQNLeZTlUI0i
	FFfbtxk9KHbQqP0u4hRpNrYos/ck8ZP62s/feV3Qgt7gDNfa29Fs8J5MJIK5+UgxDfM4Jt6Q6oY
	UomczUXOcWFgacYYSRJaq0OclOwMvvNK6CiRg6N10wR2t1j1MGGlPy80j9m8SGEvpYh+ZEFjsny
	MtvJNZ14XX6h+oQcceCcM2uza3H/m8i0UIwEHBvq5dZYxbtnwx0ikKraHefdCJ8DqZnl/19HF4C
	hS8J5MmGJCWWDuRzBz66W2VhbAd+7cBwRSu0poE9fZB2KOo+6px3QzULUbv4ykmvNv4YC2fFf61
	nga/AnXGYsOXt4
X-Received: by 2002:a17:90b:54c4:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-38dc777b804mr11414344a91.21.1784003352088;
        Mon, 13 Jul 2026 21:29:12 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172cba1fsm766340a91.5.2026.07.13.21.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:29:11 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] counter: microchip-tcb-capture: Fix DT channel validation
Date: Tue, 14 Jul 2026 04:29:10 +0000
Message-ID: <20260714042910.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_212913_067407_6A447288 
X-CRM114-Status: GOOD (  13.65  )
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

mchp_tc_probe() reads the devicetree "reg" cell - a u32, per the API
contract of of_property_read_u32_index() - into a signed int, so the
bounds check "channel > 2" fails to reject cell values at or above
0x80000000: reinterpreted as a negative int, they compare below 2 and
pass validation.

A malformed devicetree can therefore drive a negative channel into the
ATMEL_TC_REG() offset arithmetic, making the driver access syscon
regmap offsets outside the TC block's register window, and into the
"t%d_clk" clock-name formatting, where it truncates clk_name (sized
for "t0_clk".."t2_clk").

Declare channel as u32, matching the API contract; the unsigned
comparison then rejects everything except channels 0..2. Adjust the
format specifier to %u accordingly, which also resolves the W=1
warning that exposed the gap:

  microchip-tcb-capture.c:520:56: warning: '%d' directive output may
    be truncated writing between 1 and 11 bytes into a region of size
    6 [-Wformat-truncation=]
  note: directive argument in the range [-2147483648, 2]

No behavior change for well-formed devicetrees: channels 0..2 take
identical paths before and after.

Fixes: 106b104137fd ("counter: Add microchip TCB capture counter")
Assisted-by: Claude:claude-fable-5 [gcc W=1]
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
Note: struct mchp_tc_data's channel[2] member stays int — after this
fix it can only ever hold 0..2, so converting it (and the QDEC-mode
comparisons reading it) would be churn beyond the minimal fix. Happy
to do that conversion as a follow-up if preferred.

 drivers/counter/microchip-tcb-capture.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 19d457ae4c3b..e53a8390756b 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -483,7 +483,7 @@ static int mchp_tc_probe(struct platform_device *pdev)
 	char clk_name[7];
 	struct regmap *regmap;
 	struct clk *clk[3];
-	int channel;
+	u32 channel;
 	int ret, i;
 
 	counter = devm_counter_alloc(&pdev->dev, sizeof(*priv));
@@ -517,7 +517,7 @@ static int mchp_tc_probe(struct platform_device *pdev)
 
 		priv->channel[i] = channel;
 
-		snprintf(clk_name, sizeof(clk_name), "t%d_clk", channel);
+		snprintf(clk_name, sizeof(clk_name), "t%u_clk", channel);
 
 		clk[i] = of_clk_get_by_name(np->parent, clk_name);
 		if (IS_ERR(clk[i])) {

base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
-- 
2.43.0


