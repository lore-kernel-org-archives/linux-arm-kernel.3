Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3EBC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmLueEOSOx1TOZ/xE11puxSYTKnDaeqcR4nW9ehtutQ=; b=Kx+wYfawRUniBTENY3lBJkwHa5
	Es76C0v8SR8p6tPdrLeWXj2CH4WjQfn6GKznCcTf5/M4sPNTflNoN8td+GkvHm44MqiupMyji6aJJ
	3tzOP6RUZlIA9Gnk3BdhRiZlv7EOkLVUVvuX71vXcYUoM70IZgxGKyEzTe4VwKIllbmx+0h35GmYA
	ePZfA1X3al2tAbiXZ6PiCFWcPdJU3OqQ5V7OQE+wyleLQY+s170eadMFUR6jmj7BPk9z7HUyeIqvU
	J0R8ee6SEHW2kLv/bSEgEbinLs6NiPmOYtYfR6lJMoO3VE98hn8RbxEewQUGjOMxJUdl2dOEtH3DM
	lw738evA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mkP-00000009djp-2FHx;
	Thu, 10 Apr 2025 07:54:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2m8z-00000009VRZ-3R8y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 07:16:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d0782d787so3169525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 00:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744269371; x=1744874171; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmLueEOSOx1TOZ/xE11puxSYTKnDaeqcR4nW9ehtutQ=;
        b=TtgZhPVv+Uyxjc9Z47zOcAsnhdZM7K6DYu4E2L/NIvLhFco+V4NkL47wflk9dRVh79
         x+9pZZSekx9ZEcCD/SeJCIP3lQsZew2yX/rC5EpTZnULdJRPCp66K/k/Y5faAntdnzkY
         15LAXTOnzyzdoM1elS8EMAhNoPFuiR/UjyuJwIYWbiTybB/rTDq7dmEHKmR6QV47rJky
         t2QaQqY0KW2vFFc2ccoNJVf0lyZLJhZshby+Wz2N+ZkRf75YXKV/8+Mr+la5bQoLdkOT
         q1oRmQS1Jty++DNUmukaPTcXmCQNTFEcHXQ3za0aqonqeySuhjF3OVAGDEwxvC9gFQjk
         603Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269372; x=1744874172;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmLueEOSOx1TOZ/xE11puxSYTKnDaeqcR4nW9ehtutQ=;
        b=HTpP+qE8VA9quuAd6UPDJlumoyjzUZaCeIjN9TUUvLTi7yzFgBNlpSlh3f4446IyRy
         1o2a5ftzvQldPQXq7WtSKW6A91YacnF0RelK/+Lin745uUu7lfGF9L2nFiFGGZ13UuiR
         Fxw7II6xRekf21mOI6TSjSL+Ih4ZCuxlKizaP9mLBdwdcm66Lu+1Y3FbmQj7pHchDIUJ
         dlQZ7a+Ne4glILHPe6hhkCUeOvBs3YV7za2XN114KPtrGFyuvdqzTV4PtXO2ZcmQtouF
         zvcN5n/ep4Be7K+AKSHZt1rIGJSZqr31kHcOScuxqgnV+sFyBhxdwrsu9goDJ1pp23vs
         SUUA==
X-Gm-Message-State: AOJu0Yz2WXxmiI15PmRiRP0CThGCELvBnT84+FOXUDBNjl6NZGqbeuNd
	LznvDDp+BMpmE98M7YBjCtkWMP6cs9K77Op3HRZKGvgViz7KUOUhbAkQr/Zg7qw=
X-Gm-Gg: ASbGncszfKSl/MCQLhVSJumClsF/2rp1z5qH0vckZxjZux9nXr4slry3B5EAq2+Zcc5
	xuMQoeWxc4JvqrbrvTK0bOvsRHh26blu2vtImz5HTlZXKDDK/A4RBVAPxp2GxvHseRv2XT6OVIK
	8cP1r9z3PZgl9OVLh8pAKx4rOMR6a4/RdtHbYkkYeVICI4OJN0W/R7+YTfN0qU9C2sD0e98C46v
	a18tQ8cStbV3RBVTWfZe98KUSVZv6tG1F5zVZCUbuiiJLYhwDDCJKqt22lgb0H+IjUjDzzGaW1/
	hA1NO1ILtuf6NvLEWp/Uswib9f68FFtRkFrR3xMCHqE+LaLQNkUYHjafne8=
X-Google-Smtp-Source: AGHT+IEz5IG00lmAVwHCdXdSnJ2Z0KQTlp+V18IFUkzrkAAyElIVx0JjEnVPmuw7GvI+SO1ZUwQhPQ==
X-Received: by 2002:a05:600c:4ec9:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-43f2ff0540fmr11919285e9.18.1744269371500;
        Thu, 10 Apr 2025 00:16:11 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d069sm45329215e9.17.2025.04.10.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 00:16:10 -0700 (PDT)
Message-ID: <b8f356b8-b242-41da-a654-d937a354fc1e@tuxon.dev>
Date: Thu, 10 Apr 2025 10:16:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] pinctrl: at91-pio4: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-1-c9d521d7c8c7@linaro.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-1-c9d521d7c8c7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_001614_044537_C6F06F79 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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



On 08.04.2025 10:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

