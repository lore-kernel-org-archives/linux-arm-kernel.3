Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B7BC88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhTlMgPdNAQRydotJIFNOJBiei8WpoELpkOhEIhMgpw=; b=Bof7h3Aq/p/tbhZLhmbe+u4t3I
	gCGB9drZ+d8x2eZ9RojtcA7Teqb+g6E2hoTIU1zNdOMFySZ8Men/SCu57wnr8SlhfT9SOY/q3jd6F
	O+/WuPGtEhYAx3YL1ce/RQOdse4o2CAkd57ZZ3SkYL6Com5d2VgtCgDnr/E/815kBbVXFGPq6I9Wo
	ExfqwwQFYJ8112cqTwVLVHsAbfKT1nXLeFcATHH9e7vjW+vcdSPOjAdS2DNyyUkzru2K8UlbTOaMj
	SH8jfMJA5q+pBMs1eah1j8RM2xmo1qJ+ByM30UlX7ISOVsA981L/zX6pEp0YTGVxrgR6FP421AZpC
	H/avnBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50nd-0000000GgnN-2F3V;
	Fri, 11 Sep 2026 12:56:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50nT-0000000GgkI-2bHx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:56:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45C4860A62;
	Fri, 11 Sep 2026 12:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07D91F000FF;
	Fri, 11 Sep 2026 12:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131362;
	bh=JhTlMgPdNAQRydotJIFNOJBiei8WpoELpkOhEIhMgpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C5qC/K0Tp+JDpH9rss+oR1QREU2eNCyk3XMByhGWeUwq775dK4xPQg58Rt4MGJQT8
	 GUuiMdFnrZPiUMXy1ajXJQUvVmJMGCKKmEFQ9yBM9gZJhK14Yy4rKm20DGP5HJcRjP
	 OKNXoukO5sQ+UqIQ1zyCSIpEAKUZiz+nD0CUDK4qYYlki//CaeYBIDLQE4Zl0jgU30
	 yzJkxtx6Mgc79pU7sBFTqycxJQB/GTk4GiXhSMiexGIwYeTmDO8N3aboeLRjNNYn/+
	 oODyeP8zGRZUhmHxbc+XePalqD/5jcR4qnTrSc5mozDvOINA0YYAYV0tiudCDEDvtY
	 qpgEQeRKy3B2A==
Date: Fri, 11 Sep 2026 13:55:57 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 12/19] arm64: cpu_ops: Make 'cpu_operations' pointer
 global instead of per-cpu
Message-ID: <aqP6XQbNBCzLrFnw@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-13-will@kernel.org>
 <ed47c328-6906-4bad-9a0e-a01f067dc812@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed47c328-6906-4bad-9a0e-a01f067dc812@huawei.com>
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

On Tue, Sep 08, 2026 at 07:32:06PM +0800, Jinjie Ruan wrote:
> 在 2026/9/8 0:40, Will Deacon 写道:
> > diff --git a/arch/arm64/kernel/cpu_ops.c b/arch/arm64/kernel/cpu_ops.c
> > index e133011f64b5..eacfb88a0c0c 100644
> > --- a/arch/arm64/kernel/cpu_ops.c
> > +++ b/arch/arm64/kernel/cpu_ops.c
> > @@ -20,7 +20,8 @@ extern const struct cpu_operations acpi_parking_protocol_ops;
> >  #endif
> >  extern const struct cpu_operations cpu_psci_ops;
> >  
> > -static const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
> > +static const struct cpu_operations *cpu_ops __ro_after_init;
> > +static bool boot_cpu_has_enable_method __ro_after_init;
> >  
> >  static const struct cpu_operations *const dt_supported_cpu_ops[] __initconst = {
> >  	&smp_spin_table_ops,
> > @@ -40,6 +41,9 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
> >  {
> >  	const struct cpu_operations *const *ops;
> >  
> > +	if (!name)
> > +		return NULL;
> > +
> >  	ops = acpi_disabled ? dt_supported_cpu_ops : acpi_supported_cpu_ops;
> >  
> >  	while (*ops) {
> > @@ -49,6 +53,7 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
> >  		ops++;
> >  	}
> >  
> > +	pr_warn("Unsupported enable-method: %s\n", name);
> >  	return NULL;
> >  }
> >  
> > @@ -94,25 +99,31 @@ static const char *__init cpu_read_enable_method(int cpu)
> >  	return enable_method;
> >  }
> >  /*
> > - * Read a cpu's enable method and record it in cpu_ops.
> > + * Read a cpu's enable method and update/check cpu_ops.
> >   */
> >  int __init init_cpu_ops(int cpu)
> >  {
> >  	const char *enable_method = cpu_read_enable_method(cpu);
> > +	const struct cpu_operations *ops = cpu_get_ops(enable_method);
> >  
> > -	if (!enable_method)
> > +	if (!ops)
> >  		return -ENODEV;
> >  
> > -	cpu_ops[cpu] = cpu_get_ops(enable_method);
> > -	if (!cpu_ops[cpu]) {
> > -		pr_warn("Unsupported enable-method: %s\n", enable_method);
> > -		return -EOPNOTSUPP;
> > -	}
> > +	if (!cpu_ops)
> > +		cpu_ops = ops;
> > +	else if (cpu_ops != ops)
> > +		return -EBUSY;
> 
> Should we return the original error code of init_cpu_ops() in
> smp_cpu_setup()?

I don't think it matters (the only caller of smp_cpu_setup() just cares
about 0 vs !0) and I don't see a reason to change it as part of this
series.

> Otherwise LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

Thanks,

Will

