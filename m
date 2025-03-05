Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95917C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/EDlj+KCqtnghUmkpWYPx5sg24VjMYJxMv5mgQVSzE=; b=eIs4Yz4Hs9I+MTk+8gvbdJg0By
	FRIV7bgSNjFJ3zLr25gCUOadYYA1U6XT8mSX2URYLIxdjMiKdaOUGbm9GS2FxYbeinp4l/BFFkRG+
	GuOb76WpZ0nm1r8juPf6Hdv1UfW5AWMOrUyanA9KAEjnQygsP+we/qu95bUETdxrNGcl3iicC7TSQ
	QncYL39vVgVi+iMElp4zL1ACAxVKqoPbj8fy8FDvVXBcFOaYSnLxHPWhZ236WBPDAOi3Xo3JsPZ9m
	5ai1HGQ7kO18gDjLIvcjlKozG9PjnD2rIGGArohwseBPOSBJeS5CqqInK+t5Nbs2JqoK1whXFD+BW
	cogAi/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpppK-00000008Mm3-1rP4;
	Wed, 05 Mar 2025 14:34:26 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppeQ-00000008Kww-03r9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:23:11 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-390ec449556so5807233f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 06:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741184588; x=1741789388; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/EDlj+KCqtnghUmkpWYPx5sg24VjMYJxMv5mgQVSzE=;
        b=vkFDoElM+npOZiB8QprxRP8Uwo0N5WTCRnYdU4bELagYdpeUDrlb75EdQDQ9qYyONc
         gZuT9qXj9MjPgukCOhLcQnt1MBHoCDeZX6jym+Rp4axKDtESIfBSY4acldNGaCznM6KI
         ZzvtpIalgJqpG0cLWVOIIt2ekkodRuB2j2t2sGyWd+bmCSTdx37v3cH/XU46OXEY2j98
         yh7QMrXVoCg7/5vPlqfE1Ow5R4sHmnl3fiPn5hgtRHckRBXC69JkKYRXMESwG1RatStL
         0nMB6bNbALjDUidNBgjXcu+EZY8hhOTAwSAprEGoN45ItJQkze2sJscodPo6hWiIhXZW
         WGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184588; x=1741789388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/EDlj+KCqtnghUmkpWYPx5sg24VjMYJxMv5mgQVSzE=;
        b=HqPxTOSbPmV+Rfow3L/y4PZY00ev2eLj0i32xINr5njTj+wXWFGZG50QjM+Y6ORFTc
         QZVtOeNW23lhbZdpV3Wqq7b0EofikdAAJbDBzxaXx3eJGEjUyKfEa64jyXhZpAG+y2Fd
         zMKwWLmFSetxwYds9Bo1gBb0tCC23tXS9J6/Ru7GQJTS8MSIc8G3uioN67VNVvKSVNBv
         pB5ihYQ6BdxLaQjMAtoqLdvghHV3fhgKVqZ6Ib4avX/08XRQKJTJhQh2bCZXkoIz5OH9
         m5Vn9I0rxd+wJp7vzK2WseVyhMeWLHJ4YvtFeTwL58BzvLSKwfZI/APCmhgzhO9CPUis
         N+/A==
X-Forwarded-Encrypted: i=1; AJvYcCXto/KeKsdwt3nzmOdL8RpGpeM+GA6w8lyMLPzRDd+Zry13/gbd4jbN4XQSuCGEYPovMqfJVYIb/bXgIKSNqbJb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7yuSV4/xrrBgtFoGfIHgyf+BiEKGishWFJ56wknCSEHZDez4C
	WOcUiVeNh7PfFqyG8miRUcj0T1cYlvLrN0Jy+96k9LGHenbJPG3LH/MLBD7Ygu4=
X-Gm-Gg: ASbGncvfqHdvocRbNMEeKUjSogqR2nk+QPqFr1ASoceB4lfBJfPHZWoV34ZpV6SqsFD
	nyyR1KqeJj2RLiowXXFxl3AeNhgnAk9u7HcJXovkLo4shM9rK3SxpYesUM7RBVUDDhedoqCA0QT
	48Fiz81t5o3fJcXwqkO6cdSNlXt/wU00IW4Z1cYRYPo8sjsUaWEw0M6IDAYyyjTj0JnldCdombG
	O9kxCgn1CtbQOH77PBuWzBFjO1nKXOjN738T6YM1WE0fWkpGPpErLdOQ+WdQkgel38KjOkuS/mK
	AOSLFePcIJUuwKw1awyYOr15Y+QkZm1FPwbktoDdR7FGlcCrqnt4ZA==
X-Google-Smtp-Source: AGHT+IFhtHEtHPZDbikFBxfqwSObZ6We/RGoyHTAtxKyvh9iiCUNxXuSQTE/D9Gy3GIUTiWcaX07Kg==
X-Received: by 2002:a5d:5886:0:b0:391:2e7:67ff with SMTP id ffacd0b85a97d-3911f724d55mr2796904f8f.10.1741184587814;
        Wed, 05 Mar 2025 06:23:07 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7ddesm21390361f8f.57.2025.03.05.06.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 06:23:07 -0800 (PST)
Message-ID: <9063abd1-b417-4623-b44d-fcb18f3c71b7@linaro.org>
Date: Wed, 5 Mar 2025 14:23:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: samsung: Add missing mod_devicetable.h header
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org>
 <20250304-clk-samsung-headers-cleanup-v1-1-81718e38246e@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250304-clk-samsung-headers-cleanup-v1-1-81718e38246e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_062310_060656_64DA5D72 
X-CRM114-Status: UNSURE (   8.70  )
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



On 3/4/25 6:45 PM, Krzysztof Kozlowski wrote:
>  drivers/clk/samsung/clk-exynos-audss.c   | 1 +
>  drivers/clk/samsung/clk-exynos-clkout.c  | 1 +

drivers/clk/samsung/clk-exynos2200.c can benefit of the inclusion too.

>  drivers/clk/samsung/clk-exynos3250.c     | 2 +-

drivers/clk/samsung/clk-exynos4.c too

>  drivers/clk/samsung/clk-exynos4412-isp.c | 1 +

drivers/clk/samsung/clk-exynos5-subcmu.c too

>  drivers/clk/samsung/clk-exynos5250.c     | 1 +
>  drivers/clk/samsung/clk-exynos5420.c     | 1 +
>  drivers/clk/samsung/clk-exynos5433.c     | 1 +

drivers/clk/samsung/clk-exynos7870.c too

>  drivers/clk/samsung/clk-exynos7885.c     | 1 +
>  drivers/clk/samsung/clk-exynos850.c      | 1 +
>  drivers/clk/samsung/clk-exynos8895.c     | 1 +
>  drivers/clk/samsung/clk-exynos990.c      | 1 +
>  drivers/clk/samsung/clk-exynosautov9.c   | 1 +
>  drivers/clk/samsung/clk-exynosautov920.c | 1 +
>  drivers/clk/samsung/clk-fsd.c            | 1 +
>  drivers/clk/samsung/clk-gs101.c          | 1 +
>  drivers/clk/samsung/clk-s5pv210-audss.c  | 1 +

drivers/clk/samsung/clk.c and drivers/clk/samsung/clk.h too.

With that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

>  16 files changed, 16 insertions(+), 1 deletion(-)



