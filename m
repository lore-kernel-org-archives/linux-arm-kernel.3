Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77D2CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 10:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=St/jo3/IjoT+/tBd36JJNTe9cJMOpLH/Kfc1GffKIvY=; b=CjmpMgB//2xUpH57CLFt5JodRJ
	y3jm+aPr4UROdoK2bBol8/g13HSgUU5rgUIzycHvnZ5FNGEEA9HKgnI3x0k2dWN7OEYXLdhkig7mT
	yNR7xCD3KJPiEEoHaWBfUXfeRXQuwxb8Hxeywk3ypXJiDBum+GL4Ei/LWC0vstnrXs9ALflO566dX
	FKZzKCrJ4v0zAG5gpG/UMWHwu49lnotdMcwM1mT1VPXx98JQDb9tCHEgfnNxR3LFxCvEbPJ/S8cOz
	qbkIE23MuFve46pN3RQB7OfalhfDwH3TjedHMLWEmSX5wfftj9L2mb5NHFiT20VvLST4BGxhRT4S5
	vuGDg5lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvin-00000006S0U-36tV;
	Tue, 09 Sep 2025 10:37:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuNJ-00000005q0R-2OXF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:10:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A03615A1;
	Tue,  9 Sep 2025 02:10:44 -0700 (PDT)
Received: from [10.57.60.124] (unknown [10.57.60.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 358583F63F;
	Tue,  9 Sep 2025 02:10:37 -0700 (PDT)
Message-ID: <652720ae-131e-4de0-bc65-e5c1bdc46186@arm.com>
Date: Tue, 9 Sep 2025 11:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Nesting support for lazy MMU mode
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
 <Liam.Howlett@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <c07b8a65-7cef-4ddd-bd94-d2e275edc2a8@lucifer.local>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <c07b8a65-7cef-4ddd-bd94-d2e275edc2a8@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021053_745494_AFB6F563 
X-CRM114-Status: GOOD (  12.27  )
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

On 08/09/2025 18:56, Lorenzo Stoakes wrote:
> On Mon, Sep 08, 2025 at 08:39:24AM +0100, Kevin Brodsky wrote:
>> When the lazy MMU mode was introduced eons ago, it wasn't made clear
>> whether such a sequence was legal:
>>
>> 	arch_enter_lazy_mmu_mode()
>> 	...
>> 		arch_enter_lazy_mmu_mode()
>> 		...
>> 		arch_leave_lazy_mmu_mode()
>> 	...
>> 	arch_leave_lazy_mmu_mode()
>>
>> It seems fair to say that nested calls to
>> arch_{enter,leave}_lazy_mmu_mode() were not expected, and most
>> architectures never explicitly supported it.
>
> This is compiling with CONFIG_USERFAULTFD at all commits and series is
> compiling with allmodconfig plus all mm selftests are passing so from my
> side this looks good, thanks for addressing issues and rebasing! :)

Great thank you for that extensive testing, very appreciated! Shall I
add your Reviewed-by to the whole series?

- Kevin

