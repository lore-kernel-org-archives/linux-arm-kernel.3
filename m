Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CD2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 12:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xl+nX529n8UyoO0y0l/TMia7BBc8N084qojjlS7Yf84=; b=uVO19DvsayHq2WEPZWmwggPiRX
	6LGLGHUZZTSvUXJvquog0pPVZ+sVphCTb68Te25dlGBhvkF5JucctVXaBK/Y8uFuy4/vZ3Pz7TG+I
	tQmvE9JeA9s/rLnRlNIqbfZQl695fyxgFLBYWYg4oFp29ogLKHUx872AgpHE1vHwTG7pnhF6YbiS/
	Dj31Caohx5F5aBiR0708AvvdbxXV1P9Q7lyEK7kLj8bS5AeF8JceQJMNduw85QIiEBNjGzlxuasfZ
	z2/DmT9HC6qlkWRA1yejni0o28GTnQRu29oWp4xX8sZSyRwN4uHN1cvTBT4e+mS+09PXFOiLjDo0n
	UAwLAEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfpI-00000008MZi-19Mt;
	Tue, 14 Jan 2025 12:15:20 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfo2-00000008MJ9-2V7a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 12:14:04 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EALNs7026707;
	Tue, 14 Jan 2025 13:13:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xl+nX529n8UyoO0y0l/TMia7BBc8N084qojjlS7Yf84=; b=kIy0G59JVkFMnw7y
	y783Or0jfu3+ENUvpX4ZGBPs66MxleRo9U0jfvLstvaBmEGHenA2oG8c7jj7fTAi
	0K/Nw8RWP58CA/1V+Uu1eJUSrBiFP2crZX84D64zBKKKq2putS+7vsQ7bJ1n4QSB
	pkvI9VRlwMoZIRAO27TdmxNEnPNIcgJlqsilw2inz2TdtvhDAEjvtcpYeYBmMI93
	ghLl8CGSwnrwQkmlyU8y1UwP7HTIvQoRYTufbPewdJ+71J8GzoaYLROmBuvC5Jf+
	GuBD1vOM6gIJM9Cu9tAbyzPD6KD8AoJaYl5O8GLrNYMkmrVAn5/19OgabbMNz0T8
	ZL0ldw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 445p3p0fjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 13:13:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A420B40045;
	Tue, 14 Jan 2025 13:12:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 44211298E15;
	Tue, 14 Jan 2025 13:10:54 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Jan
 2025 13:10:53 +0100
Message-ID: <092f5cd4-ff29-4a70-82ca-6044a72d5f11@foss.st.com>
Date: Tue, 14 Jan 2025 13:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] PCI: stm32: Add PCIe endpoint support for
 STM32MP25
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <cassel@kernel.org>,
        <quic_schintav@quicinc.com>, <fabrice.gasnier@foss.st.com>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241205172738.GA3054352@bhelgaas>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241205172738.GA3054352@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_041403_253109_5F7D1995 
X-CRM114-Status: GOOD (  22.10  )
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



On 12/5/24 18:27, Bjorn Helgaas wrote:
> On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:

>> +static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +	enum pci_barno bar;
>> +
>> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
>> +		dw_pcie_ep_reset_bar(pci, bar);
>> +
>> +	/* Defer Completion Requests until link started */
> 
> I asked about this before [1] but didn't finish the conversation.  My
> main point is that I think "Completion Request" is a misnomer.
> There's a "Configuration Request" and a "Completion," but no such
> thing as a "Completion Request."
> 
> Based on your previous response, I think this should say something
> like "respond to config requests with Request Retry Status (RRS) until
> we're prepared to handle them."
> 
>> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>> +			   STM32MP25_PCIECR_REQ_RETRY_EN,
>> +			   STM32MP25_PCIECR_REQ_RETRY_EN);
>> +}
>> +
>> +static int stm32_pcie_enable_link(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +	int ret;
>> +
>> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>> +			   STM32MP25_PCIECR_LTSSM_EN,
>> +			   STM32MP25_PCIECR_LTSSM_EN);
>> +
>> +	ret = dw_pcie_wait_for_link(pci);
>> +	if (ret)
>> +		return ret;
>> +
>> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>> +			   STM32MP25_PCIECR_REQ_RETRY_EN,
>> +			   0);
> 
> And I assume this means the endpoint will accept config requests and
> handle them normally instead of responding with RRS.
> 
> Strictly speaking this is a different condition than "the link is up"
> because the link must be up in order to even receive a config request.
> The purpose of RRS is for devices that need more initialization time
> after the link is up before they can respond to config requests.
> 
> The fact that the hardware provides this bit makes me think the
> designer anticipated that the link might come up before the rest of
> the device is fully initialized.

You are correct and I am unable to reproduce a scenario where this is 
still required.

Upon reviewing the history, I initially implemented this to address a 
dependency issue in the original code, where enable_link was invoked 
prematurely following the deassertion of PERST, as soon as the host was 
ready but before the device configuration space was initialized, so host 
enumeration was wrong.

Since then, the perst_irq is enabled by start_link. Consequently, the 
initialization, enable_link, and enumeration sequence is now correct

This bit is useless and can be dropped

Thank you for identifying it.

Christian

> 
> Bjorn
> 
> [1] https://lore.kernel.org/r/20241112203846.GA1856246@bhelgaas
> 

