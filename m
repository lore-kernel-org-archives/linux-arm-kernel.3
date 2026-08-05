Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34354C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEPOJPfCzbYAu6P+uFPjLGlw/pbOQO2EYuGFNA/Zhyo=; b=CeXcEZu+eC6UMX
	ixGtYvTCep04RCI0ebaDskLTHYyLDY2F5xB1ljmEus+ssmfrYXj+NWYybrJQHsBMF71Xby2oNhbWP
	FSnixvcyOuspHpGDpW7nkRB6twhPkPlG7nJNaT/expV00IHQbio0lz2k3fYnRCo1odLWUGJ9FXrsH
	KRan5ZOMjdr8Wv638NcCTZ/u/pxJRE7DbHfjTvhYumcPz+8/rY9PDQ/Gg4K+lJolKONRLvvdDLqht
	9JAnsUbEUZEh7aoLh77wRcwjtO1/MDxKNl5BNuON/IPwIhPrjcRMJ7wYGkzJ67fVsv7aJX8gdklLI
	WUdXZe0ehYPJSYllgELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYqB-00000003js4-3f3w;
	Wed, 05 Aug 2026 10:27:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYq9-00000003jrN-2VWO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 10:27:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4980dc26022so7384165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785925632; x=1786530432; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eEPOJPfCzbYAu6P+uFPjLGlw/pbOQO2EYuGFNA/Zhyo=;
        b=lDypcGL6J8Gv5Mj32L9YcO89h0imfpsNIV0hsnefox+iasR3dQz8JZmXmMLUDLZxA3
         +r5M+iZADZgLa3OKs2id9wEjqJXzQDY8V47VGTMiEJSvbo/5HxWBMIww6sEHGD1hKJaM
         D+1YOkkxObJ+oF2h5/ueE1sqI+w6JuFHI8SNKWutR6CxR0zM2USkXEDXwWxGEQD+P6vA
         ot79dAA+dgxfsTHRFrAAfF6pa95F87BWfrqujM+clc9wygVKtNxCUJSz6tlGYZo2OXOx
         7Xr1TBsrZ/M9Le4KUlJ3Fwzw3/agJytNIKTTPVxkgb1foNSlYEZLD9qZte0+n/nC8p6I
         8cYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785925632; x=1786530432;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEPOJPfCzbYAu6P+uFPjLGlw/pbOQO2EYuGFNA/Zhyo=;
        b=OKmW4CvkEr2rXv7PwOuqjbybjVyHfbz2OohO5EuZWbiCdaNbk1D2k+FF5gGqXa0hGN
         WNfJt/c3H8iXKCU5eBWdaTDg9wVLd61VL6v0GnxeAqAnlZXlbB76KDPKMxk4cfqJC2iq
         ILGeacuGpUFml0prcz+xyrFZX9eYQV1RNxfd+X1RC5bZI0fC0T1Mdb98Hj55seRjdD6t
         d5SOP1QMI9L4aagEPcgL7XO3MCFuxCHTPoZFjhvG8MI8fSABy1Qtg3zmoWSjpsLLLrDN
         DBXqZicT2zvIzldqDSFa4JQAMu+rWFs+vD66DTRBcWRf79gUnp5bwyvAzsnmrEqFcSI9
         ZBJw==
X-Forwarded-Encrypted: i=1; AHgh+RoC6ENdpoAx/Ww9keUSq/k806/j8+UsoiC+X0nqexAYnWb8ZOUrjnmo9gxFi82IP/9u8o+vjHHzwdQz1o+cYvz4@lists.infradead.org
X-Gm-Message-State: AOJu0YzKFOwYK8Ce0Og2oCS643hicfDol78fR7JAoB0JZcjgTyXwpGj6
	RTyU1z58Wv8RkaLKjdtYX8+K+Dv+nNu4/+sSejqR5JKJJ2RrFQcNIAjP
X-Gm-Gg: AR+sD127dMyuZy4527Dk8Zu9V1ii/33bRUiPGjYrBwkxNLk3+1/Xo6xaVZ0ROEGchdO
	jU3jYSxoMa3mqo0ggWMcoGTpJH3eHvZQMvEzEA2myQWrmNMVgbBs5uOYWxc5SMOS8LWOTeYOZ6e
	R7awbEpDw+6ueS9GMyEmz0gC3YtxCwjjSybMVOuenmsPqVwBf/kX6Mhz2ag/UgZLQbVRYuyuvEe
	t63Z+MOfMwGTFUbErXGWjZHHaQ3rhcEbI5AZO0L2igy3FaQqOd0QwDbJeW2o3yYaxNwiYCwAt67
	t0Ff1D/X8IyDhirbznDBehdYFGYHO5ADECrRJALszVPSKkQTjvD2N4sdccXWhXIawz/DvCInCKC
	QHkjqaESSBbYmOHVG2wWN8Avzs4zZK5RmfwAM6HdSOhjJQLojheT+onC84Ffv5L9JT2Hm8MYYSc
	qYh2Ob9XmwdX97nuBiA1mZUPtIDuEMq0f+vmVVwcJnFGQWk8ndQUl5mrOcG7DJG4dJU48QblpW7
	JOB3p3uL0ulOUsAJVssfDgozQ==
X-Received: by 2002:a7b:cd19:0:b0:495:4bf3:2150 with SMTP id 5b1f17b1804b1-4994e7af664mr51746725e9.8.1785925631522;
        Wed, 05 Aug 2026 03:27:11 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e04db3asm91782465e9.15.2026.08.05.03.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:27:11 -0700 (PDT)
Date: Wed, 5 Aug 2026 11:27:07 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v2 13/20] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <20260805112707.0204f00e@pumpkin>
In-Reply-To: <anJm-EDndC8H6xMi@pedro-suse.lan>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
	<20260804170503.3513916-14-mark.rutland@arm.com>
	<anJm-EDndC8H6xMi@pedro-suse.lan>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_032713_669481_C08D98A6 
X-CRM114-Status: GOOD (  39.01  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 4 Aug 2026 23:45:56 +0100
Pedro Falcato <pfalcato@suse.de> wrote:

> On Tue, Aug 04, 2026 at 06:04:56PM +0100, Mark Rutland wrote:
> > Currently arm64's this_cpu_*() ops transiently disable preemption in
> > order to guarantee that the address generation and memory access(es)
> > occur on the same CPU.
> > 
> > Transiently disabling preemption can be  expensive. When re-enabling
> > preemption it is necessary to make a conditional function call to
> > preempt_schedule[_notrace]() in order to handle the rare case that the
> > task needs to be rescheduled. The potential function call has a number
> > of negative effects on code generation (e.g. due to the need to create a
> > stack frame and spill registers), and the conditionality can result in
> > poor code generation and/or poor branch prediction.
> > 
> > This patch adds infrastructure for a scheme where this_cpu_*() ops do
> > not need to transiently disable preemption, avoiding the negative
> > impacts described above. Individual operations will be converted in
> > subsequent patches.
> > 
> > Each operation registers a critical section during which the exception
> > return code will adjust the offset and addresses if preemption occurs
> > mid-sequence. The critical section is registered/unregistered with a
> > small prologue and epilogue which encodes three distinct GPRRs (<pcp>,
> > <off>, <addr>) into a new thread_info::pcp_gprs field:
> > 
> >          // Prologue. Enable fixups for <off> and <addr>.
> >          mrs	<tsk>, sp_el0
> >          mov	<tmp>, #__VAL_PCPU_GPRS(<pcp>, <off>, <addr>)
> >          strh	<tmp>, [<tsk>, #TSK_TI_PCPU_GPRS]
> > 
> >          // Generate cpu-specific address
> >          mrs	<off>, TPIDR_ELx
> >          add	<addr>, <pcp>, <off>
> > 
> >          // Perform access sequence
> >          ldr	<val>, [<addr>]
> > 
> >          // Epilogue. Disable fixups
> >          strh	wzr, [<tsk>, #TSK_TI_PCPU_GPRS]
> > 
> > If an exception is taken from within the critical section, the exception
> > return code will adjust <off> to be the current CPU's offset, and will
> > adjust <addr> to be (<pcp> + <off>). Distinct registers are used for
> > <pcp>, <off>, and <addr>, so that the fixup can be applied safely at any
> > point during the critical section.
> > 
> > To ensure that this_cpu_*() operations within exception handlers work
> > correctly and do not corrupt state, thread_info::pcpu_gprs is saved
> > into a new pt_regs::pcpu_gprs field upon exception entry, and restored
> > upon exception return.
> > 
> > Looking at a simple this_cpu_operation:
> > 
> > | void outline_this_cpu_add_u64(u64 __percpu *p, u64 v)
> > | {
> > | 	this_cpu_add(*p, v);
> > | }
...
> I think I had an Interesting Idea(tm) while reading the per-cpu discussion
> in linux-mm. In case the 3 instruction preamble is too expensive:
> 
> 1) Pass -ffixed-x18 (this natively conflicts with SHADOW_CALL_STACK.
> SHADOW_CALL_STACK is already not-optimal codegen wise, so maybe not a big deal).
> 2) arm64 kernel bits will use x18 as a cheap task flags register
> 3) #define TASK_KRSEQ     (1 << 0)
> 4) Switching into the krseq mode is just a matter of toggling the bit in x18, so
> 	orr x18, x18, #TASK_KRSEQ
> a single instruction.
> 5) Switching off is just a matter of clearing the bit in x18, so:
> 	and x18, x18, #~TASK_KRSEQ
> 6) On the preempt side we keep the krseq tables in memory, and do a sort of lookup
> (binary search sounds easiest?) on them. But _only_ if x18 TASK_KRSEQ is set.
> This penalises unlucky preempts but keeps fast paths maximally fast.
> 7) entry points of course get to clear it after saving it
> 
> The end result would look something like:
> | <outline_this_cpu_add_u64>:
> |	 orr x18, x18, #TASK_KRSEQ
> |        mrs     x4, tpidr_el1
> |        add     x3, x0, x4
> | 1:     ldxr    x6, [x3]
> |        add     x6, x6, x1
> |        stxr    w5, x6, [x3]
> |        cbnz    w5, 1b
> | 2:
> |	 and x18, x18, #~TASK_KRSEQ
> |        ret
> | .pushsection .data.krseq
> | .word 1b
> | .word 2b
> | .word whateverelse
> | .popsection
> 
> This of course precludes the use of x18 for the compiler, so it would
> require careful benchmarking in case it negatively affects codegen too much.
> But it avoids any sort of extraneous stores in the fast path.

The extra stores are independent of the main instruction flow.
On a multi-issue (and especially out-of-order) cpu they are pretty much
likely to be noise.
The biggest cost is likely to be in the I-cache and instruction decoders.
Put a memory read in the 'main' path and the few clocks needed for the
D-cache read are likely to dominate - so the writes to the pcp_gprs
are actually likely to be free.

OTOH stealing a gpr for some flags will cost everwhere.

	David
 
> 
> Other architectures could do similar as long as they have interesting ways of
> signaling this using solely the register set.
> 
> Anyway, just throwing it out there in case this can actually make a
> difference & rings some bells on people smarter than me :)
> 


