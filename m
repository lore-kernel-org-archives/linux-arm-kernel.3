Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947CCC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 18:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SoYnuZTO0Mbw7rkNxqV575PNl6Qkl58Vf5hOHuv7jo=; b=wlylwvYQZ1AadQ1JauuQ46wMBD
	8flsckDjpopgeMRDGpGfKMoOVXSDbT3/Ux+RrNSNhkR+PDnIMpD85ij0hPLQIZFbO23EXp2OTsyA8
	L8gf9n7hFF8+xKVI9LjqlWCCR/79pS8IRPaC4F5liewNYvGMSA3NTNEXAyRvaJc4uWG9gLHnaY8uU
	TP3cHLNUawD0Fi/kSQ4lR2JAWLqhIbSLsuQz5y3Ti6mvXWojpeeLo71gdAlXpMwt1UFlyPeA6Zj8z
	CGjZlgVzRR0K19obNmKA+CYL6PWftVDEOKd1GJe3t8a16CO8wsKX7wzUNyh+SYB0Xk6z1UpcqT5Z+
	sXNsn3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pdw-0000000FaM5-04ZN;
	Wed, 02 Sep 2026 18:25:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pds-0000000FaL3-3hHV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 18:25:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so12547915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 11:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788373499; x=1788978299; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0SoYnuZTO0Mbw7rkNxqV575PNl6Qkl58Vf5hOHuv7jo=;
        b=NeoV9ddq/E8ts64Zz0rC76tfmi8z3uOahIzodyZSzFNVvu7mLRLOJmwcs5/zlm+0ci
         10/1V/mb2p3TJ1OmYrxuwnDcgMiOJCrrv/y5mignxTUs0MvJ1GdzGdcwwGpf4UhU74v9
         /N1uzJU92UPfxHmWM9Q8NRKkXbkgIHEYkK3CYDMM1NzTBW+EuCnJj3/AEde+dPDhArNA
         bt/FKhFJOzCS8OSq3jY12/+1BeN4Fg4JApgidIAlSypNK8Ws7EzC9ejKB6slexSJIuoJ
         ju1wCNBfHpCkFPnSQlh16rwcmV4SafdsZpKV6CqrWi4OTVA3KQ6Cg6MuUUl0kbv1dW26
         I5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373499; x=1788978299;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SoYnuZTO0Mbw7rkNxqV575PNl6Qkl58Vf5hOHuv7jo=;
        b=p5W6izfaqJqXaP3937AvKYxGvq8PmiGRPMjGZHvkdtt4uy/bd8MOFBkseHfGVP9NHV
         Ksh0jkZYekrOZtSt1/k9/PyPHbehYwHGNa0Bz4pVNeXQJAre7x0UbSwwhMH5n/RR3y5y
         Ijm6MpJYZ4BWShigx8m05cQ5rAwzw5x3hqOm8XkGAbnqGw7opj7vdOM7QprrHgaY3gUC
         1UGDql+xpCaHtcJrR7OS87jaFPWF3wg7IGrOnZ6Sm5579uEbMxPh3BIu/dkXAqC78fzF
         PTp5CFg3Vbyjy6wLjtBByg600BpKX4FRI0qbwFnNK9nDrUaECuyT3p2+AOYAQ+BiJ2DU
         BHBA==
X-Forwarded-Encrypted: i=1; AKwUvBzQWvaR8wKqnAPeKBr802Zv3jkW5WrFdwCObvxoj1ZIJQpwte068zxPvWPDgR6vFrgQFyA+1yh0PP/R06Q5P/GL@lists.infradead.org
X-Gm-Message-State: AFuF++l/lFGgjPSmBUXbEDYZwOhaPf+MHnxPQ8qwpjR4j39xzvphVHk2
	iuTteJdKZxH1S+nMWy74KCqwfsFhD8hk28HXwlWcw1BcF1JTr6ponvdn
X-Gm-Gg: AYBFou1MFs3YAO7XOp5Sn9865Qz2gcNx3G2ylJ37tGQ0IIP3r2aSbSv4wvYmEbu7Ouo
	dRWkOs2xFvO6PhoDxhvyM0pLQYVdjVLJFNTatBHMGUQ4lUHlUPdC45E+GPNC/qvLxUYtkRC5qAK
	QfR7FPooPH0csTGzNM5Ul+dp0yhIsNjn35rEGwVRLwWeMi5fK15uwusTXcDjZy2mBHpMeSDUpxI
	u7fMQqPkOrKwJRvVud1vXocdkk/tX1hnXi1rwHUS+lx5uFeWyOOFTG2uK06cLuk1uOhd5mjtb2i
	nADDXGbPYCF1iZvUhfbUK8PXI8i/ROBb5v0LSPW8VAxlYikx0H/rqYxbzUOyZD6XA0TqlhITfbp
	ClgJV52teDOQXf6aB7o8BseW7lkhH0WCIn19L70ovz5LRqRh5FsaCqrljlVOcwQUXMg++LU+nwD
	1+xl9RMHzDqxD++A0RK+ug3V4xh4z32HiRgDxmee7EHWlIy1zgJ2z2ApDraIHq/Ia401mE6pJN2
	Ni59tAkMoG2yZjCoX5gc77mzo8=
X-Received: by 2002:a05:600c:c4a6:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49ce581142cmr134091165e9.8.1788373498864;
        Wed, 02 Sep 2026 11:24:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d1fa6sm10798085e9.1.2026.09.02.11.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:24:58 -0700 (PDT)
Date: Wed, 2 Sep 2026 19:24:57 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Usama Anjum <usama.anjum@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, vladimir.murzin@arm.com,
 ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com,
 stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com,
 yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org,
 david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Subject: Re: [PATCH v2 00/20] arm64: Preemptible this_cpu_*() operations
Message-ID: <20260902192457.127f5747@pumpkin>
In-Reply-To: <20260902164250.40852ba7@pumpkin>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
	<9789fd67-205a-412f-90d6-42c401d3babe@arm.com>
	<20260902164250.40852ba7@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_112500_941390_AD5F02D3 
X-CRM114-Status: GOOD (  22.34  )
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

On Wed, 2 Sep 2026 16:42:50 +0100
David Laight <david.laight.linux@gmail.com> wrote:

> On Wed, 2 Sep 2026 12:55:12 +0100
> Usama Anjum <usama.anjum@arm.com> wrote:
> 
> > On 04/08/2026 6:04 pm, Mark Rutland wrote:  
> > > This series reworks arm64's this_cpu_*() operations such that they do
> > > not need to disable preemption, avoiding related overhead in the fast
> > > paths. Instead, the ops begin/end a "PCPU GPR" critical section using
> > > unconditional/posted stores, which should be very cheap on any
> > > reasonable micro-architecture. During a critical section, should a
> > > (preemptible) exception be taken, the entry code will apply a fixup to
> > > the GPRs containing the percpu offset and the generated percpu address.  
> ...
> > tl;dr
> > Comparing this series with the page-table series [a] gives 8 improvements and 3
> > regressions.
> > 
> > Fastpath is a Linux kernel performance benchmarking service. The table
> > compares the both patched kernels: positive values are faster, negative
> > values are slower, and (I)/(R) indicate statistically significant
> > improvements/regressions. Unmarked differences are not significant after
> > accounting for confidence and noise thresholds.
> > 
> > +---------------------------------+--------------------+-----------------+-----------------------+
> > | Benchmark                       | percpu-pgtable [2] |   gpr-fixup [3] |         gpr-fixup [3] |
> > |                                 |    vs baseline [1] | vs baseline [1] | vs percpu-pgtable [2] |
> > +=================================+====================+=================+=======================+  
> ...
> > | perf/futex                      |              0.55% |      (R) -2.80% |            (R) -3.34% |
> > | perf/sched                      |          (I) 1.61% |          -0.39% |            (R) -1.97% |  
> 
> Might be worth investigating those two.
> Something odd is probably happening.

Answering myself :-)
Do I remember something about the code being locally faster actually
causing a slow down because it changed the paths the other cpu used?

> 
> David
> 


