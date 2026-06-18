Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247BACD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 01:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFV2zQavcfAh9bw7smcS6VSRGiUU7/BDsJMKYrNrYsg=; b=Q6U9Y9NFuTAKIy3v4TZi1J4iTF
	1Ls8JiKbONqGARFBzvw4pTtiPp6avDeIrpVNqpssdYFafRguhXYysYcut/ukQglNvfiCIcz9f934u
	wGl9jbUa1E7w3QaOtbkDDS93YkvMdyUl7GIZjLTY3Rs0bjp/3Pogfdb4xl3PZjyBJnDlEUHwq0lXB
	tCPfRELY7gRLbMAMBeZv4JqimU4NXmlk8QPZzvBZjemyPHKqnK8v9UMQnEdT3hgVc3/QvsFyu9Prg
	o7/KQ76gAcrEyq7Y9u5DHqPoT4XT6dys66ujgUBpP6MLvsQQ0nZDp+o5wY6MOvbLG/nD/8+Ae/M3z
	NabUw41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa17K-00000000T8G-3HeW;
	Thu, 18 Jun 2026 01:00:26 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa17H-00000000T7M-45WM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 01:00:26 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4ggj6z4K9LzYQtjP
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 08:59:39 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 086CF40561
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:00:11 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgDHyT4ZQzNqdOC6CA--.29281S2;
	Thu, 18 Jun 2026 09:00:10 +0800 (CST)
Message-ID: <9bcab45a-7a33-484c-90a1-1a1569c09361@huaweicloud.com>
Date: Thu, 18 Jun 2026 09:00:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] irqchip/gic-v3-its: Fix memleak in its_probe_one()
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260615032910.54735-1-shikemeng@huaweicloud.com>
 <20260615032910.54735-3-shikemeng@huaweicloud.com>
 <87ik7k89i5.wl-maz@kernel.org>
 <bf396073-9a23-4602-ad64-ac3f38f2df65@huaweicloud.com>
 <86zf0ts739.wl-maz@kernel.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <86zf0ts739.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgDHyT4ZQzNqdOC6CA--.29281S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4kKF1kKrWUKFy7Jr1DKFg_yoW8ZFyxpF
	45Gay2kFsxZFy8Kw12vw18CF1Yyws7KrWUWry3W3Waqr98WF93KF1Utrs0gFy8Cr4xCa4j
	vw1agay3uw45ArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07UE-erUUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_180024_371488_93C0A789 
X-CRM114-Status: GOOD (  16.95  )
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

在 2026/6/17 20:07:54, Marc Zyngier 写道:
> On Tue, 16 Jun 2026 02:39:10 +0100,
> Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>
>> 在 2026/6/15 16:59:14, Marc Zyngier 写道:
>>> On Mon, 15 Jun 2026 04:29:06 +0100,
>>> Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>>>
>>>> Fix collection leak when its_init_domain() failed in its_probe_one().
>>>>
>>>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>>>> ---
>>>>  drivers/irqchip/irq-gic-v3-its.c | 10 +++++++++-
>>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>>>> index 2b7b546c43c8..df26ddc97ae2 100644
>>>> --- a/drivers/irqchip/irq-gic-v3-its.c
>>>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>>>> @@ -3032,6 +3032,12 @@ static int its_alloc_collections(struct its_node *its)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static void its_free_collections(struct its_node *its)
>>>> +{
>>>> +	kfree(its->collections);
>>>> +	its->collections = NULL;
>>>> +}
>>>
>>> Why do we need an extra helper for something that has a single calling
>>> spot? Why is it important to set collections to NULL, given that we're
>>> about to free the structure without even looking further?
>>>
>> The extra helper is added for symmetry with its_alloc_collections(), keeping
>> allocation/deallocation logic paired.
> 
> But there is zero logic here. None. it is a call to kfree(), just
> that, and we don't need any additional abstraction.
> 
>> In this way, we need to only modified
>> allocation/deallocation function if more member is added for collections.
> 
> Well, when we get there, we can always add an abstraction.
> 
>> Setting collections to NULL is a personal habit to quickly catch use-after-free
>> of collections. Could drop this which is not that import.
> 
> I don't see the point of doing that.
> 
Thanks for feedback. I will drop its_free_collections() in release code in next
version.

Thanks,
Kemeng> 	M.
> 


