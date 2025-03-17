Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3BFC35FF8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 08:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpO3HnxuMJXBU+70F/zOGGDYlbCQDeNotNwoR3G8/gw=; b=UQtIkAA+H6l5IMlZuC9U42HEQU
	CTzFiZvxxgq5/2i+TygQ2bK1NylBtDsVNMVSztlctgdInaNhPdb678C27NtmF0CsxAPs/N4KWG+mX
	jzW8LnYpiFyLL/R2mSuyOqoRzd7tAtBnEcryjpYx8APAUPCUl1djBi6HgHSjl5DyNy21ubNn9kFrQ
	DYu3M0fV2xZRAm+Uy9GsyVyNuhDqj5mR1uLdAlbLTYCa+Fz1Fi4AL+DgpaR48EjEM5LsgTHPk2YT6
	UTfXpf2P4fIX3YYE14sCHRxQRU4Iu/V4KyCgd5Sofi1urTxkLAqNAB3F/LztOtV2nLTz/mW2EuNBb
	a5XZUmWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu69W-00000001nqq-1Kma;
	Mon, 17 Mar 2025 08:48:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu632-00000001mds-0Hp8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 08:42:13 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54954fa61c9so5180605e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 01:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742200930; x=1742805730; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FpO3HnxuMJXBU+70F/zOGGDYlbCQDeNotNwoR3G8/gw=;
        b=ICGxZMkM3wFYNWZXAckr088hhpJDLfPhdoPxAhTdMlzk+makdS68+6lrarvLXBNXBn
         +eKRqmDUQVpP7HFvQXJtV/2NAQWf0Jmn1NooGiLfWoQ+adS+QE+X+2oCmST7PFJrWVdV
         qSjqFw8v0vPKb71Jnk7KhIqxLzm7HUYip4uboalKJi4f598ihsvyNLNKlhcQxljyjyeK
         K0EdxZFknUHfuARrQ35bMUlmQv4vLp3s8aFks9/95Yg4GwO5j7b6e8GaqyLm1MCAxnC1
         cwqWzAsJmUKt8ypftM13lBsNmuv5mgFvqGifUggCOkMrCMew5FpGrIV0QHgxAFVXQd+V
         xCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742200930; x=1742805730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpO3HnxuMJXBU+70F/zOGGDYlbCQDeNotNwoR3G8/gw=;
        b=EURs4tL01KeJ37ovTnWazaR0pvCCoABzaqrPSmNrQ4Eb2qyHMzf2rLPqzOiwaU8xoq
         iPi4ppb95mSenvFgyUgDfHX5Ri1izbFRfy+xVCaEBp8R3gCHRNSS74pMShLxGQHfODj2
         CWNQQXxoL1pl08ShxkHROH3SfmkU6Y33NfXnImHWXvPA0EikXO0V9P1FflKmv/8Eof22
         HKlVsuVjIXaCIESaChKProjnyIcgs6Zu/kMZXQ6gTGtlToZJDPGHTUEnJuSjY7QVe9Un
         RpslBqsqcdqHWKNiT/ePFrs8eI3bBr29t7Q0uIj4aSDBbt0tAL8sC36Uz68VfIF52BLv
         wRSw==
X-Forwarded-Encrypted: i=1; AJvYcCVzuMUf9Y4QT360vbowM2hV6DdIph268saaF9xzCXr9TxK9pXhfsQuV8sYCUj41U1Eii4RAO2M6s+F3ec7PpHrq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Wzek/9GDaY5C5KG2GrUD2eXM4gjBZhadf+uaMA+b2u3h8AIU
	jcLI5Q6E5AFNb3Q3lnxaBTd87Qhux7u7jVfOx6tK2UNeJRJUZhob
X-Gm-Gg: ASbGncu4drBEmbbQjMKc1tVtDg8apGlcadMTO+WmrlFnrEtmNbPDmyWTSkOwRLpmDBD
	G7zQdmftyDHEu/kEmwNWzuLUVOX98i/rq5xvvYXeEyjKKEzmKvrc4OvhTGm7nfddS/6OClfdDMH
	xc5wZKFV9fzOaXwlJ7/ooNszzvnvKzRrpooaJYD3Y/j7IJEkxz6/N5F0PCn4z7qjvoa3EOTzlEd
	DSiKfVQKQs9i8Qz3k/tbZ48RreZbch0i9BTBfXZO1gYOU6n2ifOA3EmbSVTZEOzFNJ22+pRsEsK
	eB7m9Ndoervh5PhIKsiDHMacyM+oA2299ozYX8cYZrUrBpCiKZOPxJWwr8bvBbN91Xve/hMbRph
	oCtjLPB21qssQEGX9BylNeTLcsg==
X-Google-Smtp-Source: AGHT+IEaEugzJ+pYBfCBL4Vt0JndH1mF1+5wo43FEa3qzrXwIQyPae9SAqetesylNstTDl/wwv+/dQ==
X-Received: by 2002:a05:6512:1286:b0:545:10eb:1ab2 with SMTP id 2adb3069b0e04-549c398d167mr5642074e87.33.1742200929794;
        Mon, 17 Mar 2025 01:42:09 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7bfea4sm1224769e87.67.2025.03.17.01.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:42:09 -0700 (PDT)
Message-ID: <0db2a42f-d393-4e75-afbf-cf30c0e06cce@gmail.com>
Date: Mon, 17 Mar 2025 10:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1741849323.git.mazziesaccount@gmail.com>
 <df0b2b53affbef5ccb7219328cc15db3ba843737.1741849323.git.mazziesaccount@gmail.com>
 <Z9LQ0O34EUM8WZku@smile.fi.intel.com> <20250316094112.6731bd01@jic23-huawei>
 <50b126c5-248e-4694-9782-4f28d6db5fce@gmail.com>
 <Z9fUmo5wp3EcNWzm@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z9fUmo5wp3EcNWzm@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_014212_115179_9BE408AD 
X-CRM114-Status: GOOD (  21.93  )
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

On 17/03/2025 09:51, Andy Shevchenko wrote:
> On Mon, Mar 17, 2025 at 09:11:08AM +0200, Matti Vaittinen wrote:
>> On 16/03/2025 11:41, Jonathan Cameron wrote:
>>> On Thu, 13 Mar 2025 14:34:24 +0200
>>> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>>> On Thu, Mar 13, 2025 at 09:18:49AM +0200, Matti Vaittinen wrote:
> 
> ...
> 
>>>>> +	num_channels = devm_iio_adc_device_alloc_chaninfo_se(dev,
>>>>> +				&sun20i_gpadc_chan_template, -1, &channels);
>>>>> +	if (num_channels < 0)
>>>>> +		return num_channels;
>>>>> +
>>>>>    	if (num_channels == 0)
>>>>>    		return dev_err_probe(dev, -ENODEV, "no channel children\n");
>>>>
>>>> Note, this what I would expected in your helper to see, i.e. separated cases
>>>> for < 0 (error code) and == 0, no channels.
>>>>
>>>> Also, are all users going to have this check? Usually in other similar APIs
>>>> we return -ENOENT. And user won't need to have an additional check in case of
>>>> 0 being considered as an error case too.
>>> In a few cases we'll need to do the dance the other way in the caller.
>>> So specifically check for -ENOENT and not treat it as an error.
>>>
>>> That stems from channel nodes being optionally added to drivers after
>>> they have been around a while (usually to add more specific configuration)
>>> and needing to maintain old behaviour of presenting all channels with default
>>> settings.
>>>
>>> I agree that returning -ENOENT is a reasonable way to handle this.
>>
>> I agree - but I'm going to use -ENODEV instead of -ENOENT because that's
>> what the current callers return if they find no channels. That way the
>> drivers can return the value directly without converting -ENOENT to -ENODEV.
> 
> ENODEV can be easily clashed with other irrelevant cases,

Can you please explain what cases?

> ENOENT is the correct
> error code.

I kind of agree if we look this from the fwnode perspective. But, when 
we look this from the intended user's perspective, I can very well 
understand the -ENODEV. Returning -ENODEV from ADC driver's probe which 
can't find any of the channels feels correct to me.

> If drivers return this instead of another error code, nothing bad
> happen, it's not an ABI path, correct?

I don't know if failure returned from a probe is an ABI. I still feel 
-ENODEV is correct value, and I don't want to change it for existing 
users - and I think also new ADC drivers should use -ENODEV if they find 
no channels at all.

Besides that I think -ENODEV to be right, changing it to -ENOENT for 
existing callers requires a buy-in from Jonathan (and/or) the driver 
maintainers.

Yours,
	-- Matti

