Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169C9E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 13:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwOpMaW2es02J1yfBmzoVz6Jv19EkUC2xX3SDPzEuqM=; b=vzIFw94cOopeFP69YfFO5m2ptH
	NTLWu1n3oeiVqXaiGH1d3PFvYsyvST9CfXJzJ6/zjoiyC8g3eiTm9g0VoXNfbTu4/tmyWNeW/iU+m
	M5dP0Od5Dg4569alRoX0cR+iGmoNk46L8VToMMJL762wygaG9M6LGA+uaYbEvdf7sHPvhvkCHdFNW
	NQMb5MM6Yuv1XfeLe4Hb6DLYctbsqoPsL+An5oyl2g6Zj9EpE03cOE+wG9LAlGZunMYbpmv53zLzb
	b/XW25XOuhLNJ9G7F1CbX556sRw+3CM2j6YHO2Q3f+2oXmTSBowAlKvmKNpOO8p1Vfeh7CuwfGkFC
	9LwsfryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBgJ-0000000G58s-1a59;
	Thu, 05 Dec 2024 13:14:11 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAO8-0000000Fnmt-1gFU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:51:22 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5ANMBj026590;
	Thu, 5 Dec 2024 12:50:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	DwOpMaW2es02J1yfBmzoVz6Jv19EkUC2xX3SDPzEuqM=; b=Joc3kW/FpGpozv/F
	49MXK1F3AUIaGDlU0HmQlEy2tYgzNNZdBeXQwaWuNtio/g6MPlb4ftsBGiwKbi8E
	6FL8hx/WN1hSMIBcxw3kOfykVoKfFxh/z9PAHBqKD+qqyA4uYJLW9md83bGqqOlm
	+cqsp8LW61JlT6RSyF/jNRr0cQoh+9TiCv0NYStWxoUYOF5KQOT27dJk8xXfSMHu
	gZnujWyBv9FKpQc8K9QeS4IwlJN7Ctxvb1torK6Y7SesS3Uqox0dODmK4ngz7xuH
	MSsNpC4o4X6lUb4XAD+oxtUGuMDRWhsrjG3aBrUfFK9VUM/51UsdKak7Mw7OyV14
	jtDQsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 438ehp4gjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 12:50:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 907B640044;
	Thu,  5 Dec 2024 12:49:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 454DE29BB01;
	Thu,  5 Dec 2024 12:46:38 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 5 Dec
 2024 12:46:37 +0100
Message-ID: <9340979e-8f0e-465b-a524-4ff315a9941d@foss.st.com>
Date: Thu, 5 Dec 2024 12:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH v2 2/5] PCI: stm32: Add PCIe host support for STM32MP25
To: Lucas Stach <l.stach@pengutronix.de>, Bjorn Helgaas <helgaas@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <cassel@kernel.org>,
        <quic_schintav@quicinc.com>, <fabrice.gasnier@foss.st.com>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241129205822.GA2772018@bhelgaas>
 <9ca967aea19d6c28327f3a9bb77e23f6245603e9.camel@pengutronix.de>
Content-Language: en-US
In-Reply-To: <9ca967aea19d6c28327f3a9bb77e23f6245603e9.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_035121_089006_0D5B49B8 
X-CRM114-Status: GOOD (  17.12  )
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

Hello Bjorn and Lucas,

On 11/29/24 22:18, Lucas Stach wrote:
> Am Freitag, dem 29.11.2024 um 14:58 -0600 schrieb Bjorn Helgaas:
>> [+to Rob, DMA mask question]
>>
>> On Tue, Nov 26, 2024 at 04:51:16PM +0100, Christian Bruel wrote:
>>> Add driver for the STM32MP25 SoC PCIe Gen2 controller based on the
>>> DesignWare PCIe core.
>>
>> Can you include the numeric rate, not just "gen2", so we don't have to
>> search for it?
>>
>>> +static int stm32_pcie_resume_noirq(struct device *dev)
>>> +{
>>> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
>>> +	struct dw_pcie *pci = stm32_pcie->pci;
>>> +	struct dw_pcie_rp *pp = &pci->pp;
>>> +	int ret;
>>> +
>>> +	/* init_state must be called first to force clk_req# gpio when no
>>> +	 * device is plugged.
>>> +	 */
>>
>> Use drivers/pci/ conventional comment style:
>>
>>    /*
>>     * text ...
>>     */
>>
>>> +static bool is_stm32_pcie_driver(struct device *dev)
>>> +{
>>> +	/* PCI bridge */
>>> +	dev = get_device(dev);
>>> +
>>> +	/* Platform driver */
>>> +	dev = get_device(dev->parent);
>>> +
>>> +	return (dev->driver == &stm32_pcie_driver.driver);
>>> +}
>>> +
>>> +/*
>>> + * DMA masters can only access the first 4GB of memory space,
>>> + * so we setup the bus DMA limit accordingly.
>>> + */
>>> +static int stm32_dma_limit(struct pci_dev *pdev, void *data)
>>> +{
>>> +	dev_dbg(&pdev->dev, "disabling DMA DAC for device");
>>> +
>>> +	pdev->dev.bus_dma_limit = DMA_BIT_MASK(32);
>>
>> I don't think this is the right way to do this.  Surely there's a way
>> to describe the DMA capability of the bridge once instead of iterating
>> over all the downstream devices?  This quirk can't work for hot-added
>> devices anyway.
>>

agree,

> This should simply be a dma-ranges property in the PCIe host controller
> DT node, which should describe the DMA address range limits for
> transactions passing through the host.

far better indeed, dma-ranges works like a charm

thanks,

> 
> Regards,
> Lucas
> 
>>> +	return 0;
>>> +}
>>> +
>>> +static void quirk_stm32_dma_mask(struct pci_dev *pci)
>>> +{
>>> +	struct pci_dev *root_port;
>>> +
>>> +	root_port = pcie_find_root_port(pci);
>>> +
>>> +	if (root_port && is_stm32_pcie_driver(root_port->dev.parent))
>>> +		pci_walk_bus(pci->bus, stm32_dma_limit, NULL);
>>> +}
>>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0x0550, quirk_stm32_dma_mask);
>>
> 

