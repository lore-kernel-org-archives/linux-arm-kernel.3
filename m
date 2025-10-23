Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C77BCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jj+Kif4dfrKe9mwz38YrsgAu4gm6A5BRFb4/J3K2e94=; b=XMwz7pDDY1+6aloCZn2UqcUW6X
	LdB3l0iEVy+2guuggNRlVnzY6W6p7VdbDrRUTLOX346w9VrkbC4eH7mTGDNK9Fl4MxuTB8kvChwbl
	LPE39F0eto/U4faZb3LOd3isY4lR3jFdbBnT73QXwyons0UZX53i8ByF+17qWrOGlFdtFwdMrELDz
	Hpxp5ExAvfTRaISJFZTcuVSKqf9HK7U6tSyUtHXDZGD2/nmnrHGQpRnhpIrVj8g5pY8e4mJbDikKP
	JOMQTxNRJCkKAxc1sESrvpfIUanW39GWwDzXQyYA2j4+XjaeOX5yH452V1+yA9qUp3pZKl2du6WKh
	pLeCkFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsPR-00000005r8D-3qCw;
	Thu, 23 Oct 2025 10:19:05 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsPP-00000005r6c-1ZfX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 10:19:04 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-87be45cba29so5772556d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761214742; x=1761819542; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jj+Kif4dfrKe9mwz38YrsgAu4gm6A5BRFb4/J3K2e94=;
        b=asWlB/QdotANyw+NRthab63SpHayJOIknmHz+oAoHnxP3F0HyxQ9Lt7KWvGhM6sa/Y
         XWOjAYJKAmbJRWRrYtI6b6bm9YTv7awPmNeIQ4DVEK2NWn+cc8jz/ydEyP+kDDcaawp9
         R/tUOYjjIAN4kHbhBAj9bjqsH0/7NxWG1n18lr2HFMqKQ2FEdMcSPujLj8bGehmYv9pG
         udt/xPYi6XcWZvipTdoj736I8f6xq2n1G5yplUZYS8pIJOHCy06lyyXMGxI2lJUM5AYg
         i7Eb/XcqzhHVMuESBXOepEkKPxNArLmKaDGXePBQZiCI5zEya04N+HdDH3cyOxyyyW2u
         nABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214742; x=1761819542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jj+Kif4dfrKe9mwz38YrsgAu4gm6A5BRFb4/J3K2e94=;
        b=dKfzWbPUdF4IeFPfvWIz9zLisePUy6qwNCOI7G/2zcbrmQDp+TKhYk3ec+M83c/e4e
         oH46PdtHNXP2/bDQxaIAliSiKtKxV8HzPvTt1Dobhl/2N2NZV70P8PUBRKYYMQvAUJ2N
         IOgQLw6hXGZlcOMfVoCMcAdA1TEPkBHn0M3cZe5Ut4iyeJxAFwPMMtemyGFJwxpsikoF
         FHxqGk5CsVKtkWKXi+8N9KmhWtgJjeH2aTNe5s5s5NPayEXlASXkNXCbi29pq5pZNRqm
         yrAol0/tbjm4IETpyI+IPKpeNscUCWtwFwIYK/Jlo4MYl4MHHYIE7ASic2Ez9CpiHlo5
         6BTA==
X-Forwarded-Encrypted: i=1; AJvYcCWadJrQ2Pd6zSivW4eonJfeGZLpKoWVWH4zekmYNkQmF+Xvr7qKUIjDwsSEDNbF9BeDztekmXdWkneZlRJ38GEB@lists.infradead.org
X-Gm-Message-State: AOJu0YzjhBJScZjkRPuT2r+oMPVlVuloLNxoURBkwhQt4wY5n/YuZPEl
	LLTLgALgam3C8uKs6CMM7Itj/ZmoG+Ckhd2oC7Llu6FBHp0rlGutyCuF1GBADXflWeub0TmkbcC
	hPrBJrSDNQ+cLgyxJ0JCX1QmS95xjin2C90VE+sSAYA==
X-Gm-Gg: ASbGncsJA7TeoGFCRrM57ccgoybFCQ2HLsXS9DH5Fvzu/ZyHSWS1leNI720E1dcj2DJ
	HlgR5GRkIwXb2i4nedXs/N0NPYsQQTS7GGmoqAQtwlLzFtaTpLfyM/kHRxGhX9x9ScHmWl6Q1pC
	9u2ijcVPh7c4hRf1nc9Vkp56RevyJ98DRmKkJ+/orGpNCNSuMzI79iGETo/sbXcO18kIkLaR26e
	WLayUvIq6q+L7gv28Y7bRe1HyzOvol05HZ0ELsfeHtXuVyYg92v9Iv1XITM9hjUsFZ90MkSgoJe
	S6YYRq0xmazQlPO0kg==
X-Google-Smtp-Source: AGHT+IHNhmQID8BxdTuPqUD1UOIaCU7OEog3sKm0kstXbUtDfJdGdBhlg02NR752jpqHk1Bz3E77Jj7bDJWs5M5CGgM=
X-Received: by 2002:a05:6214:2423:b0:87c:29c4:4bec with SMTP id
 6a1803df08f44-87c29c46f93mr338397966d6.54.1761214741816; Thu, 23 Oct 2025
 03:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251021234520.3355-1-mike.leach@linaro.org> <20251021234520.3355-2-mike.leach@linaro.org>
 <20251022092958.GQ281971@e132581.arm.com> <CAJ9a7Vi+Oq3Zma0Cs+w8m0kRE0pG6ax3=26EQK=u7d=vQfNFQw@mail.gmail.com>
 <20251022140409.GR281971@e132581.arm.com>
In-Reply-To: <20251022140409.GR281971@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 23 Oct 2025 11:18:50 +0100
X-Gm-Features: AS18NWCeiUa4aE_71Sz4zTfIuX-f8RyEZqLdNWyWeqNAXjkOZBf7qdkAOeOtddc
Message-ID: <CAJ9a7VggKoYdELcWTXxOg6-78TK2NAEE9uNo6cgpmx0x=0cwsQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] coresight: fix issue where coresight component has no claimtags
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, james.clark@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_031903_424094_103D9AA3 
X-CRM114-Status: GOOD (  31.44  )
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

Hi Leo

On Wed, 22 Oct 2025 at 15:04, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Wed, Oct 22, 2025 at 01:35:46PM +0100, Mike Leach wrote:
>
> [...]
>
> > > - We can add a new flag ("bool claim_impl" in the struct csdev_access),
> > >   by default the field will be zero.
> > >
> >
> > I considered a bool - but the correct place for this would be
> > coresight_device - where we keep all the information about the
> > hardware features.
>
> Maybe coresight_device is suitable. But this might require to update
> furthermore for claim function arguments (e.g., need to pass "csdev"
> rather than "csdev_access").
>
> > > - The drivers support claim tags call coresight_clear_self_claim_tag()
> > >   in probe (see __catu_probe() as an example), we can call a new
> > >   function coresight_init_claim_tag() to replace it, this function sets
> > >   "claim_impl" properly and clear the tag if supported.
> > >
> >
> > I considered moving this initialisation to the common coresight code
> > where we create the coresight_device.
>
> Seems to me, this is dangerous. If a module is not CoreSight compliant
> and claim registers are absent, when access we will get unknown values
> or even cause serious result (external abort or bus lockup).
>

Currently all our drivers assume claim registers are compliant - so
this makes no functional difference to the current situation.

If the hardware is non-compliant, and is bound to the current drivers,
then there will be an access to the registers that could cause the
same issues.

There is little sense in having a call in individual drivers to init
claim tags which are regarded as common management structure.
Any coresight component with no claim tags must still either have
registers indicating no claim tags or as per the specification
unimplemented register locations have to be  RAZ/WI - which amounts to
the same thing.





> [...]
>
> > > > +/*
> > > > + * Coresight specification defines a maximum of 8 claim tag bits.
> > > > + * The precise number is implementation defined, and may be obtained by
> > > > + * reading the CLAIMSET register.
> > > > + */
> > > > +#define CORESIGHT_CLAIM_BITS_MAX_MASK        GENMASK(7, 0)
> > > > +#define CORESIGHT_CLAIM_SELF_HOSTED_BIT      BIT(1)
> > >
> > > Now we only care about the self-host bit. Can reuse existed macros ?
> > >
> >
> > I feel that drivers should be written to match the specification - the
> > macros above are a correct mask value per specification and the
> > correct bitfield comparison for the MSBit of the protocol.
> >
> > The ones below are a protocol masks field, and a specific protocol
> > value that is used in value rather than bit comparisons in the
> > claimtag code. I felt it clearer to differentiate between the uses
> > when reading the code.
>
> How about change CORESIGHT_CLAIM_EXTERNAL and
> CORESIGHT_CLAIM_SELF_HOSTED to MSBit ?
>

The checking code for the protocol does a value compare on the pair of
bits, not individual bit checks.

Regards


Mike


> Thanks,
> Leo



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

