Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C806CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1s9lw6tbe2htYbahVRtjD5lIa+YY9RGI9knjEL6DjU=; b=2F1UgF6zLcpZN73WiObAdQJMEW
	Tj/QrXnvfNyLxP1Yt1ARO1Mp/JPp6hji7Sdmsh8+9ka02Arzth+OWZYQt684VJ6FRZOaWCXYihJ7k
	KwzVZLRvsfKQ8iZsi+NN5pqerFd90sIzTgzGoTLu8/4+zo4asiZSrudRdLXERFlsFicaD80C97unu
	z4oXqbJUyZQvpzuU+HMhu8V6ZViUg4LFyLT1EUFbJtOJNi+hH9cwoy8FXPol4q7USk7eOut77Wl7I
	hFw0oa5S/3XW12wO9wUcq3o8tjSkv54XtjKougHzCx8TcRboZ4TCpEHe9nbF20iqjfS8jmUzLQx5N
	Jw8gru4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6F-0000000G5Ay-21uD;
	Fri, 05 Sep 2025 02:22:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuIEG-0000000EnYJ-3Thh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 22:14:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2977D1596;
	Thu,  4 Sep 2025 15:14:43 -0700 (PDT)
Received: from [10.57.58.14] (unknown [10.57.58.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46B793F63F;
	Thu,  4 Sep 2025 15:14:44 -0700 (PDT)
Message-ID: <75db1f58-98b3-463c-af4f-2ce9878cba9f@arm.com>
Date: Fri, 5 Sep 2025 00:14:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
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
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
 <22131943-3f92-4f5a-be28-7b668c07a25c@lucifer.local>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <22131943-3f92-4f5a-be28-7b668c07a25c@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_151452_909398_9C49A454 
X-CRM114-Status: GOOD (  13.05  )
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

On 04/09/2025 19:28, Lorenzo Stoakes wrote:
> Hi Kevin,
>
> This is causing a build failure:
>
> In file included from ./include/linux/mm.h:31,
>                  from mm/userfaultfd.c:8:
> mm/userfaultfd.c: In function ‘move_present_ptes’:
> ./include/linux/pgtable.h:247:41: error: statement with no effect [-Werror=unused-value]
>   247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
>       |                                         ^
> mm/userfaultfd.c:1103:9: note: in expansion of macro ‘arch_enter_lazy_mmu_mode’
>  1103 |         arch_enter_lazy_mmu_mode();
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h:248:54: error: expected expression before ‘)’ token
>   248 | #define arch_leave_lazy_mmu_mode(state) ((void)(state))
>       |                                                      ^
> mm/userfaultfd.c:1141:9: note: in expansion of macro ‘arch_leave_lazy_mmu_mode’
>  1141 |         arch_leave_lazy_mmu_mode();
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
>
> It seems you haven't carefully checked call sites here, please do very
> carefully recheck these - I see Yeoreum reported a mising kasan case, so I
> suggest you just aggressively grep this + make sure you've covered all
> bases :)

I did check all call sites pretty carefully and of course build-tested,
but my series is based on v6.17-rc4 - just like the calls Yeoreum
mentioned, the issue is that those calls are in mm-stable but not in
mainline :/ I suppose I should post a v2 rebased on mm-stable ASAP then?

- Kevin

