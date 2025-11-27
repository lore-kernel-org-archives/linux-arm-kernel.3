Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9235DD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sx2lyoSFE0HBYyZaT9JBD3xAfR5cSeYMV0uXfqfE0Y0=; b=CBXvno+PSFb2CeH9oJFdkqDq1Q
	WSu9RFn+dniYtQf8MDYSdZBxbVBG1DAL/BPrh4EN2bBjeWSIzLgkFhH9UB39qFbFeJ5KgWKAGrO+g
	IWrTq+WtobCzsFUXSE0ywaiyX8PWpOEqM8khcXEMPCDmlRsJ+/iFyRqZ8cOl5ZCmChsIiMGsOD0Xk
	IuJUzzUEhCeFMibxKIQyE3F8t/1872wfIrqO/F1CrT2xBRVLUf8SNFIz0TIMQw0dx2N7JcDouktJQ
	77gwL9817dA/bj8PXAfO/laQaX51W3tcuDVLModgaQfy+9j319t9BbawtKZqAqUdi2yUOoo9IEPBa
	/Vtx9rrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZ2F-0000000GMMi-40FO;
	Thu, 27 Nov 2025 10:15:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZ2E-0000000GMMW-3Vpp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06A6B60182
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 10:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03F5C4CEF8
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 10:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764238533;
	bh=UJpbinbR1ahKG3Nc/yCahpF1FlBfQ3b445UjgzZUZE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QlxssgiX69krKHlr74WYp/N6dQHdbNDrQlBr7pgf6YPsFui6/T9bwa28C3q1F70Bs
	 nnaRL6Vom6ecjAqHD88Yv6OjpUC9OUp9GFpm+FXQERqg/ymQJWJ0ZfDJ+bHuhLlEuN
	 v2YVoxzuF2AkaIExu0n49XGlN3X88R0DdJGEHMn6iR14ePRivFEEhK6iVgIgETQORI
	 mEvzVGb/tdo/Eu+pMx9o/b/TK/+1GcEovnsL1Ztqf3bBgwlx9JmA+tASG7V5LCR2hQ
	 aVjlBVOgF6deUzNuXPfHL/VCtU9od73fVtMBm+mL55EZJfl0j+URI7S1RQFvJoyipb
	 G8kjG7awywHgg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37b983fbd45so4732911fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 02:15:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWa5O5/WdvP2//PAQCXEVfwPHd+aymj1kE0ayLm/L7AeCMQq4B8fpciv2XkceM1uNSo/3heCc6o35wKifyhnXMG@lists.infradead.org
X-Gm-Message-State: AOJu0YwiujTgZlpTd6P8HMK3XHZJ/QlkBWwsP7/spxrUOkfJteLYxPOP
	YBbHrkmg16CV6p5+ExDYxvN28cJqmTORCugV4W7nGi1hSQBqZRArIccM3qs5Qh65m6RekPBvTNT
	6tmhdF1Njl6IKw1DKtD/QlJKfRs6DFs0=
X-Google-Smtp-Source: AGHT+IEF/zqxtbTowSSIvVe0VYS+EaAMAqgfM/DJ3DSiONHaZO/ZPYdXLt3/VQD0SUb8pmSNkU+2e+YM2/saEGhdMyA=
X-Received: by 2002:a2e:3c02:0:b0:372:628b:5cb4 with SMTP id
 38308e7fff4ca-37cd929c848mr53322901fa.45.1764238532050; Thu, 27 Nov 2025
 02:15:32 -0800 (PST)
MIME-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com> <20251127092226.1439196-11-ardb+git@google.com>
 <20251127101129.204c6c5a@pumpkin>
In-Reply-To: <20251127101129.204c6c5a@pumpkin>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Nov 2025 11:15:20 +0100
X-Gmail-Original-Message-ID: <CAMj1kXETSPRO9BdUU2=jHn5O=tfB4wvwQE_i332KvEZaeCkTPg@mail.gmail.com>
X-Gm-Features: AWmQ_bkye94Cr_06CBrv4C4KNIVMtxpDibIKjZgz-At4e4NOWOBUacBwwxky0uM
Message-ID: <CAMj1kXETSPRO9BdUU2=jHn5O=tfB4wvwQE_i332KvEZaeCkTPg@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 3/6] random: Use u32 to keep track of batched
 entropy generation
To: david laight <david.laight@runbox.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 27 Nov 2025 at 11:11, david laight <david.laight@runbox.com> wrote:
>
> On Thu, 27 Nov 2025 10:22:30 +0100
> Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The batched entropy containers each have a generation field, to keep
> > track of the base_crng generation from which it was last reseeded.
> >
> > This use case does not require all bits of the unsigned long to be
> > stored: storing only 32 bits is sufficient to determine whether or not
> > we're at most 4 billion generations behind, which seems ample.
> >
> > So use an unsigned int instead: this will allow a future patch to treat
> > the generation and position as a single 64-bit quantity, which can be
> > used locklessly in a compare-and-exchange() operation.
>
> Probably best to use a u32.
> While it will always(?) be the same as 'unsigned int' it is more
> descriptive.
>
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  drivers/char/random.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/char/random.c b/drivers/char/random.c
> > index b8b24b6ed3fe..0e04bc60d034 100644
> > --- a/drivers/char/random.c
> > +++ b/drivers/char/random.c
> > @@ -507,7 +507,7 @@ struct batch_ ##type {                                                            \
> >        */                                                                     \
> >       type entropy[CHACHA_BLOCK_SIZE * 3 / (2 * sizeof(type))];               \
> >       local_lock_t lock;                                                      \
> > -     unsigned long generation;                                               \
> > +     unsigned int generation;                                                \
> >       unsigned int position;                                                  \
> >  };                                                                           \
> >                                                                               \
> > @@ -521,7 +521,7 @@ type get_random_ ##type(void)                                                     \
> >       type ret;                                                               \
> >       unsigned long flags;                                                    \
> >       struct batch_ ##type *batch;                                            \
> > -     unsigned long next_gen;                                                 \
> > +     unsigned int next_gen;                                                  \
> >                                                                               \
> >       warn_unseeded_randomness();                                             \
> >                                                                               \
> > @@ -533,7 +533,7 @@ type get_random_ ##type(void)                                                     \
> >       local_lock_irqsave(&batched_entropy_ ##type.lock, flags);               \
> >       batch = raw_cpu_ptr(&batched_entropy_##type);                           \
> >                                                                               \
> > -     next_gen = READ_ONCE(base_crng.generation);                             \
> > +     next_gen = (unsigned int)READ_ONCE(base_crng.generation);               \
>
> Isn't that cast pointless?
>

Depends on your definition of pointless :-)

We're deliberately truncating here, and the cast makes that explicit.

