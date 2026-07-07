Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B618FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQ0mvywMk1VYYOPBF5PvfJak/QAKIBpitC3KAeG7XY0=; b=4G9Rpj6mhmGZL2GOtSQUTACZqR
	hPrjzdN9J+mxAWlVdQ+2+24Ogsdq6rT6Qd/IqtrPL0ePjQzZsswEFcSTBAeSgJ1FblY3XIZUFa0aX
	aCfNZ4/WPv56HVU8d2cU/ImgpaWkAV9lOPej+17Zxpn4cQJF1irGki3ePTUUFLgGasGNrrfHWnONb
	Ln1F1vJt3XEgNUIX8IX2Rucy0yDkJoaT967reNMkwQygZtnPyZqJ07TMrZyntX8TN/sbREeVOc53u
	uJYAA9KaGj+0o96KBvSpwSlG83Bfu0QfdhTGhSPHReeB+iCc9MU+UwZy3bbfJtLi/XsVFRtiiT15P
	ZGO8cGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4I4-0000000Et0n-1fj5;
	Tue, 07 Jul 2026 11:48:40 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Hy-0000000EszJ-2yLb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:48:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GQ0mvywMk1VYYOPBF5PvfJak/QAKIBpitC3KAeG7XY0=;
	b=Lp9/IJDW0+fMhUe2D2c7Pxs+psR2xzhuJBRSozphimRGSOx/peqUwYuBnRGHBZfVoaMu6L4iC
	UkKTve2BKsVhZCC8/8/OQMn1T4wsjMlaJjcR8BQtbUdmD72ShTagpcLqBR53ClUDZZDnYgZAG9k
	6LYz4Th35zqYGoyXSpwTTqc=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gvfQb0MvzzpStg;
	Tue,  7 Jul 2026 19:39:35 +0800 (CST)
Received: from kwepemo200010.china.huawei.com (unknown [7.202.195.178])
	by mail.maildlp.com (Postfix) with ESMTPS id A17B440575;
	Tue,  7 Jul 2026 19:48:13 +0800 (CST)
Received: from [10.174.178.56] (10.174.178.56) by
 kwepemo200010.china.huawei.com (7.202.195.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 7 Jul 2026 19:48:12 +0800
Message-ID: <c11452a3-b918-4d4c-afd7-a835a1d0a3bc@huawei.com>
Date: Tue, 7 Jul 2026 19:48:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
To: Xie Yuanbin <xieyuanbin1@huawei.com>, <akpm@linux-foundation.org>,
	<linux@armlinux.org.uk>, <david@kernel.org>, <ljs@kernel.org>,
	<liam@infradead.org>, <vbabka@kernel.org>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sunnanyong@huawei.com>, <linux-mm@kvack.org>, <lilinjie8@huawei.com>,
	<liaohua4@huawei.com>
References: <20260626073048.3595106-2-xiqi2@huawei.com>
 <20260706133247.145485-1-xieyuanbin1@huawei.com>
Content-Language: en-GB
From: Qi Xi <xiqi2@huawei.com>
In-Reply-To: <20260706133247.145485-1-xieyuanbin1@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.56]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo200010.china.huawei.com (7.202.195.178)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_044835_143667_C9724B85 
X-CRM114-Status: GOOD (  19.26  )
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



On 06/07/2026 21:32, Xie Yuanbin wrote:
> On Fri, 26 Jun 2026 15:30:47 +0800, Qi Xi wrote:
>> @@ -181,7 +181,9 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
>>   		pr_err("8<--- cut here ---\n");
>>   		pr_err("%s: unhandled page fault (%d) at 0x%08lx, code 0x%03x\n",
>>   		       tsk->comm, sig, addr, fsr);
>> +		mmap_read_lock(tsk->mm);
>>   		show_pte(KERN_ERR, tsk->mm, addr);
>> +		mmap_read_unlock(tsk->mm);
>>   		show_regs(regs);
>>   	}
>>   #endif
> I found that this fix does not completely solve the problem. For a user
> fault, the addr could also be a kernel address. For arm32/x86, the kernel
> address space and user address space share the same pgd page table,
> but the kernel address space's page table is not protected by
> current->mm->mmap_lock.
>
> I have written a use case to construct and verify this point. When A user
> program accesses a kernel address and triggers __do_user_fault(),
> show_pte() will directly print the kernel page table.
>
> So, I suggest that:
> ```c
> 	if (user_mode(regs)) {
> 		struct mm_struct *const pt_mm = addr >= TASK_SIZE ?
> 			&init_mm : current->mm;
>
> 		mmap_read_lock(pt_mm);
> 		show_pte(KERN_ALERT, pt_mm, addr);
> 		mmap_read_unlock(pt_mm);
> 	} else {
> 		// .. keep nothing change
> 		show_pte(KERN_ALERT, current->mm, addr);
> 	}
> ```
>
> I have read this article:
> Link: https://docs.kernel.org/mm/process_addrs.html
> `mmap_read_lock(&init_mm)` should be able to ensure that the kernel
> address's page tables can be traversed. But I'm not quite sure if
> `mmap_read_lock(&current->mm)` provides protection for user-space non-VMA
> addresses?
You're right. And I think the fix is to simply skip show_pte() for 
kernel addresses.
For do_DataAbort() fallback:

	if (user_mode(regs)) {
		if (addr < TASK_SIZE) {
			mmap_read_lock(current->mm);
			show_pte(KERN_ALERT, current->mm, addr);
			mmap_read_unlock(current->mm);
		}
	} else {
		show_pte(KERN_ALERT, current->mm, addr);
	}

For a user-mode fault on a kernel address, printing kernel page tables via
show_pte() does not help. And The fault address is already printed above.
So it's safe and reasonable to skip it.

Same pattern applies to __do_user_fault().

> Also cc to mm maintainers:
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Liam R. Howlett <liam@infradead.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Linus Walleij <linusw@kernel.org>


