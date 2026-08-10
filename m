Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBA1C5B56D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhNvBLW3n/gdhH5TrPmRuobCp8VneYhPXi7Yulmj/cI=; b=j+O88AnTEYjS49y+ZK+K8uTEp1
	rwfCxDlggB/XIJQRXpOIz/HlN/FpmtqXGXsDsBB70vDhQhUZlag40eJOyPuMHAA2COlceKzTP2l0Y
	lylpMVFpkDb4gkJpH5mDxi7y/Er6UrfFgN8NO09G5VJirmUtOksmWupvLTmpMkjbfofIkQkWZqWIj
	B9sADX9dqchmb0inyv9+6F3q8+Z7vYMqW868WdoCYNHqe5e8YKmkzOV/LYYyO4KHN4cKvuRXYPOD9
	EgMKz61mUUpjdWoMos51OAd5dfGdfAHKqToK3TokA6Cpb18Cdfm9AWJuwMKRlbi/ChH3CNpzGMByv
	9uW9aIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRie-0000000CAnS-2QwV;
	Mon, 10 Aug 2026 15:15:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRia-0000000CAjA-1bS5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:15:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FB874326B;
	Mon, 10 Aug 2026 15:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA2D1F000E9;
	Mon, 10 Aug 2026 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786374911;
	bh=jhNvBLW3n/gdhH5TrPmRuobCp8VneYhPXi7Yulmj/cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bWC7rXEA8pnDCRbv8elSm68Y39ob46UXpwTKd5Lv/4BKJg9kbgNa+FdAlTXt0A/Ew
	 TGVfczoOXzyRYopF0M6gmeo6UTT/TD6w6Uma0O8RVRATmL5GorjCs9ERBjm+AlKlwN
	 zoE1E/yTQTYX9U5i6PODxjLV+RQ2/7VFkryrP8OmNkkiqt4n2gZ8J1qTmA9Jz/f989
	 9fZEEG0yAASomZ8fNGY/1VDu+FXwWcRn/KEXBLYwEve23NQjEj0dbK4Li+JwvQbzbv
	 z/Az/slbNC7KyZMo+272T4UpWtE7B4FgUUG979v+qIV2waBMOcEAUDjvuNDW8yiLWM
	 RaLIPYknbRfAw==
Date: Mon, 10 Aug 2026 16:15:06 +0100
From: Will Deacon <will@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH RFC] arm64: Mark set_preempt_need_resched() access to
 .need_resched
Message-ID: <annq-ldauKsp1wq5@willie-the-truck>
References: <amyaRXx8zXxOMgTL@J2N7QTR9R3>
 <13df4ff4-8594-4c37-b25f-860248a222cf@paulmck-laptop>
 <4fa802e7-6cfc-4cce-afee-c29b28171ad3@paulmck-laptop>
 <anR28GyRtCpApQYX@willie-the-truck>
 <ca54b283-3349-43d4-9460-32b084709d67@paulmck-laptop>
 <anXKRdA9sUziFda5@willie-the-truck>
 <CANpmjNPCM0NV1EN2pNBf3EBBk8eLjbGGAiZ_+rJkoROJtG3jFQ@mail.gmail.com>
 <anXbTwhaWZCIxxTg@willie-the-truck>
 <anXheKZ7zKNw1oD_@elver.google.com>
 <5c607693-7fce-4b24-a648-95ab96db6691@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c607693-7fce-4b24-a648-95ab96db6691@paulmck-laptop>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, dvyukov@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Aug 07, 2026 at 11:44:56AM -0700, Paul E. McKenney wrote:
> On Fri, Aug 07, 2026 at 01:45:28PM +0000, Marco Elver wrote:
> > On Fri, Aug 07, 2026 at 02:19PM +0100, Will Deacon wrote:
> > [...]
> > > Ok, but then I don't understand how these accesses can race. They appear
> > > to be on the same CPU, in the same IPI handler.
> > 
> > The only way this could happen is with an NMI, but that's not the case
> > here? I should have looked at the 2nd stack trace, and it seems to be
> > clear that this is a false positive: KCSAN sets up a watchpoint on an
> > address that is also accessed by __delay.
> > 
> > One problem with disabling KCSAN in this CPU's context is that we'd fail
> > to detect data races from nested interrupts.
> > 
> > So yes, the best way forward is to disable KCSAN in the delay
> > implementation. And I recall doing this for x86, which has this:
> > 
> > 	[arch/x86/lib/Makefile]
> > 	...
> > 
> > 	# KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
> > 	KCSAN_SANITIZE_delay.o := n
> > 
> > So let's do this for arm64, too. Sorry for the noise.
> 
> Thank you both!
> 
> I will revert my arm64-specific patch and apply this one.  Testing will
> take some time, and I will get you know how it goes.

Cheers, Paul.

I've queued it up in the arm64 tree, so please shout if you run into any
problems.

Will

