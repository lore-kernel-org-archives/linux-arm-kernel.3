Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB52C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 23:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DTxIrdPV4iWneFJR6EUg7IhXT4i8rDJLDvWWCgyO0NI=; b=bSmbyNVPlRksFNQ5bm2cgVUEoC
	we2TVIFw0DtlBywP6ysH9oAmu+FnFViS36NAkMtCnO64ctw0KnDwgsvWSagXcQIlHrM+WDSiE7LyN
	ecXYdAx+CBZD/uURvF+O0l4PZ1Jd/G6j/7Ss0ja9puG4w9KecMphQKstux2qYUexaEiKuhpWkYuK/
	v1iStkW3IaKVBsvGwjVsjrQhMAV0Bj/9Jd7bSIRjvtDqDLdk70TzZ6r/0/ePSRU4L6KYalqDcBGpJ
	8hG5SYa9RlSwYyKKHD4pNtTNn0I0RAHqyHeEcZ87FPIXa3fIhOhZDUyN+rJeN8wBlSP2+9A9fHgCz
	L+SOWN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulFj1-00000006CEv-3Ik7;
	Sun, 10 Aug 2025 23:45:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEQX-000000066LF-2G2t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754864524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DTxIrdPV4iWneFJR6EUg7IhXT4i8rDJLDvWWCgyO0NI=;
	b=WKSwrXw2yhHBMIouI6qOeWCkVgGxMf7vEB6I8ABl4pMikXp8NcUzx4QS3x2n6+UCZBy7mx
	sY+nWYaFQfKSF0x//lAXqUQH5d4JeM3acESKeQje2PflehftExY4X0td8mx3bKsQpLP6c7
	3FiHSdHfcYXdfU8g+JGzKcNfgzcGPIU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-rM93wFnIMnmEQJiLxuGUrA-1; Sun, 10 Aug 2025 18:22:03 -0400
X-MC-Unique: rM93wFnIMnmEQJiLxuGUrA-1
X-Mimecast-MFC-AGG-ID: rM93wFnIMnmEQJiLxuGUrA_1754864522
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b081d742d9so148683531cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754864522; x=1755469322;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTxIrdPV4iWneFJR6EUg7IhXT4i8rDJLDvWWCgyO0NI=;
        b=gGbayYU86QfkSngAQAnQjPFIz6jZ3xGCr0efW5kLGA0Ijz+D91a9jmX5gL3z0nc/M/
         7A2d6sPm/U7kXlDg6Ofh5dRG4kyYB/4IT0E14GrWDUDROFG8J/DIcjjSCGNFe7J6IunE
         f9MNPzIiKbNJ7hJ4um9t4rl61vffsIkARFFIwDAQoFEaHP7YHecakvXebpSGgmjLu/dR
         ZyyB0zd038dInGNY+6pakzX7DPcRct10pd0m1Oa76D2UiJl4uPbu9U1vekP7rNuNDLSH
         jMuNnPupKjKtMZkqsvWiHBGl3tYDFvIcv8HacuqWMKchqcpIoGT1gB4lr5ZEx0Pr+Xjw
         6RQw==
X-Forwarded-Encrypted: i=1; AJvYcCV0fyCMf/3IXdTX1y53GauEk1fhweP/nc8u2PzGqWq5XTjAWXF4zWLknmiffoKvy7mDX09lMl1p3Blt1df8b55F@lists.infradead.org
X-Gm-Message-State: AOJu0YwXkNK0Zx4IYvujfaoIhy94H4xLW3ztkL/h7P/o+l9m2QNvhqoA
	R/z7e1z9zlVODQbnaWgFULps3joI8xuHD6jljbIQx77/uXLTyvAv9rNvFRwTGiCd6zE5w+5tpsh
	ayPcw+zT5BYk9P8ZRKI0OJUS3SYRetEweH/FaVj707SEB0LjxpFkYsSIvVTisI6OsvsbXMKXyfR
	Uj
X-Gm-Gg: ASbGncs52JH586/dfVBM2j4g8BbznfImDostS5w5DTe0AJ0WMWN0W1qRjDGD59lu7hc
	lr3SGBylNUq9Ov29WfGYfoDB2wOsLFCTeDQeT5bGU0aRwuSK/3CQ7WpspENQQcX7gWk/dfs38s6
	a34ptlWwVv2ZUbD7V8WogwL7ibLgWMgwsnLo5oQ51Wn7BmUcP6RphGA3J0nXcV28hFrggijyYBo
	dxoW13BKwcK6mGS6ynhElsdrqjKfeNnFKWQqcSU/xcTo+p/8yU4euXsuh4szymlzk98CdmxROMe
	94p3AEwv/6O9+kbs98/o2+k/3wjQ2exl2aAs5c5y70Fp3CDRYqgda7Y26LKfkcwTaWcR4J4UkMR
	Hs9ERBg==
X-Received: by 2002:ac8:5d0f:0:b0:4b0:8092:9912 with SMTP id d75a77b69052e-4b0aed42512mr175423851cf.19.1754864522404;
        Sun, 10 Aug 2025 15:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0/+zhF0BEbIolaJOCDjorPdn+0fQDWtw+ZQnbIpL+/rhtw0D1XSan+ygZuYsN1eYwat9u9w==
X-Received: by 2002:ac8:5d0f:0:b0:4b0:8092:9912 with SMTP id d75a77b69052e-4b0aed42512mr175423681cf.19.1754864521987;
        Sun, 10 Aug 2025 15:22:01 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e816a9a3cdsm714913185a.23.2025.08.10.15.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:22:01 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:21:51 -0400
Subject: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
X-B4-Tracking: v=1; b=H4sIAH4bmWgC/x3MQQqAIBBA0avErBsorcSuEi1Ep5qNxVgRhHdPW
 r7F/y8kEqYEY/WC0M2J91jQ1hX4zcWVkEMxqEb1jVEWD/KMsl8xoLiTsO/0oK2yhvwApTqEFn7
 +4zTn/AGKlAVXYQAAAA==
X-Change-ID: 20250729-peci-round-rate-543639297ec6
To: Iwona Winiarska <iwona.winiarska@intel.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754864519; l=5809;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=L6jvK6ACaYL1SKlK5QC34DBWw1qmKVlL/yCAWgBC/h0=;
 b=ExfjZ3UpYQJq/TbnRfU0VlhnPXC/BUUDuaJmbmTAojaDwiZAdey0YvI5/J2A7xXNMUS9wkF5N
 vb2GIQ8yHxiAnFyZY8qfOjL4oDD/6ms/NRhowThZjXsoS9w0+utR2C+
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3Wu6B3fFBo22ThAaOON1j_bg8EWd2qf3FxmF6BUVonM_1754864522
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_152205_669186_5E05D296 
X-CRM114-Status: GOOD (  19.73  )
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
 drivers/peci/controller/peci-aspeed.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controller/peci-aspeed.c
index ad3a7d71ed4c61e6123dcbbad264812cb83cbb07..a0c99ecf7f3805a1cdac55a8d5db9c61ad3cf37c 100644
--- a/drivers/peci/controller/peci-aspeed.c
+++ b/drivers/peci/controller/peci-aspeed.c
@@ -362,12 +362,14 @@ static int clk_aspeed_peci_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_aspeed_peci_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int clk_aspeed_peci_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	int div = clk_aspeed_peci_get_div(rate, prate);
+	int div = clk_aspeed_peci_get_div(req->rate, &req->best_parent_rate);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long clk_aspeed_peci_recalc_rate(struct clk_hw *hw, unsigned long prate)
@@ -394,7 +396,7 @@ static unsigned long clk_aspeed_peci_recalc_rate(struct clk_hw *hw, unsigned lon
 
 static const struct clk_ops clk_aspeed_peci_ops = {
 	.set_rate = clk_aspeed_peci_set_rate,
-	.round_rate = clk_aspeed_peci_round_rate,
+	.determine_rate = clk_aspeed_peci_determine_rate,
 	.recalc_rate = clk_aspeed_peci_recalc_rate,
 };
 

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250729-peci-round-rate-543639297ec6

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


