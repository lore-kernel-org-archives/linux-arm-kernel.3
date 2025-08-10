Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2A0C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dJb7rUsTB9SkaGqYqp/qaoDTrI+nSvgfo1YbIvP11Sw=; b=M32lnNckrVdYiuuxdJIifJvK5j
	Lfd6jdIRPWriZu/k9cVr1S21OqempM8lwc4JoH7GtJGH4c2UiLiz1gY5CS4vLx7BAaESh6ElXLV7q
	sBUmdzyJdxdOrq2PxVPzPQN+s7xNnc8OdbYFTu0eUYY/mT+YrgnCeWwpO0IW2EXCQ6xYJXiVekBB1
	2/sdcY7bGQGNfbaRIv9QsO8/gv2Alhh01dzaYanu5CKCfNVZkGW9IGgq/ZlAjwGUqbXUy8iAIbJ/J
	t8kThpStKzmnhsJ2T6S5Zlj3xaYKiDo48BqAbI7rJEdxOqe2TUezbFY7cadyAOvtO6zoV6S0jqwD5
	gJBKWM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEee-000000067Qo-3QoQ;
	Sun, 10 Aug 2025 22:36:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEak-000000067D4-0xhG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754865157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dJb7rUsTB9SkaGqYqp/qaoDTrI+nSvgfo1YbIvP11Sw=;
	b=HpT1zlRWbCwIgCzW1yFez6cFBBjOL6CszpaOQyZoruyzjPtfO09oxp11SIoV6EdGv/6ae4
	uglYQhFaBDt+Apb502b9iCFprm/hRF1yM7snn4Fjt9koKToKXVNJwthj0cQy/xUMNa7e5g
	4HTMLBcXndJ+uqvr0YckZGy2tAftD9g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-zPK3Jkk3Mv-swYXQWG0DeQ-1; Sun, 10 Aug 2025 18:32:35 -0400
X-MC-Unique: zPK3Jkk3Mv-swYXQWG0DeQ-1
X-Mimecast-MFC-AGG-ID: zPK3Jkk3Mv-swYXQWG0DeQ_1754865155
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e809830338so1312323785a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865155; x=1755469955;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJb7rUsTB9SkaGqYqp/qaoDTrI+nSvgfo1YbIvP11Sw=;
        b=Jd867eAam1661eImUQwuL4Oq2xjQQpQglSHgD41KYJmem/bBC55Ktqr7AsUOE6h38A
         ZRSmAVwMOYnJ7QEBJiULYizL7ZD41nk3kvVurL6EAXkOkgOmlh8ellte+NF/VOGM6yX9
         ph0/7CvksMenQ1V6TNQFne+JvVJaG/fMim+XFoVakp3jo1i/YHB9B6MRB+EuM1tsKLWJ
         pMpVOZBPJU6F63CvGN/97S9eR7Kem+DgdNLgf40jtE8Z1sI7zgVmVq7ew8g8uJm9etlI
         yW/4ekzfS7WNlZkZq/8MxdxaAyhlKcAD/r+eKECyTWLF599bZM1TbChYRs8l2m5t67Be
         Oz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8j5wt6QYiUdf0AjazNKQFIpdghlwNXiauxG3ozZkzddivdD5zc0g2BU5YieR79VX+XOXnyMqWZ+afaWy3/3Q0@lists.infradead.org
X-Gm-Message-State: AOJu0YzZwpwT4uwfVz+S26JL0Tbk6qRBu85XDC+/E6puGXz3Wc/7d5Vo
	84ln3Pyo9PdEfUqA8+zP58G5S7+JzIr+Jk6WLdz9Iry+gn8Qs+TxTvffnycLUrb0Sa2hMj147kf
	7q8B+Q50gpO6RM3wn6vTxdzlaCzObV2kux6tRo3AfvCa7xyKIZQlTrVRk41VEy+WAfPvK8Z3QQ2
	u4
X-Gm-Gg: ASbGncuhnau6hc4JlskDyL98LMe/tCg62t2oNycnk5sE6eo2jF7wcTVJRlhuYE2eyso
	1HdlM2+wQwZOQS6Ot73df83GQ2y4gpyrMGgKYq/MP5/r2S/cuz1uFSsfWIoEPkn7dS1s8X86ZrI
	XG+zA25HwPVHuudNL7/LdjWeGMkV+U1lQqzY3en8YYQEtJQAwRhiBp+PcbV36bzGZd9y4eT4F8Z
	eRFDKDMmhzobkpUOAU0+27AiwE5yHppiIo9eDgkYrPvsBu7Zv2evwXASlCLSyWF4YJvv45TMMb2
	8UV2DvK3f+5X/YQ2/TMV8QSYQtwq0miGHXpV+KI1E/EpW0uHu16CUAG0mjV4nZfk2JFhGkNy2zn
	WtGKdXw==
X-Received: by 2002:a05:620a:3703:b0:7e8:38ca:c499 with SMTP id af79cd13be357-7e838cac80fmr1065028685a.25.1754865155281;
        Sun, 10 Aug 2025 15:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSoqXWkVNdaecquXdS5RU3KxC5LuRgDn6mt5MAfNv86tnPuYxMv4lQllMkbIfhq0YBrZt9fw==
X-Received: by 2002:a05:620a:3703:b0:7e8:38ca:c499 with SMTP id af79cd13be357-7e838cac80fmr1065025585a.25.1754865154831;
        Sun, 10 Aug 2025 15:32:34 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e8040a9154sm966989685a.70.2025.08.10.15.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:32:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:32:18 -0400
Subject: [PATCH] i2c: busses: bcm2835: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com>
X-B4-Tracking: v=1; b=H4sIAPEdmWgC/x3MQQqAIBBA0avIrBtIRaKuEi1Ex5qNxVgRhHdPW
 r7F/y8UEqYCk3pB6ObCe27QnYKw+bwScmwG0xvXD2ZENgFlv3JE8SehtoO1ziedfIQWHUKJn38
 4L7V+otXBD2AAAAA=
X-Change-ID: 20250729-i2c-round-rate-137335af1fad
To: Andi Shyti <andi.shyti@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865151; l=5778;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=A9FV1U7CIAy2NMAbPMRyp4dSSbe66HlO+3+lB1waQDc=;
 b=/yTjwc3Hxiz4RhGMiIAb0N96c39PAyq5ltU0bkKcG+K4lHu3Hjn8KL9T1K+zvEXEwQTGuSUPS
 BGS1TacP1ylAqIILUY1oeqj6YDPbvJxC1+0OF/qIqCZOc1U51EKur87
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JeSqw_mE6cCtfC5R3DDEBOT3MzVFhszn1z3T2x9vY_4_1754865155
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_153238_353691_9FC25948 
X-CRM114-Status: GOOD (  19.94  )
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
appended to the "under-the-cut" portion of the patch.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Coccinelle semantic patch is below. It's large and I don't want to
pollute the kernel changelog with the same code hundreds of times,
so that's why it's included under the cut. For subsystems with more
than one patch, I've included it on the cover letter.

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/
---
 drivers/i2c/busses/i2c-bcm2835.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 8554e790f8e36c5a1cf56c0aab8556b377f2bbdf..0d7e2654a534e92a529f27fdc049812359678522 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -137,12 +137,14 @@ static int clk_bcm2835_i2c_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_bcm2835_i2c_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int clk_bcm2835_i2c_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	u32 divider = clk_bcm2835_i2c_calc_divider(rate, *parent_rate);
+	u32 divider = clk_bcm2835_i2c_calc_divider(req->rate, req->best_parent_rate);
 
-	return DIV_ROUND_UP(*parent_rate, divider);
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, divider);
+
+	return 0;
 }
 
 static unsigned long clk_bcm2835_i2c_recalc_rate(struct clk_hw *hw,
@@ -156,7 +158,7 @@ static unsigned long clk_bcm2835_i2c_recalc_rate(struct clk_hw *hw,
 
 static const struct clk_ops clk_bcm2835_i2c_ops = {
 	.set_rate = clk_bcm2835_i2c_set_rate,
-	.round_rate = clk_bcm2835_i2c_round_rate,
+	.determine_rate = clk_bcm2835_i2c_determine_rate,
 	.recalc_rate = clk_bcm2835_i2c_recalc_rate,
 };
 

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250729-i2c-round-rate-137335af1fad

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


