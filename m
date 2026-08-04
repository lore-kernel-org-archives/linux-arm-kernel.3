Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF724C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hINQgG2Cz5uHOWCMPGkyjpoYrQxkpuisCZW5bXMd38w=; b=PMDebrqCpkOKxODNNe1Ml8B6yI
	KkSfABnN7FI3usNGkIjwoMEj/woZKyZukwRORM2gSXYGOP8XYt6i+gG6tV9hDM1SBDzOuqaXz2ZZu
	EDkwURvoDW/3PGzbySK29ErGchZEnR9Bw4vSJ8jruQA089DSWIgrnBFcm/qPt/evUXG7v1er1/wor
	V6uKdDYDIA0FWHPWTfBmEJepxem40GdEmZEDwu5xz9Q+mhHeA9b7crw87ThlQKynSkavbc20rLpze
	/oO84qAUNJanHJRa1bDHpj6FWD11AXXvzBS1uNpHDZwmx7AI6PLc6js5Q97JizhZGVlaPWucGYvng
	C8zVdXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGd3-000000029nS-44pl;
	Tue, 04 Aug 2026 15:00:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGd1-000000029n5-2Rjl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:00:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7964D165C;
	Tue,  4 Aug 2026 08:00:22 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5B7A3F86F;
	Tue,  4 Aug 2026 08:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785855626; bh=qod7nuIJK3LbjzJXK5Ak2BXjKVmEFuQMsxsXzJ/nVxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOPlBtqQHjwHO/AFGn3qfSS0j0Yjza8S4K2a6Qp12zk+20cuWBdgDfENP5zclhCll
	 d04iVhJNyTxtv3jmmIoz8EFwWMCUE6+6sRQL61NC4vGF0rkLNn8MqCLdpaGNmrdNbN
	 UUihAUfArHhPhIoDxC3iZ0Dw1TAo4u3PnvsOeVbQ=
Date: Tue, 4 Aug 2026 16:00:22 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: David Laight <david.laight.linux@gmail.com>
Subject: Re: [RFC PATCH 07/13] arm64: percpu: Implement preemptible
 read/write ops
Message-ID: <anH-hp7f_YpEkXeU@J2N7QTR9R3>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-8-mark.rutland@arm.com>
 <20260728224755.59cfd22d@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728224755.59cfd22d@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_080027_661635_2266DD56 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2026 at 10:47:55PM +0100, David Laight wrote:
> On Tue, 28 Jul 2026 13:38:53 +0100
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
> > Use the PCPU GPR infrastructure to implement preemptible this_cpu_read()
> > and this_cpu_write().
> ...
> >  #define this_cpu_write_1(pcp, val)	\
> > -	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
> > +	_pcp_wrap(__percpu_write_8, pcp, (unsigned long)val)
> 
> Not new, but does that end up sign extending 'val' which is likely
> to be more expensive than zero extending it?
> Using '(val) + 0u + 0ul' might generate better code in some cases.

For the existing code, there's no {zero,sign}-extension in practice due
to our calling convention (AAPCS64) and inlining. AAPCS64 specifies that
when an N-bit valiue is allocated into a register, bits[N-1:0] contain
the value, and bits[63:N] contain unspecified values.

The existing __percpu_write_##sz() only consumes 'val' as a 'u##sz', so
the compiler doesn't need to do anything with the upper bits (and in
practice doesn't do anything), so long as __percpu_write_##sz() is
inlined into its caller.

The new __percpu_write_##sz() in this series doesn't cast 'val' back
down to a 'u##sz', so there is some unnecessary extension. I'll fix that
by taking 'val' as a 'u##sz' in the function prototype, which'll avoid
extension regardless of inlining.

> Just noticed it should be (unsigned long)(val) as well.
> Otherwise this_cpu_write_n(pcp, -7 / 4) isn't going to DTRT.

Yes, that's a latent bug, and we have at least one other case
(this_cpu_and()) where we miss brackets.

I'll fix those up as a preparatory patches.

Mark.

