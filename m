Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C674111224B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 01:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0TTSvzfniH028lzX8No8jAcQ7PnQHkFWjL5CrlFmII=; b=qe2bWJ0+ZnieSGsNiIgb5qdaB8
	b/m0G5ID9AZ7mL01dJcqisZ84YLvRUyNLewIKaFmMnv+AjmXEYXjOvEl7jwZMEDUa0FMbcg9t50Xx
	gDYJXPmojeE/doaq9rfVgn4tJnvT+TVr0s0lCgULNs+gU8KG4uIQ1avYTuW6M3p4qClJuuESs6Olk
	fBzb4nkfWTMx8Whhbi5xv1/sj8rueQtiovTGnwiEL7MtjVb+9CVdjV/ct4DtdATw1vRzBGtMPU8CF
	aTBDZGgRgmS12sG57xvRbtMcIjNNAprwThtAack3Y54/AHDOpZ/+p6rVBlltMVLTXENS+uG4N44NE
	tvmTNDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w86ot-0000000GXlG-1pJm;
	Thu, 02 Apr 2026 01:26:03 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w86oq-0000000GXkr-42He
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 01:26:02 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2c5b3d8eab1so1118481eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 18:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775093159; x=1775697959; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0TTSvzfniH028lzX8No8jAcQ7PnQHkFWjL5CrlFmII=;
        b=V+PYAKeYroH+/WQ0oojzVvHnu89EkmJ+YI2+BMQRJafgVxY1DP4cTn8s5xS+9Yjv/Y
         dcdefi9gaubN+c6lEucrlIaWuNEZKM7s9x4p28gVWrX5DXWOKY/V8V/E0wdOvanfmhbf
         baCXb3QLfUnRma2Rnct48UlFvVVCLFrgWzYweKwxgoWdPPv9kaqGW4Mi4OzOFW6wonDb
         3wEqR2i8XEAfUfo+0g09Sh36sOcI1qq54dqnKc4N5LQ2fom7aYq7BjvRHi+Up16PYIJS
         G9wGL7kG1OCUui194dj/tULK77sL0mtH7spwBVXTLamGDFhi9nO9S41JXlXaoxYkHjrW
         s4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775093159; x=1775697959;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0TTSvzfniH028lzX8No8jAcQ7PnQHkFWjL5CrlFmII=;
        b=DmA9Q5htL1IWZlCa5Dvr1Et9r4bHJNelbB9pWRbJxgvoPtLvf5rmYOW+n0m95HbgN5
         7q3nMfzunkGsEtbcd9QM9CQgiuSnV5rAxbxVSBnWsjJfeO6wKyavbvjsNlYEd2wZLUmO
         FG17IuXF7edmnKDH6cAOxFWFFl8sTE6TTQBR43kWNggJwvZFq3efVU/9xgFhPqG7lFXA
         zaE1YKTJcHY6zduRPHKH7EGqab/tq1K8adVS+V6DV7oh3G/2f+h9GDC0D+LEVJNSPo6c
         eTtfziPVvUjAVnHTkDU6fm4bqsXcDQbT8YHSn/Pxt0WycK5Azfy3IaDqmu6RNvi2/thH
         7+0A==
X-Forwarded-Encrypted: i=1; AJvYcCVNFhsD2E+WQYXps3G6QajVlfWAPAOlO4epIznX5IE2S+fwBU/NAgeYa20NEmzrsnWm1tYPw3omsgw3y6Wc8TL8@lists.infradead.org
X-Gm-Message-State: AOJu0YzqwlO9rPcj2tJ8u1m+GH4tDYJKfkrsxdXrItgL3kt/4N8qSoGB
	PKTDoo3+mahg/OxcxHb0TYZS4sEETNzixFtGTgjvNcTgBXwZbDu2K7o3sAW1NBBVFQ==
X-Gm-Gg: ATEYQzzXHrB66Oy5qVK9Ti/LYHbDxQFGrFr1hvZVISLjX4DUp+cvGnX66GUxoSNNtJs
	WOeC9QsOzqUIrEVi2YM0CiQHZb7JKiCFMXTCCh5BoVaIeo7KDgNzobQirTR6NWyco39mS8URaM8
	Gi1L6tgkrB/ofuXgJnkr01BiILsDXzI64N2cFIaX6E5wIP9pLknmaDVuTpXWSan7ML48tpBjifK
	5T+BEVqcno6kLFF7I+HK3eQKS1cTdWf+bKgW05R/Tzv1PFm7XQjOccO9L7M9+UcwC58NfbVPpkz
	EO7BChdxTFvFkGacFFr1FCdwKryk6sCA9Fq7Vyy1MKAImqBH1RgqLueJbNXNRFcvC947tk9zPgt
	W0DDJSGBax/xcLo/h3r1d2QRhtnBY8VXbmp8XcJ9j0IpKVrJjG2HJezW4TLWBlO0kDJgdVG5z0s
	2jXpZdnhbN9USVohVjZ+HVtHvtXvHyDK0ILQeqtakH7ViloNx9NwQ60A37QDJ3AYxMIFpnTqrTw
	oRNBWyjmkGZTtDJZWrktbQbyg==
X-Received: by 2002:a05:7301:fa0d:b0:2c1:6676:5ebd with SMTP id 5a478bee46e88-2c930e6b1fbmr3100327eec.10.1775093158301;
        Wed, 01 Apr 2026 18:25:58 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:9:862b:f392:67fb:ffb1? ([2a00:79e0:2e7c:9:862b:f392:67fb:ffb1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf1271asm1676362eec.26.2026.04.01.18.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 18:25:57 -0700 (PDT)
Message-ID: <dc670de4-2dae-4d5e-bf15-ac52c5a0868a@google.com>
Date: Wed, 1 Apr 2026 18:25:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/6] power: supply: max77759: add charger driver
To: Sebastian Reichel <sre@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jagan Sridharan <badhri@google.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-5-76f59233c369@google.com>
 <ac2jYUA2F5oQsA2g@venus>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <ac2jYUA2F5oQsA2g@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_182601_007439_DF020EED 
X-CRM114-Status: GOOD (  22.92  )
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

Hi Sebastian,

Thanks for the review!

On 4/1/26 4:17 PM, Sebastian Reichel wrote:
> Hi,
>
> On Tue, Mar 31, 2026 at 11:22:20PM +0000, Amit Sunil Dhamne via B4 Relay wrote:
>> +/* Charge Termination Voltage Limits (in mV) */
>> +static const struct linear_range chg_cv_prm_ranges[] = {
>> +	LINEAR_RANGE(3800, 0x38, 0x39, 100),
>> +	LINEAR_RANGE(4000, 0x0, 0x32, 10),
>> +};
> Let me quote from include/linux/power_supply.h:
>
>  * All voltages, currents, charges, energies, time and temperatures in uV,
>  * µA, µAh, µWh, seconds and tenths of degree Celsius unless otherwise
>  * stated. It's driver's job to convert its raw values to units in which
>  * this class operates.
>
> What makes you think that CONSTANT_CHARGE_VOLTAGE_MAX is
> special?
>
> [...]

It was an oversight, I will fix it.


>
>> +static int max77759_charger_get_property(struct power_supply *psy,
>> +					 enum power_supply_property psp,
>> +					 union power_supply_propval *pval)
>> +{
>> +	struct max77759_charger *chg = power_supply_get_drvdata(psy);
>> +	int ret;
>> +
>> +	switch (psp) {
>> +	case POWER_SUPPLY_PROP_ONLINE:
>> +		ret = get_online(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_PRESENT:
>> +		ret = charger_input_valid(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_STATUS:
>> +		ret = get_status(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CHARGE_TYPE:
>> +		ret = get_charge_type(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_HEALTH:
>> +		ret = get_health(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX:
>> +		ret = get_fast_charge_current(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX:
>> +		ret = get_float_voltage(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
>> +		ret = get_input_current_limit(chg);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	pval->intval = ret;
>> +	return ret < 0 ? ret : 0;
> As people like to use existing drivers as reference this definitely
> needs a comment, that none of the properties used by this driver
> support negative values. This is not a general thing as e.g. the
> CHARGE current may be negative depending on the battery being
> charged or discharged (OTG mode).

Ah okay, thanks for letting me know. I will add a comment.


As these patches are already in flight and part of usb-next of the usb
tree, I can send the suggested improvements as a separate patch, if that
works for you and Greg.


BR,

Amit

>
> Greetings,
>
> -- Sebastian

