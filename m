Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2219CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2eQr/t8U1wQpTsAv2oqP/O+K73c/8wMmiyGmptHgmo=; b=uYpZAxRD8c7zWRKwZDJc4uEIgx
	nWH1wH5dNXJ1CyXbIFUoBccn040YUq7TYVs/5VGWZhQ427TjJCmwmFEYA+J8F5p6jTV/fxn/AENdz
	Nreq2HEA4MskLa1pc9G8nqP2FA++9wdSjvUkBVwg35BBW33SveduHmRb+kNnLoPbb2qwMQdpvuHGn
	wxgwsOOTjexVuUFvc5/iGS6RnQWeOiNNmZ0uPhVbcaWY3s5ik8c8DuevrL5RbQWWjq6sfDs49k4YE
	Z/wZU+Mg4tn4yt4GdWiC6SjDiF7PDRXUEemv4OktbIzVmaPRNUCIxgmMA9Vow+DRHruNSaF9CP7mO
	Ao+lyrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZg1u-0000000GVhP-07RY;
	Wed, 17 Jun 2026 02:29:26 +0000
Received: from m16.mail.126.com ([117.135.210.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZg1q-0000000GVh2-0T7x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 02:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=T2eQr/t8U1wQpTsAv2oqP/O+K73c/8wMmiyGmptHgmo=;
	b=okul5jce2NFh3k5vp7WjDI0WDf67UyKt1/zDFBfi7heNVLjta++no3Fk8aRn0P
	ciVVscI7M0P+K5pPcxXkuITBoOh99FFUTrtATDtMx7usCts/BmfRXq33c1Xg2JtY
	qHQS/9IDoT0wwsBwuHjZzbFVEseW4Ei1UqHOLzqIft4tw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgCXL2ddBjJqASY2BQ--.52696S2;
	Wed, 17 Jun 2026 10:28:46 +0800 (CST)
Message-ID: <6A32065F.3030705@126.com>
Date: Wed, 17 Jun 2026 10:28:47 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Frank Li <Frank.li@oss.nxp.com>
CC: Hongling Zeng <zenghongling@kylinos.cn>, vkoul@kernel.org, 
 Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: sun6i-dma: Fix memory leak in sun6i_dma_terminate_all
References: <20260616060449.42225-1-zenghongling@kylinos.cn> <ajG2aR70B4z6j1fd@SMW015318>
In-Reply-To: <ajG2aR70B4z6j1fd@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCkvCgCXL2ddBjJqASY2BQ--.52696S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur15JF1UWFW3WrWDWryfJFb_yoW5XF13pr
	W5Ja13GFW5Jwsaga1ftw4FqF1Yqa13tF47u3y5Zw13Zr45trnFkF1xCw1F9F4DArn8Zrn0
	yFs8Z34xC3WUCFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jstxhUUUUU=
X-Originating-IP: [112.64.161.44]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoR6-kGoyBl5mLQAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_192922_605302_4C5A9CB0 
X-CRM114-Status: GOOD (  18.58  )
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

Hi Frank and Jernej Skrabec:

      Thanks for all the review!

   You're absolutely right.After checking virt-dma.h, I see that 
desc_terminated is the correct queue for actively terminated transfers. 
I'll update to use:

   - vchan_terminate_vdesc(vd);

   I'll send v3 ,Please help to review.

   Best regards,
   Hongling Zeng

在 2026年06月17日 04:47, Frank Li 写道:
> On Tue, Jun 16, 2026 at 02:04:49PM +0800, Hongling Zeng wrote:
>> When terminating a non-cyclic DMA transfer, the active descriptor
>> is not properly reclaimed. The descriptor is removed from the
>> desc_issued list in sun6i_dma_start_desc(), but in
>> sun6i_dma_terminate_all(), only cyclic transfer descriptors are
>> added to the desc_completed list before cleanup.
>>
>> For non-cyclic transfers, pchan->desc is set to NULL without first
>> adding the descriptor back to a list that vchan_get_all_descriptors()
>> can collect. This causes the descriptor and its associated LLI chain
>> to be permanently leaked.
>>
>> Fix by ensuring both cyclic and non-cyclic active descriptors are
>> added to the desc_completed list before setting pchan->desc to NULL.
>>
>> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
>> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>>
>> ---
>>   Change in v2;
>>   -Add pchan->desc != pchan->done check to prevent race condition
>>    where completed descriptors could be double-added to desc_completed
>>    list, causing list corruption
>> ---
>>   drivers/dma/sun6i-dma.c | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
>> index 7a79f346250a..12d038ef5f2e 100644
>> --- a/drivers/dma/sun6i-dma.c
>> +++ b/drivers/dma/sun6i-dma.c
>> @@ -946,16 +946,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>>
>>   	spin_lock_irqsave(&vchan->vc.lock, flags);
>>
>> -	if (vchan->cyclic) {
>> -		vchan->cyclic = false;
>> -		if (pchan && pchan->desc) {
>> -			struct virt_dma_desc *vd = &pchan->desc->vd;
>> -			struct virt_dma_chan *vc = &vchan->vc;
>> +	if (pchan && pchan->desc && pchan->desc != pchan->done) {
>> +		struct virt_dma_desc *vd = &pchan->desc->vd;
>> +		struct virt_dma_chan *vc = &vchan->vc;
>>
>> -			list_add_tail(&vd->node, &vc->desc_completed);
>> -		}
>> +		list_add_tail(&vd->node, &vc->desc_completed);
> should It be in desc_terminated queue?
>
> ref: https://lore.kernel.org/dmaengine/ajETw7uwVx_U9o5F@ryzen/T/#m541c24b45fb425c6a8a81d800db225b58411447e
>
> Frank
>>   	}
>>
>> +	vchan->cyclic = false;
>>   	vchan_get_all_descriptors(&vchan->vc, &head);
>>
>>   	if (pchan) {
>> --
>> 2.25.1
>>


