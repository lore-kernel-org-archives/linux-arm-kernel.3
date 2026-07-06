Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAE0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vo7wFz5VSU0y8XZ0qkTfFRkiT8Oyp/XHu8Zv4m4Ra9Y=; b=MrUxgnR60Oqowwlx4o9sSmf9DQ
	OsAkoYFK75n+SHhrcCyh9wDdHP6nvkXIYobuhhXg+stu6Q5h7ezEfcWBx3vJ2Pr4y5fWCvvclpGVl
	9+FDbb5pNVvFhQqxVrvYZjNYvudshThnnubL9G449TP/vUF3MVrFPHvwZLw6bT8O5aeDXZQbwulWz
	wDy+JESKr3SVeS3YPCZexN3HoUeFVkynvRPMWTUetidhGNde5jd2ZBqfz42RtgaS1TQvGCiTHUrfS
	HaxduFhoJ1A9DvwxBa9EQYZjFDBkwkNH5JEuNeumrcBceng6CJDM0JZDbcmpHGvTqcdVVldqzbJHQ
	IVUT2q3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjSu-0000000Cc3C-0hYC;
	Mon, 06 Jul 2026 13:34:28 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjSr-0000000Cbyv-2EPk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:34:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vo7wFz5VSU0y8XZ0qkTfFRkiT8Oyp/XHu8Zv4m4Ra9Y=;
	b=dO/Fr9E0YKPJtLDFpAOHpi1tZX/ID7ZeNcZrfs2DwtQBLUOoYUiirofd1H5efHVq4ZgwoENGh
	BfHmK3w+eduvHlRpuhFrOITMkIGbd8v47j5qHKdFWt1YICJ0XHbHeF6MtDy7Pl7dopbgCdN2G9L
	QWc7wTnbh8GBAoJ9F83MgXg=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gv4pW494fzLlSL;
	Mon,  6 Jul 2026 21:24:51 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 77A684055B;
	Mon,  6 Jul 2026 21:34:04 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 6 Jul 2026 21:34:03 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <xiqi2@huawei.com>, <akpm@linux-foundation.org>, <linux@armlinux.org.uk>,
	<david@kernel.org>, <ljs@kernel.org>, <liam@infradead.org>,
	<vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>, <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sunnanyong@huawei.com>, <xieyuanbin1@huawei.com>, <linux-mm@kvack.org>,
	<lilinjie8@huawei.com>, <liaohua4@huawei.com>
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault() under CONFIG_DEBUG_USER
Date: Mon, 6 Jul 2026 21:32:47 +0800
Message-ID: <20260706133247.145485-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626073048.3595106-2-xiqi2@huawei.com>
References: <20260626073048.3595106-2-xiqi2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_063426_058690_4BE99917 
X-CRM114-Status: GOOD (  12.19  )
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

On Fri, 26 Jun 2026 15:30:47 +0800, Qi Xi wrote:
> @@ -181,7 +181,9 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
>  		pr_err("8<--- cut here ---\n");
>  		pr_err("%s: unhandled page fault (%d) at 0x%08lx, code 0x%03x\n",
>  		       tsk->comm, sig, addr, fsr);
> +		mmap_read_lock(tsk->mm);
>  		show_pte(KERN_ERR, tsk->mm, addr);
> +		mmap_read_unlock(tsk->mm);
>  		show_regs(regs);
>  	}
>  #endif

I found that this fix does not completely solve the problem. For a user
fault, the addr could also be a kernel address. For arm32/x86, the kernel
address space and user address space share the same pgd page table,
but the kernel address space's page table is not protected by
current->mm->mmap_lock.

I have written a use case to construct and verify this point. When A user
program accesses a kernel address and triggers __do_user_fault(),
show_pte() will directly print the kernel page table.

So, I suggest that:
```c
	if (user_mode(regs)) {
		struct mm_struct *const pt_mm = addr >= TASK_SIZE ?
			&init_mm : current->mm;

		mmap_read_lock(pt_mm);
		show_pte(KERN_ALERT, pt_mm, addr);
		mmap_read_unlock(pt_mm);
	} else {
		// .. keep nothing change
		show_pte(KERN_ALERT, current->mm, addr);
	}
```

I have read this article:
Link: https://docs.kernel.org/mm/process_addrs.html
`mmap_read_lock(&init_mm)` should be able to ensure that the kernel
address's page tables can be traversed. But I'm not quite sure if
`mmap_read_lock(&current->mm)` provides protection for user-space non-VMA
addresses?

Also cc to mm maintainers:
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Linus Walleij <linusw@kernel.org>

