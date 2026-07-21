Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618C1C44515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 01:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8wHmye5ufI4bjwtGMn9QkOV/EPscM/NaPIzyNcC0/4=; b=UiWhjmFMr1Sr8qQUM8sdc2+smI
	Z52dxkbNDtIXjZuygoIcoTR8zicg/1UQx1vBdOnPGkB6WY7ZyauO3c1VNtbObgMOYFNvLIPsdDLDs
	K2UntsZ/T+fv+b60+BEtRw0EHdjgv+Xgo5vWAGxB3b7UdT2q4B1UxvxRPeDMDtKGtW7THmcIywL/l
	25WytmB8cTPcFnI44h50cPrFNgUTnS6+uzbPI3JRhmnfBNnwIS+frlJ5z9sMkPeez+bBxO8M2frz9
	R072+IdCLPteJtE8yv7g2+AZ+TzCBJXPgbGn1N7NVi4JSf3WcMGeXozY8+7zByTf61XdYfLI/vrFN
	zdIkRG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlzHP-00000008BKB-0cfQ;
	Tue, 21 Jul 2026 01:28:19 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlzHK-00000008BJf-3YRr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 01:28:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h40B44Ck0zYQvFc
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:27:40 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 1B34940968
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:28:07 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgAHGHQly15qPSLoBw--.32371S2;
	Tue, 21 Jul 2026 09:28:07 +0800 (CST)
Message-ID: <d216ff52-b877-446d-9e34-75ff9b64a882@huaweicloud.com>
Date: Tue, 21 Jul 2026 09:28:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] irqchip/gic-v3-its: Fix leak in
 its_vpe_irq_domain_alloc()
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@kernel.org, jason@lakedaemon.net, lpieralisi@kernel.org,
 radu@rendec.net, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260720071215.50705-1-shikemeng@huaweicloud.com>
 <20260720071215.50705-4-shikemeng@huaweicloud.com>
 <86a4rmf3k7.wl-maz@kernel.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <86a4rmf3k7.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgAHGHQly15qPSLoBw--.32371S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CryUGF4kZF1DJr4UGFyrXrb_yoW8uFykpF
	Z8Xry2kr43Aa48Wrs8Cr18Ca43Jws7t3yUKayUCa45Wrn8AF92kF1Sk34YvFyktr1xAF13
	Z3WFgF45uw4UCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyGb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
	rVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1veHDUUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_182815_256039_16B027AA 
X-CRM114-Status: GOOD (  17.52  )
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

在 2026/7/20 16:50:00, Marc Zyngier 写道:
> On Mon, 20 Jul 2026 08:12:14 +0100,
> Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>
>> When its_irq_gic_domain_alloc() fails, the following
>> its_vpe_irq_domain_free() skips calling its_vep_teardown() for the
>> corresponding irq. Try its_vpe_teardown() in error handling to avoid
>> the leak issue.
>>
>> Fixes: 7d75bbb4bc1ad ("irqchip/gic-v3-its: Add VPE irq domain allocation/teardown")
>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 3e4edcb64065..5dc91862fc15 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -4594,9 +4594,11 @@ static int its_vpe_init(struct its_vpe *vpe)
>>  
>>  static void its_vpe_teardown(struct its_vpe *vpe)
>>  {
>> -	its_vpe_db_proxy_unmap(vpe);
>> -	its_vpe_id_free(vpe->vpe_id);
>> -	its_free_pending_table(vpe->vpt_page);
>> +	if (vpe->vpt_page != NULL) {
>> +		its_vpe_db_proxy_unmap(vpe);
>> +		its_vpe_id_free(vpe->vpe_id);
>> +		its_free_pending_table(vpe->vpt_page);
>> +	}
> 
> Please keep the diff minimal by doing an early return. This also
> deserves a comment, because this is not completely obvious:
Sure, I will do it in next version soon.> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 6f5811aae59c1..38032067135b6 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4592,6 +4592,13 @@ static int its_vpe_init(struct its_vpe *vpe)
>  
>  static void its_vpe_teardown(struct its_vpe *vpe)
>  {
> +	/*
> +	 * If vpt_page is NULL, then its_vpe_init() has failed, and
> +	 * there is nothing to do as no resource has been allocated.
> +	 */
> +	if (!vpe->vpt_page)
> +		return;
> +
>  	its_vpe_db_proxy_unmap(vpe);
>  	its_vpe_id_free(vpe->vpe_id);
>  	its_free_pending_table(vpe->vpt_page);
> 
> 	M.
> 


