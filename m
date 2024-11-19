Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5878D60D08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 01:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZorpfKuUeGuivvgx/Z+J1Gge5l/P7+qrV0/mMG9I6Q=; b=q7XjwZ01C7isJPZp/glS1gdkLN
	zHOgDiIQaTkbNrVTavWOKlauBbCNDRLiaQ9W2zk+ncJIKNOweIXgQI5irBDH5jIHYgbTo0tM7IOqG
	tTh5DLv88vT0Foj3i9Cu629zKysCUFSRE/y3hWj7VAFBRml73w/ElUh3e2BWCoLFBlcPUBeQy3J0c
	VHZCrJvUTYCZQPeN3h99zGK0fM2ZoTuMbi7pcQjmzpOFUqCmhhdnh5vTBffIu9fK6p2D0j4UP8l5z
	ue5/CPKBGQ1nUEUE/LlHZ729XQzGD63tAdEkt1XppOJWnM+kV62mfOAfRYzJQjVZak1eyh4qlmeEX
	7tnwbgsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDD2t-0000000B3sM-21dc;
	Tue, 19 Nov 2024 01:28:47 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDD1x-0000000B3le-1fSD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 01:27:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20cdbe608b3so47847535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 17:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731979668; x=1732584468; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZorpfKuUeGuivvgx/Z+J1Gge5l/P7+qrV0/mMG9I6Q=;
        b=XWn/nw9YUruPMuLHFW/TWD6kt7DdFCa4ouSwvkJlxyo6uSLF05i9fwxW0SqNkBKt+i
         mVpN3YHh4ikl6WvdqBqAb7fWav220HO2kyNN5YGj4JdUfOdj9V4I+ZF+ZLjDD2rQ0++m
         wy8yRJY6GbKUlsbCnF1aUCyCVAbUQhQ2odQUPURje/9DXnIgo9xTDM0CM/KAsOdXg241
         TafFF28DCMpldfL78jnPOQOBEjSoTiXz094TxmgIjr064l8JJybbkpPJ45SKV+HJLx2G
         /RzMWS+tzvnnLtNfGtAzQl71maioTQpfbCBjT7xfKCBaguCOoKkd+gzjSGZ8QO+Q5G32
         7oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731979668; x=1732584468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZorpfKuUeGuivvgx/Z+J1Gge5l/P7+qrV0/mMG9I6Q=;
        b=Wj8ATGUdADfVujx9RbowEeR1cBq1wyXOr2g0JItIcfGcAsQszfVMIJ1xdrtODX0CEV
         NPVvUfcyBf7cZXY4iYBZyqs/9mODHY707NX+HtwOSJuGkFCZHpAwlEXRGhh3t6kudNVn
         HiY5i1gEycKAY52RFukoYVOHbG4eXLBjQaICCA5ZD+LNoCSnY8dmFMZnAAUzlgSJ2qEJ
         VN796oyQJoTSRdnAHHSGUn3zbLsBQQxZNhDpsCmP1lhRIIMWZpZ9fGaFQvzyIGaTq6rN
         xPsZIBlxxOOc1whFvdD1Re/zL05+xSE2LoLl4aR3fHjukzL0WouBBLnnFrwo5wu6Gj/r
         lEWw==
X-Forwarded-Encrypted: i=1; AJvYcCUkAY8jb36Gwj2Kwo2+3yAO1kQJU/nhCone1dhWL+he+vQRzDPXB4N2OhSVSFqKVwaSkmJohBndeYtlNnf6OYZ2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6p6r98P/jTSCHJAuyGpiFUlv6SzEFOyuSAeq1v0R0Njh+gcFp
	oQkcSZFu3tbVYwdzBFjlBCSw6fuQjQtMKaqh6AiLpthm65aAYC5D
X-Google-Smtp-Source: AGHT+IGVmuyorAWRkpmodzfyjWX00rOtHkl4LsRbCrNu/DpwLEEoRin3/dPBpX0eN9YNURbS8cJqhA==
X-Received: by 2002:a17:902:d4d0:b0:20c:5bdc:c228 with SMTP id d9443c01a7336-211d0d6e7d6mr161345145ad.13.1731979668390;
        Mon, 18 Nov 2024 17:27:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea3394287fsm5682773a91.31.2024.11.18.17.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 17:27:47 -0800 (PST)
Message-ID: <9565c496-44d8-4214-8038-931926210d0f@roeck-us.net>
Date: Mon, 18 Nov 2024 17:27:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Patrick Williams <patrick@stwcx.xyz>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>
Cc: "joel@jms.id.au" <joel@jms.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
 "Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>,
 "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
 "DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "chnguyen@amperecomputing.com" <chnguyen@amperecomputing.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
 <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <9a1e64ef-81d9-48b0-b871-ce4ff792eae4@roeck-us.net>
 <TYZPR06MB52039DB39B62E6FA5220103AB2272@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <2531f830-6a36-4bd5-ba1e-9e19f0f66496@roeck-us.net>
 <219607ab74764f3d47659fb5ab3223b3034152e5.camel@codeconstruct.com.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <219607ab74764f3d47659fb5ab3223b3034152e5.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_172749_443017_6FDC0E88 
X-CRM114-Status: GOOD (  24.50  )
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

On 11/18/24 15:00, Andrew Jeffery wrote:
> On Mon, 2024-11-18 at 12:50 -0800, Guenter Roeck wrote:
>> On 11/18/24 04:46, Chin-Ting Kuo wrote:
>>> Hi Guenter,
>>>
>>> Thanks for the reply.
>>>
>>>> -----Original Message-----
>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
>>>> Roeck
>>>> Sent: Friday, November 8, 2024 10:08 PM
>>>> Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus
>>>> handling
>>>>
>>>> On 11/7/24 21:42, Chin-Ting Kuo wrote:
>>>>
>>>>> But now, I think it will be better to add a patch for creating
>>>>> a new
>>>>> reset reason, e.g., WDIOF_REBOOT or WDIOF_RESTART, in
>>>>> watchdog.h of
>>>>> uapi. Can I include this change, creating a new reset reason,
>>>>> in this
>>>>> patch series? Or, should I create an extra new patch series for
>>>>> this
>>>>> purpose?
>>>>>
>>>>
>>>> This is a UAPI change. That is a major change. It needs to be
>>>> discussed
>>>> separately, on its own, and can not be sneaked in like this.
>>>>
>>>
>>> Agree. However, how to trigger this discussion? Can I just send a
>>> new
>>> patch separately with only this UAPI modification? This is the
>>> first time
>>> I change such common source code.
>>>
>>
>> Yes. That needs to include arguments explaining why this specific new
>> flag
>> even adds value. I for my part don't immediately see that value.
> 
> So maybe I was derailed with my WDIOF_REBOOT suggestion by the proposal
> to repurpose WDIOF_EXTERN1 to indicate a regular reboot. I still don't
> think repurposing WDIOF_EXTERN1 is the right direction. But, perhaps
> the thing to do for a regular reboot is to not set any reason flags at
> all? It just depends on whether we're wanting to separate a cold boot
> from a reboot (as they _may_ behave differently on Aspeed hardware), as
> on a cold boot we wouldn't set any reason flags either.
> 


Thew point here is that this is just a warm reboot which happens to use
the watchdog as vehicle trigger a reset. A UAPI change along that line
would tell the user just that, and I don't see the value in it.

FWIW, the only really valuable flag is WDIOF_CARDRESET. All others are
at best misleading since the watchdog isn't typically involved in
making policy decisions such as WDIOF_OVERHEAT or WDIOF_FANFAULT and thus
can not report such reasons to userspace.

Unfortunately we can at best deprecate all those existing flags. At the same
time I really don't want to introduce new ones unless they provide real value.
While it might be valuable to know if a reboot was a cold or a warm reboot,
the watchdog subsystem is not involved in this either on almost all
platforms, meaning userspace can not really rely on it. Yes, Aspeed
hardware may behave differently, but typically all those differences
would need to be handled in the kernel when (re-)initializing the hardware,
not in userspace.

So, again, what exactly would userspace do with the information that this
was a watchdog triggered warm reboot ? Why would it need that information ?

Thanks,
Guenter


