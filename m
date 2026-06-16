Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E25CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 01:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGTIRUcVCE9SESgbhnffqwshuQPUTrbc+BuBGggC5ik=; b=l8L/QwoMg9V1S5VjxvckH4AO8n
	6RXE2Cak4fYA8QaiAM0tushUZQDKntKogpm6SGSBnU7gCECaHso6yCrBxydOcgkMVP1OugGS2aJOC
	DheiwsA+qsx9t/xrjerw460kytf9MVm2xbMFuW5Q0TB8eeKrKRA704Pk7mgwnEf7/7KiP1L8x57gf
	E/DvfSWzqhyqSolzEdM3ngkw3SHLgRBAA0HW4uFpIk+qD4GUOLnnk7sITu4hYB8XZ2q1rJdN6dQcJ
	hC1a0rtePJMvTQp9CF6MLrmYbZDI7oG8bjvFnpJIM2S8FKOnHnqdN7w3CZXIGcN0VlXDV0BXQEE36
	65xOKpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIlq-0000000F4Nj-3HV5;
	Tue, 16 Jun 2026 01:39:18 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIlo-0000000F4NM-2TgB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 01:39:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gfV4y4lw0zYQtlW
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:38:42 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id B017440B97
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:39:10 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP4 (Coremail) with SMTP id gCh0CgDHG4A+qTBqY+DUBw--.33402S2;
	Tue, 16 Jun 2026 09:39:10 +0800 (CST)
Message-ID: <bf396073-9a23-4602-ad64-ac3f38f2df65@huaweicloud.com>
Date: Tue, 16 Jun 2026 09:39:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] irqchip/gic-v3-its: Fix memleak in its_probe_one()
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260615032910.54735-1-shikemeng@huaweicloud.com>
 <20260615032910.54735-3-shikemeng@huaweicloud.com>
 <87ik7k89i5.wl-maz@kernel.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <87ik7k89i5.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDHG4A+qTBqY+DUBw--.33402S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWUKFWfKrWxXF4rKrW3ZFb_yoW8Xry5pF
	s8W392kF13JFy8KwnrZw18CF15Jan7KrWUGrW3Wa4aq3s8CF93KF12qrs0gFy8Gr47Ca4j
	vF1agF4Uua15AFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxUrNtxDUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_183916_841992_652CA626 
X-CRM114-Status: GOOD (  13.56  )
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

在 2026/6/15 16:59:14, Marc Zyngier 写道:
> On Mon, 15 Jun 2026 04:29:06 +0100,
> Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>
>> Fix collection leak when its_init_domain() failed in its_probe_one().
>>
>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 2b7b546c43c8..df26ddc97ae2 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -3032,6 +3032,12 @@ static int its_alloc_collections(struct its_node *its)
>>  	return 0;
>>  }
>>  
>> +static void its_free_collections(struct its_node *its)
>> +{
>> +	kfree(its->collections);
>> +	its->collections = NULL;
>> +}
> 
> Why do we need an extra helper for something that has a single calling
> spot? Why is it important to set collections to NULL, given that we're
> about to free the structure without even looking further?
> 
The extra helper is added for symmetry with its_alloc_collections(), keeping
allocation/deallocation logic paired. In this way, we need to only modified
allocation/deallocation function if more member is added for collections.
Setting collections to NULL is a personal habit to quickly catch use-after-free
of collections. Could drop this which is not that import.

Thanks,
Kemeng
> 	M.
> 


