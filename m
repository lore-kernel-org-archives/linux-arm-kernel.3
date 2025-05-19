Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEFBC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cE2+2rQly9HgL9bYXdkzjN1lsTGNQTRZg64/vSnA9+c=; b=D6INEhK6MWeo+o7IIzdCU78D72
	4Ac0omhxJLVkxfg2vKE4OslLw1ZszbB+KzSU3pwgKBY/Bc9ka4ILRZkc86rITSe8AaKPSzgQL6jM8
	X5Mz4uzvErTPrQg6gLCE4SrCa/MmUv9cIw/y4rQ9d94f+tFO+LnIdfA6UQsk5rvXnVdZMkp8H9tcq
	BtUTDT6Ciletk8r9xNPFcTh9uP4NMpOpeZo9X/Iq2ZUoTaXS0XSbW1VeJzwnCV64DPRxpEVzeB6hp
	MyjlPZMi2e6iJDF5T/EwXS8VHb1IAoG/dEj324/0lROoxG19x80wyTKDRPMy/Q6Cg6gbkyQia/JiM
	T+TaC7lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH05t-00000009ENS-2ntR;
	Mon, 19 May 2025 12:59:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH03j-00000009E2t-09GO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:57:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 309091655;
	Mon, 19 May 2025 05:57:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64BCE3F6A8;
	Mon, 19 May 2025 05:57:29 -0700 (PDT)
Date: Mon, 19 May 2025 13:57:23 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Song Liu <song@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org,
	live-patching@vger.kernel.org, indu.bhagat@oracle.com,
	puranjay@kernel.org, wnliu@google.com, irogers@google.com,
	joe.lawrence@redhat.com, jpoimboe@kernel.org, peterz@infradead.org,
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v3 0/2] arm64: livepatch: Enable livepatch without sframe
Message-ID: <aCsqsyjvD72YXtOJ@J2N7QTR9R3>
References: <20250320171559.3423224-1-song@kernel.org>
 <Z_fhAyzPLNtPf5fG@pathway.suse.cz>
 <CAPhsuW4MAcVpXmZVQauoaYe0o3tDvvZfgmCrYFFyFojYpNiWWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW4MAcVpXmZVQauoaYe0o3tDvvZfgmCrYFFyFojYpNiWWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_055735_116705_1C34ACF6 
X-CRM114-Status: GOOD (  14.82  )
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

On Fri, May 16, 2025 at 09:53:36AM -0700, Song Liu wrote:
> On Thu, Apr 10, 2025 at 8:17 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> [...]
> > >
> > > [1] https://lore.kernel.org/live-patching/20250127213310.2496133-1-wnliu@google.com/
> > > [2] https://lore.kernel.org/live-patching/20250129232936.1795412-1-song@kernel.org/
> > > [3] https://sourceware.org/bugzilla/show_bug.cgi?id=32589
> > > [4] https://lore.kernel.org/linux-arm-kernel/20241017092538.1859841-1-mark.rutland@arm.com/
> > >
> > > Changes v2 => v3:
> > > 1. Remove a redundant check for -ENOENT. (Josh Poimboeuf)
> > > 2. Add Tested-by and Acked-by on v1. (I forgot to add them in v2.)
> >
> > The approach and both patches look reasonable:
> >
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> >
> > Is anyone, Arm people, Mark, against pushing this into linux-next,
> > please?
> 
> Ping.
> 
> ARM folks, please share your thoughts on this work. To fully support
> livepatching of kernel modules, we also need [1]. We hope we can
> land this in the 6.16 kernel.

Hi; apologies for the delay -- my time had been consumed by
FPSIMD/SVE/SME fixes and related non-upstream stuff for the last few
weeks, and now I'm catching up.

For the stacktrace side, I'm happy with enabling this without sframe,
and I hase some minor nits which we can either fix up now or as a
follow-up. I'll cover those in another reply, and chase up the module /
code-patching bit shortly.

Mark.

> Thanks,
> Song
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20250412010940.1686376-1-dylanbhatch@google.com/

