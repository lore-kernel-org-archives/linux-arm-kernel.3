Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE050C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 01:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aS2AaJzq7qAd46p582Cj3sivYkILgPn8F8Q5Wh6nPoo=; b=GdxnIO9xuRlAd9WjgEJ+kBKfnY
	McYkmFxpnkc9B6G43LOqipVI5rfuV2cm9Esxz310mPqlECeU4ozIzQAeCq9Hm5CgVhZUHQ8Mcdqob
	PW/z9eL1+RyP26WyqCQJbgtrJ8HcxvrpxPHKbjtqSny47M1KRLd4HHmetmEvT/7Bkmu2OdCPw/jVN
	LDilLBkyvHnFqqic7B8qfCbbGxQAWhPj4FyGbeiOBEoXfwpAV+m3+btLrHy+reHUHhysXT+XXfpA+
	HioarUf81xThV8rw/lLYGhh6+CVMhfBaNgmm/BOZsBMPIJPIa8MQsBvTp9BmdPJIxHxPnq8bW+CNt
	e380++dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfSxn-00000005pwq-3jMR;
	Fri, 03 Jul 2026 01:45:07 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfSxk-00000005pwF-0yjW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 01:45:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4grxQ24wvFzKHMXG
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 09:44:42 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id D144340590
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 09:44:54 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgBHeyUVFEdqRBiiAg--.63167S2;
	Fri, 03 Jul 2026 09:44:54 +0800 (CST)
Message-ID: <e3252259-64e1-4bcb-8082-0bd501233747@huaweicloud.com>
Date: Fri, 3 Jul 2026 09:44:53 +0800
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
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <87fr216nx2.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgBHeyUVFEdqRBiiAg--.63167S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww43ur45WF4xCrW3ZFWrXwb_yoW8WF1xpF
	Z3G3s29rZ7JFyj9anrC3Wkua45Ka97t3yjkayUW3Wxur1kJF97CF48trWa9Fy0kr17J3W0
	va4SgFWrua1DCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUylb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7IJmUUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_184504_662472_51639F0E 
X-CRM114-Status: GOOD (  13.14  )
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

在 2026/7/3 6:12:57, Marc Zyngier 写道:
>> When its_irq_gic_domain_alloc() fails, the following
>> its_vpe_irq_domain_free() skips calling its_vep_teardown() for the
>> corresponding irq. Call its_vpe_teardown() when its_irq_gic_domain_alloc()
>> is failedto avoid the leak issue.
>>
>> Fixes: 7d75bbb4bc1ad ("irqchip/gic-v3-its: Add VPE irq domain allocation/teardown")
>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 3e4edcb64065..8968bedefdba 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -4666,8 +4666,10 @@ static int its_vpe_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
>>  			break;
>>  		err = its_irq_gic_domain_alloc(domain, virq + i,
>>  					       vm->vpes[i]->vpe_db_lpi);
>> -		if (err)
>> +		if (err) {
>> +			its_vpe_teardown(vm->vpes[i]);
>>  			break;
>> +		}
> There is already a spot for error handling in this function, we don't
> need a second one.
When its_irq_gic_domain_alloc() fails at index i, its_vpe_init(vpes[i])
has already succeeded but the exisiting its_vpe_irq_domain_free(domain, virq, i)
only tears down VPEs with index [0, i - 1], so its_vpe_teardown(vpes[i]) is still
needed.
So I guess you mean we can increase index when its_irq_gic_domain_alloc() fails to
free the resource with existing error handling?
Please correct me if I'm miss anything.

Thanks.


