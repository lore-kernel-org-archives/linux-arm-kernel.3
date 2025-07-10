Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493E2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5ZjyQ7fcMZjAROkYAzONVq5nvoucDwT2TJdOec8s3E=; b=hetyVGy5F4fiEh5+DUstxvbTHd
	Cso1i0dp4AGR9dAnUk1KQaJdStJevqvQR7Mm3Mcyz/BTa4nUpGTD3ZxCVgFcHDzxmMhS7XSY3VygL
	q3mKyYX23CQIyy+fUYAlBXaFXhGiBU+JqptepJUm7kMH389zjmfQX97HDPGipnmcy8+p+6jomnwWx
	M8HNIL8IRbyG/VOidZ0rbn5an0nbh7VMNEZC245npwsGPKPO8WGzcr0DZkYbaSITOokUq+XlvJvT5
	DGvvsV3gtWuGMSePE9Wg3UnmB62Svenf35isQZMFGynAJs/juY4/mJjkgBhLl01lDnXh7SPMyYa3B
	l3N1cGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu7q-0000000CQZT-3hx9;
	Thu, 10 Jul 2025 16:27:59 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZs0k-0000000C4sh-2ULz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 14:12:32 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ADjDNM019300;
	Thu, 10 Jul 2025 16:12:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	O5ZjyQ7fcMZjAROkYAzONVq5nvoucDwT2TJdOec8s3E=; b=rXXLgFMhk1ov1Kfb
	dTBEe6tPUeWMEyTgfS0G7zFjUM+QL0yg7etBY8ITbyxiDqeehrPFEFIabVnH/yx1
	qr8I2upEpkvHxqa6vgQenFp9tWWNaI0MwXGXi8QRPW3UoqzL6q52qYIHSlKpKc4F
	wUrfUNfw2SvnhcsY3LfChAtmNXnWJ5O+8jGGfjfmjwhdhedmiZdRmDzkpdS6m/UL
	zfdirhiA/S0NKY+G8uzZPOumn34Mnw6PwL76qDPyM8YSscSBTdQNCKLmqj4uWFLY
	031H+JPTMFXfD12CC0hDHTzVOeHA4hIa3G6QVyqnQfDg9w+TlB45QTaN7I1KpeKN
	JBH+cg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47qf0pxty6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 16:12:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA7F440044;
	Thu, 10 Jul 2025 16:11:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 002DFAF9A59;
	Thu, 10 Jul 2025 16:10:46 +0200 (CEST)
Received: from [10.48.86.182] (10.48.86.182) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 16:10:46 +0200
Message-ID: <6e44163a-eae3-49bb-8c05-32437d517451@foss.st.com>
Date: Thu, 10 Jul 2025 16:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: st: fix timer used for ticks
To: Marc Zyngier <maz@kernel.org>
CC: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250515151238.1.I85271ddb811a7cf73532fec90de7281cb24ce260@changeid>
 <86ikm2f0y2.wl-maz@kernel.org>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <86ikm2f0y2.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_03,2025-07-09_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_071231_122586_B19EDC09 
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

Hi Mark,

On 5/15/25 15:39, Marc Zyngier wrote:
> On Thu, 15 May 2025 14:12:39 +0100,
> Patrick Delaunay <patrick.delaunay@foss.st.com> wrote:
>> Remove always-on on generic ARM timer as the clock source provided by
>> STGEN is deactivated in low power mode, STOP1 by example.
>>
>> Fixes: 5d30d03aaf78 ("arm64: dts: st: introduce stm32mp25 SoCs family")
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> index 8d87865850a7..74c5f85b800f 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> @@ -150,7 +150,7 @@ timer {
>>   			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
>>   			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
>>   			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
>> -		always-on;
>> +		arm,no-tick-in-suspend;
> That's amusing, because these two properties literally describe
> opposite behaviours (from an optimisation to a HW bug).
>
> I'm also pretty sure 99% of the DTs in the tree that have the
> always-on property are wrong.

yes it was a bug in the initial device tree, detected when we implement

the low power support in STMicroelectronics downtream.


STGEN, the root source of ARM generic timer in STM32MP25 is stopped in

low power states.


>
>>   	};
>>   
>>   	soc@0 {
> I don't want to sound rude or anything, but the guy you Cc'd on an
> @arm.com will not reply (and hasn't been replying for almost 6 years).

your not rude and It is my error, sorry

I search email for "Marc Zyngier " in Linux source tree....

and I use a bad address.


For information, I upstream this patch after the remark on patch by 
Christian Bruel:

[PATCH 3/3] arm64: dts: st: add st,stm32mp2-cortex-a7-gic in intc node in stm32mp251.dtsi
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250403122805.1574086-4-christian.bruel@foss.st.com/

 >   While reviewing a DT patch of mine related to the 
interrupt-controller, I had the following

  >  comment from Marc Zyngier (GIC Maintainer) " Then while you're at 
it, you may want to

  >  consider removing the "always-on" property in the timer, because 
I'm pretty sure the

   > comparator goes down in low power mode on A53 and A35, and loses 
its value.

 >   In general, only VMs can make use of this property. "



>
> Thanks,
>
> 	M.
>

Thanks


