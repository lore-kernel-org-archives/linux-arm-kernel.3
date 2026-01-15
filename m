Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D70D3CCA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 02:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oljdS9Pzn8PfMd2uvF2pcJrzI3Sx8TSvOAxEtyq9iI=; b=XMYKGP3jUuSGTRCDIE5lQFs/JS
	VLXeszOPiSsDUNQh9UttSnRnCU5IKX8YQhUFoPRW2hPbxaDny6iHRJcGrydfelemoJqn+O/NDqMBO
	P/1ebDNU0We/Yq7MZfVIlrxq6myiLb4XDNMZJtXdP6Lk3+/yIybRCi+Y0LT4Z3qK6uGyrD9dvAmPb
	vO6JcGaQ3qVMHQvXYS2Phm0lUwkk/DfbM5CKv3MNPH+Cwt5Czwgv0P5dLuY8nDq259ZBx1817GD3Y
	ePXFnjM5jj1EJd/X64/fRZ7Fu/atpr+SV3Mt9RoxiP5ugdus8rILZHcxQWrkNQXXfFfeGfRRD2rZH
	aY+G9piw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDZL-0000000Bbwj-07l5;
	Thu, 15 Jan 2026 02:58:43 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDZH-0000000Bbvt-0wc0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 02:58:41 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso1077793eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 18:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768445918; x=1769050718; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oljdS9Pzn8PfMd2uvF2pcJrzI3Sx8TSvOAxEtyq9iI=;
        b=jGUU7iPTPmNWBH4pnevbHVQwwC0LiTClAIkAs0EXELSnt0ZAl5xiXrHqAtYRbS8Tp0
         ZXF+qUKwDkBf72ijlGFufbZ27cLSi9XbUDOSyoJ316pPqQ5yS3nKKshzdq+ppzb1FA5a
         wXS0oSTBp0bOda3OVMghVzgtP46TifU3zaM/RKMMPlWgkLrln6LTTb9fP6n5/0o4FYWL
         IwYhXcaP5bUg7eO1lZcXXMY1f5cL7nG88V3wadIVv271f9jSa5QjI8QAxLhRFmhaGBUL
         f0NbjObGmqkSdKv9i5Tj+9zv9mu1DhdAn04tRrshaB0c3mxGUZ7Keye8qNgALANisgao
         o91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768445918; x=1769050718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oljdS9Pzn8PfMd2uvF2pcJrzI3Sx8TSvOAxEtyq9iI=;
        b=scD6XJHH/xdDfrXwDUBGwYoKxiKYc9vAx96xaMhdpbDysdRi85xOnGQzLET5vT9+uL
         TemiXQJTDxSMQeNwRnQas72X3HGQXqQno4oitqe+Nj7zbyP2Qc766pPiUlD5kpk8rBb0
         4BnWVFptoaTElquWe3ydEzznrEYmM/1kDhSh4Y48v2sov/X2XxW5HAdtSyJUKrd2ZsWc
         9wQzZiC3D0FJNeGpN+O/Hekc+EG+QdHdB1ajbsVl4ekKA+u5GqqHfPe4vAq0hYNTJXCg
         8L5v4x3qgXN1pKoPc8nx54ufLh0Jb9IPeoohnQFr/u17/+S07BKQ8rS0qKILcxif7CjM
         mwIA==
X-Forwarded-Encrypted: i=1; AJvYcCVgTy4QoppN3rUZ9s/3NtYn4CKIJoaDCPvG7u2PcH8PX5uPPX5ToyyBfQ1KUZ7tXn2PvPJnYlwJDcft/KyQkhgW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0f0IaHJzl7auV/Gy8l9arl0/hqU4dYhixIJjITjKokV39D3dE
	MoRZ0XFWhZxWelHVFEhLaJlN5GoHpqug38bSzXW7jlTxRDQ89U+onfUETZLr6P1Yqg==
X-Gm-Gg: AY/fxX4ZNGzZGjrN+Q3q7xwA5ru0teOwsKKYF0HzBdR96B5Av5BZAQAf0nhJUEVxpC4
	V36KgGEK+KsdXjAt08/dkq5qQ2OxQ/TAIH4Q2sknDfqHVOabMP27oNZ1hEud5meDwBjChCKBEck
	+/2DVyMXuf4Y8/ItLOBrWnYVdTSiRaKI25xdMPugKMJL/PplcZxSjjn1K2Mr0hgOxZwNxLe5PE5
	AmSXvbZYiVbzRWC3E1XGukTUz+sx4ZZaGdqzfCjJuPFQVGtOffS8ESc74JxktnkgkS46XmKR5Ij
	g50IqLwjGkAnf151mtvj4qKjgbXT201Xm8jBaLuRjhsjrYBS/nUsH1Fph7a4I3105J08H+Go2l5
	yv2OiUP1Si9mQfCTeTDOgx4jjd1NHvOqc5L3Tj1CV6Hh/FdfYvsF5qjEfpmMTirkqwW8Y5aKenF
	ca2hmIWLFlu7s0+kw97Wg38I9zNZQ739cP3rQ1/SyrKWmQusnzDcpMggNOYWmxBWo0mec+bxgBf
	5J9E/POe23y/A==
X-Received: by 2002:a05:693c:37cb:b0:2ae:5e50:9cab with SMTP id 5a478bee46e88-2b486b7567cmr5712880eec.1.1768445917725;
        Wed, 14 Jan 2026 18:58:37 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:f3e3:a430:9ff4:7b84? ([2a00:79e0:2e7c:8:f3e3:a430:9ff4:7b84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1775fe27dsm18746906eec.29.2026.01.14.18.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 18:58:37 -0800 (PST)
Message-ID: <2e88f394-6c84-4be7-bc41-b2eb9c5e6c41@google.com>
Date: Wed, 14 Jan 2026 18:58:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
 <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
 <aWD_RIPp1ULH9St1@kuha> <9f94993e-dd69-4c9e-b467-aad6031c83d4@google.com>
 <aWT1NgxDSaU7LL2g@kuha>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <aWT1NgxDSaU7LL2g@kuha>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_185840_300218_4F71D138 
X-CRM114-Status: GOOD (  20.91  )
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


On 1/12/26 5:20 AM, Heikki Krogerus wrote:
> Fri, Jan 09, 2026 at 06:16:57PM -0800, Amit Sunil Dhamne kirjoitti:
>> Hi Heikki,
>>
>> Thanks for the review!
>>
>> On 1/9/26 5:14 AM, Heikki Krogerus wrote:
>>> Hi,
>>>
>>>> +	if (source) {
>>>> +		if (!regulator_is_enabled(chip->vbus_reg))
>>>> +			ret = regulator_enable(chip->vbus_reg);
>>>> +	} else {
>>>> +		if (regulator_is_enabled(chip->vbus_reg))
>>>> +			ret = regulator_disable(chip->vbus_reg);
>>>> +	}
>>> It looks like you have to do one more round, so can drop the
>>> regulator_is_enabled() checks and just always enable/disable it
>>> unconditionally.
>>>
>>>          if (source)
>>> 		ret = regulator_enable(chip->vbus_reg);
>>> 	else
>>> 		ret = regulator_disable(chip->vbus_reg);
>> The regulator framework uses refcounting on the number of enables. If
>> the number of times regulator is disabled > enabled, a warning will be
>> thrown. Also, I don't want to call regulator_enable more than once for
>> the same refcounting reason (will have to call disable those many number
>> of times to actually disable).
>>
>>> I don't think you need the check in any case, but if I've understood
>>> this correctly, you should not use that check when the regulator does
>>> not support that check because then the API claims it's always
>>> enabled. So I guess in that case "if (!regulator_is_enabled())" may
>>> not work as expected, and you may actually be left with a disabled
>>> regulator. This may not be a problem on current platforms, but who
>>> knows what happens in the future.
>> I don't think this should be an issue in the future as this driver is
>> specifically meant for max77759_tcpci device and should only be used
>> with max77759 charger (they both exist only in the same package). And
>> that the max77759_charger driver does implement the callback. However,
>> if you think that regulator_is_enabled() is unreliable, I could track
>> the state within the tcpci driver instead of calling
>> regulator_is_enabled() and call enable/disable regulator accordingly.
>>
>> Let me know wdyt and I'll update the next revision accordingly.
> Let's go with this then as is.

Sounds good. Thanks!


>
> thanks,
>

