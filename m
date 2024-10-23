Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C3ACFA45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9MiZUhuAcE+DC6JkjBsIZrkLkLAyStuyfWQoaNqfXQ=; b=JrHm9v+6DYA3bbpSylCsh8NKjB
	4QEjJWnwwWfwcJNoaAXdd7tzkhEz6mOyM/3lGfeijBsHlbFBig1GcvPIZzAAQDCOpOZFzpMTIA0jF
	Rik4wqjqOiYUkIMZpjlh/5N8Fk5OtwMiIjLoXGeoGFo0DVces+tKWW0LDWg7+mqXf0c+7jn76KqQa
	8dMbZ15DAx9Z85V7KV3kNT09YPwa52YvE1JVP79V8LyYXAmdR0uPblzb83Cw9nmec2MKCZqCoKivi
	N34/30fM+a6lrh5l9cYYrovXJBY9WT1pqFRpJ6GK41o6ntmRgBnGnu+Bd8MPySpFFsVxwQmlFgWO1
	cViUvb0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gsQ-0000000FdgG-2pzO;
	Wed, 23 Oct 2024 19:18:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZT-0000000FDgJ-0bEG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so45423035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702253; x=1730307053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9MiZUhuAcE+DC6JkjBsIZrkLkLAyStuyfWQoaNqfXQ=;
        b=OfJ6lpm3t5QoEuQuJ0r+CFq9secNqpicIMVjBglZ8hUFSFIABNgKQFm4b0mqbBvWcU
         Xr8QmpI06eRgrA0G/8pG6f2GVE/Nwz+qJ/fmEmTOBwf9J09NjlJ7/JHMdLqr06fEf8lt
         ZKuxPnhz9WcsvRahAFnF8Gnhhl5pzOnvHs//1OR1U9BdtZ91z8JP34so5VnaVcBZ9T79
         h7wYnvUbK3sF2l3mIicziszCaUSbYn974r38dflqbSCwEbNN8+bPTHs2+k4DozCefxIF
         HPqwP6bg5Ffv9zimLLQT4aogQqpSyCEdMdw/ZGlY4wHOhwuSpL1CKHzsZd/PTXnWOHAE
         GUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702253; x=1730307053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9MiZUhuAcE+DC6JkjBsIZrkLkLAyStuyfWQoaNqfXQ=;
        b=Nxall1/ge1DQyx/jv9m/MHXS5bl7GySfqoqLHzQBjq11QYopquBHUbMHhOk3Re/vuF
         H6weS2F4MiE+r0gcJ0fNjXH+2ktXly6S5eGeWRwd0O0awfQ1mfVmN5JkpK2m4ikuukDj
         SB+FiFd5ohtqrtEeNqGDWJ6HmPiXndcxr720dp2cNFvui5njQEuEPvazjY5jK8ixQH+x
         ItryMhx8uU5dMO4KhLuDhBil+tKC049tX/nGYSWfROdsNdjaVcD8nH6G30BedvmP2qCY
         egyvq5J9eLN6urol7IsKsHbl5IMQ5Rk4KbT3Lrr1jy6307DOarAgVeRKFJBiHIVfzcZ4
         wG1g==
X-Forwarded-Encrypted: i=1; AJvYcCV5TBWqT/tdFJypb6f0D0+V2Jp1/zwZleJAjm/3sP0+1jEJoOjEeAdmxjXp+8PZoDtaXpYv+vaZzUW/tv4+cVYa@lists.infradead.org
X-Gm-Message-State: AOJu0YzNLrU0/4MWhqvanuN53+AvDC2RWCv4OrboSN9nOkesKl4verc2
	4y+LnfHIBA2Z2YZbkhGxrTR8W3AreZyPU8IQl6cRktIG8XsIAuctKO644aAILws=
X-Google-Smtp-Source: AGHT+IH3dVyDZOxIVjZAcfUl+JwKCM4Z59KdfEHOCGa0hmLNiw7CjeLKq/QM+g/Vjy8Ji+yxUeCFow==
X-Received: by 2002:a05:600c:45cb:b0:431:44aa:ee2e with SMTP id 5b1f17b1804b1-4318413209emr25331625e9.4.1729702253413;
        Wed, 23 Oct 2024 09:50:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:53 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:30 +0100
Subject: [PATCH 33/37] clk: bcm: rpi: Create helper to retrieve private
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-33-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_095055_200353_0064254B 
X-CRM114-Status: GOOD (  14.84  )
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index fd7ae0efcf07..89e2c0241ff6 100644
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
@@ -177,8 +183,7 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 
 static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -195,8 +200,7 @@ static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -212,8 +216,7 @@ static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 _rate = rate;
 	int ret;
@@ -230,8 +233,7 @@ static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
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


