Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8081AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 20:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmRXcdjEFTtwWErLiczOTSh5GDvvFaZtrg8q8bv4gpA=; b=hr1jyQZqvajFfavtqpESdPVmMV
	lRIbQee1s5EM6mLC+nhqo5sB09PAaXrTus2Qntp1DZhNRpWVkAy51ocxIqPkcEXHVPdHxLaI0zxY3
	Yw6hL/mOXzktrae/80V2pzkh6SJdbdTLzfKhpbY0qQW3SfjRb0iQ8LlP7Lgn7CSBNIJZsSY4EoGks
	IgcXG5fpiA0ZDxfgP6oqTfd6uIOsPDucNniXBdqA/80BMuCnqEx0BoyeRUdzitXFciGijZcW1Vf+u
	YFSKEmyPNuZRHJuJXKmCry/1pvMaHXOVhkT/IpzUG2NJTI6aGIR2Z2Bpz4sM40StNzJ99NJ4hSYBp
	oAlQnWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJP2-00000008n0P-3d5y;
	Wed, 12 Feb 2025 20:32:12 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJNb-00000008mrX-1nky
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 20:30:44 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ab7c4350826so3058066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 12:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739392242; x=1739997042; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmRXcdjEFTtwWErLiczOTSh5GDvvFaZtrg8q8bv4gpA=;
        b=GXagO6T4HdbcpJD/rzy0jVWwD77zIB2ZRBr6rtsF5fzaHQ2qsT0OahfvK/qkbzuwNp
         mOccaFEa6krpcUxR6kEyY71s+CX//39nIhB3JRESdeWWn0xAr449xkVVt1Sga7PndDTA
         7v6qUQG34JlZ/BCJ2XBnYXJElTEkpmWH23Yzsy3e7yxfaDGBkX3shonqP3cixf44m4R9
         3tZyjiaSckM66YaeOqL1gipB4vh7wzK77cuoJWlPD0o4J2+jSwUO4asklw/HeSSw7KrO
         ZLYxsIPAZDyJ1SQVUqeoK7Xcn0eqhv5rGsufaIGFAV2jfboMESCg1CwqBie+Oz5BDBTX
         Cqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739392242; x=1739997042;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmRXcdjEFTtwWErLiczOTSh5GDvvFaZtrg8q8bv4gpA=;
        b=ue3BHFIxe6iyYJ2j3ELr4eJ3cFKd41QtTkbiOaXM9EOGSQaboqEzeZmI6Y6oqA52y0
         R1zWOX4PKk468znekUsDl8kDlXSQl2xdBnebmjbyTSzFmOHgNC3rhZeS6BUoLw40fbhF
         ek3NaKD4UCAF8NiQfYm+lA97sDIicL+n1qyU7GMLHNaoqwPBxKu7Ud7sQrXmzZT5vyBk
         MLpIZjpLiNk2CwmPVaxdteNAdOWiYtCAPEgRliXaJsDAh35KxaEj10emgmRrrwse+7jD
         wTuu2mlBX0pIlMUJRet+4+G262O2iqYXj2KJ3GqZzP7TO9EDxvT0g+whksrVaGu6+aIF
         q2KA==
X-Forwarded-Encrypted: i=1; AJvYcCWa5EmV0OL9xPCtEnbr+q17WULDhjwExk2WBxU+aDfmp9ENrf6jzpRtNt22aX+YuDvGfMhHW2LMeBLOaybvMBQS@lists.infradead.org
X-Gm-Message-State: AOJu0YzUaryjE0ff7JDK+5wL8QX4Okf7s8xK51bTnea9FVJYrWwI2fEE
	knezq1II4cWDNIAY4vUngdmFJv44mazoXkBXMthOUt9fmx0mdN6iZoUpkfuJrbM=
X-Gm-Gg: ASbGncuITKJ6yVdQozfM1PgUNfYybG2Div6Bxc8CYofp3ZoV+3Sf7XZDDDavY5EWclT
	NtlMYi9aXz0TRw9FzZc2w7WXsNlRTjYLsFDt+C9DqcXBh8sPpLC4/uEBz25cJ+ISLbZv/+L26d6
	MdijT9ewvyiXmPLU9gaBB3khA8TjiV9Y0vxqHXbcu9L6xDPhGHJ4FqOkoLgvumN0JxTKTeK6lF5
	p73GrLpH1J+ypH3rZL3yt1VvYRJbLUugCJ0J6IbCUYD03HcfpsAxiUGdi3xiRhyGvGdz7xroY14
	luJI9YEwobZyspAygCMCgR1KtIvhyw4I9kw=
X-Google-Smtp-Source: AGHT+IEy5MNFfUhE4KoXzS+0qnWcf+fR/v9TpWdLTk4yS/53co/Ga9Puko1DFJtx4WWKhW6Sl6TL2w==
X-Received: by 2002:a17:907:da5:b0:ab6:6176:9dff with SMTP id a640c23a62f3a-ab7f31a654amr186338666b.0.1739392241639;
        Wed, 12 Feb 2025 12:30:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7dd77c151sm418897366b.57.2025.02.12.12.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 12:30:40 -0800 (PST)
Message-ID: <55aed776-ebee-4b0a-a6e0-17732fdd5191@linaro.org>
Date: Wed, 12 Feb 2025 21:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: stih407-usb: Use
 syscon_regmap_lookup_by_phandle_args
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250111185407.183855-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250111185407.183855-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_123043_462278_4676E585 
X-CRM114-Status: GOOD (  12.66  )
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

On 11/01/2025 19:54, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors on missing syscon
> argument, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/phy/st/phy-stih407-usb.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)

Vinod, was this patch lost?

There is review and patch should still apply. Let me know if you need
resend.

Best regards,
Krzysztof

