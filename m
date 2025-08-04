Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDB8C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 20:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0i+xPHurVHWx/5i/nPmO2IbGaJdwKMLJnL0X+J3opIM=; b=3GIkfPhF7OTl/7CzQ/xD5hmpWQ
	Cz6JiI+LzzVMsWPabACOTNRpipUT44gFUgy16aXmuBHqTqtxErZMv5IdqoVUL7HLK9X1ixqFwJgcr
	T576AOubpH47LZTaMuxu7HBbg5ka7S+qAKg8ej9MYvHdvJtJDU1V1zg/EiGYXrX/gXLMHEeU0k64L
	IDSAtGoBiQ9WDUa5c3ixPAkbVost/7CxKYN+OyHa4NF3I1NTChFMn6QhJRXpgwLLsPdtznAtP15dz
	oXOWytQLcOw1DMFIAKbQdHJRmkRBIwdbmVG72RQm8bQq3CCpa7iqTT2wU5gzNwwIL0sDez7e20pLR
	UglP+oVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1iD-0000000BHb0-3vSL;
	Mon, 04 Aug 2025 20:23:13 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1ff-0000000BHRm-2hAC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 20:20:37 +0000
Message-ID: <8df3b328-0e6e-4117-9707-de0e39f74d2e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754338831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0i+xPHurVHWx/5i/nPmO2IbGaJdwKMLJnL0X+J3opIM=;
	b=NtZ7vfTsMnVhi5pZZn2gfy2FUt1IAXghcC4Zk5QcBWKrSXmi+6wzArReak2Fq8Oc6mkbNa
	9kgB0dmRvyblbKMVfSkRq3eltMtH5lffNMG+tEckQ7g2mQqYhNqsvyhJxpZ5PiefJH5jLo
	bNlkOxDtcnO5uB1NskZhksMBlbNLeW0=
Date: Mon, 4 Aug 2025 16:20:26 -0400
MIME-Version: 1.0
Subject: Re: [BUG] pci: nwl: Unhandled AER correctable error
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-pci@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <53f6d267-62af-4dad-8fa7-a2a497b22636@linux.dev>
Content-Language: en-US
In-Reply-To: <53f6d267-62af-4dad-8fa7-a2a497b22636@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_132036_134334_D3A1967A 
X-CRM114-Status: GOOD (  19.29  )
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

On 8/1/25 13:43, Sean Anderson wrote:
> Hi,
> 
> AER correctable errors are pretty rare. I only saw one once before and
> came up with commit 78457cae24cb ("PCI: xilinx-nwl: Rate-limit misc
> interrupt messages") in response. I saw another today and,
> unfortunately, clearing the correctable AER bit in MSGF_MISC_STATUS is
> not sufficient to handle the IRQ. It gets immediately re-raised,
> preventing the system from making any other progress. I suspect that it
> needs to be cleared in PCI_ERR_ROOT_STATUS. But since the AER IRQ never
> gets delivered to aer_irq, those registers never get tickled.
> 
> The underlying problem is that pcieport thinks that the IRQ is going to
> be one of the MSIs or a legacy interrupt, but it's actually a native
> interrupt:
> 
>            CPU0       CPU1       CPU2       CPU3       
>  42:          0          0          0          0     GICv2 150 Level     nwl_pcie:misc
>  45:          0          0          0          0  nwl_pcie:legacy   0 Level     PCIe PME, aerdrv
>  46:         25          0          0          0  nwl_pcie:msi 524288 Edge      nvme0q0
>  47:          0          0          0          0  nwl_pcie:msi 524289 Edge      nvme0q1
>  48:          0          0          0          0  nwl_pcie:msi 524290 Edge      nvme0q2
>  49:         46          0          0          0  nwl_pcie:msi 524291 Edge      nvme0q3
>  50:          0          0          0          0  nwl_pcie:msi 524292 Edge      nvme0q4
> 
> In the above example, AER errors will trigger interrupt 42, not 45.
> Actually, there are a bunch of different interrupts in MSGF_MISC_STATUS,
> so maybe nwl_pcie_misc_handler should be an interrupt controller
> instead? But even then pcie_port_enable_irq_vec() won't figure out the
> correct IRQ. Any ideas on how to fix this?

OK, so as a first pass, maybe something like

	if (misc_stat & (MSGF_MISC_SR_FATAL_AER | MSGF_MISC_SR_NON_FATAL_AER
			 MSGF_MISC_SR_CORR_AER))
		generic_handle_domain_irq(pcie->legacy_irq_domain, 0);

to simulate the correct IRQ. I have no idea whether it's safe to call
generic_handle_domain_irq in this context. It wasn't OK for AER (see
commit 9ae052253785 ("PCI/AER: Fix the broken interrupt injection")),
but maybe it's OK for us since the legacy irqchip doesn't support
affinity? I CC'd Thomas and maybe he can comment.

Otherwise, maybe the best thing is to just add an API to manually trigger AER.

> Additionally, any tips on actually triggering AER/PME stuff in a
> consistent way? Are there any off-the-shelf cards for sending weird PCIe
> stuff over a link for testing? Right now all I have 

But I still don't know how to test this. I can inject a misc interrupt
since the GIC supports irq_set_irqchip_state, but that won't really
simulate an AER interrupt since MSGF_MISC_STATUS won't have the right
bit set. Maybe I can wiggle a card around in its slot? Maybe PME or link
bandwidth notification could trigger this as well?

--Sean

