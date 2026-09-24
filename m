Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C9AC98304
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 01:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ce1YuMyYgEbSKo/+e5CLoiv54uIucnRXju66KzgmBcQ=; b=BP/pylaPTZI6Cevw/i2ieDPAtN
	NzFi2T7CEQJ2waZPxMFcjVoLvAGI+pEvxsSquGxyLURIMNQjt2wcXaYdgCN59BVeS36Bj4bKTEgoG
	q4yPsXcJC8Ktv94JTJmAwnY8Qgb+X0umD29/9DBwCPgDfYO+YFsiydoqo7/6u7IyMBmi6//aUs9rq
	dmZDX4cCLQxV3EbP61vla2jeU7/Mr8hjZwZSgOTD6p56jmqpdPblpHCSlBvApy0Ckd9/7hewjYehe
	6oEdjMsEc6/mV91Uc0dZdcXdW6HFfYbeAsNUt24Rzluy27t13uFKH/1iTljb2jHPyku3spdnXJVt8
	EyJ5A3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YEf-00000009nVR-0iyj;
	Thu, 24 Sep 2026 01:26:53 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YEc-00000009nV2-1NFH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 01:26:51 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so915813a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 18:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790213209; x=1790818009; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ce1YuMyYgEbSKo/+e5CLoiv54uIucnRXju66KzgmBcQ=;
        b=ZDprYLPffB1GKUK6Xlh73d7BaoNJXOwZrTkK7w1hvcaBAwW5OKFErN9j5Sk7WCUdN+
         V3JC94LEAvXvHzk6FrUobXwNIl1xapDH9iHdZzpI6b1WF6oRqgVGeQX2cuqiaWaQsG7h
         eBF2jm0ESdiArHh64S26k2tfrxqz91QFwYwiMYJuGVcM4SeDcTHkPwJZg39arPTC00lR
         kb7IN1B4/S+l2T2KD8jai2jAoV2/ovnWzs7Xs/5XoB6eQX/6s34AkQ+1Owq1TZIO3+aM
         jO4Y17uet/ldU8LHXPqLFqk5O3sxqUsO8j+SurV2YLOmbbu/o7hBwRCKKYHDPkdeo/J+
         hjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790213209; x=1790818009;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ce1YuMyYgEbSKo/+e5CLoiv54uIucnRXju66KzgmBcQ=;
        b=jmo8FSISsH8x2nVarIa/ddY790fWjheWlW5r7MxgchIvH4UmRkkeVcaaKDVzNLlSK0
         olWY/gbw8wlP5pJ+ES8q2W0lhMm4QFoPJ4bng794h4HEoNe8wXkNTzuJ4nwUCreXKO5l
         kxlOJeicY+d/uUPNkU9kwzMejw2Jc7PPipRPGKysJzEmpJR6E+WR4biZb0M3wnZbf/SG
         1YMgSBkdjfV4CO8dll2Y2IPGzXKJ8nCfm6SM0nNbSRBuE/3W0xehK2XK7BCRXaeKFzLo
         L8JIi8jcV7FMQeRxvW2OQ/6JI1GapVHdzBCKjiUs10ptiDgI1moYxPDwIVQk0Nxru3qH
         lqdg==
X-Forwarded-Encrypted: i=1; AKwUvBziZxzDlwYJNX3LNqhvdYi71wgIjS67SSOLdoPU8lQL4+y/U+mbSxht7xdfxfSdprPV4DOk7Hi2X1eq77QMH/xM@lists.infradead.org
X-Gm-Message-State: AFuF++lj1dUd1EhxPVPHHb5heQJBJ2LUBahQAx0+UeAZ73bM1EC+QwEc
	a7AZJ6YhsL/k6KoD9mKVoqN+5MO51MaJpvM7FpTJOsggGMmuFJS+ATl7
X-Gm-Gg: AYBFou3iwHPZuPvytXmiuMp5SHJXOH70g0sFtv6qhZNxEp/4VMUynXrsjMOfAXCVwIV
	awqB0tT8TdboglJWdmTWxLKarsm78+84GSuUQScNrtgRkxgAAw6lI6BSP3v4fIvhxyNPOShtxX1
	OL/lJPOhD6ExVV0ztNDq4JY5WkKs538OgbuR2CJwRb9lOwLUda7wZMXUckPrqh9gX01987/DIfD
	WhU3lqgU7SZIxnmc7TeIXZhyMlcgKHuKVZfEUeQVEwo1EdYTYDWSpTKPDBmjKxu+E+KkPbOqLoI
	+a4NYR8wp+oUk2pZXL0XLaHGAK4aI31I62qxtq8RxYlckFpPQbQN+XKH7jhNkY/5Augi/1yrcbo
	YVMhtg3bnURUBTx0c35uMlucxNRz+6OzozQ1YJefzgQXrh1orUfLXSPCvqCnGsE9c2bc1VIbXWE
	h7sBdAdbjJTLT7YgW0hDx+26i08HK3K9Egr9e/kfrP7lXqLlThOo2lGi1qnp4hmNx0Qeycom564
	JMtIvyZkSzFKsF5SJEprwD+EdTyg8Jmcx6rL2wNOQ1TUisL49mGZTO5HknH
X-Received: by 2002:a17:90b:28c5:b0:39e:6a81:c923 with SMTP id 98e67ed59e1d1-3a098729524mr645400a91.22.1790213209231;
        Wed, 23 Sep 2026 18:26:49 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f2cc3sm1698246a91.6.2026.09.23.18.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 18:26:48 -0700 (PDT)
Message-ID: <cee8c7b8-88d8-42d9-b425-31adb499ad40@gmail.com>
Date: Thu, 24 Sep 2026 09:26:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: nuvoton,ma35d1-spi: Add Nuvoton
 MA35D1 SPI controller
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260923041926.425551-1-cwweng.linux@gmail.com>
 <20260923041926.425551-2-cwweng.linux@gmail.com>
 <arO_P5imHln19iV-@sirena.co.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <arO_P5imHln19iV-@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_182650_395275_94144387 
X-CRM114-Status: GOOD (  11.95  )
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



Mark Brown 於 2026/9/23 下午 07:59 寫道:
> On Wed, Sep 23, 2026 at 12:19:25PM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a Devicetree binding for the SPI controller found in the
>> Nuvoton MA35D1 SoC.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Hi Mark,

Thanks for the review.

I will update the binding patch subject in the next revision to follow
the SPI subsystem convention, for example:

   spi: dt-bindings: nuvoton,ma35d1-spi: Add Nuvoton MA35D1 SPI controller

I won't resend the series for this change alone.

Thanks,
Chi-Wen



