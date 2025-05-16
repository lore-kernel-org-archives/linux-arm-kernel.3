Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C83C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olbEA6eMz5JbEFBYTODhfcrYvr5+1Rr1aU8+U9qSGf8=; b=3Q7VJoFUpFm+fxxU3jrWpmr+Vo
	E0dlafOD1TrmZOB53aH58dHL8QD35ysKNtkPmHuRib5pZG2jJGdVzvYaXXKJd4dc+72lI26ukFKkX
	hdlZH1F2oVVNmeR/sy62FI1mYKiP1Xqx60lR19i4V3MfB24QenhFqv9E6SeJc9+i+73kL7Qu977V/
	u1BvNLhZmtc/Hg6B1irUtLhorRsseH/Odm1qo1w9pJOLhIFGQqwFUgLrW+Urj10KoB445X6gHVGrz
	Lo2s7N4m/K342+gijtiRIAUUmniZPVLPmxA22XeNjj9Bv9CHGkJVXyKJNuf16GQXrSdSdCUeTS8T5
	Vfr9fWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFr9X-00000002xXr-3VwG;
	Fri, 16 May 2025 09:14:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFr7V-00000002xNF-317V;
	Fri, 16 May 2025 09:12:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9711A4E637;
	Fri, 16 May 2025 09:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6047C4CEE4;
	Fri, 16 May 2025 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747386764;
	bh=To9rgQRvNKeScnKbTmPrF+XAs6vdvnfL46mXdQcYXdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUNsK4qBaBBxJzi+e2ykS/6qWXVQddxS9Y6QIEcvzHTxHXg/f62zmMKWHawGqlyhY
	 AWznps5s1J2sUy03zPQGgriWJAI46hZiHkcwLdUcYvrlzEaZSifRuMYd5CDLAYeOaK
	 tQWaDgR1CUnEHhVo+S4SF26NLDVXZ1oVNeqRt8D6MX2sqcH/w+ZS1Hy/wMeY9hVSRi
	 tp8ZMZZjwvfReMsf5czOmR/92uPN8/eM+K0sw+iCkp8v2EHxW2l1UhdX3ryV/gi1U9
	 oSxvAN0F46d4DT00wP2bNtstMUrrDyV16NmgxbKeSSpN/pgWsU5ELUb0KtYda+7rNU
	 yxF4Txjj8Ilgg==
Date: Fri, 16 May 2025 11:12:37 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de, Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 00/22] RV: Linear temporal logic monitors for RT
 application
Message-ID: <aCcBhY3zYpuH_oIr@gmail.com>
References: <cover.1747046848.git.namcao@linutronix.de>
 <aCb1kBEkiriPbMo4@gmail.com>
 <20250516085522.g9Uq2WBN@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516085522.g9Uq2WBN@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_021245_810506_583F02B4 
X-CRM114-Status: GOOD (  11.34  )
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


* Nam Cao <namcao@linutronix.de> wrote:

> On Fri, May 16, 2025 at 10:21:36AM +0200, Ingo Molnar wrote:
> > 
> > * Nam Cao <namcao@linutronix.de> wrote:
> > 
> > > Nam Cao (22):
> > >   x86/tracing: Remove redundant trace_pagefault_key
> > >   x86/tracing: Move page fault trace points to generic
> > 
> > Does the renaming of the tracepoint class from 'x86_exceptions' to
> > 'exceptions' have any negative effects on tooling?
> 
> No, tracepoint class name doesn't affect userspace. The tracepoints' names
> seen from userspace are the same after the patches:
> 	exceptions:page_fault_kernel
> 	exceptions:page_fault_user

Perfect, thank you!

Since there's been no new review feedback about these two patches since 
-v5, I've applied them to tip:x86/debug, with a v6.15-rc6 base, because 
IMO they make sense independently of your series as well.

Thanks,

	Ingo

