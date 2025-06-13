Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C57C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDMCRDo0cthC7kWsPEVosDcgak2W50xC/1nlZdkqQZo=; b=zeyIylIAR05jSuO9Ye07YGEJEz
	ZYJhN7Lpnys2JzqgWlTxLhFPg7BhbM2ZgDvbIItBwFWlc+AUEOD5U450I01IfqoP0cgOd1A3oJGl3
	wfW21lnbNpFs8Ezks4nydYuZGxgbC6s6uH8L3Twn2fJLp1ksyABE0/lMivxAxHowmiVTRxG2We7fI
	d9idTQbswFxmCSLTXLSYCRgk+INWNMiV6fgw9VqcSXjdsFrOzrSbRc8Fty0XtpQ5bhz1RgZPSRBzj
	n72lrtJrNwlU24QEVuNVedM7UddoSjp2xg5DY3VrAmZhyiLzmAaJrNZtPZyIA6umgD7BTMtU/vAO9
	PBsZsGiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6Hu-0000000GsJq-3wYf;
	Fri, 13 Jun 2025 15:25:50 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5GW-0000000Gfog-4Brg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 14:20:22 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-406e31162c6so671611b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749824419; x=1750429219; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDMCRDo0cthC7kWsPEVosDcgak2W50xC/1nlZdkqQZo=;
        b=0o482PkJUHAejmyN10Nbd2g9tRMFoe4d918I1ymvoK0hjjOXCr4QUUtYdg5cwuhuM8
         p4JRZNjVIdBbo/xSSwmkOJSvIUeRkpC/m5P9iFJaJdS9Lvpb2/3R8I2YVAdiwrWBMZN1
         74DFlsW5UK+tdCT2mLcseehmPV494oGKHyorSrgUIR8qZvKhhv9yCaD/NOBN1r2bsl6P
         5cBs8wUv4rPnn4UY/XDBssUnXywfSzO3Kkluki1iC90MuMfud/p2Qv9Ab+Qs5Qu0KBXq
         /RburSKFBvBAhNhUQjb2AD+k26iI9rnZc92jevb1h/T+TRcIleenU/806JkEryA+Sj/n
         yMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824419; x=1750429219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDMCRDo0cthC7kWsPEVosDcgak2W50xC/1nlZdkqQZo=;
        b=QQJv5UNdgXt4ZNQM/HA+NaSOxYGXOGrDfdnDMO5IRTWjTMalRHL1hPrPLcdwIARcbs
         vutwrbZ2n0boLxJ/JEI9ox3nJ9GayjrYne3iyzQo/jYWA489dMlhx+PVjt8Cdg7MNHB/
         ugRhPt4lX9xWdpRzK1AO+CDEy4cmfuCxO/BN3Ms+YSSZEFRe8vBe77G2pxAx3DQixvKP
         3PmYttbFHDv5r6wJT4yJPVw9RjSb/oMNrKbz3K1sJLkSWe7P7IieJxgaXpcF7zRniL60
         +GQFqoTZRvLFAIKP46iKp4YTq5uYA2cE0a7rGp2Rkcfm7/eLBwXVonuW4DoJbsEi3UIq
         +MLg==
X-Forwarded-Encrypted: i=1; AJvYcCUiJ4xsD06B7QlwT5O1cxPpQDnEyqxp79kCcvuueXxLGbeX0JR7nfLuM0A7odr6SxOiy7RqQ8t1/oTT9hKWtXmI@lists.infradead.org
X-Gm-Message-State: AOJu0YyVTJ3psQBqqXInqX1rpqXgJ+NObQFQJXd/li541oKmdhg6HB0r
	6tybeEKEGUAfhlzd7YHVahd18YLlCDglWN9qlp8A4VTU0PnYpWDOAz8xevqa4NORjW4usJJYgl2
	Uyi4j
X-Gm-Gg: ASbGncuWkQ9DDVqVhSUCwDtxY0BnXdt6HgQpm4O/mpcY6zJzaDdSkiSBselGjPOu6/C
	n81904WWoLLDMc9BKeilJYlPdprqq2Z2JNWKN4M9zLlrk9MqRFOg8d2K8D7s45iuqB0kZfNgKyV
	wkq4kY/aKh7FBleLuIdyh90kcCJ01gtF5tk9fEjSh2xzKfTk6+9l1EqJm1yno2hPSiRRORWoarO
	Q+saSz9jlUEekVDaUtOC94+GlK5/RMVoxQzNl3u8BNRKDhn+X1Br757YTPh8PpmJbopNbDc+K1O
	OMJXCdvhkpYmN8yCBX1rlxW0y6gk0golRc2DBEIpLyJdcw4PkeYEdQ3SywmSEmcmuaReoMCwLXA
	Hs9LcOTBYYbYYiRh+/9s624Q5FSlmQYt/tbNf
X-Google-Smtp-Source: AGHT+IFl7ASvsW2CdtBJYRdyTIxxAl3o0mUNGo3YJ7/40+1WMA2qlDXnf0YcleUYlBiHZ4WCMkw10w==
X-Received: by 2002:a05:6808:11c4:b0:403:3660:4130 with SMTP id 5614622812f47-40a723a0f4dmr2119575b6e.27.1749824419481;
        Fri, 13 Jun 2025 07:20:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4647:c57:a73c:39d8? ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28401fffsm219284a34.15.2025.06.13.07.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:20:19 -0700 (PDT)
Message-ID: <4923f49f-273f-4166-94bc-afe39618672c@baylibre.com>
Date: Fri, 13 Jun 2025 09:20:18 -0500
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <dbe26b36-a10c-4afb-88ad-a6f7f9bff440@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_072021_050085_15D52FD8 
X-CRM114-Status: GOOD (  27.37  )
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

On 6/12/25 6:44 PM, Sean Anderson wrote:
> Hi David,
> 
> I am (finally!) getting around to doing v2 of this series, and I ran
> into a small problem with your proposed solution.
> 
> On 1/23/25 16:59, David Lechner wrote:
>> ---
>> From: David Lechner <dlechner@baylibre.com>
>> Date: Thu, 23 Jan 2025 15:35:19 -0600
>> Subject: [PATCH 2/2] spi: add support for multi-bus controllers
>>
>> Add support for SPI controllers with multiple physical SPI buses.
>>
>> This is common in the type of controller that can be used with parallel
>> flash memories, but can be used for general purpose SPI as well.
>>
>> To indicate support, a controller just needs to set ctlr->num_buses to
>> something greater than 1. Peripherals indicate which bus they are
>> connected to via device tree (ACPI support can be added if needed).
>>
>> In the future, this can be extended to support peripherals that also
>> have multiple SPI buses to use those buses at the same time by adding
>> a similar bus flags field to struct spi_transfer.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>>  drivers/spi/spi.c       | 26 +++++++++++++++++++++++++-
>>  include/linux/spi/spi.h | 13 +++++++++++++
>>  2 files changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
>> index 10c365e9100a..f7722e5e906d 100644
>> --- a/drivers/spi/spi.c
>> +++ b/drivers/spi/spi.c
>> @@ -2364,7 +2364,7 @@ static void of_spi_parse_dt_cs_delay(struct device_node *nc,
>>  static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
>>  			   struct device_node *nc)
>>  {
>> -	u32 value, cs[SPI_CS_CNT_MAX];
>> +	u32 value, buses[8], cs[SPI_CS_CNT_MAX];
>>  	int rc, idx;
>>  
>>  	/* Mode (clock phase/polarity/etc.) */
>> @@ -2379,6 +2379,29 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
>>  	if (of_property_read_bool(nc, "spi-cs-high"))
>>  		spi->mode |= SPI_CS_HIGH;
>>  
>> +	rc = of_property_read_variable_u32_array(nc, "spi-buses", buses, 1,
>> +						 ARRAY_SIZE(buses));
>> +	if (rc < 0 && rc != -EINVAL) {
>> +		dev_err(&ctlr->dev, "%pOF has invalid 'spi-buses' property (%d)\n",
>> +			nc, rc);
>> +		return rc;
>> +	}
>> +
>> +	if (rc == -EINVAL) {
>> +		/* Default when property is omitted. */
>> +		spi->buses = BIT(0);
> 
> For backwards compatibility, the default bus for CS 1 on gqspi must be 1
> and not 0. Ideally there would be some hook for the master to fix things
> up when the slaves are probed, but that doesn't seem to exist. I was
> thinking about doing this with OF changesets. Do you have any better
> ideas?
> 

Does this work? 

		spi->buses = BIT(cs[0]);

(would have to move all the new code after cs[0] is assigned of course)

