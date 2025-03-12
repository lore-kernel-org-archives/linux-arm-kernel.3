Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA47C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qR4Hm7WDZNeUufbu+QjLgwRPhKliBqhVccVeF6ofnsQ=; b=3ArLnrVGVAY1OfyfVaOnSEdcIo
	bjiU3muve2yIy5yqzppNTAYS83UnXHb2Cf86xEcSGpNr4frDGIgEN5f3JY3lxMy2fiwb/8pKaBIrO
	i1dkP4PkvNtrl4VnZkgd+j5qx46y/hoGeTu4vjR8n792HmeXgPEk1HtRnqZzI64YIXR2y3CquU9K1
	OY5yKN83ws37iCxX2kvoqurwUgpmvOHf/s/mnCN9GU75THQBKDmNs9tUmGbgDJ/WYYEvvEonngNg2
	lzSzINgqmmOJqqgrboiT3v8KmeEBZpZxKSoROSefGO4Bqg36fUVPF+XMGiOxRpbEH3NgG/2ZfKzhI
	sjE7Barw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJtE-00000008Ch1-00lo;
	Wed, 12 Mar 2025 11:04:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZD-000000088ii-3hAx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Mar 2025 10:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qR4Hm7WDZNeUufbu+QjLgwRPhKliBqhVccVeF6ofnsQ=; b=scQeckOrG+UkeHEF+ATM6U0yUY
	WsuAVF3H1/pUTbvc/551syNu4FQS6LX9cV0YQYuydwQP/gCC4Asx4n+fRhfAJCIV/RGfGij3hLW78
	fAzdZAaEDL7VKrpYjpJ+egVx65rkYNJNmXcgAe30eiPlzIxWSGI6H/wET1TxWi5PVnpIzjwLgjm+i
	tYc+enZvjvTS4COA1CcMkENs3jvaIVqFGPiijEcE0GHaEhDOlLffrHla4cuMsvsoGlu1SuwaT4loK
	PqHGj/zYqsJVVgEL+QLKLIQZuz0dJsSn8ayQ6CIdhjLcZfdv/YisKw3HgW4HeKY4wpvtTpr+ZSY1Y
	I/dHv+lg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZB-0000000Cj9G-2buh;
	Wed, 12 Mar 2025 10:44:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 38866300599; Wed, 12 Mar 2025 11:44:01 +0100 (CET)
Date: Wed, 12 Mar 2025 11:44:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mark.barnett@arm.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, ben.gainey@arm.com, deepak.surti@arm.com,
	ak@linux.intel.com, will@kernel.org, james.clark@arm.com,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] perf: Allow adding fixed random jitter to the
 alternate sampling period
Message-ID: <20250312104401.GC9968@noisy.programming.kicks-ass.net>
References: <20250307202247.648633-1-mark.barnett@arm.com>
 <20250307202247.648633-4-mark.barnett@arm.com>
 <20250311113128.GD19424@noisy.programming.kicks-ass.net>
 <20250311113530.GA9968@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311113530.GA9968@noisy.programming.kicks-ass.net>
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

On Tue, Mar 11, 2025 at 12:35:30PM +0100, Peter Zijlstra wrote:
> On Tue, Mar 11, 2025 at 12:31:29PM +0100, Peter Zijlstra wrote:
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index b87a5ac42ce2..e5a93edf3b5f 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -8,6 +8,7 @@
> >   *  Copyright  ©  2009 Paul Mackerras, IBM Corp. <paulus@au1.ibm.com>
> >   */
> >  
> > +#include "linux/random.h"
> >  #include <linux/fs.h>
> >  #include <linux/mm.h>
> >  #include <linux/cpu.h>
> 
> Argh, this is neovim trying to be 'helpful'. If anybody reading this
> knows how to make it stop adding headers, please let me know, its
> driving me nuts.

Adding this cmd thing to the lspconfig like so:

require 'lspconfig'.clangd.setup() {
	cmd = {
		"clangd",
		"--header-insertion=never",
	},
}

seems to do the trick.

