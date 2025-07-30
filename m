Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7F2C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJXz1taZeMqAcIikmCjKmMy9sKu4coVbhTtZqnXW6zE=; b=Ppcxs+w8v2u9An6Neovjd+IDXT
	Nig7wtp+P7Q2sXkFRC7KqMYQuiWA69kNgSwGObYH4RXW5qP8bq50/xNHcEu0KYby5kqZH1GQZQDZb
	XymFpYbAbWWsLWApe+ts8nqIG2CCwseTyMioU3Ce2jB1ggsFlsQBj5H2Q3XGsYsTsThbChze1tbG7
	x2ZoVN3UUfScJGuhsNdYgbgB2QC9GF6etG2p1ZNr0E7Ls+XIcDVDDEaDIq2TdcJNFlQAcIzI4Xxgq
	Xsv1KOtHeTn0a1UsFLzhrxdEZPLGQ04x5lUYRsdRSZaXlVJfaaZp8ojDiPCJrfDRcbpail5tUNkBC
	dzdFFa2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5oU-00000001Ry5-2RGh;
	Wed, 30 Jul 2025 12:21:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4qi-00000001Khw-3Mmp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 11:19:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso32075715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 04:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753874395; x=1754479195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJXz1taZeMqAcIikmCjKmMy9sKu4coVbhTtZqnXW6zE=;
        b=f+fq15tcyxYgPlJGUKgxHS7NXc04SJ27EJkOxCiJzpIF5b/3YrItS9/4MAoSLizGDT
         i5fGDHpdZote7wNNkdWRBtzgn1max+iWBqX72FDp8mJpOGTjWMCR2SCUur136AWqFty2
         wScpDqiynu6lsuuDhSmIpaeoamxMdmnJRH33bMeJ0oWY1rPCi7rhMwQ4WHzOEZL1M9LO
         ImBwvnwLuVJ7dC/2fg2IPdn3XBmIhRKqIxeR25NvF75WQ6JyBn4JwnJ+rFjCiEw3fl2P
         Fcsq+v2PztL8aSo9Dx2ZlwFqNo9q/2Ie/hBKWmMvIdPt0QwXAXqme9gzcsIt/prdZX/7
         mAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753874395; x=1754479195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJXz1taZeMqAcIikmCjKmMy9sKu4coVbhTtZqnXW6zE=;
        b=dM5Ey7WFCj8g3ExNuAdg5Z6m/5PLKp0R20EOs+wl1LXupv94obK0jBb/+CMHY0N6tD
         EqbjAucfSaS3LlGpX7BrL+m36Q1X+boUhEtMVwA86KaZrJ2KmJEyCUlFh4qxoDDdwXWr
         un7TZgxR4FcQYVo5TJUsflCv9e0UKIVluEsTfRd7kqcuajItZgdZxhqjMzqlw0YH5tV4
         EWumC9h9FaoR/PRhn83aDt6fUAuPRPPGnQKCql4oe02orNqyDxrWmVe5Rmpom1TeCrAY
         xIOKG7flItaFS9c39r/K9+wn2rCtZ7IOEQt2H9kTK6NBjjCC59sEWLkrt2G5UBVTU4YD
         NGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlaCYNHRJZLIdYh9bYm5vSrrl6tBsR/ZXcKhd+5zLgg3Wtmt9SD0hM955nlzkVvadi3ihUy4aZuNZyLSQggFd0@lists.infradead.org
X-Gm-Message-State: AOJu0YwTeOOOcyfgEa7XlMKAQLYFKoncN/frVHlozLhQjm5a+RxfLUTk
	aEM++Xnd248rMuzYhqpHOnKFtpkA7JMDoWSHRXDETt8KAbKjcDX94rBK
X-Gm-Gg: ASbGnctnFAJjJi3Yp+kjGnof0NrbVvnjDBtZCU17Q3NoR+cJ+hS2k3aqcY6iwhiZ/h4
	7d6akd7UEojKb7MxBA2KJtjUerQCTTCtWySH0Fb3Xp+35YG28w/Fzf7CO80MjUaYQ1ldWdAX1Oz
	jIMZbNc+cBfARE3IfSrnmCb8KejBjJzgTIxaBRbrdtPpcez2bz3tuPk/Md56vjBDXccdiLEzFUZ
	dNJxcJaPIDvtkrodyGIM1V5Nq1GlG4lNogXEC086UNXIYjFIrW16Bb88kt0YjM2U7okAYZgU7gt
	+GBMBhvAVk4mAgaEOaX0egf7nqR75yRMASZ92oW8JdCnq7jm8ayzb3IS7nO1vG/wfyln8CcT6x/
	7YtThIfFJcAVfKeb1RGaZH2G9aZANbSI=
X-Google-Smtp-Source: AGHT+IHS1hFJmenJMvbQ32NXUNrJjyDKifQkLe7CXSiHbDwUb6p0CnZ4mgpK2sqmbd7w0QSQjYebrQ==
X-Received: by 2002:a05:600c:8812:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-458930ec808mr19828185e9.14.1753874394307;
        Wed, 30 Jul 2025 04:19:54 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45899fb191fsm18863345e9.21.2025.07.30.04.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 04:19:53 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 30 Jul 2025 13:19:51 +0200
To: Mark Rutland <mark.rutland@arm.com>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
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
Message-ID: <aIn_12KHz7ikF2t1@krava>
References: <20250729102813.1531457-1-jolsa@kernel.org>
 <aIkLlB7Z7V--BeGi@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIkLlB7Z7V--BeGi@J2N7QTR9R3.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_041956_845257_400075C3 
X-CRM114-Status: GOOD (  41.83  )
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

On Tue, Jul 29, 2025 at 06:57:40PM +0100, Mark Rutland wrote:
> Hi Jiri,
> 
> [adding some powerpc and riscv folk, see below]
> 
> On Tue, Jul 29, 2025 at 12:28:03PM +0200, Jiri Olsa wrote:
> > hi,
> > while poking the multi-tracing interface I ended up with just one
> > ftrace_ops object to attach all trampolines.
> > 
> > This change allows to use less direct API calls during the attachment
> > changes in the future code, so in effect speeding up the attachment.
> 
> How important is that, and what sort of speedup does this result in? I
> ask due to potential performance hits noted below, and I'm lacking
> context as to why we want to do this in the first place -- what is this
> intended to enable/improve?

so it's all work on PoC stage, the idea is to be able to attach many
(like 20,30,40k) functions to their trampolines quickly, which at the
moment is slow because all the involved interfaces work with just single
function/tracempoline relation

there's ongoing development by Menglong [1] to organize such attachment
for multiple functions and trampolines, but still at the end we have to use
ftrace direct interface to do the attachment for each involved ftrace_ops 

so at the point of attachment it helps to have as few ftrace_ops objects
as possible, in my test code I ended up with just single ftrace_ops object
and I see attachment time for 20k functions to be around 3 seconds

IIUC Menglong's change needs 12 ftrace_ops objects so we need to do around
12 direct ftrace_ops direct calls .. so probably not that bad, but still
it would be faster with just single ftrace_ops involved

[1] https://lore.kernel.org/bpf/20250703121521.1874196-1-dongml2@chinatelecom.cn/

> 
> > However having just single ftrace_ops object removes direct_call
> > field from direct_call, which is needed by arm, so I'm not sure
> > it's the right path forward.
> 
> It's also needed by powerpc and riscv since commits:
> 
>   a52f6043a2238d65 ("powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS")
>   b21cdb9523e5561b ("riscv: ftrace: support direct call using call_ops")
> 
> > Mark, Florent,
> > any idea how hard would it be to for arm to get rid of direct_call field?
> 
> For architectures which follow the arm64 style of implementation, it's
> pretty hard to get rid of it without introducing a performance hit to
> the call and/or a hit to attachment/detachment/modification. It would
> also end up being a fair amount more complicated.
> 
> There's some historical rationale at:
> 
>   https://lore.kernel.org/lkml/ZfBbxPDd0rz6FN2T@FVFF77S0Q05N/
> 
> ... but the gist is that for several reasons we want the ops pointer in
> the callsite, and for atomic modification of this to switch everything
> dependent on that ops atomically, as this keeps the call logic and
> attachment/detachment/modification logic simple and pretty fast.
> 
> If we remove the direct_call pointer from the ftrace_ops, then IIUC our
> options include:
> 
> * Point the callsite pointer at some intermediate structure which points
>   to the ops (e.g. the dyn_ftrace for the callsite). That introduces an
>   additional dependent load per call that needs the ops, and introduces
>   potential incoherency with other fields in that structure, requiring
>   more synchronization overhead for attachment/detachment/modification.
> 
> * Point the callsite pointer at a trampoline which can generate the ops
>   pointer. This requires that every ops has a trampoline even for
>   non-direct usage, which then requires more memory / I$, has more
>   potential failure points, and is generally more complicated. The
>   performance here will vary by architecture and platform, on some this
>   might be faster, on some it might be slower.
> 
>   Note that we probably still need to bounce through an intermediary
>   trampoline here to actually load from the callsite pointer and
>   indirectly branch to it.
> 
> ... but I'm not really keen on either unless we really have to remove 
> the ftrace_ops::direct_call field, since they come with a substantial
> jump in complexity.

ok, that sounds bad.. thanks for the details

Steven, please correct me if/when I'm wrong ;-)

IIUC in x86_64, IF there's just single ftrace_ops defined for the function,
it will bypass ftrace trampoline and call directly the direct trampoline
for the function, like:

   <foo>:
     call direct_trampoline
     ...

IF there are other ftrace_ops 'users' on the same function, we execute
each of them like:

  <foo>:
    call ftrace_trampoline
      call ftrace_ops_1->func
      call ftrace_ops_2->func
      ...

with our direct ftrace_ops->func currently using ftrace_ops->direct_call
to return direct trampoline for the function:

	-static void call_direct_funcs(unsigned long ip, unsigned long pip,
	-                             struct ftrace_ops *ops, struct ftrace_regs *fregs)
	-{
	-       unsigned long addr = READ_ONCE(ops->direct_call);
	-
	-       if (!addr)
	-               return;
	-
	-       arch_ftrace_set_direct_caller(fregs, addr);
	-}

in the new changes it will do hash lookup (based on ip) for the direct
trampoline we want to execute:

	+static void call_direct_funcs_hash(unsigned long ip, unsigned long pip,
	+                                  struct ftrace_ops *ops, struct ftrace_regs *fregs)
	+{
	+       unsigned long addr;
	+
	+       addr = ftrace_find_rec_direct(ip);
	+       if (!addr)
	+               return;
	+
	+       arch_ftrace_set_direct_caller(fregs, addr);
	+}

still this is the slow path for the case where multiple ftrace_ops objects use
same function.. for the fast path we have the direct attachment as described above

sorry I probably forgot/missed discussion on this, but doing the fast path like in
x86_64 is not an option in arm, right?


thanks,
jirka

