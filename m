Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3B5CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 02:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZZBiUvY/5c9jBV/LBTUZW0mo2dx1qt89FE4BeeGdtA=; b=rv92jbNUcDO6CPDFiZHa7CotKP
	1iwog98+KEphAq5a2jKMkNxWAJduJFEb70lb8tRsgc3pMWmIGnPLW8c0iHS7Kbk1gF3VcoNzUfu6n
	lqnF4JK8CSGiUGPzEthxGXsW0KI219G2byhKJ9Vd2ySnbQazhYesi8nH5H99ysX+Zd0jG8Kwdfe3i
	Pin5ytCto3VVxcSR8YRhNRQk1pcch5VmTf+yJd5JDm++ZEjylackdApC6PqRCRbgKAtKW98UM4kHM
	vKUYN6HwJw1W+/mVS0daH+P33zpWTGZKPU349YhTZ5J5MHehEZnX2pbqXqAGiihPpkaSpQ6GipwN0
	C7/BAndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdqZ-00000006NQt-2yR6;
	Tue, 11 Nov 2025 02:11:03 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdqT-00000006NNY-0h9h;
	Tue, 11 Nov 2025 02:11:02 +0000
X-QQ-mid: zesmtpip3t1762826986t355f97ce
X-QQ-Originating-IP: Hiq+d1HFsdfBnF0CzHzpOopV81Jpt/t8pVjS27nsYIM=
Received: from [IPV6:240f:10b:7440:1:62e3:2c99 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Nov 2025 10:09:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12658501094839713575
Message-ID: <B721C8A516FDB604+a04b38d3-64ec-423f-9e4c-040c8d2aec76@radxa.com>
Date: Tue, 11 Nov 2025 11:09:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
To: Niklas Cassel <cassel@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Damien Le Moal
 <dlemoal@kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dragan Simic <dsimic@manjaro.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>
References: <55EB0E5F655F3AFC+136b89fd-98d4-42af-a99d-a0bb05cc93f3@radxa.com>
 <aRCI5kG16_1erMME@ryzen>
 <F8B2B6FA2884D69A+b7da13f2-0ffb-4308-b1ba-0549bc461be8@radxa.com>
 <780a4209-f89f-43a9-9364-331d3b77e61e@rock-chips.com>
 <4487DA40249CC821+19232169-a096-4737-bc6a-5cec9592d65f@radxa.com>
 <363d6b4d-c999-43d4-866e-880ef7d0dec3@rock-chips.com>
 <0C31787C387488ED+fd39bfe6-0844-4a87-bf48-675dd6d6a2df@radxa.com>
 <dc932773-af5b-4af7-a0d0-8cc72dfbd3c7@rock-chips.com>
 <aRHb4S40a7ZUDop1@ryzen>
 <2n3wamm3txxc6xbmvf3nnrvaqpgsck3w4a6omxnhex3mqeujib@2tb4svn5d3z6>
 <aRJEDEEJr9Ic-RKN@fedora>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <aRJEDEEJr9Ic-RKN@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MX0ofXk2LYQCUdF/iD0ozdGip6CcWL19rTDxs1qdeA7+87oXmSdNaGQm
	vT4YRv3rH4jp9/3aD+eYo4bvX9r87EFI7f2axjA10Zv04GbrpKtgOXqWsdXSAAoiboNryTj
	MWHvWlFIFCHwKWgQdVWGJeOFQeFBJuVVSJSv4t4sv/24+bGEe8CLJtjA5wH2Bdk3DK844CS
	eYd4QHpS3hqkIs7tYd40HY/WV8cywiOYUm6YGy3HN7abm8bk9OrVvpN432BPLcL0JopfUUp
	ntYEgfoU9M0bTYazDoam35nKyyNd3x+UnXSt99fXF0vgm6Pl1eh3cDI36h2NfiKdp743qC6
	pQ8wq9d0mw51vat8L/GaOSO9SNDMbuUaDmC/Th5uck/4bfPptoYoAsxqdWLD9FDfgiqcAqE
	xZzyPriZYwGnt6hu4P+08iKKi+Yw8DOdpdc+lQkcm2ObPZ84pzXJ8u6O2fSxaoZtRmsMmXJ
	ReVrBE90xs8OKE59+Yv86I3rDK68UpE7W7DN2jhGUEWHXpv/8k2PHkG7RlRk+lS+15EIPYx
	lvo7ZXeedL62uwe6YYjxojnj1mi6FmqulOOEjDS9HA9YhDwPGafFioMIDa2+WVh/4XosmMX
	wzZmpgJ9D9BMVLfklOBvQA+gmooXma0utnjhI3f501dK6hHop9mQlwzwmzwOd0Km79raECi
	z49pv3UQ/9u03x7JnGLXYbjrl/cJr7IozjfRrd4Q9u1djaCVXwFwYPGuAr9ErS9cPQr+1uE
	mIAbhbe4KP0ItfoQLb3AchEaoR7ozWWHqt3I/sPGsrxINC7r9rLIT8BvlUDRWzACqXqVoG7
	PmiCBt0WqOzKuoa0UnFvm84gejT8l36Dp6brXQ3wJZAX5rTvSnt8JoEziMS5BsViA6hBcTH
	3PSiTl4CUUkdTwzKH0omFmRWI+UKsbQ3i7IqCcTlwWW/rTxnaaxx9CmKfVQLPTBNPP8Rhtt
	VFtkH7TUpG1X4wIvuh7Mwypw23erMsGeEMGvKZqdvvvyN+dHLfEDxYAYHlUFYpEcINqhVU3
	5DqdaD71JxdwXYw6ke
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_181057_723285_E521B16F 
X-CRM114-Status: GOOD (  28.23  )
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

On 11/11/25 04:59, Niklas Cassel wrote:
> On Mon, Nov 10, 2025 at 09:23:02PM +0530, Manivannan Sadhasivam wrote:
>>>
>>> Considering what Shawn says, that the switch gets enumerated properly
>>> if we simply add a msleep() in ->start_link(), which will be called
>>> by dw_pcie_host_init() before pci_host_probe() is called...
>>>
>>
>> Yes, that delay probably gives enough time for the link up IRQ to kick in before
>> the initial bus scan happens.
> 
> I think that the problem is that even for platforms with link up IRQ,
> we will always do:
> 1) dw_pcie_start_link() (if (!dw_pcie_link_up()))
> 2) pci_host_probe() from dw_pcie_host_init(), this will enumerate the bus
> 3) pci_rescan_bus() from the Link Up IRQ handler
> 
> Thus, in 2, when enumerating the bus, without performing any of the delays
> mandated by the PCIe spec, it still seems possible to detect a device (it
> must have been really quick to initialize), and to communicate with that
> device, however since we have not performed the delays mandated by the spec,
> it appears that the device might not yet behave properly.
> 
> Hence my suggestion to never call pci_host_probe() in dw_pcie_host_init()
> for platforms with Link Up IRQ.
> 
> At least for pcie-dw-rockchip.c, we only unmask the Link Up IRQ after
> dw_pcie_host_init() has returned, so I think that your theory: that Shawn's
> suggested delay causes the Link Up IRQ to kick in before the initial bus
> scan, is incorrect. (Since the IRQ should not be able to trigger until
> dw_pcie_host_init() has returned.)
> 
> 
>>
>>> ...we already have a delay in the link up IRQ handler, before calling
>>> pci_rescan_bus().
>>>
>>
>> That delay won't help in this case.
> 
> Sure, I was just saying that even though Shawn's patch made things work,
> it seems incorrect, as we do not want to add "the same delay" that we
> already have in the Link Up IRQ. (The delay in the Link Up IRQ should be
> the only one.)
> 
> 
>>> I think a better solution would be something like:
> 
> (snip)
> 
>> This solution will work as long as the PCIe device is powered ON before
>> start_link(). For CEM and M.2 Key M connectors, the host controller can power
>> manage the components. But for other specifications/keys requiring custom power
>> management, a separate driver would be needed.
>>
>> That's why I suggested using pwrctrl framework as it can satisfy both usecases.
>> However, as I said, it needs a bit of rework and I'm close to submitting it.
>>
>> But until that gets merged, either we need to revert your link up IRQ change or
>> have the below patch. IMO, the revert seems simple.
> 
> Using pwrctrl framework once it can handle this use case sounds good to me.
> 
> FUKAUMI, could you please send a revert of the two patches?

Leaving the commit message aside, I'm currently testing with a revert of 
the two patches.

Vanilla v6.18-rc5, CONFIG_PCI_DYNAMIC_OF_NODES=y, revert ec9fd499b9c6, 
revert 0e0b45ab5d77.

It works stably on the ROCK 5A. The link speed is 2Gb/s.

The ROCK 5C is unstable. It initially worked with a link speed of 4Gb/s, 
but eventually started showing kernel oops. The dts files for the 5A and 
5C are compatible and interchangeable, but even using the 5A's dts on 
the 5C, the operation remains unstable.

I plan to thoroughly investigate the ROCK 5C's behavior on v6.13, but 
for now, I believe reverting the two patches is the correct action.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Kind regards,
> Niklas
> 



