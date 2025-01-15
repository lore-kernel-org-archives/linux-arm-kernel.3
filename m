Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E70FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZhmJVX2Z/1on+VLI7mM1RgJuJ/QDUUV3rq29Mr1CH4=; b=WfZpWg3t3RPvZt3d3EB+HhVlLP
	wG/afd88pC7IqngyLFKvsOlFHauOOWvvn3JHcs5W6FHFu7aMoBRVt4YLRT9XszFZ+c3LGQKc7y0yg
	3cFctPyWe3WOVlxkafhLYIJzoii8ptKrR3IshImoQKU3HaXbvYQp0kSpJ/By/2NITF/7EnpvR0W07
	Jqyq1SpwoMw1ZoqfwS4Cb+lp2w+CPSMfuLcSvN90U2ab3taqT2vZ4fqmMg2auEmeRDN9FkLdPw9hJ
	3UH8j+IVynJtpLNMFh5OQOe4ugLXlG+xFc3GpxUMJNGMLUpk6EQ5KbdZkDblBLDa9m7Jt+jB9aga/
	MZqdapmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1EY-0000000Bbyn-3W0i;
	Wed, 15 Jan 2025 11:06:50 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1DI-0000000Bbkp-3Uyx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:05:33 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so11271245a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736939132; x=1737543932; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZhmJVX2Z/1on+VLI7mM1RgJuJ/QDUUV3rq29Mr1CH4=;
        b=fXgQETXdQVA9AYLv+aIVX+WWRJYXdG0FzY8YLG6D4k2lsjEYnyhjjCeE3QOTluY+QK
         8mk2z2oHbqb88PaOTiyfkRKh0Tj225W0bQ/dKBT7wsoOqyQIpNQ4/72NQo2rR2s2wFuD
         L5K2pgwieCABIAWCH0BwORCm3nyw5Ns+TY9yqDP105jV6OSWNncXKmtTTzIM3XFPIY/3
         VqsUkaKYhqxSI1+mi5Ea6q/iRMfGJW7c+Ku/lLyQToJPCG+nQu5HOKpeEI7cXcRrLCg5
         FSZJEM4UnTbtToYj8Hyxbe6MckvFJfKfIn4k4kGrnsoiBRGRqONwIE7tqnuHwW46vSr1
         MpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939132; x=1737543932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZhmJVX2Z/1on+VLI7mM1RgJuJ/QDUUV3rq29Mr1CH4=;
        b=sdlymI0ykmLjWUrQgPro2Dz14Gic4KvZA8NG/9rsAKmqZ0s+FxCpf8CVCD0RC9F0H9
         9rouZIJGvSzLHWBkWpF547nGRszvV8JNehYV5a7PNv6GvgoyQZyzjUzwXZrMHk9uSuyp
         W4f8k/iqz4G8x5i04oL/z9mM96bznwZpr/3uV4KpXxhPE3msPjnyrn7oHEzEoyZGbzYQ
         d/U6q0g3dclMIkAn6JiWnjfA0fe+C82+PLTvg8wF+HXHtkNlAkNiAhv/kPvug95GdXav
         UrbTSGkBBpT54mUIfXrJj9spXL+pBBKzXg3AdNwCKW3UC+RZAtncytihsGg4bg2LUWEJ
         rWpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1VsfE2z29rRU1DmWi8WnHbtWjgI+ViaTj7OkfwGiqfAsg02+D1kXYQa7J2MfKL4XD1DucNxDhzWQDJHVQnBWU@lists.infradead.org
X-Gm-Message-State: AOJu0YyI/HJOmZZVFU8ByfitohCUxKpfv7DAY+OLxLKDlV+1ItmvQ5Kw
	X1aGM/pytDK+JwHBm4m+llOtmLZdliDSU9CvO3X1VDXt/VyGfWIi
X-Gm-Gg: ASbGncvadVCWHSLd2lJDGpurySFC3VDqErkoXTH/yM6S/TApp8aQlwLmmW0OrJWps7W
	jslwPJe6Tlij8XGsj1NOdzeenYlENS+YtfXoQHXDdpIEav2NrxnfaNObElQfPiB15dAG1+auvON
	bKgV8k022ogTm25jDeL2SNLaKHBydyhwOQqovr+2eNQJK5iSy/8xSzRJGCp5Uk4esLlZpT37K+7
	ql4tkIzWBnI8oy0UJwM8pxlQYAHwgKhwQchkoHtivKWhRTfykzUZrNtki0QOAfUFE5aA6hIpI0K
	uMNuSynXDo0havdS3mcwUsg6RuTJPqIqlSQ=
X-Google-Smtp-Source: AGHT+IEIUJ161wQLQ7M7tzPplUbCNDBmqlqWnABZRELuVW2sGY23Vkufmemaywh2bkhh0gVhD2Yq9A==
X-Received: by 2002:a17:90b:264c:b0:2ee:9b2c:3253 with SMTP id 98e67ed59e1d1-2f5490c20e7mr40326717a91.30.1736939131935;
        Wed, 15 Jan 2025 03:05:31 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c22b474sm1111164a91.44.2025.01.15.03.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 03:05:31 -0800 (PST)
Message-ID: <da332a44-8fbe-40c3-8053-c4c9fdfc8746@gmail.com>
Date: Wed, 15 Jan 2025 19:05:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 Andrew Lunn <andrew@lunn.ch>, schung@nuvoton.com, peppe.cavallaro@st.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
 <2cf758f2-529e-4ccd-9dc1-18fc29ad5ac0@gmail.com>
 <990a3fc9-7fd6-49b6-8918-d5bf4ae48953@molgen.mpg.de>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <990a3fc9-7fd6-49b6-8918-d5bf4ae48953@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_030532_872970_9601F160 
X-CRM114-Status: GOOD (  24.94  )
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

Dear Paul,

Thank you for your kind reply.

Paul Menzel 於 1/15/2025 5:22 PM 寫道:
> Dear Joey,
>
>
> Thank you for your prompt reply.
>
>
> Am 15.01.25 um 10:03 schrieb Joey Lu:
>
>> Paul Menzel 於 1/14/2025 9:49 AM 寫道:
>
> […]
>
>>> Am 13.01.25 um 00:54 schrieb Joey Lu:
>>>> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac 
>>>> driver.
>
> […]
>
>>> Also, please document how tested the driver. Maybe even paste new 
>>> log messages.
>>
>> These are the kernel configurations for testing the MA35D1 GMAC 
>> driver: ARCH_MA35, STMMAC_PLATFORM, DWMAC_NUVOTON.
>>
>> I'm not sure if this information is sufficient, so please provide 
>> some guidance on what else I should include to meet your requirements.
>
> I’d be interested on what hardware you tested it. Probably some 
> evaluation or customer reference board.
The driver has been validated on our development boards, 
NuMaker-IoT-MA35D1-A1 and NuMaker-HMI-MA35D1-S1.
>
>> I will include the log messages at the end of the email.
>
> Awesome. Thank you. Personally, I also like to see those in the commit 
> message.
Understood. I will include in the commit message in the next patch.
>
>>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>
>>> As you use your company email address in the AUTHOR line below, 
>>> please also add that email address to the commit message (and maybe 
>>> even as the author).
>>
>> I will update the AUTHOR to use my personal email address instead of 
>> the company email.
>
> Understood. (yclu4@nuvoton.com is also personal, but the Gmail address 
> is private, I guess. ;-)).
Oops, I meant to say "private" instead.
>
> For statistics, how companies contribute to the Linux kernel, having 
> the company address somewhere would be nice though, as you are doing 
> this as your work at Nuvoton, right?
I will keep the company information in the driver header as you mentioned.
>
>>>> ---
>>>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>>>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>>>>   .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 
>>>> ++++++++++++++++++
>>>>   3 files changed, 191 insertions(+)
>>>>   create mode 100644 
>>>> drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>
> […]
>
>> log:
>>
>> [    T0] Booting Linux on physical CPU 0x0000000000 [0x411fd040]
>
> Out of curiosity, how do you get these timestamps T0, T1, …?
>
> […]
>
>
> Thank you and kind regards,
>
> Paul

I simply forgot to enable CONFIG_PRINTK_TIME. Here is what the log looks 
like after enabling it.

[    1.886100] nuvoton-dwmac 40120000.ethernet: TX Checksum insertion 
supported
[    1.893104] nuvoton-dwmac 40120000.ethernet: Enhanced/Alternate 
descriptors
[    1.900048] nuvoton-dwmac 40120000.ethernet: Enabled extended descriptors
[    1.906806] nuvoton-dwmac 40120000.ethernet: Ring mode enabled
[    1.912611] nuvoton-dwmac 40120000.ethernet: Enable RX Mitigation via 
HW Watchdog Timer

BR,

Joey



