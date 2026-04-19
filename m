Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3B6EA719D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 21:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3M1MaUHGzn+cfnIYT0AwYFeLYCGE/VmNLUEv5pP3SyY=; b=Yebu9Ymqi41DF+yEO2afbz4oGd
	Yv3KQYm4dIGmRbGftDoVx1ctqOYnMhjzDu8sb1LKw99bPLjCQWPKCoWNLJcJmXiM80Ys7PGOH0Oxu
	yP4Y+rq+35gns13p5fR6hKIwbnAIbYogwn8wKgLgokDr0/rNvdp0VaRySYhp0PE1bqv5FPK0OtZGt
	fJ3prM/PUO7KrHijQ80ii1qDeI1L1z3/Ni9yEMAM4wVf+ZckZE11nqvNlMXV8TTCpGkKmXrF9Fi4Z
	jB7Zw8fULKHep7dDT/Z7HHDBUAnR/z613vqAfjx/eme1xK/s3xa+WvA7TKDuix8xDSqEu8quW3E5M
	FFI/O0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZN7-000000065PV-1Szj;
	Sun, 19 Apr 2026 21:08:05 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZN3-000000065P7-3tGn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 21:08:03 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2c156c4a9efso2818698eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 14:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776632880; x=1777237680; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3M1MaUHGzn+cfnIYT0AwYFeLYCGE/VmNLUEv5pP3SyY=;
        b=JsGykNPcSvhTq53PFgcEdQ9h9lkHHGEbx2DvXxNfJX+mmLRUiolx1XoEmgcIZ9q80Y
         2ksQEphJ36XqzADREd2JTN2SjF1FLpe6qL2dyFyiPVVNdQ5qQJzV4pYA8ELB179lsDFd
         V1sweXe1Tq7IYsfBN5Qk6XhaC8Jy0pUHB4m90ga+DVUMQlUT80DlTTJm2RZ3UwmZ4gz3
         qRTq/Gu49+VHm67Wp5ep+X3RXzLGpc8ISnZMLKiB0Lvy3E0kPX+cIba3X5SLpLD5eUmQ
         NpqPdwdDsBTUBKxm0nIoTCqwTIvRJBD8ovFn3TzhQh5EtNyMjhqBbS+IMMl01/N9EcBh
         nlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776632880; x=1777237680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3M1MaUHGzn+cfnIYT0AwYFeLYCGE/VmNLUEv5pP3SyY=;
        b=A3SvrDWCr6TEfWZKAIMQ/E/o68yQ3UZQLv3GnPDErbtSvDLs9Tm67ZCi7auePn7Cgb
         Ok9jehf2XDMgh8Bko9cK1qw0Drvf/5LHp1p3cvAdeghrgBXN6R45zRAg4v/Cta424t3D
         nH7AnU8s9RV9zgtZ72RgwuPmwXY87Jp0546otQsk5v4cVNYQEPkuShFAhdG2iFKorUd3
         QRu80flgUVJZOuOB+rrN22aMOzUuCXcFIizExb3yU8J0R8VPv81xDSPUc7QrjLsXfiRd
         7G6T8phXUv1uckamcY+3xAV/JG35Z6BSbDiTKDw1UXEWSplSxnIG87RlKb2VU3KWCsv6
         GZ5w==
X-Forwarded-Encrypted: i=1; AFNElJ/dJH/y5jkKoDQ0tnOxkC6dJTivwGt9gmC2Ur4p4ifis78N6Rn+fN3RiyeyUxAH3WCevDoHP5Z3b6fNBtyPc0Wb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo8mJK2cpqe0P8+e1HLNNz98+m9J2zaSOzCBU2H5fu2Eb2d/14
	XWKjFGy4ui4OCCSSFE0lIzCCI+pqpMHZ4C5yvsi9ahrqWg9vc0IcV5JV
X-Gm-Gg: AeBDiesaeeu78fyu+Piuym1cde0ih1yLJj7VSQt8ulIVda4mgBNPH7Ue4xsGohSxf3c
	Nj1fB2jLgrJFuNFld8lf+6TDFIiWEgI+wcIin9AJSLftLde2PVk5plZd1t/jTt8HlT4ESBLKgru
	mt5l7A5yjGyTl+HpwTNuawtjbtzj0TJk5Y8cjRyrc/SGBWyC0ue0aJauuHNDUwYBHGY6ZLapTlX
	edvQzDJHqfumrtfMRJKLUdsMJF68nBNOOq+FblBoRVv1AAI2q7rilL/CMr415SGJTy0MRvZuQJx
	Q8B3mcRBg6njFnB4s+CdamWpJt0NcEc9fvXFzaZkqBnT7cYONqvAz+HyLdBsP64lXwyQ8LLsiVa
	oBfeP1zfHbkGmhSzEJoPvOcJjDGtsbydfVopjwKl2qxz8K+t/OKqaTTdtmHwoHTwGiX39ZzA3ou
	lfXr5a4tCZ6HeSF8E1+mDXeTJ1cQdlL6KTbDpbbcBjmoLIAsVQckRNctkHFPJbeoBwmTj0u1H/n
	AH+HXxxmGY=
X-Received: by 2002:a05:7022:4393:b0:12c:4928:e57e with SMTP id a92af1059eb24-12c73f920bdmr4395154c88.21.1776632880241;
        Sun, 19 Apr 2026 14:08:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e79c2954f6sm5288391eec.30.2026.04.19.14.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 14:07:59 -0700 (PDT)
Message-ID: <aa801626-2e33-489a-931f-600540fe4ae3@roeck-us.net>
Date: Sun, 19 Apr 2026 14:07:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: ixp4xx: fix reference leak on
 platform_device_register() failure
To: Linus Walleij <linusw@kernel.org>,
 Guangshuo Li <lgs201920130244@gmail.com>
Cc: Imre Kaloz <kaloz@openwrt.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260413154727.3051321-1-lgs201920130244@gmail.com>
 <CAD++jLnC5MGg1e_Suv6BD_=XKbsn1aLxHxRfCdD3Nos+2XRzfw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAD++jLnC5MGg1e_Suv6BD_=XKbsn1aLxHxRfCdD3Nos+2XRzfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_140801_973899_0387C72F 
X-CRM114-Status: GOOD (  20.04  )
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

On 4/19/26 13:22, Linus Walleij wrote:
> Hi Guangshuo,
> 
> thanks for your patch!
> 
> On Mon, Apr 13, 2026 at 5:47 PM Guangshuo Li <lgs201920130244@gmail.com> wrote:
> 
>> ixp4xx_timer_probe() directly returns the result of
>> platform_device_register(&ixp4xx_watchdog_device). When registration
>> fails, the embedded struct device in ixp4xx_watchdog_device has already
>> been initialized by device_initialize(), but the failure path does not
>> drop the device reference, leading to a reference leak.
> (...)
> 
>> -       return platform_device_register(&ixp4xx_watchdog_device);
>> +       ret = platform_device_register(&ixp4xx_watchdog_device);
>> +       if (ret)
>> +               platform_device_put(&ixp4xx_watchdog_device);
> 
> If the problem in the description is indeed there, it seems the bug
> is inside platform_device_register(), surely a function returning an
> error code is supposed to clean up any resources it takes before
> returning an error. It seems wrong to try to fix this in all the
> consumers.
> 

 From platform_device_register():

/**
  * platform_device_register - add a platform-level device
  * @pdev: platform device we're adding
  *
  * NOTE: _Never_ directly free @pdev after calling this function, even if it
  * returned an error! Always use platform_device_put() to give up the
  * reference initialised in this function instead.
  */

Not that any code actually does that as far as I can see, but isn't
the above doing exactly what the comment suggests ?

Thanks,
Guenter


