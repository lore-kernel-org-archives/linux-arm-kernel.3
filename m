Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39FAF417E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKRdIQSuF0YF0hFHlaN5osUy3+6J9BqzDRRtNXtYusM=; b=FgkeZCyKzoCl+drHeMYohi2FWy
	2uuBX1OT5+hflEX/rgxiaYt9FaVD5IzgHp/AqUw8uvy0v2fodpBiNuzbwZH2WwBcTgYOB9sbnzijE
	5bCEtw6LrlZRbfSOSPHA29zVmaygMtCejpWCYdOYlleL7zvI5Bt4L4GIHxz6REHIaQnldmJYbeRol
	uwVny18wkAzyaAh2qVkRI7LSBZPKMXWU+lWKtgvtFHN4qJ+3xmwv+ko6IrJ4LF8bq1rHUFC/dzwmi
	+4BORaBWCWb7bZvEWHSVO0hqoB+9ofFa5SL8A2t/DVVtEJ4m/VJQSa6OSgvtbMFy4spYhLoIBHRIH
	195rBxFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzble-00000007UX5-1rWL;
	Mon, 09 Mar 2026 14:39:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzblb-00000007UVA-1Tdg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 14:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKRdIQSuF0YF0hFHlaN5osUy3+6J9BqzDRRtNXtYusM=;
	b=ZE7UZBGPKD+sCWlT4D1+hJWPF3rk0Ka13UI+m4G4DuRP3DHMv08DLs2uOtgrTXezLPV5ad
	ht2Zr2Uwvm9Z98IUZuzzvZmvRvW44OOWEQaxfVbfF6L2SIIT2+4Ly6iUOvgglCWYJHjbKt
	3qP12pEH8scOw7kKzn0Xad7hAc3bSzY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-I8EBl9_ON7Grk67GHSiiwQ-1; Mon, 09 Mar 2026 10:39:29 -0400
X-MC-Unique: I8EBl9_ON7Grk67GHSiiwQ-1
X-Mimecast-MFC-AGG-ID: I8EBl9_ON7Grk67GHSiiwQ_1773067169
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7f6ac239so957881485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 07:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067169; x=1773671969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TKRdIQSuF0YF0hFHlaN5osUy3+6J9BqzDRRtNXtYusM=;
        b=ayMgbBN7bDV3j0R00I/312oZoJ90jRVFXst55KXoX/MTiiLIgLNPvznKGyENqE34fy
         qEbWRZkSxd6BwP3TbsQX1IYgz51k0QNWR3TsfOPG4FEvfhoVtHh1iMDaRPoZYC6LYDE6
         Vj0qCf8FqCOQ8NlkHBRaOF4maeAEV4tB0lZ2B+/jwjnhoY7y8gtoBKnC3nNBObjmeIJ2
         2PaggGVajTSbzCzv+INbt+CgN972bZ31hjZ94LG0hpevkoQ+duW4cx+KGCcnRRdDOmuB
         thooz9XH5HwfdEpTfJ+HpQbHNxf5eBLV7SA6fFqqdvuMPkhEZmIGVaNUuhmQ3iEjyMeK
         8Vtw==
X-Forwarded-Encrypted: i=1; AJvYcCXBN7Ipxebzvjd+MqpUvFQcaIJ+c84eA6+4jEKP3TBCcy+BaBXVZGuugxNoS9I/OuYzgYB9YEwOb6LGVvymwTNq@lists.infradead.org
X-Gm-Message-State: AOJu0YxBR+Zyl/TYOjdYMDoupGfJaPKUfS9bQ0Q/SXk/h5SZ0TbZP8BI
	D5rLzwlExFeUAvi0ks96x2/hHSwjefs3hh/jCU786U7hk23ij/UqHJCVqFOfq5k23UByL/6Hkca
	iC/NWhQ68K11SM0WSrz7C1Nvb4SmosznMuA6VMfihwxIa0wlEJWeidrFvm8kXc0eRkCZv6d4mld
	0L
X-Gm-Gg: ATEYQzy/0H2CRM0mIKJOYs368PO1+ZoXcI0Ma7cNnfAsiLJUsSox60T4ArLG88IIu5W
	zyyG9yMFP6wutVRM/v9lXk9eWoLOydPv2keW/48AIZOCp9v1Fs12dMd06SZ+bewEwS6f/H4HeAv
	KkvkKkkUC9gcBChlJ1R/S3gQ0PI/ontutwSzAe1+0+9++/yGe/fMdQXeNiwxujcEiq8QZEZZXNJ
	wov39awiG3OtSMVg+lMyw54napi+wUxMqWqp9LjWLLXAQmgHm7iBAcgAoCtvNIuSf7n2R5RrW+0
	+ICWtQ7sZAIpx3r2gGDWnrHOpA4yl9rn4eh4mZssRNnDBUis3DlkLT+So7zAzrb+TXqyWcBGH9Y
	ij03ZC2EJbCfXpnchkWIE8LXVfptfqpQ2drcxoY6UOjmVtfCUaz6P4Vz7jyFEmg==
X-Received: by 2002:a05:620a:3726:b0:8cd:91f5:7a10 with SMTP id af79cd13be357-8cd91f57b74mr118055485a.82.1773067168706;
        Mon, 09 Mar 2026 07:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:3726:b0:8cd:91f5:7a10 with SMTP id af79cd13be357-8cd91f57b74mr118051085a.82.1773067168174;
        Mon, 09 Mar 2026 07:39:28 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:43 -0400
Subject: [PATCH v2 04/12] clk: scpi: drop determine_rate op and use
 CLK_ROUNDING_NOOP flag
MIME-Version: 1.0
Message-Id: <20260309-clk-det-rate-fw-managed-v2-4-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=tymwA6aOVgvpUXCdRW570073ObBEekDbhvu93ohwWbM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3e7f+/+TCVedu1DA7rYTEY2FXtOcK9p1t8meYGKJ2
 n9KUbGro5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkUBzP8zwtgvM55yW21VvxW
 OyX2HX1rfHZu1pnevWm2S/f73nruSEaGSbcXxbmu3RHcpZyvUcPbfzpy2UenzFkTc27vK9mxVvU
 mIwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5_yk2Kmx0aIUKGBPNSoOrgsXb1xJYV6o-ay0UyWM_A0_1773067169
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_073931_486124_9A3FF2C7 
X-CRM114-Status: GOOD (  15.29  )
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

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-scpi.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 7806569cd0d5c4e32700edb10e4edf2185610a81..f5d0234ad4ad77e4333613139a8ee034b949d01f 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -32,18 +32,6 @@ static unsigned long scpi_clk_recalc_rate(struct clk_hw *hw,
 	return clk->scpi_ops->clk_get_val(clk->id);
 }
 
-static int scpi_clk_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	/*
-	 * We can't figure out what rate it will be, so just return the
-	 * rate back to the caller. scpi_clk_recalc_rate() will be called
-	 * after the rate is set and we'll know what rate the clock is
-	 * running at then.
-	 */
-	return 0;
-}
-
 static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate)
 {
@@ -54,7 +42,6 @@ static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops scpi_clk_ops = {
 	.recalc_rate = scpi_clk_recalc_rate,
-	.determine_rate = scpi_clk_determine_rate,
 	.set_rate = scpi_clk_set_rate,
 };
 
@@ -156,6 +143,7 @@ scpi_clk_ops_init(struct device *dev, const struct of_device_id *match,
 		if (IS_ERR(sclk->info))
 			return PTR_ERR(sclk->info);
 	} else if (init.ops == &scpi_clk_ops) {
+		init.flags |= CLK_ROUNDING_NOOP;
 		if (sclk->scpi_ops->clk_get_range(sclk->id, &min, &max) || !max)
 			return -EINVAL;
 	} else {

-- 
2.53.0


