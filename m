Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130D1C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WdoHNg8xzFLJxEL4fv90uErYqTslBGCXG3a5iCB0zM=; b=pcZt6C7tWrqMenRvUqcCc9D/k2
	m+bf13p4SxhIZGa7wjtj29uurGHyyWubKJmQreJQ7D5duYswAcrxFi05o/UEYTC6hHZEddmHgNClh
	9Bhkf5Hp74GVxMexecJDNDWlsQK713UXwFJwLjeBOS+HZ0kIUzGQVKZFz8rgk0J1NtrSJLxB5zKrn
	F+izeaKL+AOfGRZB91lk7YA7Q3jHnvC0DRihauJ5iSowPSsDq2Vx/m0Hn1uISgOssHfZFDM1MzUJ8
	KuOm7hIqhWBRL7Nl5BejPd3M1r/v4JsberwmYbMZvIL4wg7O5nb4zkl1eekrI6n0HqlfhZmUWjWvw
	i/EcNjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGr3-00000000F2p-12hF;
	Tue, 04 Feb 2025 11:12:33 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGpe-00000000EXG-3OdQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 11:11:12 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514B5lTL024169;
	Tue, 4 Feb 2025 12:10:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	0WdoHNg8xzFLJxEL4fv90uErYqTslBGCXG3a5iCB0zM=; b=t0CDFcQNm4sq4RLe
	P6QcQUvjxBtR+zTQdExTiv7FuDc7RvLNt/+W8EGtAt1qFm5873EFgc8OZl89rBvL
	J68jpJaul4J30+XlXHImIJu7M2yK/H2ZBBLgFWn5DrNxNH7RQZxMUwmjoXiCZ2D0
	qVLqXuY1pVFAmMslVEev4Pqt9iiOxZctFHgDd64Gp6hozOeCzX+HvIWfTph9s2Bo
	AQF4NZQ04/f2KCivFW9nq85GczPXDOrRDVFp9nHypemcXZU+r3eyjPIKMTOpopcl
	zDMG5kW0+v6/DRKcFINk4EchsCX7sDQk1VSLyWCRV3Q0upcQKPPTvOndDccL+pYK
	DhQXaw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44jwu3v5j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 12:10:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B0B314005A;
	Tue,  4 Feb 2025 12:09:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B78D92945D8;
	Tue,  4 Feb 2025 12:07:08 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 12:07:07 +0100
Message-ID: <3fa73c47-12af-46c3-8573-7d6800202e17@foss.st.com>
Date: Tue, 4 Feb 2025 12:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: PCI: Add STM32MP25 PCIe Root
 Complex bindings
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <jingoohan1@gmail.com>, <p.zabel@pengutronix.de>,
        <johan+linaro@kernel.org>, <quic_schintav@quicinc.com>,
        <cassel@kernel.org>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fabrice.gasnier@foss.st.com>
References: <20250128120745.334377-1-christian.bruel@foss.st.com>
 <20250128120745.334377-2-christian.bruel@foss.st.com>
 <20250202122527.ggy5ccz7o4umyhif@thinkpad>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250202122527.ggy5ccz7o4umyhif@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_05,2025-01-31_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_031107_451080_6127A916 
X-CRM114-Status: GOOD (  11.01  )
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



On 2/2/25 13:25, Manivannan Sadhasivam wrote:
> On Tue, Jan 28, 2025 at 01:07:36PM +0100, Christian Bruel wrote:
> 
> [...]
> 
>> +    pcie@48400000 {
>> +        compatible = "st,stm32mp25-pcie-rc";
>> +        device_type = "pci";
>> +        reg = <0x48400000 0x400000>,
>> +              <0x10000000 0x10000>;
>> +        reg-names = "dbi", "config";
>> +        #interrupt-cells = <1>;
>> +        interrupt-map-mask = <0 0 0 7>;
>> +        interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
>> +                        <0 0 0 2 &intc 0 0 GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
>> +                        <0 0 0 3 &intc 0 0 GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
>> +                        <0 0 0 4 &intc 0 0 GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        ranges = <0x01000000 0x0 0x00000000 0x10010000 0x0 0x10000>,
>> +                 <0x02000000 0x0 0x10020000 0x10020000 0x0 0x7fe0000>,
>> +                 <0x42000000 0x0 0x18000000 0x18000000 0x0 0x8000000>;
>> +        dma-ranges = <0x42000000 0x0 0x80000000 0x80000000 0x0 0x80000000>;
>> +        clocks = <&rcc CK_BUS_PCIE>;
>> +        resets = <&rcc PCIE_R>;
>> +        msi-parent = <&v2m0>;
>> +        wakeup-source;
> 
> Does this property really need to be present? If the WAKE# gpio is supported,
> isn't it implied that the RC is a wakeup source?
> 

the wakeup-source property is useless indeed with the wake_gpio, will 
remove,

thanks.

Christian

> - Mani
> 

