Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9C3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xplZ6xEcU+DkYF8wzl/Jp0Ro9pXnhMJndHcBpcssC24=; b=TAqop1+ayPblpJOXRpXFsOzrUX
	+KSSWchNrijiiA7aW04CtZ5GCwRLTwH2+IxdW+SPTwijSAggHKdZgizcPReUTkPgwJiGChcnf8QE2
	b7OMkiQp8O3ezhzl6m+bTDaFh/I14BrlbOYRqXQiPjtp3epj6lSrjWIjU0raOyRFUS1TBCidlv7Mz
	YPijagUIZ587ZshaOZETSvATgQdfgLDIu4r3Qo0Ydtj/e1u79u2Qa1C2Rd0CL3xz42Gk1b7SDNczn
	sVsZouawCeUM9uOy6i9M63Gy2InjRHOKykDZ4ScKOoXuspcR4SftlDKSUQVqLiSJqCNAUhIrGioo4
	27gdP0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gMV-0000000Bhl5-2o85;
	Fri, 04 Apr 2025 12:41:31 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gKj-0000000BhUW-3P0K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 12:39:43 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534C4vUb020207;
	Fri, 4 Apr 2025 14:39:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xplZ6xEcU+DkYF8wzl/Jp0Ro9pXnhMJndHcBpcssC24=; b=gR9gGnxNRswbHnZe
	PZvH+BDoBIr3K3Z0Z2KVBA042OjzZXci0P9mnvtGmWIXPBnWJOrFO0i1L71rt0YI
	894O8dhomZvPu3RlSEj2UUWh1fTS69lAuJUZg22vwKuXyG2HGM30qYPpt6/prvdY
	qzmCntc4tXTaBwDefBq/QUakp8wDpxGn4PMLciP6NMDe2wA/U/J1Gvx+oFdbFmFy
	FJrjvsIz/oomgO9kaYUtspulfaegLXeo5ZryI0nWSWWEhMijzCN608WZQuigg9BP
	pj8zJF1lNrTbgxxQdPrlX6kb2HRxE+5Zn9H3ZNcuc2Dmfo5jMIDYE0/cmBtT37ix
	Ee5amw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45t2ck34bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 14:39:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9690C40082;
	Fri,  4 Apr 2025 14:37:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7D778F1FF3;
	Fri,  4 Apr 2025 14:34:24 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Apr
 2025 14:34:24 +0200
Message-ID: <1213dbfb-821a-4534-947b-acc4eac9da81@foss.st.com>
Date: Fri, 4 Apr 2025 14:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] irqchip/gic: Use 0x10000 offset to access GICC_DIR on
 STM32MP2
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@linutronix.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
 <20250403122805.1574086-3-christian.bruel@foss.st.com>
 <8734epyw17.wl-maz@kernel.org>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <8734epyw17.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_05,2025-04-03_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_053942_142549_73A8C66A 
X-CRM114-Status: GOOD (  20.25  )
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



On 4/3/25 19:50, Marc Zyngier wrote:
> On Thu, 03 Apr 2025 13:28:04 +0100,
> Christian Bruel <christian.bruel@foss.st.com> wrote:
>>
>> When GIC_4KNOT64K bit in the GIC configuration register is
>> 0 (64KB), address block is modified in such a way than only the
>> first 4KB of the GIC cpu interface are accessible with default
>> offsets.
>> With this bit mapping GICC_DIR register is accessible at
>> offset 0x10000 instead of 0x1000, thus remap accordingly
> 
> And I'm pretty sure the whole of the GICC range is correctly
> accessible at offset 0xF000, giving you the full 8kB you need. That's
> because each page of the GIC is aliased over two 64kB blocks, as per
> the integration guidelines so that MMU isolation can be provided on a
> 64kB boundary.

Thanks a lot for this explanation, indeed this works like a charm.

> 
> Funnily enough, all it takes is to adjust GICC region. You can either:
> 
> - make it 128kB wide, and the driver will take care of it (details in
>    gic_check_eoimode()). On one of my boxes that is similarly
>    configured, I get:
> 
>    [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>    [    0.000000] GIC: Adjusting CPU interface base to 0x00000000780af000
>    [    0.000000] Root IRQ handler: gic_handle_irq
>    [    0.000000] GIC: Using split EOI/Deactivate mode
> 
>    See below for what I expect to be the correct fix.
>    
> - make it 8kB wide from offset 0xF000.

I checked both and they work. I will go for the former to show real 8kB 
size to be exposed in the DT. And there are a few other platforms that
use this alias

> 
> Unless the ST HW folks have been even more creative, none of this
> overly complicated stuff should be necessary. Just describe the HW
> correctly.

I was unable to find this information in the GIC-400 trm 
(https://developer.arm.com/documentation/ddi0471/b/programmers-model/gic-400-register-map). 
Now I also prefer to use GICC alias at
offset 0xf000 as suggested rather than the quirk solution

thank you very much

Christian

> 
> 	M.
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index f3c6cdfd7008..97b7a7106a02 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -120,7 +120,7 @@ intc: interrupt-controller@4ac00000 {
>   		#address-cells = <1>;
>   		interrupt-controller;
>   		reg = <0x0 0x4ac10000 0x0 0x1000>,
> -		      <0x0 0x4ac20000 0x0 0x2000>,
> +		      <0x0 0x4ac20000 0x0 0x20000>,
>   		      <0x0 0x4ac40000 0x0 0x2000>,
>   		      <0x0 0x4ac60000 0x0 0x2000>;
>   	};
> 

