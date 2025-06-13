Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7CAC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsMpqaCRhjE+dhyYns+fNIO//Rr1iAnsBUp1qLn9v74=; b=nC9OJbUL8YH0KGnJgh4n7fhmmx
	mqdCQqgv4VvxwHaX9E+3NtrGglCXWWJd/2hYkv/0BZraYK4FHsJVP8BZ6cTCyxlcTKIIiebBtXqFB
	s+b3/DETR+o1yg63wWpk73oRtvJwwKfRDwbBC/6Dvv05SkXfyrRGLW7n1FThJLJo+lB7mBPlnmAYg
	Y427KTjrMeWJRxmUXpOOtahlhA4YxEhhyYGrS/y757acaQu9D9Wb+RrCnJdgFV0DMFQfeI37XUcKy
	MoIK59DsQ3TYZKsX23ND9pd9yRqnZOXC4NVzUCY1B8oWIpQN88kPFY2Qba9+G9pjkvrDtvu2gYC1P
	54rDmB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9h9-0000000HNYz-156T;
	Fri, 13 Jun 2025 19:04:07 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7f1-0000000H7HK-2oer
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 16:53:49 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-72bc3987a05so1385366a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 09:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749833627; x=1750438427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsMpqaCRhjE+dhyYns+fNIO//Rr1iAnsBUp1qLn9v74=;
        b=WHWi/5f3Bxve9WGQNQHg3eVqoFnOETfuSHt+OsynVmfYnRQcRuUGqrvdMYq3UfUXVC
         X0AWFnf1pX205Gb2tQdbuf83NGDqdYKZYjZZT2UzrHs3SCceDmmpiFf6SHTSaQL7BA3b
         WO/+XgIUMtKlO1DWcIvEGZ7lzUQIjB141PplMeXPM4EYRNBY6xlzvWrBANEJq90+YWW5
         pL5X2TwCh3WDRu8CGf0x7yqWPvVmKziWu33Ucrg7uCEg/+SMmgZxSPi4aj/8QPQZvXD/
         gO1GwyyUshOq1149I8wM1UeqI6vrpjqFy4WSj1eyGklplr8RZYjHITidq0R5AJ9RAO5i
         drPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749833627; x=1750438427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsMpqaCRhjE+dhyYns+fNIO//Rr1iAnsBUp1qLn9v74=;
        b=YMz46rYAiwP10owEqZuKpXKaQCMRak4zEtueXB9W/3398mksaLaem3jMdl3JYC5L3h
         x7YgHQ2pTyLgzPlkvatHyNGv+y6paqlgIIfczxI9Tcsawu53RN7V6qvLzoCFwhg14drV
         RYA/xmkXM6iTt8XhG1dWwwRQjVgrAxSbSaY0ij5Zi47vm9PacjfhFLib8o8vr4FyfB16
         SUO5RNuvmkRZFqxWQISlhzDbePXGBSUY9xQpYk5VJmKT34ginu3df+3sMdcFmHKS4vZL
         cfmxABxnttsMY6BZZIdBCpFgdNOpsuqccbcSsliVC+YlX0tkDyvBgSYHNjLUwiCH+QcH
         gZJg==
X-Forwarded-Encrypted: i=1; AJvYcCUEIDjqZDiJARRs0Axl2e0fVtCuqgfC3c/Gz+SoWvQ06zW44B/cmwEFwd7bJ43p5k9U70FMoLdYf7MkS9I/xti9@lists.infradead.org
X-Gm-Message-State: AOJu0YzMTByx6nkOtGrUWJZrWh9Van8ZGigq8DbpgpK0hiTnXqEXD1lb
	joHaslSZubEtrl9Rm1Z0o0fS3fp+I0FfO6WFaDs05LORGbROoFI7T/VyHkIZsB10w46dFwmH/8k
	Q4QiK
X-Gm-Gg: ASbGncupwkQfibYWYegY7YZ3eLSkvl/T4Zl3wQKSPo6DIoA0E7AmJyBrOc8GAOQcr2u
	sT8whFTEY576DFFf5/6nZQjilFucIUJUBU8i1DSzaht9fo/NtFtwui7LBdwbuouynzr1stzybYD
	o4hMjPKL94Z/jMtZUxjro/tvxx89iPpNddnSy0/vC5MtW7xAoxNPskXEgpgKBYrLCdorw7IBJP0
	vlkB1T2+FU2AsJK9rtLOMFW6R2nlS2kMN0oo/npTNtS/Ywac8LYxI2U6cBpUIPZEUEZmNetVrxy
	oi8xLVp5l4CMTl9agKEXwiLrRsfTnPLPA5DTLu2a7qDFxVchKGYZ92mVLss3Zbh4K8xn50GbJEv
	cu7iXT5ys/Yu4hQ06MhK/25e0KBP3FJBxg7Jy
X-Google-Smtp-Source: AGHT+IGm+JBqqiEmyl18/kEEXB/ADyzMADcbl2xBx0ulsbC0s8fZGx5yePDIuJfHwHi4w+HBVRh2OQ==
X-Received: by 2002:a05:6830:3c04:b0:72a:1222:9e8a with SMTP id 46e09a7af769-73a3634980emr354864a34.14.1749833626674;
        Fri, 13 Jun 2025 09:53:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4647:c57:a73c:39d8? ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a283dbf9asm266939a34.12.2025.06.13.09.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 09:53:46 -0700 (PDT)
Message-ID: <40762c1b-91a9-4aaa-9d98-e4f22cde8f20@baylibre.com>
Date: Fri, 13 Jun 2025 11:53:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: spi: zynqmp-qspi: Split the bus
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
 <20250116232118.2694169-2-sean.anderson@linux.dev>
 <9f40295b-484a-48e8-b053-ff8550e589d7@baylibre.com>
 <46a7eba6-a705-4543-b967-e83ccc89e7d4@linux.dev>
 <6afc379a-2f9f-4462-ae30-ef6945a83236@baylibre.com>
 <dbe26b36-a10c-4afb-88ad-a6f7f9bff440@linux.dev>
 <4923f49f-273f-4166-94bc-afe39618672c@baylibre.com>
 <f3160819-f6f4-4079-9562-802caa2fef20@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <f3160819-f6f4-4079-9562-802caa2fef20@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_095347_818651_C1E4395F 
X-CRM114-Status: GOOD (  26.31  )
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

On 6/13/25 10:57 AM, Sean Anderson wrote:
> On 6/13/25 10:20, David Lechner wrote:
>> On 6/12/25 6:44 PM, Sean Anderson wrote:
>>> Hi David,
>>>
>>> I am (finally!) getting around to doing v2 of this series, and I ran
>>> into a small problem with your proposed solution.
>>>
>>> On 1/23/25 16:59, David Lechner wrote:
>>>> ---
>>>> From: David Lechner <dlechner@baylibre.com>
>>>> Date: Thu, 23 Jan 2025 15:35:19 -0600
>>>> Subject: [PATCH 2/2] spi: add support for multi-bus controllers
>>>>
>>>> Add support for SPI controllers with multiple physical SPI buses.
>>>>
>>>> This is common in the type of controller that can be used with parallel
>>>> flash memories, but can be used for general purpose SPI as well.
>>>>
>>>> To indicate support, a controller just needs to set ctlr->num_buses to
>>>> something greater than 1. Peripherals indicate which bus they are
>>>> connected to via device tree (ACPI support can be added if needed).
>>>>
>>>> In the future, this can be extended to support peripherals that also
>>>> have multiple SPI buses to use those buses at the same time by adding
>>>> a similar bus flags field to struct spi_transfer.
>>>>
>>>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>>>> ---
>>>>  drivers/spi/spi.c       | 26 +++++++++++++++++++++++++-
>>>>  include/linux/spi/spi.h | 13 +++++++++++++
>>>>  2 files changed, 38 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
>>>> index 10c365e9100a..f7722e5e906d 100644
>>>> --- a/drivers/spi/spi.c
>>>> +++ b/drivers/spi/spi.c
>>>> @@ -2364,7 +2364,7 @@ static void of_spi_parse_dt_cs_delay(struct device_node *nc,
>>>>  static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
>>>>  			   struct device_node *nc)
>>>>  {
>>>> -	u32 value, cs[SPI_CS_CNT_MAX];
>>>> +	u32 value, buses[8], cs[SPI_CS_CNT_MAX];
>>>>  	int rc, idx;
>>>>  
>>>>  	/* Mode (clock phase/polarity/etc.) */
>>>> @@ -2379,6 +2379,29 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
>>>>  	if (of_property_read_bool(nc, "spi-cs-high"))
>>>>  		spi->mode |= SPI_CS_HIGH;
>>>>  
>>>> +	rc = of_property_read_variable_u32_array(nc, "spi-buses", buses, 1,
>>>> +						 ARRAY_SIZE(buses));
>>>> +	if (rc < 0 && rc != -EINVAL) {
>>>> +		dev_err(&ctlr->dev, "%pOF has invalid 'spi-buses' property (%d)\n",
>>>> +			nc, rc);
>>>> +		return rc;
>>>> +	}
>>>> +
>>>> +	if (rc == -EINVAL) {
>>>> +		/* Default when property is omitted. */
>>>> +		spi->buses = BIT(0);
>>>
>>> For backwards compatibility, the default bus for CS 1 on gqspi must be 1
>>> and not 0. Ideally there would be some hook for the master to fix things
>>> up when the slaves are probed, but that doesn't seem to exist. I was
>>> thinking about doing this with OF changesets. Do you have any better
>>> ideas?
>>>
>>
>> Does this work? 
>>
>> 		spi->buses = BIT(cs[0]);
>>
>> (would have to move all the new code after cs[0] is assigned of course)
> 
> Yeah, but do we really want to make this the default for all drivers?
> This is really a quirk of the existing gqspi binding and I don't think
> it makes sense in general.
> 

Can we just leave spi->buses unset then and leave it up to the controller
driver to interpret that as "default" and handle it appropriately?

OF changessets seems overkill to me.

