Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB28FCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yd7mLJQDkHllxwujkPQ/7Z9ByYCiL7cm7yP3I7t4tTI=; b=JyGgPqPnsGgOoG5vdoJyl1x8X9
	CIZ5Ay7j3IxmWt5DQDoOXGcr2z6BIEgFlSs+TA1dlfSUijc7z+/GChIOjqgQ5nL+/gphYi/jH1Uri
	/BXbFDSS68zjmdygjHLQRgWHa+9eGjmDF4eYi3Tkz0HCYCZlD5cs/F/bIahhzyEHOcwRhJV7XVzjE
	pNayEWSFnJqUucRiLOPhRzuMnlNBLNMOQ6MsTVXIom5REg985+cpY/L80MAYqBwEiXHP5MujSFdzD
	/+hqALQAp46VwZdFJBVe/7z/nf08FHKjExD6GRSn2PzObvbb24wtILkP8ocEpDrWTBLOBwjS1ZXAw
	U3OmM78w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfNM-000000013El-0LAM;
	Mon, 08 Sep 2025 17:09:56 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbXs-0000000HEu9-3Hye
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:04:34 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so6319794a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757336671; x=1757941471; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yd7mLJQDkHllxwujkPQ/7Z9ByYCiL7cm7yP3I7t4tTI=;
        b=Hb8jwOjyi2T6kR46rr7pAq0Era9EJmmFE8Y2xDuN5c9S8KWDEzfVupOPrN3s2j8sKQ
         5KY+oVIVVl5Bw2CyElDZDvpmsWi3Cog6lUSNEEGjX+2WDbodNAuHVV03R0rLfBQsQCJL
         4w0BPxGT6H29Y19Y24n0JYy59qDQSOBg6yhOtMgxDi1f1DJML3gItpec/0wqTjaL6U4G
         Ni2kuxbWzQ/8BO5B4fbzEOvpkzHGj1ALW4ZdY7x9CK+xCB/dPecQ5++RSVi81aWRKgNQ
         2Bi+Jafrk3OrMDBDrZKORrVDz2qEFXdEy2Zl6V2/BMhId2D51pEyHnI/OY6lHUgQ1MsY
         iwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336671; x=1757941471;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yd7mLJQDkHllxwujkPQ/7Z9ByYCiL7cm7yP3I7t4tTI=;
        b=c/Bv37Fw+pYGHUdCHeCZtlnf5gwyfxIqxUpN5aJ5c/EP4a56mUTkqqU6SlRssWy8Tt
         QlT+ETlkcpEdeZOKDr8gBfCEH+Mb2Tw81P6xBkYH6s0dZlrzvm/iWHgk+qlSheYVvw05
         wpBH1e6bzbCrxcjKvK8P5XXToDD3uL32sH7VbTv2JrRb13jRQtsC0rB5VqwLJrakn3Zy
         rpshiLZ4211jv3akfs1JTo4swzQgamC4xY7Z71khyV9e4uUPPfTQKuspLf25UdS0Ym6T
         9Liaix/pkl+RC6MTxuzEwmUzVFtfGtMLboAcZwLExh4HIdduSRdRXjdzfdDjbFzd4JY5
         khpg==
X-Forwarded-Encrypted: i=1; AJvYcCWkYp/o79MrO2UfJyg2b4RRDLyxcfSizIOmfCnSjuuDBa5uf08ZrNaIbwZUUf8TiCKGpEbztQp0glSPYF7K43KR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8fh26l9vmJvKpDUOQqgeUnlEEzTTagZZtFpXeqLIglDSOU3WU
	q3BsT0z24K3YGclqnCboIekjKsTaPG1zjeSNoiU/+V6DMpmYSjULHcfT2pUL4OTyuIw=
X-Gm-Gg: ASbGnctvHdEH98NxAkxtkeVyl3d7edxD2yeLVNiCQM5U6346dYuhFKyj+fnT6VrVXb/
	7F4b5/UlByKUFOSDMINSPUU0cl888U5s9YFpyiMHe9igYA+XYBYvFMldhlj3fdc+en+eknSf8Iz
	W52KEsqhunTlCGYy3BByrA/RvzhFrhkLoMC05URjFl56wFMimj1vqk75wEnf7Vm2vFUDNvQlkpY
	e4SbpO8CMwL3wO9j8EsRQCQ6UzQ2IX4eSnDeDhY5W42TwYdrY7VLTxl4zmmeDvgZZ8YbxNasy7U
	xlbKJBjuTKdh2na5Io4JwaN6mgFK6M36snzEGD2YmAl8RQY2BVpp2Y+5CuZqLH3v0ulo/2zOmcF
	8oe8BQegc/jczrArrnXg6brwbDDv0Pro=
X-Google-Smtp-Source: AGHT+IEmhgCH3sUPlRQKMy5XutR0hjOQQ3uuBSZbxPWNovm+H+RQwCI0Zz7MCSmSQKcPnEjwUEs0SA==
X-Received: by 2002:a05:6402:2348:b0:61c:8fe9:9423 with SMTP id 4fb4d7f45d1cf-6237edb2f15mr8247367a12.17.1757336670479;
        Mon, 08 Sep 2025 06:04:30 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc575b94sm21301716a12.53.2025.09.08.06.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 06:04:29 -0700 (PDT)
Message-ID: <83301c1e-9e6d-4bbe-ac76-db6ce7ec670e@tuxon.dev>
Date: Mon, 8 Sep 2025 16:04:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-6-claudiu.beznea.uj@bp.renesas.com>
 <ddxayjj5wcuuish4kvyluzrujkes5seo7zlusmomyjfjcgzcyj@xe3zzzmy2zaj>
 <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev>
 <zsgncwvhykw4ja3bbqaxwupppjsqq4pcrdgrsduahokmt72xsm@twekpse6uzzh>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <zsgncwvhykw4ja3bbqaxwupppjsqq4pcrdgrsduahokmt72xsm@twekpse6uzzh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_060432_977587_82C42C4E 
X-CRM114-Status: GOOD (  32.44  )
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

Hi, Manivannan,

Apologies for the late reply, I've been off for a while.

On 8/31/25 07:07, Manivannan Sadhasivam wrote:
> On Sat, Aug 30, 2025 at 02:22:45PM GMT, Claudiu Beznea wrote:
>>
>>
>> On 30.08.2025 09:59, Manivannan Sadhasivam wrote:
>>> On Fri, Jul 04, 2025 at 07:14:05PM GMT, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>>> only as a root complex, with a single-lane (x1) configuration. The
>>>> controller includes Type 1 configuration registers, as well as IP
>>>> specific registers (called AXI registers) required for various adjustments.
>>>>
>>>> Hardware manual can be downloaded from the address in the "Link" section.
>>>> The following steps should be followed to access the manual:
>>>> 1/ Click the "User Manual" button
>>>> 2/ Click "Confirm"; this will start downloading an archive
>>>> 3/ Open the downloaded archive
>>>> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
>>>> 5/ Open the file r01uh1014ej*-rzg3s.pdf
>>>>
>>>> Link: https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12
>>>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>
>>>
>>> [...]
>>>
>>>> +static bool rzg3s_pcie_child_issue_request(struct rzg3s_pcie_host *host)
>>>> +{
>>>> +	u32 val;
>>>> +	int ret;
>>>> +
>>>> +	rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_REQISS,
>>>> +			       RZG3S_PCI_REQISS_REQ_ISSUE,
>>>> +			       RZG3S_PCI_REQISS_REQ_ISSUE);
>>>> +	ret = readl_poll_timeout_atomic(host->axi + RZG3S_PCI_REQISS, val,
>>>> +					!(val & RZG3S_PCI_REQISS_REQ_ISSUE),
>>>> +					5, RZG3S_REQ_ISSUE_TIMEOUT_US);
>>>> +
>>>> +	return !!ret || (val & RZG3S_PCI_REQISS_MOR_STATUS);
>>>
>>> You don't need to do !!ret as the C11 standard guarantees that any scalar type
>>> stored as bool will have the value of 0 or 1.
>>
>> OK, will drop it anyway as suggested in another thread.
>>
>>>
>>>> +}
>>>> +
>>>
>>> [...]
>>>
>>>> +static void __iomem *rzg3s_pcie_root_map_bus(struct pci_bus *bus,
>>>> +					     unsigned int devfn,
>>>> +					     int where)
>>>> +{
>>>> +	struct rzg3s_pcie_host *host = bus->sysdata;
>>>> +
>>>> +	if (devfn)
>>>> +		return NULL;
>>>
>>> Is it really possible to have devfn as non-zero for a root bus?
>>
>> I will drop it.
>>
>>>
>>>> +
>>>> +	return host->pcie + where;
>>>> +}
>>>> +
>>>
>>> [...]
>>>
>>>> +static int rzg3s_pcie_msi_setup(struct rzg3s_pcie_host *host)
>>>> +{
>>>> +	size_t size = RZG3S_PCI_MSI_INT_NR * sizeof(u32);
>>>> +	struct rzg3s_pcie_msi *msi = &host->msi;
>>>> +	struct device *dev = host->dev;
>>>> +	int id, ret;
>>>> +
>>>> +	msi->pages = __get_free_pages(GFP_KERNEL | GFP_DMA, 0);
>>>> +	if (!msi->pages)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	msi->dma_addr = dma_map_single(dev, (void *)msi->pages, size * 2,
>>>> +				       DMA_BIDIRECTIONAL);
>>>> +	if (dma_mapping_error(dev, msi->dma_addr)) {
>>>> +		ret = -ENOMEM;
>>>> +		goto free_pages;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * According to the RZ/G3S HW manual (Rev.1.10, section 34.4.5.2 Setting
>>>> +	 * the MSI Window) the MSI window need to be within any AXI window. Find
>>>> +	 * an AXI window to setup the MSI window.
>>>
>>> Are you really finding the AXI window or just making sure that the MSI window
>>> falls into one of the AXI window?
>>
>> I'm making sure the MSI windows falls into one of the enabled AXI windows.
>>
> 
> Then you need to reword the comment as such. Currently, it is not clear.

OK

> 
>>>
>>> And I believe it is OK to have more than one MSI window within an AXI window.
>>
>> This IP supports a single MSI window that need to fit into one of the
>> enabled AXI windows.
>>
> 
> [...]
> 
>>>> +
>>>> +	/* Update vendor ID and device ID */
>>>
>>> Are you really updating it or setting it? If you are updating it, are the
>>> default IDs invalid?
>>
>> Default IDs are valid (at least on RZ/G3S) but Renesas specific. Renesas
>> wants to let individual users to set their own IDs.
>>
> 
> So they are optional then? But the binding treats them as required, which should
> be changed if the default IDs are valid.

On RZ/G3S the default IDs are valid. On other SoCs that will be using this
driver (e.g. RZ/G3E) the default IDs are not valid.

These were marked as required as Renesas wants them to be set by the
company that manufactures the end product itself.


> 
>>>
>>>> +	writew(host->vendor_id, host->pcie + PCI_VENDOR_ID);
>>>> +	writew(host->device_id, host->pcie + PCI_DEVICE_ID);
>>>> +
>>>> +	/* HW manual recommends to write 0xffffffff on initialization */
>>>> +	writel(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
>>>> +	writel(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
>>>> +
>>>> +	/* Update bus info. */
>>>> +	writeb(primary_bus, host->pcie + PCI_PRIMARY_BUS);
>>>> +	writeb(secondary_bus, host->pcie + PCI_SECONDARY_BUS);
>>>> +	writeb(subordinate_bus, host->pcie + PCI_SUBORDINATE_BUS);
>>>> +
>>>> +	/* Disable access control to the CFGU */
>>>> +	writel(0, host->axi + RZG3S_PCI_PERM);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>
>>> [...]
>>>
>>>> +static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host, bool probe)
>>>> +{
>>>> +	u32 val;
>>>> +	int ret;
>>>> +
>>>> +	/* Initialize the PCIe related registers */
>>>> +	ret = rzg3s_pcie_config_init(host);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Initialize the interrupts */
>>>> +	rzg3s_pcie_irq_init(host);
>>>> +
>>>> +	ret = reset_control_bulk_deassert(host->data->num_cfg_resets,
>>>> +					  host->cfg_resets);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Wait for link up */
>>>> +	ret = readl_poll_timeout(host->axi + RZG3S_PCI_PCSTAT1, val,
>>>> +				 !(val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS),
>>>> +				 PCIE_LINK_WAIT_SLEEP_MS,
>>>> +				 PCIE_LINK_WAIT_SLEEP_MS *
>>>> +				 PCIE_LINK_WAIT_MAX_RETRIES * MILLI);
>>>> +	if (ret) {
>>>> +		reset_control_bulk_assert(host->data->num_cfg_resets,
>>>> +					  host->cfg_resets);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	val = readl(host->axi + RZG3S_PCI_PCSTAT2);
>>>> +	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
>>>> +
>>>> +	val = FIELD_GET(RZG3S_PCI_PCSTAT2_STATE_RX_DETECT, val);
>>>> +	dev_info(host->dev, "PCIe x%d: link up\n", hweight32(val));
>>>> +
>>>> +	if (probe) {
>>>> +		ret = devm_add_action_or_reset(host->dev,
>>>> +					       rzg3s_pcie_cfg_resets_action,
>>>> +					       host);
>>>
>>> Oh well, this gets ugly. Now the devm_add_action_or_reset() is sprinkled
>>> throughout the driver :/
>>>
>>> As I said earlier, there are concerns in unloading the driver if it implements
>>> an irqchip. So if you change the module_platform_driver() to
>>> builtin_platform_driver() for this driver, these devm_add_action_or_reset()
>>> calls become unused.
>>
>> They can still be useful in case the probe fails. As the initialization
>> path is complicated, having actions or resets looks to me that makes the
>> code cleaner as the rest of devm_* helpers.
>>
>> I can drop it and replace with gotos and dedicated functions but this will
>> complicate the code, AFAICT.
>>
>> Please let me know how would you like me to proceed.
>>
> 
> It is generally preferred to cleanup the resources in err path using goto
> labels.

Just to be sure I'll prepare the next version with something that was
requested: would you like to have goto lables on this driver?

I kept it like this as I considered the code is simpler.

Thank you,
Claudiu

