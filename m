Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32195D277C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32edYZCX+nxG87B8UKMbk1Tq/DYM0xHuea3J9HZlJwM=; b=uNPePSD23apC96aTWCmK98Y0+K
	ajtm5LWoIWss71TVoiJITLPxzzTQDAHrCUA5yFAe8dBjdDkGPrRRGqivVuuCZpjpxrO7UzuRyrs1K
	UNONFo5wWO1cZjzjue2kj5aZRL/cBKnmxYLD0iw8dwBBNzVeS8aJCJ5pyv1nNzjHqFVu2yp3j9NIl
	nk1uKmXKyH64EVcXcxSGbSL9tNIIOGXAeGutghG+eu7D1qPjNIKXDgx81MdTdJlCmFFsGlyhMzbQG
	Rbv+P9tN0QTLb3RTYXadaTqz1CPUlyZN3++yIKg2R4aU8snwVqKAc/36V2mJ7/KKASXb9OxXQe/20
	8XXLbFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vecPq-00000003Z4O-24q6;
	Sat, 10 Jan 2026 17:06:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vecPn-00000003Z43-3Vaq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 17:06:16 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-430fbb6012bso3975295f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 09:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768064773; x=1768669573; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=32edYZCX+nxG87B8UKMbk1Tq/DYM0xHuea3J9HZlJwM=;
        b=NtB+yxlYV4KNKAsZLLpo8Qf9KI7Hdb151QgJZ3PyAoFLA49tPodN531P9LniPOmHst
         8cZimXEKcTZLaeFKduIjugqDuIPVN7PSASZjS0UC5EZ5QZt9JLPYOrBvY44laFB6H66Q
         7uK6BpsVw2CTfk43DRnlGbfCUDZfcuXwnzHZCj5vYu4k2HBS7GDX7ojAxt6g8h6Rkbvu
         dT7ZSddtVLW2VUQTFMVETvJgO8Dpx4MJeVOOcpEvxsrMQCWsdSMzrGDzVvaD/7cKTKDo
         73dV3HedvlNbEI6JErHve3RPH7BEKULsYi2p/+gjs90Cw3FcWtvB0MxW1vf/+DcglT5z
         CgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768064773; x=1768669573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32edYZCX+nxG87B8UKMbk1Tq/DYM0xHuea3J9HZlJwM=;
        b=LvfOCAEBFgG5ZGPq+xkbiSvs4FSe+TM1IhTbI52DaAj3DOWHYpNhPRdgjugMxJzCqa
         lRkSg1BfDSVA0QhKSXs9ESlzI3SIQrsCmrT1c7v2Sfq54xSDS8nM5DTZmkvqzJaI7q6S
         /rGys9ylVM+/DIg875cHNP2D0+3PwQcPMUN4yAxKMw/APZKBXR0rNm8B6qGZJmmz6OTg
         hT2um7mPipkLuJ78vWB+4z198x4WQSmbb9mt+cE1mBOcoeDWc9tsAvLyo10wg+4LGgqD
         Zp3v1aB4MTCoak9zjk+8W7EBcY3rXXpSIpOmEAlvcgK50geQKBMDB43N+pBMyZNFNfp9
         mY1g==
X-Forwarded-Encrypted: i=1; AJvYcCUjrDJPq+ZW4G2Ubx1htETBeEwuRKCLl9qi5WsTUVPWuDUqya7RV0NM903nNXpk5ZkcBE8HPtpxHH9ppm3os1zv@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx956A6mPx0Xi8gBK7O+PSDNbpfWUvU94dIl2yJNJnvq2oRIhy
	y0rjsjFTwrEGEMRcmZNybgWXgAqv68inYeJrfEfErBNDKwxbL1AqTAK07T8yAg==
X-Gm-Gg: AY/fxX5ON6nzfM7X5dwG/+ovVmQquD/NyuRaf6Vg8xhAlSYGdCdd+zXORsnzSZOtz5I
	T8l0syweO9UPkVqqBiPUvqNJCdfGc3wqVqH6P/YNeVe8NmuZfJ3Qsard0CeHrndKMrDnrXgFR7U
	TDfrerDSCS06f5ovJomu/RVtlENKUHKhcuv3CYOD/TRpKkLmq3T+ZWh3vHNeSlO5p/aIrrsRgeI
	AW4XHniSPRi+5VRAO6cu4uvANI8TePIIQ5MFWhmyTkE8Y4cQqhal7sr/q6txtnOD4c6oQQNlCgl
	xN3Nkj0vQBgZAG7wjaYFTNSeFfH2Wk1CMpyKfSbq9fEOUKmyS0jPmGVjx1NZvOe4SMyyfCQjGxc
	jHMHcJd+FAgsxaqw5ts82WUerAKSJXz6rSve2ZgMyKfEjaltfR9xJ348qbVATPGvZoFqDeJzwrx
	Q=
X-Google-Smtp-Source: AGHT+IG0Ti6DzshFViKpEmON8fAI3DAmGgT0yWSR0PX1XYk1V7FQ0GIt3qDuCMNIYEkaE/4289eXjA==
X-Received: by 2002:a05:6000:2084:b0:430:f742:fbb8 with SMTP id ffacd0b85a97d-432c3775ad0mr16027947f8f.21.1768064772988;
        Sat, 10 Jan 2026 09:06:12 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16d2sm29753038f8f.13.2026.01.10.09.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 09:06:12 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sat, 10 Jan 2026 18:06:11 +0100
To: Will Deacon <will@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Yonghong Song <yhs@fb.com>, Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCHv2 bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <aWKHA2bldOSZ0lMB@krava>
References: <20260109093454.389295-1-jolsa@kernel.org>
 <aWEG685zlaV0o7M7@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWEG685zlaV0o7M7@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_090615_894016_37CF0675 
X-CRM114-Status: GOOD (  33.78  )
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

On Fri, Jan 09, 2026 at 01:47:23PM +0000, Will Deacon wrote:
> On Fri, Jan 09, 2026 at 10:34:53AM +0100, Jiri Olsa wrote:
> > Mahe reported issue with bpf_override_return helper not working when
> > executed from kprobe.multi bpf program on arm.
> > 
> > The problem is that on arm we use alternate storage for pt_regs object
> > that is passed to bpf_prog_run and if any register is changed (which
> > is the case of bpf_override_return) it's not propagated back to actual
> > pt_regs object.
> > 
> > Fixing this by introducing and calling ftrace_partial_regs_update function
> > to propagate the values of changed registers (ip and stack).
> > 
> > Reported-by: Mahe Tardy <mahe.tardy@gmail.com>
> > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > ---
> > v2 changes:
> > - moved ftrace_partial_regs_update to generic code [Will]
> > 
> >  include/linux/ftrace_regs.h | 25 +++++++++++++++++++++++++
> >  kernel/trace/bpf_trace.c    |  1 +
> >  2 files changed, 26 insertions(+)
> > 
> > diff --git a/include/linux/ftrace_regs.h b/include/linux/ftrace_regs.h
> > index 15627ceea9bc..f9a7c009cdae 100644
> > --- a/include/linux/ftrace_regs.h
> > +++ b/include/linux/ftrace_regs.h
> > @@ -33,6 +33,31 @@ struct ftrace_regs;
> >  #define ftrace_regs_get_frame_pointer(fregs) \
> >  	frame_pointer(&arch_ftrace_regs(fregs)->regs)
> >  
> > +static __always_inline void
> > +ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs) { }
> > +
> > +#else
> > +
> > +/*
> > + * ftrace_partial_regs_update - update the original ftrace_regs from regs
> > + * @fregs: The ftrace_regs to update from @regs
> > + * @regs: The partial regs from ftrace_partial_regs() that was updated
> > + *
> > + * Some architectures have the partial regs living in the ftrace_regs
> > + * structure, whereas other architectures need to make a different copy
> > + * of the @regs. If a partial @regs is retrieved by ftrace_partial_regs() and
> > + * if the code using @regs updates a field (like the instruction pointer or
> > + * stack pointer) it may need to propagate that change to the original @fregs
> > + * it retrieved the partial @regs from. Use this function to guarantee that
> > + * update happens.
> > + */
> > +static __always_inline void
> > +ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs)
> > +{
> > +	ftrace_regs_set_instruction_pointer(fregs, instruction_pointer(regs));
> > +	ftrace_regs_set_return_value(fregs, regs_return_value(regs));
> > +}
> 
> I think the AI thingy is right about dropping the const qualifier here

yes, will resend, thanks

jirka

> but overall I prefer this to the previous revisions. Thanks for sticking
> with it!
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Will

