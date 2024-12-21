Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865E7E77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 06:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPQisv984Skp38aX3x/aVAIVLxylAjAYHdHkoJQnBu0=; b=B+SocYUNzLL2yDJTXDxbddz/qo
	IhoDWS8Vc94G0s3Zy+JFOvf8cPcI+RTseU2xJazdLLQvOuU8J8s25LPyZn50BMRHxbIsxAzGKtdlJ
	gD3tDJhTrWihSHdI9PyHvCMUtC50wDKcnU6pgZDk9toNyVAcSRTGp4SVAM2d2QsCNuZ/cZy3jBuAj
	Z2EKLiv57/Nat+G+OvlpUiQHI5MjanzhPTKmM5wiLkvrB8wmgLkvy11TA76GSDOYcsUR9cY3UCKkH
	KW08qbc5vlobEfOvO098f5XRfLa6YVMmU1/49t/nUBmjkssRRoBHsGSvD8b0hfOziGtddxULJzqJw
	9Ls8k5BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOtGD-00000006ecD-0TIV;
	Sat, 21 Dec 2024 06:46:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOtEy-00000006eYL-0qAg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 06:45:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43618283d48so19169995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 22:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734763530; x=1735368330; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPQisv984Skp38aX3x/aVAIVLxylAjAYHdHkoJQnBu0=;
        b=Rf9DdjKlT53StLN4yWeSeWdYiyRB8QW9H/GJdmcUl7mmMHVRwQEqyiw2Q1E34VwmV3
         RHD99re+5KYCuGv9o6VncLfT5j6lIST9kBLpOMzQvNgbS+uahLsf+ZiDmqVUs0FmK2TH
         TRWBw+XJ8iWhIy4Zas6tKz7ALAcVvryUZ37qPXDRJ8qgLj+zv43M79UyPFII8gfdKkT3
         4gl7kCWaL5xuFurXGKivvNKIchlI3/jQBk8UG/kWnOmkA2cgGYGldTQfPgrXUAWU3nYZ
         KeOk6nDZJmcMZ/J+lugRYjWol8NRmFKkNQrhTMoXE5AxWWaJtCDfSh4drhOajVdHzhSl
         aKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734763530; x=1735368330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPQisv984Skp38aX3x/aVAIVLxylAjAYHdHkoJQnBu0=;
        b=n7QL4ndZTrs3kkHTAe4lWqHmhb4ts2iFX1/unzIKmZIk1VcyOw7hZt4Etq8A40ykjl
         Hl8WYGr2aPPQgMDdih5Z5mqmR4wDKdFh8AeiouOmsE5MU/l9LoUMstmVjQJiwqJF99xg
         QFnUJjpeBqogebbdolGfC81z6GGlsXzb8ZTgjojqh6+qpvTNC1T0tabeLqak6sTQ4uw0
         HhjLp/X04si1SEqy9VRqtWzzRPm97xIGGkX53/rUiQgYVnGBnNE/Hcf83GlOpc9kUl8J
         RRsuE0S8CZjDat+imWl9/rWZLsMdV3qx9qRJw9XHKLY0O6dkQFdPuEQdC5VkpFB07Ltw
         Tc0g==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8zQSzF+nqXxGTNVMRNhw1se6ftSGXvlVORiHsSDUjScRBG6zCrcK+ZzfkOcUyoq3+iZ5sVqYPuHmFh2AaRyY@lists.infradead.org
X-Gm-Message-State: AOJu0Yya1/5xm4RgXsz6rN9Ym4qmyVMJDgFQmEC72Jq0u9doyK1dktwb
	1CM0JxAmmu5UFCPcZ3LRmCjrgM0SiuXp5kZB15cHhpVoZm2a5pNI1Q5ojU2BZIw=
X-Gm-Gg: ASbGncthZ+LvTq6onPMNyzDg7gPXiZm1tVm/gmNLgrMOaFiuXC98OdiieHV8pX3HiQC
	Wt2gad1mhe/V2hdDMXfkFgUXsJoCU4EIUvW0MbwH17EWuztXvnoh0BPd+xHLPc+FpT4ywLyUA6b
	lwL6t14lEAU7CCDDqqw9QjRf2qUYMHhPj6lNxmE+whZK8xVeVi/rgYmNN8REl2R9K/6FY9ZBnYS
	tmZWsCyYDkO8Wk2CUdgQXDbvczFryMdw822aaDpd8CkvidDxBrDQzlU7IFLVjjU
X-Google-Smtp-Source: AGHT+IHd7PMiz4uKlhm1NQRKgVjjpCH4CEyjHfmUTjmofAVFid+yDl4ahHk+jtqJk3h5IK5+ah+FCw==
X-Received: by 2002:a05:600c:1c21:b0:435:194:3cdf with SMTP id 5b1f17b1804b1-436686463ecmr47004425e9.19.1734763529975;
        Fri, 20 Dec 2024 22:45:29 -0800 (PST)
Received: from [10.11.12.107] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4bbsm66468295e9.32.2024.12.20.22.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 22:45:29 -0800 (PST)
Message-ID: <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org>
Date: Sat, 21 Dec 2024 06:45:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
 <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_224532_284417_FAA8D463 
X-CRM114-Status: GOOD (  24.35  )
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

Hi, Jassi,

Thanks for the review!

On 12/21/24 2:19 AM, Jassi Brar wrote:
> On Thu, Dec 19, 2024 at 4:51 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Hi, Krzysztof, Jassi,
>>
>> On 12/17/24 9:40 AM, Tudor Ambarus wrote:
>>
>>> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
>>
>> cut
>>
>>> +
>>> +  '#mbox-cells':
>>> +    description: |
>>> +      <&phandle type channel>
>>> +      phandle : label name of controller.
>>> +      type    : channel type, doorbell or data-transfer.
>>> +      channel : channel number.
>>> +
>>> +      Here is how a client can reference them:
>>> +      mboxes = <&ap2apm_mailbox DOORBELL 2>;
>>> +      mboxes = <&ap2apm_mailbox DATA 3>;
>>> +    const: 2
>>> +
>>
>> Revisiting this, I think that for the ACPM interface mailbox client use
>> case, it would be better to introduce a mbox property where I reference
>> just the phandle to the controller:
>>         mbox = <&ap2apm_mailbox>;
>>
>> The ACPM interface discovers the mailbox channel IDs at runtime by
>> parsing SRAM. And all ACPM's channels are of type DOORBELL, thus
>> specifying the type and channel in DT is redundant.
>>
>> It would require to extend a bit the mailbox core to provide a
>> mbox_request_channel_by_args() method. I already wrote a draft and
>> tested it.
>>
>> Do you find the idea fine?
>>
> Looking at v6, I prefer this version... maybe modify it a bit.

Just to summarize for the readers, in the end I chose for the
controllers to allow #mbox-cells = <0>; and for the clients to still use
the mboxes property, but just to reference the phandle to the controller:
	mboxes = <&ap2apm_mailbox>;
Then I updated the mailbox core to allow clients to request channels by
passing some args containing channel identifiers to the controllers,
that the controllers xlate() using their own method.
> 
> Even if you get the channel number at runtime, the type (Data vs
> Doorbell) is static and needs to be passed via DT. You may have
>   mbox = <&ap2apm_mailbox DOORBELL>;

The ACPM interface uses mailbox always in DOORBELL mode. If it has some
data to send, it will always send it via SRAM. Do I still need to
specify the channel type in DT?

For all the other mailbox clients than ACPM, that will reference the
same mailbox controller (same compatible if you want), I'm thinking that
we'll update the #mbox-cells to have an maxItems of 2, where they'll be
able to pass the channel ID and type via DT.

ACPM has its own dedicated mailbox controller ap2apm_mailbox, thus it uses:
	#mbox-cells = <0>;
channels IDs are from SRAM and type is always DOORBELL.

All the other mailbox controllers using the same compatible will use
	#mbox-cells = <2>;

> and in your custom of_xlate implementation return any available
> "virtual" channel. You could use 'void *data' in

Would you please extend this idea a little bit? What is a virtual channel?

In the ACPM interface mailbox client I request all the channels that are
advertised in SRAM, each mailbox channel has a 1 to 1 relation with a
h/w channel ID.

Cheers,
ta

> exynos_mbox_send_data() to pass the h/w channel-id, instead of the
> index of the virtual channel.
> 
> Thanks.

