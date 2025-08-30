Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C81BCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvZr+jIhkslKZB56cSZ0aYjmrmFIErH1qN8pLQMr07w=; b=iR6oZRiMEhl611pEDeMcV7Rm3g
	qtqRcH1flrkhQ+wdzgsfGwwKsOvqViVGkD3qgjCcTktJlnxm57Z/XTJmrYrMAj9aLDr1U4uxP31z+
	UeUxwgrg9FnmoD/kFlAGPcSIp16Px5b/K6dVDrsONQuekX4tQPVQ13BzwyF2JLp4siUQa0inPUC+B
	KdLt0UNwn9SNXVnMVnYOUwPPW9xG9MFRJye+LXsfdrTk2p42IXfF6WBwWHvbWBzOcBEw0LQkwhlOV
	mIttaJjPbOLIExbT1lq4GzK4ufeKg/4MYLvxlCbF5pvnPcssa7ANYgoodTc91t5yUaebZExhLG+3L
	sIqBYfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLeK-00000007wNY-3LSv;
	Sat, 30 Aug 2025 13:29:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLKp-00000007uXZ-1KHp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 13:09:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b7f52cdf6so507165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 06:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756559374; x=1757164174; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NvZr+jIhkslKZB56cSZ0aYjmrmFIErH1qN8pLQMr07w=;
        b=kGzziYNAP8Un6IHG/SQYNNXXNg6o1x/yOzvyXB9gVYe5rOlqW1TmuiszsglbjtFNEh
         BnHjTkKop5+lafDYtBZbhN54TRWnjM8G+PhLWSa4o4CrjZuto3wmmu/L8AYbM0X4e8+I
         nDY+1tbUssTBPkq9CELdgqxwYXNJqTD53JFngrwUI4azANaepN1zncgiz0ZYnRWVoFTu
         7Mpj8JBWe0LIJ76mPbMWPiNHYqhMARjfgVbA26aTUlsSnKzH5hPdYP0sCu7jekx1FEf/
         Hgup8m/YDt9Oo1iLteHBsSJhZxZqQ0xk5wPVol8s7UTL046Uw64T+uwOHmNJc3w77JFA
         Harg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756559374; x=1757164174;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvZr+jIhkslKZB56cSZ0aYjmrmFIErH1qN8pLQMr07w=;
        b=bg0ARXXdCPzd9PpN8vYY1ilHedMcAvFM8yYuxQtTiiXjIQWmNnQu0W4uToCbk6s5Pa
         oDn+/a933VYlPh623S39WzZV6GX3IRyA92joMRyVqbg3qJWerYgvnH/ficDUnMAAQEsx
         lldXgR45hYaiezzmDN2nR+1XfQxJhezcvNfY440cqQ2vdPqChVbDc6jwZKPef7BeW7lC
         DpWPdKNCnLdeiqduVqdU48ALYju7PbHO1YWhmLu2JrPTCS40eGhnZ/d7XFFk2zYQSbrn
         B1FJXMnLqQqxywGBGnM4pa74KbFb2asxfwp6e9du+ECPl/8dLy6IfjoyXVP6iXKYjoQD
         BDTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoQ4uojXtiI4QSmvHLAa4XS6glBA2ATyRaiLMu63CsinTHqDKpUSeItM06SAMyzvTvEMRHhMM0P9CgLfj3rNP3@lists.infradead.org
X-Gm-Message-State: AOJu0YxgQHMcbqoZrUEujoUnFqHKf03dQiNMiQpt3iS94yDHIFPNeCZU
	dzbIAZc1tgEEpbUzBeyHOmtQxoXI+HtE7rYDOvbS021ycZadDHk3aDb+9OEovgLzP86C2G1c+xD
	jf+Zu
X-Gm-Gg: ASbGncvfy1e4IlsP08fUVK5+s29Rh5RjkrfFlL8+GfA7/gjYZxRkrcnLRLPtbu8j60Z
	Spk0msqR22WTsTmVODbtugBsbYTYmiw76rbTpXtC+HogPpkuCRcOvawmEoN6d+0PXe4sor3t/Fb
	56iRtFdWEzzVPIqgHLjz4Q5yhyUVoi+ZNU2SmyjkURjRlvu53WI31EbUl5geA2EZTpa3RrU3Irt
	8et0hTDMofV/ZR5b4JuEcZHv5toWgsbMjkQJ+sUPEG2s6GOnn0RH58qdaWbmwAzeDf06nK8fnju
	gOeQvg3v5vjvtcrkByKjBjvN5FFaqIYw+Gxw5qAGb4rpkTl/i24mgqTmdkuwRehIXME+rBKnZAJ
	EoMAMk/rEczu8JGjdkjwMGpeaPt4KGuKnMWamo+rwiwE=
X-Google-Smtp-Source: AGHT+IGa11CZQ7OVZSmolgs+BRgFwXxqJG6ECjAUdkPSx7J7mhDxvu3DET96g8lfamRAEETYvSkTZw==
X-Received: by 2002:a05:600c:4f8b:b0:455:f12f:e3fc with SMTP id 5b1f17b1804b1-45b81e92f7fmr22047405e9.2.1756559373590;
        Sat, 30 Aug 2025 06:09:33 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm84593585e9.20.2025.08.30.06.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 06:09:32 -0700 (PDT)
Message-ID: <2bb6af10-c74d-450d-9932-8d161ae56a85@linaro.org>
Date: Sat, 30 Aug 2025 15:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] iio: adc: exynos_adc: Drop touchscreen support
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
 <20250830-s3c-cleanup-adc-v1-2-de54dfb1d9ea@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250830-s3c-cleanup-adc-v1-2-de54dfb1d9ea@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_060935_365749_CC9FFF22 
X-CRM114-Status: UNSURE (   9.61  )
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

On 30/08/2025 13:09, Krzysztof Kozlowski wrote:
> With last user of touchscreen via ADC (S3C24xx SoC) gone, drop the
> remaining code from Samsung SoC ADC driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/iio/adc/exynos_adc.c | 196 +------------------------------------------
>  1 file changed, 1 insertion(+), 195 deletions(-)
> 
I need to drop also touchscreen-s3c2410.h header.

Best regards,
Krzysztof

