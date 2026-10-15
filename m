Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1F3CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcDkoczLZtkXZLmEqUsWfJpdm+QFtb7s3+UB08BN4c4=; b=jeeCd0XFKu1YmhuFsqIJtS9cWW
	kGLA3iWWLAz1JmjSCXsjEukHvvGcW1xAqN0Aj5id0RVitSBFHM4A+IEA+JuVY2pdujQj+fWegC5AP
	141mGwJOXTk6bThMyUql3aQNofCS8CH74b3QQXzpaTVZgDYOur9eb9zbhBMsKs/UNK6IB1KDWoIDn
	LIIc6u9K8U25/Mcrh/z2uBvd/RLTy2xB828NBaktKFeTT+QqFL4rQMbGwT22frLlQKu+D1APNraxl
	BdiG7e4Qg6ZXmO9sGGYROPl5PDwLdAGqZ6cMYd+Ps9vWR5tT0qY7VP9r7gOiTo+dobRplbs5IF2l5
	kWcOLkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGGA-0000000H51f-3TYV;
	Thu, 15 Oct 2026 07:52:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGG9-0000000H51M-2kAb;
	Thu, 15 Oct 2026 07:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KcDkoczLZtkXZLmEqUsWfJpdm+QFtb7s3+UB08BN4c4=; b=o2JbxUQynwPIsa8krrwXrFIdmF
	4RElsF95/oQTSa/WYzPavhCHGYnwpzsg/Zx3PUGfkOAQkAJRAgkCEz2do9kjPhkOEnCbBmFaLUDBz
	UEclrll02K7dZzjTwni1nJyrlqmGlCDG3D2aA4kfCT06P4oiLXqhm13S/w6vRRLTGUXnuLG82PNk4
	GIHj+9A6JPGhGupcY33CPJllHA3bQwVeOelJJ4ckuhlH1tiGxdghJLsG7rO/aK69Ohewuqu6eAyJQ
	jYKNBzPbyVBs0Z6H67gwaM/O0l0ZeoRSsbd9MDW3/zZfGj0SWoPMfOFuowc05T3Rtna6nB082R+Yo
	KGfQPBGw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGG3-0000000BteX-3Ak5;
	Thu, 15 Oct 2026 07:52:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 517013006DD; Thu, 15 Oct 2026 09:52:11 +0200 (CEST)
Date: Thu, 15 Oct 2026 09:52:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Haris Okanovic <harisokn@amazon.com>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de,
	will@kernel.org, akpm@linux-foundation.org, mark.rutland@arm.com,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, rdunlap@infradead.org,
	david.laight.linux@gmail.com, broonie@kernel.org,
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com, ashok.bhat@arm.com
Subject: Re: [PATCH v15 12/16] cpuidle/poll_state: Wait for need-resched via
 tif_need_resched_relaxed_wait()
Message-ID: <20261015075211.GN2009045@noisy.programming.kicks-ass.net>
References: <20260831202251.305046-1-ankur.a.arora@oracle.com>
 <20260831202251.305046-13-ankur.a.arora@oracle.com>
 <178908146776.2725577.2613699832033292946.b4-review@b4>
 <878q58z2ej.fsf@oracle.com>
 <3e8bda45-0aa7-d0be-8aad-dab95902dcde@gentwo.org>
 <as9EospGcR2e1mpO@arm.com>
 <20261014130306.GK2009045@noisy.programming.kicks-ass.net>
 <as-eaNfjOAUnfvVF@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as-eaNfjOAUnfvVF@arm.com>
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

On Wed, Oct 14, 2026 at 04:23:20PM +0100, Catalin Marinas wrote:
> On Wed, Oct 14, 2026 at 03:03:06PM +0200, Peter Zijlstra wrote:
> > On Wed, Oct 14, 2026 at 10:00:18AM +0100, Catalin Marinas wrote:
> > > It
> > > would also be nice to get some acks from the atomic infrastructure
> > > maintainers.
> > 
> > That'd be Mark and me I suppose. I don't see anything substantial
> > happening, just plumbing the new function.
> 
> Thanks!
> 
> > Now, I really rather dislike timeout based schemes, but given we have
> > users, I suppose this does improve things. We should however be weary of
> > new ones I suppose.
> 
> There's some arm64 precedent in commit ebababcd0372 ("rqspinlock:
> Hardcode cond_acquire loops for arm64"). This one went in without any of
> the arm64 maintainers' ack and we've since been trying to come up with a
> generic interface instead of reverting it. It was fixing a bug where
> arm64 smp_cond_load_acquire() does not evaluate cond_expr unless the
> pointer is also written by another CPU. Arguably the bug was in the
> rqspinlock code for not using a plain cpu_relax() loop.
> 
> Anyway, we had several incarnations of this series, some with a default
> timeout but others objected to it (Arnd and Rafael IIRC), hence the
> proposal here that pleased most people (not all though ;)).

Yeah, I didn't mean to say I'm against this series -- just weary of
timeout based schemes in general.

So feel tree to pick up this series when it seems ready.

