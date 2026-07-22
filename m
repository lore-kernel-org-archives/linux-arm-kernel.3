Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E13DC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xliZwr7Nt5m9JhwCnASn8zpGyMqBLZwbYn+eyRuRFg=; b=REpRYIrsEQcjCVKWnV+CkLkwnl
	VNWSnzO3L6ZlLC1qMZOsvraPQ3XHvClhsr/5q5AS3zjAAqEbZBwZR5kEGYKEps9PpU1+kezv7l/Sw
	ThIJ5iG1UHafirE8BPQiG4Oqfa/PsP+mCGyAeuqI498ENA+9iTs7uQO5Vqxq7qIRKaHDtJDHAeHj1
	e6soq0bK3dFQ1EhrPCKKfRmtkGr7CoXV9dwB1boZfJZ4Mqqxy99iGTqrt4U94JmxloL1iToRRnSyW
	9NV0CVe7xVD7PdOTga/y1PAhhyZ/FhTcPa9ocTNhHVeHq29rk5S1DICtsfVPu/XflR9og5AiucrSd
	tO6B0GWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeiY-0000000Cqes-2kI9;
	Wed, 22 Jul 2026 21:43:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeiR-0000000CqcG-1pXc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:42:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2CC3600AB;
	Wed, 22 Jul 2026 21:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E121F000E9;
	Wed, 22 Jul 2026 21:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756577;
	bh=7xliZwr7Nt5m9JhwCnASn8zpGyMqBLZwbYn+eyRuRFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QqPSRG0brVm9ChQ+aWVG+e4B2lOlLXk6vDLJCY1VBsOLE5vpZ6xinYJXT/FeYdFMe
	 QrdZBepRNDp3dYrNlnqr6YAVVDD7avwHfYlBNdNA+VqchdiPDIwqqYueeNFY9uMb0O
	 pXhxItlu8DNZkH8X043W4J0LYweUqNOdrzUVWg32xWrXWhqqUZ+dO+wnzC6bH14B2c
	 sxEuzN9ciybekEg7pjAjTjISKHuY0pgE86ymWWxYsvs3ITzbGBlhapS60+1RjYKQY1
	 oE1/FtM+6v2dd8FJ88Nh/qItwpilakPsgtMCJX29L1zNR4HJyKLzB1UKAnsyE3vRmc
	 pskJl7CXOFnZQ==
Date: Wed, 22 Jul 2026 22:42:53 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 0/2] arm64/debug: clean up some HW BP edge cases
Message-ID: <amE5XZIag1vh6GqE@willie-the-truck>
References: <20260527161553.97676-1-ada.coupriediaz@arm.com>
 <amCp2vHU0XKhC6xT@willie-the-truck>
 <amC-DMTrqvAFSpe5@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amC-DMTrqvAFSpe5@J2N7QTR9R3>
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 22, 2026 at 01:56:44PM +0100, Mark Rutland wrote:
> On Wed, Jul 22, 2026 at 12:30:34PM +0100, Will Deacon wrote:
> > On Wed, May 27, 2026 at 05:15:51PM +0100, Ada Couprie Diaz wrote:
> > > This is a small series focused on fixing some unsoundess and edge case
> > > related to hardware breakpoints and watchpoints.
> > > 
> > > It is motivated in part by the recent discussion on the
> > > FEAT_Debugv8p6 series[0][1] regarding unclear guarantees on interruptions.
> > > 
> > > It doesn't address the issue of instrumentation, as NO_KPROBE is not
> > > sufficient to prevent it (specifically ftrace) and would require a pass
> > > over the whole debug handling code.
> > > 
> > > The bugs themselves are very much of the self-inflicted
> > > "you should not be doing this" kind and not urgent, but it does solve
> > > some of the questions on the FEAT_Dbugv8p6 series.
> > > 
> > > Most of the raw additions are comments trying to give more context to
> > > understand `hw_breakpoint_thread_switch()`.
> > 
> > Hmm. From what I can tell, these patches are trying to handle various
> > cases where we take a debug exception while executing the hw_breakpoint
> > code itself. Even with these two fixes, is perf expecting to handle that
> > sort of thing? I think it would be a lot more robust if we just prevented
> > this from happening in the first place, similarly to the discussion from
> > the other day around kprobes [2].
> 
> Since [2] mentions noinstr, it's worth noting that noinstr alone isn't
> sufficient. Watchpoints also use this path, and we can't practically
> filter watchpoint addresses to avoid hitting a watchpoint here.
> 
> I assume you'd be happy with masking debug exceptions entirely?

Yes, I think that's the only option, really, and I think we might even
have done that at some point in the past. The problem, however, is if we
end up getting preempted in that state. We currently have preemption
disabled, but there's a thread trying to change that based on one of
Ada's tests (not blaming the test, it's pointing out a real issue here):

https://lore.kernel.org/r/20260519222524.886454-1-longman@redhat.com

Will

