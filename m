Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56195C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 02:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+k1BZO5yZ6w7M3O6dAc9LXiXnWoMlPnmUgn4ZNniju8=; b=k4B6AJVi9/jQq0KAWvQWF6Mg46
	VSoACBp5dfEm9N95zlP4AILwekKA+ZNT9imj9eDhQqO4IAtTDgPkZDMowkTFlDNf9NhFYS0tg/s4R
	0QDvYKd4uCL98NC7szIt/NB6LURLUn07qUycqmK4HzcqqZLjSB/vTxh5cNd3UcQXNpBUUxz0fPeg0
	D+I+81kXADCuDNQLbIDNctuqhyefcctZOOFE7FY9qOWAsW4IHLFQxygCLN064ucyQpKw5uYCqD2Qh
	6+FJzoohLi3UKDepzw/Xa9P5QUZMjfpTU5cHcnNh7J9OzOYPDIlJfGGuYvlcBtFwUYTaC+n2jOrQI
	HJiCHo2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBe7-00000008hNt-49LF;
	Wed, 11 Jun 2025 02:56:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBWh-00000008gfa-22nn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 02:49:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03ECC4AAEE;
	Wed, 11 Jun 2025 02:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0595C4CEED;
	Wed, 11 Jun 2025 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749610157;
	bh=pzZwJBxgFRuefzbF28IxJfQgjsgnPiRnf3S8igsvcek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4vzEaIty6IYgT/cI6WOpu0XygRuPcUNcylgXR/1qYPpz06M4XU56ACHE5vhmEMPZ
	 0VPYyAfrMDurmCf5eHZgMZJMqpzR4VZ1mQ76G+0I1MgLimD8OJ+6Kz3piboGduX/04
	 yfcoZyWvB6Gp0qVmDFfyIAx/tujPh3Y7pq1uPok5L1l5YZZ+3knYfCCIkvJhtRECXC
	 vdW/CyOMchBZddAdGwJiqZqBcnTWf3vWOTJeuyOfh8ooeSCOyh1IbTaDZs+nSRj7yI
	 nxtfnIXZkYRS+U74g+0lBuGcneFRBghz5x4L9Xayh2+nZPtKSpnocO1puPqHZl+pwj
	 XKecLU+wwRoDw==
Date: Tue, 10 Jun 2025 19:49:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: bpf-restrict-fs fails to load without
 DYNAMIC_FTRACE_WITH_DIRECT_CALLS on arm64
Message-ID: <20250611024913.GA1554554@ax162>
References: <20250610232418.GA3544567@ax162>
 <CAADnVQ+jNQyC=RcoiwDXeHj9y6CGzr322scz_8uGwCDVx-Od4Q@mail.gmail.com>
 <20250611020522.GA3981304@ax162>
 <CAADnVQKTGgBGgqfVsDGxijuL1oVkBOhmgx+0XQ+VOL4wLoVKYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQKTGgBGgqfVsDGxijuL1oVkBOhmgx+0XQ+VOL4wLoVKYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_194919_581826_625B7699 
X-CRM114-Status: GOOD (  27.10  )
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

On Tue, Jun 10, 2025 at 07:25:52PM -0700, Alexei Starovoitov wrote:
> On Tue, Jun 10, 2025 at 7:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Tue, Jun 10, 2025 at 04:37:24PM -0700, Alexei Starovoitov wrote:
> > > On Tue, Jun 10, 2025 at 4:24 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > > I was able to figure out that enabling CONFIG_CFI_CLANG was the culprit
> > > > for the change in behavior but it does not appear to be the root cause,
> > > > as I can get the same error with GCC and the following diff (which
> > > > happens with CFI_CLANG because of the CALL_OPS dependency):
> > ...
> > > > -       select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
> > > > -               if DYNAMIC_FTRACE_WITH_ARGS && DYNAMIC_FTRACE_WITH_CALL_OPS
> > > >         select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
> > > >                 if (DYNAMIC_FTRACE_WITH_ARGS && !CFI_CLANG && \
> > > >                     (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
> > > >
> > ...
> > > That's expected.
> > > See how kernel/bpf/trampoline.c is using DYNAMIC_FTRACE_WITH_DIRECT_CALLS.
> > >
> > > Theoretically we can make bpf trampoline work without it,
> > > but why bother? Just enable this config.
> >
> > As I note above, this is incompatible with CONFIG_CFI_CLANG, which is
> > more important for my particular area of testing and maintenance. Since
> > you note this is expected, I will just go back to ignoring the warning
> > in my kernel logs :) thank you for the quick response!
> 
> Somebody probably needs to fix CFI_CLANG on arm64 then.
> It's not clear to me why dynamic ftrace has to be disabled in such a case.

Commit baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS")
says:

  Currently, this approach is not compatible with CLANG_CFI, as the
  presence/absence of pre-function NOPs changes the offset of the
  pre-function type hash, and there's no existing mechanism to ensure a
  consistent offset for instrumented and uninstrumented functions. When
  CLANG_CFI is enabled, the existing scheme with a global ops->func
  pointer is used, and there should be no functional change. I am
  currently working with others to allow the two to work together in
  future (though this will liekly require updated compiler support).

Mark, did anything ever come to fruition from the "currently working
with others to allow the two to work together in the future"? If you
need more context, the top of the thread is
https://lore.kernel.org/20250610232418.GA3544567@ax162/.

> It's not disabled for CFI_CLANG on x86, right?

No, it is not but as far as I can tell, DYNAMIC_FTRACE_WITH_DIRECT_CALLS
on x86 does not appear to depend on DYNAMIC_FTRACE_WITH_CALL_OPS like it
does on arm64.

Cheers,
Nathan

