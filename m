Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E051EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 05:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMBPcXK7F9JzTFv1nefMDOq5iPo0GYCsozEaqsHN4vM=; b=f4mDY0HybvQ7d8uYFl5Mb/czwo
	uBgtwIqKJ6S/1XNQ65czXe58dNw3vDhsJ09GoDRPhmygQ4Xzk+fo5jP4Dppnvx9GNUxORKgCtCaTk
	01gCd0ry5UdURvjivs6np9QYm7V1tPKonODjsDaZWltgTOMFh0VZn1eXJz1kyfoXJS2O9SKfR7oe8
	hsoyCF2LJBorZICpX0uBluFxKInT0K1rcSDh02/lTAFWI78/UZ+P8RKAd6FVKjySLSFD2BQ/ODnY8
	nJlTR4eAbK7MPEF4THix0dbIH3FUVa9M8D2xUP2ibD5yGHVU7M/DPbAQriXk4mFViXAYEd8/ICKl7
	syFggrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wen5H-00000000fER-25eo;
	Wed, 01 Jul 2026 05:02:03 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wen5A-00000000fBy-2OvO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 05:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=PMBPcXK7F9JzTFv1nefMDOq5iPo0GYCsozEaqsHN4vM=;
	b=knMDHtmMn1dz5JlbEGJC9cZBgLUltl5h/HWCv4SMolUIOxtpN5zgkldLYseu9H
	Yjpt1apTcRPZgjob4s39n9LAolVDucJknxM3AzmawDAwYzCxusncHqiwjc4sLlqF
	A1Z1t9LPyQkZe/qc0V6FOZQcXgVQ8nyE1v3aG5r7LoJhY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgB3H2chn0Rqwjx7CA--.7136S2;
	Wed, 01 Jul 2026 13:01:22 +0800 (CST)
Message-ID: <6A449F14.8030207@126.com>
Date: Wed, 01 Jul 2026 13:01:08 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Vinod Koul <vkoul@kernel.org>, 
 Hongling Zeng <zenghongling@kylinos.cn>
CC: Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.li@oss.nxp.com>
Subject: Re: [PATCH v4] dmaengine: sun6i-dma: Fix memory leak in sun6i_dma_terminate_all
References: <20260618020609.1155962-1-zenghongling@kylinos.cn> <akOptOSkd7o0Vivk@vaman>
In-Reply-To: <akOptOSkd7o0Vivk@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCkvCgB3H2chn0Rqwjx7CA--.7136S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFW3Gr48urWxWrW3XFWrKrg_yoW5JFy5pr
	yUGw43CFWrJa9ag3Wftw4FqFn8Xa13tFW7CrWUXw15Zr4Ygr12kr1Ik34Fga1kAwn8uF4F
	ya1Yq347CF1UurJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsEf5UUUUU=
X-Originating-IP: [112.64.161.44]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBrgKbbGpEnyJQWQAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_220200_127625_E85E8DAF 
X-CRM114-Status: GOOD (  19.55  )
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


在 2026年06月30日 19:34, Vinod Koul 写道:
> On 18-06-26, 10:06, Hongling Zeng wrote:
>> When terminating DMA transfers, active descriptors are not properly
>> reclaimed. Only cyclic descriptors were handled, leaving non-cyclic
>> descriptors and their LLI chains to be permanently leaked.
>>
>> Fix by using vchan_terminate_vdesc() which handles both cyclic and
>> non-cyclic descriptors by adding them to desc_terminated queue for
>> proper cleanup.
>>
>> Add pchan->desc != pchan->done check to prevent double-adding completed
>> descriptors, which would corrupt the list.
> Thanks for the patch. Please consider revising the subject which should
> describe the changes in the patch and not the fix/issue.
>
> A better one would be "fix reclaim descriptors while terminating"
   Thank you for the suggestion. I'll update the subject in v5 to describe
   the changes rather than the issue.

>> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
>> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
>>
>> ---
>>   Change in v2;
>>   -Add pchan->desc != pchan->done check to prevent race condition
>>    where completed descriptors could be double-added to desc_completed
>>    list, causing list corruption
>> ---
>>   Change in v3:
>>   -Fix by using vchan_terminate_vdesc() as suggested by Frank Li
>> ---
>>   Change in v4:
>>   -Correct the commit message
>> ---
>>   drivers/dma/sun6i-dma.c | 13 +++++--------
>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
>> index 7a79f346250a..134ae840f176 100644
>> --- a/drivers/dma/sun6i-dma.c
>> +++ b/drivers/dma/sun6i-dma.c
>> @@ -946,16 +946,13 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>>   
>>   	spin_lock_irqsave(&vchan->vc.lock, flags);
>>   
>> -	if (vchan->cyclic) {
>> -		vchan->cyclic = false;
>> -		if (pchan && pchan->desc) {
>> -			struct virt_dma_desc *vd = &pchan->desc->vd;
>> -			struct virt_dma_chan *vc = &vchan->vc;
>> -
>> -			list_add_tail(&vd->node, &vc->desc_completed);
>> -		}
>> +	if (pchan && pchan->desc && pchan->desc != pchan->done) {
>> +		struct virt_dma_desc *vd = &pchan->desc->vd;
>> +		
>> +		vchan_terminate_vdesc(vd);
>>   	}
>>   
>> +	vchan->cyclic = false;
>>   	vchan_get_all_descriptors(&vchan->vc, &head);
>>   
>>   	if (pchan) {
>> -- 
>> 2.25.1


