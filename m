Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C851ED6CFAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 00:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tE7mr/0V0L9NQ2SZe3k6ZclwJcnVA7mLebR3n7wOnU=; b=LJ3H95+6tGJMUcQchEQ7KKcKqv
	KAPmKlZQ5K9Yd4CSxGoZRP1rN9sbw5i/b5IlRfXwQ7bP2r16JN5NzE4u8Zy/5reN9FY4qWeecNu6c
	h05zqXDhacvH1ZzmCyFkH+8BjCny0bWWE1qS47QpZQ7F7wr1vVbBSxJizcsopNWMhuDPKyXyzvoDM
	amlsx9UyTy9l4hN5DSYly0IwoFI9JJNLwIkV9j05FioH9tEOiwE4l+eap/YD724u6IKM+NM9V/Nih
	jYT2LJ2Tmb2Jo13OrpgHp4YU7SrI+yVEBf1upj3yPNhVS5e80GQnLElu+T05ugK/iYqs9+9My2+T6
	MrZSrOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj4iQ-00000007v5f-2hIJ;
	Fri, 23 Jan 2026 00:07:54 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj4iO-00000007v5H-2GTE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 00:07:53 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-121bf277922so2803573c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 16:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769126871; x=1769731671; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tE7mr/0V0L9NQ2SZe3k6ZclwJcnVA7mLebR3n7wOnU=;
        b=S6er6e52zGD4829rF7AsSrIgh1Zq9pUpQKauW+niU+l34qWS6stfD/EefMR27yHbWI
         bFb+Hs2IsdrCkh6j9YyXmxScxAWpj/tD0DU7i9SgkMSY+z04/m/wM3IjKlJJ4PSp/C4N
         fW8pFyY3iI3MiDARo6PGEOdsof82joNbWPc+86e3Wjkcqs492HjtdTMHPnZq3WZgRpaY
         CO+mbYgsuliQAWdco3VvKZlqGlpJwEEcuXU9U304FQ1lJvZJPi+a5Kv3JySq0Odcnzbl
         anbvkEagK2NETfDhP49HeKQmYAUYvzMBdMIKEfLCOwajRpkgh4mz2y8PrhUIQnSZx883
         CbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769126871; x=1769731671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tE7mr/0V0L9NQ2SZe3k6ZclwJcnVA7mLebR3n7wOnU=;
        b=Mw7EfHlu6skwiQU19+wpStVN2Ul7bJsoDZLncwYIHrcVB9hX10F5pfkzkr4ZgTjZy4
         4pXWIKQyEVC9UiZEQ2heeJzWZojnJ8My43QmrV0Q6+zvoKbBHKv1znrmgU0ibjXyVAD8
         xD8hbsOpL8aEdVT50p2qj5C+rMXI1Ltzv+ddwuwbCsY9DGpR3uWXfakNyJ5Soziq7HAt
         CDQW+EvKQc8Rr7AXUy1FnMlFb41LLtBsD2DyvbMoWF0r57xTQKXosrtpszh5KYIZdolb
         scdp/8V8I3HTFfE3On3XcqArxY7vJjR9tvNVSftvfHXpIX1Uw2uHNFCGumy0/DmZhvI0
         szZA==
X-Forwarded-Encrypted: i=1; AJvYcCWcOriJ/djJaNhbE72phc6+K6bO4Mx02MagyE5QLXU/wXnHNfqktRw7M0f/yqjTE+QxS/V6PuaKDyn5eLyQ05Ol@lists.infradead.org
X-Gm-Message-State: AOJu0YxX2gDjkkJHtSDE6tdxAMe6aIOOTWSUd/CUbWyY/g7aGqoXQZk+
	L4o0UjrbWjW/PwS+Wkz1pqUIXaEc90b848kn6a4q96u2CHtrBOGSLKvHWTa9eW7C1A==
X-Gm-Gg: AZuq6aKXF3fCy5SKLS2zhBUz82aCEVSCmezXFnPyG4pjQe12JmgAuWtQFwX2Lb0oF8j
	5Ax3wUBJrCRcweaqqpWcNb8VV6aEBNbzkzLsRuws2HAGdaHOJrTpTu19OmYH2sV+A4r5XaQJHB5
	L5xh0C6SXhCecvqKfg/5tBRtpwbtGmKvGmUglL2/nYwxftSGysOtqwWufLleQKWYQg0DkxOqwKu
	FsEikQHCFMCS9aWxVMcPqFNyf9zqJoC9DvDN5U32Tg0rhrxN6b/F8rRyhlsu+1M2uhMQghBbgTc
	jY9MsBXrrftLKGIeW3dCiOgGIPVghIgrQEnpjWLsxNBpwDgD3eLokSQGsR0kDAShtzaLSdC3cai
	qIoxbQMzovfrwQmk+HTI7uvZMXiT0ZqQPBXr3+FxhOKXN7eHr4u9oTgIrHbGdQi2ojeRzo4H2Tw
	knGJgsOXxYdkaMNiRDjlLTFaYUJbmqXDoRvIPXVC9AXqOHMMd2d7mk+pvy6I6gsKA0ExLNsd4N5
	2W3Z4x2ybRaww==
X-Received: by 2002:a05:7300:bc86:b0:2b7:1abc:a6eb with SMTP id 5a478bee46e88-2b73995a52cmr598828eec.7.1769126870306;
        Thu, 22 Jan 2026 16:07:50 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:7fdc:abb8:fa2e:d750? ([2a00:79e0:2e7c:8:7fdc:abb8:fa2e:d750])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a692222sm1153673eec.6.2026.01.22.16.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 16:07:49 -0800 (PST)
Message-ID: <bf3bd5f7-28e1-4fe3-afca-34f12b2cede8@google.com>
Date: Thu, 22 Jan 2026 16:07:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] power: supply: max77759: add charger driver
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
References: <20260121-max77759-charger-v4-0-694234c8ded1@google.com>
 <20260121-max77759-charger-v4-4-694234c8ded1@google.com>
 <71d816c5ed4ee2d13ec63b8fd4acd49f4e418284.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <71d816c5ed4ee2d13ec63b8fd4acd49f4e418284.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_160752_619331_D0637E95 
X-CRM114-Status: GOOD (  41.71  )
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

Hi Andre',

On 1/22/26 4:47 AM, André Draszik wrote:
> Hi Amit,
>
> Thanks for your patches, just a few minor comments below.

Thanks for your feedback!


>
> On Wed, 2026-01-21 at 00:59 +0000, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add support for MAX77759 battery charger driver. This is a 4A 1-Cell
>> Li+/LiPoly dual input switch mode charger. While the device can support
>> USB & wireless charger inputs, this implementation only supports USB
>> input. This implementation supports both buck and boost modes.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   MAINTAINERS                             |   6 +
>>   drivers/power/supply/Kconfig            |  11 +
>>   drivers/power/supply/Makefile           |   1 +
>>   drivers/power/supply/max77759_charger.c | 737 ++++++++++++++++++++++++++++++++
>>   4 files changed, 755 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0d044a58cbfe0f2b97f3682a86708e1ece108e9f..38354964a85c34611b1b54e20651b360f3b9c11e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15546,6 +15546,12 @@ F:	drivers/mfd/max77759.c
>>   F:	drivers/nvmem/max77759-nvmem.c
>>   F:	include/linux/mfd/max77759.h
>>   
>> +MAXIM MAX77759 BATTERY CHARGER DRIVER
>> +M:	Amit Sunil Dhamne <amitsd@google.com>
>> +L:	linux-kernel@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/power/supply/max77759_charger.c
>> +
>>   MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
>>   M:	Javier Martinez Canillas <javier@dowhile0.org>
>>   L:	linux-kernel@vger.kernel.org
>> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
>> index 92f9f7aae92f249aa165e68dbcd4cebb569286ea..3a2cdb95c98e44324151ac2b86d740ae2923ee77 100644
>> --- a/drivers/power/supply/Kconfig
>> +++ b/drivers/power/supply/Kconfig
>> @@ -631,6 +631,17 @@ config CHARGER_MAX77705
>>   	help
>>   	  Say Y to enable support for the Maxim MAX77705 battery charger.
>>   
>> +config CHARGER_MAX77759
>> +	tristate "Maxim MAX77759 battery charger driver"
>> +	depends on MFD_MAX77759 && REGULATOR
>> +	default MFD_MAX77759
>> +	help
>> +	  Say M or Y here to enable the MAX77759 battery charger. MAX77759
>> +	  charger is a function of the MAX77759 PMIC. This is a dual input
>> +	  switch-mode charger. This driver supports buck and OTG boost modes.
>> +
>> +	  If built as a module, it will be called max77759_charger.
>> +
>>   config CHARGER_MAX77976
>>   	tristate "Maxim MAX77976 battery charger driver"
>>   	depends on I2C
>> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
>> index 4b79d5abc49a7fd1e37a26d0c89f94d9fe3a916f..6af905875ad5e3b393a7030405355b9a975870f6 100644
>> --- a/drivers/power/supply/Makefile
>> +++ b/drivers/power/supply/Makefile
>> @@ -128,3 +128,4 @@ obj-$(CONFIG_CHARGER_SURFACE)	+= surface_charger.o
>>   obj-$(CONFIG_BATTERY_UG3105)	+= ug3105_battery.o
>>   obj-$(CONFIG_CHARGER_QCOM_SMB2)	+= qcom_smbx.o
>>   obj-$(CONFIG_FUEL_GAUGE_MM8013)	+= mm8013.o
>> +obj-$(CONFIG_CHARGER_MAX77759)	+= max77759_charger.o
>> diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..34b5ea0967eb7b4716e81ee1a55227ac872493b0
>> --- /dev/null
>> +++ b/drivers/power/supply/max77759_charger.c
>> @@ -0,0 +1,737 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * max77759_charger.c - Battery charger driver for MAX77759 charger device.
>> + *
>> + * Copyright 2025 Google LLC.
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/device.h>
>> +#include <linux/devm-helpers.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/irq.h>
>> +#include <linux/math64.h>
>> +#include <linux/mfd/max77759.h>
>> +#include <linux/module.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/power_supply.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/driver.h>
>> +#include <linux/string_choices.h>
>> +
>> +/* Default values for Fast Charge Current & Float Voltage */
>> +#define CHG_CC_DEFAULT_UA			2266770
>> +#define CHG_FV_DEFAULT_MV			4300
>> +
>> +#define FOREACH_IRQ(S)			\
>> +	S(AICL),			\
>> +	S(CHGIN),			\
>> +	S(CHG),				\
>> +	S(INLIM),			\
>> +	S(BAT_OILO),			\
>> +	S(CHG_STA_CC),			\
>> +	S(CHG_STA_CV),			\
>> +	S(CHG_STA_TO),			\
>> +	S(CHG_STA_DONE)
>> +
>> +#define GENERATE_ENUM(e)		e
>> +#define GENERATE_STRING(s)		#s
>> +
>> +enum {
>> +	FOREACH_IRQ(GENERATE_ENUM)
>> +};
>> +
>> +static const char *const chgr_irqs_str[] = {
>> +	FOREACH_IRQ(GENERATE_STRING)
>> +};
>> +
>> +#define NUM_IRQS			ARRAY_SIZE(chgr_irqs_str)
>> +
>> +struct max77759_charger {
>> +	struct device *dev;
>> +	struct regmap *regmap;
>> +	struct power_supply *psy;
>> +	struct regulator_dev *chgin_otg_rdev;
>> +	struct notifier_block nb;
>> +	struct power_supply *tcpm_psy;
>> +	struct work_struct psy_work;
>> +	int irqs[NUM_IRQS];
>> +	struct mutex lock; /* protects the state below */
>> +	enum max77759_chgr_mode mode;
>> +};
>> +
>> +static inline int regval_to_val(int reg, int reg_offset, int step, int minval)
>> +{
>> +	return ((reg - reg_offset) * step) + minval;
>> +}
>> +
>> +static inline int val_to_regval(int val, int minval, int step, int reg_offset)
>> +{
>> +	s64 dividend;
>> +
>> +	if (unlikely(step == 0))
>> +		return reg_offset;
> Does it really make an impact on performance to specify unlikely? Also, I seem to
> remember that the if branch is treated as unlikely anyway, but can't find any hard
> evidence on that right now.

I was hoping it's performance improving even if negligible, though I 
don't have evidence to support either arguments. In any case, I kept it 
for readability.


>
>> +
>> +	dividend = (s64)val - minval;
>> +	return DIV_S64_ROUND_CLOSEST(dividend, step) + reg_offset;
>> +}
> For these two functions above, have you considered using the APIs from
> include/linux/linear_range.h instead of duplicating in this driver? The
> implementations of the above match linear_range_get_value() and
> linear_range_get_selector_low() quite nicely.

I think it looks useful, will check it out.


>> +
>> +static inline int unlock_prot_regs(struct max77759_charger *chg, bool unlock)
>> +{
>> +	return regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_06,
>> +				  MAX77759_CHGR_REG_CHG_CNFG_06_CHGPROT, unlock
>> +				  ? MAX77759_CHGR_REG_CHG_CNFG_06_CHGPROT : 0);
>> +}
>> +
> [...]
>
>> +static irqreturn_t irq_handler(int irq, void *data)
>> +{
>> +	struct max77759_charger *chg = data;
>> +	struct device *dev = chg->dev;
>> +	int i;
>> +
>> +	for (i = 0; i < NUM_IRQS && chg->irqs[i] != irq; i++)
>> +		;
>> +
>> +	if (i == NUM_IRQS) {
>> +		dev_err(dev, "Unable to handle irq=%d", irq);
>> +		return IRQ_NONE;
>> +	} else if (i == BAT_OILO) {
>> +		dev_warn(dev, "Battery over-current threshold crossed");
>> +	}
> Generally, no 'else' is required after return.

I will refactor it in the next rev.


>> +
>> +	power_supply_changed(chg->psy);
>> +	return IRQ_HANDLED;
>> +}
>> +
> [...]
>
>> +static void psy_work_item(struct work_struct *work)
>> +{
>> +	struct max77759_charger *chg =
>> +		container_of(work, struct max77759_charger, psy_work);
>> +	union power_supply_propval current_limit, online;
>> +	int ret;
>> +
>> +	ret = power_supply_get_property(chg->tcpm_psy,
>> +					POWER_SUPPLY_PROP_CURRENT_MAX,
>> +					&current_limit);
>> +	if (ret) {
>> +		dev_err(chg->dev,
>> +			"Failed to get CURRENT_MAX psy property, ret=%d",
>> +			ret);
>> +		return;
>> +	}
>> +
>> +	ret = power_supply_get_property(chg->tcpm_psy, POWER_SUPPLY_PROP_ONLINE,
>> +					&online);
>> +	if (ret) {
>> +		dev_err(chg->dev,
>> +			"Failed to get ONLINE psy property, ret=%d",
>> +			ret);
>> +		return;
>> +	}
>> +
>> +	if (online.intval && current_limit.intval) {
>> +		ret = set_input_current_limit(chg, current_limit.intval);
>> +		if (ret)
>> +			dev_err(chg->dev,
>> +				"Unable to set current limit, ret=%d", ret);
>> +
>> +		charger_set_mode(chg, MAX77759_CHGR_MODE_CHG_BUCK_ON);
>> +	} else {
>> +		charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
>> +	}
> For all the possible errors in this function, should the driver try a bit
> harder, even if unlikely to occur?

Maybe we can do this:

On failure of either of the power_supply_get_property() calls or 
set_input_current_limit(), we should first turn off the charger (as 
that's the safest choice) and reschedule this work for a certain number 
of times (maybe 3). Obviously, if we recover from this state, we reset 
the error limit and don't reschedule this work anymore. Do you concur?


> What if the current limit needed to be
> reduced, e.g. due to thermal or any other reasons?

This specific piece of code is for setting current limit that is driven 
by USB Type-C subsystem. If the Type-C subsystem re-negotiates a PD 
contract this piece of code will re-run as this subsystem will be 
re-notified by TCPM. For cases where we need to cap the current limit 
due to thermal management, that's a hardware driven feature. It is 
enabled by enabling JEITA management. That's not in the scope atm.


>
> Could rescheduling the work be something to consider?
>
Responded in the previous comment..


>> +}
>> +
>> +static int psy_changed(struct notifier_block *nb, unsigned long evt, void *data)
>> +{
>> +	struct max77759_charger *chg = container_of(nb, struct max77759_charger,
>> +						    nb);
>> +	const char *psy_name = "tcpm-source";
> This can be static const char.

Will fix it.


>
>> +	struct power_supply *psy = data;
>> +
>> +	if (!strnstr(psy->desc->name, psy_name, strlen(psy_name)) ||
>> +	    evt != PSY_EVENT_PROP_CHANGED)
>> +		return NOTIFY_OK;
>> +
>> +	chg->tcpm_psy = psy;
>> +	schedule_work(&chg->psy_work);
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static void max_tcpci_unregister_psy_notifier(void *nb)
>> +{
>> +	power_supply_unreg_notifier(nb);
>> +}
>> +
>> +static int max77759_charger_probe(struct platform_device *pdev)
>> +{
>> +	struct regulator_config chgin_otg_reg_cfg;
>> +	struct power_supply_config psy_cfg;
>> +	struct device *dev = &pdev->dev;
>> +	struct max77759_charger *chg;
>> +	int ret;
>> +
>> +	device_set_of_node_from_dev(dev, dev->parent);
>> +	chg = devm_kzalloc(dev, sizeof(*chg), GFP_KERNEL);
>> +	if (!chg)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, chg);
>> +	chg->dev = dev;
>> +	chg->regmap = dev_get_regmap(dev->parent, "charger");
>> +	if (!chg->regmap)
>> +		return dev_err_probe(dev, -ENODEV, "Missing regmap");
>> +
>> +	ret = devm_mutex_init(dev, &chg->lock);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to initialize lock");
>> +
>> +	psy_cfg.fwnode = dev_fwnode(dev);
>> +	psy_cfg.drv_data = chg;
>> +	chg->psy = devm_power_supply_register(dev, &max77759_charger_desc,
>> +					      &psy_cfg);
>> +	if (IS_ERR(chg->psy))
>> +		return dev_err_probe(dev, -EPROBE_DEFER,
>> +				     "Failed to register psy, ret=%ld",
>> +				     PTR_ERR(chg->psy));
>> +
>> +	ret = max77759_charger_init(chg);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "Failed to initialize max77759 charger");
>> +
>> +	chgin_otg_reg_cfg.dev = dev;
>> +	chgin_otg_reg_cfg.driver_data = chg;
>> +	chgin_otg_reg_cfg.of_node = dev_of_node(dev);
>> +	chg->chgin_otg_rdev = devm_regulator_register(dev, &chgin_otg_reg_desc,
>> +						      &chgin_otg_reg_cfg);
>> +	if (IS_ERR(chg->chgin_otg_rdev))
>> +		return dev_err_probe(dev, PTR_ERR(chg->chgin_otg_rdev),
>> +				     "Failed to register chgin otg regulator");
>> +
>> +	ret = devm_work_autocancel(dev, &chg->psy_work, psy_work_item);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to initialize psy work");
>> +
>> +	chg->nb.notifier_call = psy_changed;
>> +	ret = power_supply_reg_notifier(&chg->nb);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "Unable to register psy notifier");
>> +
>> +	ret = devm_add_action_or_reset(dev, max_tcpci_unregister_psy_notifier,
>> +				       &chg->nb);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "Failed to add devm action to unregister psy notifier");
>> +
>> +	return max77759_init_irqhandler(chg);
>> +}
>> +
>> +static const struct platform_device_id max77759_charger_id[] = {
>> +	{"max77759-charger",},
> Minor formatting nit - I believe common practice is to use named initializers:
>
> +	{ .compatible = "max77759-charger", },

Will fix.


>
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(platform, max77759_charger_id);
>> +
>> +static struct platform_driver max77759_charger_driver = {
>> +	.driver = {
>> +		.name = "max77759-charger",
> Can it be async, or are there issues with that?
>
>                  .probe_type = PROBE_PREFER_ASYNCHRONOUS,

I don't think adding this should be an issue as this driver has very few 
dependencies. I will test it and add this in my next revision.


>
> Thanks again Amit!

You're welcome!


BR,

Amit

>
> Cheers,
> Andre'
>
>> +	},
>> +	.probe = max77759_charger_probe,
>> +	.id_table = max77759_charger_id,
>> +};
>> +module_platform_driver(max77759_charger_driver);
>> +
>> +MODULE_AUTHOR("Amit Sunil Dhamne <amitsd@google.com>");
>> +MODULE_DESCRIPTION("Maxim MAX77759 charger driver");
>> +MODULE_LICENSE("GPL");

