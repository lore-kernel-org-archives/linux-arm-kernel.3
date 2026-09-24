Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5F3C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+BPLQi4pjbGSQjPmKq2+3KsBB+uqQH6kLb3Zmk53AM=; b=ipJ/DpDQtg9Y9tKfQP48lnmf8C
	PG6mKtZY4srt0e32z1dE4lzXVL0+1UpIpLw0rnnRdp6jb5r7YrAis/A7JXLq4Vfz6IOA7HUb5Vc3J
	foS5ZClEXFtTY/3yIDKJG/fsJ1YYqeSonSN+IpWsHAyccMtzqTZrv4j5x2nnfvk/wmlVm7TSGYKrn
	rHQAbnYmjCPhUq5tsbX+xWmVpV/4MjUqulgGKI/2sIEVVTGmMzSruhn5LpG6BVkUZhMfeQE1Ub/Ik
	t9HYQL+70Kd+UPlqV5OfLL0QTMwfFkeAtd9lWoCqCKC3HbBkUCJoH7aiw080idkBoZs8hL53smQw7
	hWb1cu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lbP-0000000BSnA-0xad;
	Thu, 24 Sep 2026 15:43:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lbN-0000000BSmC-1tpe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:43:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D3041E4D;
	Thu, 24 Sep 2026 08:43:07 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF9313F86F;
	Thu, 24 Sep 2026 08:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790264590; bh=CHYzUrkQMcLRWPgUeFO4PnGKYjBY2rlqkQkNha1Cbug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIJqAdNykH8EhX/o4szrcmNL2hM8vYBQdTMIpdVNJshRaywuATNN5gF4n/QX1BnTg
	 XtsOxiOMg8zogPeJu2NBU17QrQOExbg/hDgGHr4MJN5g6NXyxxN7q+UpuIYN/c81Sg
	 nsEJPj/PyTPKM7HefB3zd3xr+c+qWipNz99kZd3Y=
Date: Thu, 24 Sep 2026 16:43:04 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Will Deacon <will@kernel.org>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, maz@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
	yuzenghui@huawei.com, linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18] arm64: mm: Handle Granule Protection Faults (GPFs)
Message-ID: <arVFCCykzWJctPXP@arm.com>
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
 <arK3tsTV6EDhI-nt@willie-the-truck>
 <arOyp8WUrYBAjrGH@arm.com>
 <arP0IF0MjFUv36AP@willie-the-truck>
 <49dcab27-1d03-4df2-b7cb-4df4eda6d909@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49dcab27-1d03-4df2-b7cb-4df4eda6d909@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_084313_597047_625A4F5A 
X-CRM114-Status: GOOD (  23.77  )
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

On Wed, Sep 23, 2026 at 05:04:06PM +0100, Suzuki K Poulose wrote:
> On 23/09/2026 16:45, Will Deacon wrote:
> > On Wed, Sep 23, 2026 at 12:06:15PM +0100, Catalin Marinas wrote:
> > > However, I'd still keep part of this patch - the reporting and panic but
> > > without the actual exception table recovery. There's some value in
> > > killing user-space and WARN (or pr_ratelimited) without a full panic, it
> > > helps with debugging. That's what do_bad() via arm64_notify_die() gives
> > > us currently anyway.
> > > 
> > > So maybe we can keep it to just:
> > > 
> > > static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > > {
> > > 	if (user_mode(regs)) {
> > > 		pr_alert_ratelimited("%s[%d]: granule protection fault at 0x%016lx\n",
> > > 				current->comm, task_pid_nr(current),
> > > 				untagged_addr(far));
> > > 		mem_abort_decode(esr);
> > > 	}
> > > 
> > > 	return 1;
> > > }
> > > 
> > > and we get the SIGBUS or panic via do_mem_abort(). No recovery for
> > > uaccess though, we get the same kernel panic.
> > 
> > But how can this ever occur in user mode?

Only if we have a kernel bug.

> > I'm fine with making that part unconditional.
> 
> Agree, if the user mode can hit this, a page is mapped in the EL0 and
> it can as well cause the Kernel to hit a GPF.
> Also if make the handling unconditional, we end up calling
> die_kernel_fault() and that does the mem_abort_decode() causing
> duplicate logs.

If we just return 1 here without anything printed (or rely on do_bad()),
we don't get any info when the user tripped over such pages. Printing
without the user_mode() check duplicates the mem_abort_decode() for the
kernel.

If we want panic always here even if only the user triggered it, we can
do like do_gpf_ptw() (and keep a single function for both). However,
die_kernel_fault() is a bit confusing as it prints "kernel access" when
it was user.

If we go with forced signal for EL0 faults (only helpful if we want to
continue debugging), I'd keep the warning, maybe as WARN_RATELIMIT() or
a printk. It would be very similar to our current do_bad() behaviour -
kernel => panic, user => kill, but with more information when it
happened in user space.

-- 
Catalin

