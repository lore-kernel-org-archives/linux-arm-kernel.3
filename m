Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5287AD1488B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKsZk5STRUk0X4Pv4cc5SZyi6XswPBivoY5uNi8SKAU=; b=J4QnUvolr6DqsmN6vCmuN0OKeM
	Zl/EwNSo6Ww/e9YEiMw12NTfeyTQHjxiy3ro6z6pj2T5IqY0DXBeLTTsXWV98/Pi8dmXirZBzeW8q
	lonE2If+DLeONrh2Xc4Qdi+HCWWg8lhStWJST8MAQZO4ks7bMeyGmc6fd5jsHnBdAPtf6ksQFN+hL
	YwiN9PQjb3BW8EXUQwNXlTII4GgK6jJD/PICt6+md2+XFlLVbfo0CFFKPbhzzq3AOsSTqkT6YgfWq
	oPZxz/BnIh0UqVLX8hHZFV0eYgM9UR+3wzu25WSuBdOYvLQ09YZd2f70wi3Myuc3dOIFiy1sX+4dL
	XqFAepKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdr4B-0000000HMI1-3be1;
	Thu, 08 Jan 2026 14:32:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdr49-0000000HMHf-1V9D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:32:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so25780655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767882763; x=1768487563; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKsZk5STRUk0X4Pv4cc5SZyi6XswPBivoY5uNi8SKAU=;
        b=We4jMELSr131CCxS6/mejvLYxsNBKqiOmKyph6aA1kM4v9+ybFmDk6QR7O0Z7YCOf9
         PcvDYjFHb6cuVHKml/a7eLTdpi7vvEjf7I99z0m78Gt95Pa10GBMNI8pIKsv8+sK9h96
         aw22VgVkiYGex2JAavFN69P7KDWgiFqrI5dp3fI7mslCFyQXzxCk6Bbu9+Pg7eZU1Qaf
         ZmzFmV2ZknPhm/BXern5lS9oyrJs2XmXctFIlgh/I1fROS8Cv08SYWHWdlHOF/Dm79VY
         WoC4W0IztBCxMH4jZlYp9+LGIkBN5uEpS2uMopV2FsJ0l2POUs7W7JjWX76N7epck/Dd
         ZIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882763; x=1768487563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKsZk5STRUk0X4Pv4cc5SZyi6XswPBivoY5uNi8SKAU=;
        b=SbiiYqLCDt00rEpZF8nA0iBf9lcil0DvjYH/VsqWGTySMrS7DtVC/9h0vZGlKcpr+M
         riSyWWjshiLNahXKXyjhwwnDjiUG3SCHJr9MwI2zc2VeRhdrEQBcf93ubFZ9eyOxjc/H
         OXjnTYTdw+JNIRmZfWTmErhERhLN7ZBXAw6LUefAIcdhnuYtg6nJajCS19r5DFpcBSR2
         bpechbwkBGiwumKOXN5P/eJpyMwYUMswoLmqks+Tcj68z8x8Lue3g2Ug9jvl5MRucIJD
         Z0ICJSaShF/I9lv7qmMAtlaeV2UWs5+Ij0KlFHE1aIdAF9x1T8iFaRoW5UnHpa9oEVK/
         ge9A==
X-Forwarded-Encrypted: i=1; AJvYcCUV7saO9Qb33N1MbSvi1JJAQFlTtf4hMZGm2XOgbTLPjTnmYXUXMbN8HBD5dwaGZb6YdTZb1FeuSxgu+n1j2FB5@lists.infradead.org
X-Gm-Message-State: AOJu0YwaObbigofAb15TagGcSWmzOR1ITGqBtvzfvBXtuTqJTKq6Hv+q
	GL7WDmK/fGLMjkNjsFH3R0pdRv/7q5A5N8UKOkkrXwbGZNFjrk0gCZk6
X-Gm-Gg: AY/fxX5P4/SFqC5lHsdEZxeE9yy35BicZpSbINTBuLTOxSz7FwoObYdNb9IgNUkN02K
	FJtNmqCnEKok+bvQzuMk6sv7aBmFl4DUZqLeyI5NjT+b6KsbLbMtiZ3o+UYz9xOouvrn0CuPGxk
	ba+zVyKZRgcnBV1Z/YmMqhONNfFLnAhjrprmsEVHgQ9KNrc0cfvPWMO7PQA/I9b7YJqEl2EBqDf
	gVeZiYGhcrEoTch6mRvc891MaNFNpV2yF1FMQvuxXU50l/XHfmS4UGijCs87pNCG/D7AUlbat3Z
	I4lGXlw5K/oiL4NKnT/Wc8Wi2kEXoUzVNY+CoxD2agPMXZAp9EOME8/uSrMdR7qKsA6H36JXm1B
	Ml8l1bvHoIDW/cFDWwQ1ebhxZiITbojoZ2RdIwUW8OExwlJuC76dpEFati0UpmRIlPdzJreYVq3
	M=
X-Google-Smtp-Source: AGHT+IGnDsY3fisUw/PeO5pgI1mNCLBNotubRxiPg3jCybSey6S3sceqOXla0zwMBu7+42vl1Y5nvA==
X-Received: by 2002:a05:600c:4ed1:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-47d84b54031mr77169965e9.33.1767882763275;
        Thu, 08 Jan 2026 06:32:43 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41eb3bsm159970735e9.7.2026.01.08.06.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:32:42 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 8 Jan 2026 15:32:40 +0100
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Will Deacon <will@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Yonghong Song <yhs@fb.com>, Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <aV_ACGtNHRfheAme@krava>
References: <20260107093256.54616-1-jolsa@kernel.org>
 <20260107110352.3fd7ddda@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107110352.3fd7ddda@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_063245_436265_D0B68FDC 
X-CRM114-Status: GOOD (  23.75  )
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

On Wed, Jan 07, 2026 at 11:03:52AM -0500, Steven Rostedt wrote:
> On Wed,  7 Jan 2026 10:32:55 +0100
> Jiri Olsa <jolsa@kernel.org> wrote:
> 
> > diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> > index 1621c84f44b3..177c7bbf3b84 100644
> > --- a/arch/arm64/include/asm/ftrace.h
> > +++ b/arch/arm64/include/asm/ftrace.h
> > @@ -157,6 +157,30 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
> >  	return regs;
> >  }
> >  
> 
> See my reply in the other email thread:
> 
>   https://lore.kernel.org/all/20260107105316.2b70a308@gandalf.local.home/

ah ok, thanks

jirka

> 
> -- Steve
> 
> 
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
> > +	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);
> > +
> > +	if (afregs->pc != regs->pc) {
> > +		afregs->pc = regs->pc;
> > +		afregs->regs[0] = regs->regs[0];
> > +	}
> > +}

