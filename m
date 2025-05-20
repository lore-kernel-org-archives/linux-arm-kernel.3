Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B85BC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/xYMuJvlYqKg9T8+4FvlvemlbEjveAqHRjitcUsup8=; b=OW7zV8yQo4ETJCqSwsVnKlKiuV
	2OAm0FabZZ/tvGdeEWkhGiyndD6AC/fAItyy/OM/ZZ6jjM9xTJ7o131o7Gz4XHrATalGisnSK0e26
	7SpLY6/9m1N41BNEnsh4yC0d7M7B6zw/QiEQUhyk45di6oDezz0FKyc8hpJbGjHYY2vYvTocyNOCO
	ymp0vXMMYL+zNpJJ+gfa3LTUQp9GVGrhDvP/HN5Ikw3LvlqUBPSSdsganaclnlXTUPcP5WVqP6TrC
	UP1LMJnWC+CyY63kfMjp/VabdccqH1Co/b+2k5gVzz4yM2zLrpM4s6UvOeXUipZd8flXjQQ1OX7gS
	/wu6I3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNcc-0000000D6jA-3X5X;
	Tue, 20 May 2025 14:07:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNaW-0000000D6PA-1UUW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:05:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7082C5C561E;
	Tue, 20 May 2025 14:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3917C4CEE9;
	Tue, 20 May 2025 14:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747749899;
	bh=FwTN2M9DsTfsj/6tueLnbl1Llxw38v4QaqUMi15NmgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ES8SmexGvRqYBgMtzkBjOvrX8znCoPDidI0UZGzvGoeB4LDg48e4Pbi61iBWLDs+l
	 vRwHMbBZr1dj9zKsF5t4lC+VmR7XYkv8nUYzycpmwY/LPtxMxPFPU5kmSKLGKE+ytf
	 j/JYY/cXGPY2bd1DHz64piyGl6OT5jutJn9/54pWOyvUPGsY7rZ69SbkR+ICbTq9X6
	 YjQ3Ouo8oynmSUZlaTNCgBUIKWPJLzcf74ZCRQYXrlif7xBV0Sw1+17+s+XCdltnw7
	 1j2u3nI01jk9hQr0RxXck0JNmHTvm2RH3fy5aZBp6UwDQ2a6hsFmHL107VvNuyiP6p
	 whQD/WTNnDIcQ==
Date: Tue, 20 May 2025 15:04:54 +0100
From: Will Deacon <will@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Nam Cao <namcao@linutronix.de>, Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 17/22] arm64: mm: Add page fault trace points
Message-ID: <20250520140453.GA18711@willie-the-truck>
References: <cover.1745999587.git.namcao@linutronix.de>
 <554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de>
 <20250516140449.GB13612@willie-the-truck>
 <3E29A42D-8A6A-4342-8C60-2BEF1EDCD640@goodmis.org>
 <20250519151238.GB17177@willie-the-truck>
 <20250519120837.794f6738@batman.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519120837.794f6738@batman.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_070500_438279_B9C53156 
X-CRM114-Status: GOOD (  21.14  )
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

On Mon, May 19, 2025 at 12:08:37PM -0400, Steven Rostedt wrote:
> On Mon, 19 May 2025 16:12:39 +0100
> Will Deacon <will@kernel.org> wrote:
> 
> > > Perf events work for perf only. My question is why isn't this a tracepoint
> > > that perf could hook into?  
> > 
> > Well, the perf event came first in this case, so we're stuck with it :/
> 
> I wonder what effort it will take to convert perf events to tracepoints ;-)
> 
> Note, I'm talking about tracepoints and not trace events, where the
> latter is exposed to tracefs and the former is not.
> 
> > 
> > I was hoping we could settle for a generic helper that could emit both
> > the trace event and the perf event (so that the ordering of the two is
> > portable across architectures) but, judging by Nam's reply, the trace
> > event is needed before kprobes gets a look in.
> 
> Perhaps we could add a helper function that does both (perf and
> tracepoint) and hide the implementation from the code that calls it?

Something like that sounds like a good idea, yes.

> But I'm currently still on PTO so I haven't looked at the details yet.

Enjoy!

Will

