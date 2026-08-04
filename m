Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B398C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIiCPtAhi81qbfALD7WA1ef0Q0wxfGaqrZTAjkK0mjg=; b=i1f6YNnyKlwaGpuDgktBN05FXp
	uuT6EFGfDlyUpBtqLWvhqOvkNtiw9+oD14WddVPG14pLwd3OElw3AQzNPSPzHJ6NL6k++XPctbQEq
	PTHrj3p2zo+k+WuZImYoL0TMbaKXeiU7Runn35CmMPaDKkzU10oWV8QRU3Wf9mm8mnFdKsalEkds4
	/4Ak2FnV8lU9uIY02VRVzwHWFpZbMJnLYmsmwdGsxBEC/1FXnJWYqCd9QXQ2GAduYFqwG2grkLl6h
	Nw1/NFVWbo/8HS22xxcx9rwqxyuiztxHq+VTFddxZFcchOBZ5TWButMrV74elTYD4P3VDZ5pYvCGh
	wFR3Nrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF6y-00000001utn-06Ol;
	Tue, 04 Aug 2026 13:23:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF6v-00000001ust-2wh7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:23:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEB301476;
	Tue,  4 Aug 2026 06:23:05 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA32E3F66F;
	Tue,  4 Aug 2026 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785849789; bh=Bpz4EOMhivfuILCNjK+1WCphsPbYAji7N/PHVQzUouk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyrLH/zxaSvft5wkvkCm1C0Zzl1n4AWnxFrWeqitT402zZErU6t3t9TfXpKkW1kfz
	 MLEs2gbX2flreE54g024UyS4fMMFR18pilGmj0dxSSvxaverNiIm0FAFlxrj3r0HHu
	 p0i2KaswadZjKPFYsYAjyTqct9JyNUgHaLxswaLY=
Date: Tue, 4 Aug 2026 14:23:02 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <anHntggSHNK28VYu@J2N7QTR9R3>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
 <20260728141958.GV751831@noisy.programming.kicks-ass.net>
 <amjQkPyNAsFRJF9I@J2N7QTR9R3>
 <20260728164912.GK651302@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728164912.GK651302@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_062313_778935_FE2DF3F3 
X-CRM114-Status: GOOD (  16.34  )
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

On Tue, Jul 28, 2026 at 06:49:12PM +0200, Peter Zijlstra wrote:
> On Tue, Jul 28, 2026 at 04:53:52PM +0100, Mark Rutland wrote:
> 
> > > > +#define ____PCPU_GPRS_BEGIN(gprs, pcp, off, addr)			\
> > > > +	__DEFINE_ASM_GPR_NUMS						\
> > > > +	__DEFINE_ASM_GPR_ALIASES					\
> > > > +	"	mov w" off ", #" __VAL_PCPU_GPRS(pcp, off, addr) "\n"	\
> > > > +	"	strh	w" off ", " gprs "\n"				\
> > > > +	__KERN_ASM_CPU_OFFSET(off) "\n"
> > > 
> > > Can this macro also generate a readable comment for those few of us
> > > building the .i file ?
> > 
> > Do you mean for __VAL_PCPU_GPRS, or ____PCPU_GPRS_BEGIN() ?
> 
> I was thinking BEGIN, but whatever is easiest, the __VAL thing is only
> ever used in BEGIN anyway.
> 
> > I can happily add comments for either (and the corresponding ENDs).
> 
> Not sure the comment makes sense for end, that's simply storing 0 and
> seems clear enough.

FWIW, for v2 I've added the following to ____PCPU_GPRS_BEGIN():

	"// ____PCPU_GPRS_BEGIN(" gprs ", " pcp ", " off ", " addr")\n"

... which should make that easy to spot, and surfaces the exact
registers used.

Mark.

