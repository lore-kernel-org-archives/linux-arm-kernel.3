Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD42EC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 21:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/tMkvN6yvwHE2QTWEKKIVuddIKi5dDYup2sb8dNBzk=; b=1VO9pv9F5qxUOPvRB8zQ2UzaBy
	paI9SjigR7CJQXmmnuWqX500FVfnDsjBvLd9pLeANygygokauDJlqJdqFc7dNcmdjDVSbCATHuA2t
	VdbT2IGD6m8dcza7qnntTbbvbWic14lGUs6DKpopfxzQ/McfjYo8uu1w8XjpjcjVTMC6RYIxki97H
	B/2ZNwmCXfWgVoZZKcDilPGqDWLafP3ZwllMgCDqpVEFuah30olitJIqwCxjjwEkLV9hqXTCu3vVO
	zwoWlgUBICrlNizkjSX3vEyCRFx1lyPU5aJXKDXRHT6hOymLydmZ2dz8csCvbmpBvKQQoRpD2r35W
	4Ms0XC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRUa-00000008ggD-0erK;
	Tue, 18 Aug 2026 21:37:08 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRUW-00000008gew-3Iul
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 21:37:06 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F183A7A00B3;
	Tue, 18 Aug 2026 17:37:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 18 Aug 2026 17:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polyxeno.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1787089020;
	 x=1787175420; bh=l/tMkvN6yvwHE2QTWEKKIVuddIKi5dDYup2sb8dNBzk=; b=
	qZw4v4CzNhuG9aQE2KZMVwrWmFR7K4loTKkXALye18OMXF0o6ZtS0ZbWbpqlMD0/
	KivkTi4WSRv5X8i+rH2y2AiBkj7NloktfktZNTGY2uL1J9ZgIyH5P16ZXl1hOgVG
	TzHCnvk1ohmMtJNDDlHe6sf5R/mzxh9WbvlDqKgr8T6m0UYJboKaclCJPWiXLEYh
	TTef5k6hf/mCZxve9RpZephUfqZxB52nqNaAHQkcGh9WCI2wR4FEcylPYEBb0rf8
	+dqqNNB013fy2Nw/Rspn0aDxH4U0QBMtyXsEtcv6s3mFZ2hFwbWygm45wdLGC0ia
	39k0gd58hjjlgj/cV1WQuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787089020; x=
	1787175420; bh=l/tMkvN6yvwHE2QTWEKKIVuddIKi5dDYup2sb8dNBzk=; b=N
	p2bRxdaAmKefOnA9YfTS3mFEgbVHvNyx6oslv/7JV9vA9MdI3GKO7Z0P+bhPmZzQ
	saBvtznafR01rVUsQP2uONYFRU4PAwCbkWafVcekiNziYUGQk5jZTuur80frat8d
	kjRl7xYJ9UfYsvQdz7fxbEqUmpA2Qk10uCL1R52OyuyuWR+N7+H+Gg6jnlDvJcAs
	8c/Ow/ORSRN5Xl1hG1lvas+6hUhwywqSfOJNawA/wkE/edXy5oLpgQSABql66Drm
	qQK066OcLSOsjCxbrmHT3EJ9aoJ55vgLgB3rsjgJBwLfODrQzt0xe3ua/IPgN7iR
	atcCpWP+wbC4TiCY2L/5w==
X-ME-Sender: <xms:etCEaotT1aovXzZXy7QxH0kuhCflEmFPk_wC3VxcnDbGvvHlT9kbQQ>
    <xme:etCEaj-yjdPrAt_eQJB_4gMgmHDyFCJRpBwfDn-3Iz4PRI8BhGymnubBNdUAaDJhA
    no0Ry6NBpsiW9u7tKOl19i6T98S8ncn-aApHNCvcFDNGegW1K7dyw>
X-ME-Received: <xmr:etCEaqmaicvK_TnAUIv5i3WWklJVnfh2upJC5LNGFZ_9g9-QrpDsDA9nGK_ViIbeSlDUArmimNPfgpLzeE5t9j2DuqWXZZqNkZcYrz1mOe1p>
X-ME-Proxy-Cause: dmFkZTEdIvDk2+6VBMxWbgXOLhivV0vSt3B+3VVbmDknCJxXGGrIXEqjiv7QIGeSzlMCD+
    MuiccZwlHt0By7V7gEx2kEgzLctWpRFW4bXDUBC9+Ua/obVyWlIDF4MBIdZgZtNkCUDUeD
    QeOHqlp8jv3NRBxcDfVDUh50uc4UC/kfFala6dm2m+sxNTFWZ49tNsjOEt8kqo8w/6BWxF
    AcBptFGNxeVjIA+zqvQLIEUwxnzhjDVNWnx3JYu3TpsjB/Aa+DaXDqQqvtxyf7SnbLvH+6
    S1a2m8t59d/Tpe0dwK5C1HNRrLMvfIczhjMc+pnmwEsVEFaPmZtpS1CKlM3Y2Gl8jWARLF
    9m+awC7AZJX8ntrD/IL8spvBw5/ok+egHbeTe+a4RKUaDkiwFrCD/faU9DXyKjFUIt0JGL
    5g4xp4xgdOn9NSjbFEd3Iyz2L6ciNH7pJyrfnRMSxBR7VnuyiA92/QG7/hytPh04G+ZiTC
    JDCaB3BCvTR9kx0o8vhglP9sA8vcYvdVRyIP+TPDVuirNETfnWAQVEzuVm3J1mvglxSukm
    6G8d5/Kq1tXZ/+hLoFhcVTwFkFni5vPsby5ePXHdmmbMNySwl7CjkVd2VPGTZT6gwov9lE
    FLr0Li1bd+G+u0n6QJxakoWq701TwcaLLANsDfwIJLtDCsTqil6nXfrDJHLA
X-ME-Proxy: <xmx:etCEarP7vD0gyaMA2qLtAAlBPMmk4v37rmbWPkjrQGBG41ZPwOEcsw>
    <xmx:etCEahI7nSYpiRnQZdcXD22YyU80d_eMegImuDawuqrkJ-nwKnXfIQ>
    <xmx:etCEauHQ1ADcgIMOUKLpl1QqWIaV7Z6O5a5We2dLZF7tjnU-3rgSbg>
    <xmx:etCEaqAbYBr5pW6_15hx3a0zIv_wxyLpZ8bv6Eo3QQWdVsO78LYyDg>
    <xmx:fNCEahTA1Aru-v0mlZ9OIc735JxK7tT6adCp_i3fM0ByUThs8zxibGHL>
Feedback-ID: i09fe4b60:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Aug 2026 17:36:44 -0400 (EDT)
Message-ID: <9ba1ebd8-61cc-4e1a-b68d-906b20dd4999@polyxeno.com>
Date: Wed, 19 Aug 2026 07:36:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] m68k: coldfire: Add RNG support for MCF54418
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-2-5309548c9555@yoseli.org>
 <bd25e903-30fc-4905-986c-96d1b42e9f02@linux-m68k.org>
 <ddf0ab32-5b66-453e-b7aa-1722aeaf2aa0@yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@polyxeno.com>
In-Reply-To: <ddf0ab32-5b66-453e-b7aa-1722aeaf2aa0@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_143705_165761_B0F97286 
X-CRM114-Status: GOOD (  25.44  )
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

Hi JM,

On 19/8/26 01:09, Jean-Michel Hautbois wrote:
> Hi Greg,
> 
> Sorry for the very long silence on this one, it fell off my radar...
> 
> Le 03/12/2025 à 13:15, Greg Ungerer a écrit :
>> Hi Jean-Michel,
>>
>> On 26/11/25 17:08, Jean-Michel Hautbois via B4 Relay wrote:
>>> From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>>>
>>> Add support for the hardware Random Number Generator (RNGB) found on
>>> MCF54418 ColdFire processors with clock enabled at platform
>>> initialization.
>>>
>>> The RNGB block is compatible with the imx-rngc driver.
>>>
>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>>> ---
>>>   arch/m68k/coldfire/device.c       | 28 ++++++++++++++++++++++++++++
>>>   arch/m68k/coldfire/m5441x.c       |  2 +-
>>>   arch/m68k/include/asm/m5441xsim.h |  9 +++++++++
>>>   drivers/char/hw_random/Kconfig    |  3 ++-
>>>   drivers/char/hw_random/imx-rngc.c |  7 +++++++
>>>   5 files changed, 47 insertions(+), 2 deletions(-)
>>
>> I am happy with the ColdFire arch parts, so from me:
>>
>>      Acked-by: Greg Ungerer <gerg@linux-m68k.org>
>>
>> I don't mind taking this commit via the m68knommu git tree if the hw_rng
>> maintainers are ok with that. Otherwise if you break out the arch/m68k
>> parts I can apply those on their own.
> 
> I think Herbert acked ?
> Do you need another ack ?

I would like to see an acknowledgement that taking this patch via the
m68knommu git tree (to Linus) is ok with the RNG maintainers.

Regards
Greg



> Thanks !
> JM
> 
>> Regards
>> Greg
>>
>>
>>
>>> diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
>>> index b6958ec2a220..9d8f844e319a 100644
>>> --- a/arch/m68k/coldfire/device.c
>>> +++ b/arch/m68k/coldfire/device.c
>>> @@ -622,6 +622,31 @@ static struct platform_device mcf_flexcan0 = {
>>>   };
>>>   #endif /* MCFFLEXCAN_SIZE */
>>> +#ifdef MCF_RNG_BASE
>>> +/*
>>> + * Random Number Generator (RNG) - only on MCF54418
>>> + */
>>> +static struct resource mcf_rng_resource[] = {
>>> +    {
>>> +        .start = MCF_RNG_BASE,
>>> +        .end   = MCF_RNG_BASE + MCF_RNG_SIZE - 1,
>>> +        .flags = IORESOURCE_MEM,
>>> +    },
>>> +    {
>>> +        .start = MCF_IRQ_RNG,
>>> +        .end   = MCF_IRQ_RNG,
>>> +        .flags = IORESOURCE_IRQ,
>>> +    },
>>> +};
>>> +
>>> +static struct platform_device mcf_rng = {
>>> +    .name           = "imx-rngc",
>>> +    .id             = -1,
>>> +    .num_resources  = ARRAY_SIZE(mcf_rng_resource),
>>> +    .resource       = mcf_rng_resource,
>>> +};
>>> +#endif /* MCF_RNG_BASE */
>>> +
>>>   static struct platform_device *mcf_devices[] __initdata = {
>>>       &mcf_uart,
>>>   #ifdef MCFFEC_BASE0
>>> @@ -660,6 +685,9 @@ static struct platform_device *mcf_devices[] 
>>> __initdata = {
>>>   #ifdef MCFFLEXCAN_SIZE
>>>       &mcf_flexcan0,
>>>   #endif
>>> +#ifdef MCF_RNG_BASE
>>> +    &mcf_rng,
>>> +#endif
>>>   };
>>>   /*
>>> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
>>> index 7a25cfc7ac07..ab5b00637237 100644
>>> --- a/arch/m68k/coldfire/m5441x.c
>>> +++ b/arch/m68k/coldfire/m5441x.c
>>> @@ -158,6 +158,7 @@ static struct clk * const enable_clks[] 
>>> __initconst = {
>>>       &__clk_0_33, /* pit.1 */
>>>       &__clk_0_37, /* eport */
>>>       &__clk_0_48, /* pll */
>>> +    &__clk_0_49, /* rng */
>>>       &__clk_0_51, /* esdhc */
>>>       &__clk_1_36, /* CCM/reset module/Power management */
>>> @@ -179,7 +180,6 @@ static struct clk * const disable_clks[] 
>>> __initconst = {
>>>       &__clk_0_44, /* usb otg */
>>>       &__clk_0_45, /* usb host */
>>>       &__clk_0_47, /* ssi.0 */
>>> -    &__clk_0_49, /* rng */
>>>       &__clk_0_50, /* ssi.1 */
>>>       &__clk_0_53, /* enet-fec */
>>>       &__clk_0_54, /* enet-fec */
>>> diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/ 
>>> asm/m5441xsim.h
>>> index f48cf63bd782..dd64cdfcad3e 100644
>>> --- a/arch/m68k/include/asm/m5441xsim.h
>>> +++ b/arch/m68k/include/asm/m5441xsim.h
>>> @@ -198,6 +198,15 @@
>>>   #define MCFRTC_SIZE        (0xfc0a8840 - 0xfc0a8000)
>>>   #define MCF_IRQ_RTC        (MCFINT2_VECBASE + MCFINT2_RTC)
>>> +/*
>>> + *  Random Number Generator (RNG) Module.
>>> + *  Note: Only present in MCF54418, not in MCF54410/54415/54417
>>> + */
>>> +#define MCF_RNG_BASE        0xfc0c4000
>>> +#define MCF_RNG_SIZE        0x1c
>>> +#define MCFINT2_RNG        28
>>> +#define MCF_IRQ_RNG        (MCFINT2_VECBASE + MCFINT2_RNG)
>>> +
>>>   /*
>>>    *  GPIO Module.
>>>    */
>>> diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/ 
>>> Kconfig
>>> index 492a2a61a65b..2f301e43db84 100644
>>> --- a/drivers/char/hw_random/Kconfig
>>> +++ b/drivers/char/hw_random/Kconfig
>>> @@ -270,12 +270,13 @@ config HW_RANDOM_MXC_RNGA
>>>   config HW_RANDOM_IMX_RNGC
>>>       tristate "Freescale i.MX RNGC Random Number Generator"
>>>       depends on HAS_IOMEM
>>> -    depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL 
>>> || COMPILE_TEST
>>> +    depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL 
>>> || COLDFIRE || COMPILE_TEST
>>>       default HW_RANDOM
>>>       help
>>>         This driver provides kernel-side support for the Random Number
>>>         Generator Version C hardware found on some Freescale i.MX
>>>         processors. Version B is also supported by this driver.
>>> +      Also supports RNGB on Freescale MCF54418 (Coldfire V4e).
>>>         To compile this driver as a module, choose M here: the
>>>         module will be called imx-rngc.
>>> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/ 
>>> hw_random/imx-rngc.c
>>> index d6a847e48339..44f20a05de0a 100644
>>> --- a/drivers/char/hw_random/imx-rngc.c
>>> +++ b/drivers/char/hw_random/imx-rngc.c
>>> @@ -353,12 +353,19 @@ static const struct of_device_id 
>>> imx_rngc_dt_ids[] = {
>>>   };
>>>   MODULE_DEVICE_TABLE(of, imx_rngc_dt_ids);
>>> +static const struct platform_device_id imx_rngc_devtype[] = {
>>> +    { .name = "imx-rngc" },
>>> +    { /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(platform, imx_rngc_devtype);
>>> +
>>>   static struct platform_driver imx_rngc_driver = {
>>>       .driver = {
>>>           .name = KBUILD_MODNAME,
>>>           .pm = pm_ptr(&imx_rngc_pm_ops),
>>>           .of_match_table = imx_rngc_dt_ids,
>>>       },
>>> +    .id_table = imx_rngc_devtype,
>>>   };
>>>   module_platform_driver_probe(imx_rngc_driver, imx_rngc_probe);
>>>
>>
> 


