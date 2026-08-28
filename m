Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BACCC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckaGVw74rY49wuwKahOscpW27wYJycDGKErZJGjW1ng=; b=Q+3wlHdtsCqVSe0u6p1g64HT0J
	V/86wTARkU0SohfMsk9K+VUWxTw45HMHx4kXP70TXpmy2ZrFhXUdQIuv9aVIvps676wAq6DXgO+Os
	vh06D5cQgt40as7FfrY3y+838pukBVOfwSPn2k/1+zbDo3Yc1VbFOvClJWsdis2A8oeOn8rJbWbzI
	6N36A7tAHSsghin+HyfG+JxrmIcmijLnp3TQkszTr2zKMQIgxBPpPOXrutfqQHCJcSZYgjwpJ1asJ
	3lkv34QzsVTiiJesS3bSga3ixKYS0XsKvrmyD9e20l6KFyDBgiqAPDFmy8Ul8h6JxvV2lXcri0hT5
	ZxXAovkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxgI-0000000608v-2Apg;
	Fri, 28 Aug 2026 14:35:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxgH-0000000608j-1DQc;
	Fri, 28 Aug 2026 14:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ckaGVw74rY49wuwKahOscpW27wYJycDGKErZJGjW1ng=; b=j/13ETx4G/dFNQw+O8eobyyQgc
	vb65HchRPDcYLjcyC/fkNRFPF7qas14vbb7S1GpoV2I2Af6KgW93+TAewKnJQ9jPgtqk2OZ4eDYpF
	0eGT9oIxEXXxMOGJnz+Zvxpz77VhnwgFGBfGc5FM67FuzGeN+I5Mafj28D5LTj5F8G/dZkV4yJK4+
	g/PyiaahSQ3iyujx49bRLJZiZUJ+yXgaIlR0W2Rw3AYelbw6TU3UACtgxtALW4lUBvYYMD2rKLFE7
	q1zfp3Kbtkb7ki2dRGweNoxO9hxDIgG19FTnmrcPYemQ1XaAxnkT1xTxBpc0pWM6eJJY7vgg4Z1ww
	by1BAlOw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzxgE-00000008KRq-2kIR;
	Fri, 28 Aug 2026 14:35:42 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AC76130030F; Fri, 28 Aug 2026 16:35:40 +0200 (CEST)
Date: Fri, 28 Aug 2026 16:35:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: David Stevens <stevensd@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev,
	jstultz@google.com
Subject: Re: [RFC 00/10] Reclaimable kernel stacks
Message-ID: <20260828143540.GV776954@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260828124758.GP687043@noisy.programming.kicks-ass.net>
 <20260828103328.633bbfbc@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828103328.633bbfbc@gandalf.local.home>
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

On Fri, Aug 28, 2026 at 10:33:28AM -0400, Steven Rostedt wrote:
> On Fri, 28 Aug 2026 14:47:58 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > > On Android, system processes typically have 2000-3000 threads. App
> > > processes add 1000s more threads on top of this.  
> > 
> > WTF ?!? Why does that all spawn *that* many threads? Perhaps work on
> > reducing that some?
> 
> I guess you never ran Java ;-)

Of course not; why would you want to do something that silly ;-)

