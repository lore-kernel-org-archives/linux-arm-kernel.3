Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01469CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 22:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLM5AUfns2hb2my8bJBgZg9LR+O4etaj8IVbPYQY7Rc=; b=zIKXfKzfGnSPWL6eKkWmDCmIOI
	AzEGjWnneCpI0AHmdJftNAZpZZvv3mi1D6PqXMoVrY0/MnO2pUthxEvGl2Nw4ZovHZteGVJ6tOFrI
	6FLwNHQJhoSxMYGocPKRxsr8/6Uu9Io3LdZc47H6AmcHc3ls6tzsDNWk6vxFeCZLOup3U4LfPsmcd
	NpTHaUsg2ws+S0KqKIiozWqurEps+FJgSL7EzDM1r/LaeqW1OAenVGkd7fAuLvD977p5OPEYZPaHC
	v0osMdRZQ7uixKVo4mKj6YO1eCG9jvFkMmJO0wnnrXlJ7LCJeBiE8n4mL2QfjkBNRjzwbme3brpyp
	BZarCuVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urkm4-00000003S7Y-0FfT;
	Thu, 28 Aug 2025 22:07:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uri06-00000002wRr-3ShY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 19:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DLM5AUfns2hb2my8bJBgZg9LR+O4etaj8IVbPYQY7Rc=; b=qQ30UnAoOblSsjne4FFpRJf3bB
	mqMXmaW6+hjMebaYa6gMrKE9zfZOPPKkbVA7NRIsNIkvVGxkVLHvm+gDhTh/h2qMshZ0mvGHI9Nef
	ktz4k/1mMjkqKm1lhSd+tsbt7SFtsaMFYenA/oikEbMf8qCnFjSKyxsu7UmJQp6z83X6RKfRNFeta
	1tA+6fJpXdds7Z4br2NihG6vVNGFaBPuIRIuX/K18XrHfg+C0wgzPBj02JFnrXXqGZTHZZHMq/Pts
	thWsRiIfw2af0C2anOo7S6U4NZE1IxI97d+nJJhO5MNgmoJNfqOJ0XmikVgN5fN2DWBU6uBcEd44Z
	Vb8NcFdQ==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uri02-00000002szJ-3UPm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 19:09:33 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHMa4r004299;
	Thu, 28 Aug 2025 21:09:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	DLM5AUfns2hb2my8bJBgZg9LR+O4etaj8IVbPYQY7Rc=; b=RhFTCNalC7NV3IWu
	xQpiT6P0FVLKeJXQW9GiLN0GG7LUh43kdqmlK4HiSLD9Ae0g/UkOuYn4cJ1KfzjX
	tJKXsbZtvrENSZV839CiopyHlwa3oekKuRBQYKlN+u+Kjik9ozXO08L97ESHwP+N
	4Q81SSH3sn7Aksh95UvJhGhPY0TVjHiuf2nAuONNPigFPhasS1vMFR/0HSX5cLLp
	SIQkooY9sAOgWTHTkkct52TZ25OLklFDZauAL8wZ0+xrOEzCktEHHidqR5XSLkZd
	dTXpT/3vXdRw4wJNFWHGFvaxDYglybIxKSZT87+JNZQ2UBMV2LL8OEC2oa1M1OZa
	svWbAw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qrkmuggq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 21:09:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1ADA04002D;
	Thu, 28 Aug 2025 21:07:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DE2276BE64;
	Thu, 28 Aug 2025 21:06:37 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 21:06:35 +0200
Message-ID: <0fbf4be0-af6e-4119-a838-e3fc9ab1fc9d@foss.st.com>
Date: Thu, 28 Aug 2025 21:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 06/11] PCI: stm32: Add PCIe Endpoint support for
 STM32MP25
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linus.walleij@linaro.org>,
        <corbet@lwn.net>, <p.zabel@pengutronix.de>, <shradha.t@samsung.com>,
        <mayank.rana@oss.qualcomm.com>, <namcao@linutronix.de>,
        <qiang.yu@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <inochiama@gmail.com>, <quic_schintav@quicinc.com>,
        <johan+linaro@kernel.org>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20250828172253.GA949714@bhelgaas>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250828172253.GA949714@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_200931_042058_4A635B34 
X-CRM114-Status: GOOD (  17.25  )
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



On 8/28/25 19:22, Bjorn Helgaas wrote:
> On Wed, Aug 20, 2025 at 09:54:06AM +0200, Christian Bruel wrote:
>> Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
>> controller based on the DesignWare PCIe core in endpoint mode.
>> ...
> 
>> +static int stm32_pcie_start_link(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +	int ret;
>> +
>> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
>> +		dev_dbg(pci->dev, "Link is already enabled\n");
>> +		return 0;
>> +	}
> 
> While looking at the "incorrectly reset" comment, I noticed
> stm32_pcie->link_status and wondered why it exists.  It looks like
> it's only used in stm32_pcie_start_link() and stm32_pcie_stop_link(),
> and I don't see similar tracking in other drivers.
> 
> It feels a little racy because the link might go down for reasons
> other than calling stm32_pcie_stop_link().

I think that as an excess of paranoid that was meant to protect against 
a driver unbind when the link hasn’t started yet. In that case, 
stm32_pcie_remove() would disable a link that’s already disabled.

But that shouldn’t be a problem to disable twice the ltssm enable bit, 
as well as the perst irq. I’ll look into removing it. Is it okay if I do 
this with a fixup patch?

thank you
Christian


> 
>> +	dev_dbg(pci->dev, "Enable link\n");
>> +
>> +	ret = stm32_pcie_enable_link(pci);
>> +	if (ret) {
>> +		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	enable_irq(stm32_pcie->perst_irq);
>> +
>> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_ENABLED;
>> +
>> +	return 0;
>> +}
>> +
>> +static void stm32_pcie_stop_link(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +
>> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_DISABLED) {
>> +		dev_dbg(pci->dev, "Link is already disabled\n");
>> +		return;
>> +	}
>> +
>> +	dev_dbg(pci->dev, "Disable link\n");
>> +
>> +	disable_irq(stm32_pcie->perst_irq);
>> +
>> +	stm32_pcie_disable_link(pci);
>> +
>> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_DISABLED;
>> +}


