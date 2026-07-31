Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ACBC55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:From:
	Date:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhfMd0xQKSaunZOLs9S9OqYp5MXykTMEGswqHz/JJOU=; b=0bG5oKHwSO2/5v98L6DAedqfu7
	JY4f6AFrLhoThF3f3KUyEdWtmTWoq2uLJH/vHEFQ2P/6rdfEyYH5oXyKqFrJfQyEM8wgXITcc1FkF
	SuXDj4zur45JT4i4WiHyHygbcf3KRLqDPe4EXlVlD+fNeUJZWrDdx8/HjCwoFpePEClzdgkslXnZS
	Cw1yvg71sn0RDWCFMIzaQ3hzxUpnjLcrml8LoW2f/sp0cF0b6rqdDCgeZNO2kNgK5MwXYls+OdfNK
	SjKuLPaAhyZw0i7nzjNHBPEhmdWBPzFfr5zvWMyhDe9+rcPQ3wW6peCebsVnuuxzO9iQAjXsXIcso
	u/DC820w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqLJ-0000000DAgH-2hKp;
	Fri, 31 Jul 2026 16:44:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqLJ-0000000DAg3-0ApB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:44:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79FE7435EA;
	Fri, 31 Jul 2026 16:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDFA1F00AC4;
	Fri, 31 Jul 2026 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785516256;
	bh=bhfMd0xQKSaunZOLs9S9OqYp5MXykTMEGswqHz/JJOU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=UYUKT6TyphrtSw7L+pRFB1Il1b/ED70WjDg83ObdFt2q8he5xjc6r4tzikDwit659
	 qAASPpK7GiXYqeKOLiuUGoZx/LqXAiARPh9XgjltIV/bei7by0yc2JMaFzX7At3o7p
	 enFn88RsriXV7AbMawpk0Oz0QEq4HX2kwVE1v+oavNiTqzxfJ1gxIn04VVJrvFLAc5
	 b4ZqUUVz+qAKm2lrdI200tQjMdKwQJOJF+CDgly55sFEduzvcFAbdgXLecBMXmn/Ut
	 EdY86OsjZd+z8Cfc9L+uulBiauSkwx27HNKKVtRoU9RXrPJ9q5Pf6HbtL0VjLpjV9V
	 7Ut+Q8Usbmyyg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1E849CE13C6; Fri, 31 Jul 2026 09:44:16 -0700 (PDT)
Date: Fri, 31 Jul 2026 09:44:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH RFC] arm64: Mark set_preempt_need_resched() access to
 .need_resched
Message-ID: <13df4ff4-8594-4c37-b25f-860248a222cf@paulmck-laptop>
References: <d345dc9f-c61e-4db5-a342-11b0ff3fb846@paulmck-laptop>
 <amyaRXx8zXxOMgTL@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amyaRXx8zXxOMgTL@J2N7QTR9R3>
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
Reply-To: paulmck@kernel.org
Cc: "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jul 31, 2026 at 01:51:26PM +0100, Mark Rutland wrote:
> Hi Paul,
> 
> On Thu, Jul 30, 2026 at 04:59:57PM -0700, Paul E. McKenney wrote:
> > The .need_resched field can be accessed from both task level and
> > from interrrupt handlers, so apply WRITE_ONCE() to the update in
> > set_preempt_need_resched().  This also brings arm64 in line with s390
> > (which uses atomic operations) and x86 (which uses inline assembly).
> > Other architectures avoid this issue via the empty definition in
> > include/asm-generic/preempt.h.
> > 
> > KCSAN located this issue.
> 
> Do you have the KCSAN splat to hand? Seeing the exact race (and the
> relevant reader(s)) would be handy.
> 
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > Cc: <linux-arm-kernel@lists.infradead.org>
> > 
> > ---
> >  preempt.h |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> > index 932ea4b6204289..610853da140a78 100644
> > --- a/arch/arm64/include/asm/preempt.h
> > +++ b/arch/arm64/include/asm/preempt.h
> > @@ -28,7 +28,7 @@ static inline void preempt_count_set(u64 pc)
> >  
> >  static inline void set_preempt_need_resched(void)
> >  {
> > -	current_thread_info()->preempt.need_resched = 0;
> > +	WRITE_ONCE(current_thread_info()->preempt.need_resched, 0);
> >  }
> 
> I was under the impression that we only used this in a context where we
> couldn't have a nested writer (e.g. within a scheduler IRQ hook, with
> IRQs disabled).
> 
> If we have concurrent writers, this is probably broken regardless of
> whether it is single-copy-atomic, and I worry WRITE_ONCE() will mask a
> bug.
> 
> If you can share the KCSAN splat, that'd really help.

Let me regenerate it...

> I think we need READ_ONCE() in test_preempt_need_resched(), but today
> that's only used by tracing to determine what to log.

I do have tracing enabled on some of my runs.

							Thanx, Paul

