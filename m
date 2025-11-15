Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46EECEACF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 00:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htUByUHiQNU0PaaZJdOzX/xk7D/ge5gLRVLcI608Ows=; b=hxoo7NPEpkpcnG/M9lab2fEil7
	aDavneKLM0yEB972QBLAOzSPoL9acX3Pj2gCAoFCoU4t2ix7R4vq+Cqv56sdfd42wml1bdTbxlsym
	ro5FXZ8EX7R57TPV4k3KU1GDNybA3b9ZmJQu/Mc1E62wzYWL085sqEqaclx8gxI63B0PMTWP1vWt/
	uI+LaHyAYAVPAXc9XBv+F0V+XxJoZ3RdjXtCtBeNZUEKYIOJWbpxoERPx/ngBANv+HWyvENh5/uHi
	VUOS4yblRlcNjmWZ5ioOorIP2jRfWvArnj+MweQnuMIS3QPieS4WiGo22355sP5DMukVCECfnB7Zs
	aFU/4nrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4Tk-0000000DIew-1QJo;
	Sat, 15 Nov 2025 00:49:24 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4Th-0000000DIeT-00tL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 00:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763167756; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=htUByUHiQNU0PaaZJdOzX/xk7D/ge5gLRVLcI608Ows=;
	b=HFxIY/R6zaU+tEdfztmjxPmjAs/NjtHZmfF8J0i65XeYXWJ6J38OJKOxmyadiZtX/Zjvm3/pDcXrMy853WPt3cQtnrkMIOWF4TODHZu3cJb150x1RaNrxknDOxQvMdB9aL1azHz2C6dp+l811GvhIX7xmaC9/1OBUV9zc8L/u5c=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WsOJfMa_1763167753 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 15 Nov 2025 08:49:14 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,  Barry Song <baohua@kernel.org>,
  Zi Yan <ziy@nvidia.com>,  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
  Vlastimil Babka <vbabka@suse.cz>,  Baolin Wang
 <baolin.wang@linux.alibaba.com>,  Yang Shi <yang@os.amperecomputing.com>,
  "Christoph Lameter (Ampere)" <cl@gentwo.org>,  Dev Jain
 <dev.jain@arm.com>,  Anshuman Khandual <anshuman.khandual@arm.com>,
  Kefeng Wang <wangkefeng.wang@huawei.com>,  Kevin Brodsky
 <kevin.brodsky@arm.com>,  Yin Fengwei <fengwei_yin@linux.alibaba.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH -v6 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
In-Reply-To: <2bb9f0c2-a258-4a57-882e-9629f9cc81e6@kernel.org> (David
	Hildenbrand's message of "Fri, 14 Nov 2025 10:49:45 +0100")
References: <20251114085403.101552-1-ying.huang@linux.alibaba.com>
	<20251114085403.101552-3-ying.huang@linux.alibaba.com>
	<2bb9f0c2-a258-4a57-882e-9629f9cc81e6@kernel.org>
Date: Sat, 15 Nov 2025 08:49:12 +0800
Message-ID: <87pl9kf7cn.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_164921_681763_5522FF54 
X-CRM114-Status: GOOD (  16.41  )
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

"David Hildenbrand (Red Hat)" <david@kernel.org> writes:

> On 14.11.25 09:54, Huang Ying wrote:
>> A multi-thread customer workload with large memory footprint uses
>> fork()/exec() to run some external programs every tens seconds.  When
>> running the workload on an arm64 server machine, it's observed that
>> quite some CPU cycles are spent in the TLB flushing functions.  While
>> running the workload on the x86_64 server machine, it's not.  This
>> causes the performance on arm64 to be much worse than that on x86_64.
>> During the workload running, after fork()/exec() write-protects all
>> pages in the parent process, memory writing in the parent process
>> will cause a write protection fault.  Then the page fault handler
>> will make the PTE/PDE writable if the page can be reused, which is
>> almost always true in the workload.  On arm64, to avoid the write
>> protection fault on other CPUs, the page fault handler flushes the TLB
>> globally with TLBI broadcast after changing the PTE/PDE.  However, this
>> isn't always necessary.  Firstly, it's safe to leave some stale
>> read-only TLB entries as long as they will be flushed finally.
>> Secondly, it's quite possible that the original read-only PTE/PDEs
>> aren't cached in remote TLB at all if the memory footprint is large.
>> In fact, on x86_64, the page fault handler doesn't flush the remote
>> TLB in this situation, which benefits the performance a lot.
>> To improve the performance on arm64, make the write protection fault
>> handler flush the TLB locally instead of globally via TLBI broadcast
>> after making the PTE/PDE writable.  If there are stale read-only TLB
>> entries in the remote CPUs, the page fault handler on these CPUs will
>> regard the page fault as spurious and flush the stale TLB entries.
>> To test the patchset, make the usemem.c from
>> vm-scalability (https://git.kernel.org/pub/scm/linux/kernel/git/wfg/vm-scalability.git).
>> support calling fork()/exec() periodically.  To mimic the behavior of
>> the customer workload, run usemem with 4 threads, access 100GB memory,
>> and call fork()/exec() every 40 seconds.  Test results show that with
>> the patchset the score of usemem improves ~40.6%.  The cycles% of TLB
>> flush functions reduces from ~50.5% to ~0.3% in perf profile.
>> Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Reviewed-by: Barry Song <baohua@kernel.org>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: Yang Shi <yang@os.amperecomputing.com>
>> Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
>> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
>> Cc: Yin Fengwei <fengwei_yin@linux.alibaba.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> ---
>
> (no need to resend just for acks/rbs, maintainers can pick that up)

Sure.

> Reviewed-by: David Hildenbrand (Red Hat) <david@kernel.org>

Thank you David!

Hi, Maintainers,

I have collected some acks/rbs.  What do you think about the patchset?
What do I need to do for the next step?

---
Best Regards,
Huang, Ying

