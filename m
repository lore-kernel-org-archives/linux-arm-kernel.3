Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A2DE8304A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 03:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBdPoj2+HTmrKW4e6vdspgu4vRZAKT7n22gI789mTZM=; b=HnZPXPozYSEb1KkSuSydEmSLjs
	om2X8cuSd1tM554YSUJLNBOr+nAoDS7hR2CnwvltaAkSkvDPwdRnsmLt9pB8gDsQ0jVkmaiXKVszT
	XrWHb22to/gdazglPRDJDAqFrr/6TQF9pbqh6cKAyfv7CWn8empmCOzc3Ji7hPHhgvTwhnz8kaYIM
	UVWeXIyq7aEB+3StICtUulPqBHrTJ96WpIKevepPmdQ/svna0Hl1AyQZwPtwq+k7hhlW1NYXuRkaN
	c0OheZ8pENKjKH45aQ+JFCdeC9DOq2FGrSqDid18l1KVMxR+csQclv9dXkNE9uELUXTjya209syY7
	nTYBUHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7FJ-000000061Pp-2NwD;
	Tue, 03 Feb 2026 03:38:33 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7FH-000000061PE-14yD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 03:38:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JBdPoj2+HTmrKW4e6vdspgu4vRZAKT7n22gI789mTZM=;
	b=zf4P8DyuSu3XxqPvZKd8/t4zieN4Y9CNKMCEczQn11hJG0D10slAo+QfOYMpOhNrS32Nd1oJw
	nD6d2STIlHW5BGDdvcvoS+QShyBVocXBvmDNXVXc1A/Ca21dZIT7OJG9rA7JhXW6B70GcteQ53g
	nG6jnpyvBgSQfxvvCwwRdXc=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f4pxX3kNnzpSvN;
	Tue,  3 Feb 2026 11:34:08 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id EEB0F40363;
	Tue,  3 Feb 2026 11:38:16 +0800 (CST)
Received: from [10.174.179.179] (10.174.179.179) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 3 Feb 2026 11:38:16 +0800
Message-ID: <73396cda-e12c-484f-ab84-b09e7aab8bb0@huawei.com>
Date: Tue, 3 Feb 2026 11:38:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: mm: fix pass user prot to ioremap_prot in
 generic_access_phys
To: Will Deacon <will@kernel.org>
CC: <akpm@linux-foundation.org>, <david@kernel.org>,
	<catalin.marinas@arm.com>, <zengheng4@huawei.com>, <ryan.roberts@arm.com>,
	<anshuman.khandual@arm.com>, <wangkefeng.wang@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
References: <20260130073807.99474-1-tujinjiang@huawei.com>
 <aYC6_lSm_eJeKIcn@willie-the-truck>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <aYC6_lSm_eJeKIcn@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.179]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_193831_926904_9B668F33 
X-CRM114-Status: GOOD (  20.45  )
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


在 2026/2/2 22:55, Will Deacon 写道:
> On Fri, Jan 30, 2026 at 03:38:07PM +0800, Jinjiang Tu wrote:
>> Here is a syzkaller error log:
>>    [0000000020ffc000] pgd=080000010598d403, p4d=080000010598d403, pud=0800000125ddb403,
>>                       pmd=080000007833c403, pte=01608000007fcfcf
>>    Unable to handle kernel read from unreadable memory at virtual address ffff80008ea89000
>>    KASAN: probably user-memory-access in range [0x0000000475448000-0x0000000475448007]
>>    Mem abort info:
>>      ESR = 0x000000009600000f
>>      EC = 0x25: DABT (current EL), IL = 32 bits
>>      SET = 0, FnV = 0
>>      EA = 0, S1PTW = 0
>>      FSC = 0x0f: level 3 permission fault
>>    Data abort info:
>>      ISV = 0, ISS = 0x0000000f, ISS2 = 0x00000000
>>      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>>      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>>    swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000001244aa000
>>    [ffff80008ea89000] pgd=100000013ffff403, p4d=100000013ffff403, pud=100000013fffe403,
>> 		     pmd=100000010a453403, pte=01608000007fcfcf
>>    Internal error: Oops: 000000009600000f [#1] SMP
>>    Modules linked in: team
>>    CPU: 1 PID: 10840 Comm: syz.9.83 Kdump: loaded Tainted: G
>>    Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
>>    pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>    pc : __memcpy_fromio+0x80/0xf8
>>    lr : generic_access_phys+0x20c/0x2b8
>>    sp : ffff8000a0507960
>>    x29: ffff8000a0507960 x28: 1ffff000140a0f44 x27: ffff00003833cfe0
>>    x26: 0000000000000000 x25: 0000000000001000 x24: 0010000000000001
>>    x23: ffff80008ea89000 x22: ffff00004ea63000 x21: 0000000000001000
>>    x20: ffff80008ea89000 x19: ffff00004ea62000 x18: 0000000000000000
>>    x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000806f1e3c
>>    x14: ffff8000806f1d44 x13: 0000000041b58ab3 x12: ffff7000140a0f23
>>    x11: 1ffff000140a0f22 x10: ffff7000140a0f22 x9 : ffff800080579d24
>>    x8 : 0000000000000004 x7 : 0000000000000003 x6 : 0000000000000001
>>    x5 : ffff8000a0507910 x4 : ffff7000140a0f22 x3 : dfff800000000000
>>    x2 : 0000000000001000 x1 : ffff80008ea89000 x0 : ffff00004ea62000
>>    Call trace:
>>      __memcpy_fromio+0x80/0xf8
>>      generic_access_phys+0x20c/0x2b8
>>      __access_remote_vm+0x46c/0x5b8
>>      access_remote_vm+0x18/0x30
>>      environ_read+0x238/0x3e8
>>      vfs_read+0xe4/0x2b0
>>      ksys_read+0xcc/0x178
>>      __arm64_sys_read+0x4c/0x68
>>      invoke_syscall+0x68/0x1a0
>>      el0_svc_common.constprop.0+0x11c/0x150
>>      do_el0_svc+0x38/0x50
>>      el0_svc+0x50/0x258
>>      el0t_64_sync_handler+0xc0/0xc8
>>      el0t_64_sync+0x1a4/0x1a8
>>    Code: 91002339 aa1403f7 8b190276 d503201f (f94002f8)
>>
>> The local syzkaller first maps I/O address from /dev/mem to userspace,
>> overiding the stack vma with MAP_FIXED flag. As a result, when reading
>> /proc/$pid/environ, generic_access_phys() is called to access the region,
>> which triggers a PAN permission-check fault and causes a kernel access
>> fault.
>>
>> The root cause is that generic_access_phys() passes a user pte to
>> ioremap_prot(), the user pte sets PTE_USER and PTE_NG bits.  Consequently,
>> any subsequent kernel-mode access to the remapped address raises a fault.
>>
>> To fix it, define arch_mk_kernel_prot() to convert user prot to kernel
>> prot for arm64, and call arch_mk_kernel_prot() in generic_access_phys(),
>> so that a user prot is passed to ioremap_prot().
>>
>> Fixes: 893dea9ccd08 ("arm64: Add HAVE_IOREMAP_PROT support")
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
>> ---
>> Changes in v3:
>>   * arch_mk_kernel_prot() always grant read/write permissions.
>>
>>   arch/arm64/include/asm/io.h |  8 ++++++++
>>   mm/memory.c                 | 12 +++++++++++-
>>   2 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
>> index 83e03abbb2ca..fe3040d59119 100644
>> --- a/arch/arm64/include/asm/io.h
>> +++ b/arch/arm64/include/asm/io.h
>> @@ -267,6 +267,14 @@ int arm64_ioremap_prot_hook_register(const ioremap_prot_hook_t hook);
>>   
>>   #define ioremap_prot ioremap_prot
>>   
>> +#define arch_mk_kernel_prot arch_mk_kernel_prot
>> +static inline pgprot_t arch_mk_kernel_prot(pgprot_t user_prot)
>> +{
>> +	ptdesc_t mem_type = pgprot_val(user_prot) & PTE_ATTRINDX_MASK;
>> +
>> +	return __pgprot_modify(PAGE_KERNEL, PTE_ATTRINDX_MASK, mem_type);
>> +}
> Do we really need another arch helper here?

For arc, powerpc, ioremap_prot() simply copy the user pte prot to the kernel page table too.
So maybe we should fix for the two archs too, and we should define a arch helper here.
But I'm not familiar with them.

>
> It looks to me like generic_access_phys() is the only caller of
> ioremap_prot() outside of arch/, so why not just handle the user_prot in
> there on arm64? You could rename the existing ioremap_prot() function in
> arch/arm64/mm/ioremap.c to e.g. __ioremap_prot(), switch over the
> callers in arch/arm64 and then add ioremap_prot() to wrap that with your
> pgprot modification above.
>
> Will
>

