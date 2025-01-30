Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BAFC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGFJ/SZJyjcLl8OPYBdzU/HVC+kA3jQp0maWZ+GZ/dM=; b=Az2ThLgDzUiGFoegxU45o4dBR1
	jOls+DWxrTTYBfUmNb7RbDI/SwqsWV+4Iu12/I8+ooDaQOLsmr0qtC5hE3JPWOuQ2bt3BTG9cuQ/N
	o1bo+UQK35PFNmqWIG7gcveF4Ed9fCheYHLswNvuykBRydKRXKjECz2CsCHMzh7sKqaVeSYhUaxsM
	ub0iTnfW+ZpkSM2i4ctBFP/DRcLrSFrYmqCXeCFw3HpmOIEU5VA/jWOxheJCOkYv14+Fel8sqjGcZ
	QQgC+M4tFgPh6kWLdJTpMSo6JAdMr2LXEXpVctW/WFBT7QvmDGUMtDUA+0jPDMxbpUwFDocHGqFkV
	PgilB+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYPn-00000009I5s-2YND;
	Thu, 30 Jan 2025 17:33:19 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYOT-00000009Hth-1zuA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:31:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385eed29d17so584827f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 09:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738258316; x=1738863116; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGFJ/SZJyjcLl8OPYBdzU/HVC+kA3jQp0maWZ+GZ/dM=;
        b=CQ0Dnsc8cvK1FkUKsIo9MfFfmOGgAVBBCBsQjOtbxmDsXYfPv8c6PsrNZxNQ3yO8FR
         W7qKPdiMnaaVoJI6eAA9F10pSRr//ARrWcYov8t5kVcdNwDv8xhXKu3/rK9KETcxf6z4
         SnZIaR4azL1ro7dRvMzZeinxYrc4K6GH532vV1Luq236FJkVPYPswKj1BTe1ppQOyNOF
         HMIKLhX5QsfDh9UT5dkW8iUnPXgX6yU8y7xVg4xC9I9Nz88hY31R+Nc4zrFI4yZSuMf+
         uHrKWjvPMrCY7XWzQMpdd8IRAHzwv6bnxfhwbjsn4R2Ln8YghDG4nmQROr+qLSx2orlj
         kksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738258316; x=1738863116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGFJ/SZJyjcLl8OPYBdzU/HVC+kA3jQp0maWZ+GZ/dM=;
        b=TBdbzqX2VD2jNb1WQB1URtS22wVqonl1V0/ve9Syal/z9PQXxHFL+ggLIXNzoc1/CU
         Lh5NDNW9iEZ4ucGBJ4K/nxDT9190HhllzEyeISKBJSdnSo1vkSrdLfwPqiUvxbxeHwgP
         VASx6POLsI32EXtfdWmEDOGEegYA1ogLNBTOrZRBxzkUJEQ2FUeNPI8JfwJBx4E1mAG0
         9yTdwhJOL27HUhCEe+5tpJqWOTPqV8DGvy8DR8tDlVN+Ln7QGpP/WpjCRS+t7xeR7VjC
         SKt5VHNLFG61GjBVoljBw/ItS9BkUtW8omj1eoYulzd7gnsOI38hDbMbfbNpD/LsvdtO
         Bvlw==
X-Forwarded-Encrypted: i=1; AJvYcCXyFWlCqTrXbfrsDlzS4xRla8n8xWwLfTBtY/Qo4XtNIfqn40A9DcXbKPoK9pBOVkhHleF9+gBw5b6RNCDqT+yK@lists.infradead.org
X-Gm-Message-State: AOJu0YyEBY7t+penGYhdSna49yn2t9c7U8+1+9Ig5p4YNFX3Ms620Q//
	m6v38jyo7c29b6kGCny2uwfjITTSOombcQ2dOORlVlD/PIShDkD6qS93aX1tnrI=
X-Gm-Gg: ASbGnctpR5tIAJOMt7UW8vzj0XQfiUdb+eoa0/FeeIdJKj6LvKfDMVgJIKTxCggQ0R0
	cecwO4u4MY7jANOxi0lYeMwVCReaIRX2FWjV6BJnEvdkx/F9Z9em3VZ3u1o6aeTMEG+pQSjNIKL
	BfLnhwZl+fnJ9rMVTsKkatI/V3kAYAbnlamttGrvpWTdlsQ4KPyg1+yjjxAz9kELVsybSzBre5q
	sD0jjYRq9ZdSM0F+kWvBP5pZfYxIvV0CCcXL3X/x2RN4ljhjt+AEVyPZroLtu8xe9SHe9SF1v+G
	nBNw28gRO+9+MuIRaMuQSQUA0fNnA2YQAMVMaww+TnBUoPVWxxh/+w8=
X-Google-Smtp-Source: AGHT+IEi5kedgLMkork5YJAKY/3aI2UDvYGuUStK46XPsuiG324UkAjxLQwuOm9AwPnUYK4o3lkp9Q==
X-Received: by 2002:a5d:64a1:0:b0:38a:86fe:52b5 with SMTP id ffacd0b85a97d-38c5195f256mr8386213f8f.14.1738258316013;
        Thu, 30 Jan 2025 09:31:56 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438e244f087sm29478855e9.29.2025.01.30.09.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:31:54 -0800 (PST)
Message-ID: <867eb310-11a7-48bd-b2fa-35e001875498@linaro.org>
Date: Thu, 30 Jan 2025 18:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>
Cc: "rafael@kernel.org" <rafael@kernel.org>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "lukasz.luba@arm.com" <lukasz.luba@arm.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
 <TY3PR01MB11346E087A4DFCC5BDCCB10B486E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <TY3PR01MB11346E087A4DFCC5BDCCB10B486E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093157_521165_D2930FB9 
X-CRM114-Status: GOOD (  19.73  )
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

On 30/01/2025 11:33, Biju Das wrote:
> Hi Daniel Lezcano,
> 
>> -----Original Message-----

[ ... ]

>>>> I've been through the driver before responding to this change. What
>>>> is the benefit of powering down / up (or clock off / on) the thermal
>>>> sensor when reading the temperature ?
>>>>
>>>> I can understand for disable / enable but I don't get for the
>>>> classic usage where a governor will be reading the temperature regularly.
>>>
>>> I tried to be as power saving as possible both at runtime and after
>>> the IP is not used anymore as the HW manual doesn't mentioned anything
>>> about accuracy or implications of disabling the IP clock at runtime.
>>> We use similar approach (of disabling clocks at runtime) for other IPs
>>> in the RZ/G3S SoC as well.
>>>
>>>>
>>>> Would the IP need some cycles to capture the temperature accurately
>>>> after the clock is enabled ?
>>>
>>> There is nothing about this mentioned about this in the HW manual of
>>> the RZ/G3S SoC. The only points mentioned are as described in the driver code:
>>> - wait at least 3us after each IIO channel read
>>> - wait at least 30us after enabling the sensor
>>> - wait at least 50us after setting OE bit in TSU_SM
>>>
>>> For this I chose to have it implemented as proposed.
>>
>> IMO, disabling/enabling the clock between two reads through the pm runtime may not be a good thing,
>> especially if the system enters a thermal situation where it has to mitigate.
> 
> Just a question, You mean to avoid device destruction due to high temperature?? Assuming disabling the clk happens
> when the temp reaches the boundary and re-enabling of the clk after a time(which involves monitoring the CLK ON
> bit after enabling it, or a run time enable failure happens), where it exceeds the threshold??


Well, I have some comments with the device tree thermal configuration 
which may answer your question but I'll wait for Claudiu to check the 
temperature read comparison without rounding to 0.5°C

What I meant is if the temperature read is inaccurate, the mitigation 
will be inaccurate too. It may not reach the critical temperature but it 
is possible the performance could be impacted negatively under thermal 
stress.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

