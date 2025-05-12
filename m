Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D00C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 06:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m54qQDPPwUYYIp+I0ulLXNvjU7U+yLbsnGmwxSAZCM0=; b=Xorae4ArYhC0qUgPy1rFy9E3BH
	4wZiiVkLUwDvn7p51irowCtZaQsU4l95x6cKu88L1bA47rYO9QWnIeYzInWg+FquVnGaY+Y+5iK5B
	AL6f8glM0APGYjdqLneVFqWv7WWyIt36IksxBuAEs1HfxOID/9s/ysm2Yu8datzVKeNwfpwvtBX6P
	mOCQw2BrRgD3d/7ly6gc8Y+BMEC+PYMculfdeVO9xsG8whazeAk3+0dUF8/nHkKIL0B8tj02CwEtF
	skO4XtQeyS74PXOJxF6WsKBBZrj1pkEa2QA9bSUrE3Nko2aWdIU3ZDrj1gsEO5lx6A7L+cnopHx3I
	MWIR0Igw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMxp-00000008YlE-1iR5;
	Mon, 12 May 2025 06:48:37 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMoC-00000008WVJ-3EAh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 06:38:42 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5fbd898dfc9so438915a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 23:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747031919; x=1747636719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m54qQDPPwUYYIp+I0ulLXNvjU7U+yLbsnGmwxSAZCM0=;
        b=FsZpIuQ6DZcI6jy762wv6Quneyx06AEn55KxVTwd3wfv3wnPOqh30lWTwI/FgFGfYh
         CKIu3ukTKFlnXSj8eJR9pNhhS77C2DdnqpBFiPpu584o6MCGv+i9RbaWNq1J7SDpLFsZ
         XIFPjpdqcnSnzSocyPN1BWm5i+liScdl6s1QnCESS5gULcT1AWvetWvE/lE68T/VOOUl
         CYynsJWwfuL7IpJvrU8pO4MDkHXNoAZ4Jldvhn5zSP5CclXqVseEgM36GMljRog9oVtQ
         jPcNW8CjA0rkz2gxjsiogM5YrxgS/1b3odS+xIJt0iT4o1ivoiYWh6xIcPPCIFHSf56f
         fsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031919; x=1747636719;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m54qQDPPwUYYIp+I0ulLXNvjU7U+yLbsnGmwxSAZCM0=;
        b=Zw+QcyAk0vnWkcBR4bNTjIhPRgEhO2878adtCQ/vU7VWvR9BhQzSGd9vMejM3EMUn7
         D1+01advYUeg6M1QSbSzdHn/eat2u8UQO5LatLI+R/OS9hM8eiFT4BVRiFx59Z2NjZmj
         IPWTaXU2ipTtSTv14XmhD9d3bFOFRmY3oOVYQPri7dgsd1w3JqJ0i9d44ENcyDCN4GX7
         +knK+w6xGnU1GUscvaXEIFfXtJH+XnYIlDYgjLtgXCLKTYcRi5jpkI1ffGE60VlmzL79
         nfi9rN0125Y7bYI0GYWqu6yVsVZ41iOl+bDnH4mB0CM43nNpXnqBRNqopJSen4H29ZJr
         /ALw==
X-Forwarded-Encrypted: i=1; AJvYcCWAlfz5bkECzXCbXDxVVgv7cSfqqm9D1xINBbWlZmDcmBRHh8O+siZA9FMQqFQ8dzxL9E+XrJ7G8rsFlDXP54bK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu7P54EwXVJAs1nWm++oGCDAruVWKb5XBTo0IQcuNoCPy4PtrW
	Fp8j1ByB/Nyygwn49csiwqvUcxVK/BJjMPrWhKBzV4I70u9G04xMiExcg5tTu58=
X-Gm-Gg: ASbGncsvr3As8/Xq4kxRAEY29nl1BhQC6nPoLwRo/JDDFOlhKXS/9Wgt6kJDRmP7+2X
	28sbHSugSWBcMiKXbtTFhl6ygcy4zBTrJFTFloFY2+aG0lFU4cBs0M86eOTXJIFrqydG+HWVHFg
	1J2JEo3CjvUZLNJk8ZxqFZ9ueZwycuh4aV+DYLZUJOnEL6+7CWVLAlDwW5oS3ufTjWl5fswBI00
	HXPhOf72SxWIYDZBN1kd/yUtCgXFYmzGDY1Odhpx3ohSIfKWqvqcxuh6jsXM29Bb/opbhAOZVzA
	wiRENgEGUlHqFgNS1xjhMIXy3I2u2+Z6c4A4nxrZw8MpjeqJ1OtzbfXVf7HkWxOUOiDcl64=
X-Google-Smtp-Source: AGHT+IFllBd+sniRuVcx7zlk+9/gEDgyoPcBo885hliuUygqoRqkFUwovnLuRvDW0FgmF20AaaF4RA==
X-Received: by 2002:a05:6402:26d2:b0:5fc:4043:dade with SMTP id 4fb4d7f45d1cf-5fca0793fa6mr4040273a12.5.1747031919022;
        Sun, 11 May 2025 23:38:39 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d700e92sm5210075a12.55.2025.05.11.23.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 23:38:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <cover.1746781081.git.dan.carpenter@linaro.org>
References: <cover.1746781081.git.dan.carpenter@linaro.org>
Subject: Re: [PATCH 0/2] memory: stm32_omm: Fix error handling bugs
Message-Id: <174703191772.30920.1274669600667314405.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_233840_828898_AD3FB231 
X-CRM114-Status: UNSURE (   7.31  )
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


On Fri, 09 May 2025 14:04:19 +0300, Dan Carpenter wrote:
> These are a couple bugs which were detected using the Smatch static
> checker.
> 
> Dan Carpenter (2):
>   memory: stm32_omm: Fix error handling in stm32_omm_configure()
>   memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()
> 
> [...]

Applied, thanks!

[1/2] memory: stm32_omm: Fix error handling in stm32_omm_configure()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/d44eeb20d9bedce11297a09628ba5dd39db236be
[2/2] memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0169a24036848cf18205301673259bb6879eef97

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


