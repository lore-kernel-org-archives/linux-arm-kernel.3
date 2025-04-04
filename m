Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9283C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NKt9MGk7ZEOtW9yl+h4WTA3wA9CpVLn+mNMcHfKAhU=; b=ihym6m6rjdB5GABPEc0GJnEKDC
	dG94Fk3NkAsAogI5MHVHtRN/kf3S6RZCs+oNCErwGlk1oPvJPXex44RnXLLOJo20TEk9H3bLbzBHz
	xbqKPV6bBpQXdogAVdxyoBp8HRZOhUoas6206T9fT2WRgT16J97ZP61GtDDwxkCm0lUfgBvGJHaTY
	+RrQ+6hAsqlVrp83UKIq2ADMZwZR7UjTql7RT92x+sOOKGlCTjlYt6YHzEY5Cd7NoaW6xQLtsi+/F
	0aMiYf/lUv0ezdfSPHP7bz0JHMrw7sUp2al64/fzKsiKQJ7P0T+AAA58PyhfKImMRecg8uy4VA7+i
	H2t9AJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jrk-0000000CIO0-2qzd;
	Fri, 04 Apr 2025 16:26:00 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jmo-0000000CHjM-1VmN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 16:20:56 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534C4qNv029984;
	Fri, 4 Apr 2025 18:20:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1NKt9MGk7ZEOtW9yl+h4WTA3wA9CpVLn+mNMcHfKAhU=; b=IPxQ45rlu7+o8yi4
	P4i53sGBKbLIQeId/7GJJNo4duzK01pjiygyNrVSkEFNErmTGQWnepIKgiu1yFdX
	ui77G8b6N46xs1K4kkoylKxUISjZKFYqjabB5QqZI5i2LsW86hKRBHUUJiI2Cxst
	XeIUM+GBJk/4qtMDVtGk+djcIX/lE+2hvO6DWlcYPyh+Zr6JEC5bDuvqMY1E2b7R
	V0ufWH6OSmpVL7/pS7P2cJXwJUK2evuoeqUmLLCyVnpnqXyFTichVnxWlCmO0+v9
	/nvW4kWhtrB3ZrNJdhbBB0l8pfo/6WHV4bOxSgXYZ+VmekajmANSP2mR4CzecLm2
	/XSbLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45t2ct4368-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 18:20:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 85F5040053;
	Fri,  4 Apr 2025 18:19:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89DA09645B9;
	Fri,  4 Apr 2025 18:18:51 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Apr
 2025 18:18:50 +0200
Message-ID: <ddfc03e2-d4a6-460f-aafd-933019751dbf@foss.st.com>
Date: Fri, 4 Apr 2025 18:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
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
 <1213dbfb-821a-4534-947b-acc4eac9da81@foss.st.com>
 <87y0wgxd4j.wl-maz@kernel.org>
Content-Language: en-US
In-Reply-To: <87y0wgxd4j.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_07,2025-04-03_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_092055_071540_A1D94DA5 
X-CRM114-Status: GOOD (  21.04  )
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



On 4/4/25 15:36, Marc Zyngier wrote:
> On Fri, 04 Apr 2025 13:15:05 +0100,
> Christian Bruel <christian.bruel@foss.st.com> wrote:
>>
>>
>>
>> On 4/3/25 19:50, Marc Zyngier wrote:
>>> On Thu, 03 Apr 2025 13:28:04 +0100,
>>> Christian Bruel <christian.bruel@foss.st.com> wrote:
>>>>
>>>> When GIC_4KNOT64K bit in the GIC configuration register is
>>>> 0 (64KB), address block is modified in such a way than only the
>>>> first 4KB of the GIC cpu interface are accessible with default
>>>> offsets.
>>>> With this bit mapping GICC_DIR register is accessible at
>>>> offset 0x10000 instead of 0x1000, thus remap accordingly
>>>
>>> And I'm pretty sure the whole of the GICC range is correctly
>>> accessible at offset 0xF000, giving you the full 8kB you need. That's
>>> because each page of the GIC is aliased over two 64kB blocks, as per
>>> the integration guidelines so that MMU isolation can be provided on a
>>> 64kB boundary.
>>
>> Thanks a lot for this explanation, indeed this works like a charm.
>>
>>>
>>> Funnily enough, all it takes is to adjust GICC region. You can either:
>>>
>>> - make it 128kB wide, and the driver will take care of it (details in
>>>     gic_check_eoimode()). On one of my boxes that is similarly
>>>     configured, I get:
>>>
>>>     [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>>>     [    0.000000] GIC: Adjusting CPU interface base to 0x00000000780af000
>>>     [    0.000000] Root IRQ handler: gic_handle_irq
>>>     [    0.000000] GIC: Using split EOI/Deactivate mode
>>>
>>>     See below for what I expect to be the correct fix.
>>>     - make it 8kB wide from offset 0xF000.
>>
>> I checked both and they work. I will go for the former to show real
>> 8kB size to be exposed in the DT. And there are a few other
>> platforms that use this alias
> 
> I think 8kB the wrong option. The GIC *is* supposed to be integrated
> over 128kB on arm64 platforms (there was some documentation about that
> back in the days, but it has become impossible to search anything on
> ARM's stupidly broken website.  My recollection is that it was bundled
> with the GICv2m "specification" (only half a page!). >
> Furthermore, you are supposed to describe the HW. Not your
> interpretation of it. Correctly written SW targeting arm64 know about
> this anyway.

greping other platforms there are a bunch 0xf000 offset 8KB mapped:

  amd/amd-seattle-soc.dtsi
  arm/corstone1000.dtsi
  arm/foundation-v8-gicv3.dtsi
  arm/juno-base.dtsi
  mediatek/mt8516.dtsi

but, looking at the stm32mp25 memory map (1)

0x4AC22000 - 0x4AC3FFFF 120 Reserved -
0x4AC20000 - 0x4AC21FFF 8   GICC

I can know guess that the  Reserved 120kB is for aliasing the 64kB 
blocks. Thus describing the GICC range at 128kB makes sense

similarly 4 kB + 120 Reserved for GICH and 8kB + 120 Reserved for GICV

(1) 
https://www.st.com/resource/en/reference_manual/rm0457-stm32mp25xx-advanced-armbased-3264bit-mpus-stmicroelectronics.pdf


> 
>>> Unless the ST HW folks have been even more creative, none of this
>>> overly complicated stuff should be necessary. Just describe the HW
>>> correctly.
>>
>> I was unable to find this information in the GIC-400 trm
>> (https://developer.arm.com/documentation/ddi0471/b/programmers-model/gic-400-register-map). Now
>> I also prefer to use GICC alias at
>> offset 0xf000 as suggested rather than the quirk solution
> 
> Again, this isn't a quirk. It's the one true way for 64bit platforms
> that can use pages bigger than 4kB. That's the purpose of the 4Kn64K
> parameter in the integration, dropping bits [15:12] from the PA
> presented to the CPU interface.

sorry, misunderstanding, I was referring about my dropped quirk that I 
now dropped, not your options

thanks

Christian
> 
> 	M.
> 

