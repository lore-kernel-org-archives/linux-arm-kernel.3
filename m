Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A898E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gu2Vz8xpuhrUOAG06JEy41cILvsNVFpEmqGgn17RPI=; b=xD5RSa9MSC2CN3gcw3Ngks+WRN
	eAebwWCX8NW6/QH/A/zP6zNlDSM6UxsBbJBRz+k1k+6oypMd8rKbnaNG9Dv7sZIzksb4sGcIggKiA
	cZCt+DR/SqRYaBY9HCT90dM3JPgw/h3j0FFD5sLeya8Ll7qUgJXIOjwiB1B9QI9gVkUlKsT0yK+Ew
	8ZtGuxvyeVSA8bf9q7qMPQ/M+KtXai4CT5krEJnOoKmUtu9mwO7k0ba0kxnaBPyS9UdvhRBy8NWOM
	IEgTxukvYFE+bD7PkvVqUM+p0YpWDdl+EiR2DuZgoifrLfmnteHd9Dlabr0njz2rCUOvYx6IJVtVO
	p2Nkc2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCCo-0000000GDia-0qgd;
	Thu, 05 Dec 2024 13:47:46 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCAz-0000000GDER-2U07
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 13:45:55 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5AWiAB022747;
	Thu, 5 Dec 2024 14:45:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	9gu2Vz8xpuhrUOAG06JEy41cILvsNVFpEmqGgn17RPI=; b=hNJBtkMubMRskCIV
	tJ9kgNC+p/g/+EdpcNlmMkE3AV1339M2Z7QAJSn7FahTLfLY5QApK9kvQNA4lAPk
	RMuF0+Aiha0DVV8SzRvtTJIZu30TEUsO2JvNDo/qV3EbLAYHXpvarjk2KkG3g25k
	FE7608a6Eu/k911tngGm6ODPB28VOE8U2PfIqzK7tC9epIps0jaaLArm83vhGnNn
	R/LoSo2VFVZmq+SNylQXd9jL1Zbsuzk5nwzz+fio9f/wy6vmJXpJIjy0jAmUAGVa
	fukvaD9QzHR6q/vZQRDUxDkmLjTelasVnJQVyhAgRPiBioPbXhHq/91zwSmukUSG
	s7GVyQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 437tx2g7mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 14:45:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 94F6240047;
	Thu,  5 Dec 2024 14:44:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A014264FCA;
	Thu,  5 Dec 2024 14:41:27 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 5 Dec
 2024 14:41:26 +0100
Message-ID: <569904ad-2b70-4a58-98fe-4f24e1089e17@foss.st.com>
Date: Thu, 5 Dec 2024 14:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex
 bindings
To: Bjorn Helgaas <helgaas@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <bhelgaas@google.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <cassel@kernel.org>,
        <quic_schintav@quicinc.com>, <fabrice.gasnier@foss.st.com>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241203222515.GA2967814@bhelgaas>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241203222515.GA2967814@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_054553_939191_F54431F1 
X-CRM114-Status: GOOD (  17.80  )
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



On 12/3/24 23:25, Bjorn Helgaas wrote:
> On Tue, Nov 26, 2024 at 04:51:15PM +0100, Christian Bruel wrote:
>> Document the bindings for STM32MP25 PCIe Controller configured in
>> root complex mode.
>>
>> Supports 4 legacy interrupts and MSI interrupts from the ARM
>> GICv2m controller.
> 
> s/legacy/INTx/
> 
>> STM32 PCIe may be in a power domain which is the case for the STM32MP25
>> based boards.
>>
>> Supports wake# from wake-gpios
> 
> s/wake#/WAKE#/
> 
>> +  wake-gpios:
>> +    description: GPIO controlled connection to WAKE# input signal
> 
> I'm not a hardware guy, but this sounds like a GPIO that *reads*
> WAKE#, not controls it.

Rephrasing as
"GPIO used as WAKE# input signal" (output for the endpoint bindings)

> 
>> +    pcie@48400000 {
>> +        compatible = "st,stm32mp25-pcie-rc";
>> +        device_type = "pci";
>> +        num-lanes = <1>;
> 
> num-lanes applies to a Root Port, not to a Root Complex.  I know most
> bindings conflate Root Ports with the Root Complex, maybe because many
> of these controllers only support a single Root Port?
> 
> But are we ever going to separate these out?  I assume someday
> controllers will support multiple Root Ports and/or additional devices
> on the root bus, like RCiEPs, RCECs, etc., and we'll need per-RP phys,
> max-link-speed, num-lanes, reset-gpios, etc.
> 
> Seems like it would be to our benefit to split out the Root Ports when
> we can, even if the current hardware only supports one, so we can
> start untangling the code and data structures.

OK. and we support only 1 lane anyway, so drop it.

thanks,

> 
> Bjorn

