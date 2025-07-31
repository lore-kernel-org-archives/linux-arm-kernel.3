Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B2CC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 20:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AAkvvpbQOhTuAwe9EJHG3ghOkBXusQx1F2hWyP1fLc=; b=q8Vdzom5ZfUvmL859DBIPDGmyg
	Xk8Oemhi0sDaOsXKtwUfh6eIIuMR2ePu4AQh+D1Dg2veVm8NRlqu2aSFwM5Lc9WIlZO38ijdZxx0+
	eAqavcWKO1gc1gzNCoRntUwyxDYLacFJ7kfRvrK7/coozBfpnOU8xP1G9SygmH3XGyTYA9f8HnHKr
	HT9tVFIAUWqGXzzQ43r3G8pR5IjekIVJOhsoIrWQvSG9SC/3kbfXz0EHZAIO/YzrENZJbxYic/o3R
	1FbtkvO6WshwCI7KmoGnNgpwJL3NCz4dITTq8FjT6A2KVgBVllyEyVbxLZQVcozhNXVQ5BmdRVjJ6
	ReokoUjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uha73-00000004O1p-0PMO;
	Thu, 31 Jul 2025 20:42:53 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uha4S-00000004NqT-2NbN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 20:40:13 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-af8ffa04463so30912066b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 13:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753994410; x=1754599210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/AAkvvpbQOhTuAwe9EJHG3ghOkBXusQx1F2hWyP1fLc=;
        b=FKUYXw4AaYsjEywEcBWN/kBZ4jnlB6+ne6SiGYnJUkNBVabU5d+VIhid6G3qTJr3p2
         ywA4nQVayLBRpluqIu6mnVYoyrYtTW3LGWfOm+oZieDi4U1K7tNk5WT1hemi3e+KdwLk
         2qg4JOFvebu2Qi8W7E4etVjtQSbqHSyL4ZOMfqA1ixsvUpGGwclZutV/1BqZ+3yy3EH8
         p28v/pu/qG8hIqwMmh0LzqGTXKgmixC7gWVOObwLxUnaJNHorTzuSzZfIq2IjFUHoQJy
         E2V00TTQDiKUyVxX1WEXXCe4bb3LIaZ8XNBfxxU8cAmzyuZLYwuJr6W9xf79jV4ew2Eb
         UKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753994410; x=1754599210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AAkvvpbQOhTuAwe9EJHG3ghOkBXusQx1F2hWyP1fLc=;
        b=FKkV3NhMEwJB1FaR+Hoaj5gso0RrCB1fm2u9FlMFhcYebEFiaKxmbA3TN5Ug0pw/pe
         PjeDsp4v42lY7bHWuhnyAZ1wstbgUueaCIHJqo1hH5LOAl8sBgBsjfcYnE6EKyOK2vJ1
         qXOSgJH6dl0y0TqCMjhpZyVZrPvfn58mhJHELHDDWQsRlBub2DTpibDR9JDkSHpYD7Pn
         SXkQ64U+hAUMQgKn1/7rNvuSe0JzRXs8Cj+Miex1aQKp2HjbjFN0RdBUP+ShVcL65wXF
         Fpl6mVKzdSFTqq1Q++rhde7XeNOQEcOh83sFMZMz3bI0esXLLFfxekP84UAsmMY1Fi8v
         nECw==
X-Forwarded-Encrypted: i=1; AJvYcCUvZmJ+M+RVxsMe8NM86QL4ibAA8mFhOStrmcdCVBFqRsFjtRFhfWoHKqAhjweU3KOd/jn3YpUkmVbeqWhG/L+m@lists.infradead.org
X-Gm-Message-State: AOJu0YzaWQvz9vWUSosEjH+l7dkfhR7dac2Gp9CzrF7lKHkjPAu5EHE6
	te7AAunadU5pn2Tc3ZmsXf1gFSjNxcd0+6PpFxVwTtlJxwlY5i5SW+d3
X-Gm-Gg: ASbGncuX146pyYVRoja33MLXKiofJ5JZ3CZj9LbsGplDof8mWrQCOow2NC1xYoWiG/I
	na3nj12VIupxgiTXcWXkvvsiwk5KTA8Mf4nN5Stu2gU4xalcYP/OK/Jn0PNF5WpHQrDNKEoal4X
	vZi9wVxqACKhIrELhp4+cWwhMyDyGUVDvjIoM/NOSr428uoE7+n6lV4qnVCas+CC3iWS3jc/7Gw
	7ctl0nIEaecBguwqUNMCM/3GwDdOhrczhlwpzioScA6Z9S6Hd7M1TNyUZRuukxLq3YlipH4Ln1N
	h6Us0EsUBSpPEOzlm4q5YsL47Ag3aYNDasPaO1t8lCOiieJXhZ3vGT/PM2q5I9Gok+YtdmGxFYx
	JwdVhojSOCg==
X-Google-Smtp-Source: AGHT+IH35GZfVfrFy+4u5JJvJfBMXKVCGrjrhAiwGxS9sqsd6tRiJOQQ6uPYqZ73ZuJ5boDADFvL5w==
X-Received: by 2002:a17:907:3cca:b0:aec:f8bb:abeb with SMTP id a640c23a62f3a-af8fd9a5c45mr987006766b.42.1753994409970;
        Thu, 31 Jul 2025 13:40:09 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e8359sm166233666b.89.2025.07.31.13.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 13:40:09 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 31 Jul 2025 22:40:07 +0200
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
	Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC 00/10] ftrace,bpf: Use single direct ops for bpf trampolines
Message-ID: <aIvUp_88v84Uw-lQ@krava>
References: <20250729102813.1531457-1-jolsa@kernel.org>
 <aIkLlB7Z7V--BeGi@J2N7QTR9R3.cambridge.arm.com>
 <aIn_12KHz7ikF2t1@krava>
 <20250730095641.660800b1@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730095641.660800b1@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_134012_613417_3AE3E65F 
X-CRM114-Status: GOOD (  36.18  )
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

On Wed, Jul 30, 2025 at 09:56:41AM -0400, Steven Rostedt wrote:
> On Wed, 30 Jul 2025 13:19:51 +0200
> Jiri Olsa <olsajiri@gmail.com> wrote:
> 
> > so it's all work on PoC stage, the idea is to be able to attach many
> > (like 20,30,40k) functions to their trampolines quickly, which at the
> > moment is slow because all the involved interfaces work with just single
> > function/tracempoline relation
> 
> Sounds like you are reinventing the ftrace mechanism itself. Which I warned
> against when I first introduced direct trampolines, which were purposely
> designed to do a few functions, not thousands. But, oh well.
> 
> 
> > Steven, please correct me if/when I'm wrong ;-)
> > 
> > IIUC in x86_64, IF there's just single ftrace_ops defined for the function,
> > it will bypass ftrace trampoline and call directly the direct trampoline
> > for the function, like:
> > 
> >    <foo>:
> >      call direct_trampoline
> >      ...
> 
> Yes.
> 
> And it will also do the same for normal ftrace functions. If you have:
> 
> struct ftrace_ops {
> 	.func = myfunc;
> };
> 
> It will create a trampoline that has:
> 
>       <tramp>
> 	...
> 	call myfunc
> 	...
> 	ret
> 
> On x86, I believe the ftrace_ops for myfunc is added to the trampoline,
> where as in arm, it's part of the function header. To modify it, it
> requires converting to the list operation (which ignores the ops
> parameter), then the ops at the function gets changed before it goes to the
> new function.
> 
> And if it is the only ops attached to a function foo, the function foo
> would have:
> 
>       <foo>
> 	call tramp
> 	...
> 
> But what's nice about this is that if you have 12 different ftrace_ops that
> each attach to a 1000 different functions, but no two ftrace_ops attach to
> the same function, they all do the above. No hash needed!
> 
> > 
> > IF there are other ftrace_ops 'users' on the same function, we execute
> > each of them like:
> > 
> >   <foo>:
> >     call ftrace_trampoline
> >       call ftrace_ops_1->func
> >       call ftrace_ops_2->func
> >       ...
> > 
> > with our direct ftrace_ops->func currently using ftrace_ops->direct_call
> > to return direct trampoline for the function:
> > 
> > 	-static void call_direct_funcs(unsigned long ip, unsigned long pip,
> > 	-                             struct ftrace_ops *ops, struct ftrace_regs *fregs)
> > 	-{
> > 	-       unsigned long addr = READ_ONCE(ops->direct_call);
> > 	-
> > 	-       if (!addr)
> > 	-               return;
> > 	-
> > 	-       arch_ftrace_set_direct_caller(fregs, addr);
> > 	-}
> > 
> > in the new changes it will do hash lookup (based on ip) for the direct
> > trampoline we want to execute:
> > 
> > 	+static void call_direct_funcs_hash(unsigned long ip, unsigned long pip,
> > 	+                                  struct ftrace_ops *ops, struct ftrace_regs *fregs)
> > 	+{
> > 	+       unsigned long addr;
> > 	+
> > 	+       addr = ftrace_find_rec_direct(ip);
> > 	+       if (!addr)
> > 	+               return;
> > 	+
> > 	+       arch_ftrace_set_direct_caller(fregs, addr);
> > 	+}
> 
> I think the above will work.
> 
> > 
> > still this is the slow path for the case where multiple ftrace_ops objects use
> > same function.. for the fast path we have the direct attachment as described above
> > 
> > sorry I probably forgot/missed discussion on this, but doing the fast path like in
> > x86_64 is not an option in arm, right?
> 
> That's a question for Mark, right?

yes, thanks for the other details

jirka

