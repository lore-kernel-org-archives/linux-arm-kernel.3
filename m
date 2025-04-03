Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49670C36018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 02:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=If1ZsNgrBBDERc1MRA+MXXmaA+so/oBkFX2K0q6MNvI=; b=y3pFcR2DPE2S+kVqyy1/sM7cML
	l0HxlPylzBmQDmzHjhJVkOMIpGGJuFLmi1ARsCGFQb8E/SqZl9Zd3a9YYWOFZAYqiecZdLHzxKIdk
	CEEaINeon+f2IOhJldVmN6GOJsFh3Iykc0bqYY1zj8N74tTpfKNkHCipKyKtzn+2xddLukbEj2wrO
	t6EC4rQgA5hPdrcqW6KqCmGDfb+jtjHnbZPQZOoxB5rC2bq0W4i+7ZioAZ/DRErCcfZbrNxukHa5H
	7U8eTQwWm3h0x353DWSEuUoWtyuQJ9ABIF+EsY1Y8W/II12mV/TKYxNRJVrOg2RugKKE3Pubpc7fs
	5zwdeQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Aec-00000007ctf-3edR;
	Thu, 03 Apr 2025 02:50:06 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Acr-00000007cg0-0wuW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 02:48:19 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZSmKq0chQzHrDQ;
	Thu,  3 Apr 2025 10:44:47 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B33E31800EB;
	Thu,  3 Apr 2025 10:48:07 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 3 Apr 2025 10:48:05 +0800
Message-ID: <82bf1b64-d887-c50b-17b1-2de978896d44@huawei.com>
Date: Thu, 3 Apr 2025 10:48:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v13 2/5] arm64: add support for ARCH_HAS_COPY_MC
To: "Luck, Tony" <tony.luck@intel.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-3-tongtiangen@huawei.com> <Z6zKfvxKnRlyNzkX@arm.com>
 <df40840d-e860-397d-60bd-02f4b2d0b433@huawei.com>
 <Z-GOKgBNxKWQ21w4@agluck-desk3>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Z-GOKgBNxKWQ21w4@agluck-desk3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_194817_635708_C3C4A3B0 
X-CRM114-Status: GOOD (  30.81  )
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



在 2025/3/25 0:54, Luck, Tony 写道:
> On Fri, Feb 14, 2025 at 09:44:02AM +0800, Tong Tiangen wrote:
>>
>>
>> 在 2025/2/13 0:21, Catalin Marinas 写道:
>>> (catching up with old threads)
>>>
>>> On Mon, Dec 09, 2024 at 10:42:54AM +0800, Tong Tiangen wrote:
>>>> For the arm64 kernel, when it processes hardware memory errors for
>>>> synchronize notifications(do_sea()), if the errors is consumed within the
>>>> kernel, the current processing is panic. However, it is not optimal.
>>>>
>>>> Take copy_from/to_user for example, If ld* triggers a memory error, even in
>>>> kernel mode, only the associated process is affected. Killing the user
>>>> process and isolating the corrupt page is a better choice.
>>>
>>> I agree that killing the user process and isolating the page is a better
>>> choice but I don't see how the latter happens after this patch. Which
>>> page would be isolated?
>>
>> The SEA is triggered when the page with hardware error is read. After
>> that, the page is isolated in memory_failure() (mf). The processing of
>> mf is mentioned in the comments of do_sea().
>>
>> /*
>>   * APEI claimed this as a firmware-first notification.
>>   * Some processing deferred to task_work before ret_to_user().
>>   */
>>
>> Some processing include mf.
>>
>>>
>>>> Add new fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR to identify insn
>>>> that can recover from memory errors triggered by access to kernel memory,
>>>> and this fixup type is used in __arch_copy_to_user(), This make the regular
>>>> copy_to_user() will handle kernel memory errors.
>>>
>>> Is the assumption that the error on accessing kernel memory is
>>> transient? There's no way to isolate the kernel page and also no point
>>> in isolating the destination page either.
>>
>> Yes, it's transient, the kernel page in mf can't be isolated, the
>> transient access (ld) of this kernel page is currently expected to kill
>> the user-mode process to avoid error spread.
>>
>>
>> The SEA processes synchronization errors. Only hardware errors on the
>> source page can be detected (Through synchronous ld insn) and processed.
>> The destination page cannot be processed.
> 
> I've considered the copy_to_user() case as only partially fixable. There
> are lots of cases to consider:
> 
> 1) Many places where drivers copy to user in ioctl(2) calls.
>     Killing the application solves the immediate problem, but if
>     the problem with kernel memory is not transient, then you
>     may run into it again.
> 
> 2) Copy from Linux page cache to user for a read(2) system call.
>     This one is a candidate for recovery. Might need help from the
>     file system code. If the kernel page is a clean copy of data in
>     the file system, then drop this page and re-read from storage
>     into a new page. Then resume the copy_to_user().
>     If the page is modified, then need some file system action to
>     somehow mark this range of addresses in the file as lost forever.
>     First step in tackling this case is identifying that the source
>     address is a page cache page.
> 
> 3) Probably many other places where the kernel copies to user for
>     other system calls. Would need to look at these on a case by case
>     basis. Likely most have the same issue as ioctl(2) above.

1) 3)
Yes, in extreme cases, user-mode processes may be killed all the time.
The hardware error that repeatedly triggered in the same page, in this
case, firmware maybe report a fatal error, if yes, this problem can be
solved.

2)
This is indeed a workaround, somewhat complex, but it seems worthwhile
to avoid kernel panic.

Sorry for didn't catch your reply in time:)

Thanks,
Tong.

> 
> -Tony
> 
> .

