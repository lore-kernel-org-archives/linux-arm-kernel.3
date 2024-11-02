Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B3BE6F09A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 02:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52ooFznqeRMYHCyQ/j8hVCDyBghXj5ug7pBFSOFL7Wc=; b=VcNb8DxxP3L3Y0CNgtR9xF7HAi
	8jMzye03IzfPydwqzlXX+Kbr5X6Gmj0jW+86WGz/FpBdkalWTtGJM8axDnWcH3DHlp6L4Z5oX5dFi
	3GbhCPnM7r5IK91PQyfuIA0wN+vesIWdg3xTYxT6XFTcngYrpDT+VJvwSaPYPigP3skWfbqfolfRV
	1ASSuYivfRZvSG02ge2Fzpza77cfOz38zXpVNuI4cbI80h3t29kjj/Nax6h7iGLGljdpKhns5Pw+C
	81vLHj1bNJ4PoVbnnc+Y/PwGwm6x0O/xVRkLoVwwyhqWd165Gj1k2Lh9ib8Utpg3bqJW6NBS4GT+y
	fSIdsaZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t742G-00000008tdX-40lg;
	Sat, 02 Nov 2024 02:38:44 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t740a-00000008tXV-3vAb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 02:37:02 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-720d01caa66so1109864b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 19:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730515020; x=1731119820; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52ooFznqeRMYHCyQ/j8hVCDyBghXj5ug7pBFSOFL7Wc=;
        b=meuTaNbWZwvTqJ442rY10JNBS7th3K/l+vxpMfiy6TCai06eoW6eXsl1NS2nV0YyNp
         5mQLoyIK+vY1s7lN3YEgcn0onLKpx0mHWl0MtcX7JIY6mhDcuUBnJxpPNurJ50z9eeBE
         +d/QwWHsrkeGeurbUfVs/wo+juhGmbVSCTV9dJ9QYzIzTR8qvehykXKcbGGkOPdy7T4N
         b2JGIpzoD0cbYfMJTNU3Qm3qk2JLSip0E9ueq1YPcwOuSJkSjIFfVWaJ7RrGC1UEksOM
         zobZEk3DGt0okFAnsWPZ4P18IaL4uXqLM0D5ztsbTXcWdLr6pCgBhL70fTYIYegEZwCw
         0M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730515020; x=1731119820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52ooFznqeRMYHCyQ/j8hVCDyBghXj5ug7pBFSOFL7Wc=;
        b=Bq/RsNz/+XJdWrAKABaQXmhtte6zxBlRkd3BM8HZ9rQ/mbVjPmUQ5cXhjSkssmkuKn
         U/D8gP+mOsM+OCHFvFtGH++HmKMZQRK4S1FNROV7IshVbqeeCkNkCE8hx9D55jMsIgiY
         fPrxLmt/e802ZZR8j3v99blhsQWB0eBRv+adffHTUNh6iqZcWIrXjfYg8gqhzCHlPMZw
         jR8qIXL/Kc9vx52YV6Jnk7bg6o5kH+e3x9O+bSsCQZVm1hYkATUK0g8SK61zLCWlJG3n
         O1vEUON00znEoqzmHNcyxS+3zwTQ0bYArK7rerdBcXiaEc0i3HnALQ0mWEZwglajjhiw
         rQtg==
X-Forwarded-Encrypted: i=1; AJvYcCVWb0QzbpC9Eaw0gibXGMVCrSrY4coPPLHXCdBzqUqgC2IfXCY/rQNi8c/0M7yJ21evTWEk9I5Hiq1PpR/tdyjo@lists.infradead.org
X-Gm-Message-State: AOJu0YwUxREPd3su/PvhGXX5Z6gelu8CvWefUDmMuno6kx3ZIuyvZk7u
	CJ81B3C/BJmKzSwKd/ST9abDO3e7VYVJc+jynLBSQa+Dl7amihAe4ed1OUsG
X-Google-Smtp-Source: AGHT+IGQ9zfRcHvemJpUmA2q1CaZU/zY095T+aeF4SHQo9LbXPUf1m6TDA8Q4+PugPH5HaynDPT5mA==
X-Received: by 2002:a05:6a21:710a:b0:1d9:a1c:7086 with SMTP id adf61e73a8af0-1db91ec3ed9mr13201042637.44.1730515019885;
        Fri, 01 Nov 2024 19:36:59 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ba19asm3338528b3a.21.2024.11.01.19.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 19:36:59 -0700 (PDT)
Message-ID: <46b31874-9fe2-4534-9777-816765a265b1@gmail.com>
Date: Sat, 2 Nov 2024 10:36:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: apple,spi: Add binding for Apple
 SPI controllers
Content-Language: en-MW
To: j@jannau.net, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
 <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_193701_013812_DC9AA71E 
X-CRM114-Status: UNSURE (   8.22  )
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



On 2/11/2024 03:26, Janne Grunau via B4 Relay wrote:

[...]
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-spi
> +          - apple,t8112-spi
> +          - apple,t6000-spi
> +      - const: apple,spi
Apple A7-A11 SoCs seems to use a Samsung SPI block, so apple,spi is too
generic. Fallback to something like apple,t8103-spi instead.

[...]

Nick Chan

