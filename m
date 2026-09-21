Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F60FC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 02:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjC/UZqLFtMb5vJyxy966HHDm1SdiObcPJD69fIKS4Q=; b=ixtv1lDdseEnvoEVnotV4U3wWb
	pLLPFaHSRo39pLVcuQ1mLC4EZBskxZqIaYY06ee9jJYLuzrHBCIF1C0+toZZds5Cyb43yDadsEZBq
	cdvV/Q8zQKe2sYhF3hCek3B9XiJ2uk8KcxufpVP2dwzJtv5RTXjF0USAlpEPsblj29poQ94I5pACk
	p9au7TraiNR+F+BFqmu0Hv9ktd3n4xrdR1GGDnO0OnU3kOrbJ21AUPQCUlj6hiHzYz9fLCOC8q2xe
	OjIAd6Je99pT+DPLcNHKhGB8V89KjARAB3+9PNtwFChzD0LvEAmOwLWTBZVtg/v1eXvS9NTwEBdVq
	C6lZE/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8U0G-00000000jxD-3LKz;
	Mon, 21 Sep 2026 02:43:36 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8U0E-00000000jwn-3NIk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 02:43:35 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso996001a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 19:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789958613; x=1790563413; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjC/UZqLFtMb5vJyxy966HHDm1SdiObcPJD69fIKS4Q=;
        b=Idu+UQKtd6uNfMkr9zTOfEp0ahoPUdMzPXbiuv3epOS/89TnAFDgV7SOURDfbhqS9i
         ACT4DwylVMipwifPomVZ8fKW1mButTJTpcSU8l3dI4SVctzuduXxOfVUXBcODg7sj11V
         O8+dQ4fQIWy7U2IF7SUZOfy5J6IX1DRWEA/30w0P+t6S1TAVNzVBJWGs8iYbuxHW5ccD
         xxZXy7z687Ev9eUGDECABsjbpXHClblzVH7s+6BjD6RXYiPqoSaUqhSojclbg2GSd2n7
         CedfK0+QauAdVx7GUFYPlZXGNnF+ltHPQ+fHfsLwlD/9aBqnKZ/25XJri0+jh6Ckt/+r
         uzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789958613; x=1790563413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XjC/UZqLFtMb5vJyxy966HHDm1SdiObcPJD69fIKS4Q=;
        b=Sx0tteu+O/fjb6Dq3TEB/aodsuFIep4cAwVaAZyDialFxPoOajbHhdCcpyiwK4zgbO
         ulIQ+ZpQcDeBuOYzB7WFD48Y/Nl18MNuev3o+YDH9X3kQxn1x9Zh/cgVaobzAnmXFYdu
         yeoV58CDbWkPhwAbhfLufF19jFNcK7sDgGBcMncIMqomyY0iB1aWUfq6nIH+OMInblKe
         WCOuIXw+6hh90g65GNK5q1FgxHqldL4GqhrcsIa7kf4CwvFL4A8ysqRedcFVcGd8co+u
         LtlnQP/3gzSy5fudCDUmzjyYn2zccjYRujBWf8vbudV/cgGKG3ENmLIOpEFNI8nMV3He
         jidQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYpab8hjbH7PV8tJnp+zD2rebJpzJ9tZt1Xba2+PUnml4MoIkkfBT6eCX2nfLjs8vyB/vJpVuIGtnXq8Y+R+tP@lists.infradead.org
X-Gm-Message-State: AFuF++n6OwXvPSXqre1sexpDzNYg45PxCP3FhQvCUMNyx85FSHivn/en
	KNndp99jcNf/02K+YhqxvER6Im3xh0IOUhiilFfpEQJkp84AHTW82tle
X-Gm-Gg: AYBFou2kAixTGphuy7lbKlODZ8YexmhhJ4fyMDzWJoOj6NC2L/1760cU1Aq9pIB11C1
	LDgni+vJFtpapKPfmnuc/k9Dd2LE72RdPHzKVWoAAaXk4w0eYwnh112KguruxQpXSJ+r5GoJTeq
	qSZU8L5SQ1I4oK64zpu1eH4EZsk+cUrXEEfMgqy46mDbECdVhxd17nns4Vkye/crXGqwqLErSvz
	EN2UU5uPcZ2ollUrGMi21psbGQJ9fNi0hJSRAK+YnLG7coOmBcEqEI8CYAD1axdmMpH4IdX8lj3
	lp184tHFE4JYSyzCtin8HCSZj3azoBYqSUdw2sVKc5OUKvujVWo0xyx/yarP7JASGsL4zPapoUp
	CTPI9CrIrI4Xo7Bu7mvMYXMO5QvgXli+hIgfFjJhTk8wQynOCz2ZLr23gVWDbVFcSntkm1QAg2e
	R6Luac09qgTu9tFvdWU6t17xZfv1B/Ir5s3fMJWegIbo18PrLT/Fpm5iUZ6YR+mVEuddMQ4EJDQ
	T9SKmwhqMjLSX69cZuBjnZCLDr8Y5GWuFha/pNj0p1RrCb/Pgfg7Wk=
X-Received: by 2002:a17:90b:55c4:b0:3a0:34a4:187e with SMTP id 98e67ed59e1d1-3a034a41dc3mr3254394a91.15.1789958613234;
        Sun, 20 Sep 2026 19:43:33 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02900f84fsm10384623a91.2.2026.09.20.19.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 19:43:32 -0700 (PDT)
Message-ID: <1d988dfb-c930-4c17-ae77-47b93ff9f159@gmail.com>
Date: Mon, 21 Sep 2026 10:43:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane disable
 clearing FB_EN
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260918030125.315978-1-a0987203069@gmail.com>
 <20260918030125.315978-8-a0987203069@gmail.com>
 <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_194334_851315_1DABF06F 
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


Icenowy Zheng 於 2026/9/18 下午 01:52 寫道:
> 在 2026-09-18五的 11:01 +0800，Joey Lu写道：
>> vs_dc8200_primary_plane_disable_ex() calls regmap_set_bits() on
>> VSDC_FB_CONFIG_EX_FB_EN instead of regmap_clear_bits(), so disabling
>> the primary plane on DC8200-family hardware actually leaves the
>> framebuffer enable bit instead of clearing it.
>>
>> This bug predates this series: it was carried over unchanged from
>> vs_primary_plane_atomic_disable() when patch "drm/verisilicon:
>> introduce per-variant hardware ops table" split the DC8200-specific
>> implementation out into vs_dc8200.c.
>>
>> Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon
>> display controllers")
> Maybe it'd be better to fix this before adding DC variant abstraction,
> for easier backporting.
>
> Thanks,
> Icenowy
Makes sense. Should I send it as a standalone patch targeting
drm-misc-fixes (separate from this series), or do you have a
different preference for how to split it?
>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/vs_dc8200.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> b/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> index f72da10295e1b..25b5906a1c5fc 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> @@ -70,8 +70,8 @@ static void
>> vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc, unsigned int out
>>   
>>   static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc,
>> unsigned int output)
>>   {
>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> -			VSDC_FB_CONFIG_EX_FB_EN);
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> +			  VSDC_FB_CONFIG_EX_FB_EN);
>>   
>>   	vs_dc8200_plane_commit(dc, output);
>>   }

