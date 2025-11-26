Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D471FD1036F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 02:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viQFfejLa2fvgnA/CMY2Ia3y/w3OWlv3mFzKSwgxerg=; b=OWxawQf9pZen1cAUA6+A5j2gL4
	Gk7Ne0QD+Sv88ypVfkENaRLHhg+koFJGbjMCvZMaQ/9fmcf4Jm1PXLs+Du8uh0awGttMcPF/h61v0
	Te2fkNaAYVmqW5bJREpmTWQcQahvshaW1iPg/+p/RlX+wtLoOx8GXTPt/VEJLjUX5xgq57To/I5Ze
	k6X4WEFz+kNicq7kLH1nsZIboMWQu76ythcL2AyIcw8PC9fz0LLQnL8VAjy8ski8+g21dybQTiNZo
	b4CExmQSHXvmqI7bvmgWkfdm7i3L2OosHiwxXC2VkBNvuobpyJECFpM6vdyoc/3FdYGlRFrKPzED+
	pufUoMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO5Ks-0000000EFeW-0B3E;
	Wed, 26 Nov 2025 02:32:52 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO5Ko-0000000EFde-2u6F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 02:32:48 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b553412a19bso5495956a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 18:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764124366; x=1764729166; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viQFfejLa2fvgnA/CMY2Ia3y/w3OWlv3mFzKSwgxerg=;
        b=0STQFNBmDilxTBy7N91kSVqwVA+783gql8kR597geFoVa+iO2fuhuXvCGFlOSsKWNS
         DKtvmIy8jmQXD2OkdAKhvaH9K3YGwKLSvR4rqo0xAawftc5LpR2u0Ww0CQ0rF7R1A8i5
         8Ql2M7Q8jTemc/w0PdpGIjJ5U6FKES443NlJnKIP335x/RwU5cZ8P/7qIVv4yMupnCnP
         oXwjSqE9qPhzhDcWrSPxjO5cqiixshYlRdvpI4F5OpyNVoTdeNrnUUeLSSDMT36Lw9pO
         Ycq1Q8RdMOTNqmVypWNe5v9Q1L/NGEOmoVHRnpY3TbIYL8o3YtLwfnPw8zvGPL6OYOKi
         cQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764124366; x=1764729166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viQFfejLa2fvgnA/CMY2Ia3y/w3OWlv3mFzKSwgxerg=;
        b=Ihw2i/HVdoQkjhq2s5IWAV4wFdQNX822018frMHy5PC2TQuwphcpuDJhfdvza/YMph
         FQPhIhWRvjKwJqr9jQLevsSSlhgNPX3qTJg2IGB40DHucN/Og+c+r1HHsXFA3AHwhNfU
         badqKiAGjyioqkNTluxQvq5ARABY0r9BOduvDmdcD4jYH3mgi4gsXkGKVkzOJkMNq6fp
         NSSr2Ds1B2KgpbqmIJcVrtQnCkr2Gp33QO+b6qCCixrSGmLQZy6kOfTyjNk7MSJoVRSe
         ye2B6ZtNGCMHTBV7JSVgn85thXToXF41YVHSCO57GMaak5OoOqayHjdC4ey7UgZijr9t
         /fNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLsHAMkJQokucBN1KWF+r2K8t7AkZytyhgYeECJ+/8B/luNMvNk4TvGgxLFl+cXGtI5hS1Xm7XCRgCVMmvIG+I@lists.infradead.org
X-Gm-Message-State: AOJu0YyO5EG0L219StFsHjoNjYuLWoSLOu9TDWsEe9YxELbq44Q/6qi4
	wKBbWzNZCQvYecWYRIgJIRQqQzqweJXtfMx4SWHadOIrukgdZv99CdPhHn+m5aq8pw==
X-Gm-Gg: ASbGncvq2qxti8AytBap9vsqpooWwXdfShJOSqNKLDdRZnj3Y/dkcKYAQw+p25ElHfL
	JZpeGrhf2h4BuYyNQDrKoYNrvt1CXuZzMzX3HwkH+9SD3YlpW0zpcQd1qFy5uYyHr9r3U8QCFyV
	XM3NsWrmFjhzeh846W+yGcgVMLRXUnqX12+FsmdwaZFRWEzjyDfaq/ZV+Gk5oqWXKgIPUUSxoy+
	qtW/Hv/6hYcs6UZ75zk7irA0A7Kup+0lP/aMGfeqMsnJmFA1oD43TzXTYDYiComlE6shO14hZ/n
	vaaQ2hbGtQpM4LM3NVUmjRSK5EaxJwMEfANyXCuxK5X0FPf/h0PZyF8Sn7OJAkILi9OsiB9s8By
	uxqorF47leYeI/CHNHZV1ej2+J8yyuhTUSFsEU0EPUqvX9D9rFLHuUX2V44Jyu/muQu+VDWSl/a
	pjJJk1GT4TEThf+SLk3u1rAuH99tldoNJ2v+FoCB1myA4NqORHsqrKmaRI2KzjsqiBro62AtNVj
	+vvnBEAfAuJNQ==
X-Google-Smtp-Source: AGHT+IGD1s0jwsigC9CKjP4TkneuimTCZulkIKuNhVDm4i5DPzY9T5r6E8+KK5g9yvP0crM19wwRsw==
X-Received: by 2002:a05:7300:230e:b0:2a4:3593:645c with SMTP id 5a478bee46e88-2a71910598amr11369897eec.12.1764124365326;
        Tue, 25 Nov 2025 18:32:45 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30? ([2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e6dbc8sm91444566c88.10.2025.11.25.18.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 18:32:44 -0800 (PST)
Message-ID: <0a43b5a2-dc2f-402a-8ec7-1d5c88602ffc@google.com>
Date: Tue, 25 Nov 2025 18:32:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-6-6b2e4b8f7f54@google.com>
 <9cad7b42dbfea351fb3b708736bf6f6715bcf694.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <9cad7b42dbfea351fb3b708736bf6f6715bcf694.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_183246_759120_C5DD360C 
X-CRM114-Status: GOOD (  28.91  )
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


On 11/24/25 1:09 AM, André Draszik wrote:
> Hi Amit,
>
> On Sun, 2025-11-23 at 08:35 +0000, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> TCPCI maxim driver directly writes to the charger's register space to
>> set charger mode depending on the power role. As MAX77759 chg driver
>> exists, this WAR is not required.
>>
>> Instead, use a regulator interface to set OTG Boost mode.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   drivers/usb/typec/tcpm/tcpci_maxim.h      |  1 +
>>   drivers/usb/typec/tcpm/tcpci_maxim_core.c | 48 +++++++++++++++++++++----------
>>   2 files changed, 34 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcpm/tcpci_maxim.h
>> index b33540a42a95..6c82a61efe46 100644
>> --- a/drivers/usb/typec/tcpm/tcpci_maxim.h
>> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
>> @@ -60,6 +60,7 @@ struct max_tcpci_chip {
>>   	struct tcpm_port *port;
>>   	enum contamiant_state contaminant_state;
>>   	bool veto_vconn_swap;
>> +	struct regulator *otg_reg;
>>   };
>>   
>>   static inline int max_tcpci_read16(struct max_tcpci_chip *chip, unsigned int reg, u16 *val)
>> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
>> index 19f638650796..6d819a762fa1 100644
>> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
>> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>>   #include <linux/usb/pd.h>
>>   #include <linux/usb/tcpci.h>
>>   #include <linux/usb/tcpm.h>
>> @@ -202,32 +203,49 @@ static void process_rx(struct max_tcpci_chip *chip, u16 status)
>>   	tcpm_pd_receive(chip->port, &msg, rx_type);
>>   }
>>   
>> +static int get_otg_regulator_handle(struct max_tcpci_chip *chip)
>> +{
>> +	if (IS_ERR_OR_NULL(chip->otg_reg)) {
>> +		chip->otg_reg = devm_regulator_get_exclusive(chip->dev,
>> +							     "otg-vbus");
>> +		if (IS_ERR_OR_NULL(chip->otg_reg)) {
>> +			dev_err(chip->dev,
>> +				"Failed to get otg regulator handle");
>> +			return -ENODEV;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int max_tcpci_set_vbus(struct tcpci *tcpci, struct tcpci_data *tdata, bool source, bool sink)
>>   {
>>   	struct max_tcpci_chip *chip = tdata_to_max_tcpci(tdata);
>> -	u8 buffer_source[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SOURCE};
>> -	u8 buffer_sink[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SINK};
>> -	u8 buffer_none[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_OFF};
> You should also remove the corresponding #defines at the top of this file.

Ack!


>
>> -	struct i2c_client *i2c = chip->client;
>>   	int ret;
>>   
>> -	struct i2c_msg msgs[] = {
>> -		{
>> -			.addr = MAX_BUCK_BOOST_SID,
>> -			.flags = i2c->flags & I2C_M_TEN,
>> -			.len = 2,
>> -			.buf = source ? buffer_source : sink ? buffer_sink : buffer_none,
>> -		},
>> -	};
>> -
>>   	if (source && sink) {
>>   		dev_err(chip->dev, "Both source and sink set\n");
>>   		return -EINVAL;
>>   	}
>>   
>> -	ret = i2c_transfer(i2c->adapter, msgs, 1);
>> +	ret = get_otg_regulator_handle(chip);
>> +	if (ret) {
>> +		/*
>> +		 * Regulator is not necessary for sink only applications. Return
>> +		 * success in cases where sink mode is being modified.
>> +		 */
>> +		return source ? ret : 1;
>> +	}
>> +
>> +	if (source) {
>> +		if (!regulator_is_enabled(chip->otg_reg))
>> +			ret = regulator_enable(chip->otg_reg);
>> +	} else {
>> +		if (regulator_is_enabled(chip->otg_reg))
>> +			ret = regulator_disable(chip->otg_reg);
>> +	}
> Given otg_reg is the fake regulator created by a previous patch in this
> series, this means that the regulator API is really used to configure two
> out of 16 possible charger modes here. That doesn't look right.


I understand the concern, but I believe the regulator framework is the 
correct interface here for three reasons:

1.  The TCPCI driver's responsibility is only to signal the intent to 
source VBUS (OTG) or not. It should not be aware of the specific 
register values or mode bits of the companion charger chip. The charger 
driver (via the regulator enable op) is responsible for translating that 
intent into the correct hardware-specific register value (e.g., 
selecting the correct OTG mode).

2. While the charger supports multiple modes, sourcing VBUS via OTG and 
sinking VBUS (charging) are mutually exclusive states on Type-C and 
there are no modes to support both. If complex scenarios arise (like 
wireless charging + USB OTG), the logic to select the specific register 
mode belongs in the charger driver (the regulator provider), not the 
TCPCI consumer. Now say theoretically, we support wireless charging and 
want to turn it on (sink) while USB OTG mode (source) is on. The charger 
driver would set an appropriate mode based on this info (wireless 
power-supply on, USB otg regulator on, so select XX mode). We can game 
this for any 10 of the *valid* modes (refer [1]) supported by the chip 
and this would work. Using a regulator framework here will not pose a 
restriction on the number of charger modes now or in the future.

3. This design pattern is standard in the kernel from my study. Drivers 
such as bq24190_charger and rt9471 expose USB OTG functionality via the 
regulator framework.

[1] 
https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads/android-gs-raviole-mainline/max77759_regs.h#52

BR,

Amit

>
> Cheers,
> Andre'

