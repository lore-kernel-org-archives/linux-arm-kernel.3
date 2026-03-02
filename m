Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291D4D58E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 08:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aywtoeuxkfunv4Ek8XeTDfrALEqJk4nC+4MbytSvfC4=; b=Ju3ng5Ur4CI7IwPyiVTAal0lVi
	MVzKGE1ypUUZqOhYjulTE3nVJ2qW1D9PXXXZd1sGyeQZ6leaTXNmnCcZoqkdvtxouLKKUe+3YCmMF
	bkDXuVZnqrDxVUPbe0j4ls9FUnX4cofbZoWmfFOXrWwA4E5jdvzBPTAHcoQdYAcaq4s+6ioA65qSr
	XJ2H9zvsBqLz31+om2aol5hmhdOaDHNjViXEymDW/nF7CzKstMrhC5SLFwQXad91UOhgvQjkb4tw7
	wdBjwrnchqGRmKtS9mjPfg/Ux8nYhLZuDLxTDNoc4jfUhC+6L231uY5WP2h6drsVLdAwyYWBSs21f
	+CEuVRPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyKO-0000000CV18-3Mbx;
	Mon, 02 Mar 2026 08:08:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyKM-0000000CV0l-1YcK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 08:08:31 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-436e8758b91so2633078f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 00:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772438908; x=1773043708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Aywtoeuxkfunv4Ek8XeTDfrALEqJk4nC+4MbytSvfC4=;
        b=GAm25g/IL7tXJQzwHi9zY7ODiZqRzhNWeBYz88kRaCQ3Wk5sVj+fnRmeEQ0RH6TpCt
         csejUhld1djm9kjFnQ5WYAijNODdDGYFxuuEpegJ3cPSWHHZ4lbEWfoloqhALJ7rxZ0S
         X0i5kPmbfxWlgROry1PxugdlmG8V9vh1UP1Khq7CzDRvXu+UyoDEsPqiKIjxycu+WjcE
         bVR1YL4nkQQwswcMOyhf9ItWSkYcbOfpW5woK54P+JXQ1FJPFG9NOaAo8WUREw9aMmsn
         445vGEFj3cbQ5N5wHViTxTSWuM2yibK83f6qHnU3UYCPXpfoiwAZn0cnqKw1YgKv/wf1
         BOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772438908; x=1773043708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aywtoeuxkfunv4Ek8XeTDfrALEqJk4nC+4MbytSvfC4=;
        b=YCoZCMep+jJtmnWsE82Bx2OqnmazHydzsaOOjdaehTlbyKnRBwVZRQGwjvfsJzIcrd
         y/BtZwGKG/BR1OhWBAZ+SLV990hhX+Kci4pQG1U2dynMWldglxmkutUa2KCUxFYR2nDE
         zY0Zl2kyDGQ/BA7ebLLP6YE9fVvJkua0HKKgjF40QxRWukZtVrG8z9BkDcuZg8AFISXu
         MGIaK2AqSPq05SkR9L9gksQ9pfQcnspG2XtP7ut93bUuXJEh143UyNrpT7yHBBS7Rohr
         5rQy56NNWm935dkTXepIPESohBFCJvsgXckCepJl14GAwez3JSjhSr1JArbN5XujFA59
         /04A==
X-Forwarded-Encrypted: i=1; AJvYcCWlvif0IvtYSdkbyOzwk/3KQLUe2jqe9oqDhqh6vKK7pN3XZ3Mq+XHYR/zwhuc9h8t7tl90joj9at2d79XxsLUw@lists.infradead.org
X-Gm-Message-State: AOJu0YyQfbEjyQie19GWuZEAPTLuaj/TdeJnW/s/s130hzC5wrBKqJ7D
	yFz/bqRt3J8F5Y19JmkwQ6AzkoEZeX6ly7/oObZV5xuC9rZgSEl1IIJS
X-Gm-Gg: ATEYQzzYvM33WYTop6QqkjcEzSyJgD5qyndP/kWI/pF97lUWJYyPBLeJDX6bz9iWWZe
	hWCcjrcm0ElpD+h+Ys5ibWSn2kT3A2sPPrsdTTH0uLUAe11z7R6Z8zHQ72/aWa9ibgDDhSt7pZf
	CbdRjrt0zKRN8lbnZraaF4obsSDM+piKpuM6UMU25G0QtfWtSqZTwZQ4OFG0g+e7o6b6Z4fXGiF
	pg97kg1pfYnR413LGLwZyEeInx2UAEYboxCc1d/m5kV4H4X1XKFniDHtz7T1oGivbgzzG0jA4rr
	ltaaHoePVgH0MliKM0W9ex/oYTu1XaqkUBLtAP5wjALvLEs+RB/YWOPEGrSG5jmyTAwxaSnM5KJ
	V7ijzfbHqLXZEkfmNOsOZdISlBEr1WQrckwr1nl8oIr8PV0J4RPPERtE68m1YHdW0YpW+GwRx
X-Received: by 2002:a05:6000:2404:b0:437:6e55:a736 with SMTP id ffacd0b85a97d-4399dde3046mr20509566f8f.7.1772438907722;
        Mon, 02 Mar 2026 00:08:27 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::d99c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a25dsm25282488f8f.21.2026.03.02.00.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:08:27 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 2 Mar 2026 09:08:25 +0100
To: Steven Rostedt <rostedt@kernel.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: Re: [PATCHv6 bpf-next 9/9] bpf,x86: Use single ftrace_ops for direct
 calls
Message-ID: <aaVFeafZb76l9L0m@krava>
References: <20251230145010.103439-1-jolsa@kernel.org>
 <20251230145010.103439-10-jolsa@kernel.org>
 <1b58ffb2-92ae-433a-ba46-95294d6edea2@linux.dev>
 <aaIAoBZGkP7RQrvc@krava>
 <aaILlSuEgaYDq41r@krava>
 <20260228153921.19cd42a6@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228153921.19cd42a6@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_000830_458543_EE1B57C8 
X-CRM114-Status: GOOD (  16.86  )
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

On Sat, Feb 28, 2026 at 03:39:21PM -0500, Steven Rostedt wrote:
> On Fri, 27 Feb 2026 22:24:37 +0100
> Jiri Olsa <olsajiri@gmail.com> wrote:
> 
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index 827fb9a0bf0d..e333749a5896 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -6404,7 +6404,9 @@ int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
> >  			new_filter_hash = old_filter_hash;
> >  		}
> >  	} else {
> 
> As this looks to fix the issue, just add:
> 
> 		guard(mutex)(&ftrace_lock);
> 
> > +		mutex_lock(&ftrace_lock);
> >  		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
> > +		mutex_unlock(&ftrace_lock);
> >  		/*
> >  		 * new_filter_hash is dup-ed, so we need to release it anyway,
> >  		 * old_filter_hash either stays on error or is already released
> > @@ -6530,7 +6532,9 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
> >  			ops->func_hash->filter_hash = NULL;
> >  		}
> >  	} else {
> 
> And here too.
> 
> As there's nothing after the comment and before the end of the block.

ok, will do.. the original changes:

  05dc5e9c1fe1 ("ftrace: Add update_ftrace_direct_add function")
  8d2c1233f371 ("ftrace: Add update_ftrace_direct_del function")

went through bpf tree, so I'll send the fix the same way,
please let me know otherwise

thanks,
jirka


> 
> -- Steve
> 
> > +		mutex_lock(&ftrace_lock);
> >  		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
> > +		mutex_unlock(&ftrace_lock);
> >  		/*
> >  		 * new_filter_hash is dup-ed, so we need to release it anyway,
> >  		 * old_filter_hash either stays on error or is already released
> 
> 
> 
> -- Steve

