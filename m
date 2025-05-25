Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAACC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 13:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaBe/qc+2pXExuQttHiqmVdIlwW/IMB18Yyn98zdkjY=; b=mTxbN2OTNtcJ/N05OU01EHZiiP
	z5viv6MDS+AcW+sXFB0FiHqFpC5/Q1CgFGSXCo/5QWJnklbn/4M0eWToIzZaksfq+qxIx9NoeouHB
	dJpdfeqJQLd17yZS41nsUaU0+tlnrZWmPRfxy+4dH/Zzx6tSBTKWnkAs3EQml7jxUaZUNG/1GcXwD
	7JL6MFw5fX9dANTy4JgCeh3yO+yOZDmxjE3I6HXq9mVjCEsD+C5TYdSk4NwF3/edqPhft5H2K0TC4
	o71R+skiaoKE2B/G+epM974+2iNrjVLTUotRCcoALh5zk3cnmH5Y3wHCcdI0XPuuBwVDpWgcA8jz/
	e/yLF1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJBVk-000000077sV-3aph;
	Sun, 25 May 2025 13:35:32 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJBTf-000000077gY-2fva
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 13:33:24 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4b50G127Rkz9sX2;
	Sun, 25 May 2025 15:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748179993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iaBe/qc+2pXExuQttHiqmVdIlwW/IMB18Yyn98zdkjY=;
	b=WvmTCjqShVbX7JrLS/FXF6KbBbigWBeZGBKazdmn4NQK4CkL1ptA5YNgySTl/lA0pSg5/w
	QygXSca6z+l22SB8KD1QuTVtOQXIC+wPFHCisYCeO0PZi1jfAby75/4uVNKv0wsSkFG8Y2
	1eTA1YmIPUnZjSqtiUI8o1wrjRWYjFF4nCcLjxfhD4FvPz6PXzE4fBZShIpDt+SoyWgTaY
	gTvIX15B/TcDUn98ZtzvMV1eWyxD6lGiMhUgscoYNfRlABPBd5i8uEuYwXC2ykokgCYnYg
	L4KZ6ERAizdr7FjmrFliBo5MtkdKSwh28mNRG0ccxno57oRpdHSFOA9rjiX+iA==
Message-ID: <395343ba-93cc-495c-b5eb-7ee425996465@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748179991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iaBe/qc+2pXExuQttHiqmVdIlwW/IMB18Yyn98zdkjY=;
	b=D0Achqh8/WvHVdwyXE9o848j56o/juRstx9hORCoSrgA/Fn/HCpZGhVu4/hhga2/zbptuB
	Dobf0+K909nOZlzOh7y+j9hRFVyq9X5ppmZEkvP2TLfk7Y5pt23y8GpbJjY7zJW9OAAt55
	SMlWRjUBbCJBkpg1NXf+MUFqmO8mrp9zzpWzXh0s4UNFwRZQ0cmn9XtA80kSE6hFQh8Zj6
	F0ysGSEoa68rDaZecgqkwRSxyqrQtXfnjiOcmQV9QSif8nsTy1hNny7OvpJZfC6EdiJhkf
	UEfQt70cWDx90X/dghI98D7RfbMRkqGL95vzgEE/t8GAJanxT0tvp9FIZB37eA==
Date: Sun, 25 May 2025 15:33:05 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
 Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
 <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
 <20250410204845.GA1027003-robh@kernel.org>
 <40c400ab-8770-4595-9a4c-004e6157c348@mailbox.org>
 <CAMuHMdU0U8RjJwgMs1gqaKUXj+aP=gMZRgO6Ni5gPHr3yFa_Hg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdU0U8RjJwgMs1gqaKUXj+aP=gMZRgO6Ni5gPHr3yFa_Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 30e54f29d21d2aff1b6
X-MBO-RS-META: 3hum87jao36mwgujkt91b8to163zmxcp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_063323_864078_DEE43A32 
X-CRM114-Status: GOOD (  15.79  )
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

On 4/23/25 11:38 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sun, 13 Apr 2025 at 11:29, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 4/10/25 10:48 PM, Rob Herring wrote:
>>> On Sun, Apr 06, 2025 at 04:45:21PM +0200, Marek Vasut wrote:
>>>> Document 'aux' clock which are used to supply the PCIe bus. This
>>>> is useful in case of a hardware setup, where the PCIe controller
>>>> input clock and the PCIe bus clock are supplied from the same
>>>> clock synthesiser, but from different differential clock outputs:
>>>>
>>>>    ____________                    _____________
>>>> | R-Car PCIe |                  | PCIe device |
>>>> |            |                  |             |
>>>> |    PCIe RX<|==================|>PCIe TX     |
>>>> |    PCIe TX<|==================|>PCIe RX     |
>>>> |            |                  |             |
>>>> |   PCIe CLK<|======..  ..======|>PCIe CLK    |
>>>> '------------'      ||  ||      '-------------'
>>>>                       ||  ||
>>>>    ____________       ||  ||
>>>> |  9FGV0441  |      ||  ||
>>>> |            |      ||  ||
>>>> |   CLK DIF0<|======''  ||
>>>> |   CLK DIF1<|==========''
>>>> |   CLK DIF2<|
>>>> |   CLK DIF3<|
>>>> '------------'
>>>>
>>>> The clock are named 'aux' because those are one of the clock listed in
>>>> Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml which
>>>> fit closest to the PCIe bus clock. According to that binding document,
>>>> the 'aux' clock describe clock which supply the PMC domain, which is
>>>> likely PCIe Mezzanine Card domain.
>>>
>>> Pretty sure that PMC is "power management controller" given it talks
>>> about low power states.
>>>
>>>
>>>>
>>>> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> NOTE: Shall we patch Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
>>>>         instead and add 'bus' clock outright ?
>>>
>>> Based on the diagram, this has nothing to do with the specific
>>> controller. It should also probably a root port property, not host
>>> bridge.
>> How would you suggest I describe the clock which supply the PCIe bus
>> clock lane (CLK DIF1 in the diagram) , which have to be enabled together
>> with clock which supply the PCIe controller input clock lane (CLK DIF0) ?
> 
> I think Rob wants you to add clocks/clock-names for this to
> dtschema/schemas/pci/pci-bus-common.yaml.  Then you can have pcie@M,N
> subnode(s) with num-lanes, clock, and clock-names describing the PCIe
> endpoint(s)?
> 
> git grep "pcie*@[0-9],[0-9]" -- $(git grep -l num-lanes -- Documentation/ )
> 
> Does that make sense?

No, not really. There can be any arbitrary PCIe card plugged into the 
M.2 slot, so how can I predict what exactly will be plugged into the 
slot and describe it in DT up front this way ?

-- 
Best regards,
Marek Vasut

