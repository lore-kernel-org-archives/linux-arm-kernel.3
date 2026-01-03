Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9110FA3750
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ml3RHk6kRBT37njG0R4eb6uztrcNodBSVGrEuOrbQWA=; b=EkByuuwrNhGQnmpBjOnsNFb+nN
	2XO8bbrqaVcmuUO8ojbbBil9pahNAyFbKI3WE2SuA4I4hLzqSNCNk76k/8a44T/3F6rd1QgE1kfEk
	2CLdbpie2srtlotsnT8gmje198xscKltn10oDNBJH39lnoMPAduTV+roayr6h5V6MQNrBzLIRWiWa
	qcvDcOEXy55YBW44Y1/2AkNiy47kVxpiu4vd/6pDvMZ5Jk6K5aCXbIvw2QhiwwMbbbMyFBChFo65K
	lF27BogbnnMnySY6Djm3xjy5+WgACKQ7HkEPWEruh0/JfwYfSE1L9M5mYMwNa9hEDlerIr1Z1SyOo
	gPvOzWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc0yn-00000009MQy-3iWc;
	Sat, 03 Jan 2026 12:43:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc0yl-00000009MQW-1C8d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 12:43:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B1BA40BCE;
	Sat,  3 Jan 2026 12:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1232C113D0;
	Sat,  3 Jan 2026 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767444211;
	bh=WKzSagjUrc1Ok9kQYkkRHAtz/xqko+E580OAxbZPQhk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qMJMLvmV85nrOxG9pg5sUOmzinCv9jmhQgDVANjnNOCriiWl0b1cbW2AD7DsAsud0
	 Oucmok9Q0MJXnzBIWow2eyDl0lokatkEQmR8yInw6zPQDV+yfoTECkzQeLdHWweb3a
	 yHqVJYHZUircK0kMpLCbzXDxazelsWVai+f+4hjDmWSzQ3S2Mf9PWOYjmX/CXtxQN6
	 t6vB4GPz0nn87X/5LRdb2eW/eDdxSLjxUrfqxMpz6WUdvPGQj7GITLlQIEpUJggwR5
	 V0PyDtNUb6bUoA3tbNLS9JPnvVnXeVJf4yADtHV/HsXo9d4waCj/WX6rbLD7Zbf5YC
	 VEyJk03Zs4OIg==
Message-ID: <a77325ae-fc53-4554-a7d8-3bdd841e1065@kernel.org>
Date: Sat, 3 Jan 2026 13:43:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: nxp: Add a simple NXP LPC32xx socinfo driver
To: Vladimir Zapolskiy <vz@mleia.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260101235647.2411062-1-vz@mleia.com>
 <20260101235647.2411062-3-vz@mleia.com>
 <accb4ab1-07fa-4e33-a74c-2c588ca415ac@kernel.org>
 <eb9ef21a-c0b4-4c8d-b1b1-6c76f45c53aa@mleia.com>
 <1eef3c49-83a7-48d4-96ad-ffb71df2be7a@kernel.org>
 <1a336af6-6c27-4211-9c8c-ede4d091eb17@mleia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1a336af6-6c27-4211-9c8c-ede4d091eb17@mleia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_044335_379791_9DBD7EA3 
X-CRM114-Status: GOOD (  15.71  )
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

On 02/01/2026 14:21, Vladimir Zapolskiy wrote:
> On 1/2/26 14:54, Krzysztof Kozlowski wrote:
>> On 02/01/2026 13:36, Vladimir Zapolskiy wrote:
>>> On 1/2/26 11:58, Krzysztof Kozlowski wrote:
>>>> On 02/01/2026 00:56, Vladimir Zapolskiy wrote:
>>>>> Add NXP LPC32xx specific driver to get unique SoC ID from System Control
>>>>> Block registers and export it to userspace.
>>>>>
>>>>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
>>>>> ---
>>>>>    drivers/soc/Kconfig           |   1 +
>>>>>    drivers/soc/Makefile          |   1 +
>>>>>    drivers/soc/nxp/Kconfig       |  16 +++++
>>>>>    drivers/soc/nxp/Makefile      |   2 +
>>>>>    drivers/soc/nxp/lpc32xx-soc.c | 114 ++++++++++++++++++++++++++++++++++
>>>>>    5 files changed, 134 insertions(+)
>>>>>    create mode 100644 drivers/soc/nxp/Kconfig
>>>>>    create mode 100644 drivers/soc/nxp/Makefile
>>>>>    create mode 100644 drivers/soc/nxp/lpc32xx-soc.c
>>>>>
>>>>> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
>>>>> index a2d65adffb80..c21b0d2f58fc 100644
>>>>> --- a/drivers/soc/Kconfig
>>>>> +++ b/drivers/soc/Kconfig
>>>>> @@ -18,6 +18,7 @@ source "drivers/soc/loongson/Kconfig"
>>>>>    source "drivers/soc/mediatek/Kconfig"
>>>>>    source "drivers/soc/microchip/Kconfig"
>>>>>    source "drivers/soc/nuvoton/Kconfig"
>>>>> +source "drivers/soc/nxp/Kconfig"
>>>>>    source "drivers/soc/pxa/Kconfig"
>>>>>    source "drivers/soc/qcom/Kconfig"
>>>>>    source "drivers/soc/renesas/Kconfig"
>>>>> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
>>>>> index 47a3925ff84c..a04c21a8a5a4 100644
>>>>> --- a/drivers/soc/Makefile
>>>>> +++ b/drivers/soc/Makefile
>>>>> @@ -24,6 +24,7 @@ obj-y				+= loongson/
>>>>>    obj-y				+= mediatek/
>>>>>    obj-y				+= microchip/
>>>>>    obj-y				+= nuvoton/
>>>>> +obj-y				+= nxp/
>>>>>    obj-y				+= pxa/
>>>>>    obj-y				+= qcom/
>>>>>    obj-y				+= renesas/
>>>>
>>>> Missing maintainers entry.
>>>>
>>>>
>>>>> +
>>>>> +static int lpc32xx_soc_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +	struct soc_device_attribute *soc_dev_attr;
>>>>> +	struct device *dev = &pdev->dev;
>>>>> +	struct soc_device *soc_dev;
>>>>> +	struct regmap *scb;
>>>>> +	u32 serial_id[4];
>>>>> +	int ret;
>>>>> +
>>>>> +	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
>>>>> +	if (!soc_dev_attr)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	soc_dev_attr->family = "NXP LPC32xx";
>>>>> +
>>>>> +	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	scb = syscon_regmap_lookup_by_compatible("nxp,lpc3220-scb");
>>>>
>>>> This is undocumented ABI.
>>>
>>> What is the expected level of documentation for syscon?
>>
>> git grep nxp,lpc3220-scb
>>
>> gives me 0 results.
>>
>> Documentation is supposed to be in this patchset. If it is not, you have
>> changelog part to explain dependencies and unusual things.
> 
> The documentation is under review, as a DT maintainer you are in To: list
> and should have it in the mailbox, for anyone's convenience the dependency
> is mentioned in the cover letter to this changeset also.


There is nothing about dependency and nothing about binding in the cover
letter, so no - this is not explained nowhere and must have been explained.

Best regards,
Krzysztof

