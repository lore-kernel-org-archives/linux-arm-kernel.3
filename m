Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzkJVoKZPifo0y0ZPTsn9jO+wxaLHW1CjLDY095kbjU=; b=YevZlFsIwjRsjTXYTRyg0Pe/gW
	oltiifMkvNr8QVMHWsYQfe3ohFEoolDkjPQZQDso2oKA+gzaF4xwQL/sqhnBqap+bvpd50XqzIc2C
	IfbpdwAKHQrZ+LW7Zx8r9Y2re+uI0qud1SvGdnuDMNRz8KAPdiuE64eIXSsghgrXskgxiIcW+JeHS
	r34zFfTv9YDNv01rGc9GqxHWC2UCNNjaApY6QbhFAJuE6RO8wXN5LYkmdhxcRm/iVhleCAFn/EqTD
	AuXJ+LVc4CIaH+2JZQw3cDNKqgPUGadNrfo7JqhzEvX4QZ274YpLmPEdROVQ6Fmba9vNN9R+CIAUg
	qMe3UcXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFSg-000000097nN-0HAB;
	Mon, 13 Jul 2026 12:08:38 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFSd-000000097ly-1SBK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:08:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gzLmt5dj1zYQtwj
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 20:08:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 59625407AC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 20:08:28 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgA3A6Q71VRqUEFOBA--.9881S2;
	Mon, 13 Jul 2026 20:08:28 +0800 (CST)
Message-ID: <5fc734a2-d9d2-4695-ada4-06ac83eb5ce8@huaweicloud.com>
Date: Mon, 13 Jul 2026 20:08:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] irqchip/gic-v3-its: Remove redundant check in
 its_vpe_db_proxy_unmap_locked()
To: Radu Rendec <radu@rendec.net>, maz@kernel.org, tglx@kernel.org,
 jason@lakedaemon.net, lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260702033050.1583-1-shikemeng@huaweicloud.com>
 <20260702033050.1583-7-shikemeng@huaweicloud.com>
 <1d141ab4b472533ba728c65201ea7cb74047acba.camel@rendec.net>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <1d141ab4b472533ba728c65201ea7cb74047acba.camel@rendec.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgA3A6Q71VRqUEFOBA--.9881S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1UZr1xWrW5Zr4xGFWrGrg_yoW8uF47pF
	s5Wryqkr429rs7Jr4DGr4xJ3Wayr1xtry3AFW5Gw129rn8G3ZrtF1vvayYvas2vrW7JFsr
	XF1fXay8AF4UCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyGb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbiF4tUUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050835_751948_8953CAC1 
X-CRM114-Status: GOOD (  18.92  )
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

在 2026/7/5 0:32:44, Radu Rendec 写道:
> On Thu, 2026-07-02 at 11:30 +0800, Kemeng Shi wrote:
>> The high level functions already ensure that gic_rdists->has_rvpeid
>> is false before calling its_vpe_db_proxy_unmap_locked(), so we can
>> remove the redundant check in its_vpe_db_proxy_unmap_locked()
> 
> That's true for what the code is *today*. By removing the check, you're
> setting up a trap in case a new call to its_vpe_db_proxy_unmap_locked()
> is added in the future with the assumption that it will do "the right
> thing". The way I see these functions, they are not really "high level"
> and "low level". For example, its_vpe_db_proxy_map_locked() is called
> both by its_vpe_db_proxy_move() (which is another db_proxy function)
> and by its_vpe_send_cmd() directly.
> 
> FWIW, the code you're removing is just this:
>    0xffff8000806cf934 <+44>:	adrp	x0, 0xffff80008177e000 <static_ltree+784>
>    0xffff8000806cf938 <+48>:	add	x4, x0, #0x348
>    0xffff8000806cf93c <+52>:	ldr	x0, [x0, #840]
>    0xffff8000806cf940 <+56>:	ldrb	w0, [x0, #45]
>    0xffff8000806cf944 <+60>:	tbnz	w0, #0, 0xffff8000806cf9dc <its_vpe_db_proxy_unmap_locked+212>
> 
> I would argue that the gain in terms of both code size and speed is
> negligible (and these functions are subject to inlining anyway).
> 
Sure. Will drop this one in next version. Thanks.>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 120f6f29e978..b0069fbe1e69 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -3801,10 +3801,6 @@ static const struct irq_domain_ops its_domain_ops = {
>>   */
>>  static void its_vpe_db_proxy_unmap_locked(struct its_vpe *vpe)
>>  {
>> -	/* GICv4.1 doesn't use a proxy, so nothing to do here */
>> -	if (gic_rdists->has_rvpeid)
>> -		return;
>> -
>>  	/* Already unmapped? */
>>  	if (vpe->vpe_proxy_event == -1)
>>  		return;


