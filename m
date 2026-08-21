Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE5EC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UkEKODWVUl7535Xf1v2A9I+wflAocb22cq9dOH9pjM=; b=Lgwln55QlSDI0AqikNWJZNsR+W
	e/sRiuULrDimiZE3LHYItstSpoULY+Do3tK4t2ARDlvS9uWoWgHmNEIUSY+JqpWiiIVUkAjK/jBhd
	eoISXrzeGVuNatggjxkRQqUnbhco2CJ5JG3nUaNVZwGLamfQQiyN2/lsNhgFgI/MVdZ8nb74mgOye
	PufyrIJg0tYcoCe6fZdXGkyxMFusAxQCCC3xn3M+9Xg8Zo1yYj2bDonGh+9yqd1UmJ7k2JZKQ+3Bc
	G4ydeEedLWgqDflVlXCiuXmOdMtCzV2bM7/g2qqxPUs+bIjyBV4J8ztjMcv1d3pHGsAuZaLDg3DBb
	45gipNpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOtw-0000000DMai-2fJY;
	Fri, 21 Aug 2026 13:03:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOtt-0000000DMaN-2y8d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:03:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3F2A1476;
	Fri, 21 Aug 2026 06:03:07 -0700 (PDT)
Received: from [10.57.68.59] (unknown [10.57.68.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C97AB3F763;
	Fri, 21 Aug 2026 06:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787317391; bh=2X02zdI2Dc2RpWrQXCYiM/Wk0x9IzqlC8d+lHyBqFHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NhF1kKNPmwQvNNXz1mU7i0LEnxvLAqLGB42j+I+N/w20W1hIhFSnkglPRhjZ8UuvQ
	 8d3t00KhaOAhTB6USpCSO3CuIN7YrCtDITAi9Cff/CdEn2nmIduvX1g1aFiyAcofSO
	 eiak4GCnOox0YLI0Ncv8W4k28pYao5dqDcwhuAVk=
Message-ID: <18338c14-c7c0-433c-8a88-ba5624313c48@arm.com>
Date: Fri, 21 Aug 2026 14:03:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/45] arm64: Add support for FEAT_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <d594b97c-747d-41df-8f7c-563ea11974df@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <d594b97c-747d-41df-8f7c-563ea11974df@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_060313_911922_8A17FD42 
X-CRM114-Status: GOOD (  19.05  )
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

On 8/14/26 02:52, Jinjie Ruan wrote:
> 
> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>> FEAT_NMI provides an architected mechanism for supporting non-maskable
>> interrupts (NMIs) and less-masked interrupts (LMIs).
>>
>> Since we already support pseudo-NMIs via priority masking, introducing
>> another flavour of NMI on top of the existing infrastructure could
>> easily become messy, making the code harder to follow and reason
>> about.
>>
>> To avoid that, this series first makes room for the new NMI "tenant"
>> by restructuring the existing exception masking logic.
>>
>> The main idea is to separate the logical view of exception state from
>> its hardware representation. To achieve this, we introduce logical
>> exception contexts that can be mapped onto the corresponding hardware
>> state. This naturally consolidates the hardware-specific handling into
>> a small number of places, while allowing the rest of the code to
>> operate purely in terms of logical exception contexts.
>>
>> Since this restructuring is non-trivial and carries a risk of subtle
>> behavioural changes, the series adds extensive debug checks to verify
>> that the hardware state always matches the expected logical state.
>>
>> With this restructuring in place, wiring FEAT_NMI into the new
>> framework becomes much more manageable.
>>
>> This work would not have been possible without the contributions of
>> Ada Couprie Diaz, Mark Brown, and Lorenzo Pieralisi - please credit
>> them for everything that works well. Any remaining bugs or issues are
>> entirely my own.
>>
>> I'd especially appreciate feedback on the overall approach. Please
>> don't hesitate to bikeshed the naming or other details - improving
>> clarity is one of the main goals of this series. Of course, technical
>> review is more than welcome as well.
>>
>> The series would also benefit from extensive testing on real hardware
>> (without NMI, with pseudo-NMI, and with FEAT_NMI), as most of the
>> testing so far has been done on QEMU and Fast Model.
> Hi all,
> 
> Apart from gicv5, I have gone through the other patches. Apart from code
> style issues, patch split and certain specific implementation details, I
> don't see any major issues. I am very much looking forward to more
> reviews, discussions, and the next version.
> 

Thanks Jinjie! I really appreciate you taking the time to go through the series.

Cheers
Vladimir

> Best regards,
> Jinjie
> 

