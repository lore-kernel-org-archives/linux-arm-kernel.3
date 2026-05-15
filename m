Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B593CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 03:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fop7pjzudS6D7wpF5+eicnKfmSm+O2A+twiw3O1334U=; b=wmTdaNt3uwhD/AHGHGi6pqlWcs
	KJe/hXKwv7eU+cZAkIvXyEtVv0KJqhg8iSW21+El75YkiNcq5MkNj+qtnbIqzOiVeE2iinyFGt6Te
	IPxX6qEMZ4+HnFqWyKIMM+xFXFUB/9zVywU5QaJjwDxufX3tKkpoBfAei34jrnZeYa3nmp+EXy8ur
	inZpUPAo5L/+zCXfCCEgzAW/JwzIs2PGrCrMdYnWgl2Sff0N9J54P944XxLR6bZ43kBVf9zaL4N07
	Ko8ZtNX8v/+7ENigzPdrjp84sdMPVUpKj5qCDYjYcPOM6Z0jD5bDfHwlaDrptTqN7PX/r3fZoEiC3
	zKfeWR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNjGN-00000007Do4-34dI;
	Fri, 15 May 2026 03:30:59 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNjGL-00000007DnQ-2UUT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 03:30:58 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-6314a0eefb1so2360175137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 20:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778815855; cv=none;
        d=google.com; s=arc-20240605;
        b=LpdcuAqv0umWjOWPzoYT/VXkb0JugVqsEqXIujsmxTw5s1vUaPZG36VPDTfT2sjptz
         vuXeOUs6xl2Z9ckYGDbzWdimk4dL+HkKIpiQLu8hb4ipoQqRoNf4Ec1mUSGTH+tHJk5D
         3wn77MSTC2efm77DKYF+b3zP7Xp0c+cJLE718ac6Rw4sQwnynXtgyBaP08xvVfLfSyDO
         1Q3QCPpVfteOFfwAWV2BeSPG4uw++0Ds44buQs5RTW8aqQMVNqaE6hg7nUUA5weXC/94
         /QbJ+H3w2BFRPhDLMlq9Uva3glmHOskntGyGnOIQN9bVbKcOx/ohwaTmdx9Wbn0NonBK
         s0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fop7pjzudS6D7wpF5+eicnKfmSm+O2A+twiw3O1334U=;
        fh=1sr4sUo5QzmbqNmeTsI4mqvLfhlYL/Sj3ncdDHrmhtg=;
        b=OFNzl2xzMslanNQqX7KuIfhUBhs78a1wyoiIrSqvBs2JqnCh2nf+8m7jyD9K+XF5GO
         CmTWQm4iFXk3lKVxdqJDjGggTvoWjA/ionkQ1tzckMoFs1ocpNH87N14ctn8zZ9kbWuu
         VjUpXJMz3PWK6QtNJQtufMJ+9HWaK7Fl/1akT+yPl/A3ZhXH2YkdEnt6WYdOgtsGIdoM
         3HadBPtwvlNFfHvqTuhbOGaAyc0xfLwTQitdzCv4LF0UbS4ystq+Tpzggc50VX991lZA
         M4kzhw0WPB/i3MmOQne3Lxp+kyvvG2/5LF1pRgU37vBBjahq5zrcksv9yTugOgDeVVVa
         3tEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778815855; x=1779420655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fop7pjzudS6D7wpF5+eicnKfmSm+O2A+twiw3O1334U=;
        b=jDTN7FuAQl11vZPG/tG2QzY7WNcqBkqaGCnTf2nHsAwB0EoAOIfFui/fsZBkE0yLpd
         264oFm77rJSxqHBjcitV5q99bl6py+FIfoK4Dbb4EOsg/3kwXjMH2dL7NbUpGj+TfIR5
         g3JRupOsHCDw9PT4PGuBGJnbeRcY76NhRJ5GHrNcAsnS4LZc0RKUNn/O6bL67KpcE0xG
         jR4gr6JC6WqEbiyg/gqT+I27z0mvzOumB8Ls8X5rbGS67SkGwzPubH3o9ENDQmx1t74W
         szckg7KNIv8KpWCyyYw4T3knlSuwjCU/JaRbq2g3YwphFwwPL4pU8cgIQIYW4I3sRXCu
         EKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778815855; x=1779420655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fop7pjzudS6D7wpF5+eicnKfmSm+O2A+twiw3O1334U=;
        b=D57AvnIGL2FQob439rxxg5mkUVJRba6FoYlZhkroLZDlJKFXljjYZA14ucUDk+o36a
         mV7kQvT9+ueB40CMo/TtNKqBq1Q29Y19XkIYrD00cRjSo79L5X6AuEbs/IOTe4MqRe+K
         nG1Dc0W6dvbZJGBZ3yfU9t9eIl9RxanhRBsl7GI2IYHCoIX7YNjKd1/RREVa8tFDOil+
         ThwhucmsQe8LMfavNdA/4WIgfJcNI+HRF2/QKBgS5XuXmhb856YGfaSqSnIPdkfhRy6M
         7gqRO2TAvXQNWzOegXpunIZIvrqdcH1L9wTVqgFN/lnp5teICQDbV5+fcfT07pk+/OBq
         3jpg==
X-Forwarded-Encrypted: i=1; AFNElJ9GWPCIyToNS33fszKmp40HnWvrO0/6OvuRJSpwCvx6Cf7lQvwMyAnaHouhrU0d16rhW57S6/LC3LQH/O2VafyK@lists.infradead.org
X-Gm-Message-State: AOJu0YzKFWgU9ce4kzBDmuc9JZSUqxM8bt+rmK5/mOCVuwlPcaeLAt+j
	H6MAOXyP265UYtIBYjw+n0MK2Ro4XottGy4QxpIf/IKN0bQOFQpGpIxHGZtj15X1/LCbmy6lig0
	wzRf0HvbtomLqj3dtJFN5K+UZTVOqDAn5RIQBLsdn
X-Gm-Gg: Acq92OEdSi4+CufP3EplQwt+z2AiVeL4BVB5kYmdXMgZeBc3T/ugJWxLgaKamx4rh6K
	gTOpocMynPFeTcOBpmqMvZ0kQe8ck2LWwoThAE/ZDEZ3P72B5Z6k/nuekyNArfx5tiiyvR8jIrx
	G+BRhf4G9MGCCKDfxm22tZkYt696HlZ1zq4xmTimzY1jTVh1PZnwjsFKkKNXESN/QP32kby3sWK
	LeTqU1n9Ypp4tIeBdVk+vYD2pUkQ7Y3B7KcduCwxE3KGTL80O8HrQ66sBMqLMMhhWLYgEuEGIH9
	n2UMOlwVxMf8LGmAwg==
X-Received: by 2002:a05:6102:1625:b0:631:2dc6:2f5c with SMTP id
 ada2fe7eead31-63a39b64e5cmr1060585137.0.1778815854791; Thu, 14 May 2026
 20:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <20260428183643.3796063-4-dylanbhatch@google.com> <afIjFLbUrdxWA6eR@J2N7QTR9R3.cambridge.arm.com>
In-Reply-To: <afIjFLbUrdxWA6eR@J2N7QTR9R3.cambridge.arm.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Thu, 14 May 2026 20:30:43 -0700
X-Gm-Features: AVHnY4IjCZOnrcRB6EchAvXRAgsUMT_fI25-8QVgnLQEfY3rQYsW4VZ_r7tS_bA
Message-ID: <CADBMgpxBeYUdA5X8BPgkgz=KQyN=NQ760bXygwXfvVRScNzgbA@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] arm64: entry: add unwind info for various kernel entries
To: Mark Rutland <mark.rutland@arm.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_203057_647786_22B03106 
X-CRM114-Status: GOOD (  24.42  )
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

On Wed, Apr 29, 2026 at 8:26=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> Hi Dylan,
>
> On Tue, Apr 28, 2026 at 06:36:38PM +0000, Dylan Hatch wrote:
> > From: Weinan Liu <wnliu@google.com>
> >
> > DWARF CFI (Call Frame Information) specifies how to recover the return
> > address and callee-saved registers at each PC in a given function.
> > Compilers are able to generate the CFI annotations when they compile
> > the code to assembly language. For handcrafted assembly, we need to
> > annotate them by hand.
> >
> > Annotate minimal CFI to enable stacktracing using SFrame for kernel
> > exception entries through el1*_64_*() paths
>
> I thought we were only consuming SFrame when unwinding an exeption
> boundary?
>
> We shouldn't be taking exceptions _from_ the entry assembly functions
> unless something has gone horribly wrong, and so I don't see why we'd
> need CFI entries for the entry assembly functions.
>
> Am I missing some reason we need CFI entries for the entry assembly
> functions? I strongly suspect it is not necessary to add these, and I'd
> prefer to omit them.

I believe the el1 entry functions are called in an exception, and are
called before call_on_irq_stack. Example stacktrace segment:

[  262.119564]  handle_percpu_devid_irq+0xb4/0x348
[  262.119913]  handle_irq_desc+0x3c/0x68
[  262.120196]  generic_handle_domain_irq+0x20/0x40
[  262.120678]  gic_handle_irq+0x48/0xe0
[  262.121005]  call_on_irq_stack+0x30/0x48
[  262.121412]  do_interrupt_handler+0x88/0xa0
[  262.121779]  el1_interrupt+0x38/0x58
[  262.122089]  el1h_64_irq_handler+0x18/0x30
[  262.122617]  el1h_64_irq+0x6c/0x70
[  262.123159]  _raw_spin_unlock_irq+0x10/0x60 (P)
[  262.123720]  __filemap_add_folio+0x200/0x580 (L)
[  262.124145]  filemap_add_folio+0xec/0x300
[  262.124674]  page_cache_ra_unbounded+0x128/0x368
[  262.125338]  do_page_cache_ra+0x70/0x98
[  262.125875]  page_cache_ra_order+0x460/0x4e0

Here, el1h_64_irq is the last function that appears in the exception
stack before _raw_spin_unlock_irq and __filemap_add_folio are
recovered from the saved PC and LR, respectively. So we therefore need
the CFI annotations in order to unwind through the full exception
boundary.

Is my interpretation here correct?

>
> > and irq entries through call_on_irq_stack()
>
> Needing some sort of unwind annotations for call_on_irq_stack() makes
> sense to me, but don't we need something for other assembly functions
> too?
>
> We can interrupt things like memset(); I assume we'll treat those as
> unreliable until annotated?

While looking into adding these annotations, I noticed a pattern where
a sibling call is made to a local function:

SYM_FUNC_START(__pi_memset)
alternative_if_not ARM64_HAS_MOPS
        b       __pi_memset_generic
alternative_else_nop_endif

        mov     dst, dstin
        setp    [dst]!, count!, val_x
        setm    [dst]!, count!, val_x
        sete    [dst]!, count!, val_x
        ret
SYM_FUNC_END(__pi_memset)

In this case, do we consider the stacktrace unreliable since
__pi_memset may not appear in the trace? Or is this not important
because assembly functions cannot be directly livepatched anyway?

Thanks,
Dylan

