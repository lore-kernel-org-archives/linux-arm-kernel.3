Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3058CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyqZHguj4pWVxVzjCwOW7QzekGnxMtJdbRxBmWKZji0=; b=qLlKEmfYUqYQLauvp6VPX6UQur
	DXJiHGK5s+gF5cUbGwnGiFpsbYJbs+Pkr9NXwQ/4B8Wnao5bcH7M1hXvttOfv6b5jO0e4xNMTcxPd
	xIR1nRkjcQSrnojlLyYct6n+bd6PJfxPHDab0eMUm10V8zBQ9iEy0g9EsRlDw9fnt90Soevtq4R+x
	NA8SYLYrEbDCW95KBFuTzFs0K7ytvjim5cowaG+ND8KyQli83w6ACSzD1EHSTj2APGonEp9xRJPbx
	S+lde4XmcKu/eFEZCLEGQ30oU7PDaHAVQZuWWXaOjhiGmswg6X1l0sA8ghKlTWsO61yU0UGmjAOE/
	02jOacEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnGz-0000000CtHP-1IPM;
	Mon, 20 Oct 2025 10:37:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnGx-0000000CtGS-2eWq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:37:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6116D1063;
	Mon, 20 Oct 2025 03:37:42 -0700 (PDT)
Received: from [10.57.65.147] (unknown [10.57.65.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB2C53F63F;
	Mon, 20 Oct 2025 03:37:41 -0700 (PDT)
Message-ID: <3836a43f-809e-419d-a85d-74606d9daa0f@arm.com>
Date: Mon, 20 Oct 2025 12:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/13] mm: introduce CONFIG_ARCH_LAZY_MMU
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-6-kevin.brodsky@arm.com>
 <aPNjd2dg3YN-TZKH@kernel.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <aPNjd2dg3YN-TZKH@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_033751_736655_C679F3E6 
X-CRM114-Status: GOOD (  10.70  )
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

On 18/10/2025 11:52, Mike Rapoport wrote:
>> @@ -231,7 +231,7 @@ static inline int pmd_dirty(pmd_t pmd)
>>   * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
>>   * and the mode cannot be used in interrupt context.
>>   */
>> -#ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>> +#ifndef CONFIG_ARCH_LAZY_MMU
>>  static inline void arch_enter_lazy_mmu_mode(void) {}
>>  static inline void arch_leave_lazy_mmu_mode(void) {}
>>  static inline void arch_flush_lazy_mmu_mode(void) {}
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 0e26f4fc8717..2fdcb42ca1a1 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -1372,6 +1372,9 @@ config PT_RECLAIM
>>  config FIND_NORMAL_PAGE
>>  	def_bool n
>>  
>> +config ARCH_LAZY_MMU
>> +	bool
>> +
> I think a better name would be ARCH_HAS_LAZY_MMU and the config option fits
> better to arch/Kconfig.

Sounds fine by me - I'm inclined to make it slightly longer still,
ARCH_HAS_LAZY_MMU_MODE, to avoid making "LAZY_MMU" sound like some HW
feature.

- Kevin

