Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76FCCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ip9QVPCCouGenbqfjJ/NrcAKbR/S6x3OuiBOrCOdt+8=; b=RA4SJod9Ge69Eqmy0U9T+BqVKi
	hSRBk1u76l1w512b0m4BxKIwu8oKGhRe4TOCRIWmady+vTygR99AhCSlhRupCkn/nJhS2qxg4lxIn
	JS4YW3iarSocF2HmUv5/m1YFVroS2STe2BGExaSebJjkXr5ZOPdUVY0WwQyQ+Nu65/LwNv/Mbro5s
	jQ+cwN4KZx/FbHkPUTHgBzL6y5Q65IC+FHQ1EzWEbeTFDvebqG3ZjiQFFiLJk90C31vHNK2NPTW4D
	9LLuHv1+RcVCtWHoofmaMFO1EVc/C+3CT5JWC+2jY8XkKuFP5He8MFQi0f9sJSMdI8it7cxW8LMGX
	tVWnypCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1Xb-00000007b9J-2hLK;
	Thu, 21 May 2026 11:26:15 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1XV-00000007b7i-0PVu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 11:26:14 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260521112603euoutp01b60f3648273f92e018cf5bb8d6a06015~xkQFwDKSZ2908329083euoutp01a
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 11:26:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260521112603euoutp01b60f3648273f92e018cf5bb8d6a06015~xkQFwDKSZ2908329083euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779362763;
	bh=ip9QVPCCouGenbqfjJ/NrcAKbR/S6x3OuiBOrCOdt+8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rGkfJLYuajlTFpSd2JtaWBrNzsH1OdXbyQCSKIe2CqY8dbxhr+LmkLCIT2pRroGUu
	 312GPXnso0MJLRwhp3hPosxSD4eL1G3X4FtjTIAYZGZzIAsM8TitZkNzwsHcL2WfMQ
	 bD7yMOS2FBPScfpG8sZE0tTYx60pSRsbFA8wseF8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260521112602eucas1p22a4c1f32694ae09a4b568d20adb49ff1~xkQFcREV20311103111eucas1p2u;
	Thu, 21 May 2026 11:26:02 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260521112602eusmtip206dc41f961a36bb19b47f729d48a5644~xkQEvQqli0263802638eusmtip2e;
	Thu, 21 May 2026 11:26:02 +0000 (GMT)
Message-ID: <97f33a9d-5fdd-4766-aaff-d10d5f5fdf28@samsung.com>
Date: Thu, 21 May 2026 13:26:01 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] irqchip/exynos-combiner: switch to raw_spinlock
To: Thomas Gleixner <tglx@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
	Rostedt <rostedt@goodmis.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <87ecj5w2qf.ffs@tglx>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260521112602eucas1p22a4c1f32694ae09a4b568d20adb49ff1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109
X-EPHeader: CA
X-CMS-RootMailID: 20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109
References: <CGME20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109@eucas1p1.samsung.com>
	<20260520220422.3522908-1-m.szyprowski@samsung.com> <87ecj5w2qf.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_042609_728708_4D3DEBEA 
X-CRM114-Status: GOOD (  18.99  )
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

On 21.05.2026 11:06, Thomas Gleixner wrote:
> On Thu, May 21 2026 at 00:04, Marek Szyprowski wrote:
>> The exynos-combiner driver uses a regular spinlock to protect access to
>> the combiner interrupt status register in combiner_handle_cascade_irq(),
>> which is invoked in hard IRQ context as a chained interrupt handler.
>>
>> When PREEMPT_RT is enabled on ARM, regular spinlock is converted to a
>> sleeping lock (mutex-based), which must not be used in atomic context
>> such as hard interrupt handlers. Switch the irq_controller_lock to
>> raw_spinlock, which remains a true non-sleeping spinlock even under
>> PREEMPT_RT.
> Mechanically this makes sense, but out of curiosity I have to ask:
>
>> -static DEFINE_SPINLOCK(irq_controller_lock);
>> +static DEFINE_RAW_SPINLOCK(irq_controller_lock);
>>  
>>  struct combiner_chip_data {
>>  	unsigned int hwirq_offset;
>> @@ -72,9 +72,9 @@ static void combiner_handle_cascade_irq(struct irq_desc *desc)
>>  
>>  	chained_irq_enter(chip, desc);
>>  
>> -	spin_lock(&irq_controller_lock);
>> +	raw_spin_lock(&irq_controller_lock);
>>  	status = readl_relaxed(chip_data->base + COMBINER_INT_STATUS);
>> -	spin_unlock(&irq_controller_lock);
>> +	raw_spin_unlock(&irq_controller_lock);
> What is this lock actually protecting?
>
> Each combiner has it's own @base address, so there is no concurrency
> problem between two cascade interrupts being handled at the same time.
>
> That means the only possible problem would be that the same cascade
> interrupt is handled on two CPUs concurrently. Is that even possible?
Frankly speaking I did this conversion mechanically, late in the evening to fix
the bug warning I've spotted. Indeed this spinlock looks like a copy&paste or
development leftover. The only side-effect of it I see is a memory barrier,
which might affect how the register access happens, but this should not affect
cascade operation imho. Do You want me to send a patch removing it completely?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


