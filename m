Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887BBCE9D5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5C/aoTJEupK3hKrdm66qVLEES8Gp5dXalI/+c69WdD0=; b=FNOmFCROyYPfCpWOLUrlR/KNCt
	TmSXp2ofOE89igJ0vg1UPzDzLNDsJalebYt60eXnCVUMB5fAdTHfPLDHudaS0epa6q/pLT0ojF45q
	ZBegtz5+p1DUtmTR5X/UNkzDvQ3kU+h1fDrXzh8Tgz6DWmAuv1T29hBlLzq4VB5dpBYXr1LNtofug
	4zKdwg0881NFT43mW1t3AM9HjJF9ZNEwV1HePM8zacWBynP8teqCqbljq3pIctc8GxFa0PAf0flW3
	PMKRGPvRku1ixOHFE4MkCce3krVKHIuhiHnMWy/xRkRNPrQuJaflvZJivWnUKnRYj1EWomAYq1rkQ
	4b56rPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd92M-0000000DPgF-43wP;
	Tue, 06 Jan 2026 15:31:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd92K-0000000DPfu-130S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:31:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06DC5497;
	Tue,  6 Jan 2026 07:31:48 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 958933F5A1;
	Tue,  6 Jan 2026 07:31:52 -0800 (PST)
Date: Tue, 6 Jan 2026 15:31:16 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Laura Abbott <labbott@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@meta.com,
	puranjay@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Disable branch profiling for all arm64 code
Message-ID: <aV0qxGioAXxkh6QD@J2N7QTR9R3>
References: <20260106-annotated-v2-1-fb7600ebd47f@debian.org>
 <aVz-NHMG7rSJ9u1N@J2N7QTR9R3>
 <tj43kozcibuidfzoqzrvk6gsxylddfpyftkdiy7xb2zm7yncx5@z33xu7tavuts>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tj43kozcibuidfzoqzrvk6gsxylddfpyftkdiy7xb2zm7yncx5@z33xu7tavuts>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_073156_355144_4D30C9E0 
X-CRM114-Status: GOOD (  21.72  )
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

On Tue, Jan 06, 2026 at 06:05:37AM -0800, Breno Leitao wrote:
> On Tue, Jan 06, 2026 at 12:21:47PM +0000, Mark Rutland wrote:
> > On Tue, Jan 06, 2026 at 02:16:35AM -0800, Breno Leitao wrote:
> > > The arm64 kernel doesn't boot with annotated branches
> > > (PROFILE_ANNOTATED_BRANCHES) enabled and CONFIG_DEBUG_VIRTUAL together.
> > > 
> > > Bisecting it, I found that disabling branch profiling in arch/arm64/mm
> > > solved the problem. Narrowing down a bit further, I found that
> > > physaddr.c is the file that needs to have branch profiling disabled to
> > > get the machine to boot.
> > > 
> > > I suspect that it might invoke some ftrace helper very early in the boot
> > > process and ftrace is still not enabled(!?).
> > > 
> > > Rather than playing whack-a-mole with individual files, disable branch
> > > profiling for the entire arch/arm64 tree, similar to what x86 already
> > > does in arch/x86/Kbuild.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: ec6d06efb0bac ("arm64: Add support for CONFIG_DEBUG_VIRTUAL")
> > > Signed-off-by: Breno Leitao <leitao@debian.org>
> > 
> > I don't think ec6d06efb0bac is to blame here, and CONFIG_DEBUG_VIRTUAL
> > is unsound in a number of places, so I'd prefer to remove that Fixes tag
> > and backport this for all stable trees.
> 
> That is fair, thanks for the review.
> 
> Should I submit a new version without the fixes tag, or, do you guys do
> it while merging the patch?

I assume that Catalin or Will can handle that when applying (if they
agree with me); no need to respin.

Mark.

