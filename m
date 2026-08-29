Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF172C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 08:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHtGfUyv+NDEIFhJ+rL3MIjkKe1E4CjtH7InBn8uMWg=; b=nur6MYuhtLObW7yiwtBq1gvTmV
	t52a2HW90kf2eUwqC/RAC4j6r/XlcTUM17ha4OWpniCiRTeEFLl7fcci0Zb2l56iWeLf/oHOQMRil
	jdKvkEZkm5RBPNUKsnnisM5npVY+fHCcVGWyf75ZfrPjfLRO1h3QgWs3murht/adG9it6zGq/rfBI
	PrN4mcg3Vsf79xV1tvnZccZut4mIgwfZN7VkUQDsWS7NJO/poKuqjzMbNyWeDcOjhjQRLS1rtkwDf
	vq6NwVGAri9YvMy9jkLNp+gXuwZ0liLl1jLVzoDUj4DjGPk1ps8/6xcffHJwYLN9hEOE64ZYXO+4t
	/0Ts3VXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ef3-00000006rrq-38es;
	Sat, 29 Aug 2026 08:43:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ef3-00000006rrf-02dd;
	Sat, 29 Aug 2026 08:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eHtGfUyv+NDEIFhJ+rL3MIjkKe1E4CjtH7InBn8uMWg=; b=ZvkODfUjRXxzIXS3gx3ArInBac
	P7e8ollFJxQa2Sca0uHxuOn78euth+7/OAAiWvXv6gEwDtQknf7cRvXWnrXRC2yeBBdca7QE2cGUH
	JLa79YPVenz9rxuNyOEFGhm+ccbJeNvWEB/Z9nIUAC1YCfAmY55xMmC+9uUBr3nXDppmCSjZZpwnO
	vlJJLLxWzK+kbzE/MwrXBaW/lg+/Mrae2Kn9aV6xeIJ9gZQMa/vniKr1+V2AjwDvjTcBspOXTbRnY
	1xt11Kr2Yb71UtBujJZUKVfj22zEn/HMC9+E3dvI9A4FxgJ3Tw4qpqLo1axhRxTkOeP/iD7/GtYdA
	m4xg5f1g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x0Eew-00000008le1-27hC;
	Sat, 29 Aug 2026 08:43:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 63BD7300382; Sat, 29 Aug 2026 10:43:28 +0200 (CEST)
Date: Sat, 29 Aug 2026 10:43:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Stevens <stevensd@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
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
	Steven Rostedt <rostedt@goodmis.org>,
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
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
Message-ID: <20260829084328.GO788244@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
 <20260828120408.GN687043@noisy.programming.kicks-ass.net>
 <CAOiLmNHWGSwAqH815X3JWMrQCc2nh-fRNsNZ0hjQGv8JvFndag@mail.gmail.com>
 <20260829083929.GZ776954@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829083929.GZ776954@noisy.programming.kicks-ass.net>
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

On Sat, Aug 29, 2026 at 10:39:29AM +0200, Peter Zijlstra wrote:

> > The optimistic fast path for repopulate_stack() could be modified to
> > try pulling from a pre-allocated pool of zero'ed pages. That would
> > reduce the function to a couple of memcg_kmem_charge_page() calls and
> 
> Afaict memcg_kmem_charge_page() ends up in a local_lock, which is a
> spinlock, so that cannot be.

Perhaps just don't uncharge them on reclaim, then you don't have to
re-charge.



