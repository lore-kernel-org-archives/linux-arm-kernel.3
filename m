Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D14CE7AA4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9p6zNQaZofKPXDVbEjLNpyZi7K3pMHGouHv6P32PmOQ=; b=3fy1RtoyRfVD8S7UKHwJQxHfXZ
	LzHyO6NhLqO70mKrGBX5Qh64C49TlDzPsJMj355df03bnIYNWf0NiCTixfHoXDENrpLeVeRIL8/j4
	F+4+DJms4rdIvJn3ojOTuMuSUWJyib7A6YD8bQyJdKUe1L87fYJF7IZoy2gaYt7hPngHDWIbaC05q
	/WBXiKJromnXy6ie9gbKZQMFxEDRV8k5hFTEF2ZKJTofin/EoRp94rajZhoeuombCbfV17P8FHZt2
	jDqNQXNgbN7apjVGy+FDuIBJqaZ/s/qhHCyCHvXUQiq+UK3FCXH0dzUBlQaWUZ+onOqICsLsNdWDk
	TJVvxVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqRG-0000000BwwF-3Mvh;
	Fri, 14 Nov 2025 09:49:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqRF-0000000Bww7-2OLd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3C176016E;
	Fri, 14 Nov 2025 09:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEEFDC4CEF5;
	Fri, 14 Nov 2025 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763113792;
	bh=3uA3zpQxd5hQBezqb4ncqzRvItd0P/4i4e8EDinYtIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lih/M3wgEkun+8Ov6VUfh8QRRTPJ6iq3V1SkzkEvlhlcxf8RQlaOMprDBOCZdqgDz
	 AxQ9ZhGdMjG6Jdp/t7fmxdmgHU7ZpG8/+xkqR5r9QsR8fdryYcWYA6bqaOBsAdeqNI
	 pAs/X9jdGbwjXJr3BYEkmHCiJA5uM7z+ny4U7b+pZVuvb2uyEMATodTBZNPA0DFGbL
	 pjB6umIxaKWxXCbzRsuW+adKY7dOQaPY70b33BPlF25nbCzZhdOoWUEVhGmnC35rnu
	 N1KBPCNsoeG+xsaM7l0pTjs7XHsisdNUdhCyeIFZkDpJS4N9vAvuzDDqpLsSz7jLT8
	 l/qtSyz4wS2tw==
Message-ID: <2bb9f0c2-a258-4a57-882e-9629f9cc81e6@kernel.org>
Date: Fri, 14 Nov 2025 10:49:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v6 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
To: Huang Ying <ying.huang@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Yang Shi <yang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Yin Fengwei <fengwei_yin@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20251114085403.101552-1-ying.huang@linux.alibaba.com>
 <20251114085403.101552-3-ying.huang@linux.alibaba.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251114085403.101552-3-ying.huang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 14.11.25 09:54, Huang Ying wrote:
> A multi-thread customer workload with large memory footprint uses
> fork()/exec() to run some external programs every tens seconds.  When
> running the workload on an arm64 server machine, it's observed that
> quite some CPU cycles are spent in the TLB flushing functions.  While
> running the workload on the x86_64 server machine, it's not.  This
> causes the performance on arm64 to be much worse than that on x86_64.
> 
> During the workload running, after fork()/exec() write-protects all
> pages in the parent process, memory writing in the parent process
> will cause a write protection fault.  Then the page fault handler
> will make the PTE/PDE writable if the page can be reused, which is
> almost always true in the workload.  On arm64, to avoid the write
> protection fault on other CPUs, the page fault handler flushes the TLB
> globally with TLBI broadcast after changing the PTE/PDE.  However, this
> isn't always necessary.  Firstly, it's safe to leave some stale
> read-only TLB entries as long as they will be flushed finally.
> Secondly, it's quite possible that the original read-only PTE/PDEs
> aren't cached in remote TLB at all if the memory footprint is large.
> In fact, on x86_64, the page fault handler doesn't flush the remote
> TLB in this situation, which benefits the performance a lot.
> 
> To improve the performance on arm64, make the write protection fault
> handler flush the TLB locally instead of globally via TLBI broadcast
> after making the PTE/PDE writable.  If there are stale read-only TLB
> entries in the remote CPUs, the page fault handler on these CPUs will
> regard the page fault as spurious and flush the stale TLB entries.
> 
> To test the patchset, make the usemem.c from
> vm-scalability (https://git.kernel.org/pub/scm/linux/kernel/git/wfg/vm-scalability.git).
> support calling fork()/exec() periodically.  To mimic the behavior of
> the customer workload, run usemem with 4 threads, access 100GB memory,
> and call fork()/exec() every 40 seconds.  Test results show that with
> the patchset the score of usemem improves ~40.6%.  The cycles% of TLB
> flush functions reduces from ~50.5% to ~0.3% in perf profile.
> 
> Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: Yin Fengwei <fengwei_yin@linux.alibaba.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> ---

(no need to resend just for acks/rbs, maintainers can pick that up)

Reviewed-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David

