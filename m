Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7BFC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkRmxVF+/QlkSCwSzc3e+U7MwnOjoOleG/kQ/my/S6I=; b=SQhnzZWWRTBA0Dh5PbxiwM306k
	gaCf+D6jvUv4QOQLy5jFWEcMZn8Id/RyEBtivwjiibY23tBXA2bAf5sob/tfehsBUuQ9qp4k4zkf8
	Y1D4wQQVy3bPNcwxdfLjDOEX08vj85GN+3dTzLJywy4oYAeD+jd4IEoskwHbjeSrZmvCFKK+ONmhS
	hv/A/FhjkdZDItFwEOl9A+y8We+rA1N1ukNK2wctjRbE9pBhnGuoJr/6iHCJNpC1TB7KzLVaugVTC
	fnlrQ+y0VKMzcVw9JPY7W/Yb2a9Yoq+Jcn8/wk2CViO0zJYyXxW53z/OYWF96vQJnYSkMaTpTgWX0
	RHR6L3LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q0-0000000DPvB-1fjE;
	Fri, 11 Jul 2025 01:19:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyYB-0000000D2FR-3iw3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkRmxVF+/QlkSCwSzc3e+U7MwnOjoOleG/kQ/my/S6I=;
	b=BQoDoCa5NKXePxcDt4YRVOFT49fPXKyPpRcLSCXLPLcxJKAaDzdXE+rCbxcV7vufnWAJgR
	uN9NH4Xcc+esIoecieQuy2ggCC423YAd1cxk5rlYOJcZV/POib2RQ+TKk4y86iXfCoi9sH
	8ae+9xgpJLzM74KsnV6KvBUux5tQDKM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-ZGVofI8UOk2ec6Iyez9wkw-1; Thu, 10 Jul 2025 17:11:25 -0400
X-MC-Unique: ZGVofI8UOk2ec6Iyez9wkw-1
X-Mimecast-MFC-AGG-ID: ZGVofI8UOk2ec6Iyez9wkw_1752181884
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235e1d70d67so14016905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181884; x=1752786684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkRmxVF+/QlkSCwSzc3e+U7MwnOjoOleG/kQ/my/S6I=;
        b=cCXCriJQ6dEdtWW4oym1mr3ic/SdWRKkLbdrEYDI9oaPRSfT32IlBpJvVo1BqTo+G+
         JVHLw0unjEaqU05YmECEON+4Pqt7NCVbb389awh9DuLzuYlXr7dCRk1OuhuwOX1zbDRn
         ainb7RKR6kDRV+Crf+wuySLIXKJv0KcZTqJfxYJctTfuZNX1GtSdJWGxkCH468977DG9
         6v/f71Ewj/z7BvGdjiRTR7F3N5E/fQfMN1LFehLMqSxs8m/j0qsKgWoz1Zi3mj4BvlOb
         UWi5/tQcaWZOM+MNCqknkqj6sU8Pyyuu3i/jGpbMRfytkxzXf/Idgz1B7PdT9VJfVcBS
         415Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcWB2thNg7hqIYgTwUgRS7vHt3L5j9WoxKVNvTyvmYfu2dA55UgABQt6waHVAI3jtlHYm3/ifuKAUr0nVFdwBe@lists.infradead.org
X-Gm-Message-State: AOJu0YwrXClwYDrSwJR08kGeBQUqh0W2P2mfpDX5ipBkCGow+y5TbO5j
	6atBk27dNHGUAveywbPKaSLnkw4Iduily8fVCVnBP0RJs5Pc6uoukGvAVJALzZFCdHYs+l2PIHc
	xDEhNDKIecIMZMKzKjUHABXT3+jQjfr+amYnfYa1crUK5QTgG8a/5GGDuwRbw6wHcW8cC+Kqqh1
	2a
X-Gm-Gg: ASbGnctDkN3vDMjVjuz5nlqOLI6Tk1m2mIp9Xwb/eGdz9VUshTKnBBtlq5KY5C+6XmC
	Xql1xP9cUz+SV1X1QYelQp6tzTKj8Y6M1E1/lcVR5d/r8X39QF/l9HoHDmbz1xWvDZkCK2j/aOq
	eCg4FiroBotPveT9kQP33ZtXuqFY1IdwpcD+0UoUtdVBFgOCEpIoHNXFGeSh+TJsJNIA1OeGaUy
	JdYGJPcIN6VD3NIYNT/7jpOU8vFOaEQEMUAjYErNj+MibWX3QYQNn9z7sFpqn42VaHYZp4yqk7H
	vOYIr1ukw4tk3JSab9O0MF08zt+K6+QvPiubxu8eweqxTA==
X-Received: by 2002:a17:903:40c6:b0:235:f70:fd37 with SMTP id d9443c01a7336-23dee204614mr8506705ad.19.1752181883918;
        Thu, 10 Jul 2025 14:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlNa2UCk5k7FTMLWvw6UQJNvfPCttMnQwWDAo/7rPurjR8kL9UheWUSDb7RYnWa9zSSn9KGA==
X-Received: by 2002:a17:903:40c6:b0:235:f70:fd37 with SMTP id d9443c01a7336-23dee204614mr8506465ad.19.1752181883603;
        Thu, 10 Jul 2025 14:11:23 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:35 -0400
Subject: [PATCH 03/13] clk: imx: busy: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-3-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1695;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=lPrXiqoaFyoeQgppqZyKjenf8NouReQ9MLOykK27dRU=;
 b=ciEnG1A2klaYkTSHYFvVaoRa/pN2wjKv7PEVsBTn7Kp+Jk8Ywliy431QYRxSaXvfJ65Sw7ubU
 j/w9HsVKxwvCcqSklIqFbpTvivNQM65pYXU2jaE1sXWg+NoqQfSRPs6
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VlAjqIrAbfLLHP-U3KArKuhX9KfJg5yWOVDFEZD4qco_1752181884
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141128_001181_EF743C2B 
X-CRM114-Status: GOOD (  13.09  )
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

The change to call busy->div_ops->determine_rate() instead of
busy->div_ops->round_rate() was done by hand.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-busy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-busy.c b/drivers/clk/imx/clk-busy.c
index f163df952ccc65baf300b62048f4303b0050fd75..eb27c6fee359d12eea8381cda981eab650ddcd50 100644
--- a/drivers/clk/imx/clk-busy.c
+++ b/drivers/clk/imx/clk-busy.c
@@ -46,12 +46,12 @@ static unsigned long clk_busy_divider_recalc_rate(struct clk_hw *hw,
 	return busy->div_ops->recalc_rate(&busy->div.hw, parent_rate);
 }
 
-static long clk_busy_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *prate)
+static int clk_busy_divider_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct clk_busy_divider *busy = to_clk_busy_divider(hw);
 
-	return busy->div_ops->round_rate(&busy->div.hw, rate, prate);
+	return busy->div_ops->determine_rate(&busy->div.hw, req);
 }
 
 static int clk_busy_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -69,7 +69,7 @@ static int clk_busy_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_busy_divider_ops = {
 	.recalc_rate = clk_busy_divider_recalc_rate,
-	.round_rate = clk_busy_divider_round_rate,
+	.determine_rate = clk_busy_divider_determine_rate,
 	.set_rate = clk_busy_divider_set_rate,
 };
 

-- 
2.50.0


