Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B24D1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJurdQX8qj6ifDDdWMxroqyLo5BS65+WtQIh7u6Nuto=; b=JBMxAHD9qmR9uSsdVZYbafi0jG
	pTawFAj2i/qtV2Kw6liw6r41aSzBC6whqPfSXs2dH5xOsEo5Rm2U1TOeEpPgme+Ag/eXR0qFkGamS
	7w88cp6UqcLQrch81uh9FvRRZfIFtAWaIzIdde690EcGLJUh/gfpcVywzfzGpJ4PgZKSWTHMf2q/j
	AsdeoSPBBN/+IPlLeckZAufgGAOE52de1hMm1hOWn2rQMeJliBPQEujhsNQSz9fSWpSyZymo4mqc1
	t2fMGSbVwgIx2UcKuwjYw7C4Nh3h8X7KThZ7OOBZmRY68W4vRn+csM4n3OIHuRlUO4NoaC9oUKsBl
	Vi2+p0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQi6T-00000006I7T-2PVJ;
	Wed, 03 Dec 2025 08:20:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQi6Q-00000006I6x-3wIM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 08:20:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B547339;
	Wed,  3 Dec 2025 00:20:38 -0800 (PST)
Received: from [10.57.45.92] (unknown [10.57.45.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49CE33F73B;
	Wed,  3 Dec 2025 00:20:37 -0800 (PST)
Message-ID: <51339cdd-3c73-433c-abf7-24553e0fbd6b@arm.com>
Date: Wed, 3 Dec 2025 09:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] mm: introduce generic lazy_mmu helpers
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-7-kevin.brodsky@arm.com>
 <07ffb66d-1e74-4634-bccb-75575b3862af-agordeev@linux.ibm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <07ffb66d-1e74-4634-bccb-75575b3862af-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_002047_023014_857B0EB9 
X-CRM114-Status: GOOD (  12.58  )
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

On 28/11/2025 14:50, Alexander Gordeev wrote:
> Would it make sense to explicitly describe the policy wrt sleeping while
> in lazy MMU mode? If I understand the conclusion of conversation right:
>
> * An arch implementation may disable preemption, but then it is arch
>   responsibility not to call any arch-specific code that might sleep;
> * As result, while in lazy MMU mode the generic code should never
>   call a code that might sleep;

I think that's a good summary, and I agree that the second point is not
obvious from the comment in <linux/pgtable.h>. This series it not making
any change in that respect, but I'll add a clarification in this patch
(or a separate patch).

- Kevin

