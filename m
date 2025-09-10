Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49F2CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+NLL25lzFNPsnexMiVcqRkYQmqCDRMkDJuEbPOgPcM=; b=WApxhbKoP3L7ASALRPld2GEWBY
	yDRmt9h+RGp2ZQDT6D3C8lt10+UaVvfdrDLLF6mTMiG+8z9nnk+gQuDNok24mu9t5xBJE5/XLGMSR
	L5ttcM0ILxLx1eGRS6OOt3QUDrtTHTVNPVpLeIvC1fTW4BFAddVacEqR6bBoo3l1rdQmNWfLmBHk5
	bWN721MnBFyebRf2h7QufU87in6gLZ+7L8L8tg8IVCjpJQ37mM6EHuR7MhUHnZBLcB++896pR6yOD
	Zq7rQwRa0rJXN7nfaRnxES/fwk8zg/TF50/x293Ez/YcT6UlMz9LiklGdx/qh9wXMVk5eyWYxOsJw
	/AG3WbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB2L-0000000BmOE-2ME3;
	Wed, 10 Sep 2025 02:58:21 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB2I-0000000BmMa-2BhJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 02:58:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cM4yq0DpHz13N79;
	Wed, 10 Sep 2025 10:54:11 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 126FB140259;
	Wed, 10 Sep 2025 10:58:11 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 10 Sep 2025 10:58:10 +0800
Message-ID: <534119b8-8221-4991-b308-05e8d5918aca@huawei.com>
Date: Wed, 10 Sep 2025 10:58:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu/debug: Add IOMMU page table dump debug facility
To: Will Deacon <will@kernel.org>
CC: <robin.murphy@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<yangyicong@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
References: <20250814093005.2040511-1-xiaqinxin@huawei.com>
 <20250814093005.2040511-2-xiaqinxin@huawei.com>
 <aMAmWQJy_G50xoBf@willie-the-truck>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <aMAmWQJy_G50xoBf@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_195818_712470_0219C465 
X-CRM114-Status: GOOD (  15.11  )
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



On 2025/9/9 21:06:33, Will Deacon <will@kernel.org> wrote:
> On Thu, Aug 14, 2025 at 05:30:04PM +0800, Qinxin Xia wrote:
>> +/**
>> + * iova_info_dump - dump iova alloced
>> + * @s - file structure used to generate serialized output
>> + * @iovad: - iova domain in question.
>> + */
>> +static int iommu_iova_info_dump(struct seq_file *s, struct iommu_domain *domain)
>> +{
>> +	struct iova_domain *iovad;
>> +	unsigned long long pfn;
>> +	unsigned long i_shift;
>> +	struct rb_node *node;
>> +	unsigned long flags;
>> +	size_t prot_size;
>> +
>> +	iovad = iommu_domain_to_iovad(domain);
>> +	if (!iovad)
>> +		return -ENOMEM;
>> +
>> +	i_shift = iova_shift(iovad);
>> +
>> +	/* Take the lock so that no other thread is manipulating the rbtree */
>> +	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
>> +	assert_spin_locked(&iovad->iova_rbtree_lock);
>> +
>> +	for (node = rb_first(&iovad->rbroot); node; node = rb_next(node)) {
>> +		struct iova *iova = rb_entry(node, struct iova, node);
>> +
>> +		if (iova->pfn_hi <= iova->pfn_lo)
>> +			continue;
>> +
>> +		for (pfn = iova->pfn_lo; pfn <= iova->pfn_hi; ) {
>> +			prot_size = domain->ops->dump_iova_prot(s, domain, pfn << i_shift);
>> +			pfn = ((pfn << i_shift) + prot_size) >> i_shift;
>> +		}
>> +	}
>> +
>> +	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
> 
> Why is the IOVA rbtree lock sufficient for serialising the page-table
> accesses made by ->dump_iova_prot()? I don't see anything here that
> prevents the walker walking into page-table pages that are e.g. being
> freed or manipulated concurrently.
> 
> Will
> 
  Thank you for catching this critical race condition.I will fix this in
  next version. And,Jason suggests putting io_ptdump on top of iommu pt.
  What do you think?

