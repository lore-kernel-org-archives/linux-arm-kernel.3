Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFD7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 16:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsIcksqCjHhl+PgskQMA9X+AMXn/bCWoXZcBglPsCLQ=; b=Gub8Qnv8Os8rv4lSC2SFjVz9cm
	cb2Kf7ujBmi6T6bHXzkfiIEp7etRnFNwwMIGsj5GK1VbOgIBf3V80B7ajk6bsPoIWf05v7nBFOd5+
	d7fQlkfdWOBA+Huiz9izvMB63+f4YggD0SKLSmBa9SXuS4Bj9qvw8MJbwfs/pgp2HRKh1eidk3pNE
	WcOUtz7AkcYtzbd4N28kF8nk1oFPGmvKyqVJqoWND3cgnY4pOu9fXrQ2DJraFvLr81xkxVfTMFpa7
	ofpExfpp4Q9kJVQaN4dDUzaJ3RdHHodx7YIVhIGc5mZFjmo5X2RGmWEUD339Z5+hOEo8klY/jkhRJ
	a6nJHgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqa4-00000002tz8-3cHw;
	Thu, 09 Jul 2026 15:22:28 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqa2-00000002tyW-32wO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:22:27 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gwzGl2hsWzMlFX;
	Thu, 09 Jul 2026 17:22:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783610543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsIcksqCjHhl+PgskQMA9X+AMXn/bCWoXZcBglPsCLQ=;
	b=rtC/EAlyOKiXirZSk/d71ooja/c7nLc/BRFJk2yPB9Kp77blaHjJixRruUPHZShcnQmrMh
	7+SMmdJEdMxFsB5ZS7lZPfaJ+uVcB/KjL9gMSXOj56cxfdFXHHhVVxljxPCcL6NsH/puCO
	FoVe9kapTLf4GFyfNn/3znlCX6oEG7hqvtGSw4XwUWovt25rISI/AKNsA66c4U8xvMxhPx
	3c6MvDftlnqEPNrogLW4S8YKlLwiEb1GkNAos/eb8XFxS23SScur9PYnsWuljTvW1QQ6fM
	29aOllfZZP/td96j/NbsGuV27BUOp/FVm82DoRkNx1FQ6FwOEnIxfqooQWgq2w==
Message-ID: <a8eaf0be-175e-4e3e-a773-d0684a23b396@mailbox.org>
Date: Thu, 9 Jul 2026 17:22:18 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
To: Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-pci@vger.kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
 <ybnitlgx3dcqsesubz6jz7pn6snseuxhtz564tinbtvukianaq@33ubmcynyqmt>
 <c12941e4-3715-404e-b674-090c62b868b8@mailbox.org>
 <87v7ao5o5t.wl-maz@kernel.org>
 <lkxuw3lgr6gbi4vnj33pfq5kh7h7qefkwiovlqsltnfivbrfit@khnoyfmibg5f>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <lkxuw3lgr6gbi4vnj33pfq5kh7h7qefkwiovlqsltnfivbrfit@khnoyfmibg5f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 329c7eef028ecd092b3
X-MBO-RS-META: tctohij9qgjyajkrm4cs6844iwq15twh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_082226_909804_34CFF44B 
X-CRM114-Status: GOOD (  16.08  )
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

On 7/9/26 2:57 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 09, 2026 at 01:43:26PM +0100, Marc Zyngier wrote:
>> On Thu, 09 Jul 2026 13:33:22 +0100,
>> Marek Vasut <marek.vasut@mailbox.org> wrote:
>>>
>>> On 7/9/26 2:19 PM, Manivannan Sadhasivam wrote:
>>>> On Tue, Jul 07, 2026 at 10:35:38PM +0200, Marek Vasut wrote:
>>>>> Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
>>>>> case MSI are enabled and disabled.
>>>>>
>>>>> Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
>>>>> configured to 32-bit address width for AXI or APB interface.
>>>>>
>>>>> Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
>>>>> implementation cacheable and shareable limitations.
>>>>>
>>>>> Marek Vasut (5):
>>>>>     PCI: dwc: Determine whether iMSI is used before calling .init
>>>>>     PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
>>>>>     irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>>>>>     irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
>>>>
>>>> Is there a functional dependency between irqchip and PCI patches? Since the
>>>> irqchip patches touch ARM64 Kconfig etc... I'm wondering if it still need to go
>>>> through PCI tree.
>>> I do not believe there is.
>>>
>>> These two configure the PCIe controller hardware:
>>>    PCI: dwc: Determine whether iMSI is used before calling .init
>>>    PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
>>>
>>> These two fill in GIC ITS quirks:
>>>    irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>>>    irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
>>>
>>> This one does yes depend on the two and two patches above, and can
>>> only be applied once all four aforementioned patches land, otherwise
>>> things really yes will break:
>>>    arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes
>>>
>>> Would you like me to split the series up , or can you and Marc (?)
>>> pick the relevant parts via matching trees ?
>>
>> I don't think there's anything for me to pick. The whole thing looks
>> like a consistent set, and it probably should be kept together.
>>
>> Given that the irqchip stuff has been acked by the relevant party, and
>> that the last patch will cause havoc if taken on its own, the only
>> course of action is to route the whole thing together, the PCI tree
>> being the most obvious victim.
> 
> Alright then. I'll merge all 4 patches to PCI tree.
Thank you all.

