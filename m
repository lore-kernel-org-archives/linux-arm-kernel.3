Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8415FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uRu5nQyrLyd024c4GgxWgq+XB9/FTQF5GXDspXFMIg=; b=H+0nlQgNJ0yzsA6cHIEBAdV+Qm
	89x4Q8UPcXr+iPfqBoQBjSFeoHPTnE5sBHLq1hCRbhlNmyDEbzCS1EaqEt2XWtFHjevyI501dNgjy
	n2IEQ9BLerfHEEFXEQF7G4PE3Z7HeBVnplrOWabd6P7YRvTm7nUff5hyrxK3gSh1zbGv0pwrdirin
	tUsqhpOlRQWwN6POQKBmxVjUJyPPXFW7nB6wZisF8Hco50xnjXNPWf04WndfoiEZCskYlHP76p/qc
	39uVRYA18Zjuq5q8eJFiSpKUYkSgo/hfAnSm/vpbJKVa5vmNRyMpZSXoxfKIAs307o26RodwkwBwo
	7nDvzetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjvR-0000000AF42-1d5n;
	Mon, 23 Dec 2024 15:00:53 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjuF-0000000AEst-10zs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 14:59:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa69599b4b0so72736266b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 06:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734965977; x=1735570777; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1uRu5nQyrLyd024c4GgxWgq+XB9/FTQF5GXDspXFMIg=;
        b=qzSX35qtjSYzOzOCV3CPIpVVAFQOnLocyioHuaGGgeee2/5eFzDqsDPRCiLVKl7S/g
         nWLvzR+9tin9dw++xSIeR4gODAo5S6JImjCyI5khvAoFpk03R4ZL2LOH+FXtleaI8hjy
         a88x8sSqEmBY1W00amvpZgv7w3e54P7eq/vkp3SlzrZHzcshjGyFrkSXtE1eY7DuZ+no
         dkUc7pNbjKKd9NtqqtFK8ghYAivnK7yUvTcMNqt18duXSACu4a6NXQ8gVcFvHaUPY3ka
         P/KAJ9ROOw7eoT9bjCUGMmqAsanCro8cw5fD3d45HU8uPhjA89aTZedNi8HNDYpjj+fc
         8Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734965977; x=1735570777;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uRu5nQyrLyd024c4GgxWgq+XB9/FTQF5GXDspXFMIg=;
        b=U1wtBvcEkDWX1ykbGWHd0NesQ3FIgHRSyT+JU4aaSIzFL4JCcuX5Oo3M5U3n3SH6cb
         W95/vZI2JLYHLzbb8SQoKdJSNLHj+3u6sXFhMsz7JiEPAgAcjU3l2jzEnwu8TG8xWE6e
         9i9ulO4doFdzykmYiecukj6I1JE3igUTdMSOd9uf4y47UwGPsq4a/HYHNqjabh4J12Ne
         plgO1+1BW5xtoB8YMmV7T87NrLwxCW1LlOrfxo43/DryrA0eectkKQH+bV6xZPugcsZ5
         BXnqRil45YNuDrZmGOJpDtInLL/l4DsMYet6WaXXY4DwnX07egKB9A9JpBoEuVuyE5b2
         PiFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkv5SOYrcvI0MVkpRKBNJPpFiD0xrJU7Lynu6ztKXgMDH7iQxQ/dh4nx/gqIJaRJULUZXd9Jjo/5c+6JSSyLip@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0u3kaIqDUZkdFHOTaXVHBWXYx7xz8kQV1c/W+vv5dTxqlPI1k
	+TjEzXLILCO99oWotbhTtZxHgMFIwYpy0XKWyrCFRE2osMl0sFTT2rAIU1ELk9c=
X-Gm-Gg: ASbGncsQ6VPq2rXRJ1GXHJAStmN7zq7wioQpM701NEVeBGwlGe4Y3NGgbVMY/5pQrPm
	OraBtW5i0uRcka1wmFGuYM7kspSb+MSHcgDQ/p8EA8u3ztrtKUGVa6AFclQS/zjDsJEESa2CF5O
	uvA+dHEpUur9eIq389G/KhFccbyzYvK0RZXO7aL1PwC/rRZLeSIW/nLbLr3uK7KvNTrlZLV5LUg
	BtmscS/EzlI7Iyuq899QOpz8ZQRLbW885U+LIQ0VbyHvcAqw9uqogoUweY6ecEW4BDg3LMu2DuR
	G2No7gEZrLKm8vPOFYKC2/JHCBF78JkxaaM=
X-Google-Smtp-Source: AGHT+IFzTKVs742D0LiKhM41fuwbaKkjbYRbYUxkAFc2TI8QrEw8k83NVADsJYQCjRcyVfMKqUJZVw==
X-Received: by 2002:a17:906:3099:b0:aae:83c7:fd4e with SMTP id a640c23a62f3a-aae83c80390mr313891466b.13.1734965977062;
        Mon, 23 Dec 2024 06:59:37 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eadcd88sm519889566b.81.2024.12.23.06.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 06:59:36 -0800 (PST)
Message-ID: <3c52d18c-e4df-4879-86ba-0c7e4fdc13d1@linaro.org>
Date: Mon, 23 Dec 2024 15:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mfd: syscon: Remove the platform driver support
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Pankaj Dubey <pankaj.dubey@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>,
 John Madieu <john.madieu.xa@bp.renesas.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
 <20241217-syscon-fixes-v2-2-4f56d750541d@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241217-syscon-fixes-v2-2-4f56d750541d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_065939_325147_9A67A446 
X-CRM114-Status: GOOD (  13.20  )
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

On 17/12/2024 19:11, Rob Herring (Arm) wrote:
> The platform driver is dead code. It is not used by DT platforms since
> commit bdb0066df96e ("mfd: syscon: Decouple syscon interface from
> platform devices") which said:
> 
>     For non-DT based platforms, this patch keeps syscon platform driver
>     structure so that syscon can be probed and such non-DT based drivers
>     can use syscon_regmap_lookup_by_pdev API and access regmap handles.
>     Once all users of "syscon_regmap_lookup_by_pdev" migrated to DT based,
>     we can completely remove platform driver of syscon, and keep only helper
>     functions to get regmap handles.
> 
> The last user of syscon_regmap_lookup_by_pdevname() was removed in 2018.
> syscon_regmap_lookup_by_pdevname() was then removed in 2019, but that
> commit failed to remove the rest of the platform driver.
> 
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

