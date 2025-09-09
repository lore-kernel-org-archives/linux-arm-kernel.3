Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8639CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujoZwN7+39kxKbECl/cd7bSlB0kLqKwYgSZlv4ws8T4=; b=BtqtnmizCwRzooZWI84Q/qDX05
	ySaOkWTG2FaN4RzbO5mIDVnt63JMO1YBfY/TvKYOoSRkzmZovgs2pWs5eJK4ob6bGHzfwC2LY+Eyo
	tIlogOkF4t9KMGkJm6RD+kGbvaDIjaDVCo6sWsaMXpCDtBlXuUvAkuFiAI5NT7AfG0QAEGrFIHHLp
	iQOmu9bmn8PsAzfEhoAqOh/6IUFEXrKDX1F/A0CAWjMBucj88YLHI2jyIAx/Y+AD44Qjnmal00wwj
	+J0s+IZTeNwOcr4h4FTst+byKfpQV+9sa269WX8Oz9TQXqUSX8tcQFIIDu7Z86jPE3MvGLDsu17Nc
	xOnQ8gsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvXj-00000006NUn-2uFC;
	Tue, 09 Sep 2025 10:25:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuIW-00000005nRj-0YP8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:05:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E25F015A1;
	Tue,  9 Sep 2025 02:05:44 -0700 (PDT)
Received: from [10.57.60.124] (unknown [10.57.60.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7EF13F63F;
	Tue,  9 Sep 2025 02:05:39 -0700 (PDT)
Message-ID: <bd3958cc-f069-40a6-b201-7cab338e0cd9@arm.com>
Date: Tue, 9 Sep 2025 11:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
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
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <20250908224054.0a1969b493d8a837addd782e@linux-foundation.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250908224054.0a1969b493d8a837addd782e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_020556_264789_1F01E4AB 
X-CRM114-Status: GOOD (  22.89  )
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

On 09/09/2025 07:40, Andrew Morton wrote:
> On Mon,  8 Sep 2025 08:39:26 +0100 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>
>> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
>> (taking and returning no value). This is proving problematic in
>> situations where leave() needs to restore some context back to its
>> original state (before enter() was called). In particular, this
>> makes it difficult to support the nesting of lazy_mmu sections -
>> leave() does not know whether the matching enter() call occurred
>> while lazy_mmu was already enabled, and whether to disable it or
>> not.
>>
>> This patch gives all architectures the chance to store local state
>> while inside a lazy_mmu section by making enter() return some value,
>> storing it in a local variable, and having leave() take that value.
>> That value is typed lazy_mmu_state_t - each architecture defining
>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
>> For now we define it as int everywhere, which is sufficient to
>> support nesting.
>>
>> The diff is unfortunately rather large as all the API changes need
>> to be done atomically. Main parts:
> This has a build error:
>
>   CC      arch/x86/kernel/asm-offsets.s
> In file included from ./arch/x86/include/asm/irqflags.h:102,
>                  from ./include/linux/irqflags.h:18,
>                  from ./include/linux/spinlock.h:59,
>                  from ./include/linux/swait.h:7,
>                  from ./include/linux/completion.h:12,
>                  from ./include/linux/crypto.h:15,
>                  from arch/x86/kernel/asm-offsets.c:9:
> ./arch/x86/include/asm/paravirt.h: In function 'arch_enter_lazy_mmu_mode':
> ./arch/x86/include/asm/paravirt.h:534:16: error: 'LAZY_MMU_DEFAULT' undeclared (first use in this function)
>   534 |         return LAZY_MMU_DEFAULT;
>       |                ^~~~~~~~~~~~~~~~
> ./arch/x86/include/asm/paravirt.h:534:16: note: each undeclared identifier is re
>
> which gets fixed up later in the series.

Oh indeed good catch! I don't think there's an easy way to fix this
cleanly due to the header soup. Since it's just a temporary change, I
suggest:

diff --git a/arch/x86/include/asm/paravirt.h
b/arch/x86/include/asm/paravirt.h
index 65a0d394fba1..67b9549b4255 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -531,7 +531,7 @@ static inline lazy_mmu_state_t
arch_enter_lazy_mmu_mode(void)
 {
     PVOP_VCALL0(mmu.lazy_mode.enter);
 
-    return LAZY_MMU_DEFAULT;
+    return 0; /* LAZY_MMU_DEFAULT */
 }
 
 static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)


That will generate a trivial conflict with patch 4, naturally.

Should I send a v3 with that change?

- Kevin

