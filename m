Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7FAD2F7EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/A7vZpgIBnKA8LnxsqL7KkP6nyGfOKKNJo36CMVlRE=; b=mPhpFkDS7dCuU1yNvaOzhkSfSm
	mIBM0gHwmKdBmnPApT9Wxi/QiKGoWDEUF2HJS3iUZRQku6svEcTmWbpbhziFYAqR16s4NQCcRixrS
	SIf7vvOVtpRoezXBWP0yD/36TMlWBw72G2pYNs3bD0oKRnjykzHzXpvUQiibuxqQ2BX0GnNHkdMVB
	R8o4l43hOc8L8+w2I621seDgsJPx/tf4lzb8NWQFtrPtmPK1naym2x/cWvAbOT/u0Pwp+Vp59wR0d
	aE5cweNmcCBDsh5SjE2z+uB75pLvdz1iYks0hTzegahLjtK/Cjv11J5enNcw2bsvLYuCUjyNxpQ+Y
	9DpfIJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRVQg-00000009VRX-0xx3;
	Fri, 05 Dec 2025 13:00:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRVQZ-00000009VR8-0bhA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 13:00:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A482F19F6;
	Fri,  5 Dec 2025 05:00:42 -0800 (PST)
Received: from [10.44.160.68] (e126510-lin.lund.arm.com [10.44.160.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 164973F59E;
	Fri,  5 Dec 2025 05:00:39 -0800 (PST)
Message-ID: <f07f5f70-eb4c-4e45-b7d6-96c8455255d2@arm.com>
Date: Fri, 5 Dec 2025 14:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/12] Nesting support for lazy MMU mode
To: Venkat <venkat88@linux.ibm.com>
Cc: linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
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
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <94889730-1AEF-458F-B623-04092C0D6819@linux.ibm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <94889730-1AEF-458F-B623-04092C0D6819@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_050051_250264_48DD2487 
X-CRM114-Status: UNSURE (   9.45  )
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

On 03/12/2025 17:08, Venkat wrote:
> [...]
> Tested this patch series by applying on top of mm-unstable, on both HASH and RADIX MMU, and all tests are passed on both MMU’s.
>
> Ran: cache_shape, copyloops, mm from linux source, selftests/powerpc/ and ran memory-hotplug from selftests/. Also ran below tests from avocado misc-test repo.
>
> Link to repo: https://github.com/avocado-framework-tests/avocado-misc-tests
>
> avocado-misc-tests/memory/stutter.py
> avocado-misc-tests/memory/eatmemory.py
> avocado-misc-tests/memory/hugepage_sanity.py
> avocado-misc-tests/memory/fork_mem.py
> avocado-misc-tests/memory/memory_api.py
> avocado-misc-tests/memory/mprotect.py
> avocado-misc-tests/memory/vatest.py avocado-misc-tests/memory/vatest.py.data/vatest.yaml
> avocado-misc-tests/memory/transparent_hugepages.py
> avocado-misc-tests/memory/transparent_hugepages_swapping.py
> avocado-misc-tests/memory/transparent_hugepages_defrag.py
> avocado-misc-tests/memory/ksm_poison.py
>
> If its good enough, please add below tag for PowerPC changes.
>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Many thanks for the testing! Will add your tag to patch 1, 3 and 10.

- Kevin

