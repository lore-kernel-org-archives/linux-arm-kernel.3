Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED89CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPCgPoE70BetgCqXoAumCGOuKiFkJIVELItuY0uabRE=; b=njeESbetC5NX2lTvCOMwcRKAQ3
	qFITa8zXpq8XZLilld5wHUPSJjqWhI1FgoXaWOvK9Urt9BYw9Fu0lgpGcVvRagua47FLv20uENLgf
	Pe3RC6DXCGgBN+q/lqNc+TD7k7U7bayYSXJyQqpKHymT6fmQtNCnLetygCXus7d2FbvJToVuxKKBg
	6ESYO/+DQGdJiLPxZLAD2uaa7FKMsseIChiFVjUaHdi4RiuY0X2GW37MNjwc3V7JEcTUaL0DIuH1J
	CKM0vf/lUF/3gBNaJc0KsF3vy77eL61JBT9vPMkM5dwiwsGUDX6HAYiKigwydNnZW3LJKiJYOMdvI
	EPnCoU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPHe-00000005CHx-0rkI;
	Mon, 10 Nov 2025 10:38:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPHY-00000005CFP-19Nv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Nov 2025 10:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hPCgPoE70BetgCqXoAumCGOuKiFkJIVELItuY0uabRE=; b=T068XUEG9UoCeUU6wJivU9u95M
	OChfQHHJxFzsb/y95bIIeu7GhQaaJdSMs4gKgUuAyWhkrenXMHwXTNGqdpmEJbqj8otkDAAqVXPbM
	SuTlXimn8nmgOVnF2UEgCGJ+ocmjvSbSZbbGOalBWJR58K7My6O/2FKCQ3/hotf+JTI3VhmYvb7kd
	rEh+XJtpcAO131+kX9vSoM7IkOp6lnbBmBGyNIi2WxzOG9TcBxFKXHpTH4nn5OKcGykMHWANwNy8Y
	uMZupnzXUn/NQF5b+s1hEVLqCnrjBJV7xvMmPFLMRPax42vm8KcLT6mw+CDQxcR0P6kLxab+Az3fa
	bBH24Bfw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOPo-0000000AOyt-1xWg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:42:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4A3CFEC;
	Mon, 10 Nov 2025 02:37:43 -0800 (PST)
Received: from [10.57.39.147] (unknown [10.57.39.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EB953F66E;
	Mon, 10 Nov 2025 02:37:43 -0800 (PST)
Message-ID: <0d00dd6e-9e39-4ac6-8ea4-9407e75947eb@arm.com>
Date: Mon, 10 Nov 2025 11:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-6-kevin.brodsky@arm.com>
 <6a9c846f-22b6-4d5f-81dc-6cdcd4905952@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <6a9c846f-22b6-4d5f-81dc-6cdcd4905952@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_094224_787649_1FE7A6D3 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

On 07/11/2025 13:56, Ryan Roberts wrote:
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 6663ffd23f25..e6bf5c7311b5 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -122,6 +122,7 @@ config ARM64
>>  	select ARCH_WANTS_NO_INSTR
>>  	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
>>  	select ARCH_HAS_UBSAN
>> +	select ARCH_HAS_LAZY_MMU_MODE
> nit: This list is mostly in alphabetical order. Further up the list there are a
> lot of ARCH_HAS_* entries. Perhaps move it to the correct position in that lot?
> Then ARCH_HAS_UBSAN stays out of order on its own.

That's fair, it does look like it's mostly in order apart from
ARCH_HAS_UBSAN. Will move it further up.

- Kevin

