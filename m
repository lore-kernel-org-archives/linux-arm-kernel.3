Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B944C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Is/lUf519SvhSAvw9djyYliUzkcj4XugMaq+jBTWXA=; b=RuwwSqSCEtjde4aRm7dmSkqZga
	BSG/symzRP46e8SP3gaJGXFf/9HScXaO59LEiWIj1fiOkpPhMEBK8nta1GRtGrYp2PqaS9CP+7dwk
	4r6JNbr9cdLZU7PG1wZSJaKaib6z/OBdogboW/kb5mrSDv08WISNy2CD6Q5goAMsz7vwUeTIY8x/I
	xNKH08CvZFMBufFi+2tfgnn9qCwmOmYZsn5UIrlvxwubTV5nDAsgCb3OxcqwlG7S1FrZOxzC1FyN6
	gldHhJKhhNmY62IeIzjGDytoGirdVfsr2cR5v60Cw9/WTjYfUoeruyLrTa/0ZZ5u2jwcJrLkD5VnM
	UmtlCa1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGLZ-00000009JYe-47Et;
	Mon, 13 Jul 2026 13:05:21 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGLU-00000009JXI-02A3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:05:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gzN1z0lC4zKHMVG
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 21:04:39 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 374E040561
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 21:05:08 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgCXfSmC4lRqfjFcBA--.7903S2;
	Mon, 13 Jul 2026 21:05:08 +0800 (CST)
Message-ID: <3c684d7d-75ec-49dd-b735-174ec9385974@huaweicloud.com>
Date: Mon, 13 Jul 2026 21:05:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] irqchip/gic-v3-its: Fix leak in
 its_vpe_irq_domain_alloc()
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@kernel.org, jason@lakedaemon.net, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260702033050.1583-1-shikemeng@huaweicloud.com>
 <20260702033050.1583-4-shikemeng@huaweicloud.com>
 <87fr216nx2.wl-maz@kernel.org>
 <e3252259-64e1-4bcb-8082-0bd501233747@huaweicloud.com>
 <86ldbopl97.wl-maz@kernel.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <86ldbopl97.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgCXfSmC4lRqfjFcBA--.7903S2
X-Coremail-Antispam: 1UD129KBjvJXoWxArWrur4xZw47AryDtFy8AFb_yoW5Ww1fpF
	WrXasF9rZ7JFyjgwsF9w1kua45K3y7t3yjkayUC3W7ur1kCF9rCF18trW3ury0kr17J3W8
	Z3WFgFWruF4UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUylb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7IJmUUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060516_405255_670EF007 
X-CRM114-Status: GOOD (  17.15  )
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

在 2026/7/6 16:36:52, Marc Zyngier 写道:
> On Fri, 03 Jul 2026 02:44:53 +0100,
> Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>
>> 在 2026/7/3 6:12:57, Marc Zyngier 写道:
>>>> When its_irq_gic_domain_alloc() fails, the following
>>>> its_vpe_irq_domain_free() skips calling its_vep_teardown() for the
>>>> corresponding irq. Call its_vpe_teardown() when its_irq_gic_domain_alloc()
>>>> is failedto avoid the leak issue.
>>>>
>>>> Fixes: 7d75bbb4bc1ad ("irqchip/gic-v3-its: Add VPE irq domain allocation/teardown")
>>>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>>>> ---
>>>>  drivers/irqchip/irq-gic-v3-its.c | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>>>> index 3e4edcb64065..8968bedefdba 100644
>>>> --- a/drivers/irqchip/irq-gic-v3-its.c
>>>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>>>> @@ -4666,8 +4666,10 @@ static int its_vpe_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
>>>>  			break;
>>>>  		err = its_irq_gic_domain_alloc(domain, virq + i,
>>>>  					       vm->vpes[i]->vpe_db_lpi);
>>>> -		if (err)
>>>> +		if (err) {
>>>> +			its_vpe_teardown(vm->vpes[i]);
>>>>  			break;
>>>> +		}
>>> There is already a spot for error handling in this function, we don't
>>> need a second one.
>> When its_irq_gic_domain_alloc() fails at index i, its_vpe_init(vpes[i])
>> has already succeeded but the exisiting its_vpe_irq_domain_free(domain, virq, i)
>> only tears down VPEs with index [0, i - 1], so its_vpe_teardown(vpes[i]) is still
>> needed.
>> So I guess you mean we can increase index when its_irq_gic_domain_alloc() fails to
>> free the resource with existing error handling?
>> Please correct me if I'm miss anything.
> 
> What I mean is this.
> 
> 	M.
> 	
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index b57d81ad33a0a..4b1a3b497d7c4 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4674,8 +4674,10 @@ static int its_vpe_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
>  		irqd_set_resend_when_in_progress(irq_get_irq_data(virq + i));
>  	}
>  
> -	if (err)
> +	if (err) {
> +		its_vpe_teardown(vm->vpes[i]);
When its_vpe_init() fails, the error path calls its_vpe_teardown(vm->vpes[i]) on
an uninitialized vpe, which may cause a NULL dereference by access NULL vpt_page in
its_vpe_teardown(vm->vpes[i])->its_free_pending_table(vpe->vpt_page)->page_address(pt).

To reuse the existing spot, something like a flag to indicate whether its_vpe_init()
succeeded should be added. Maybe we can keep change of this patch which seems simpler.

Thanks,
Kemeng
>  		its_vpe_irq_domain_free(domain, virq, i);
> +	}
>  
>  	return err;
>  }
> 


