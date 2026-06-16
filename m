Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00E0CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 01:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkEWQpJeooQUHud2pK3BQotynQTlDyt68lm61nQYAI4=; b=evhjHAqj4vyql8u6zfqJPrXy/g
	aYqmyaanramIZ7xaA/k9uUx8z4CydSLvRIS1WfxeL2epZj4fSNO/IMlyYFTGcHjk9nrnzB2+AMfWU
	h7GM0w8RSdN0wNgUyM0r8ie8QL3+gHv5/q29maOmlmdPIE3WjA89JWUaAJVoqxmanUIVCfE86gLus
	yLU0iSLYgGBgcBTy7hFjmEJ6BKjScn75w103Gv4OY/DGtBB7NMlGorc2IKRUEKFoWYM+dqBs7lZFp
	tU4ScVmNEqBRYM4GwSku0dbMfkpSb1kj8ZUcIUhQuehj52xw1ox6MuSAZ+IYIZianSu92zgVWrFx0
	zNpbY6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIeP-0000000F472-0HcG;
	Tue, 16 Jun 2026 01:31:37 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIeK-0000000F46S-3bGO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 01:31:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gfTvf31MzzKHMV6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:30:38 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 720AD40701
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:31:24 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgBntjtrpzBqERXNBw--.61908S2;
	Tue, 16 Jun 2026 09:31:24 +0800 (CST)
Message-ID: <cda86396-afe1-4bc9-97c2-0e7a3c739217@huaweicloud.com>
Date: Tue, 16 Jun 2026 09:31:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] irqchip/gic-v3-its: Fix LPI range leak and refactor
 error handler in its_lpi_alloc()
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260615032910.54735-1-shikemeng@huaweicloud.com>
 <20260615032910.54735-2-shikemeng@huaweicloud.com>
 <87jys089sn.wl-maz@kernel.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <87jys089sn.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgBntjtrpzBqERXNBw--.61908S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4Dtr4kKr1DGF17XryUGFg_yoW8trWUpF
	43Wa9Fyr48JFWUKw42vFykJF90qws7XFW8KryfGa4ruFn8uF93KF4IkFyfX3WxCr9rJa48
	X3Z5Wa4Duw1UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxUzsqWUUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_183133_264926_B84A8F48 
X-CRM114-Status: GOOD (  15.59  )
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

在 2026/6/15 16:52:56, Marc Zyngier 写道:
> On Mon, 15 Jun 2026 04:29:05 +0100,
> Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>
>> Fix the LIP range leak when bitmap_zalloc() failed. Besides refactor
> 
> Typo.
> 
>> error handling code to make it a little simpler.
> 
> No. Please don't mix fixes and (totally pointless) refactoring.
OK, I will only keep fix in this patch.> 
>>
>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 21 +++++++++------------
>>  1 file changed, 9 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 291d7668cc8d..2b7b546c43c8 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -2217,10 +2217,9 @@ static int __init its_lpi_init(u32 id_bits)
>>  static unsigned long *its_lpi_alloc(int nr_irqs, u32 *base, int *nr_ids)
>>  {
>>  	unsigned long *bitmap = NULL;
>> -	int err = 0;
>>  
>>  	do {
>> -		err = alloc_lpi_range(nr_irqs, base);
>> +		int err = alloc_lpi_range(nr_irqs, base);
>>  		if (!err)
>>  			break;
>>  
>> @@ -2228,22 +2227,20 @@ static unsigned long *its_lpi_alloc(int nr_irqs, u32 *base, int *nr_ids)
>>  	} while (nr_irqs > 0);
>>  
>>  	if (!nr_irqs)
>> -		err = -ENOSPC;
>> -
>> -	if (err)
>> -		goto out;
>> +		goto err_out;
>>  
>>  	bitmap = bitmap_zalloc(nr_irqs, GFP_ATOMIC);
>>  	if (!bitmap)
>> -		goto out;
>> +		goto err_free_lpi;
>>  
>>  	*nr_ids = nr_irqs;
>> -
>> -out:
>> -	if (!bitmap)
>> -		*base = *nr_ids = 0;
>> -
>>  	return bitmap;
>> +
>> +err_free_lpi:
>> +	free_lpi_range(*base, nr_irqs);
>> +err_out:
>> +	*base = *nr_ids = 0;
>> +	return NULL;
>>  }
>>  
>>  static void its_lpi_free(unsigned long *bitmap, u32 base, u32 nr_ids)
> 
> Honestly, I question the validity of handling errors this way. You are
> already unable to allocate a per-device bitmap. And yet you are
> calling free_lpi_range(), which has the interesting property of
> *allocating* memory. Which you don't have. Oh wait...
You are right. I'm considering use xarray to track the lpi range or
modify free_lpi_range to try merge first before memory allocation.
What would you recommend?

Thanks,
Kemeng Shi> 
> 	M.
> 


