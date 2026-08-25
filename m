Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166A6C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=866M+uGl4sUN1tKbGJJM/JL/XnsHJG6qiemRBVf+N78=; b=eGsvCbxnd4WaMFjIhd+96V3Gw4
	jOkbh3fB1WFl+gZFNnTWgqIj2ivc3ZU3OoCv92FWU5QKwKkHgAcm94majccq+QAGpaI4bBLhaxlGV
	F6VLaPUkjC8HhxX2PFmPShScgBHsqPnx3cF6IeiyrLPwW/j6mKBTEH81PZB6dCcRSSu2kHQNq/EKO
	Vk2FM80jKRmyxIlyjmRs2dGp7qaTmEegIwRG3I9CT/HZbLxcPT03Funw9wYFec5lgAvKBcobKwaAm
	XKq1rJYZZ3CuPA2SsppmvErF2DQEPcG7rZsXf4lOQV4kJmpCBjeVZtr88bgveHjZ2gAiN2oCFhl2S
	fw0YMObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys2l-00000000xGB-18ly;
	Tue, 25 Aug 2026 14:22:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys2k-00000000xG0-1dnI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 14:22:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D26096011F;
	Tue, 25 Aug 2026 14:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411BB1F000E9;
	Tue, 25 Aug 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787667745;
	bh=866M+uGl4sUN1tKbGJJM/JL/XnsHJG6qiemRBVf+N78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i+MZNbauJHsSUNA/1IcG5ZS/I5HSOXhdzb/eQ5mYprHFWJWgAs8zJWhI1TsQPtxmp
	 Yq2h1pzgLzK7KnmcrMq6ka5t/OGg/40L3HoCdpsCB1vxOmrXMVnXPog0LSL5eCvAFf
	 bZuinsTPL+XBMMLAu7G52Hs7Vzbv+ouKlKC4ZrA9K2y8KDSrxZR06YRxVV4S3ZlT7P
	 LbyGvzDnF+XnTjRUjzeTlcBGFDDPN3Li4EJSzrTxYI7Q+EO7MaGCHHjLK/rw7KFX8t
	 RLvVXNyaO9BBJNPvpr8VcEkVI3uf0iSAwNxW+faAnJ16+aN/XDeXY6fP0gVXWG1/gB
	 TMph9iEaBN4pg==
Date: Tue, 25 Aug 2026 15:22:20 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 0/2] arm64/debug: clean up some HW BP edge cases
Message-ID: <ao2lHE5Gagfj9NEK@willie-the-truck>
References: <20260527161553.97676-1-ada.coupriediaz@arm.com>
 <amCp2vHU0XKhC6xT@willie-the-truck>
 <amC-DMTrqvAFSpe5@J2N7QTR9R3>
 <amE5XZIag1vh6GqE@willie-the-truck>
 <b7e811a1-3d34-48d7-99a6-ad035aad0814@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7e811a1-3d34-48d7-99a6-ad035aad0814@arm.com>
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

On Mon, Aug 24, 2026 at 05:57:48PM +0100, Ada Couprie Diaz wrote:
> Sorry for the delay, I did not manage to respond before going on leave
> as I got lost in the weeds of understanding what ptrace is doing when
> using hardware debug registers.

No worries, and welcome back!

> On 22/07/2026 22:42, Will Deacon wrote:
> > On Wed, Jul 22, 2026 at 01:56:44PM +0100, Mark Rutland wrote:
> > > On Wed, Jul 22, 2026 at 12:30:34PM +0100, Will Deacon wrote:
> > > > On Wed, May 27, 2026 at 05:15:51PM +0100, Ada Couprie Diaz wrote:
> > > > > This is a small series focused on fixing some unsoundess and edge case
> > > > > related to hardware breakpoints and watchpoints.
> > > > > 
> > > > > It is motivated in part by the recent discussion on the
> > > > > FEAT_Debugv8p6 series[0][1] regarding unclear guarantees on interruptions.
> > > > > 
> > > > > It doesn't address the issue of instrumentation, as NO_KPROBE is not
> > > > > sufficient to prevent it (specifically ftrace) and would require a pass
> > > > > over the whole debug handling code.
> > > > > 
> > > > > The bugs themselves are very much of the self-inflicted
> > > > > "you should not be doing this" kind and not urgent, but it does solve
> > > > > some of the questions on the FEAT_Dbugv8p6 series.
> > > > > 
> > > > > Most of the raw additions are comments trying to give more context to
> > > > > understand `hw_breakpoint_thread_switch()`.
> > > > Hmm. From what I can tell, these patches are trying to handle various
> > > > cases where we take a debug exception while executing the hw_breakpoint
> > > > code itself. Even with these two fixes, is perf expecting to handle that
> > > > sort of thing? I think it would be a lot more robust if we just prevented
> > > > this from happening in the first place, similarly to the discussion from
> > > > the other day around kprobes [2].
> I am indeed handling weird edge-cases !
> As Perf only uses local_irq masks, it is not sufficient to prevent us from
> taking
> debug exceptions while it manipulates the debug registers, so even if all
> the
> debug exceptions themselves are safe, perf/ptrace callbacks and syscalls are
> not.

Sorry, I was specifically thinking about the perf hw_breakpoint code invoked
off the back of the debug exception.

> > > Since [2] mentions noinstr, it's worth noting that noinstr alone isn't
> > > sufficient. Watchpoints also use this path, and we can't practically
> > > filter watchpoint addresses to avoid hitting a watchpoint here.
> > > 
> > > I assume you'd be happy with masking debug exceptions entirely?
> > Yes, I think that's the only option, really, and I think we might even
> > have done that at some point in the past. [...]
> > 
> If you both think that makes sense to save/restore DAIF here, I am
> happy to send a patch doing so. That would indeed make sure we
> don't hit this kind of issues !

I think that makes sense.

> Making the debug code safe from instrumentation is a different story...

Yeah, same with a bunch of the entry code tbh...

> > [...] The problem, however, is if we
> > end up getting preempted in that state. We currently have preemption
> > disabled, but there's a thread trying to change that based on one of
> > Ada's tests (not blaming the test, it's pointing out a real issue here):
> > 
> > https://lore.kernel.org/r/20260519222524.886454-1-longman@redhat.com
> I did not have the time to take a proper look, but it seems that Sebastian
> has sent another patch for this issue which keeps premption disabled :
> 
> https://lore.kernel.org/r/20260814085118.OPEA_Ssn@linutronix.de
> 
> So I think we should be OK masking DAIF here then.

Oh, great!

Will

