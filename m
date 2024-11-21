Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D49ED63959
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i89Khx0GqP3Zx+oO/Z5xUP7cLcnHxhK/hIlEaRL1j/0=; b=wnInJKtQrCV3gcOezWcmwxLJqU
	bSC8NR6tZJy7CtFQeOApmaqM2jwCv8gqz9Ar6RtZwY/pVYUvWgunbj/ZGBDpyIHGHOMdNndKNQwg6
	C1h56O0ZeevALlCew7NO9sVljYdVlHF5asgjDRgepHMv3GtutdnYrZGiF8n9PWDQS+ejLjlsPVZAo
	5ha7peJLMrS2UXOPh4Cn+RGWPsaeDuRsrCxb87ghb14EIGi29vDb4PVnKHlKH5AqhkAZ1mjFwzD7v
	sGJsWz1CjVvHWsmYn5bUI3jH3BY3hup9vI3fw3oK+i1NC+TpDIbPi6TnIGngKKbF7VQD4gJGBwus0
	Muq/yb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3aE-0000000HGBr-2jLm;
	Thu, 21 Nov 2024 09:34:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3ZI-0000000HG54-1RBq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 09:33:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 889085C577A;
	Thu, 21 Nov 2024 09:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A79C4CECC;
	Thu, 21 Nov 2024 09:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732181623;
	bh=aSnTwvt7CneRsdTVfomrIM+e7aF5A3zhVBIPd3PyVWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLaupWNtlZ6TOc8jKpOtlZ+FxJ4u9TAuH71L94wc+LnOi1vmarIjTIwlu94RGiKpn
	 M1EY4wEFgEDQqn5Yzj54bpCxUSQTX6T8U/AM7QQUxz/H2tgaRoh8eVNQe66yBdRs/F
	 gfWsX0KHCxvbQoRNpE845Z7cQv5PM31O+BM4MREZo6vvewaqLd1ezRgBfTUQXwoiaW
	 X0hA88Lgg+Zre+6W2W9ZGObDdGKGtxUpVLkqXw0vMGxqHbTRKGebXF+S0BtiqmT/cw
	 ayh5Z2SMFS+QbwMocLDrnt34LusBPOVDMzIc4/hymcKJLvFN5eXOxDsJV146daoEl2
	 eIVTyMqG8E+Bg==
Date: Thu, 21 Nov 2024 10:33:33 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	akpm@linux-foundation.org, oleg@redhat.com, rostedt@goodmis.org,
	mhiramat@kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, jolsa@kernel.org, paulmck@kernel.org,
	willy@infradead.org, surenb@google.com, mjguzik@gmail.com,
	brauner@kernel.org, jannh@google.com, mhocko@kernel.org,
	Andrii Nakryiko <andrii@kernel.org>, vbabka@suse.cz,
	shakeel.butt@linux.dev, hannes@cmpxchg.org, Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com, david@redhat.com, arnd@arndb.de,
	richard.weiyang@gmail.com, zhangpeng.00@bytedance.com,
	linmiaohe@huawei.com, viro@zeniv.linux.org.uk, hca@linux.ibm.com,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kernel Team <kernel-team@meta.com>
Subject: Re: [PATCH v4 tip/perf/core 0/4] uprobes,mm: speculative lockless
 VMA-to-uprobe lookup
Message-ID: <Zz7-bXrFsC8zJwu3@gmail.com>
References: <20241028010818.2487581-1-andrii@kernel.org>
 <CAEf4BzYPajbgyvcvm7z1EiPgkee1D1r=a8gaqxzd7k13gh9Uzw@mail.gmail.com>
 <CAEf4Bza=pwrZvd+3dz-a7eiAQMk9rwBDO1Kk_iwXSCM70CAARw@mail.gmail.com>
 <CAEf4BzbiZT5mZrQp3EDY688PzAnLV5DrqGQdx6Pzo6oGZ2KCXQ@mail.gmail.com>
 <20241120154323.GA24774@noisy.programming.kicks-ass.net>
 <Zz4IQaF9CCfjS28S@gmail.com>
 <CAEf4BzYR44BgfAjKAvppmyG_hjojBL7XZe75C0qBTPoE7WXzHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4BzYR44BgfAjKAvppmyG_hjojBL7XZe75C0qBTPoE7WXzHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_013344_458730_354CEEE8 
X-CRM114-Status: GOOD (  22.14  )
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


* Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:

> Is this about Liao's siglock patch set? We are at v4 (!) already (see 
> [0]) with Oleg's Acked-by added.

AFAICS you didn't Cc: me to -v3 and -v4 - and while I'll generally see 
those patches too, eventually, there's a delay.

> > Andrii did get some other uprobes scalability work merged in v6.13:
> >
> >     - Switch to RCU Tasks Trace flavor for better performance 
> >     (Andrii Nakryiko)
> >
> >     - Massively increase uretprobe SMP scalability by 
> >       SRCU-protecting the uretprobe lifetime (Andrii Nakryiko)
> >
> > So we've certainly not been ignoring his patches, to the contrary 
> > ...
> 
> Yes, and as I mentioned, this one is a) ready, reviewed, tested and 
> b) complements the other work you mention.

Sorry, but patchsets that didn't even build a few weeks before the 
development window closed are generally pushed further down the 
backlog. Think of this as rate-limiting the risk of potentially broken 
code entering the kernel. You can avoid this problem by doing more 
testing, or by accepting that sometimes one more cycle is needed to get 
your patchsets merged.

> [...] It removes mmap_lock which limits scalability of the rest of 
> the work. Is there some rule that I get to land only two patch sets 
> in a single release?

Your facetous question and the hostile tone of your emails is not 
appreciated.

Me pointing out that two other patchsets of yours got integrated simply 
demonstrates how your original complaint of an 'ignore list' is not 
just unprofessional on its face, but also demonstrably unfair:

> > > > I'm not sure what's going on here, this patch set seems to be 
> > > > in some sort of "ignore list" on Peter's side with no 
> > > > indication on its destiny.

Trying to pressure maintainers over a patchset that recently had build 
failures isn't going to get your patches applied faster.

Thanks,

	Ingo

