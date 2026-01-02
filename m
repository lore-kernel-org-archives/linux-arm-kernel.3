Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC97FA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 13:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w30f0aKhzY/BrVZBK+sZ1MLz2lJKq7HC3XmXGjiFEzY=; b=zi0mESQVMJPBnffR55FMijdFc5
	OZ2S7UD5rKzjMj1Lpj8p9TshjOsZGdfEe5tCLlh9rV+SHmXGlZU2MwZV5Xt3CcIesPFP9MuV+1kJR
	AlAS0Y8+t7nj0m+2e0h8NfLbPPQdm+QOUrW9y1X2/VxD45OwUzCwCGcZGPSnlM/A2FzbFt1QCVyl5
	2z3Q7ngKbEvzX+pp3NgenOXldluVnY11/SSrj01Vrc6ooFtznwPTP7U4pxtZu7ItJg3orsyA05zwp
	driAZDmdP8XKrlYW82uxXIMkMXPXm6msw0YJIYIraIkIEg+/nUKFwlC4CKRNZRHtiIS2wSWTPGGU7
	Mvss/j7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbf6D-00000008HvB-3cIG;
	Fri, 02 Jan 2026 13:21:49 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbf6A-00000008Hum-3udn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 13:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767360105; bh=cEVMRQP8y3po3C2OZqVBVcXcp0ZrdjOz8UuEbKUXPSE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A43fywxtve3bdIZ2ks69LwrHc37hXB1kG8cTiSeC8cQeo4TF868gL4WCZpJ7tlPwC
	 1Mm4F/qqF9wo9L5ecs9lwOu6xK7BT6u7VlmyEx6z+sK+89kNNTLIY6G3n8wWHZmcF0
	 1d2JGf8HCtxfjKP2sQhMDGQjgjwhY6aS+hH/S2faxxURu99GfT+cm1CSCNKt+aICdQ
	 SbIhxM92StWcpo4S52gjoUgilB2KxlKDZ4oCIPYdU4RpNRd5UvMLec2JA5eX+ecWMf
	 5RJ358AEc0ljpEh2Bt/f+EarwNwEaJSWN17rYhENrZ6DlQ2L7vfKJ6xCWayA9dHi0J
	 BemkJXw6TTzlw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 264A43E9C54;
	Fri,  2 Jan 2026 13:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767360105; bh=cEVMRQP8y3po3C2OZqVBVcXcp0ZrdjOz8UuEbKUXPSE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A43fywxtve3bdIZ2ks69LwrHc37hXB1kG8cTiSeC8cQeo4TF868gL4WCZpJ7tlPwC
	 1Mm4F/qqF9wo9L5ecs9lwOu6xK7BT6u7VlmyEx6z+sK+89kNNTLIY6G3n8wWHZmcF0
	 1d2JGf8HCtxfjKP2sQhMDGQjgjwhY6aS+hH/S2faxxURu99GfT+cm1CSCNKt+aICdQ
	 SbIhxM92StWcpo4S52gjoUgilB2KxlKDZ4oCIPYdU4RpNRd5UvMLec2JA5eX+ecWMf
	 5RJ358AEc0ljpEh2Bt/f+EarwNwEaJSWN17rYhENrZ6DlQ2L7vfKJ6xCWayA9dHi0J
	 BemkJXw6TTzlw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id BFCA53E98AF;
	Fri,  2 Jan 2026 13:21:44 +0000 (UTC)
Message-ID: <1a336af6-6c27-4211-9c8c-ede4d091eb17@mleia.com>
Date: Fri, 2 Jan 2026 15:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: nxp: Add a simple NXP LPC32xx socinfo driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260101235647.2411062-1-vz@mleia.com>
 <20260101235647.2411062-3-vz@mleia.com>
 <accb4ab1-07fa-4e33-a74c-2c588ca415ac@kernel.org>
 <eb9ef21a-c0b4-4c8d-b1b1-6c76f45c53aa@mleia.com>
 <1eef3c49-83a7-48d4-96ad-ffb71df2be7a@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <1eef3c49-83a7-48d4-96ad-ffb71df2be7a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260102_132145_174016_E8DD0099 
X-CRM114-Status: GOOD (  20.12  )
/bin/ln: failed to access 'reaver_cache/texts/20260102_132145_174016_E8DD0099': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_132145_174016_E8DD0099 
X-CRM114-Status: GOOD (  21.56  )
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

On 1/2/26 14:54, Krzysztof Kozlowski wrote:
> On 02/01/2026 13:36, Vladimir Zapolskiy wrote:
>> On 1/2/26 11:58, Krzysztof Kozlowski wrote:
>>> On 02/01/2026 00:56, Vladimir Zapolskiy wrote:
>>>> Add NXP LPC32xx specific driver to get unique SoC ID from System Control
>>>> Block registers and export it to userspace.
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
>>>> ---
>>>>    drivers/soc/Kconfig           |   1 +
>>>>    drivers/soc/Makefile          |   1 +
>>>>    drivers/soc/nxp/Kconfig       |  16 +++++
>>>>    drivers/soc/nxp/Makefile      |   2 +
>>>>    drivers/soc/nxp/lpc32xx-soc.c | 114 ++++++++++++++++++++++++++++++++++
>>>>    5 files changed, 134 insertions(+)
>>>>    create mode 100644 drivers/soc/nxp/Kconfig
>>>>    create mode 100644 drivers/soc/nxp/Makefile
>>>>    create mode 100644 drivers/soc/nxp/lpc32xx-soc.c
>>>>
>>>> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
>>>> index a2d65adffb80..c21b0d2f58fc 100644
>>>> --- a/drivers/soc/Kconfig
>>>> +++ b/drivers/soc/Kconfig
>>>> @@ -18,6 +18,7 @@ source "drivers/soc/loongson/Kconfig"
>>>>    source "drivers/soc/mediatek/Kconfig"
>>>>    source "drivers/soc/microchip/Kconfig"
>>>>    source "drivers/soc/nuvoton/Kconfig"
>>>> +source "drivers/soc/nxp/Kconfig"
>>>>    source "drivers/soc/pxa/Kconfig"
>>>>    source "drivers/soc/qcom/Kconfig"
>>>>    source "drivers/soc/renesas/Kconfig"
>>>> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
>>>> index 47a3925ff84c..a04c21a8a5a4 100644
>>>> --- a/drivers/soc/Makefile
>>>> +++ b/drivers/soc/Makefile
>>>> @@ -24,6 +24,7 @@ obj-y				+= loongson/
>>>>    obj-y				+= mediatek/
>>>>    obj-y				+= microchip/
>>>>    obj-y				+= nuvoton/
>>>> +obj-y				+= nxp/
>>>>    obj-y				+= pxa/
>>>>    obj-y				+= qcom/
>>>>    obj-y				+= renesas/
>>>
>>> Missing maintainers entry.
>>>
>>>
>>>> +
>>>> +static int lpc32xx_soc_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct soc_device_attribute *soc_dev_attr;
>>>> +	struct device *dev = &pdev->dev;
>>>> +	struct soc_device *soc_dev;
>>>> +	struct regmap *scb;
>>>> +	u32 serial_id[4];
>>>> +	int ret;
>>>> +
>>>> +	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
>>>> +	if (!soc_dev_attr)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	soc_dev_attr->family = "NXP LPC32xx";
>>>> +
>>>> +	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	scb = syscon_regmap_lookup_by_compatible("nxp,lpc3220-scb");
>>>
>>> This is undocumented ABI.
>>
>> What is the expected level of documentation for syscon?
> 
> git grep nxp,lpc3220-scb
> 
> gives me 0 results.
> 
> Documentation is supposed to be in this patchset. If it is not, you have
> changelog part to explain dependencies and unusual things.

The documentation is under review, as a DT maintainer you are in To: list
and should have it in the mailbox, for anyone's convenience the dependency
is mentioned in the cover letter to this changeset also.

>>
>>> Anyway, you should look up devices via phandles.
>>>
>>
>> I may miss the context, was syscon_regmap_lookup_by_compatible() deprecated?
> 
> Not deprecated. It has its own purpose, so you can explain why here you
> cannot have phandle.
> 
> Without phandle you do not have proper device probe ordering and you do
> not properly express the dependency between hardware modules. Maybe this
> is not even real hardware, which you attach your driver to, so that's
> another thing to consider. Anyway, commit msg should explain all these.

Ack.

>>
>> Most of drivers/soc uses syscon_regmap_lookup_by_compatible() variant over
>> syscon_regmap_lookup_by_phandle(), and overall
> 
> They have their own reason.

Here the reason to use syscon by a compatible is the same reason as it's
among the sibling drivers, I'll specify it in the commit message, thanks.

FWIW there is no intention to convert the SCB register region into its
owm device.

>>
>> % git grep syscon_regmap_lookup_by_compatible v6.19-rc1 | wc -l
>> 105
>>

-- 
Best wishes,
Vladimir

