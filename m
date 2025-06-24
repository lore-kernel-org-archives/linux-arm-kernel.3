Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E46AC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tg0mRooHGRn5NykMyH/KV9HEFTTYvVA7Ojb23IHtmak=; b=ExDzVnKIgRe09KGQ/zUKC5hpL1
	BjICasm623Aq1wXGWZVes3uiyM0XpVj2/dcQgRI9Fx1DcChDj5MMEGlejELD49vZlHjSOCX6uT8hF
	ipzE0D9+fwVMXxIbZKvvIdWafbDZz0xb4HtqyfG/xXOMmWT6DqWXLDsQPY+WtjV5C56bFARu+DQJ8
	By+ovuVe0d92sS+iDfjhHg9iyTHxEm+M4BFnR0Pd+ZnizWKnT0wvRmhsvGLuIs5r8nztpMW1GNWtz
	tEkrVVs/4dN2wYYjQCO9SoR/REpvsWqI7uHDMTOteZP8omWjlpLgAOOARf4C7wW1ZPEnco17Oeclx
	ImUsGLpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3d6-00000005hVv-2n2z;
	Tue, 24 Jun 2025 13:24:04 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Yb-00000005h3M-25Yi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:19:26 +0000
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a52874d593so5195631f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771163; x=1751375963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tg0mRooHGRn5NykMyH/KV9HEFTTYvVA7Ojb23IHtmak=;
        b=O3dphUuzkI8P4zJL3/JFg5ervfyS1j0mBVs3/yS26E1kQuv1H8KSa3F8HlSmrZH0q6
         IXKj1UQ0T9ld62i8QDMl18iR8F5VETghpxQwUSaMm2TsXdpP65yzA8cr0pWorKWrS3jB
         E55GrJPxAdfKHNP4062+5fC3CwJUWF7t+RAJak864zu8EwFZt+lpo9k6pp9+YQZtdZdL
         53hokTHL01QfJQp7E8l4uATG/i3Mr1Nwo9oF/MWngB++wz55rRNgJm76ypNZA/ATLnDB
         eBXWn01F1eymferlzcGHfoyILZVzYqo+9er+F/54KtyjYJDcZuKa7bYFlX95gsMyNX0D
         3sCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771163; x=1751375963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tg0mRooHGRn5NykMyH/KV9HEFTTYvVA7Ojb23IHtmak=;
        b=Bu05Kp+fnnI0XsNDIRjL6uOlfxbjRjElw/LScyH+sGmVapx24dqqspeG04+vKn6HiL
         0UXBQw8YxypjMKQhXgFZsa1c9WTblh6ddIJo3cG92trqZlozZdZjiA2HF2KVxJhdPNbw
         3pd7L8PWXmW7iw3Vi7Sys+GnW0X1e2FFEAeLbqrRrZSjdNtPD1Hz4ZF86wqS3QncX71d
         2I0o76UHSgKXT+B7rS2Lo4sHOmhXUHjfm8tdIefaGzHqYv/oNqHiyu4Q7Co4lPE/6n8v
         k3xE/ZZkXHemd8Xp/LYvH2VAEOmITVSFeZLi7uyRtQhLdA7kWvFAcItHIOahvvEc9dod
         4QhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEYwx4n5mIudYuALSFfWMHrkRMUFwuoFgDOSh7tjmMZD/TTxACo7lZqjmPt4Q/MIZOPSce7nZ2mj7nL1HdaR7v@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Flnn0b35wmEF1lmGfNDCjnBOPzr9sbwRRZrg8LVemircrT5p
	MJhBZTQub5JVqPomsKHRApC7DIfliOx35DJXttljAKobhKbRPyeC9lf/rgAQFfhQWXk=
X-Gm-Gg: ASbGncsxm4WqFHB31ISy3y6BkoY74tdkVSbj/WCy77WxQ87pMynf4gOHFRUjAdlNY5v
	ddx9qjp8Hv78aHuEqRBYSxvytc8joifkw3Hx/xPx8UlcpyT9qmBJ+Pj751C18EO4qzuLvTDhMGH
	ZuP+6tLY9owACWYlE6eh/9H3PqWIQaFKl7Qsu1rTLX9HjyqOh1PrW/Cb1useQLyIURjgTouv5v2
	hRjocBCBFD3nJ0wlZ6GxE3C2B8Frty8MfkXajjuDOkoKHXE3Q3zUjxoZ4wfKEwEWf6hpZXTyKrK
	ka9bNOk+hC4Z/6iGhB/fQ1m+DAWlEADus/jQ6PyaDY8ofzCUSjKS5WI=
X-Google-Smtp-Source: AGHT+IFqVsUMNkskN7j0iU8FIkymNyWUVdq66py+zAf7HndvvTiiHB1vrcYgqEVFpM7yRp7iDODuOA==
X-Received: by 2002:a05:6000:41c5:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a6d12c4483mr13480483f8f.7.1750771163464;
        Tue, 24 Jun 2025 06:19:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:12 +0200
Subject: [PATCH RFT 1/6] gpio: mmio: drop the big-endian platform device
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=738;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=z3/zra3kN9nXZTz56dedVkj+298LVjWZ5HQnjkpNGc0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXXVTocp2LRJnqJmPhyZdXYqUYB9W1Pi4/38
 +4ka8H0AFeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql1wAKCRARpy6gFHHX
 cpcbEACbyOXoPzeB9I06bs0F+81Fkjgw+J37W2LT86j5na56S1eXe78vgeUNxpRU1vCPdAPW9BT
 DcEs6ZeYowO9isB+rIP52gU9KIjpkZMce+6zcXuco/dLq/Z8nkcELA6ME2iqRAQaSpXCUg8K1Wu
 3DlGq8jLj1OKsMJm5P9YCfmrSKpfKeFfU0cmjjaJWaQBkuJA1lGDcmWxXI5Kt7Rk5awRVCkOIjR
 TE5aK2FjtBwxWzedg6h6Dv9aPLQkuOTAnS+F9hCwXxJwyK8O5G0PEiXm0TQuXNtntFBJtcNp2b1
 JUJNTO7pl7QJDvUZEfakkWGXM/SMdPBtWLm1LUMssPxlYSTNOJcoM4OKkEa8cyPFMPNhFEh08W/
 yoQUHKJAlg50Z86zhePj0yw8bnWHksDY4EYxW7ZWpkS8spjGmA1Fa/hEThi1kEhAdrEK3uP1adA
 jSZOy79jX/rLGhwtIh74KGqeAk7OdaUVqiGnyRDZGsUzwavHtuu5VCnzJJS2tckOMIM0el6TFwT
 or/WaFvU9MZ8udeIcduADx1B1w5v/bhz0pYU9sQjJgnffWWWVFK7gIGeBJTBLyfbPKJf64SQQhy
 8KrILygqD0RYRRH9oRjFhdFUWP2nZvMfid/q28RjPJkOuEDBQjag/WQhOh9x6XaR3dMaoNkonb5
 yRV1tuWz6xJ3kBg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_061925_543487_C3CF8DB1 
X-CRM114-Status: GOOD (  11.44  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more users of the "basic-mmio-gpio-be" platform device ID
in the kernel. We can safely drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 08466e123818e958755fe6e7baf5a4e8b8d863c1..ffe6b6f6cc9b1e9341e1c42cf8fee917e0147bf3 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -831,9 +831,6 @@ static const struct platform_device_id bgpio_id_table[] = {
 	{
 		.name		= "basic-mmio-gpio",
 		.driver_data	= 0,
-	}, {
-		.name		= "basic-mmio-gpio-be",
-		.driver_data	= BGPIOF_BIG_ENDIAN,
 	},
 	{ }
 };

-- 
2.48.1


