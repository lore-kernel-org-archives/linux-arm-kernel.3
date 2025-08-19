Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D799DCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 16:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5/JMhWo4ZzMPAZvRSmDPpdAXcoSjfAWCTz8Sm3x4C4=; b=irP3UGQEjbxmvpMFqlACJwA+HG
	9m2NCfziclnDWkUcpoqwqE7fnLLhZJGBISpFQDVCwEj/274JQMqPpx8W5lTqu1EIDOwtCjhN6VIbk
	PJ7secrVZ4i0yOmKd7220vhl2YkbUYQCQJhOY1OLv+ornaLHyyAMBPqKfpkmQYfA40HrA8sf8In4Z
	cXqRU7IA75Z2v8z8sgVzb1UG3KaSB9hEyBcAOuOnLsCEwi46S2v9h28QAvEhvpzG6WYWY7XiNxCYC
	D8UTDA8U8MMMoF7nglsFKxtVNvHsgFJO/XF3Yw+JTCpvkSvbfHlPglJGC05lkfy3pacDD8ovhPYuG
	QAcd+r3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOwF-0000000Az6Q-3tnf;
	Tue, 19 Aug 2025 16:11:56 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoM0k-0000000AWQb-14z4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:04:23 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JCSGSN012057;
	Tue, 19 Aug 2025 15:04:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	B5/JMhWo4ZzMPAZvRSmDPpdAXcoSjfAWCTz8Sm3x4C4=; b=FyPgthmiWo9+DudW
	GJ90H1/03fOgkzJIK383NJue+3iyW/7dzMWaBLvnqOp2jgPSnqF4pRVNUWa5HaGu
	s83UOWm/+9ykVM9Px3t64MMLgB6rB6NkuEqeNLK4UPFh3BEzJ//i/M4I81TF6MOe
	nu9FO1LKGQULP97HOC7LMLI2OGJ0ugA6H5luk7GykeooXveXCSq0+s+X0crxLKLB
	w5Tbt3e1Iqx8LS/ZA5vYI/rIpODn2DgtZ/cB0I+NxBPaMyrZCrdir6UCHDyGc+pY
	jHzwabQtXB8zbvudu7H0VJAMA28qnwtO67nbF0SibXTfmX4sps+Yr+JfCxWIg0zZ
	goxU8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48jhb1u2k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 15:04:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0225940045;
	Tue, 19 Aug 2025 15:02:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4A80727AF0;
	Tue, 19 Aug 2025 15:01:04 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 15:01:03 +0200
Message-ID: <8ac3ad85-9ab8-4044-9118-69dd78333c45@foss.st.com>
Date: Tue, 19 Aug 2025 15:01:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/9] PCI: stm32: Add PCIe host support for STM32MP25
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <p.zabel@pengutronix.de>,
        <johan+linaro@kernel.org>, <cassel@kernel.org>,
        <shradha.t@samsung.com>, <thippeswamy.havalige@amd.com>,
        <quic_schintav@quicinc.com>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>
References: <20250818230640.GA560877@bhelgaas>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250818230640.GA560877@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_060422_592624_FA6EC1AE 
X-CRM114-Status: GOOD (  30.70  )
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



On 8/19/25 01:06, Bjorn Helgaas wrote:
> [+cc Linus]
> 
> On Mon, Aug 18, 2025 at 12:50:19PM +0200, Christian Bruel wrote:
>> On 8/13/25 21:29, Bjorn Helgaas wrote:
>>> On Tue, Jun 10, 2025 at 11:07:07AM +0200, Christian Bruel wrote:
>>>> Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
>>>> controller based on the DesignWare PCIe core.
>>>> ...
> 
>>>> +static int stm32_pcie_resume_noirq(struct device *dev)
>>>> +{
>>>> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
>>>> +	int ret;
>>>> +
>>>> +	/*
>>>> +	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
>>>> +	 * thus if no device is present, must force it low with an init pinmux
>>>> +	 * to be able to access the DBI registers.
>>>
>>> What happens on initial probe if no device is present?  I assume we
>>> access DBI registers in the dw_pcie_host_init() path, and it seems
>>> like we'd have the same issue with DBI not being accessible when no
>>> device is present.
>>
>> Correct, same issue. The magic happens with the PINCTRL init state that is
>> automatically called before probe. As I tried to explain in the
>> Documentation in the pinctrl patch:
>>
>> - if ``init`` and ``default`` are defined in the device tree, the "init"
>>    state is selected before the driver probe and the "default" state is
>>    selected after the driver probe.
> 
> OK, thanks for that reminder!
> 
> The fact that the pinctrl init state is set implicitly before .probe(),
> but we have to do it explicitly in .stm32_pcie_resume_noirq() seems a
> *little* bit weird and makes the driver harder to review.  But ... I
> guess that's out of scope for this series.
> 
> I see that Linus has given his approval to merge the new
> pinctrl_pm_select_init_state() along with this series.  Would you mind
> pulling those changes [1] and the use [2] into a v13 of this series?
> That way I won't have to collect up all the pieces and risk missing
> something.

sure, I will rebase and re-spin with squashed last bits.

> 
> BTW, I noticed a s/platformm/platform/ typo in the "[PATCH v1 2/2]
> pinctrl: Add pinctrl_pm_select_init_state helper function" patch.

thank you,

> 
>>>> +	if (!IS_ERR(dev->pins->init_state))
>>>> +		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
>>>> +	else
>>>> +		ret = pinctrl_pm_select_default_state(dev);
>>>> +
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
>>>> +		return ret;
>>>> +	}
> 
>>>> +static int stm32_add_pcie_port(struct stm32_pcie *stm32_pcie)
>>>> +{
>>>> +	struct device *dev = stm32_pcie->pci.dev;
>>>> +	unsigned int wake_irq;
>>>> +	int ret;
>>>> +
>>>> +	/* Start to enable resources with PERST# asserted */
>>>
>>> I guess if device tree doesn't describe PERST#, we assume PERST# is
>>> actually *deasserted* already at this point (because
>>> stm32_pcie_deassert_perst() does nothing other than the delay)?
>>
>> yes, this also implies that PV is stable
> 
> Maybe we could update the comment somehow?  Or maybe even just remove
> it, since we actually don't know the state of PERST# at this point?


> 
> It sounds like we don't know the PERST# state until after we call
> stm32_pcie_deassert_perst() 

If perst_gpio is defined in the DT, PERST# is asserted (GPIOD_OUT_HIGH) 
in stm32_pcie_parse_port().
If it is not, we must assume PERST# was already started de-asserted from 
the environment along with the REFCLK

So locally I agree, we don't know the PERST# state.
I will remove this useless ambiguous comment

Christian

> 
>>>> +	ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = phy_init(stm32_pcie->phy);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>>>> +				 STM32MP25_PCIECR_TYPE_MASK,
>>>> +				 STM32MP25_PCIECR_RC);
>>>> +	if (ret)
>>>> +		goto err_phy_exit;
>>>> +
>>>> +	stm32_pcie_deassert_perst(stm32_pcie);
> 
> Bjorn
> 
> [1] https://lore.kernel.org/r/20250813081139.93201-1-christian.bruel@foss.st.com
> [2] https://lore.kernel.org/r/20250813115319.212721-1-christian.bruel@foss.st.com
> 


