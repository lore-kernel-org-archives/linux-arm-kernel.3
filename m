Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C83C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 01:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zb0t+bPuMy487CsPpINgg8YqC+3JQLKvQYW9mEqLvWM=; b=Keav7DMUb2XbiV5ZlC/rt5VMd+
	ZXqCptVC2MMMZpKlv9aX0ZLhYAwU7KvIbRRG7wMcls6F3BlE2+XJBJu7kusFwhQLi4i8PdpgJYJ+M
	vXk2l/rKO/81KOice9eQBgb60MEiXcXGDGHOR/3q9TwPZ5BJEkGxCPxdR1MYMpfosF4YkiRhg6TM6
	uyj02u/h7ydBF9FgRpizRFqRMdYADKOadqHvVtkbbuh9XynEU+Ckclgbbm6NcjqOPqhFaPN4Mxn/W
	C1JSy+VfF5EpC09y5dgoC+3zKlb98B5tQJkD9byTeX0qhOw88QUp3QA6tlWdMZGCtLHd1X5q3zCbl
	6xBpWtQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXUsl-0000000Cy8f-27hE;
	Fri, 04 Jul 2025 01:06:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTIB-0000000CouJ-27KO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 23:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zb0t+bPuMy487CsPpINgg8YqC+3JQLKvQYW9mEqLvWM=;
	b=i5zJDqO8KLGg3Iqm0KuepJSltnUKfkC4EmAFAPhVJYT+y1LwFIPpCRgz3W35u8Munio2A0
	KwFNmv/pCZ4s0WIKgsX3prokvPy0qbdbzIIAKoXBtodwcDaWGc6Lt+ggy+duYuxDbsW9Tu
	JpWvXrSDwSX2CD7UaOBLiv2otSdREVY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-mKODuY8iOsmlujhZGMjW3A-1; Thu, 03 Jul 2025 19:23:05 -0400
X-MC-Unique: mKODuY8iOsmlujhZGMjW3A-1
X-Mimecast-MFC-AGG-ID: mKODuY8iOsmlujhZGMjW3A_1751584985
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fad29c1b72so3829086d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 16:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584984; x=1752189784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zb0t+bPuMy487CsPpINgg8YqC+3JQLKvQYW9mEqLvWM=;
        b=tUMTl3k41qiwYoJHSL+Yu7xUIHmL1KHtPzKiigsvcIGzdPVvQ8Ou8xeSysiRfsf7m0
         VDabPFuhH/pO7G7qtbJutCGa8cstV196EouMcRlWrJq9dwXaI0fvfFSPNqGxxxoSXV8R
         u+4/k/P+JnEUZtWrOodkzIJ3KKmpoEBMXTVP6wwS6aaIY/TDJuDQNqlXVJUPgKOL7oFY
         rxIlu1eyBZfFrRt2sAzg7UCqUnek2/LpCmPr+LRk6fapiHooTG6szvIUJXTxPH3A3h1D
         YUushaEvS1JunMN21FQi6L127zIm7aDluLcP/k3iY7V3ARcvqnwEIrdz/QsvsZ/WEYbG
         yOVw==
X-Forwarded-Encrypted: i=1; AJvYcCVuRA9tD5SEcSU7kgtUzCNQ/iOLr2R9B7v+jm16Z5mMP/WxgtXRqDFFbfU4qbyAUaQUdzV9eum6PkNAK4vIHUlX@lists.infradead.org
X-Gm-Message-State: AOJu0YygDebXHNCCiLH5ZvuJ5W/0UIspbnsEZrtNn4kB7tagP03+BeM/
	+V4oEqyWujypGtIQEkTk/eKZuq2kgMRGNIHNHpUL9HalK8AlXcqz3y5+7OmMisG9jPJSMt0ajkg
	B/BeDL0o1bajAOaAwdxs5FCtsXMyl1ygTUoYaKDj5P/Nas7WpYtxBYvXezz+Cf3TPgZAlHsGlrA
	iTsmbgi+5A8QOB3b9K3kffjS8uKxMJM2O9AONkeocd4m2UQYfWiw78LfZc1SQ=
X-Gm-Gg: ASbGncugCLSgA+qzj89VVnSP6h5c1w4HYY9osCEauAcAQy1UcLsnGKmiH9YXdotuaWZ
	lPxH60QADE2CdbFbf8dj4vIEtku3+aUmJ/wwhQAXjrk+GjV30yh9yGS8KhK+roCX9R8r08cwkB1
	9oPisOw7Vmfwyinkcr6SU+pWOuFqGg7/dKmuvCA/Uw9eAGpwjPmCRsTQu8WgopwHXrDYXFtrSh7
	fT7xRhOBdceKtj4gkUdNjWrtDO08a5xQLL9uoJTsQnqnrXdIePLiblcveHAIXozRRxwQzgfIXpf
	3RVmX/ZU5NXeqkN/uDw0L67Vs//5LXCsB/YoswPL73YQknwnrSVhTynIRwDNNA==
X-Received: by 2002:a05:6214:4109:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-702c6dbd1d7mr2610266d6.43.1751584983705;
        Thu, 03 Jul 2025 16:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyxhZnZ049hC67seKLZMmTesEshAPctloMTDGwamaQuOlXGGQBJwFhr4CP+VGmOImhVXHj5g==
X-Received: by 2002:a05:6214:4109:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-702c6dbd1d7mr2609726d6.43.1751584983157;
        Thu, 03 Jul 2025 16:23:03 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:01 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:25 -0400
Subject: [PATCH 01/10] clk: bcm: bcm2835: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1979;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=bUDrRrVU7cuzvOkq/BXSXRrTOJz73kF5fGj8HK4w53E=;
 b=xUB+8pQNqSYfMSMKtJ+gOj0YuRr7Wv56SqgY0gPYScWgdV1HkGtTwLwdx9iGFlUExmLZuwyku
 mHoKvxPW2vyDCFHfBUgtY5dZ7pH4PFh8nPq0RUUJZ7MoCOhvyogjc9p
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kPzeaz1fph8TJ5PcBykp5o19tyQF3Io7na4WZ8wNoa4_1751584985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162435_620520_C3A651D3 
X-CRM114-Status: GOOD (  13.98  )
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
 drivers/clk/bcm/clk-bcm2835.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index fb04734afc806286b6a68996f36bd8a49b542cc8..5e7788406de39c94884cbc3aa162c378443322c0 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -570,18 +570,23 @@ static long bcm2835_pll_rate_from_divisors(unsigned long parent_rate,
 	return rate >> A2W_PLL_FRAC_BITS;
 }
 
-static long bcm2835_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int bcm2835_pll_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct bcm2835_pll *pll = container_of(hw, struct bcm2835_pll, hw);
 	const struct bcm2835_pll_data *data = pll->data;
 	u32 ndiv, fdiv;
 
-	rate = clamp(rate, data->min_rate, data->max_rate);
+	req->rate = clamp(req->rate, data->min_rate, data->max_rate);
 
-	bcm2835_pll_choose_ndiv_and_fdiv(rate, *parent_rate, &ndiv, &fdiv);
+	bcm2835_pll_choose_ndiv_and_fdiv(req->rate, req->best_parent_rate,
+					 &ndiv, &fdiv);
 
-	return bcm2835_pll_rate_from_divisors(*parent_rate, ndiv, fdiv, 1);
+	req->rate = bcm2835_pll_rate_from_divisors(req->best_parent_rate,
+						   ndiv, fdiv,
+						   1);
+
+	return 0;
 }
 
 static unsigned long bcm2835_pll_get_rate(struct clk_hw *hw,
@@ -783,7 +788,7 @@ static const struct clk_ops bcm2835_pll_clk_ops = {
 	.unprepare = bcm2835_pll_off,
 	.recalc_rate = bcm2835_pll_get_rate,
 	.set_rate = bcm2835_pll_set_rate,
-	.round_rate = bcm2835_pll_round_rate,
+	.determine_rate = bcm2835_pll_determine_rate,
 	.debug_init = bcm2835_pll_debug_init,
 };
 

-- 
2.50.0


