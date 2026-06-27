Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43802C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 01:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yBfnV8Wa49YhEVhZ2FHHEmyxLQzNAOf9PIjdg4NDVY=; b=hQjq5lVg6RxcRAHuIfsYPsbhUH
	lNEO/NXN3geUGrhMIcDOgnL9HDhDvFRwWAzFmIW+6dPvuIoZ/mEso88Q4K7zKVvyyEiPWDtI2b+4p
	ZYIjCkAo+qsOsYbu/M7LXFmzcl1AQnhPgSt6xeb47sRnE+482Qg2PjKQc35690FbyZVVoKGhJMuu+
	Kqvvp4Zn/ghuNfKmThCRt0B/kt79QkGnJdoLok36HuSMDY3FzPccfpJYGe5ihG9FPbJfT2JGRn+0J
	PeNWIJeTanjbr4YB3BhyEAYjwZKKzIEUo3NcC4F6qPPXcMhk69OCMNKTqyjqMNgFI99hwc3MJBOPF
	sgN0tmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdI1M-0000000C3mV-06nT;
	Sat, 27 Jun 2026 01:39:48 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdI1I-0000000C3m2-32XO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 01:39:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4yBfnV8Wa49YhEVhZ2FHHEmyxLQzNAOf9PIjdg4NDVY=;
	b=okAOVI3A2G7sbSrqENmt+j71NIt2vKR+bmkZEi0JlUD/jhhoQVF2f52fBsvjPHV78VJQndmDo
	brpj2fF25BWTjCRXmouYi3nL7pWgP4AKjWwROU9Gy52F01DDz192rjvl2IWGpixQMPIDHFnpHxz
	zVFPhNFOIDCc0Z4O61Iob5s=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gnFNn6Tlmz1T4Lv;
	Sat, 27 Jun 2026 09:30:49 +0800 (CST)
Received: from kwepemo200010.china.huawei.com (unknown [7.202.195.178])
	by mail.maildlp.com (Postfix) with ESMTPS id 82B2A40538;
	Sat, 27 Jun 2026 09:39:34 +0800 (CST)
Received: from [10.174.178.56] (10.174.178.56) by
 kwepemo200010.china.huawei.com (7.202.195.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 27 Jun 2026 09:39:33 +0800
Message-ID: <9b0869e3-c4b5-48aa-a42d-27cf97f971cb@huawei.com>
Date: Sat, 27 Jun 2026 09:39:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
To: Russell King <linux@armlinux.org.uk>
CC: Andrew Morton <akpm@linux-foundation.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Yuanbin Xie <xieyuanbin1@huawei.com>, Nanyong Sun <sunnanyong@huawei.com>
References: <20260626073048.3595106-1-xiqi2@huawei.com>
 <20260626073048.3595106-2-xiqi2@huawei.com>
 <aj5KCj1cRX3_IpPN@shell.armlinux.org.uk>
Content-Language: en-GB
From: Qi Xi <xiqi2@huawei.com>
In-Reply-To: <aj5KCj1cRX3_IpPN@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.56]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo200010.china.huawei.com (7.202.195.178)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_183945_428280_72E436EB 
X-CRM114-Status: GOOD (  15.67  )
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

Hi Russell,

Thank you for the review. I understand the general concern about
taking locks in fault paths, but I would like to clarify the specific
case here.

__do_user_fault() with CONFIG_DEBUG_USER is not a kernel-dying path.
After show_pte() prints debug info, the kernel calls
force_sig_fault(SIGSEGV) and returns to user space. The system
continues running normally. Without this fix, a concurrent munmap can
cause show_pte() to trigger a secondary kernel fault, turning a
harmless SIGSEGV into a kernel panic.

Regarding your concern about the mm lock being already held: I have
verified that all three callers of __do_user_fault() (do_page_fault
-> bad_area, do_bad_area user path, and do_kernel_address_page_fault
user path) release mmap_read_lock or never hold it before entering
__do_user_fault(). So the lock is not held here.

It is also worth noting that we did NOT modify the paths where the
kernel is already dying (die_kernel_fault, __do_kernel_fault). Those
paths remain unchanged and continue to call show_pte() without any
lock, just as they always have.

On 26/06/2026 17:44, Russell King wrote:
> On Fri, Jun 26, 2026 at 03:30:47PM +0800, Qi Xi wrote:
>> When CONFIG_DEBUG_USER is enabled with user_debug=31 on 32-bit ARM,
>> a user page fault triggers show_pte() via __do_user_fault() after
>> do_page_fault() has already released mmap_read_lock. If another
>> thread concurrently calls munmap(), the page table pages can be
>> freed while show_pte() is still reading them, causing a
>> use-after-free in show_pte().
>>
>> The race can be reproduced on multi_v7_defconfig with:
>>      CONFIG_DEBUG_USER=y
>>      CONFIG_ARM_LPAE=y
>>      kernel command line: user_debug=31
>>
>> A delay inserted in show_pte() for testing widens the race window and
>> makes the UAF reliably reproducible. On LPAE, the race works as
>> follows:
>>
>>    CPU 0 (fault path)                       CPU 1 (munmap)
>>    munmap(page 0) -> clears PTE[0]
>>    PTE/PMD pages remain
>>
>>    read page 0 -> page fault
>>      -> do_DataAbort()
>>        -> do_page_fault()
>>          -> lock_mm_and_find_vma() -> no VMA
>>             (mmap_read_lock released)
>>          -> __do_user_fault()
>>            -> show_pte(tsk->mm, addr)
>>              -> *pgd (valid)
>>              -> p4d/pud checks pass
>>
>>              -> [delay]                     munmap(page 1)
>>                                               -> clears PTE[1]
>>                                               -> PTE/PMD pages freed
>>                                               -> PGD cleared
>>
>>              -> pmd_offset(pud, addr)
>>                -> *pud=0 -> __va(0)
>>                -> dereference
>>                -> secondary data abort (kernel)
>>
>> Fix by taking mmap_read_lock() around show_pte() in __do_user_fault().
>> __do_user_fault() is called from process context with interrupts
>> enabled, so the context can sleep and mmap_read_lock() is safe here.
> This is a fault path which should only be called when something is
> already wrong, the mm lock may already be held (e.g. a kernel
> fault while already holding the mmap lock.) We can't take any locks
> here.
>

