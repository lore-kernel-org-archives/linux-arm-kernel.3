Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3FFC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXcJzsx8WNzk3HL2LfGDWHxUKqoTupIjlQLk/UZ0JTU=; b=S13y6VRZfRiJAgIBU92Lx2IRSe
	+ZEZRKaPaZSD4pxGnlHORBoQh8p0WjcqWm1bOTJTl0jiQjTvXE7XiUwoOaFW4axbSEXMdNoAmpLXj
	elVr739eCubXVOaF3Zz9KLYvWDUDv743fHldovrCEYIFDNif4Qbf/vaGjaWi8CvTepK5yjSLDTASC
	lfAwneSzCp66ydIf3DZu6TzniH167X14bTBJZbGck0KM4hqCV2Wd/ex27BFSBBIHaOLLuE++xnZtU
	0qyQu9/W6aosuRzegCyQh9YQ5Bt9Uz2dxug0xD1kHHFAStnVo6PIvZXqWQHza2jVJb2ROmzndHHsX
	MGE8ZsTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woipF-00000005Uj9-2Mun;
	Tue, 28 Jul 2026 14:30:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woip0-00000005UfE-32rk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Jul 2026 14:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oXcJzsx8WNzk3HL2LfGDWHxUKqoTupIjlQLk/UZ0JTU=; b=G3lUtsaMAY/USB8Nmx0fu9PAlG
	+jyJ+13UhgB585d4aBPFc7GzcDJIswaQ/oxXDTJEm2t8n5bvelpyCcpp2rxgCT6VMoutiI63qIigD
	PcPW+4npFsVqQNXi1SW4k9gKLuRG6wUF6/U1hTxXv/07fXviz+kyyDG3IGpHSXLsxqUHj/sgAQctO
	tB2cfhQLFnjOqbqTAg5kG0/715Kck6/q3Qrz9l4d5RouCgxip9a5Ka4r99Bwww+PyPaPNrvn4qTx/
	lEKKR7DrNS8kkQOLnv09EicckXITIOfd6+4xtWVM02Jxycfv/1g4TBjXLAx6WgoM2oIe+3ceyl/BH
	OyP7w76A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1woioy-000000051Fs-3v5R;
	Tue, 28 Jul 2026 14:30:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0F870300969; Tue, 28 Jul 2026 16:30:16 +0200 (CEST)
Date: Tue, 28 Jul 2026 16:30:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <20260728143016.GB921102@noisy.programming.kicks-ass.net>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
 <20260728141958.GV751831@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728141958.GV751831@noisy.programming.kicks-ass.net>
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
Cc: vladimir.murzin@arm.com, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2026 at 04:19:58PM +0200, Peter Zijlstra wrote:
> On Tue, Jul 28, 2026 at 01:38:52PM +0100, Mark Rutland wrote:
> 
> > With the scheme added in this patch, this can be compiled as:
> > 
> > | <outline_this_cpu_add_u64>:
> > |        mrs     x2, sp_el0
> > |        mov     x4, #0xc80
> > |        strh    w4, [x2, #20]
> > |        mrs     x4, tpidr_el1
> > |        add     x3, x0, x4
> 
> Which it then recomputes, and so is harmless.

Here!

> > | 1:     ldxr    x6, [x3]
> > |        add     x6, x6, x1
> > |        stxr    w5, x6, [x3]
> > |        cbnz    w5, 1b
> 
> If we get here and interrupts happens, we recompute pointlessly, no harm
> done.
> 
> Anyway, per this sequence there is no point in ever doing the fixup. So
> perhaps give a better example?

Nevermind, brain just wasn't working right, when interrupt happens at
'Here!' above, it needs the fixup, irrespective of the atomic type.

> > |        strh    wzr, [x2, #20]
> > |        ret

