Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3868C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEFDRD3uDacyEzKnD/0X8FofWYQVCs9dgJI0dD/G5mY=; b=2LnvMKMd1TDp25cpcdG+nU8Ik/
	7rho+/d0sUVv2ER2ByyYqulf3DJEH4pW+BJnvj1GyBhcIrdTqohRVCrRUq2geFNvSD8ZgCUr7ZvmN
	0+05VKvpqcCdLr6HotoDY35k5LTZWdBTXu5EnxP6w1DNDq+lKxFLxkoJfFZQh8oZvMUX0n3lepf+l
	j8gNNI5mAgQsMlACF/9wMKTjUv7/boiKO0StVug3yuzRyBaT2WgIcnAgrTvD8j4RP07oNqTRNR4la
	45rECIdx3rlijwsJ2vb5wOE63lWBmeRDX3hiIAC8nnZjbpZycTeoS5HfiYIXcT780FOaYlZDDM0pU
	U87smKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSlf-0000000FX4L-1hD7;
	Thu, 16 Jan 2025 16:30:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSfK-0000000FVTc-3t7h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 16:24:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso672953f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 08:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044657; x=1737649457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEFDRD3uDacyEzKnD/0X8FofWYQVCs9dgJI0dD/G5mY=;
        b=UNsiGNTWjTWXYjCbE0eBEM3xogjlOp9QSUBGT7egObWPpX0wEd+1F2vDiYMgQhmckY
         XZVyxx9zTT9VNi6DCxypNk8ndCMAkvwXV0IKTHfUteFR9yOIomXI5eWCwxORCGCdG/bQ
         3iPXuRkiKVQH7m0XplliQwJ5lFxaB3C3PMe53vbwOYXubrXF5Sr+vnzYLkMqIhyh25WH
         S3Z63YziCgPPpEUmK1lVzI4AOAUGPfqBf3PdE62k/gmMQSxiYlVF8M4b8z2B6+uxslG/
         hOGXZ/WkyMaQpoY0pf3HkkXwMePv8fvFJOrSpXJGTkSE1Rj+2aNBAGcvcOxfnuOTcwbx
         IxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044657; x=1737649457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEFDRD3uDacyEzKnD/0X8FofWYQVCs9dgJI0dD/G5mY=;
        b=hOXgkQMKAMxL8hpTv60WbbO+cwxRcqyxi7zeqsUCPA9hKfziwaIhcSXP2Gq3k/EYZu
         +FNGsxQHOn4wm7fDyCVxdrP2Ovs63Jz4LuArSsJq0QKL3Ua+i37lf4Helm3IaCtTxo5y
         p+nExnk8jhHaQSANCx0YmzUlgFQt/P0z9k/Z32tHdX64ljq2Mq+plzYCRV8QTlZKwaq0
         H8jnWNqOQazxBTtC3N7lXdU/9QrxkQpcA357j1M639z9DU7+/4O0kxDcZq+4unsQ4A+W
         /vaSIj3UCLXHZEiEoh8J8tTMLja+BxQOBS6zZMPABNQsKwz6stxFh4uoWnZsOxfZecpp
         Fa/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZM9fYivy903gxgm/qvOjV3Y1LncGlkzR2da7sr/oU3FIEYMqeQOGMDtrNF4MJJ4KFgwACbu+xZJT37hc56FgG@lists.infradead.org
X-Gm-Message-State: AOJu0YxAC0NhGj5uxxMT897gKi6J4pmfQSwf1DuK5k7jHLmGR7u693Ek
	hB6tS+cp976tXXZs4svCBAnJbK8NWo+Zp9BejYcrLI0jzFTiapxVnjwRT7dqVGaX9IG3MFTlW5V
	r
X-Gm-Gg: ASbGncsxyNkap2akXKWD/UkZI/3icE44SmRARQvX2gJE+LswOn84JlyfDGNar3ZeMlT
	kNAkDsXMHS7bQV2AUvpEclrjtYi0PpL3DIwuLETnq6kfnyzGjTKqT18m18E+0Y/5iJvAA38my8A
	rmIQStXGP73uchQ/2SccGRssAA55RAbjMlfn9C8o0/OQYUUXR/lWJY+MhDlF8+aOCU68AqTmRS1
	U/ZfMRXW4NUI1SU+X8mF9VRnQhZPn9EQFAURvYUQlc4F0iQ
X-Google-Smtp-Source: AGHT+IFvRvbv+LmIOWTmcellM9NY1ElhZhfaIceOIssMpjdEdZEj6E1fUiTUX+H5C5fFTitYvcXPPQ==
X-Received: by 2002:a05:6000:1844:b0:38b:d7d2:12f2 with SMTP id ffacd0b85a97d-38bd7d21481mr15783737f8f.54.1737044657080;
        Thu, 16 Jan 2025 08:24:17 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:16 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 16:24:11 +0000
Subject: [PATCH 4/5] clk: bcm: rpi: Create helper to retrieve private data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-bcm2712-clk-updates-v1-4-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
In-Reply-To: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_082418_958374_8F51C6AA 
X-CRM114-Status: GOOD (  13.42  )
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

From: Maxime Ripard <mripard@kernel.org>

The RaspberryPi firmware clocks driver uses in several instances a
container_of to retrieve the struct raspberrypi_clk_data from a pointer
to struct clk_hw. Let's create a small function to avoid duplicating it
all over the place.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 9f716b2223ae..b12d86720207 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -56,6 +56,12 @@ struct raspberrypi_clk_data {
 	struct raspberrypi_clk *rpi;
 };
 
+static inline
+const struct raspberrypi_clk_data *clk_hw_to_data(const struct clk_hw *hw)
+{
+	return container_of(hw, struct raspberrypi_clk_data, hw);
+}
+
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
@@ -176,8 +182,7 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 
 static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -194,8 +199,7 @@ static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -211,8 +215,7 @@ static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 _rate = rate;
 	int ret;
@@ -229,8 +232,7 @@ static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 					      struct clk_rate_request *req)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk_variant *variant = data->variant;
 
 	/*

-- 
2.34.1


