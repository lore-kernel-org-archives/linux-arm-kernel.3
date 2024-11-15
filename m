Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E864D6DDEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 08:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hV7BxhQ3eifJYS/TNyu+Lmhdj2uo69md9n/Ratf2lvI=; b=2qLr8hbQwbJ6AKAtLllnb0r4v2
	xziCuGUJPz1OWkdDFLJ0mOxZyBmeoKsi1r1XVY+SGNCx+U+po1FuqcW5JkTcKxgwYvy255bBMIOh1
	vXzNVLQdPQ7Lsr+2o+ksaJ5FaoWx2+nYG0CWeKy8qHfFQJMQAYzYmMqvxx6entXsFFyz5wZ38qlyy
	i/PuITn4nkuYE6f6ECeWW6gRNxGvXs9sYo2nqkDeMncf5km8vOQdg7zez7PPwxY6rXOJ+PuTNbFSV
	gvf0C5j1xZs8DjQF/CYk5QDjPKnFSW2Q6H7kxfFgdiq2ULAPZHGYKMkgXdbtxH5r9H5CCS0YdQbUp
	n+G6IBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBrjP-000000022KM-1f6c;
	Fri, 15 Nov 2024 08:31:07 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBriT-0000000228e-0gqs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 08:30:10 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF80KYe008356;
	Fri, 15 Nov 2024 09:29:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	hV7BxhQ3eifJYS/TNyu+Lmhdj2uo69md9n/Ratf2lvI=; b=baiy+g4pS4xqJe22
	Z6PA5mWy2Cs7RSvM4GWc/IW5XjATX0WHk5aElMwUw/pwK9CpSSscsnc7jsM9CeyR
	QEq2GV4QxD8TyYOW181ziqZmw5yhaaKydrpjuzIVukdoM1LOLT0M00b6LSK7BYDs
	l0thJ4hekFeNA/SvfdvacMOkRUulYxED4boG5uqMuo4yk7hHl7HXMUpn0cIjjpwI
	+AeXVvV9dd+rpoicCf30pqcuLp99gFd68FH9DmP7HITTjjpB2UuzfThRd+DJ3TGQ
	/7eA1+kCT+AI7u9NVgv5359Vsk7melk4XVMB2WrFp7D29rfd+TjSf/eepa2oNHaZ
	DeVOwg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42whe9ukqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 09:29:48 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5632340053;
	Fri, 15 Nov 2024 09:28:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31155263566;
	Fri, 15 Nov 2024 09:27:14 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 15 Nov
 2024 09:27:13 +0100
Message-ID: <2b52093a-103f-4dd4-bb6d-c04dc9f68e98@foss.st.com>
Date: Fri, 15 Nov 2024 09:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex
 bindings
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
References: <20241112182809.GA1853254@bhelgaas>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241112182809.GA1853254@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_003009_702693_EECB5978 
X-CRM114-Status: GOOD (  13.38  )
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



On 11/12/24 19:28, Bjorn Helgaas wrote:
> On Tue, Nov 12, 2024 at 05:19:21PM +0100, Christian Bruel wrote:
>> Document the bindings for STM32MP25 PCIe Controller configured in
>> root complex mode.
>> Supports 4 legacy interrupts and MSI interrupts from the ARM
>> GICv2m controller.
>>
>> Allow tuning to change payload (default 128B) thanks to the
>> st,max-payload-size entry.
>> Can also limit the Maximum Read Request Size on downstream devices to the
>> minimum possible value between 128B and 256B.
>>
>> STM32 PCIE may be in a power domain which is the case for the STM32MP25
>> based boards.
>> Supports wake# from wake-gpios
> 
>> +  st,limit-mrrs:
>> +    description: If present limit downstream MRRS to 256B
>> +    type: boolean
>> +
>> +  st,max-payload-size:
>> +    description: Maximum Payload size to use
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [128, 256]
>> +    default: 128
> 
> MRRS and MPS are not specific to this device.  Not sure why you need
> them, but if you do need them, I think they should be generic.

Agree. On a second thought, this was to fix an old errata and can be 
dropped now, as well as the associated quirks.

Will re-post as generic if needed later on

thanks,

Christian

