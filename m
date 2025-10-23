Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF68CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qd6nofyQmPMP1EYX1KtqHfLYsYPHKu5g4d0IvVjy8gc=; b=BjqCq9KEppwmJ4UL+rbqDW+tup
	FKmWP7wsb344vTrfsoL3cY98bo7lilvNOMSrZBn/fTkmKjqZKwEiCLgc/AnHjvO7r52vXurbQL7jf
	M0rHst40wQEGPeJrpDuFEQJ8yiXiuzjCBgO9+ptNXgfWyE4JkM+GYIyH/g0INbPACI1ljnwNcteFd
	VP2hep5Xl5WTGugLzpc0iAfRUpiamzL7Adyd1bgLOjTO2fYUwHprRmKD1gt/weDdSeoNuesJyDj5o
	2br0oAHJtRsbDnWUEexeOBSw65hDPLKq4HUfwn/F0mLPeWrwm2sjdsvwfsaKXbIqZquMVbi16WzSK
	gSI3lJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBt6I-000000060Sc-0uLw;
	Thu, 23 Oct 2025 11:03:22 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBt6F-000000060RZ-2439
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 11:03:21 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-87c237eca60so5217856d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761217398; x=1761822198; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qd6nofyQmPMP1EYX1KtqHfLYsYPHKu5g4d0IvVjy8gc=;
        b=BeU2c/e7efIZPGol2zj48NzWltPDO5xeyVlVy2MGbJCSL/kjHSwRQPf4mZEGvBhAM7
         R393snNwohXJGr+o3VvkADy8ByY06WL8nL9dlp0/M7PTjJRL5QsjsygN2ujMrD8eqKV3
         T20VkTmXMhzUb2aLDCnWyvwaXTWENX9pWWSYehpXfAg8peRRC3iiN1ynh5nedZWB++ts
         tzPNVS/VU8rbQFP9vaVPfEocVPIoCwqAdkb4GFUqWzxRi/4/Y7Luo8vxDfyMnq3h3/RM
         WSXzBHPG1/h/u+hWyZEsRY5z77+pk1gynhyzgOGzgFjovTomugHLISifIlJ4vaRR6GqP
         eK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217398; x=1761822198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qd6nofyQmPMP1EYX1KtqHfLYsYPHKu5g4d0IvVjy8gc=;
        b=aXuBRBSMGdrVxCHr68e6nsFx70CU8ECKdYW3yqh3bFLIbhyehRpodjdSwLNFrPa3uF
         J95G+9KeOqqUfZcTaEoSh6ocuivKbrRUMHilhbwRRbiMRvNWF0gWpmgCw/DCzT8Hr+w4
         egu1giyZRVcnDDW1fAONd4W5D4/wtFEFBnlPU2aYXgV9MXJihYvKrrg5WSHc6x227h6p
         QkXc+tq0BFIirbb8nE30yWmdFHobzBPaWAIebn5NPVtVVM+NdxGRZSj1un8/9sexPGw+
         bQWCgNGDzZ0guYCYhr1TDJi0td/hmbCdQEaUKB8xCp032EHwo+t0VixUGqjx9vVN5U9F
         6iow==
X-Forwarded-Encrypted: i=1; AJvYcCWFFMHe8HMmHjEDjBUV/Fb596dxcdGGA0ujnJfYYJHbGIkwgvYHOt0ChGMdvDwvm0HhdiQwuBljkRP4kyALNdkn@lists.infradead.org
X-Gm-Message-State: AOJu0YwhrmEL/tjyB7nt6rFAXUJ2s6/lQ+9iRoV2abuB3FHKKz61XGYB
	ulhN91NhaJAL32jDRqRbGibR1O22xap7+DYzbAX8U13eOtGHd4atsN14CuHZz4KjvEWjmpSmwP+
	JETjaCljxsd/N1wBHVFRJl5LjaI5KfH4hDPnD3d/Qgw==
X-Gm-Gg: ASbGncsHje6j73BYiWUhOxzx1ORPuKGvBN0Jvq3PoL6t4X8kgav3L7eJM3I9z5d6Y42
	uYSYIPkWErSCQDuu/TbnI9HPskfPKw/u6mnC288fD0fXCUOnJ+z6A8uzaNUa1QJuoFzEQSI0oMn
	k9pm9Z1aiHV5JTM/smgwUQPeouVCPvZOUmmDOzWyEYV55X26Otpg/RJ78ielzfCciU5uKa6M2ZZ
	agp0qGznKS52Avq27rRSY+MajFgVbAYsK+CbWqIOkdWSbDdHVY3SjSgO4mFlA3e/ApNCwlDM2zZ
	+4v/zew4Q88MZMrTiQ==
X-Google-Smtp-Source: AGHT+IHV9d7J3zGQsRNaBSZt8a244UoDZu83S8deEkcVFH8GGHgsbHEZ4VO1/ZD/vLF8Q+yv1sgVyCSVLM3mfuxSpHM=
X-Received: by 2002:ad4:5cc1:0:b0:7f1:62a9:ea2f with SMTP id
 6a1803df08f44-87c207f3275mr297371716d6.52.1761217398006; Thu, 23 Oct 2025
 04:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251021234520.3355-1-mike.leach@linaro.org> <20251021234520.3355-2-mike.leach@linaro.org>
 <20251022092958.GQ281971@e132581.arm.com> <CAJ9a7Vi+Oq3Zma0Cs+w8m0kRE0pG6ax3=26EQK=u7d=vQfNFQw@mail.gmail.com>
 <20251022140409.GR281971@e132581.arm.com> <CAJ9a7VggKoYdELcWTXxOg6-78TK2NAEE9uNo6cgpmx0x=0cwsQ@mail.gmail.com>
In-Reply-To: <CAJ9a7VggKoYdELcWTXxOg6-78TK2NAEE9uNo6cgpmx0x=0cwsQ@mail.gmail.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 23 Oct 2025 12:03:07 +0100
X-Gm-Features: AS18NWAtH5-3VwKbfi7bV4TtaV6PbrywDXGyOVNivd7Gv9MyDy--XlUXOaIQ5_0
Message-ID: <CAJ9a7VgOPgvzRmGg_a_W_LgFNVXBoxBH62XZar53s0W5c=4pvg@mail.gmail.com>
Subject: Re: [PATCH 1/1] coresight: fix issue where coresight component has no claimtags
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, james.clark@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_040319_566442_D326BD5F 
X-CRM114-Status: GOOD (  39.65  )
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

On Thu, 23 Oct 2025 at 11:18, Mike Leach <mike.leach@linaro.org> wrote:
>
> Hi Leo
>
> On Wed, 22 Oct 2025 at 15:04, Leo Yan <leo.yan@arm.com> wrote:
> >
> > Hi Mike,
> >
> > On Wed, Oct 22, 2025 at 01:35:46PM +0100, Mike Leach wrote:
> >
> > [...]
> >
> > > > - We can add a new flag ("bool claim_impl" in the struct csdev_access),
> > > >   by default the field will be zero.
> > > >
> > >
> > > I considered a bool - but the correct place for this would be
> > > coresight_device - where we keep all the information about the
> > > hardware features.
> >
> > Maybe coresight_device is suitable. But this might require to update
> > furthermore for claim function arguments (e.g., need to pass "csdev"
> > rather than "csdev_access").
> >
> > > > - The drivers support claim tags call coresight_clear_self_claim_tag()
> > > >   in probe (see __catu_probe() as an example), we can call a new
> > > >   function coresight_init_claim_tag() to replace it, this function sets
> > > >   "claim_impl" properly and clear the tag if supported.
> > > >
> > >
> > > I considered moving this initialisation to the common coresight code
> > > where we create the coresight_device.
> >
> > Seems to me, this is dangerous. If a module is not CoreSight compliant
> > and claim registers are absent, when access we will get unknown values
> > or even cause serious result (external abort or bus lockup).
> >
>
> Currently all our drivers assume claim registers are compliant - so
> this makes no functional difference to the current situation.
>
> If the hardware is non-compliant, and is bound to the current drivers,
> then there will be an access to the registers that could cause the
> same issues.
>
> There is little sense in having a call in individual drivers to init
> claim tags which are regarded as common management structure.
> Any coresight component with no claim tags must still either have
> registers indicating no claim tags or as per the specification
> unimplemented register locations have to be  RAZ/WI - which amounts to
> the same thing.
>
>

Having re-visited this - the cpu bound ETMs use a smp call before
creating the coresight_device so it would be impractical to move this
into the common code or use csdev parameters to make the checks.

The only time we claim  / disclaim is during enable / disable device
when we are writing many 10s of registers anyway. It does not seem too
much of  a performance hit to add one additional read per enable

Regards

Mike

>
>
>
> > [...]
> >
> > > > > +/*
> > > > > + * Coresight specification defines a maximum of 8 claim tag bits.
> > > > > + * The precise number is implementation defined, and may be obtained by
> > > > > + * reading the CLAIMSET register.
> > > > > + */
> > > > > +#define CORESIGHT_CLAIM_BITS_MAX_MASK        GENMASK(7, 0)
> > > > > +#define CORESIGHT_CLAIM_SELF_HOSTED_BIT      BIT(1)
> > > >
> > > > Now we only care about the self-host bit. Can reuse existed macros ?
> > > >
> > >
> > > I feel that drivers should be written to match the specification - the
> > > macros above are a correct mask value per specification and the
> > > correct bitfield comparison for the MSBit of the protocol.
> > >
> > > The ones below are a protocol masks field, and a specific protocol
> > > value that is used in value rather than bit comparisons in the
> > > claimtag code. I felt it clearer to differentiate between the uses
> > > when reading the code.
> >
> > How about change CORESIGHT_CLAIM_EXTERNAL and
> > CORESIGHT_CLAIM_SELF_HOSTED to MSBit ?
> >
>
> The checking code for the protocol does a value compare on the pair of
> bits, not individual bit checks.
>
> Regards
>
>
> Mike
>
>
> > Thanks,
> > Leo
>
>
>
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

