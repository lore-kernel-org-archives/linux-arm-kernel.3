Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F99D2E03D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qkpK6VYra3/QIYrzaMXVMom4EBGPblW7Kk1PkiL1pA=; b=0PeYqCYzzfTnCNyvznXXnkc1Mc
	DPDxDsvffURbwMlF5aVJ2nlVig14xVxwNpqAECcrLgd36MhU+PqLAbU/D1JUw5FQTr6Usaf0SaXKo
	No171JRXuuJ/tAvuaafPlRcuekJb0w0Gle3HLwJymv+oz5mQIm9GE20PJTp1+F9lc58tH2Ui7otWp
	e/gKRTcdjAiH/0DfavQWvPqgppAgeaAT19Swpm9MMPZ+Sm3T5xuYbq5CJz7wVmpvSWdi2J7WTnLpB
	gy/MC7kCOiuULAQGu1bxmyq9IQpNmQGX0QElAUVgMIqcFdlTNIbPVM1A1xpkepKYWRtXjIxn2WhvR
	G0v/I75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vc5-000000009Xu-3WLj;
	Thu, 24 Oct 2024 11:02:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vOm-000000007W5-2xmR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:49:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A7CE339;
	Thu, 24 Oct 2024 03:49:29 -0700 (PDT)
Received: from [10.57.88.37] (unknown [10.57.88.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 489843F71E;
	Thu, 24 Oct 2024 03:48:57 -0700 (PDT)
Message-ID: <df753b4a-0cf1-4544-b073-0ebf2bb71ef2@arm.com>
Date: Thu, 24 Oct 2024 11:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Content-Language: en-GB
To: Thomas Tai <thomas.tai@oracle.com>, Petr Tesarik <ptesarik@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Greg Marsden
 <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241017142752.17f2c816@mordecai.tesarici.cz>
 <aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
 <fed3b427-a600-4ce5-afef-4ccbfff64931@oracle.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <fed3b427-a600-4ce5-afef-4ccbfff64931@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_034900_865490_73750D9D 
X-CRM114-Status: GOOD (  19.27  )
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

On 23/10/2024 22:00, Thomas Tai wrote:
> 
> On 10/17/2024 8:32 AM, Ryan Roberts wrote:
>> On 17/10/2024 13:27, Petr Tesarik wrote:
>>> On Mon, 14 Oct 2024 11:55:11 +0100
>>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>
>>>> [...]
>>>> The series is arranged as follows:
>>>>
>>>>    - patch 1:       Add macros required for converting non-arch code to support
>>>>               boot-time page size selection
>>>>    - patches 2-36:  Remove PAGE_SIZE compile-time constant assumption from all
>>>>               non-arch code
>>> I have just tried to recompile the openSUSE kernel with these patches
>>> applied, and I'm running into this:
>>>
>>>    CC      arch/arm64/hyperv/hv_core.o
>>> In file included from ../arch/arm64/hyperv/hv_core.c:14:0:
>>> ../include/linux/hyperv.h:158:5: error: variably modified ‘reserved2’ at file
>>> scope
>>>    u8 reserved2[PAGE_SIZE - 68];
>>>       ^~~~~~~~~
>>>
>>> It looks like one more place which needs a patch, right?
>> As mentioned in the cover letter, so far I've only converted enough to get the
>> defconfig *image* building (i.e. no modules). If you are compiling a different
>> config or compiling the modules for defconfig, you will likely run into these
>> types of issues.
> 
> It would be nice if you could provide the defconfig you are using; I also ran
> into build issues when using the arch/arm64/configs/defconfig.

git clean -xdfq
make defconfig

# Set CONFIG_ARM64_BOOT_TIME_PAGE_SIZE
./scripts/config --disable CONFIG_ARM64_4K_PAGES
./scripts/config --disable CONFIG_ARM64_16K_PAGES
./scripts/config --disable CONFIG_ARM64_64K_PAGES
./scripts/config --disable CONFIG_ARM64_BOOT_TIME_PAGE_SIZE
./scripts/config --enable CONFIG_ARM64_BOOT_TIME_PAGE_SIZE

# Set ARM64_VA_BITS_48
./scripts/config --disable ARM64_VA_BITS_36
./scripts/config --disable ARM64_VA_BITS_39
./scripts/config --disable ARM64_VA_BITS_42
./scripts/config --disable ARM64_VA_BITS_47
./scripts/config --disable ARM64_VA_BITS_48
./scripts/config --disable ARM64_VA_BITS_52
./scripts/config --enable ARM64_VA_BITS_48

# Optional: filesystems known to compile with boot-time page size
./scripts/config --enable CONFIG_SQUASHFS_LZ4
./scripts/config --enable CONFIG_SQUASHFS_LZO
./scripts/config --enable CONFIG_SQUASHFS_XZ
./scripts/config --enable CONFIG_SQUASHFS_ZSTD
./scripts/config --enable CONFIG_XFS_FS

# Optional: trace stuff known to compile with boot-time page size
./scripts/config --enable CONFIG_FTRACE
./scripts/config --enable CONFIG_FUNCTION_TRACER
./scripts/config --enable CONFIG_KPROBES
./scripts/config --enable CONFIG_HIST_TRIGGERS
./scripts/config --enable CONFIG_FTRACE_SYSCALLS

# Optional: misc mm stuff known to compile with boot-time page size
./scripts/config --enable CONFIG_PTDUMP_DEBUGFS
./scripts/config --enable CONFIG_READ_ONLY_THP_FOR_FS
./scripts/config --enable CONFIG_USERFAULTFD

# Optional: mm debug stuff known compile with boot-time page size
./scripts/config --enable CONFIG_DEBUG_VM
./scripts/config --enable CONFIG_DEBUG_VM_MAPLE_TREE
./scripts/config --enable CONFIG_DEBUG_VM_RB
./scripts/config --enable CONFIG_DEBUG_VM_PGFLAGS
./scripts/config --enable CONFIG_DEBUG_VM_PGTABLE
./scripts/config --enable CONFIG_PAGE_TABLE_CHECK
./scripts/config --enable CONFIG_PAGE_TABLE_CHECK_ENFORCED

make olddefconfig
make -s -j`nproc` Image

So I'm explicitly only building and booting the kernel image, not the modules.
The kernel image contains all the drivers needed to get a VM up and running
under QEMU/KVM.

Thanks,
Ryan

>  
> Thank you,
> Thomas
> 
>>
>> That said, I do have some patches to fix Hyper-V, which Michael Kelley was kind
>> enough to send me.
>>
>> I understand that Suse might be able to help with wider performance testing - if
>> that's the reason you are trying to compile, you could send me your config and
>> I'll start working on fixing up other drivers?
>>
>> Thanks,
>> Ryan
>>
>>> Petr T
>>


