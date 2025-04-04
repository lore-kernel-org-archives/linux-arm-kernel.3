Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A38C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAGsnLdrspAycxCBxeKM44JqaHnIQt6B7n8T1zYYWxs=; b=osh0NcAFAavCNmO2odHCHJpZ5z
	UUr6tp7RH8dHUrESLy+Fj1AkWJ8zbelcm4v27tKnZ3oeF2uXgvpljeA/0bGk8/0A8oginVVSoJ2nH
	7vHJFTzbbfQ7fOT6wzwT+VvFv9Z1OCb3rKNVA4zzNqaLGM/e/L4p59fQIROR9jFuO2UWnvyHWr5dZ
	YEMeb3r+Dt4s0tYbH2orFZoq/kytZSuy7+Zxcs1fc/7D/h5Ec0q8oLB1hTzyN8QFqHwuR18VQHHck
	mYIg1g/+/Oyk/HPJ1fFkelWu15kv+DYasilLdYdtZZlthTuxzOPUYunciws8bSqGzIgQ/SLossCnw
	+UTCzUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kA9-0000000CJzL-3KbJ;
	Fri, 04 Apr 2025 16:45:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0k8O-0000000CJmu-0p2N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 16:43:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3912387cf48so123093f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784990; x=1744389790; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xAGsnLdrspAycxCBxeKM44JqaHnIQt6B7n8T1zYYWxs=;
        b=hAF6Jzi782gw4ofEUMwzQ+EAZrJ8JF4uRMFp6ZZz0273FSmI0sYJgR/ArbvellMeWr
         3HhEagZsgrMo7FHrOTMIy41G71awP0ZqNwT7I0SYLoirxlIUYdO8aoqyVlAGqpz8SxhU
         jWQRGLNWuOYvS78YlZQ/d8lItzEZBcw2maMLYxwxVwNgtjIKXfJwHlFrkprNOaJNoRrx
         mE0QxcmMdZVR+AN/BKphE4LHaf5tZZJOG+jOEwmfgyl/09UQExqOt1BDu3BYyqDtkHds
         I7DlUlsww4FjXreYfn8SMg4/WyFMi6Q1ueTapIMt8IWyuKhTIVdIHtLGYeSoHOE/HkFR
         6SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784990; x=1744389790;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAGsnLdrspAycxCBxeKM44JqaHnIQt6B7n8T1zYYWxs=;
        b=wigEidMMTt6DvL3mJhSDJSg1HWF0Xk64dFe4R1EGpVW5VpjWHxRtfdFavzrZbyZpK8
         Z4rg7ooNlo3UKfzPP0Pm40EDxLFfm62UZKkWagkjEFdndZjaB4vRgVyABJAIzAE1jFbA
         q9YRMhK1eic4vfoDzr2pbwkwL2tNjChu6tUoavAKb9JEl/oackPnkYHt0Np0QmMBM7FV
         JUN6Dm7u4NDR0luBE7vutFItddtUI11AlnYYEPRTq6DYZ/WtU9WCeNfEjmqoKiXZ+Z33
         2b/ymAk/tejfa73ybLlR/0a+ZjKGTGgU9aF37I/GIvSqcXrG+hgIYcyCz42+zOcji59L
         hIpA==
X-Forwarded-Encrypted: i=1; AJvYcCUOHjkGB1JkjJGnXH0Fh+pzMl/3DMsGpPLnydz6/avF+0Roie9FWwKNky6TeiGlEa4KL+fK/3Sh7bcBpdEfVUCo@lists.infradead.org
X-Gm-Message-State: AOJu0Yya1Yr2nwWsYoTqGVOYBXpr99O6ReZqs6qoS79SOh4YNurY//Er
	NvBB8b2DHoyh3yZwVXPInTRlyUMEUizmxqmCziDTLCqIrd7+VDtnIaGy17sZZYM=
X-Gm-Gg: ASbGnctgmmjciffo4TWLgpro0JiycaguuI9Z/C5/aqX2GzWL0G0r+ZxvXGXfiRDlddn
	Bv8vSq8pp2Mn3qi9bXS9QxvSPxIeQHbhVVtZKMb/8Gg3MaOKS5rU8uwrGni3ar1lBiE9ZGIw6Pe
	bRJ8j1Omy+O1mqOy62ycOwZxLpQoUmOYH4/78nrWim9c6ILnQXoQrcG5zNjo3gopP/ArUVqEXgI
	9WQwhSxh2Se50QIRSiz8DKAineY8ApvlFYQ23Xdqk1rIVNawxo7inQJJgYk0nBeFHBnqAPhirbz
	bI8DL6ZTQsq4Pik2GbFsjf3KiWMHHTTZOX1Bsz2abaf8afMam9hz0DVBsYxEzFgI
X-Google-Smtp-Source: AGHT+IG2IbUlYSnGQ6rLAHHC6qjUasnOVdNNxP1zU9JNrvGwlwZmuhSUx3coIjZGTA3VjYqWTFYtwQ==
X-Received: by 2002:a05:600c:1d05:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-43ecfa03395mr12662335e9.4.1743784990341;
        Fri, 04 Apr 2025 09:43:10 -0700 (PDT)
Received: from [192.168.1.106] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bf258sm50009095e9.23.2025.04.04.09.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 09:43:09 -0700 (PDT)
Message-ID: <c5319e0f-6388-4f9a-82dd-526fdeb4ae26@linaro.org>
Date: Fri, 4 Apr 2025 18:43:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: sunxi-ng: Do not enable by default during
 compile testing
To: Andre Przywara <andre.przywara@arm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?=
 <emilio@elopez.com.ar>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
 <20250404151320.53c4698b@donnerap.manchester.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250404151320.53c4698b@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_094312_250820_EC3A5BBF 
X-CRM114-Status: GOOD (  15.32  )
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

On 04/04/2025 16:13, Andre Przywara wrote:
> On Fri, 04 Apr 2025 13:57:00 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> Hi 
>> Enabling the compile test should not cause automatic enabling of all
>> drivers.  Restrict the default to ARCH also for individual drivers, even
>> though their choice is not visible without selecting parent Kconfig
>> symbol, because otherwise selecting parent would select the child during
>> compile testing.
> 
> so I remember we changed this to "default y", because there were some
> tricky problems with regards to RISC-V and ARM. See commits:
> 
> commit 0ff347db4c97cc16b4e428dc1db550ba3628f1e2
> Author: Samuel Holland <samuel@sholland.org>
> Date:   Sat Dec 31 17:14:25 2022 -0600
>     clk: sunxi-ng: Move SoC driver conditions to dependencies
> 
> and 
> 
> commit a26dc096f683ca27ac5e68703bfd3098b4212abd
> Author: Samuel Holland <samuel@sholland.org>
> Date:   Sat Dec 31 17:14:24 2022 -0600
>     clk: sunxi-ng: Remove duplicate ARCH_SUNXI dependencies
> 
> Don't remember what broke, exactly, but just wanted to give a heads up.
> 
Hm, I missed that. Quite unexpected commits.

I would expect they to change default to match exact case but apparently
for simplicity they became default for everyone? No clue...

Commit says:
" Do not duplicate the same expression on the `default` line, so the two
lines do not need to be kept in sync."
what it did, but not WHY.

Why is the most important thing...

The rest of the commit msg:
"Drivers stay disabled under COMPILE_TEST because of the `default
ARCH_SUNXI` applied to SUNXI_CCU."

is true, until you enable SUNXI_CCU. Then all of them became enabled by
default, which is not necessary and in general not welcomed. You should
compile test only things which you want, not everything.

Best regards,
Krzysztof

