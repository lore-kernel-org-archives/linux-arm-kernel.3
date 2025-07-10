Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE37BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zz6/HNpI1gHN4fAaBunmqYHsn5vtfJJ4CRMBCE1FAzE=; b=xP4uL8l26KNqm6di8plSrkre7Q
	HENWOzwK+43UT2xDNijTtcZ66SgW4jV8I04WZdSA1myKAQbVh+XI3HUX3lsf7jiq05Mq+lXeQcZl9
	kiKUy+uuwZEY5Vq4A1i1o3555CAtcw7KOeDxRC0QOIiAnzKWqdoiF7nFdnwsAb+5Q84yFo91xSFtr
	y5/GVErphkve+sc9Fcm7ZiRFGaQ5CKA8xDWgw3gsy4c3w2/vuiQSol0ruROUEHYhSQ0HI+uRYRSc4
	g3mC8cwIuUF0l+6Aazf2PcqvBnqxEevOUvJdjpOo3X20dCeLvFQhyorZNAJXTu84EebAYJaeKs+rz
	cpZKkNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q0-0000000DPvG-3t8F;
	Fri, 11 Jul 2025 01:19:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyYG-0000000D2GR-0zDG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zz6/HNpI1gHN4fAaBunmqYHsn5vtfJJ4CRMBCE1FAzE=;
	b=i0ABL9+Pog1jTY1TOTLW+CJr43Su+9LZCq868rPGXnu0P5RolFt8OTI4Z1LDr4nsjwwi1U
	d/IOZ3HtYaMByGBoFVEOUrrQ9oTVUg5tHzg+OAGoAn8BALrYIyuOwxQdov/I5IAfKYx2OZ
	YnDeU/6WVYwqycIsyFojjh8+U1q9qU8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-SivrT9MsNi69l5cp5VRrEQ-1; Thu, 10 Jul 2025 17:11:30 -0400
X-MC-Unique: SivrT9MsNi69l5cp5VRrEQ-1
X-Mimecast-MFC-AGG-ID: SivrT9MsNi69l5cp5VRrEQ_1752181889
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23689228a7fso20492905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181889; x=1752786689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz6/HNpI1gHN4fAaBunmqYHsn5vtfJJ4CRMBCE1FAzE=;
        b=GMrYIuA1tvNKaJVd2xxw2RgZrgH6Mhx/JkUrGgKCzuwbLuQAmb1IMH7B6qpLaC4Fdu
         /0+2rdsIkb6twgrjqZWr4NhgiUQoKbcEpqnylNONq59+0tvBQeqdKnLQuQJReMC0wQAH
         JRgEg1NOvfR3WC8z+j4a5shXtVUWSQyHpjTRpO826JCkRbEEtyTR9EoX6FeOqC7sPwhC
         ODRUX/ZDoDTCP15Fv/5kfN9hPICkRWhHY0JIe2qPGUQfoYpIUaYyw0+s9DNpYXKlRj7k
         6h5EnYiJDf22SQhqJFEqJvb1y4I/q1YTO45cp4HcllJfMZ8BiGKOYNm0J2LkKRc96Vkw
         h7Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWmfWKILkuLhKEHAlTPkKcVpdJogrSABx57CChmt5FiBSs/gR/XGjjry2Sn3QmaMcHz5qVE+ZArlPuhL850Sz2N@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb1STpj/0mzKyIGww+hDHqhgXFXoc+qLgLCVhkAp2oLm+Oqhz6
	sG5XMuzP0tMU8OtY3lrxJfY5oBrqObBND8DfNKxYZMKmITQ7mr3AC0qn8my5KkPVq8Gx1LapcrE
	a70aRiiWkuOK0BIFPRqfNrEm7PR76PFxUymxkgfWtEp4rvoJEEojwlua6Oi9FnpkP0+xmk3h8i/
	Uf
X-Gm-Gg: ASbGncu8LM0LAGbPbfTNJd9iZsWVfv4EWNFopGyKZS72IUVSMvIG1Nhtr83SrkWeQvb
	qhwq4l7upm7aocTJZQJgky+lo5gRL6u0EpZ2/3hpcJeko20oglfEUFEjQ1huSzl9FWEpeHoaQac
	K7ZwMGBRPISDj7jmjUIHbBt5GnJTg8WyjJERX/u8KOeZvcgk58ss60HXwVAUiUoTbz1LHTW+8p6
	tFes7I9mYV7cGa+0XC2nD39XcuXrHLaWCZtl+r9OoIs/LVn6rCzobqUd15kEwoNJiQpecHB+Ik6
	WyNslzSTPyBBJBDwIz9kUVqdg3NKMey8XTUeHdaF+wWuZw==
X-Received: by 2002:a17:903:3d0e:b0:23c:6cc2:feb9 with SMTP id d9443c01a7336-23dede9e0bdmr9187585ad.45.1752181888754;
        Thu, 10 Jul 2025 14:11:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH40itlo9Q3VPwkodph6SX00btge58CCSKjrR52Pux2HyjpRrEkkomBu7+5GLThfJJL/+J/yw==
X-Received: by 2002:a17:903:3d0e:b0:23c:6cc2:feb9 with SMTP id d9443c01a7336-23dede9e0bdmr9187315ad.45.1752181888452;
        Thu, 10 Jul 2025 14:11:28 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:36 -0400
Subject: [PATCH 04/13] clk: imx: cpu: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-4-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1427;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=3XjDCzSMZEsGst/M49lew0bIUSlQF8Nx3FY6tvatUbc=;
 b=cZExAeUB9HVwWRLw/pA+Ktj6jaDvyzLQbPvJc/XdM+3G/yEOb+NDOTlZV8oaiYClRWR49P9Cu
 xqOnNjF0BFoDoL6ivjtSPWRBoBq1R6/6yfsdfsJwfwgf2c4wsH9udFq
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Kv0v6uRA772rtEGYGgvMOenoRJUscUPzDDzaKNr_les_1752181889
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141132_354500_1952D5D2 
X-CRM114-Status: GOOD (  12.96  )
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
 drivers/clk/imx/clk-cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-cpu.c b/drivers/clk/imx/clk-cpu.c
index cb6ca4cf0535bab2d9d519c46a84564711aaf209..43637cb61693845f54b3bd1b92f548b43bc30caa 100644
--- a/drivers/clk/imx/clk-cpu.c
+++ b/drivers/clk/imx/clk-cpu.c
@@ -30,12 +30,14 @@ static unsigned long clk_cpu_recalc_rate(struct clk_hw *hw,
 	return clk_get_rate(cpu->div);
 }
 
-static long clk_cpu_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *prate)
+static int clk_cpu_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct clk_cpu *cpu = to_clk_cpu(hw);
 
-	return clk_round_rate(cpu->pll, rate);
+	req->rate = clk_round_rate(cpu->pll, req->rate);
+
+	return 0;
 }
 
 static int clk_cpu_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -66,7 +68,7 @@ static int clk_cpu_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_cpu_ops = {
 	.recalc_rate	= clk_cpu_recalc_rate,
-	.round_rate	= clk_cpu_round_rate,
+	.determine_rate = clk_cpu_determine_rate,
 	.set_rate	= clk_cpu_set_rate,
 };
 

-- 
2.50.0


