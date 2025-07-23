Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBE7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybWW2x8fDcj+N5hV7PM0YQEibulS1fH0S8JJpPe47GY=; b=B2N1IhYVtSMfOp0Cfgx6IRFdVt
	+Inq+dveCZ+RFnziLL3L8M1nQ50xFIsJc6Enxgro6288R3qhfvvBnTeibjxd8HNT/3kzgkO0zSt/l
	w4dAWPQTx9XgdV9jS6tSkT1rHzgUZaF8bmcuDJkLsyv/KszJYeN4jtTR4+LrcDHRi8Et5iFm8GuIv
	iiJE9iF+yQ6zlPDzoqF+TCCoYSbjs4UFJGRhjKXjHYH7qTjyvsuSlnuMJQVVmrGGoRfQrW1iBXS7G
	+7IDnBv5ffrQjnAXqc3GFnFAyksbRRkoMXwEKIzVj1mXj25tO/6cR2t1sHFhRBMJFCZJl2TyObG04
	Aq4KO1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueb2t-00000005KIV-0eAC;
	Wed, 23 Jul 2025 15:06:15 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueabv-00000005E3B-3Lmo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 14:38:25 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NDqKnl004953;
	Wed, 23 Jul 2025 16:38:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ybWW2x8fDcj+N5hV7PM0YQEibulS1fH0S8JJpPe47GY=; b=LybQKPjRkNFAQoU9
	jItT0px77hEvmRmGQGwlo1zkH7+hdzJESsucEbEjPfO9Shhwb23BFMH3CtJ1CNoa
	PDKwJjTf0D7Pep+h+c2+IS70t9IB4OwLQU1AVRdhGvSXPbvl6182Q8+4IXFOBZm0
	EeXVOGrWybDqCpSmHuokH7MKzCUEoDbrbiQyqKn9o16voLXmvGKBo5HOOdvZXRB5
	/3pNmrQ+U2AO778De/wACI3+ZXPu8zvJkFusYHtxJFuPhlXhiI9fwTFTbVGIbxFc
	xWBdmUhOz5RkOd2jITayDh21zcAKqAYgCsU/yTU2ysR4Zl9QduPsLgVvgND8DZ97
	BA4+7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8v8ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 16:38:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C013440046;
	Wed, 23 Jul 2025 16:36:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26AD077F15C;
	Wed, 23 Jul 2025 16:35:14 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 16:35:13 +0200
Message-ID: <7a900f56-355e-42f7-93fe-be5a586cc083@foss.st.com>
Date: Wed, 23 Jul 2025 16:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
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
References: <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
 <5a2e0cd8-6d20-4f5a-a3a0-9010305509e3@foss.st.com>
 <aICpe63iqldl9NFd@shell.armlinux.org.uk>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <aICpe63iqldl9NFd@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_073824_112096_99840FB1 
X-CRM114-Status: GOOD (  39.57  )
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



On 7/23/25 11:20, Russell King (Oracle) wrote:
> On Wed, Jul 23, 2025 at 10:50:12AM +0200, Gatien CHEVALLIER wrote:
>> On 7/22/25 22:20, Russell King (Oracle) wrote:
>>> On Tue, Jul 22, 2025 at 03:40:16PM +0200, Andrew Lunn wrote:
>>>> I know Russell has also replied about issues with stmmac. Please
>>>> consider that when reading what i say... It might be not applicable.
>>>>
>>>>> Seems like a fair and logical approach. It seems reasonable that the
>>>>> MAC driver relies on the get_wol() API to know what's supported.
>>>>>
>>>>> The tricky thing for the PHY used in this patchset is to get this
>>>>> information:
>>>>>
>>>>> Extract from the documentation of the LAN8742A PHY:
>>>>> "The WoL detection can be configured to assert the nINT interrupt pin
>>>>> or nPME pin"
>>>>
>>>> https://www.kernel.org/doc/Documentation/devicetree/bindings/power/wakeup-source.txt
>>>>
>>>> It is a bit messy, but in the device tree, you could have:
>>>>
>>>>       interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>
>>>>                    <&pmic 42 IRQ_TYPE_LEVEL_LOW>;
>>>>       interrupt-names = "nINT", "wake";
>>>>       wakeup-source
>>>>
>>>> You could also have:
>>>>
>>>>       interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>;
>>>>       interrupt-names = "wake";
>>>>       wakeup-source
>>>>
>>>> In the first example, since there are two interrupts listed, it must
>>>> be using the nPME. For the second, since there is only one, it must be
>>>> using nINT.
>>>>
>>>> Where this does not work so well is when you have a board which does
>>>> not have nINT wired, but does have nPME. The phylib core will see
>>>> there is an interrupt and request it, and disable polling. And then
>>>> nothing will work. We might be able to delay solving that until such a
>>>> board actually exists?
>>>
>>> (Officially, I'm still on vacation...)
>>>
>>> At this point, I'd like to kick off a discussion about PHY-based
>>> wakeup that is relevant to this thread.
>>>
>>> The kernel has device-based wakeup support. We have:
>>>
>>> - device_set_wakeup_capable(dev, flag) - indicates that the is
>>>     capable of waking the system depending on the flag.
>>>
>>> - device_set_wakeup_enable(dev, flag) - indicates whether "dev"
>>>     has had wake-up enabled or disabled depending on the flag.
>>>
>>> - dev*_pm_set_wake_irq(dev, irq) - indicates to the wake core that
>>>     the indicated IRQ is capable of waking the system, and the core
>>>     will handle enabling/disabling irq wake capabilities on the IRQ
>>>     as appropriate (dependent on device_set_wakeup_enable()). Other
>>>     functions are available for wakeup IRQs that are dedicated to
>>>     only waking up the system (e.g. the WOL_INT pin on AR8031).
>>>
>>> Issue 1. In stmmac_init_phy(), we have this code:
>>>
>>>           if (!priv->plat->pmt) {
>>>                   struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
>>>
>>>                   phylink_ethtool_get_wol(priv->phylink, &wol);
>>>                   device_set_wakeup_capable(priv->device, !!wol.supported);
>>>                   device_set_wakeup_enable(priv->device, !!wol.wolopts);
>>>           }
>>>
>>> This reads the WoL state from the PHY (a different struct device)
>>> and sets the wakeup capability and enable state for the _stmmac_
>>> device accordingly, but in the case of PHY based WoL, it's the PHY
>>> doing the wakeup, not the MAC. So this seems wrong on the face of
>>> it.
>>
>> 2 cents: Maybe even remove in stmmac_set_wol() if !priv->plat->pmt.
> 
> On the face of it, that seems like a sane solution, but sadly we
> can't do that. If we did, then at least Jetson Xavier NX would break if
> WoL were enabled, because DT describes the PHY interrupt, and currently
> the PHY driver switches the interrupt pin from interrupt mode (where it
> signals link changes) to PMEB mode (where it only pulses when a wake-up
> packet is received) when WoL is enabled at the PHY. This will mean
> phylib won't receive link state interrupts anymore, so unplugging/
> replugging the cable won't be detected by phylib.
> 
> Even my further suggestions do not get us to a state where we can pass
> the set_wol() to the PHY, and then work out what the MAC needs to do,
> because e.g. in the case of RTL8211F, even if we use the "wakeup-source"
> to fix the above, we still have the problem of "is wake-up supported
> by the PHY wiring or is it not". We just have not described that in the
> DT trees for platforms, so this is basically unknown.
> 

Yes but the PHY is described as board level, so for each board, each
vendor/industrial/amateur has the knowledge of the pin being wired.
or not. Therefore, the "wakeup-source" property could be added only
if that's the case, couldn't it? Maybe I'm missing something.

This way, the PHY driver could ultimately return an AND of the property
being present and the PHY WoL capabilities for wol.supported field.
However, that's seems a bit messy and suggests not relying on pmt being
present when setting WoL for stmmac and other reworks in other places.

TBH I'm not sure how to handle this without massive changes...

> Adding any logic to the kernel to make that decision will cause
> regressions - either by making WoL unavailable on platforms where it
> previously worked (e.g. because PHY WoL was being used) or the opposite
> (where MAC WoL was used but now PHY WoL gets used but isn't wired.)
> 
> This is why I say we've boxed ourselves into a corner on this - this is
> not phylib maintainers fault, because we can't know everything about
> every device out there, and we don't have time to read every damn data
> sheet which may or may not be publically available. We have to go by
> what submitters provide us, which leads to problems like this.
> 
> So, we need flexibility from everyone to try and find a way forward.
> We can't have people sticking to ideals - such as DT maintainers being
> rigid about "DT describes hardware only". As I've already stated, our
> DT currently does *not* describe hardware with respect to PHY wake-up,
> and because this has been overlooked, we're now in a mess where there
> is *no* easy solutions, and no solution that could be said to purely
> describe hardware.
> 
> If we didn't have any PHY drivers, and were starting afresh, then we
> would have the latitude to come up with something clean. That boat has
> long since sailed.
> 

