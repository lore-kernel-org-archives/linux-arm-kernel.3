Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60BCC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ho6IdOLwOR5xdPY3ZhwEid3LOp7+TrBqvcaLDkvYkrE=; b=THdUe2d525o3E9y/avEd68ytPJ
	Z9s23RljtUWb0OzqHDbQYlD4K8dq1o+GxZvg4piaJpEogQSd6xnPhPpD+DFdspLWeLRp4Eujdu4jR
	Jd/+jAq2ayy8Ty4Tc5Uja6ODRD1sT5V4LzYZTQU12fGW6SYFSNemFbPGsbuib/TVL7UUTCRYDA8ps
	grQ4/ifd481+mr6aES0XRaB8cNvClhvEnrDZXtm1TZ839DPRVlQ7abkIrGDsUiQLrhgLVThrdHorS
	VFnz+u++pD3iIXF/jb3qmIowjoNVTu7/A/P5T6nthQBciTCvuMMNgUbIznT8p5FzdPFrmjtzX6QA6
	YcUHwPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vj-00000001MyQ-4B9u;
	Thu, 08 May 2025 17:21:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3vZ-00000001G07-1aQH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 16:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D401444D6F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 May 2025 16:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D4BC4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 May 2025 16:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746721012;
	bh=35IHPZXcocv+INe2DtbwMIQJtEhAwB7A8dA0hXmP7ZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c1Yypr+SXFpXjPCoL+lIj05HB3FKq1nH4hrD90x3zoujZlSRsureyk3YUY5UUkbsS
	 e9sf0PlV77Ki1TrdpnHITuNQ4fePPVIbNAOfHpYo3I3gsx/Wxeee2lt/O43V5Z2Ang
	 jIMUQUa+H+jq0cFtftkb/ApwoAXraai0zLggeKekP3Oz8fudiASyZkwtB59IJkHesW
	 T1lo/WQXnQGsOwco4QThqKaYuk/NJAE4BjVcyzlGAX1OksK6SpSBT5nbJXLJnVJxy8
	 NZ88u92xCye20Wp6GaIhbBvQNF+H3pnT3imRdRNs+P2WBO8cqYwRszn0SQa5MmRwxU
	 ti+IHLqXHqqIg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54e98f73850so1288773e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 09:16:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUJ69iCWIXsiGo1C+a/LRxBU4eIDj1h8dTuRFytGXw5tN9vTHUyIqYhuRyilQYKn4pfE7cXzesIxX1mbfk0Ybi@lists.infradead.org
X-Gm-Message-State: AOJu0YyJv5cAJ7ZtQexupL5u9R2YfrakQUvQ7uGuAkb86SKh1aoEX/1d
	eWid9Iwxzdv2ZUeVmANJu5G8MpJi0WebMQ70Q9w9ANvMXcnsDmFqxuZNyghCFBSB7Dln0eGOYw4
	JhX/ixscGqzOMySvG65Eu2QRdXJw=
X-Google-Smtp-Source: AGHT+IFKz/ckT5Zb25NskasD9LKoDkkk10cz44ASE2I4Z+LtrM0t4fPT/Y/KGywhIG6AQHLqxj9ENJIrEaHfPC+fO6A=
X-Received: by 2002:ac2:4c4c:0:b0:54d:65cb:6c28 with SMTP id
 2adb3069b0e04-54fbfc0c942mr1515401e87.9.1746721011096; Thu, 08 May 2025
 09:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250507170901.151548-1-ebiggers@kernel.org> <CAMj1kXEPvPKg3i9NkaYN+m4pGfw6P05g-H6_Dmb3AsQyRmU7MA@mail.gmail.com>
 <20250508160523.GA1218@sol>
In-Reply-To: <20250508160523.GA1218@sol>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 May 2025 18:16:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGH8mGbw8HtP_zW+JPHrV8vyk8N0hoaLTKChmsxz1qRvQ@mail.gmail.com>
X-Gm-Features: ATxdqUHiore7uw6Nb04dKvam7g-4ZOS_P4_x-pgXSnplyh0XT1bktUC_VERVSgQ
Message-ID: <CAMj1kXGH8mGbw8HtP_zW+JPHrV8vyk8N0hoaLTKChmsxz1qRvQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: arm64/sha256 - fix build when CONFIG_PREEMPT_VOLUNTARY=y
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Thorsten Leemhuis <linux@leemhuis.info>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_091653_454914_D15D60B4 
X-CRM114-Status: GOOD (  27.76  )
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

On Thu, 8 May 2025 at 18:05, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, May 08, 2025 at 01:12:28PM +0200, Ard Biesheuvel wrote:
> > On Wed, 7 May 2025 at 19:09, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > Fix the build of sha256-ce.S when CONFIG_PREEMPT_VOLUNTARY=y by passing
> > > the correct label to the cond_yield macro.  Also adjust the code to
> > > execute only one branch instruction when CONFIG_PREEMPT_VOLUNTARY=n.
> > >
> > > Fixes: 6e36be511d28 ("crypto: arm64/sha256 - implement library instead of shash")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202505071811.yYpLUbav-lkp@intel.com/
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > >  arch/arm64/lib/crypto/sha256-ce.S | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/lib/crypto/sha256-ce.S b/arch/arm64/lib/crypto/sha256-ce.S
> > > index a8461d6dad634..f3e21c6d87d2e 100644
> > > --- a/arch/arm64/lib/crypto/sha256-ce.S
> > > +++ b/arch/arm64/lib/crypto/sha256-ce.S
> > > @@ -121,14 +121,15 @@ CPU_LE(   rev32           v19.16b, v19.16b        )
> > >
> > >         /* update state */
> > >         add             dgav.4s, dgav.4s, dg0v.4s
> > >         add             dgbv.4s, dgbv.4s, dg1v.4s
> > >
> > > +       /* return early if voluntary preemption is needed */
> > > +       cond_yield      1f, x5, x6
> > > +
> >
> > This will yield needlessly when the condition hits during the final iteration.
> >
> > >         /* handled all input blocks? */
> > > -       cbz             x2, 1f
> > > -       cond_yield      3f, x5, x6
> > > -       b               0b
> > > +       cbnz            x2, 0b
>
> cond_yield doesn't actually yield, though.  It just checks whether yielding is
> needed.  So the behavior is the same: on the last iteration this function
> returns 0 (i.e. 0 blocks remaining), regardless of whether it gets to the end by
> jumping there due to TSK_TI_PREEMPT being set or by falling through after seeing
> nblocks==0.  We could keep the nblocks==0 check first, but the cond_yield check
> is lightweight and it's probably better to avoid the extra branch instruction on
> every other iteration.
>

Ah yes, you're right.

Hopefully we'll soon be able to get rid of it entirely.

