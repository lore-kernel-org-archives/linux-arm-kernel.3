Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD09C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phZtJJljKEJOK6MlgZrPZlmrH/bqjB9NJkz8RgXJGMQ=; b=1NS6wuR5Wgz0SojbUOkLo1QaLI
	aDJdCl9H7Zqg7lXgKoS9vkngPOzhJyL5MrA20/WB5YQivyNfY/h45OxuqhbHlIr5eW2yAL22DQB/S
	x+rcr6eTbBTgdh5mC3OYfqJx2Ql68DPTmx4gNv5k81iNlTepApyvZGNkr1kgHfjcFJFrtX7Mgx1zg
	wciMEh7CvkroJFCxeqIK/seCJUElflUVAuvo6O44rATI8gdmZ0mkBHaFLvV07NQDwoXCOaYpDsiDD
	EOJp+FzUvDhaJ2JEdR5OW3cwvMnd1ms+22oztDnOqyIQaUBnS1yNZAtMs/SPi9VesiQIMJUsdM62I
	7PHU/guQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVax-00000004TqC-1Dh1;
	Wed, 23 Jul 2025 09:17:03 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVHV-00000004QjI-3sYJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:56:59 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N8uM65028510;
	Wed, 23 Jul 2025 10:56:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	phZtJJljKEJOK6MlgZrPZlmrH/bqjB9NJkz8RgXJGMQ=; b=b3dTttzLcyGu3faH
	8GZs7OjxwijhA4DA3LtAQaSGpnn4V4apeeWcMp9oPqhcdBD0esOHs3d5NQdnvChE
	Xt5I/sfbV7Cjm2x8iTd6rrGfGpbXqkJne3dZdJocYLmZic5eh5nlrQKjL+rtvsWH
	b3HIbW/UcIrElRkku/YmkCuu1DEx3Dr8BjLZ+16790OsH9ccM73I5Nm6FP/Xo0hh
	q3e0kNj88tnViO0DzcuMlWauZUYY7KTZdiAEcUtqc7+uZvcR5T0Qp0OPTQ4nyY7+
	8Vu5OcxGOp+c8/dFtrDBWaZ8dQDC6meg0yzFA+W0qQGkn2UK7YJunWCPVeIjCBgX
	X0P60Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48028gae19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 10:56:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 930794005B;
	Wed, 23 Jul 2025 10:55:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 249447530A7;
	Wed, 23 Jul 2025 10:53:57 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 10:53:56 +0200
Message-ID: <9c9499e3-10c9-4245-938a-65831fe10c05@foss.st.com>
Date: Wed, 23 Jul 2025 10:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Andrew Lunn
	<andrew@lunn.ch>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Simon Horman <horms@kernel.org>,
        Tristram Ha
	<Tristram.Ha@microchip.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
 <5a2e0cd8-6d20-4f5a-a3a0-9010305509e3@foss.st.com>
Content-Language: en-US
In-Reply-To: <5a2e0cd8-6d20-4f5a-a3a0-9010305509e3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_015658_242512_7B9F4C21 
X-CRM114-Status: GOOD (  26.89  )
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



On 7/23/25 10:50, Gatien CHEVALLIER wrote:
> 
> 
> On 7/22/25 22:20, Russell King (Oracle) wrote:
>> On Tue, Jul 22, 2025 at 03:40:16PM +0200, Andrew Lunn wrote:
>>> I know Russell has also replied about issues with stmmac. Please
>>> consider that when reading what i say... It might be not applicable.
>>>
>>>> Seems like a fair and logical approach. It seems reasonable that the
>>>> MAC driver relies on the get_wol() API to know what's supported.
>>>>
>>>> The tricky thing for the PHY used in this patchset is to get this
>>>> information:
>>>>
>>>> Extract from the documentation of the LAN8742A PHY:
>>>> "The WoL detection can be configured to assert the nINT interrupt pin
>>>> or nPME pin"
>>>
>>> https://www.kernel.org/doc/Documentation/devicetree/bindings/power/wakeup-source.txt
>>>
>>> It is a bit messy, but in the device tree, you could have:
>>>
>>>      interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>
>>>                   <&pmic 42 IRQ_TYPE_LEVEL_LOW>;
>>>      interrupt-names = "nINT", "wake";
>>>      wakeup-source
>>>
>>> You could also have:
>>>
>>>      interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>;
>>>      interrupt-names = "wake";
>>>      wakeup-source
>>>
>>> In the first example, since there are two interrupts listed, it must
>>> be using the nPME. For the second, since there is only one, it must be
>>> using nINT.
>>>
>>> Where this does not work so well is when you have a board which does
>>> not have nINT wired, but does have nPME. The phylib core will see
>>> there is an interrupt and request it, and disable polling. And then
>>> nothing will work. We might be able to delay solving that until such a
>>> board actually exists?
>>
>> (Officially, I'm still on vacation...)
>>
>> At this point, I'd like to kick off a discussion about PHY-based
>> wakeup that is relevant to this thread.
>>
>> The kernel has device-based wakeup support. We have:
>>
>> - device_set_wakeup_capable(dev, flag) - indicates that the is
>>    capable of waking the system depending on the flag.
>>
>> - device_set_wakeup_enable(dev, flag) - indicates whether "dev"
>>    has had wake-up enabled or disabled depending on the flag.
>>
>> - dev*_pm_set_wake_irq(dev, irq) - indicates to the wake core that
>>    the indicated IRQ is capable of waking the system, and the core
>>    will handle enabling/disabling irq wake capabilities on the IRQ
>>    as appropriate (dependent on device_set_wakeup_enable()). Other
>>    functions are available for wakeup IRQs that are dedicated to
>>    only waking up the system (e.g. the WOL_INT pin on AR8031).
>>
>> Issue 1. In stmmac_init_phy(), we have this code:
>>
>>          if (!priv->plat->pmt) {
>>                  struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
>>
>>                  phylink_ethtool_get_wol(priv->phylink, &wol);
>>                  device_set_wakeup_capable(priv->device, 
>> !!wol.supported);
>>                  device_set_wakeup_enable(priv->device, !!wol.wolopts);
>>          }
>>
>> This reads the WoL state from the PHY (a different struct device)
>> and sets the wakeup capability and enable state for the _stmmac_
>> device accordingly, but in the case of PHY based WoL, it's the PHY
>> doing the wakeup, not the MAC. So this seems wrong on the face of
>> it.
> 
> 2 cents: Maybe even remove in stmmac_set_wol() if !priv->plat->pmt.
> 

Sorry, that's not very clear. I was thinking of removing:
device_set_wakeup_enable(priv->device, !!wol->wolopts); in
stmmac_set_wol()

>>
>> Issue 2. no driver in phylib, nor the core, ever uses any of the
>> device_set_wakeup_*() functions. As PHYs on their own are capable
>> of WoL, isn't this an oversight? Shouldn't phylib be supporting
>> this rather than leaving it to MAC drivers to figure something out?
>>
>> Issue 3. should pins like WOL_INT or nPME be represented as an
>> interrupt, and dev_pm_set_dedicated_wake_irq() used to manage that
>> interrupt signal if listed as an IRQ in the PHY's DT description?
>>
>> (Side note: I have tried WoL on the Jetson Xavier NX board I have
>> which uses stmmac-based WoL, but it seems non-functional. I've
>> dropped a private email to Jon and Thierry to see whether this is
>> expected or something that needs fixing. I'm intending to convert
>> stmmac to use core wakeirq support, rather than managing
>> the enable_irq_wake()/disable_irq_wake() by itself.)
>>

