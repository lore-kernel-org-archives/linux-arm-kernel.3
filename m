Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BC8C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 12:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBEmNxPxST1DSIxEtICulBlkCq62VxkP/gUcxEuCvFQ=; b=TIHfWTb/UBVAoNThcCbWgZtbUr
	bXo1S3sDn0tygqAtx26zQ7Fgp9Y7tl8vAO2sNBkC5cIuf7oLFj0g59dgvsJOOY1nHdbEx+4bEspo9
	2xUwcLXvuPXCHxU94VgJN8/M+rcprfEjnmm8Sn/4aHmECQi0z+90IYZs0sPbxuRppRRLOnuPLpXtW
	+YaMB4SCjn+H73nzgdrM1lI8OGd2GinnzQKXBAGhNhW7dQd9LR720L0m4hHNYuHjmF+wcwPaMa92l
	Q6wbtBlCaL7cQFG3sq19lO1DCGQmPuNfRQoTZik5qXgR55bix82VBzu7lmFyrNHyWM+/cxBqm2PRU
	qgp3AmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJaf-000000080eS-490i;
	Fri, 07 Aug 2026 12:22:22 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJae-000000080e7-0QLW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 12:22:21 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-664b05d408bso3206771d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 05:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786105338; cv=none;
        d=google.com; s=arc-20260327;
        b=BAtBsfEavR8KpWldaDfKBg4heUSX8N8SsOATyIEcvlFLMb7711ehwYJ60hbMt3l5Ef
         6hxvd7ce3uH2DUJF+Wn+e5a4KC6W4ih62N2PHqQ+MKX5uJWzy2opWtx4KgYRGETQCD29
         cTjWqu66WC72tHQdo2/qTcHZYSBeUe8WAj7RCevyV9tgqaDDqOKLLsXKZszHqB9c4Gpw
         LbMESmfnnozEES5y0/jnljYTvJU2X9DBusBfBVQuPJ1Ehuud3dtqXfnffpowkUHIvEOl
         gla1uDx4hFVcV1ZaDNk+RmgH5hzP0jwpIf71DNTt+2pTjB9KzkRFQeG/Y7KrJXYMdBpk
         XeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vBEmNxPxST1DSIxEtICulBlkCq62VxkP/gUcxEuCvFQ=;
        fh=mQ13U2GQiQ685BDqsQ7ml4e3/sug3J3XwHSnBqQEWag=;
        b=IJ6z25P2UapyX12pPm7gtZFrX78PoXeYHYojUyrKn+aJhRHcCc0QGqqXtOlq+UqueS
         iCG4jDtuq8pma0XPf/eElnOzgSGlDLhu+l2VBbtOIX/I1lgHGrjI7Qt0FYDEuCED/Ln2
         /dpkyxtNMECBQ7vuNvVIOmQlLad2Y3tIRxqdz9UpTVDHg7tNhVRCywD1Pr8gSERrugCZ
         KS51YEA3oRIKdqSNJUSFu7eAdbcXdnRGnyxD5oGNMZi3L97keWOooQ89yc5j7hMgmUUE
         jMN34d8k7r8sM0cEwXSxghGj6Bln5nhK5APigAeh8IsQR1rmUz+v5Z00O/jSGSkLv71s
         4oQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786105338; x=1786710138; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBEmNxPxST1DSIxEtICulBlkCq62VxkP/gUcxEuCvFQ=;
        b=VSWFk88CsQ6+3qektS2X6whRzpkX15uxClwek9LHOFR1AOt4KABEs+zYstfiPYrhtG
         y17EXqhnfB28vsvJiXpoCe9zEeicDjtKWZIASVYyE1hcad+UYTe/XxXLHJHR6hU7Jh6M
         jQxQq0rwDCPtOiFgMz3FLOcC7O+xeihmmrozjXT6h3m113Xp15aiD+irE94F+fkVEcX3
         qaDfz+nBlhl9a6tbFhlVU1sF8fBka+RW7HLC1OmWXKN4p1505XFVEW1vJXHqXj3GaUjh
         yoHVRwA7ICYtJx2dVGdHmaIbpmBh3TyI5GeslZH4I3ffYiFsJCFIAdNLIX8QDvlE6T3I
         jikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786105338; x=1786710138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vBEmNxPxST1DSIxEtICulBlkCq62VxkP/gUcxEuCvFQ=;
        b=hBRofHDuU83KiScCbtiz5v5UAFlZas3kSZhcdqEYAcgCzcKXn7gwwqfjqhVV8esKH3
         34c/MTYxf6nDmHN6kT3TGZOi6N4qKK1zO+6ycgph1vFMHuvv6zR18c9+Zny7xYsfgIKI
         njEizYP6dDqD7KOMTTyrTZGWpFx1OkVMt0ABvFWmVI8uq6iJ8KiTpR3o/OZGttVm+Uis
         PUBBmIRjnoWlarrKzY6CZFEyvCi9O+ZiaVfkyJU/BQUQhKFtyA/Vif4FD9EuJCC76hVA
         aZUSP/Fg7AaAE2e0/FboSmvSXc9uN7uzvsrvW6HZ108i9FMpfEKk6AH/hDoAT9zt3kK7
         Wrqg==
X-Forwarded-Encrypted: i=1; AHgh+RpAz/mHjDD9Ye3Ly6H/+GFVkH3OrcToz+j+2BN36Dm1Zjxg7IEA+/Sa6CWAAGdV6Zw5uGLWi+MMGT2yiBd1Qm0E@lists.infradead.org
X-Gm-Message-State: AOJu0YzyyNUHtYB222Gb8d9AtCQKjMmT4S8HmQ2AZLPGGpcSyFzfbZMO
	lmPa0hQ0S644PIprq2ZsOPD+Tsnu9eHPMpPwVrUeAWmPtmlFXVq76YIG8JcgYrdY9pMxnYZe0AR
	+8sgcZ3BwBAMHDH/gfCq332l8hgy1cEQMPkttOIBC
X-Gm-Gg: AR+sD11m5fSXWBONUabBhel6SX4H1W5guRbyjX+C0qCZssY/rO7mWglbcTLXs79YH+e
	+ReeifV6N7RV5CwvmoQ2XmsIa8t/lQK/wbp13eRSamfQWk0sbXCNJMQ1ekRujDeadH+TBjLcM8j
	vGPOxH8UEk7g/pF8BmdyYSGEvWEMusL6leFotatRBZ/AbS4nDU9Sv99SWlacx2/6jJgHdLddLVB
	w21Vkcg8YNR5oASNVK8+L2lCnSui5H6ipZ4PWlNsnllq3ucER+NkWzYPvF20zrhbsDOhjfL3WNu
	OPzVjbZ1b96iQW2nxs6PZe7jTN1oeqgvdGJRSm1yDjb7wZLQA2HdGKTZtZSOu25yH9qSBNPZ/T8
	2
X-Received: by 2002:a05:690e:b8a:b0:668:8e5c:ff98 with SMTP id
 956f58d0204a3-66acd251788mr1707676d50.23.1786105337124; Fri, 07 Aug 2026
 05:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <d345dc9f-c61e-4db5-a342-11b0ff3fb846@paulmck-laptop>
 <amyaRXx8zXxOMgTL@J2N7QTR9R3> <13df4ff4-8594-4c37-b25f-860248a222cf@paulmck-laptop>
 <4fa802e7-6cfc-4cce-afee-c29b28171ad3@paulmck-laptop> <anR28GyRtCpApQYX@willie-the-truck>
 <ca54b283-3349-43d4-9460-32b084709d67@paulmck-laptop> <anXKRdA9sUziFda5@willie-the-truck>
In-Reply-To: <anXKRdA9sUziFda5@willie-the-truck>
From: Marco Elver <elver@google.com>
Date: Fri, 7 Aug 2026 14:21:39 +0200
X-Gm-Features: AUfX_myWTKXYMa1QzoukUYWwhNW68qSa5mvVij_oxwt3OhRpXbJ3AQAliP3Bsxo
Message-ID: <CANpmjNPCM0NV1EN2pNBf3EBBk8eLjbGGAiZ_+rJkoROJtG3jFQ@mail.gmail.com>
Subject: Re: [PATCH RFC] arm64: Mark set_preempt_need_resched() access to .need_resched
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_052220_187717_C9C9CB6E 
X-CRM114-Status: GOOD (  45.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, dvyukov@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 7 Aug 2026 at 14:06, Will Deacon <will@kernel.org> wrote:
>
> [+KCSAN maintainers]
>
> On Thu, Aug 06, 2026 at 10:25:37AM -0700, Paul E. McKenney wrote:
> > On Thu, Aug 06, 2026 at 12:58:40PM +0100, Will Deacon wrote:
> > > On Fri, Jul 31, 2026 at 11:39:14AM -0700, Paul E. McKenney wrote:
> > > > On Fri, Jul 31, 2026 at 09:44:16AM -0700, Paul E. McKenney wrote:
> > > > > On Fri, Jul 31, 2026 at 01:51:26PM +0100, Mark Rutland wrote:
> > > > > > On Thu, Jul 30, 2026 at 04:59:57PM -0700, Paul E. McKenney wrote:
> > > > > > > The .need_resched field can be accessed from both task level and
> > > > > > > from interrrupt handlers, so apply WRITE_ONCE() to the update in
> > > > > > > set_preempt_need_resched().  This also brings arm64 in line with s390
> > > > > > > (which uses atomic operations) and x86 (which uses inline assembly).
> > > > > > > Other architectures avoid this issue via the empty definition in
> > > > > > > include/asm-generic/preempt.h.
> > > > > > >
> > > > > > > KCSAN located this issue.
> > > > > >
> > > > > > Do you have the KCSAN splat to hand? Seeing the exact race (and the
> > > > > > relevant reader(s)) would be handy.
> > > > > >
> > > > > > > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > > > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > > > > Cc: Will Deacon <will@kernel.org>
> > > > > > > Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> > > > > > > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > > > > > Cc: <linux-arm-kernel@lists.infradead.org>
> > > > > > >
> > > > > > > ---
> > > > > > >  preempt.h |    2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> > > > > > > index 932ea4b6204289..610853da140a78 100644
> > > > > > > --- a/arch/arm64/include/asm/preempt.h
> > > > > > > +++ b/arch/arm64/include/asm/preempt.h
> > > > > > > @@ -28,7 +28,7 @@ static inline void preempt_count_set(u64 pc)
> > > > > > >
> > > > > > >  static inline void set_preempt_need_resched(void)
> > > > > > >  {
> > > > > > > -   current_thread_info()->preempt.need_resched = 0;
> > > > > > > +   WRITE_ONCE(current_thread_info()->preempt.need_resched, 0);
> > > > > > >  }
> > > > > >
> > > > > > I was under the impression that we only used this in a context where we
> > > > > > couldn't have a nested writer (e.g. within a scheduler IRQ hook, with
> > > > > > IRQs disabled).
> > > > > >
> > > > > > If we have concurrent writers, this is probably broken regardless of
> > > > > > whether it is single-copy-atomic, and I worry WRITE_ONCE() will mask a
> > > > > > bug.
> > > > > >
> > > > > > If you can share the KCSAN splat, that'd really help.
> > > > >
> > > > > Let me regenerate it...
> > > >
> > > > And please see below.
> > > >
> > > > > > I think we need READ_ONCE() in test_preempt_need_resched(), but today
> > > > > > that's only used by tracing to determine what to log.
> > > > >
> > > > > I do have tracing enabled on some of my runs.
> > > >
> > > > I did build with CONFIG_TRACEPOINTS=y.  Or let me know what sort of tracing
> > > > you are interested in.  Or I can send you this guy from my ARM test system:
> > > >
> > > > tools/testing/selftests/rcutorture/res/2026.07.31-10.25.08-torture/results-rcutorture-kcsan/TREE01/.config
> > > >
> > > >                                                   Thanx, Paul
> > > >
> > > > ------------------------------------------------------------------------
> > > >
> > > > [  738.696166] BUG: KCSAN: data-race in __delay / set_need_resched_current
> > > > [  738.696184]
> > > > [  738.696188] read (marked) to 0xffff000005899b48 of 8 bytes by interrupt on cpu 8:
> > > > [  738.696198]  __delay+0xb0/0x378
> > > > [  738.696212]  __udelay+0x4c/0x60
> > > > [  738.696225]  kcsan_setup_watchpoint+0x3b4/0x820
> > > > [  738.696238]  __tsan_unaligned_write4+0x228/0x26c
> > > > [  738.696249]  set_need_resched_current+0x138/0x1a8
> > > > [  738.696260]  rcu_exp_handler+0x418/0x4a0
> > > > [  738.696273]  __flush_smp_call_function_queue+0x36c/0x4a0
> > > > [  738.696288]  generic_smp_call_function_single_interrupt+0x20/0x30
> > >
> > > This is a bit weird -- it looks like the read is occuring from within
> > > kcsan itself?
> >
> > Ah, you are right, as part of KCSAN's software watchpoints.
> >
> > What do you suggest?
>
> I suppose we could add some __no_kcsan annotations to everything that is
> called from the KCSAN implementation but it feels error-prone and could
> hide races exposed by other callers.
>
> I've added the KCSAN folks to see if they have any other ideas; it looks
> like the sort of thing you'd expect them to have encountered already.

Most of KCSAN's internals are not instrumented, but do call out to
some instrumented bits where that's safe. In this case, it looks like
a real data race, even though the access comes from __delay that was
called by KCSAN, I don't think it's any less valid.

I have a fix pending [1] (queued for next merge window), however,
which would have suppressed this one.

[1] https://lore.kernel.org/all/20260722212700.828037-1-elver@google.com/

