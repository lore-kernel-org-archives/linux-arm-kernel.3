Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF26FC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=; b=SrLQVrLqjEjzvMJ0MfF3oDhXR0
	3m25Ppm8Yx/ZlynCgX963+yLGi+lMa3+TxWKUDzWDlFHdSYM0MvB5W7SejutqDAz7iQKzCceo6leL
	L4Al/spTqFG4TMeWlc7WuPbMNvv9xrOnkhvIi+rbOztMhtJGQXeX4rBqPiQqt13RRRqGP9RJjyraT
	zNuDDy8u70WueQxJIw5iReqtFDSyK2h6vmVLO2rPQSf7khCV+D4zacrhoHlTK+Est7CuLoBFbDV3M
	kIHwEZr59K9nFQDoc8dDS2js4LCrOj/lRuKk4H/vxyFFZPiv7Ty++TJnr1lCcr5DKDnwp/04lfRxY
	KJrXQXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibBZ-00000005o73-00Jn;
	Wed, 21 Jan 2026 16:36:01 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibBW-00000005o6B-3wfp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:36:00 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-655af782859so6358a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 08:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769013356; x=1769618156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=Zb4JdEpUQDvdlps9a5y29c+rr1Ybrv8pSOoCnuStZa+NCOP7XMcPy4xZrf3W8bA5pA
         Py+NQ7KCP5FHsOcG7egENK0szpQ9A0O4De740yIQM5CRO0Pr4mw7wtB0YsbOIyk2/d0a
         ZGE713HR9oxioIltoWkPHc4j/78kMAaA04EMOUXQV/a6V1qUN48LK71JgI9M6h96tdgS
         kD0ulP4FfjgLS4lpSU6kB02B4uXf64kCSF92Qo4c0nisY6u/v41XrhzYuSX5NpEd/Ewk
         +aRZt9PZPJGQ++0/xFUd7zHUi/lHIvzAbgokgXuby1GLSeU55U7/QuYdBT1TWKZtRMlH
         wztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013356; x=1769618156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=CqfbgIG7FWrpeEtfcuNbYG9Iqi1EwJ1YNTR4FSSN5jy7vq9Hi1yhEdAaZjIAzNjXAv
         0WTQMtuLRSryRbU/paNBh4CGpvT03cvLkhqA78QqSbFDxh3xwBc+dFMhP+j0iSPH0q2T
         xxD4IE6LpKRY1DAZM+BgAHXR5UctU69hokgNStYZhFgXZIaYarPhMf702SeepEDmmHrG
         gtoVI+FMbb5VDQwaLh+231z1PvouNcfJ83X65zD7+UsmUsaFCXUdqGR7sVq08toQwoKm
         q11HxgGaJcoy4mRHATIbfRCRhflX7yFd5mrt4InnWP5h6LPbCl+fKWwQDV/tHrJ8l87P
         tC4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvYRLhLcpvcCSKgZfRZ3k76MgffNHA/RT00a6azU/kGgho8NtQpdXwOLmrmvzeW+Ht/awkuQLlqzLJOcAlxN7f@lists.infradead.org
X-Gm-Message-State: AOJu0Yymepx32ba+RGA4M9MvF23/t1FmzuHsvvKXrRr2rFhg1C75qM24
	PzUPEhoOTbZ2mcwaqWwN07ZpG9NR6dJh6+uczYZOViFsuWoetlUJ0N1j
X-Gm-Gg: AZuq6aKnRaJrMe5sTc83flCu+nharnDlFW6yTwHo7oDhFecLJvJfcSOmw8Y2zncocaP
	p+sS9OTAYI3U01LlXsPxzbzL8WRSvzvBgb0Lz7Kf/JlWHUkhEITBZHAXfhWmw3FSsL4CLhLvP1J
	bZ5IpeXrMIlWCQUhyXxF1OQek32E7dturiyX392jdMJ32PCS2oe2JvDCYxKG1pY3q78ua3uaAdY
	MToenD6r/XmlEhz1NvhqoWdiBdd6EBeY2d+vVUPqEC1Fd8o0P5Yl0xuD7xWpDer3BR+bX3kT3jC
	WArueir9iOnJgsvR2rgdtJ7QTm+cG9FQyv/Enz61ibVnB45v0EOEtUJZ6j/1nAyMxM5a2gT3ucw
	rzg11Jps0/kJsd4HLd1knbnroihO55aQWEnPKGHpBdVAwVnJkkRK2mvGZYAsvE5+5pMXX0jMEPE
	hdunW0Nh/SvRsBhfmUleGvNkT1QU+LM47zxRzRWs6bCpiDMcp06TcU
X-Received: by 2002:a05:600c:4fc7:b0:480:41f2:b212 with SMTP id 5b1f17b1804b1-48042f7e0e0mr38897745e9.25.1769006884109;
        Wed, 21 Jan 2026 06:48:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm274897235e9.7.2026.01.21.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:48:03 -0800 (PST)
Date: Wed, 21 Jan 2026 14:48:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260121144802.1287ce3e@pumpkin>
In-Reply-To: <20260121102017.539b5531@pumpkin>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
	<20260121102017.539b5531@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_083559_006053_56AF3C1F 
X-CRM114-Status: GOOD (  27.63  )
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

On Wed, 21 Jan 2026 10:20:17 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Wed, 21 Jan 2026 07:50:16 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Ryan,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on akpm-mm/mm-everything]
> > [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> > [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> > patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> > config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> >   
> > >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> > >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section    
> >   
> 
> When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
> the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
> become real functions.
> 
> Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

Or the code could just use the per-cpu data without disabling preemption.
Usually that isn't a good idea at all, but it can't matter in this case.
Might give a noticeable performance gain, disabling preemption is
non-trivial and/or an atomic operation on some architectures.

If anyone is worried about preemption causing the output be repeated, that
would be (mostly) mitigated by checking that s[1234] haven't changed prior
to writing the new values.
I think a 'not locked at all' compare of two of the four values will
stop everything except two threads doing system calls at the same time
getting the same output from the prng.

The whole thing is very unlikely and there will be much easier ways
to break the prng.
Provided s[1234] are only written with valid values (ie ones which aren't
effectively zero) it will continue generating numbers.

	David


> 
> 	David
> 


