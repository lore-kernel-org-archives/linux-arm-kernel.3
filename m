Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEB0E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kctec1IakLdkid85JJe7ka3StnnXKgrFJuc3CqkCVzw=; b=1zDytkoflRmAnqMUHgOaX5jziv
	0JdR7cppJAwpRnEhCf6QMEYv7FrYDIFHdHdQePNvnka2N7VSIyicdktqMs4FM5DkGRiAScKsAKQcT
	oGasoUgx2yYpsSjJLy6lakJcojn/i93HSw0qEt/p1urT2Nw+J2XsUi/L/eJNLDBUPL8u4OPxvrjFa
	QB6zbI49pMwwU+S86fnnSSg96zqXwFsICkZ7Q7q43dEzkF33cJFXBZb957wzOEhAYVAofQEK1al8O
	tcwgJrGkzyqzo8rpCk59onfCGywHFEbNqloN8LgCh/ykfiAlTtBFizgCY6lDYy3hWCghivxvLLADu
	rAR8gxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrhu-0000000GLWj-1KYw;
	Wed, 18 Dec 2024 10:55:10 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqJ4-0000000G5FM-3JHJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:25:28 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI1mj20030214;
	Wed, 18 Dec 2024 10:25:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Kctec1IakLdkid85JJe7ka3StnnXKgrFJuc3CqkCVzw=; b=kklfGCuhaGpbh3pL
	gaLxTjfQ32SpgqRa86jF56tm6TgXF6mhnwV/9v0wLe+tNisdKsjFYQ0QFYqmvEf8
	Wj8NuaiaHOnow+x4JeWZ7so+Xv8WxqsGuMvRJidCR1OjqSmgPffkZT986X8I6FyE
	LvMh8LTFCsuF81hH/67nJ/xaxZd/o5U/YzZdvSnFdLdhs6W76ptJjRzRRFwcPuTg
	+bS0db4pK6tYoUhkmkTUDmCj7c63qFhXoUFw/rwlwivW3GtCJ3fag41iW38vG/MH
	VtK2gJhwRNCfP/KPqZJJRuE+SK/8GORYQYvyIHnuEFyvoRFDqTRFNdJuxqMPlQSo
	BxIdjw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43kn2b9ecj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:25:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 69BF740046;
	Wed, 18 Dec 2024 10:23:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2827025D3E9;
	Wed, 18 Dec 2024 10:21:51 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:21:49 +0100
Message-ID: <3f060b95-53c7-46b5-b65a-c594cd8d6050@foss.st.com>
Date: Wed, 18 Dec 2024 10:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] PCI: stm32: Add PCIe endpoint support for
 STM32MP25
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <lpieralisi@kernel.org>, <kw@linux.com>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <cassel@kernel.org>,
        <quic_schintav@quicinc.com>, <fabrice.gasnier@foss.st.com>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-5-christian.bruel@foss.st.com>
 <20241203152230.5mdrt27u5u5ecwcz@thinkpad>
 <4e257489-4d90-4e47-a4d9-a2444627c356@foss.st.com>
 <20241216161700.dtldi7fari6kafrr@thinkpad>
 <fdc487c4-cbdc-45ac-a79f-aff2b8ccafcc@foss.st.com>
 <20241218090834.bz5htywl3sjbzq6w@thinkpad>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241218090834.bz5htywl3sjbzq6w@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_012527_133478_BC6D7939 
X-CRM114-Status: GOOD (  16.51  )
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



On 12/18/24 10:08, Manivannan Sadhasivam wrote:
> On Tue, Dec 17, 2024 at 10:48:43AM +0100, Christian Bruel wrote:
>>
>>
>> On 12/16/24 17:17, Manivannan Sadhasivam wrote:
>>> On Mon, Dec 16, 2024 at 11:02:07AM +0100, Christian Bruel wrote:
>>>> Hi Manivanna,
>>>>
>>>> On 12/3/24 16:22, Manivannan Sadhasivam wrote:
>>>>> On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:
>>>>>
>>>>> [...]
>>>>>
>>>>>> +static int stm32_pcie_start_link(struct dw_pcie *pci)
>>>>>> +{
>>>>>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
>>>>>> +		dev_dbg(pci->dev, "Link is already enabled\n");
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +
>>>>>> +	ret = stm32_pcie_enable_link(pci);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>
>>>>> How the REFCLK is supplied to the endpoint? From host or generated locally?
>>>>
>>>>   From Host only, we don't support the separated clock model.
>>>>
>>>
>>> OK. So even without refclk you are still able to access the controller
>>> registers? So the controller CSRs should be accessible by separate local clock I
>>> believe.
>>>
>>> Anyhow, please add this limitation (refclk dependency from host) in commit
>>> message.
>>>
>>> [...]
>>>
>>>>>> +	ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
>>>>>
>>>>> Hmm, so PHY mode is common for both endpoint and host?
>>>>
>>>> Yes it is. We need to init the phy here because it is a clock source for the
>>>> PCIe core clk
>>>>
>>>
>>> Clock source? Is it coming directly to PCIe or through RCC? There is no direct
>>> clock representation from PHY to PCIe in DT binding.
>>
>> The core_clk is generated directly by the PLL in the COMBOPHY, gated by the
>> RCC
>>
> 
> In that case, phy should be the clock provider to RCC and PCIe should get the
> gated clock it.

ok, seems sensible.



> 
> - Mani
> 

