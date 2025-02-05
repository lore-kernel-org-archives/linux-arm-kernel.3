Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9B8C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDj3NqJSxEquaMNtZ7M6hmrY5ZBQE5yWhjVK5LOi0Tk=; b=sQbkrWuCO/FV9moJHRf2W7nTYG
	avPuHv6/sGrn55UxGuh5Q7QUcKN/yCiQHw/4kL4BDWQimxZo9eH2JJHlPARiAtHEHKBXyolGCtzKs
	Ji/K8OCsQ61nNEzp6giMgJzIgKhes62bmGdgIoIYrZNcJtVk02tOVIC++wGjPX6j+UoRpk9kEKPbH
	q2eJGzueDjOX5rshOsH69UqpSCpvd22SpMUsIqkVp4uNpCkQBJhdUOUzqpIhnRagx/06854XoGoMU
	qQUW9qMcsK6TTydz/l5W5xxksSLVjfsxWJcQ1N6ESq6P1kR4QXz2eJ2v/aP3aHl8G635SyVuYJakw
	3eDcKPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZ3p-00000002RCO-4ALi;
	Wed, 05 Feb 2025 06:38:58 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZ2T-00000002R42-3Avg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 06:37:35 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5156b6ZM3370991
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 00:37:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738737426;
	bh=FDj3NqJSxEquaMNtZ7M6hmrY5ZBQE5yWhjVK5LOi0Tk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HWdU2tAhy/eIeKiWybEdEbIdddG4YZopyKsnndlfQAMAnob/wynAFt+YVLs5uETIu
	 HA3qxpmyfSQhqEq+jTkOGzMcaXdi9kIYKNrkEClHgtsGnFxbxOPuJEcFVZ8DrvrYFw
	 pvBjkHmJFNunhZIXqwk5rY8szPWaeiDtJp00Emgg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5156b6uT039156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 00:37:06 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 00:37:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 00:37:06 -0600
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5156avhs100252;
	Wed, 5 Feb 2025 00:36:58 -0600
Message-ID: <3fac45a1-07fb-4332-9f49-6a08bd953855@ti.com>
Date: Wed, 5 Feb 2025 12:06:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Enable TISCI Interrupt Router and
 Aggregator
To: Nishanth Menon <nm@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <nfrayer@baylibre.com>,
        <glaroque@baylibre.com>, <tglx@linutronix.de>, <u-kumar1@ti.com>
References: <20250203150801.2399555-1-vaishnav.a@ti.com>
 <CAMuHMdUOMCxfsOrUF3-6PX0ZZ_E2g1SK4bwDqZE=mWiibPFt1A@mail.gmail.com>
 <20250205035148.krqvlysv73d4wcgs@uncooked>
Content-Language: en-US
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <20250205035148.krqvlysv73d4wcgs@uncooked>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_223733_898037_CE123F97 
X-CRM114-Status: GOOD (  20.49  )
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

Hi Geert, Nishanth,

On 05/02/25 09:21, Nishanth Menon wrote:
> On 08:42-20250204, Geert Uytterhoeven wrote:
>> Hi Vaishnav,
>>
>> Thanks for your patch!
>>
>> On Mon, 3 Feb 2025 at 16:08, Vaishnav Achath <vaishnav.a@ti.com> wrote:
>>> Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
>>> These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
>>> for core functionality like DMA, GPIO Interrupts which is necessary
>>> during boot, thus make them built-in.
>>>
>>> bloat-o-meter summary on vmlinux:
>>>          add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
>>>          ...
>>>          Total: Before=31615984, After=31778459, chg +0.51%
>>
>> My first thought was: that's a hefty size increase for two rather
>> small drivers!  So I enabled these two options in one of my own kernel
>> configs, and saw a size increase of only 7872 bytes...
>>
>>> Fixes: 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
>>> Fixes: b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
>>>
>>> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
>>> ---
>>>
>>> V1 : https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/
>>>
>>> V1->V2:
>>>          * Add Fixes tag.
>>>          * Add bloat-o-meter summary to commit message.
>>>
>>> Previously both of these configs were selected for ARCH_K3 in respective
>>> Kconfigs, but commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
>>> and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
>>> in dropped this recently without adding those back in arm64
>>> defconfig, this causes boot failure in all TI K3 platforms.
>>>
>>> Passing bootlog with configs enabled:
>>> https://gist.github.com/vaishnavachath/03d8d3ce0f22219643c2f4d1dd243fd1
>>>
>>>   arch/arm64/configs/defconfig | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index cb7da4415599..1f25423de383 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -1551,6 +1551,8 @@ CONFIG_PWM_VISCONTI=m
>>>   CONFIG_SL28CPLD_INTC=y
>>>   CONFIG_QCOM_PDC=y
>>>   CONFIG_QCOM_MPM=y
>>> +CONFIG_TI_SCI_INTR_IRQCHIP=y
>>> +CONFIG_TI_SCI_INTA_IRQCHIP=y
>>>   CONFIG_RESET_GPIO=m
>>>   CONFIG_RESET_IMX7=y
>>>   CONFIG_RESET_QCOM_AOSS=y
>>
>> However, on arm64 defconfig, this has indeed a much bigger impact,
>> as it also (re)enables several other drivers that depend on the
>> irqchip symbols.
>>
>> You probably want to mention that in the commit message...
> 
> Thanks Geert and I agree. This however just restores the status quo as
> it was in 6.13 tag kernel (and ofcourse the default boot status).
> 
> Will be good to mention that as well - in effect, we are just restoring
> the behavior, not introducing new features.
> 

Thank you for the feedback, I have sent a v3 with updated commit message 
mentioning the reason for size increase and that we are reinstating 
previous behavior, all the dependencies getting re-enabled were already 
part of the arm64 defconfig.

V3 - https://lore.kernel.org/all/20250205062229.3869081-1-vaishnav.a@ti.com/

Thanks and Regards,
Vaishnav

> Side note: We are still working towards fixing up other driver modules
> and some time in near future, hope to transition to initramfs boot as
> default in a single patch.. but till then let us maintain the status
> quo.
> 

