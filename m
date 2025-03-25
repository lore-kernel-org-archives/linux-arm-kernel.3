Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A81C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nb567w52U4VX6RZjUZZTTfiL9LAMzEOtwHBwdKK5Hbc=; b=sL3P+HdCO2gs04Qtu8UndZvYcn
	QCTMrBuQ2EOSR80U2nh4lXlKpfVrZGN5uEthMnaROW9KH0/LfYX9m0FGSQRFQQU5KdHzeey9WxuxI
	ufsSmz20iJNtN09F0jG15x7aAqJSfhDAdDRxo76KRYKq/Zd95eXWsxirQwPtGKBmSpWS+M3xw3qd6
	x4s9Pd6p8Ku1QgfoLwpJTaZ5gW7X43vveFo7p2GXoRFBvtW8KH6mHhcGLWa5XJJwGoPZ8YaoIxRjo
	ksr3re02cufJJ9shK77wZzOBYURGPbMyc8BUKn14bcXdHkGlhx4leF+7hNBsbR8g3sxvbZ2BpyPOB
	85O97D3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx20B-00000005ZBt-2Kl2;
	Tue, 25 Mar 2025 10:59:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1uY-00000005Vko-4A4X
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 10:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Nb567w52U4VX6RZjUZZTTfiL9LAMzEOtwHBwdKK5Hbc=; b=KgO5HIoukwLGEoCeX08x3EAFwK
	GguROLbOvjWQ/+UilEVKvr0ye+kuwYiGN3sLL+QkP8mE6bXpw2MSDESAE5pCllViCqmRZB2+iaoHz
	BS9uZlyi5xy1y+rQVtWNi78ok9I5/x+dxOij5WuzFLkmmLF3fChSUVuQwUZe0ph/OHXmRHqxwuZRS
	v8m9zjz4AJ89tVe6vQMNuLPXBb6KMI5L7acEYKAnXanttEy3ATH33I9MwGcTbk/6AGa6GhSV7S6Hv
	5T9m7oyaE4C1pGtBIceHds6d1vwSbTcSo6jSy/qtxIEKJAS2YO9xGVwBf5cmry9olzAS3sdLDY2Q9
	VF14oI6A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1uU-00000003qLq-3WNM;
	Tue, 25 Mar 2025 10:53:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 66A333004AF; Tue, 25 Mar 2025 11:53:30 +0100 (CET)
Date: Tue, 25 Mar 2025 11:53:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH v3 0/3] kernel/events/uprobes: uprobe_write_opcode()
 rewrite
Message-ID: <20250325105330.GI36322@noisy.programming.kicks-ass.net>
References: <20250321113713.204682-1-david@redhat.com>
 <20250321133401.GB4776@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321133401.GB4776@redhat.com>
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

On Fri, Mar 21, 2025 at 02:34:01PM +0100, Oleg Nesterov wrote:
> On 03/21, David Hildenbrand wrote:
> >
> > Based on mm/unstable.
> 
> which has another fix from David in __replace_page() plus the fix from
> Tong in uprobe_write_opcode().
> 
> So, Andrew, could you take this series as well? Peter, will you agree?

Yeah,

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

