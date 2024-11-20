Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5625D711BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+z3iZINUl/nDCl5+dCp6FwlK8hB2wAiYZgCAxfQitM=; b=QF7Cqt2kzhT/5/TvW1Fo8xQVoP
	yLJNx7htbu+2+n7O304zPXl6K1LkRYFUfrmwNzCCuyh1tg9rzWY/u4UOUeVNQIJGtG4/yowxzo0Ar
	bvDn3E1lxkQ366w/ZvdfRLCF35wUQM+7YskAArg2/+3OTJ2X/7gDCqwqELIu8pGMjgSKOqo6xe70j
	nFtAZ/UkSIqbfiB3Gz/659UcJ2MUhS/pOHkUFbFgBN9NIiIwhfFwFcWbAZwxJNNsweEJcnwi5fdFR
	qijJrDlFrI2aNulLfy7CyINUmPu6yMDnIwdzsM5hjLFUNGjynGT5YCoJDAtQsJ/04ZssUMZ94/mmm
	KEs889Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnEr-0000000Fm93-10tC;
	Wed, 20 Nov 2024 16:07:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnAr-0000000FlIv-2LfH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 16:03:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 114165C5D83;
	Wed, 20 Nov 2024 16:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3DCC4CECD;
	Wed, 20 Nov 2024 16:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732118604;
	bh=l9At4QAU1UWOdiHd0AM/zaIAhJIXZNKutllsFxhd04c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBRUWNLHRfZeQXMu7YAN3oI6Uslc8DdiOozdXsGOLr5vSQVyQBykU8uvU1q668mLY
	 TMtblbKYRnL24mIoJatHJ2AZiGKghQBFG/eTgfk4sIjgVRqe8TfyJ/xk2vwnX1WnHA
	 wLA6aGH16h/F9Bis7foCon/OkCF9RPqyCsY9TCjStwVdBSUbWembvOCPmjIF4GOvVj
	 tvbF11Dc4XbXwkRf0KNuvjtSsjT634wGzdQ1R5MtHwraGXLVV/LWT0FSyqQ25APhJs
	 coRzeI/IFJZzzvtDkp8ZglyDCN+ym0jqz5AWZqyiCK8smJvW+qPsrJTsUl1y8VlJI2
	 +dPiw54jhcWWQ==
Date: Wed, 20 Nov 2024 17:03:13 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
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
Message-ID: <Zz4IQaF9CCfjS28S@gmail.com>
References: <20241028010818.2487581-1-andrii@kernel.org>
 <CAEf4BzYPajbgyvcvm7z1EiPgkee1D1r=a8gaqxzd7k13gh9Uzw@mail.gmail.com>
 <CAEf4Bza=pwrZvd+3dz-a7eiAQMk9rwBDO1Kk_iwXSCM70CAARw@mail.gmail.com>
 <CAEf4BzbiZT5mZrQp3EDY688PzAnLV5DrqGQdx6Pzo6oGZ2KCXQ@mail.gmail.com>
 <20241120154323.GA24774@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120154323.GA24774@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_080325_639031_DE3881A0 
X-CRM114-Status: GOOD (  15.39  )
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


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Nov 20, 2024 at 07:40:15AM -0800, Andrii Nakryiko wrote:
> > Linus,
> > 
> > I'm not sure what's going on here, this patch set seems to be in some
> > sort of "ignore list" on Peter's side with no indication on its
> > destiny.
> 
> *sigh* it is not, but my inbox is like drinking from a firehose :/

And I've been considering that particular series WIP for two reasons:

 1) Oleg was still unconvinced about patch 5/5 in the v2 discussion. 
    Upon re-reading it I think he might have come around and has agreed 
    to the current approach - but sending a v3 & not seeing Oleg object 
    would ascertain that.

 2) There was a build failure reported against -v2 at:

       https://lore.kernel.org/all/202410050745.2Nuvusy4-lkp@intel.com/t.mbox.gz

    We cannot and will not merge patches with build failures.

Andrii did get some other uprobes scalability work merged in v6.13:

    - Switch to RCU Tasks Trace flavor for better performance (Andrii Nakryiko)

    - Massively increase uretprobe SMP scalability by SRCU-protecting
      the uretprobe lifetime (Andrii Nakryiko)

So we've certainly not been ignoring his patches, to the contrary ...

Thanks,

	Ingo

