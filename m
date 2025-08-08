Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3293C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 08:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgvGE7BBMMWyp6fUkAvzt+QhcBC6Se8d1qUniQKfZMc=; b=zClB2DO6lj7xMgG+JBvuCrm4XS
	UpCT/iEAamlfO0rk+usREpsvU7xJnXFpb6Ib07HM75duYb2QNAAcIEDKDl7xAdA9ya/ACnlW7HIuc
	LfZfAkpPTgIAX+PrMrEnvureTlk3OKyIYtlvkjTadLFqR9sKMZdkR3YTMo8shq/Lqg7x9n3SFSGOx
	L9/llyrP8tUT+++wjGAVvDv5bnzZGGI0mibc0F404kLzLpkc++Hvf6W84hVxEDPs/BRgcj2HFosQD
	GEdVyC+4we6JDh8v2Ptn1XPyCma0HKy8ghxgj93hixIMqOjD7FmLECYMPFCaaAWQcNckY/pesWlEg
	+QkkYf4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIp2-00000002O7N-2vBY;
	Fri, 08 Aug 2025 08:51:32 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukImX-00000002Ne2-40B0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 08:48:59 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4byyLJ1mdzz2RW6V;
	Fri,  8 Aug 2025 16:46:16 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F37151402C6;
	Fri,  8 Aug 2025 16:48:49 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 Aug 2025 16:48:48 +0800
Message-ID: <3c754d4e-a2d9-4115-c105-2f199f26abc3@huawei.com>
Date: Fri, 8 Aug 2025 16:48:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7 22/31] irqchip/gic-v5: Add GICv5 LPI/IPI support
Content-Language: en-US
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
	<sascha.bischoff@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Peter Maydell
	<peter.maydell@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Slaby
	<jirislaby@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-pci@vger.kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
 <20250703-gicv5-host-v7-22-12e71f1b3528@kernel.org>
 <cc611dda-d1e4-4793-9bb2-0eaa47277584@huawei.com>
 <aJSvUWRqLEiARDIW@lpieralisi>
 <c8e3dc2c-617b-2988-10ff-88082370e787@huawei.com>
 <aJWzKqM9bHuKy+1m@lpieralisi>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aJWzKqM9bHuKy+1m@lpieralisi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_014858_154674_006488ED 
X-CRM114-Status: GOOD (  14.19  )
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



On 2025/8/8 16:19, Lorenzo Pieralisi wrote:
> On Fri, Aug 08, 2025 at 09:20:30AM +0800, Jinjie Ruan wrote:
>>
>>

[...]

>>
>> I also did not see any place in the code where these pointers are
>> accessed, nor did I see in section "L2_ISTE, Level 2 interrupt state
>> table entry" that L2_ISTE can be accessed by software. So, are these
>> states of the LPI interrupt maintained by the GIC hardware itself?
> 
> The IST table is where interrupt state and configuration is kept -
> it is managed by GIC IRS HW. SW controls interrupt configuration
> through GIC instructions.
> 
> It is therefore a false positive, I will send the patch below for
> inclusion.

Thank you for your explanation, I now have a general understanding of
how IST works.

> 
> Thanks,
> Lorenzo
> 
>>>
>>> -- >8 --
>>> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
>>> index ad1435a858a4..e8a576f66366 100644
>>> --- a/drivers/irqchip/irq-gic-v5-irs.c
>>> +++ b/drivers/irqchip/irq-gic-v5-irs.c
>>> @@ -5,6 +5,7 @@
>>>  
>>>  #define pr_fmt(fmt)	"GICv5 IRS: " fmt
>>>  
>>> +#include <linux/kmemleak.h>
>>>  #include <linux/log2.h>
>>>  #include <linux/of.h>
>>>  #include <linux/of_address.h>
>>> @@ -117,6 +118,7 @@ static int __init gicv5_irs_init_ist_linear(struct gicv5_irs_chip_data *irs_data
>>>  		kfree(ist);
>>>  		return ret;
>>>  	}
>>> +	kmemleak_ignore(ist);
>>>  
>>>  	return 0;
>>>  }
>>> @@ -232,6 +234,7 @@ int gicv5_irs_iste_alloc(const u32 lpi)
>>>  		kfree(l2ist);
>>>  		return ret;
>>>  	}
>>> +	kmemleak_ignore(l2ist);
>>>  
>>>  	/*
>>>  	 * Make sure we invalidate the cache line pulled before the IRS
>>>
> 

