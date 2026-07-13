Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFB7C44508
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLrzXRU//S8WRey8WhK0HpLicfNB7g33o6vQ+hoAUdo=; b=gm18BJmtD/xG37csYs9JDn6/pc
	SxEDEt09uj0Sq5usV3FtrE49xMyABGoYInQIHDAk99TGKazzb+c/QRFAlkjICS6sGy+PqNYqm98xv
	bNxwnp1nNnpTkuW8EW39qHapCR/YlZzgyvOVIVD9+EbwNnMWRGW64L1XhxJ9h9Ismrz4NmsdBjMME
	CJbSD+n4m5kHqVLbJFtiRJg25xGGxChOPT4QDh2e90KugmB/HvnH27lmZRW4nLy3hjw73InLfkNSI
	ovYhen68DSZOb8b72/ZCCnmxVX3SV4VTVec8QYjOObe1Sqylr1432f6oH8nsO+ja0wXzh7VX4AMDi
	9lcGxN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVX-000000099Xi-2FAK;
	Mon, 13 Jul 2026 12:11:35 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVP-000000099Qo-1mSo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:34 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gzLqy6KTfzKHLv1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 20:10:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id E69874056B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 20:11:23 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgCHUaLr1VRqGX9OBA--.12823S2;
	Mon, 13 Jul 2026 20:11:23 +0800 (CST)
Message-ID: <c68a4524-0265-4cca-b153-83c9a9c14da4@huaweicloud.com>
Date: Mon, 13 Jul 2026 20:11:23 +0800
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
X-CM-TRANSID: _Ch0CgCHUaLr1VRqGX9OBA--.12823S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww15XrW3KrWUXr15Cr1rZwb_yoW5JF45pF
	WrJas29rWxJFyUWwnF9w1kua4rK39rt3yjkayUW3Z7urn5GF9rCF48trW3ury0kr17J3WU
	Z3WFgFWruF4UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1RBT5UUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051127_827954_AFD230C5 
X-CRM114-Status: GOOD (  16.33  )
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
>  		its_vpe_irq_domain_free(domain, virq, i);
> +	}
>  
>  	return err;
>  }
> 
Thanks for explanation. I will improve this in next version.


