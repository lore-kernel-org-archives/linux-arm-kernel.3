Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F8AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+ktPkSgcUGUlkY81X04oFnn6Ho1f2nUx2ZGQe0I0/8=; b=poIog0/Lk8Rmx4QWhzoGniI6Zd
	oxMAOZH3OIBsHmkJ84KOoJoxgu8vdvg4Z5v1cjFcTpZyOkxQ63IviV0D098h0Yp7+qVrZGxFxMh37
	/VFR239FDXy+WFiQNp0lemxTXdWfYtHmFGze7W44XlXUrC3lk7VqmBQpjXwKU7lgttMuAtPitFpO2
	ziF8bB+QQrSEjzAWB3VGnTm+fmRfa40G7EGK1EZDBrSs4ZkFCt+zEjD8coiwI77CduAlam35qWsit
	H9EBo8WAwrbtTualr2j3gtCjEAuNU4SUv7PZC5/Gmno8fzHTJptq7dtmLOdhG8+SaRVdu8tYejHua
	cSKpl17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjy5-00000003uF5-2dPg;
	Mon, 10 Mar 2025 20:43:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjgC-00000003s0v-2KV8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 20:24:53 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so1040778f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 13:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741638291; x=1742243091; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6+ktPkSgcUGUlkY81X04oFnn6Ho1f2nUx2ZGQe0I0/8=;
        b=nE5OqLQJQr8j+CCT2gbdXNUPDJs/aHXPSnIYskFbYoBTF1KCJrtbfGLVcWjEBjaXZQ
         BgyTGk0zyYhlUWQSTU8dLMOzhipC690C6dT3XT2Bw7VifVY/39hwtO5o8XwLbDJWru8v
         EQijfG5OkpIBNCAFh7TF22h2YKIarx2z4abDWyMmliKZgAOM4ltUs9xKge1EbPZ2OrUd
         4A3H92xmzSZZTkCKkLAV/SEiFoAYkrYNhPVPOJ9qQgphdixF/eH2L/4FJ8ZJMUe0w+vZ
         yASqPJWyPKxk23KnVouRjCHYVYxZFg3ZVUbFF2/gW8rXQUN1VCsJVBbS/tlRKGPiq4oy
         /O1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741638291; x=1742243091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+ktPkSgcUGUlkY81X04oFnn6Ho1f2nUx2ZGQe0I0/8=;
        b=NZAKAlYQmbLueQAGU3dvEFXA37Msoh7+OF8CQ/XgQqogmw9/sdodqwgNI3IarmUGPP
         Ppd3ZiNlS+vuRKmmCfG8pizMb29QiBqbSeW5PUzwOIkZkqqyrFefTJdPEBFemQW+AiiI
         PMXjZdMQcaVZyBGeNRayE4i7NBsRe98fbcOlWb3cycpxGjGNgImiOBJubLrh2ESgGqW8
         iwMTHMp8u5BNkCY0sF3NCQIMFOFy2fjM6ZjkhME6Z75WxmezbVac1W9vlfP5y1TqH4um
         Jxg6/6uzXbxXpUMeBTT8TwEYhiqoc6isiDQVsR607JT6LAibUFRhhHyEz6WnEQHFgSGT
         H5tA==
X-Forwarded-Encrypted: i=1; AJvYcCV9vn79FF7U5QUINrK2QbEMge7ItJ7OiKMya7X4LJVqU83i8rfqv+Pp256Kf/dR55OTSkQ7/jMeYN1kR8mUDK8x@lists.infradead.org
X-Gm-Message-State: AOJu0YxNl79jobxTYxSTquev1mqNbB59oUko/mq9kG9GZMO825sP6l4+
	wYs3cxw3cZi/snPMQmSftI2WEr0xWi+N/Ie8tmwqqR6APoB+lS0f
X-Gm-Gg: ASbGncs5LyjXz/F3CP2L6uvTAzGEMzLHRJy70IrZKMw4GjuYyh3hkrFsqXQa0FpUFjE
	WSOHKTYG38gMKrnuCJMWKlQUdMd7Way1HVPO1yR5ZRmZFcNBkFtE4FMHxqTxaJefp5c27jms4bi
	+dUzsNom2BnYXcqD4QmHoMwVmHpL3oXYpkQSwKl5atSiTVgectIkRDaUR/fR0ehdCwCa41NHXeB
	UW85u3YxrIubM0zRhQ4beT3dOvr390vvqivfHpjnB+30+Fbpv0wgdLEdlkWpzUdlLM3s8Kl1C+k
	GBo/yctGi2vEVy+iF8ypq/Ry5BEQEZiHDXa6IsBXYCKWgFF/9lKo8T3LWpbFvtuBjuuh0wlESg=
	=
X-Google-Smtp-Source: AGHT+IHSzh7GZzsKQtSd3xfRZgUnU3VBKg01JBP3XWDNFJWhCbZmJMR+PhPG67a9gA+EwukcX+lhbg==
X-Received: by 2002:a05:6000:144d:b0:391:139f:61af with SMTP id ffacd0b85a97d-39132d8c768mr9284588f8f.32.1741638290675;
        Mon, 10 Mar 2025 13:24:50 -0700 (PDT)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdff72sm16179790f8f.36.2025.03.10.13.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 13:24:50 -0700 (PDT)
Message-ID: <ec38d41d-f2ce-4a98-bb02-d1ae9beb0b3b@gmail.com>
Date: Mon, 10 Mar 2025 22:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Frank Li <Frank.li@nxp.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
 <Z7jahtO3bxjkMfnc@lizhi-Precision-Tower-5810>
 <cd6a84cd-ff17-45df-becc-9bfc74522f73@gmail.com>
 <20250227-monumental-whale-of-security-b1c84e-mkl@pengutronix.de>
 <Z8CWsI/DKZtDBkzE@lizhi-Precision-Tower-5810>
 <20250228101952.g6tae3ni5xrhjk3y@pengutronix.de>
 <bfe3c719-f1c5-4ae5-9a40-45ad75cd5855@gmail.com>
 <20250307152236.3ayulbjqnu3vn7mf@pengutronix.de>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250307152236.3ayulbjqnu3vn7mf@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_132452_601470_B47A7ED2 
X-CRM114-Status: GOOD (  53.82  )
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



On 3/7/2025 5:22 PM, Marco Felsch wrote:
> On 25-03-04, Laurentiu Mihalcea wrote:
>> On 2/28/2025 12:19 PM, Marco Felsch wrote:
>>> Hi,
>>>
>>> On 25-02-27, Frank Li wrote:
>>>> On Thu, Feb 27, 2025 at 11:57:54AM +0100, Marc Kleine-Budde wrote:
>>>>> On 25.02.2025 16:14:34, Mihalcea Laurentiu wrote:
>>>>>> On 21.02.2025 21:56, Frank Li wrote:
>>>>>>> On Fri, Feb 21, 2025 at 02:19:08PM -0500, Laurentiu Mihalcea wrote:
>>>>>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>>>>>
>>>>>>>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>>>>>>>> configurations. Since these configurations need to be applied before
>>>>>>>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>>>>>>>> be their parent instead of keeping AIPS5 and adding a child node for
>>>>>>>> AIPSTZ5. Also, because of the security configurations, the address space
>>>>>>>> of the bus has to be changed to that of the configuration registers.
>>>>>>> The orginal 0x30c0_0000..0x31200000 include 0x30df0000, why not map only
>>>>>>> config address part in your drivers.
>>>>>>>
>>>>>>> Frank
>>>>>> Any concerns/anything wrong with current approach?
>>>>>>
>>>>>>
>>>>>> I find it a bit awkward to have the whole bus address space
>>>>>> in the DT given that we're only interested in using the access
>>>>>> controller register space.
>>>>>>
>>>>>>
>>>>>> I'm fine with the approach you suggested but I don't see a
>>>>>> reason for using it?
>>>>> Looking at the "AIPS5 Memory Map" (page 34/35 in i.MX 8M Plus
>>>>> Applications Processor Reference Manual, Rev. 3, 08/2024), the
>>>>> AIPS5_Configuration is part of the AIPS5 bus. IMHO the bus is something
>>>>> different than the bus configuration. Why not model it as part of the
>>>>> bus?
>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>>>>>>>> index e0d3b8cba221..a1d9b834d2da 100644
>>>>>>>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>>>>>>>> @@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
>>>>>>>>  			};
>>>>>>>>  		};
>>>>>>>>
>>>>>>>> -		aips5: bus@30c00000 {
>>>>>>>> -			compatible = "fsl,aips-bus", "simple-bus";
>>>>>>>> -			reg = <0x30c00000 0x400000>;
>>>>>>>> +		aips5: bus@30df0000 {
>>>>>                        ^^^^^^^^^^^^
>>>>>>>> +			compatible = "fsl,imx8mp-aipstz", "simple-bus";
>>>>>>>> +			reg = <0x30df0000 0x10000>;
>>>>>>>> +			power-domains = <&pgc_audio>;
>>>>>>>>  			#address-cells = <1>;
>>>>>>>>  			#size-cells = <1>;
>>>>>>>> +			#access-controller-cells = <0>;
>>>>>>>>  			ranges;
>>>>>>>>
>>>>>>>>  			spba-bus@30c00000 {
>>>>>                         ^^^^^^^^^^^^^^^^^
>>>>>
>>>>> This looks very strange: The aips5 bus starts at 0x30df0000 and has a
>>>>> child bus starting at 0x30c00000?
>>>> @30df0000 should match controller reg's address.
>>>>
>>>> subnode address 0x30c00000,  should be descript in "ranges", which 1:1 map.
>>>>
>>>> So it should be reasonable. another example:
>>>> i2c@1000 {
>>>>
>>>> 	device@1c <- which use difference address space.
>>>> }
>>>>
>>>> The similar case also happen at pcie.
>>> I'm not really convinced that pcie and i2c are good examples here. I2C
>>> does have an other addressing scheme by nature and the hotplug-able pcie
>>> is dependeds on the pcie device memory map of course.
>>>
>>> Here we're talking about an access control IP core on a bus which is
>>> static.
>>>
>>> But.. it looks like from DT abstraction it's fine because STM did
>>> something similiar with their st,stm32mp25-rifsc or st,stm32-etzpc
>>> albeit it does look strange and I don't know why we have to limit the
>>> address space since it was already mapped but used by the fsl,aips-bus
>>> driver.
>>>
>>> Regards,
>>>   Marco
>> The address space of the bridge was changed to that of the bridge's
>> configuration space because I think it's very awkward from the
>> software's point of view to have to hardcode the offset and size of
>> the configuration space inside the driver. 
> You mean the access-controller IP core. I could also arguee that it's
> akward to put the bridge access-controller IP core into the middle of
> the bridge address-space instead of placing it at the very beginning of
> the bridge. But this doesn't help here :)
>
> I see what you mean but from DT abstraction POV it seems more reasonable
> to keep it as it is and just adapt the compatible. The current driver
> maps the whole address space too, so I don't see why we need to change
> it if we change it to the aipstz driver. If you see the
> access-controller IP core as part of the bus I don't see any problem and
> would argue that the offset detail needs to be handled within the
> driver.
>
>> I also looked at what STM did with "st,stm32-etzpc" so I thought this
>> would be acceptable from the DT's POV.
>>
>> Regarding why I chose not to model the access controller part as a subnode of the
>> bus:
>>
>>     1) The access controller is part of the bridge itself (not a separate module accessible
>>     via the bridge like it's the case for its children) so I think the current approach
>>     should also make sense if we take the hardware into consideration.
> I don't like this approach if you see the controller as part of the
> bridge because the offset could be handled within the bridge driver.
> I also that the register offset needs to be supplied else we can't reuse
> the driver and we don't want to adapt the driver for each SoC.
>
> What came into my mind is the following:
>
> 	spba-bus@30c00000 {
> 		compatible = "nxp,imx8mp-aiptz-bus", "nxp,aiptz-bus";
> 		reg = <0x30c00000 0x400000>, <0x30df0000 0x10000>;
> 		reg-names = "bus", "aipstz";
>
> 		child-nodes {};
> 		child-nodes {};
> 		child-nodes {};
> 	}
>
> This way we can abstract the access-controller register space and the
> whole bus register space and a generic driver could be written just by
> making use two reg fields.


by changing the compatible, we've also effectively changed the programming model.
I don't really see why we need to stick to the old way of configuring the bus node (i.e:
specify the whole address space of the bus as well) when all we really care about is the AC
configuration region?
 
anyhow, I'm not going to insist on this. I think the proposed approach will work just
fine. If there's no other comments on this then I'll just switch to it in V3.


>
>>     2) The access controller configuration also impacts the AP. As such, we needed a way to
>>     enforce a dependency between the children of the aips5 bus and the access controller
>>     (we could have used the 'access-controllers' property like we did with the DSP but having
>>     to do that for all children of the bus is not ideal I'd say.
>>
>> Of course, argument no. 2 is somewhat brittle in the context of i.MX8MP as the reset
>> values of the AC's registers already allow the AP to access said peripherals. Despite this,
>> I think the current approach would be more scalable given that the IP offers some more
>> configuration bits which we might want to toggle. For that to work, we need to make sure
>> the bits are toggled before the AP accesses the peripherals on the bridge.
> Please have a look on my suggestion above.
>
> Regards,
>   Marco
>
>> Note that we don't do this for aips1-aips4 because it's really not needed. If I'm not mistaken,
>> they're not really attached to a PD so we don't need to re-configure them each time the domain
>> is power cycled (which is why we can just do it once from ATF during the boot process)


