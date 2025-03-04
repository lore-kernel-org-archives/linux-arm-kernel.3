Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95273C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKFVl5Wcef8C2g2vOUYpWd1OHCoI6tR79rGAxjSDkuk=; b=N4f9TbZ8sCw6wR8hdPp1SNtsnU
	a0aMxEtL2/a8l6DbKb/KMaKii9hO1n29H6IQj/2zdHfSDkvhnIbe1Y/mmrWqVkJyk8gBIUZ5dVuJb
	ExulVkSj1dMzyBelA+MZG4ngtCbh+R59GGFfHz5X9WEWKmGFou7dqxeWUHKsIChZiY5CyeM+1uLkj
	Gg+rgoz3L3uItzgkDESfQ20InZmXsM+mnkDB1sqJ8FjPbBHJozr/nApXF7C64QcFoEtpSZAki7snh
	UQr9rc535CaBQh1vmK/5b62n4ik/rjw/B8yOV6umPddKRak0cGyQpKawLOudlLF8wrLL34+y0DEu2
	WUXKCJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWEN-00000005feV-3xdJ;
	Tue, 04 Mar 2025 17:38:59 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUsD-00000005Myz-1p4Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:12:02 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3911748893aso683581f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 08:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741104720; x=1741709520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKFVl5Wcef8C2g2vOUYpWd1OHCoI6tR79rGAxjSDkuk=;
        b=aagRV1TG2ZUwQSc/fBAzO6343rxfNedPlCgBbQlqg1FjyJuD0JQhA4HJ5VxAZjHjFa
         dzW/bKPTsLygzJg7Cy53In6qMu42tCKN348naR6+6UGhWKmYii8mKEwhWuBu9wmbS7FF
         pGDgyGUr7Ni1ojoTzJq7b3FIBrtVRqkwhx0yfeusfCDhtrDyMDJwjulg7B8IGp3ATwG+
         l62D4IW2tp+lpBjyqisBBEUoNJK32e7ZbQlif5npIp9V4ikq9vjDn2MVGzUtvbZ15+1l
         6RVh1Z4dlcM5mqGPi/NyZa2hoagI4l6p869RoFR0DvervmH9MiWvzBeGIQLO5ze6i3KE
         MmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741104720; x=1741709520;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKFVl5Wcef8C2g2vOUYpWd1OHCoI6tR79rGAxjSDkuk=;
        b=JMLJ7yTJ9LIa7aitrr6VIpB721q4OdMduGhidY6MNS6oMlUUU/yMZV0INRVn/P1dWP
         +ek19GDnefrq1UL+2tuzyGxqXqgoWZfhimqknMygX80o8hW5IqBElTEjpsMiet9KLlGd
         NjBlQC8iC8/iejlJX+0byeMaTeDkjjHAS1cfcUSiIknkRbvzV+2rb3U90Vpym9ZMTkcm
         xyqKqUS8copkHQcPiYwoyB+dkwDEm/8/WkAfPVO1VeckzsPyVxWFIAmc3GiQR3RLMLTi
         PSbf/zNQN1IYRrUTvYUyB0xe2Q3TASZL+aa6lkJM9oFyoXI7rEe2uY7dk27/JjWn54Vw
         QE9w==
X-Forwarded-Encrypted: i=1; AJvYcCWLAZq3dBrpiAYbyrVl35VGI5hxGtDWQkVk4k9KUgjlAbd/GCKx/80rYbG1ymh9dUBr4Dqj3fwe0Pv1GUWPPQNB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk5yXw8l52gltdOdz/qy7Fbjpl2NtGHBpZcN8FVs9wUXKLQDv2
	RnlzeYThGLOJ3OIcyRtsHFBwjL8BfEpuL4KZ1cofYo3dnM+wmL3L
X-Gm-Gg: ASbGncvTmSeMpwpBL6ZBtuoZ/2Ig1yrphjJtf4tAP6jil7Je0LEVmXMfA5kZUsRDDC3
	x4Bb3tM9kmiJ81M7IIiaZflUeEFPCwb2Tr93hzshFdHPbhCJCXcB0dYd7shSPzXoHf8c3/M/yyH
	lmQhWSwmP3Ako+FFOtbSUyqloib5zAkWONGKraM3/oguMjQOt/6B+hyRfNReNNAmRYSH6r5Qmbu
	pYHnx11DMJkCWgXOP+KWT3PDQ2g+j4tc8wtPNTqVbj1IgTIff4gCQfbH3Ra6vltDUTL5gn0duuz
	QpHfL4BiTxjZdmyr/HfCY1oTbCN50m2Q4FOXYhzw6umHfJxzD/JeLz2EV9WHYofZk/IkWz1mrw=
	=
X-Google-Smtp-Source: AGHT+IECucg6TxRY/3+YaDVr6S0Oivym8EfoWcFrWoYt/S7uuLYkulzezOXsbiAvNlHj/uTIVPGYjg==
X-Received: by 2002:a05:6000:1a88:b0:391:139f:61c2 with SMTP id ffacd0b85a97d-391139f6478mr5227327f8f.31.1741104719480;
        Tue, 04 Mar 2025 08:11:59 -0800 (PST)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e479609asm17853950f8f.2.2025.03.04.08.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:11:59 -0800 (PST)
Message-ID: <bfe3c719-f1c5-4ae5-9a40-45ad75cd5855@gmail.com>
Date: Tue, 4 Mar 2025 18:11:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.li@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
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
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250228101952.g6tae3ni5xrhjk3y@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_081201_473332_1A914489 
X-CRM114-Status: GOOD (  36.33  )
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



On 2/28/2025 12:19 PM, Marco Felsch wrote:
> Hi,
>
> On 25-02-27, Frank Li wrote:
>> On Thu, Feb 27, 2025 at 11:57:54AM +0100, Marc Kleine-Budde wrote:
>>> On 25.02.2025 16:14:34, Mihalcea Laurentiu wrote:
>>>> On 21.02.2025 21:56, Frank Li wrote:
>>>>> On Fri, Feb 21, 2025 at 02:19:08PM -0500, Laurentiu Mihalcea wrote:
>>>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>>>
>>>>>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>>>>>> configurations. Since these configurations need to be applied before
>>>>>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>>>>>> be their parent instead of keeping AIPS5 and adding a child node for
>>>>>> AIPSTZ5. Also, because of the security configurations, the address space
>>>>>> of the bus has to be changed to that of the configuration registers.
>>>>> The orginal 0x30c0_0000..0x31200000 include 0x30df0000, why not map only
>>>>> config address part in your drivers.
>>>>>
>>>>> Frank
>>>> Any concerns/anything wrong with current approach?
>>>>
>>>>
>>>> I find it a bit awkward to have the whole bus address space
>>>> in the DT given that we're only interested in using the access
>>>> controller register space.
>>>>
>>>>
>>>> I'm fine with the approach you suggested but I don't see a
>>>> reason for using it?
>>> Looking at the "AIPS5 Memory Map" (page 34/35 in i.MX 8M Plus
>>> Applications Processor Reference Manual, Rev. 3, 08/2024), the
>>> AIPS5_Configuration is part of the AIPS5 bus. IMHO the bus is something
>>> different than the bus configuration. Why not model it as part of the
>>> bus?
>>>
>>>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>>>>>> index e0d3b8cba221..a1d9b834d2da 100644
>>>>>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>>>>>> @@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
>>>>>>  			};
>>>>>>  		};
>>>>>>
>>>>>> -		aips5: bus@30c00000 {
>>>>>> -			compatible = "fsl,aips-bus", "simple-bus";
>>>>>> -			reg = <0x30c00000 0x400000>;
>>>>>> +		aips5: bus@30df0000 {
>>>                        ^^^^^^^^^^^^
>>>>>> +			compatible = "fsl,imx8mp-aipstz", "simple-bus";
>>>>>> +			reg = <0x30df0000 0x10000>;
>>>>>> +			power-domains = <&pgc_audio>;
>>>>>>  			#address-cells = <1>;
>>>>>>  			#size-cells = <1>;
>>>>>> +			#access-controller-cells = <0>;
>>>>>>  			ranges;
>>>>>>
>>>>>>  			spba-bus@30c00000 {
>>>                         ^^^^^^^^^^^^^^^^^
>>>
>>> This looks very strange: The aips5 bus starts at 0x30df0000 and has a
>>> child bus starting at 0x30c00000?
>> @30df0000 should match controller reg's address.
>>
>> subnode address 0x30c00000,  should be descript in "ranges", which 1:1 map.
>>
>> So it should be reasonable. another example:
>> i2c@1000 {
>>
>> 	device@1c <- which use difference address space.
>> }
>>
>> The similar case also happen at pcie.
> I'm not really convinced that pcie and i2c are good examples here. I2C
> does have an other addressing scheme by nature and the hotplug-able pcie
> is dependeds on the pcie device memory map of course.
>
> Here we're talking about an access control IP core on a bus which is
> static.
>
> But.. it looks like from DT abstraction it's fine because STM did
> something similiar with their st,stm32mp25-rifsc or st,stm32-etzpc
> albeit it does look strange and I don't know why we have to limit the
> address space since it was already mapped but used by the fsl,aips-bus
> driver.
>
> Regards,
>   Marco

The address space of the bridge was changed to that of the bridge's configuration
space because I think it's very awkward from the software's point of view to have
to hardcode the offset and size of the configuration space inside the driver. I also
looked at what STM did with "st,stm32-etzpc" so I thought this would be acceptable
from the DT's POV.

Regarding why I chose not to model the access controller part as a subnode of the
bus:

    1) The access controller is part of the bridge itself (not a separate module accessible
    via the bridge like it's the case for its children) so I think the current approach
    should also make sense if we take the hardware into consideration.

    2) The access controller configuration also impacts the AP. As such, we needed a way to
    enforce a dependency between the children of the aips5 bus and the access controller
    (we could have used the 'access-controllers' property like we did with the DSP but having
    to do that for all children of the bus is not ideal I'd say.

Of course, argument no. 2 is somewhat brittle in the context of i.MX8MP as the reset
values of the AC's registers already allow the AP to access said peripherals. Despite this,
I think the current approach would be more scalable given that the IP offers some more
configuration bits which we might want to toggle. For that to work, we need to make sure
the bits are toggled before the AP accesses the peripherals on the bridge.


Note that we don't do this for aips1-aips4 because it's really not needed. If I'm not mistaken,
they're not really attached to a PD so we don't need to re-configure them each time the domain
is power cycled (which is why we can just do it once from ATF during the boot process)
  

