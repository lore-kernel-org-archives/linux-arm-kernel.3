Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E964606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u+Q2Kujk;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PgonC+xg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=79YBG1MTJksEt9E+ZEM8hvdUfU6uD2rjqfjHiSJeDqg=; b=u+Q2Kujk8Z2eKOL3HIVQMFdniP
	l/wwRP3AD0rqthpvx4rJLmL2CktxtJvWR0dXkH35682g87+UhGs8M3HKf2G8JnLiA0FqfJr7YbTP0
	XmShkds56UoNjT2hnqG+VCIMFYbi85vdKX9XA9Sn7jJGPW5X+Xmc9R7VenyECg7OWxvqMvvT797fe
	SzgBhDnuWZZjEfMGMq/eQzqpY22OOiB1umNMCf+OpD6NMrQaqCMr+l3DlNk+/V5QJMJBqVUc0AfV+
	f4DyIhVg/G3gKWL7rebUR2auu2h9584H/KnNwEXZxxb6N9igQ9ontZlM0uS3y9W5PK4K0trFmA1Rv
	2Soc9BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAV7-00000001hCj-1Jh4;
	Tue, 03 Nov 2026 09:08:17 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAV2-00000001hBe-2its
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793696888; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=79YBG1MTJksEt9E+ZEM8hvdUfU6uD2rjqfjHiSJeDqg=;
	b=PgonC+xgwvz9dGLU2be/n5WdEb6+F6A17VdqHGG3wjuuOCjig83I7AP2KSRWPuwTvJRTKnowzzVFi/3Ibrb82nh70Tgk01Y8bHbPSF8FzyQ695C2BY+7wAoBjYyE6+32JqTXp4W9WVMYWUGhdPQnApaDL/29uTJrPwd62/gDFhU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XE2M7Xq_1793696887;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0XE2M7Xq_1793696887 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 17:08:07 +0800
Date: Tue, 3 Nov 2026 17:08:06 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Usama Anjum <usama.anjum@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, Mark Rutland <mark.rutland@arm.com>, 
	Huang Ying <ying.huang@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <dzxbsk2na4lax2d4wrahwfvshim5gfeacyocas6pzrbtgndzhy@dxizajcog2hb>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <b6f0d10a-d098-43cc-b923-0245af5f51f0@arm.com>
 <auR9iDfUxqz3ExP8@willie-the-truck>
 <auSLH65dv2nEctXd@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auSLH65dv2nEctXd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_010813_224582_05CA7D0D 
X-CRM114-Status: GOOD (  38.08  )
X-Spam-Score: -15.6 (---------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 12:18:39PM +0800, Catalin Marinas wrote:
> On Fri, Oct 30, 2026 at 11:20:40AM +0000, Will Deacon wrote:
> > On Wed, Oct 28, 2026 at 02:47:19PM +0000, Usama Anjum wrote:
> > > On 23/05/2026 2:47 pm, Linu Cherian wrote:
> > > > From: Ryan Roberts <ryan.roberts@arm.com>
> > > >
> > > > There are 3 variants of tlb flush that invalidate user mappings:
> > > > flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
> > > > would previously unconditionally broadcast their tlbis to all cpus in
> > > > the inner shareable domain.
> > > >
> > > > But this is a waste of effort if we can prove that the mm for which we
> > > > are flushing the mappings has only ever been active on the local cpu. In
> > > > that case, it is safe to avoid the broadcast and simply invalidate the
> > > > current cpu.
> > > >
> > > > So let's track in mm_context_t::active_cpu either the mm has never been
> > > > active on any cpu, has been active on more than 1 cpu, or has been
> > > > active on precisely 1 cpu - and in that case, which one. We update this
> > > > when switching context, being careful to ensure that it gets updated
> > > > *before* installing the mm's pgtables. On the reader side, we ensure we
> > > > read *after* the previous write(s) to the pgtable(s) that necessitated
> > > > the tlb flush have completed. This guarrantees that if a cpu that is
> > > > doing a tlb flush sees it's own id in active_cpu, then the old pgtable
> > > > entry cannot have been seen by any other cpu and we can flush only the
> > > > local cpu.
> > > >
> > > > Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> > > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > > Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> > > > [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
> > > > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > > > ---
> > > > Changelog from RFC v1:
> > > > - Adapted for v7.1 flush tlb API changes
> > > >   No changes in core logic
> > > > - Collected Rb and Tb tags
> > > > - lat_mmap benchmark showed dsb(ishst) performs better than dsb(ish),
> > > >   hence retained dsb(ishst) in flush_tlb_user_pre
> > > >
> > > >
> > > > Testing with 7.1-rc4 :
> > > > +-----------------------+---------------------------------------------------+-------------+
> > > > | Benchmark             | Result Class                                      |  Improvement|
> > > > +=======================+===================================================+=============+
> > > > | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> > > > +-----------------------+---------------------------------------------------+-------------+
> > > > | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> > > > | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> > > > +-----------------------+---------------------------------------------------+-------------+
> > >
> > > I tested this patch using a synthetic Firecracker benchmark on a 192-CPU
> > > arm64 host, with Linux v7.3 on both the host and guests. Each worker
> > > repeatedly creates a fresh 1-vCPU microVM, boots Ubuntu, verifies an echo
> > > response over the serial console, and shuts the guest down, waiting for
> > > Firecracker to exit before starting the next VM. Each guest has 256 MiB of
> > > RAM, with two VM slots per workload CPU.
> > >
> > > With 4 KiB guests, the unpatched workload stops scaling between 64 and 96
> > > CPUs: throughput falls from approximately 68 to 65 completed lifecycles/s
> > > despite the additional CPUs.
> > >
> > > Applying the patch to the guest substantially improves throughput at higher
> > > concurrency. At 128 workload CPUs, I measured:
> > >
> > >   Guest pages  Unpatched  Guest patched only  Host patched only
> > >   -----------  ---------  ------------------  -----------------
> > >   4 KiB        73.83/s    108.55/s (+47.0%)    74.09/s (+0.4%)
> > >   64 KiB       86.46/s    105.04/s (+21.5%)    90.15/s (+4.3%)
> > >
> > > The host uses 4 KiB pages throughout. The host-only difference with 4 KiB
> > > guests is small enough that I would regard it as essentially unchanged.
> >
> > Sorry, but I haven't understood the setup here. If each guest ("microVM")
> > only has 1 vCPU, then why does this patch have any effect in the "guest
> > patched only" case?
>
> I wonder whether it's the repeat TLBI workaround just doing more DVM
> traffic. Turned off when no broadcast is needed.
>
> > Additionally, the non-broadcast TLB invalidation will
> > be upgraded to broadcast by the hypervisor.
>
> I have a hack that makes things even faster (opportunistic
> HCR_EL2.FB=0). I may post it once I understand the implications
> properly.

Hi Catalin,

I tested HCR_EL.{FB,BSU_IS} = 0 w/ this patch on guest
kernel before, here is my result:

The in VM micro benchmark is mprotect() on one 4K private
page, change READ <-> WRITE in total 1000000 times.

The testing runs on system w/ 2 physical NUMAs, each NUMA
has 62 physical cpus.

The VM has 2 virtual NUMAs, 1:1 map to the physical NUMA
above, the vcpu 1:1 pin on pcpu, total 120 vcpus in VM
(yes not 124, it's 120), QEMU's other threads are pinned
to 2 free cpus in each NUMA.

The benchmark runs on 120 vcpu at the same time, the
average cost time is used as performance indicator.

W/o this patch on guest kernel:
+------------------------+------------------------+
| HCR_EL.FB and BSU_IS=0 | HCR_EL.FB and BSU_IS=1 |
+------------------------+------------------------+
| average: 26.227070s    | average: 26.182552s    |
+------------------------+------------------------+

W/ this patch on guest kernel:
+------------------------+-----------------------+
| HCR_EL.FB and BSU_IS=0 | HCR_EL.FB and BSU_IS=1|
+------------------------+-----------------------+
|  average 0.478060s     | average 25.836823s    |
+------------------------+-----------------------+

IIUC the improvement should come from the inside guest
non-broadcast TLBi by this patch + hardware doesn't
"upgrade" such non-broadcast TLBi and barrier to broadcast
scope in such across NUMA scenario, the later is controlled
by FB and BSU_IS for guest.

>
> --
> Catalin

