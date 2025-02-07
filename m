Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BFFC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUllOVoQWt5TpL/p8/hvlyPScQXI4Ia6hOAN5diMcKA=; b=Scwsl0OeTQ57luka4AGwP7HGae
	qkOw8/lADZEeR3bdurdobLj49rw3srwGX8xxyxkQ7PNeT2bv1AXmqbJuOsvOMvleKztoRtPVyMuGd
	pkCtCjaLzJ2yEaoWvsWR+Y/jVORm+4v09sGeBZKoRlvhDZ7QV7xIhDcQ6l2he6buZOuEoR3GKBOym
	BHN5VDOmK7ou0WWNxq1dvb/ky3wQvXT9onGJnxJRDh5cLroKTceenmIMHmcPvjGjfpSI3EucAWG5O
	cjKjr4fmYisicbXyVP3rAQsYhP5n5YDab9mE0ETluDpLQn5PJHvOJfJFpDTGRjwod8+WHDoUi8+bf
	3fJNPm6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUzH-0000000B4pO-3RmL;
	Fri, 07 Feb 2025 20:30:07 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUYq-0000000B0MP-3ond
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 20:02:49 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5de3c29ebaeso2420494a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 12:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958567; x=1739563367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUllOVoQWt5TpL/p8/hvlyPScQXI4Ia6hOAN5diMcKA=;
        b=IqxE+62Ijvms1Cmnc5IX9VxhkJKzxggDpBkBsut8noa2eUNVcfQjiQtBdx0oBM1B0i
         3bHl5CgDdonUk4LEci/uqAdfbOMMeublImcLx6sQzjxRZq+ZbHIcIyymv57jaSO6Ixlz
         TBgnUdxINmqWQglQ8aykewyC/ynRHmC8AOjt1K1riUFf3U4WlYYE0xqT//QajA4oYX4q
         1xxvNx4AvAzx5pgivUhxa+JR7j8JuU5EW1jVqXgnEAbJf7SbHHwmblQNNyxssZPJkJGA
         eXKr5Wswt/7d9l/UlS+GT25JuVb+0qNVIJPCC/WMNZimJYTA18Skxf2rOEx1yjdZOQRF
         tDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958567; x=1739563367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUllOVoQWt5TpL/p8/hvlyPScQXI4Ia6hOAN5diMcKA=;
        b=it/C0HdAsn7SCuLIPTzwZ6n+eikG1uNuwICv12a/HDG7kru1zXdHmK2YeZOHg0mFay
         j6x3/CkUTvzZjJAGOAAIyYHfDORPuOt0FlCNs6V+/59I6GT3+pem3FZPWHR5b3mGdTsz
         Zljn8nGAI9fW35kCwaWhbpPY8nosY4AkpNvquWsEeAdLZrCD4gZ/kpYqn8KjWmN+lVYn
         Ilc6/jgJHpKKuA5pdoF9UWZwoUJVRmJ195qs/pV/iBPrHtMdtRMkhNgD4v2pBpp2kbxT
         nDxxl73lo44bNysLlzN8r9LRk8NOZxPscTjNKyLBNgOoSC4Mc0lkdOv2zoNQ+WOAAz9a
         is5w==
X-Forwarded-Encrypted: i=1; AJvYcCVOUJfApRTSteHskWekxIYFhvfwOeIwrEnzjQCJP8ocqgK7ko30wvLRZi71mHGp+iHxujPGCPi8M8MYbd2wPkEi@lists.infradead.org
X-Gm-Message-State: AOJu0YyrtZQZ5bHrJn7CGubQx33E2aL7D7u+btUE3GAj9yJPOX95if7C
	8BlCPKt8J2g9DlRwEk9ZGvVCVrZN1EsqP71s+n0oPFP9+TNJ5cfC
X-Gm-Gg: ASbGncun9ERKQrD+e8+8tfi1Tsl6Oe8Nh64ZOIBAwFiDum7bKkk2HpnfRUqLh43UT0k
	Q8kHefox5Hm6w7LcX5RNONPJstXhxDQVqfoFd020A8FTz90MquSoB2lNA3afhfEe/Hmls933szh
	LDbR0OCT1CEWmLkKBK4OxrtqFJ9XTvx71MNvSvOki72lg3fQV6QPp6luE8er4iNI6PgPnS0l9eR
	xl5fjnLUpiE7qGSlDHPyhx2OHlMeGSwem2g1WcFuKN07u+PDKVE1YGl/joLEl52lSs7QkURpjMn
	EPQrHAOkCBdw29hDt7V8Cx2e0HQDfh102wD/u4XX1nsuyS0CWtahy+uH
X-Google-Smtp-Source: AGHT+IHHN0ZnaKhydyOaLPxKDsHa3CA/i1kjMOcuLsVlh+u9S4xMjrVpvyyFysCFlzWlTF0P3YpXMA==
X-Received: by 2002:a05:6402:3903:b0:5dc:7eba:7832 with SMTP id 4fb4d7f45d1cf-5de45029345mr5635286a12.17.1738958567441;
        Fri, 07 Feb 2025 12:02:47 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:46 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 07 Feb 2025 21:02:41 +0100
Subject: [PATCH 2/7] pinctrl: bcm281xx: Fix incorrect regmap max_registers
 value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bcm21664-pinctrl-v1-2-e7cfac9b2d3b@gmail.com>
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=1089;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=yaA+1Xx4ejt9Q5AC95dKbp7n1j1IN1zcvm8KSM9DNA8=;
 b=Zb49rdB/eQos58j5aV57evRQc6TfTbLNsaU4PNCSruIsW3ukPqwmlboB2cueZeZDAjOLIwLPO
 329UazjmwphBIFoDIHkqKmzezzoM4wlOpuUtadzO/CjEOQQ0GfTbV+l
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_120248_959990_D2B77806 
X-CRM114-Status: GOOD (  13.91  )
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

The max_registers value does not take into consideration the stride;
currently, it's set to the number of the last pin, but this does not
accurately represent the final register.

Fix this by multiplying the current value by 4.

Fixes: 54b1aa5a5b16 ("ARM: pinctrl: Add Broadcom Capri pinctrl driver")
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index 73dbf29c002f39cde71352c1bf806872dd218b62..cf6efa9c0364a1ad65885c982e7634f26d19c944 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -974,7 +974,7 @@ static const struct regmap_config bcm281xx_pinctrl_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = BCM281XX_PIN_VC_CAM3_SDA,
+	.max_register = BCM281XX_PIN_VC_CAM3_SDA * 4,
 };
 
 static int bcm281xx_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)

-- 
2.48.1


