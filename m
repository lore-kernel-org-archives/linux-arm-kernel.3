Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67688C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjjUjhR7vIQHCQ5PzFsfoOwqe27nlOhO0vUIUfr8iw4=; b=ack79lUOqAS+rEk8Xhz/wpjGnY
	ZfA6HmQjOAwnKeUf42mWUGQbapsfnT7DT7T+TjiKuG8IRrMuUDzKvAE58WMeBlPlmdQHGUGO9/53o
	COvphH92qanikWgxMdDdPYSujESxID7S7Vb+U0z6QqSqT+BcoXmIub8qo61YuvJIZ4EydGReI+j3U
	NEeNy6tE9hJBbrle3iFKS2Ejk2PzZZA6f8Cdd6pO5MF+oHXULPHrJijCW95605NZaowVJgtSAVyQH
	cejELs/NU5BVLK8W0U8h/E3UPzGYw3vQ6DcrAcHSkNHbo3M3K/S66MAR5fBnl1c/uaRLaVnJIMu8w
	8K/SyXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4Gx-0000000GOxa-465s;
	Fri, 14 Feb 2025 22:34:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4FV-0000000GOo9-1acc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 22:33:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57FD9A44BE4;
	Fri, 14 Feb 2025 22:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE53C4CED1;
	Fri, 14 Feb 2025 22:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572408;
	bh=I0We4+HPs5dEfYhay/YlzzWO3zPvIdMYOxdN43pC8To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gk9AIpKPgslAd8QCZWjsZYHVLZ4yoOxeYcGjCZCbJbZ0VeLu6fCzN3pqYz+JKeYKf
	 mlRTta9VKKWflFC1qT9QN7/tt/xKEBXctO5Ue/0BRIR1Yvevuk0RXWD6xXXmnEpBDG
	 c7gzl8AjapADNS6Jsbl/yfhhJeoSc5/Ux59NuVQpOHYkQh5Q3nb8Qu82XOkdkpupQl
	 0GUdIS7VqcjYvWkgVJyCDy9EtahkWWGJQJ/duqZSBfVapW0NgW5zMTi7AhGUso6686
	 ION1V/snvb2mgVAyvEmDzJq0/9VLWcFTSa+nG0J2oD++oY/ddsVbKxa/w+fqei6l9N
	 mzk1QjM7BxEBA==
Date: Fri, 14 Feb 2025 14:33:25 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>, Weinan Liu <wnliu@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <z3msrl3u5wxdulvlecvehzbsu3rpeul7ckbjf4cy7guhcszqpm@xn4yhenfbvok>
References: <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
 <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe>
 <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <mb61py0yaz3qq.fsf@kernel.org>
 <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
 <20250214080848.5xpi2y2omk4vxyoj@jpoimboe>
 <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
 <20250214193400.j4hp45jlufihv5eh@jpoimboe>
 <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_143329_471210_786F971B 
X-CRM114-Status: GOOD (  18.34  )
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

On Fri, Feb 14, 2025 at 02:04:17PM -0800, Song Liu wrote:
> Hi Josh,
> 
> On Fri, Feb 14, 2025 at 11:34 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > On Fri, Feb 14, 2025 at 09:51:41AM -0800, Song Liu wrote:
> > > > Ignorant arm64 question: is the module's text further away from slab
> > > > memory than vmlinux text, thus requiring a different instruction (or
> > > > GOT/TOC) to access memory further away in the address space?
> > >
> > > It appears to me the module text is very close to vmlinux text:
> > >
> > > vmlinux: ffff8000800b4b68 T copy_process
> > > module: ffff80007b0f06d0 t copy_process [livepatch_always_inline_special_static]
> >
> > Hm... the only other thing I can think of is that the klp relas might be
> > wrong somewhere.  If you share patched.o and .ko files from the same
> > build I could take a look.
> 
> A tarball with these files is available here:
> 
> https://drive.google.com/file/d/1ONB1tC9oK-Z5ShmSXneqWLTjJgC5Xq-C/view?usp=drive_link

Thanks, I'll take a look.

> > That kallsyms issue has caused other headaches.  It really needs to be
> > fixed to use the actual ELF symbol size.
> 
> Maybe we should have a "module_text_end" symbol?

Maybe, though it would be a lot cleaner for kallsyms to just use the
actual ELF sizes.  And actually I'm thinking that would be a pretty
trivial change.

-- 
Josh

