Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86C5CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 18:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=8jsa4GH6jid+z0OK5UwK7GrnRnFIaKA4Ymu/FfUspgA=; b=t0IWM880W98QHIdmkXOdg0Z69X
	0jJD00mmvl+u661OB03gh906SkL1Vg+jLG1SPTjylbhsPpqmcHV26mTuunSGRtYlfXDwTnApB8H+3
	Tv43Don/xFu96z8Y97Ew1KGupDDJSOnCNEYZirHTR6UU7AiiLgAj0NTcGXwpWy66WbvL2+EG+Bsof
	gzpOCtI+g8oCjQIqsLMIv76TqMUK+qGabK6z5axvJYg16rQkZzbpb6K3NXG+zYsXIb44gYUZm5CSX
	Ma1Y6ZFw8BBgrTZ5Ojpsju8Fvk+iIdDzTy4HF5D+Sxk9/p+uWijJphzGr73K+muyejTpA9cr+2Y1A
	f33rYgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH4df-0000000G5i3-27tw;
	Thu, 06 Nov 2025 18:23:15 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH4dc-0000000G5hf-13Uo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 18:23:13 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so1570381a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 10:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1762453391; x=1763058191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jsa4GH6jid+z0OK5UwK7GrnRnFIaKA4Ymu/FfUspgA=;
        b=dQ8yd3j853p+Rur0ZuCCaTfJguLVLM+WC5OpypOfl8l3mB03e5AYYWdm6n1V4ycCuj
         w0p4xRIxQZxvPSmde9mr4QASZWe9CzYVrHn2Fb2ocBzfyIz34UCLwobbzdbPIkumYral
         YjPRjQk/IBRdNa4LPDycgHEkVN1yIFe55pJz8H60ADQVQiIwWWzHdjpGDywWcjiS9CH2
         r/1dc1llduwajne1aMAMCE2Wv+PodQT/76H+DKKOyfce+TUKIrXkTtum9y/IPWsMU7sw
         KAEqtgQyIuvBO5ngJm6a/tzoxBmZ7/8aQTIv+YGeFi0Ttu89yt53QDLwBcWe0+0/fLiv
         JFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762453391; x=1763058191;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jsa4GH6jid+z0OK5UwK7GrnRnFIaKA4Ymu/FfUspgA=;
        b=Ap7c22ZNFdX7d0l95Ek87oDHC/tTESU//UBn5PyUkBTLF+Uwpf0ZMA4pXvC58d5jBh
         1r7260tvA6yRDnD98BKb02TLFgFAk2N/WXNEd9iS8Z2u69dD4M0yVBA2/LYUPgdVXTiD
         7tXsV15A0ayCe3CWvy4hWjuI0cM+GKlnlxprtswVSnylHwcM621P7guQjrVyHOMWwOgR
         a7psByQVSLVZjRiX4f+A06mfmNu2j+Ehq5foWZZmh2iIXJnf30hNbr+b81Rwmg+9WHZy
         +nazfFgPKUEobsqNrrbRwaWoOcI72+Hfku07JBwuUKWsAcTsqHn7hO/kw/DNRtWmRnZO
         RJxw==
X-Forwarded-Encrypted: i=1; AJvYcCXkCCHO1sGfuao/6cfNWWimY10K2HcXZ3ibhKsySGoorI+6kdHpjRJJ+uHZqKgSCPl7Uqlry4jydPvA3LBmpvPe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+/MQf/6kggUNO91uTILT4qoJsh9p3pox2CmBIS6e3jIbLNOfG
	9Q4R+ljKXXW+NH+Riex5aMI6LIzqYERRokH62YlixH7gOqURXQsxKkmSrr3oeWIOT2M=
X-Gm-Gg: ASbGncvPErNYI/fTfyCyxbfDZ0lKeKmju7Wcg+5jduUqOnl7fh7hvE+l8KzACGgkVK6
	clEW4Wf+A8EVbiqyxd8GRglYfqxU9vMQBM324rJsY9yu0RowIkBjO1pTFwLm3ekj5db73EApV5M
	T6xUDuft9vO8QcjqvfwFpKdWoFRu7X7NL6KfXYOveFyT6AQHNSfi3BFt7HUjrjXeSjm2qC4vM4g
	7JRPl/AtNby/ql/eTi+5UPxkVKJXNLU7Z3M8HLyQEGVHXUIfbMobLNPdIEPvL0cGnn5iF54/qeV
	02BK5CCZoTs/gBF9SiMeHEsqq4XK6GUlgR4aG46mj26twMCo0qpwAIkKmJUwLnKFt8EMG6enwg+
	yMlymRlSYZ0J11y+ibXueI0Vj3GJneZlDdH5GanwkQxARr1JE14GnMcR5IZqVay0RSDK8n0ghUX
	pySQY2eod4CGK/lsXK/XTT9p3HlV0UMQ==
X-Google-Smtp-Source: AGHT+IEEGcsUAqSteLtcCoeQH0GJDBL/IN8YR6Z7CWsilcSQlH5VE4rEl/rQpr46p/vIbgfvJooXWA==
X-Received: by 2002:a17:902:d548:b0:295:5da6:5ff7 with SMTP id d9443c01a7336-297c00b92e8mr7706755ad.15.1762453391104;
        Thu, 06 Nov 2025 10:23:11 -0800 (PST)
Received: from localhost ([2620:10d:c090:500::7:613d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509683easm35103875ad.15.2025.11.06.10.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 10:23:10 -0800 (PST)
Date: Thu, 06 Nov 2025 10:23:10 -0800 (PST)
X-Google-Original-Date: Thu, 06 Nov 2025 10:23:07 PST (-0800)
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
In-Reply-To: <aQzg1_uxNfCK8_V_@arm.com>
CC: paulmck@kernel.org, Will Deacon <will@kernel.org>,
  Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <mhng-EC4FBDA6-162D-43D9-BFB7-B2B009D21075@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_102312_532760_957F1ECF 
X-CRM114-Status: GOOD (  40.40  )
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

On Thu, 06 Nov 2025 09:54:31 PST (-0800), Catalin Marinas wrote:
> On Thu, Nov 06, 2025 at 08:30:05AM -0800, Palmer Dabbelt wrote:
>> On Thu, 06 Nov 2025 06:00:59 PST (-0800), Catalin Marinas wrote:
>> > On Wed, Nov 05, 2025 at 01:13:10PM -0800, Palmer Dabbelt wrote:
>> > > I ran a bunch of cases with those:
>> > [...]
>> > > Which I'm interpreting to say the following:
>> > >
>> > > * LL/SC is pretty good for the common cases, but gets really bad under  the
>> > > pathological cases.  It still seems always slower that LDADD.
>> > > * STADD has latency that blocks other STADDs, but not other CPU-local  work.
>> > > I'd bet there's a bunch of interactions with caches and memory  ordering
>> > > here, but those would all juts make STADD look worse so I'm  just ignoring
>> > > them.
>> > > * LDADD is better than STADD even under pathologically highly contended
>> > > cases.  I was actually kind of surprised about this one, I thought the  far
>> > > atomics would be better there.
>> > > * The prefetches help STADD, but they don't seem to make it better that
>> > > LDADD in any case.
>> > > * The LDADD latency also happens concurrently with other CPU operations
>> > > like the STADD latency does.  It has less latency to hide, so the  latency
>> > > starts to go up with less extra work, but it's never worse  that STADD.
>> > >
>> > > So I think at least on this system, LDADD is just always better.
>> >
>> > Thanks for this, very useful. I guess that's expected in the light of I
>> > learnt from the other Arm engineers in the past couple of days.
>>
>> OK, sorry if I misunderstood you earlier.  From reading your posts I thought
>> there would be some mode in which STADD was better -- probably high
>> contention and enough extra work to hide the latency.  So I was kind of
>> surprised to find these results.
>
> I think STADD is better for cases where you update some stat counters
> but you do a lot of work in between. In your microbenchmark, just lots
> of STADDs back to back with NOPs in between (rather than lots of other
> memory transactions) are likely to be slower. If these are real
> use-cases, at some point the hardware may evolve to behave differently
> (or more dynamically).

OK, that's kind of what I was trying to demonstrate when putting 
together those new microbenchmark parameters.  So I think at least I 
understood what you were saying, now I just need to figure out what's 
up...

FWIW: there's actually a bunch of memory traffic, the compiler is doing 
something weird with that NOP loop and generating a bunch of 
load/stores/branches.  I was kind of surprised, but I figured it's 
actually better that way.

Also, I found there's a bug in the microbenchmarks: "tmp" is a global, 
so the LDADD code generates

    00000000004102b0 <__percpu_add_case_64_ldadd>:
      4102b0:       90000189        adrp    x9, 440000 <memcpy@GLIBC_2.17>
      4102b4:       f8210008        ldadd   x1, x8, [x0]
      4102b8:       f9005528        str     x8, [x9, #168]
      4102bc:       d65f03c0        ret

as opposed to the STADD code, which generates

    00000000004102a8 <__percpu_add_case_64_lse>:
      4102a8:       f821001f        stadd   x1, [x0]
      4102ac:       d65f03c0        ret

It doesn't seem to change my results any, but figured I'd say something 
in case anyone else tries to run this stuff (there's a fix up, too).

> BTW, I've been pointed by Ola Liljedahl @ Arm at this collection of
> routines: https://github.com/ARM-software/progress64/tree/master.
> Building it with ATOMICS=yes makes the compiler generate LSE atomics for
> intrinsics like __atomic_fetch_add(). It won't generate STADD because of
> some aspects of the C consistency models (DMB LD wouldn't guarantee
> ordering with a prior STADD).

Awesome, thanks.  I'll go take a look -- I'm trying to figure out enough 
of what's going on to figure out what we should do here, but that's 
mostly outside of kernel space now so I think it's just going to be a 
discussion for somewhere else...

