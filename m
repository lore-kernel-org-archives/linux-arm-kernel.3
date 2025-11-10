Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD45CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkVs/UIdmMz297m2of5BhEUObMzsMza4CC8iLzQbozo=; b=h/0zPyC8+3pWboM+ICzch6dKTk
	Mrm2zPLL9WsCBFsGTzhQEdLgL3Jn09Oi5s5c7HUiWmhQeBok4wnxWjSippLegnxQkp76BUKIjYY95
	RVNPgWLSah/nKL5JokI6HPvcoJi1JKFVKcXEL8HFmCNHQT92RfqdnfTqq3BIcszQAHOESel4U1u+3
	k0vjzLolEVYg4umxVUETOyA/UPXdfzLIB0FnLP0faXDNck+FGf1MeSVI/Lte7B4he6YMyhzw/yJEx
	7I2iR5lVU6oiYlXfSFbpMmPwbN0MUBkBh071s1NfBcrB+2UMzNzIgQYwnwo0ZDWNh5ElsdIS/i2qV
	6u5oD3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIaAc-00000006C0n-1OFH;
	Mon, 10 Nov 2025 22:15:30 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIaAZ-00000006BzR-370a;
	Mon, 10 Nov 2025 22:15:29 +0000
X-QQ-mid: zesmtpip4t1762812868t96193133
X-QQ-Originating-IP: E9Yl8bFeRQ31iU6DcptQALqHx/7FY2qbcwSWHKucAQI=
Received: from [IPV6:240f:10b:7440:1:62e3:2c99 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Nov 2025 06:14:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3378252220156844302
Message-ID: <326A5CF08811110E+7785bc1e-6245-453d-9312-1b5726e7aed1@radxa.com>
Date: Tue, 11 Nov 2025 07:14:23 +0900
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
X-QQ-XMAILINFO: NvP4hNjT8tlUGQl73nD4w74yzWMi3692DHk2wMnNSFnhams3vmaBLoOX
	AH88WridlNYalHSFKdkVS8kbWUS7fzC6P/ND9y3SQAtiuFMeeoLIUOTQ0FpOXsaFPR1iYCG
	L0GLZ/HiBOyOD6Oz3OJET1nqQoluPSdqoymkneH39Rdz6NJmRokyRAq6BPipeqbITEwbUr2
	UasqRCFc+HZaacB0q/Iah5Tiwg81XSfmWhdHOWcvXSErdlJHgzJZ2Kbl37Dxa4QaD1g/zMd
	xKwtKjOS0jSN+RV/vZr4FQZdPCMaX6mzBOqGF5gU0O6KZOXpjW/elAHUqUkPdvpBeuKUTmj
	hX50fBtLSHagELRXIAdbfyU4/ComUudobKMMOOei21X3tbOfu4ikvrD59bErvqqNG/ETiSd
	TmodQOvlTBzLDKjgMQ7XEt426pgUznc83XYdvBNZhat1t/x/RMsKVsaVCPR1qkxqjViKtI5
	48jUXAAEkqb+0WXmffC1FlmZl+0VJji0hJSbavM7uz+NJlV/6mmgAoibiexUAmNpCKrhv4y
	fMJsAKwTtyFY5CuqdFMLxWsfdQhd1JH8FU0lmmxMbjuz0TQvbbjSQhMZZAXdW0x6ExWzwSt
	q7arCPFNsFsTBmtQ0uprdNK+GWk3a3CrB1D3bxMdeAoOqr3oMw0JdGi7Sr9Dg8vHK1SiuM4
	RfsZjATq/Z0uuxQ140uX0gXLehVtkL6k40BSv23Ps0v5zdjydwqtkBSRA5sYQz2Xpvgau9r
	tHeXqStezaa5TTNj4QLNc51BD3JlrUnLk79cN07YpZVg4JpZ4altdYUzT1ILiPT1Cgc2OlJ
	MRWnYfffSRD7E7qip9cP9bqIuSgNCOGexX+HnJBzMwFbk5xdjSbh0BXR1hWQ2N3zBXWB4Rh
	7kmy0cRHbwEyKd+iQlHBA5AxpI+Lnh8HCA8R+DaPbzzFG5Bzoa7aYgiCwQYTkZZhp9m/9yd
	jmB1nUBQHf9hts1gNtJyU0CdOReCVg229NDOomBloW90Du96t9p0Qh6sbIyLiIxZEHmU=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_141528_633266_BE14FCDD 
X-CRM114-Status: GOOD (  24.83  )
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

Hi Niklas,

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

Well, I cannot write a detailed explanation...

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Kind regards,
> Niklas
> 



