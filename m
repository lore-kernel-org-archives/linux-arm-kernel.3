Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A7FD30CF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 00:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrG7y4Xlsrv3rqpWtCTovQ72S57auUFAQpNG8Gw5noI=; b=pClhfbpwL1JqaoRUfXlbD+dOvg
	YwWfddQ07pTuJ6rJhhD2zwTOk29sO01k8mnpiU0KHZGOEIE2FcEMFA+IUJhM98z3a91TFY9itReRD
	8Vl8uAqNkv1ByUT+x8RP1dZ95QHDV3ZPEnR/Im/r4U4mtuimntRImxPPzH1E49giEcrDQJGKz9KJ2
	DkagxQHbyAnkg8ZUJ9Nqr0BclORG+R5EajIHQwS1EU8/o4ZWjH+zT9Qy9ILJivyXlaN9d6n0VXEjX
	aVcZDBs34vMi88m4MiJKQW07vxWphyHGH3XIijLJ96XSUt2X9ikOloDBXB8sY+qyw17clB8/MzbLN
	ubwzQw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfp36-00000007v5M-1Ofs;
	Wed, 14 Jan 2026 00:47:49 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfp34-00000007v4y-0c0v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 00:47:47 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2ae29ddaed9so207885eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 16:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768351663; x=1768956463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KrG7y4Xlsrv3rqpWtCTovQ72S57auUFAQpNG8Gw5noI=;
        b=wnkHCKfTRYLN5Od/AZwh6mtt1JKy3Jt6mvsj3NXBFvQbygSPL/Yk7IJBzExtl3wjpk
         u4+U3xpj2yRF8lsNmfxXjD/nnH/GErbnfy1ZlbUecLNg9pchCbp2tTEAEOAisFkivlAv
         v08qpXWFxCMAXuB0u4NX3jV37qbXtnSjAuRZ76NRuhHAXoDJTM+oeiAA/acsqu7/+MeK
         fEwHMpE4c863Qt/1rElPKUzTq5ZM8KH73lTk0rY8K3mlrSbhBoGIt+gMfWNrJCcsSPF0
         aTlEvrGSUl4sJIERDZv2EAdMItwpiIDFNp6SotK/a6q2WS9URWoWVbpaHNKXYinA82/Q
         gykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768351663; x=1768956463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrG7y4Xlsrv3rqpWtCTovQ72S57auUFAQpNG8Gw5noI=;
        b=Cca0H4cehNFHnCDnuHJgza7870Ob8+PuTZvp0yOfKmTToAdcVAk7JRUfy2/WIpK9EJ
         gRmTPYhWNRzJhvcWF17Qu6kJ0b/nqAV+FY/ICIhXF7OEz+5YYHfPXVXWGVEyDKFViL79
         tp72FMcyqakVa97ZdZ5uKopHXocvWl42vR8/zghV6l71DtPqEZ5TXd2e4rV4CWTg9NIu
         lNd2Fo3E3V821WfjwxQm+7e70j3XrPZiyg+jpvo4JDR8+WETcfKKXmWwKcPIA/yI8Ccr
         oyBUFH8gs/d07m0y0cylIn+KRo2t3o8XJmKZPs+xHjZ5PV3Ca6XP+TysYMSSRGB3RZ+R
         A5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVh4tMe+9NMdTVRTHqiu/lQkpO0sL3dOVcpkc4ZAPXMuF9LT9bjmxbZbVAh8AxPQVN6ruVVtUzV2/Rzyi/SjsjJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/wfzItpvJ6REsMHUTLfFgKKxqh/LKF7P8AAJqYUlmKqbhWTy7
	xiAYSFJbTr0/oExrV2qfgQTE4v73kvMqVCTUfKYHYpQpcZ2hGVndf9LS63djQSGjIA==
X-Gm-Gg: AY/fxX5SGdexvGYIEfRY9048Hujo6JL5nQRgESmzHEoywt42FXPBfY3u2cKgxinpCqD
	VOfy462O4ktRuZqC+ZXPeK4xVxknAIXy4YewzJ9pej+tCxziQXN6feCJ7vpPei7/YhAB6cC7kxq
	tOHwLLhBBqDTjToThZpPB1ICpAyFEsp8GTFJmk7+CjY867gx7RTzKE1NxR6/Thb+8qfBNIiTlNN
	/y82qSsUTTWQeDdB/4WF3L3imW7wNe0e1PQao4byt3msLby1qzuXsfSRdv1Hp/zT7SNBTx1aznW
	LpBpP1ZOYDDVzG5fj9VctFT8QcrvnguVtNBe4Pt/FtC3LIe7lMbgat/7Uf3Bv5VeMmTWFpDFDYo
	n64+WOPU8pDu7EaelNUOPnP0BDW7ENPOA8ifo+eAYTxi2atk963r0wZ/K532+zqyVREoV2Yl9Iw
	dSIGiQGqO6lm4bH5cxWd21lrBZ3BrbKqdMmrETx0Yf6cUVyHuQuvh2d4wA3UFRSXUTzIPI1j6/P
	0ZkCYTFkCsdkQ==
X-Received: by 2002:a05:7301:19ad:b0:2a4:6c74:c54a with SMTP id 5a478bee46e88-2b486f41ca8mr940567eec.18.1768351662492;
        Tue, 13 Jan 2026 16:47:42 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:b660:2cbe:a9b7:fc12? ([2a00:79e0:2e7c:8:b660:2cbe:a9b7:fc12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a5d3dsm17693801eec.13.2026.01.13.16.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 16:47:41 -0800 (PST)
Message-ID: <378ee786-2b44-44e7-a3f6-0cd1db3c0481@google.com>
Date: Tue, 13 Jan 2026 16:47:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] power: supply: max77759: add charger driver
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
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
 <20251227-max77759-charger-v3-4-54e664f5ca92@google.com>
 <298ca35590d2180fdcf334f94964b6110e17c606.camel@linaro.org>
 <50c29a62-1fdb-4de2-8887-0d551eee5ec0@google.com>
 <255d7726-6758-43ed-b35f-db14726bcc9b@google.com>
 <2869d309358f27652289c40810ca36b2ec155d1d.camel@linaro.org>
 <bb9b9afa-0bfa-428e-9372-549d9ba8603c@google.com>
 <6b37b88e9b7ee57eb1c006916fd995c813ab5e6e.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <6b37b88e9b7ee57eb1c006916fd995c813ab5e6e.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_164746_219071_71E40224 
X-CRM114-Status: GOOD (  38.94  )
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

On 1/13/26 2:02 AM, André Draszik wrote:
> Hi Amit,
>
> On Mon, 2026-01-12 at 11:37 -0800, Amit Sunil Dhamne wrote:
>> Hi Andre',
>>
>> On 1/12/26 5:47 AM, André Draszik wrote:
>>> Hi Amit,
>>>
>>> On Tue, 2026-01-06 at 17:14 -0800, Amit Sunil Dhamne wrote:
>>>> On 1/6/26 3:41 PM, Amit Sunil Dhamne wrote:
>>>>> Hi Andre',
>>>>>
>>>>> On 1/5/26 9:32 AM, André Draszik wrote:
>>>>>> Hi Amit,
>>>>>>
>>>>>> I haven't done a full review, but a few things caught my eye.
>>>>>>
>>>>>> On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay wrote:
>>>>>>> diff --git a/drivers/power/supply/Makefile
>>>>>>> b/drivers/power/supply/Makefile
>>>>>>> index 4b79d5abc49a..6af905875ad5 100644
>>>>>>> --- a/drivers/power/supply/Makefile
>>>>>>> +++ b/drivers/power/supply/Makefile
>>>>>>> [...]
>>>>>>> +
>>>>>>> +static irqreturn_t irq_handler(int irq, void *data)
>>>>>>> +{
>>>>>>> +    struct max77759_charger *chg = data;
>>>>>>> +    struct device *dev = chg->dev;
>>>>>>> +    u32 chgint_ok;
>>>>>>> +    int i;
>>>>>>> +
>>>>>>> +    regmap_read(chg->regmap, MAX77759_CHGR_REG_CHG_INT_OK,
>>>>>>> &chgint_ok);
>>>>>> You might want to check the return value and return IRQ_NONE if it
>>>>>> didn't
>>>>>> work?
>>>>>>
>>>>>>> +
>>>>>>> +    for (i = 0; i < ARRAY_SIZE(irqs); i++) {
>>>>>>> +        if (irqs[i] == irq)
>>>>>>> +            break;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    switch (i) {
>>>>>>> +    case AICL:
>>>>>>> +        dev_dbg(dev, "AICL mode: %s",
>>>>>>> +            str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_AICL));
>>>>>>> +        break;
>>>>>>> +    case CHGIN:
>>>>>>> +        dev_dbg(dev, "CHGIN input valid: %s",
>>>>>>> +            str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHGIN));
>>>>>>> +        break;
>>>>>>> +    case CHG:
>>>>>>> +        dev_dbg(dev, "CHG status okay/off: %s",
>>>>>>> +            str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHG));
>>>>>>> +        break;
>>>>>>> +    case INLIM:
>>>>>>> +        dev_dbg(dev, "Current Limit reached: %s",
>>>>>>> +            str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_INLIM));
>>>>>>> +        break;
>>>>>>> +    case BAT_OILO:
>>>>>>> +        dev_dbg(dev, "Battery over-current threshold crossed");
>>>>>>> +        break;
>>>>>>> +    case CHG_STA_CC:
>>>>>>> +        dev_dbg(dev, "Charger reached CC stage");
>>>>>>> +        break;
>>>>>>> +    case CHG_STA_CV:
>>>>>>> +        dev_dbg(dev, "Charger reached CV stage");
>>>>>>> +        break;
>>>>>>> +    case CHG_STA_TO:
>>>>>>> +        dev_dbg(dev, "Charger reached TO stage");
>>>>>>> +        break;
>>>>>>> +    case CHG_STA_DONE:
>>>>>>> +        dev_dbg(dev, "Charger reached TO stage");
>>>>>>> +        break;
>>>>>> Are the above debug messages really all needed?
>>>> I forgot to respond to this comment in my previous email.
>>>>
>>>> I think we can keep AICL, BAT_OILO, INLIM. They're either special
>>>> conditions (AICL) or faulty conditions (like BAT_OILO) and we can in
>>>> fact keep them at dev_info level. Rest can be removed and a
>>>> power_supply_changed() is sufficient.
>>>>
>>>> Let me know what you think?
>>> I don't think dev_info() in an interrupt handler is appropriate. At
>>> least it should be ratelimited.
>>>
>>> If it's something special / unexpected that needs attention, having
>>> a dev_dbg() message only will usually not be visible to anybody.
>> I agree. I can change the prints to dev_info_ratelimited for the stuff
>> we care about.
> If it's an erroneous condition, maybe warn or even err are more appropriate?
>
> But then, what is the expectation upon the user observing these messages?
> What can or should they do? Who is going to look at these and can do
> something sensible based on them?

The logging will help in postmortem analysis which may or may not 
possible with just publishing uevents to userspace hoping that they log 
the psy properties. Illustrating a situation:

1. Over current situation happened where the Battery to System current 
exceeds the BAT_OILO threshold. This would also generate an interrupt.

2. The MAX77759 takes protective measures if the condition lasts for a 
certain specified time and reset. Resetting will cause Vsys to collapse 
to 0 if the system is only battery powered.

3. It'd be better that the BAT_OILO interrupt is logged in dmesg, 
instead of just delegating it to user space as user can debug this 
condition by looking at last_kmsg or pstore.

4. This signal can help the user debug conditions such as moisture (this 
signal + contaminant detection) or indicative of a mechanical failure.

I do agree though that this is a hypothetical or very rare situation and 
if you have a strong opinion against this I am okay with removing the 
prints completely.


>
>>> Also will the call to power_supply_changed() down below handle the
>>> special conditions (e.g. convey to upper levels)? If not, can it be
>>> made to do so?
>> Yes it does, as I can see a call to kobject_uevent() inside
>> power_supply_changed_work(). Also, power_supply_changed() also notifies
>> other subsystems that have registered their notifiers downstream of this
>> power_supply object. So I believe we're good there.
> If erroneous conditions are handled by other / upper layers, why print a
> message in this interrupt handler in the first place?

I tried illustrating an example above.


>
> Also, I just noticed there is a max77705 charger driver. It seems quite
> similar to this one, maybe it can be leveraged / extended?

Thanks for the feedback. I reviewed the max77705 charger driver. .

Here is a breakdown of why I believe a separate driver may be a better 
approach:

Similarities:

1. Helper Functions: We could potentially leverage common logic for 
get_charge_type, get_status, get_health, and get_input_current.

2. Register Access: MAX77705 uses regfield abstractions to handle 
register operations which can also be potentially leveraged.

3. Initialization: Some hardware initialization steps appear similar, 
though about 60% of the max77705 initialization (e.g., switching 
frequency, WCIN regulation voltage, top-off time) is irrelevant for the 
max77759 configuration I need.

Differences:

1. OTG Support: The max77759 driver supports OTG boost mode, which is a 
key requirement for my use case. While the max77705 hardware might 
support OTG based on its registers, the current driver implementation 
does not support it.

2. TCPCI/TCPM Integration: The max77759 driver is explicitly architected 
to work with a TCPCI/TCPM-compliant Type-C controller to set input 
current limits dynamically. It is ambiguous whether the max77705 device 
uses a standard TCPCI/TCPM model or a proprietary one.

3. Register Incompatibility: There are distinct register differences. 
For example, the max77705 driver relies on BATP and BATP_DTLS registers, 
which do not exist in the max77759. Conversely, the max77759 has a 
dedicated second interrupt register (CHG_INT2) that reports critical 
signals like BAT_OILO, SYS_UVLO, and charging stages, which appear 
absent or handled differently in the max77705. Additionally, MAX77759 
has input selection (wireless, usb) and uses it in the driver but it's 
not evident from register definitions whether max77705 has it.

4. Parameter Calculations: The formulas for calculating parameters like 
Fast Charge Current (CHGCC) and Float Voltage are different between the 
two chips. Merging the drivers would require separate, chip-specific 
getter/setter functions for these core properties.

5. Device-Specific Workarounds: The max77705 driver includes a 
workaround in max77705_aicl_irq that is not relevant to the max77759. 
There may also be future workarounds which may not be applicable to one 
or the other.

Logistical Constraints: I don't have access to max77705 hardware or its 
full datasheet. This makes it impossible for me to test any shared code 
changes to ensure I haven't introduced regressions on the max77705. IMO, 
given these constraints and technical divergences, maintaining separate 
drivers maybe a better choice. Please let me know wdyt?


BR,

Amit

>
>
> Cheers,
> Andre'

