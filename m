Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638F6E8B367
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJj3/QP6caTVis5Rz+kzf4H/oWtK4J3y31szogVsajQ=; b=dRR3XjwZRswF+b0GHoqLnnqORI
	59J7pTtSgJdSWWg5KmQRy5TjUMBwezfXliLcR+7r/of6vul0fnPGDc3PGMmPO316zC/wyMEj9XyzY
	RwIZGk7NeGynindMM+9qCck0Hw3p7RMrtxcwtxQy2Plim3cvvA9YWvbCAVy35ikrPUrOY4xgJMK6j
	7hyeld+GDHHAMdup0p8wd7kqlTeBg/M3fiF2NZNjGZMHc1bnaCD4jGBLjfSlXOkSLWRCGxkWlhbH3
	Hpb8IMVB/TCLPmXJUhW48BxmkYfp/y4ctEYn2dKQZTzgQHpR1ueqZcEZkDOMlhe2eLAfB9jVS0tJh
	A0zti8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOQW-00000007SMw-0hPk;
	Tue, 03 Feb 2026 21:59:16 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOQQ-00000007SM3-275E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 21:59:14 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so9006053a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 13:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770155948; cv=none;
        d=google.com; s=arc-20240605;
        b=EGO5faO/Kb06kyjcVwUo256LL2TxcljJW7kqYW1+j1FQXI+qwHVq/ixX0yX+z3cYpj
         YqWPf3oqu7XBOT6YsuVmrVn18fRax4ZYO119UOuu64jZbEs0feobBobNR4w6BNNRaCBY
         UG1Xr0UKb66Ieot7anX3VNUjS3vldI/wnat6f9QteL9skHAgGnkO3e0gZmPdOvRN0kU3
         4SqIk+I3jv0t+csM5p72FLv+gNGvqWWs/T4cDeNzYxx6HY+vkaMtJ5ucyJcmTrEtvDaf
         LN9NZltCFQr8HY+ol22WCH9Yi09bIuoFLdoWwVqdq7GJcZgiFp/DCT4W5mJ6/OWCKbM+
         s6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HJj3/QP6caTVis5Rz+kzf4H/oWtK4J3y31szogVsajQ=;
        fh=FJK59t+KdetN5QG0TsLkLEKtzzULEWWpGNR7J9Bxve8=;
        b=LIW4FC9B60/WjjY8zsmqcYGx7pdUV2BGAzchwZ7QI+GtvJn2IcLbBN7av9org8faFy
         PShsXwftCLRJa5+Wnpj87rB97DbZQPHUPl+2AVunjIfmW2kbZmTqOtpdwXFrM5zrAz8z
         9VMKHrQ0c0nnPVLBmAfs/hIihCurMRkmwg5t68ixcQL1ksBTKkLzgx4G6Bnc3tFs0uv7
         FuMQIncHe2NL4yAqqTTxdG08Lu5hbEQTtwYtvsYVPYQdpV1HIfi/L/0XLLs2oYsWm2c0
         beuoj8QU+MxJuh9a8ym/wIWl69iQ2XvOJt9l0Xv6WEKEEdEMMCzG8Xb8/ae0mAmiVnVo
         eE6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770155948; x=1770760748; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJj3/QP6caTVis5Rz+kzf4H/oWtK4J3y31szogVsajQ=;
        b=gniArbwHujo+r5Mb8/g5ccW6B1TqGoGjZmHbwp6LD8qi709giF1N8yPH++W40C7z0l
         ZSnauap2SvhsMLgqOaneBKDXHrTz8eY+m/F2jqCPJOdXXUNmCnXM2R3bPD7ckyadpIxl
         2O6XAV0B8Bx8WScaNRY/Zih80wpyfjWOijKkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770155948; x=1770760748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJj3/QP6caTVis5Rz+kzf4H/oWtK4J3y31szogVsajQ=;
        b=kn5CIWI33VdIRE3yFf4WS5wrU9S3GxQYPP1XuZfkg77hXwMkCdQj8bvbxfpip9ASb1
         FZtEYvUdwFiqdycieVKfDA91IWj/JWlvYPBEM9h4iXe1MRSbJle+LZm8x7dvuLDoGArG
         8z2CpJqBJ61Y47GpZWZVkI7eSQBkbTV6CWXlp9OgHw8HoneOMm1PrWw5jovGLnPDID0S
         L3E8a7gsQf4D/Mx8+h1jWDbACg5gDlChDNG1eZDO4oe1SiCG3ey8lNH2GJw1pKPfVesG
         240M6mZKLqTdnnDO8r8vb9wQvYBCoc9cFA0NH3FX/9l0HbfXsGTjS+epBg1tRLKMMQms
         9r4w==
X-Gm-Message-State: AOJu0YzgTecAyvvktbeHylKBU7qvilXyj8lUUDtUnf7BDF69g/B4POKq
	cQD+SZAYnAKeHx4qEjtCrxWEEnQhxuJ6UDKTS/1EKo7PkPUn7aGJJFTqhJS8dYT+a1E/RieS3lN
	lX/Tyqxd475IQclq1vF40BJJsy1TBuUTU5t87epzY9/bWMI3SEkDfEg==
X-Gm-Gg: AZuq6aIuy2IQ1l2Jqmn9xzzpB3JQcevJsfpKVhFzWTwv3X6cdi9WNdbSNKR2YmslhmR
	UJ2ksxQUVXqIRGRop6J7MUdZnG+XKShq5OZlzcfQXnJo0HrwYeOHo/EH9BaTHi0uaKDM9Re3MDE
	nMIW7HZqDhxUDYNn2nGLIlL3IDv42fyslBktxmcfJwC160xoNhnI3Pf2QZHuhkMon6ZSxQitS0M
	Mgxs47V6/4cBvLCbDzvPDuKnRROeX8mbktUBeIe2SOiOEFKwWv+CtSk76CFo3XNlzvGZbk=
X-Received: by 2002:a17:907:1ca1:b0:b87:1d71:f44d with SMTP id
 a640c23a62f3a-b8e9f10a4damr57769066b.11.1770155948501; Tue, 03 Feb 2026
 13:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20260106162738.2605574-1-sjg@chromium.org> <CAFLszTgQWjewjYHWUhG44em+deNY9xWDFz_YohduWvM=Bd_D5A@mail.gmail.com>
 <20260203045123.GB3049363@ax162>
In-Reply-To: <20260203045123.GB3049363@ax162>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Feb 2026 10:59:11 +1300
X-Gm-Features: AZwV_Qj3mtvlK51npKsxvp0S4DmwpPor2j5UgXAtFx_-Gz--puhV1FjqYFXFZsc
Message-ID: <CAFLszTg3aDQoSj5YcszYQGWP85V85jvcL4uw611m66Ek8L9Eow@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] scripts/make_fit: Support ramdisks and faster operations
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	=?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, David Sterba <dsterba@suse.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Nick Terrell <terrelln@fb.com>, Nicolas Schier <nsc@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_135910_709340_E5C8094B 
X-CRM114-Status: GOOD (  31.47  )
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

hI Nathan,

On Tue, 3 Feb 2026 at 17:51, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Simon,
>
> On Tue, Feb 03, 2026 at 03:45:36PM +1300, Simon Glass wrote:
> > On Wed, 7 Jan 2026 at 05:27, Simon Glass <sjg@chromium.org> wrote:
> > >
> > > This series updates 'make image.fit' to support adding a ramdisk to the
> > > FIT, provided as a parameter.
> > >
> > > It also includes a few performance improvement, so that building a FIT
> > > from ~450MB of kernel/module/devicetree files only takes a few seconds
> > > on a modern machine.
> > >
> > > For this version I have dropped inclusion of built modules, as there is
> > > still more discussion to happen in that area.
> > >
> > > Changes in v9:
> > > - Rename the variable to FIT_EXTRA_ARGS
> > >
> > > Changes in v8:
> > > - Drop erroneous line 'kbuild: Allow adding modules into the FIT ...'
> > >
> > > Changes in v7:
> > > - Add a note about the " -> ' change
> > > - Add a new patch with the MAKE_FIT_FLAGS change
> > > - Mention xz as well, in the commit message
> > > - Drop patch 'scripts/make_fit: Provide a way to add built modules'
> > > - Drop patch 'kbuild: Split out module targets into a variable'
> > > - Drop patch 'kbuild: Allow adding modules into the FIT ramdisk'
> > >
> > > Changes in v6:
> > > - Drop the load address for ramdisk, as it is not needed
> > > - Bring back the ramdisk 'compression' property, set to 'none'
> > >
> > > Changes in v5:
> > > - Fix 'use' typo
> > >
> > > Changes in v4:
> > > - Update the commit message
> > >
> > > Changes in v3:
> > > - Move the ramdisk chunk into the correct patch
> > > - Add a comment at the top of the file about the -r option
> > > - Count the ramdisk in the total files
> > > - Update the commit message
> > >
> > > Changes in v2:
> > > - Don't compress the ramdisk as it is already compressed
> > >
> > > Simon Glass (6):
> > >   scripts/make_fit: Speed up operation
> > >   scripts/make_fit: Support an initial ramdisk
> > >   scripts/make_fit: Move dtb processing into a function
> > >   kbuild: Support a FIT_EXTRA_ARGS environment variable
> > >   scripts/make_fit: Support a few more parallel compressors
> > >   scripts/make_fit: Compress dtbs in parallel
> > >
> > >  scripts/Makefile.lib |   2 +-
> > >  scripts/make_fit.py  | 179 ++++++++++++++++++++++++++++++++++---------
> > >  2 files changed, 145 insertions(+), 36 deletions(-)
> >
> > Can this series be applied, please?
>
> Who are you expecting to apply this series? It does not look like it has
> gone through one tree consistently and it is not clear from the
> addressees. I guess it could go through Kbuild?

Yes, that's what I was thinking.

Regards,
Simon

