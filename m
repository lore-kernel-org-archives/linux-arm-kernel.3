Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4B7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx6LfbWoOZVo4WZlNr29Yr02kRZ3p+X0xl0ciBlTxio=; b=bBrJTDnR+4bno25GH8A2vTj0Ho
	Wi5u8aO/ZLyz/xskL7X5SVEbo4cGT9ey+OWgoBww21eAwLnNd84rCf06Evv4OwqfsG1rwXzMxADq0
	g4TcAxS6mgewko4S9J1Q1OdAowLQt7gJRHZka0rJ/fJqwc+FEb21EK/MRObOvYGhtdPJBJcy/IJ8z
	e0YJhc+9S7KVdfz42I6+vmJaZhHXLUlWKDQU8WV5ko8LAGppu5AdDqKNYYmy+fsHryxDlPlkbOqIS
	l9hgmyfRWsdFXTpVUnwrQxm4fvbrK4cdEg/sC1bAVOdLSvz7sYfRel5VVKAXOsyIPbSvhhKcmldUY
	Bgw0fL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDxc-0000000FERp-31Ro;
	Fri, 10 Jan 2025 12:17:56 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDwP-0000000FEE2-1LYJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 12:16:42 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30229d5b21cso17622331fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 04:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736511398; x=1737116198; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dx6LfbWoOZVo4WZlNr29Yr02kRZ3p+X0xl0ciBlTxio=;
        b=3GSWqmVQbg9J1j3LKsRmIFsMg4Fl+E7bbBG+EfsUObbvsb79FUx7eycp7S/hyssM8a
         5KiRTW9EB3SjRW2rFtymPg8ke8S29lcA6N2r+VOyJneObBTenREzZ6AwCcPNPFM3nu1m
         tlYPnref80y1SEKVShwY/HAjt5WK5vjVjBmOZNsph4u4PePjirKSZ9KL1+gJdw26Rt8o
         lg1kVCzrc7DDAZRpuslNueil2unL2GHEKMcO7ZOn8L7PEhTbHbQ261OOMUcFON8zUKuv
         l7WpbupNJKp4MooYQGD4b9JXkzgOD9z/rNOOqpLbp2jvnt+TmRpJlfc3NA9j3Y91abEH
         siwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736511398; x=1737116198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dx6LfbWoOZVo4WZlNr29Yr02kRZ3p+X0xl0ciBlTxio=;
        b=Z0gUtKSL45OJn7jY4Veax4/0xJzbLKQyMlScMf3HOs6O98zIpkjnwD39dO/c5Kx3Ns
         tlYIJ7ibKW4rkosfbDudDTvY77mLYZUqubkPsD/9luTUZYzviXJifLfHoxEeyOaMun5w
         2y5LJ18VmE0QRVCLW8qHmk6IMfqwyl5zvC2ijEnkKCnQQwX0qakFA6vwh3+Gn4860u2V
         tAjkmT3ODBRrDuDVuGI5tlrNr08Oijh4myxCAxwjlZ7mc31f+e+Y+qopKbsUIPMNIQCk
         bVuoK/KjXrwdpAHKjMl75NPiQX/dIbJb6lv6xQQ00gk0qJsODGfZ1MHEWz0+MrARiB3Q
         fxoA==
X-Forwarded-Encrypted: i=1; AJvYcCXPuegKRaJdfGW23U/edy702pTyj9hcnL1nZn4ia43EDBwZENnJrS4SwpwxixN8wr1eKhoX9KJ8zVlUJM2bc0z+@lists.infradead.org
X-Gm-Message-State: AOJu0YzoeNtqqxoSFWiA0D4O6uGvXBBQSBtzIcbVETgz3wT//a5vo8wv
	AtYEJfwle+7KYEWCJrGf59o41uPJDwKkcLGIvuwYGby2k2l0qR+vbWJCRyvTZPwWKUm/oeE4G5s
	LDZEJWVLjeodRtp3SLjXp+2zBmzW3HW9cinSL
X-Gm-Gg: ASbGncs724DwO0N0V2MZilV+bd+zh4TVOAyJwmzpI9W03KwmdspRZh1Z3ehWAjKewCo
	wK+8d2RELqJinxqmdF2hPo/LpHB0L0rrml6ry8+qmZ6ofh99t43bkTpreqc16SsmZyEg4iDY=
X-Google-Smtp-Source: AGHT+IGVz7X+fbBVIzBdInnx2bkV3sGGjpZi0hhX8DWvZ9b1BNEo4hsq0wEuqhU72LBjprO2Rqcz30cGAQVOyHHn4rc=
X-Received: by 2002:a05:651c:19a6:b0:300:2464:c0c2 with SMTP id
 38308e7fff4ca-305f453158amr29422851fa.8.1736511398361; Fri, 10 Jan 2025
 04:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20250110073056.2594638-1-quic_jiangenj@quicinc.com> <CANpmjNOg9=WbFpJQFQBOo1z_KuV7DKQTZB7=GfiYyvoam5Dm=w@mail.gmail.com>
In-Reply-To: <CANpmjNOg9=WbFpJQFQBOo1z_KuV7DKQTZB7=GfiYyvoam5Dm=w@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 10 Jan 2025 13:16:27 +0100
X-Gm-Features: AbW1kvYg6Yj75R_YQTMDFKYPIK4IFfqRlUkZXLVrw7rnxTU_BdbrBR450FQtMuY
Message-ID: <CACT4Y+Zm5Vz1LL7m_BubwV=bMPgVjOVNpp12nDZRi5oesH47WA@mail.gmail.com>
Subject: Re: [PATCH] kcov: add unique cover, edge, and cmp modes
To: Marco Elver <elver@google.com>
Cc: Joey Jiao <quic_jiangenj@quicinc.com>, andreyknvl@gmail.com, corbet@lwn.net, 
	akpm@linux-foundation.org, gregkh@linuxfoundation.org, nogikh@google.com, 
	pierre.gondois@arm.com, cmllamas@google.com, quic_zijuhu@quicinc.com, 
	richard.weiyang@gmail.com, tglx@linutronix.de, arnd@arndb.de, 
	catalin.marinas@arm.com, will@kernel.org, dennis@kernel.org, tj@kernel.org, 
	cl@linux.com, ruanjinjie@huawei.com, colyli@suse.de, 
	andriy.shevchenko@linux.intel.com, kernel@quicinc.com, 
	quic_likaid@quicinc.com, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_041641_360504_95453EE9 
X-CRM114-Status: GOOD (  31.67  )
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

On Fri, 10 Jan 2025 at 10:23, Marco Elver <elver@google.com> wrote:
> > From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
> >
> > The current design of KCOV risks frequent buffer overflows. To mitigate
> > this, new modes are introduced: KCOV_TRACE_UNIQ_PC, KCOV_TRACE_UNIQ_EDGE,
> > and KCOV_TRACE_UNIQ_CMP. These modes allow for the recording of unique
> > PCs, edges, and comparison operands (CMP).
>
> There ought to be a cover letter explaining the motivation for this,
> and explaining why the new modes would help. Ultimately, what are you
> using KCOV for where you encountered this problem?
>
> > Key changes include:
> > - KCOV_TRACE_UNIQ_[PC|EDGE] can be used together to replace KCOV_TRACE_PC.
> > - KCOV_TRACE_UNIQ_CMP can be used to replace KCOV_TRACE_CMP mode.
> > - Introduction of hashmaps to store unique coverage data.
> > - Pre-allocated entries in kcov_map_init during KCOV_INIT_TRACE to avoid
> >   performance issues with kmalloc.
> > - New structs and functions for managing memory and unique coverage data.
> > - Example program demonstrating the usage of the new modes.
>
> This should be a patch series, carefully splitting each change into a
> separate patch.
> https://docs.kernel.org/process/submitting-patches.html#split-changes
>
> > With the new hashmap and pre-alloced memory pool added, cover size can't
> > be set to higher value like 1MB in KCOV_TRACE_PC or KCOV_TRACE_CMP modes
> > in 2GB device with 8 procs, otherwise it causes frequent oom.
> >
> > For KCOV_TRACE_UNIQ_[PC|EDGE|CMP] modes, smaller cover size like 8KB can
> > be used.
> >
> > Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
>
> As-is it's hard to review, and the motivation is unclear. A lot of
> code was moved and changed, and reviewers need to understand why that
> was done besides your brief explanation above.
>
> Generally, KCOV has very tricky constraints, due to being callable
> from any context, including NMI. This means adding new dependencies
> need to be carefully reviewed. For one, we can see this in genalloc's
> header:
>
> > * The lockless operation only works if there is enough memory
> > * available.  If new memory is added to the pool a lock has to be
> > * still taken.  So any user relying on locklessness has to ensure
> > * that sufficient memory is preallocated.
> > *
> > * The basic atomic operation of this allocator is cmpxchg on long.
> > * On architectures that don't have NMI-safe cmpxchg implementation,
> > * the allocator can NOT be used in NMI handler.  So code uses the
> > * allocator in NMI handler should depend on
> > * CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG.
>
> And you are calling gen_pool_alloc() from __sanitizer_cov_trace_pc.
> Which means this implementation is likely broken on
> !CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG architectures (do we have
> architectures like that, that support KCOV?).
>
> There are probably other sharp corners due to the contexts KCOV can
> run in, but would simply ask you to carefully reason about why each
> new dependency is safe.

I am also concerned about the performance effect. Does it add a stack
frame to __sanitizer_cov_trace_pc()? Please show disassm of the
function before/after.

Also, I have concerns about interrupts and reentrancy. We are still
getting some reentrant calls from interrupts (not all of them are
filtered by in_task() check). I am afraid these complex hashmaps will
corrupt.

