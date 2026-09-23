Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886B4C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/HoST3GzR63df+Uvj/3fSC/SiRAcz85RlsI38ulKQY=; b=Auapo2J0XRqPDAKHv/NYEK+d+z
	9prP9Fi47NzLMJnCTY77aHl2nfCAA/QONTVtLKRhdll4njBj8j9CB6bZTLV+wudmHXz6Q+VZSubMn
	PmgW03yVhV0vjjvTW8GtikiNoXFGDDRrVPizmoQzCLwo5rWTCxDRzaHL+eChkD5oHHJVbzQqYAk1y
	dlmflIOjb+HMEe693Xq7bGScg11rNcyo64XnhY0xz/32uYqrqf39fE2VclDnPQxuSQIayl3yurZEW
	VIgRvuLWeRDBd5aSsQ/TyNVve8RlH+hyG4H4hINbTS+dhEsRmqLsX2zgpFKCuS3IZGoR2YsgEmGds
	3Vaxz4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QbZ-00000008zao-2L1i;
	Wed, 23 Sep 2026 17:18:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QbY-00000008zaG-1sgT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 17:18:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B1D3602C4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 17:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543521F0089C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790183879;
	bh=5/HoST3GzR63df+Uvj/3fSC/SiRAcz85RlsI38ulKQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kPCf4TPpXdG00im1YFmuExugL12qlxr5eXpZhHYpKLJPAjjXg/+c4jwYtYBlbDyXR
	 u1ilx+VZLfYhcrbJhfkcV/tridnYlResg0ohNSfnqycyf7A95bz+EDZTNMUZX00TwR
	 dY8MUYtS5wNk1p8YM53VAAnvczZ4XJEBy6q/ENiiNlUh7N4g0805MSdJ74VMP1otPX
	 z8fsc1jAA/UeweRgY0blN9J30y/HRANZ6u84qcAsJumJ+xoM0QPg8KIXmcHxg4mw8u
	 +FoHQTqc05UeWd3moWkRj+khB+rcUOS2jCQbeC64UlbTqjd29RCqqDTK811Q4G6tNA
	 nf+gaXqTo1dFw==
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae6f5fc7so645167eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 10:17:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwg1xyB+S7jnyATEG/X65afwU6wh81qumb066/6Uttm1nhHGR8iv8GOXnn4t94pwNWZRQ/5WTwMBTmFSG2vaomF@lists.infradead.org
X-Gm-Message-State: AFuF++k6NI1aqJAGLMOayvveebBf1OYwQaiQEjhKE91TuBx3RWKv9Kb0
	XnPi/PCGNIUH3T8PjGz0Xqa+6IwTTjp+6aiRtO9VSoCEGLLHxJ6oPBYUa3nUFhwWlKlhabWZDPs
	GomLeMofep0b4HMREfFV5DcXSEnKK3vo=
X-Received: by 2002:a4a:ec45:0:b0:6cd:3fdb:fa5f with SMTP id
 006d021491bc7-6d2d3110fa4mr2598258eaf.74.1790183878613; Wed, 23 Sep 2026
 10:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org> <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
In-Reply-To: <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 19:17:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com>
X-Gm-Features: AclHuK9qcxsg_lsJQiEmVWX238l2BVV4tmPh6rvzYQgz4V44D7-NMDrSTTn0z90
Message-ID: <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi Geert,

> Hi Linus,
>
> Thanks for your patch!
>
> On Tue, 22 Sept 2026 at 15:34, Linus Walleij <linusw@kernel.org> wrote:
> > From: Daniel Scally <dan.scally@ideasonboard.com>
> >
> > Add the Input Video Control Block and Arm Mali-C55 ISP to the device
> > tree file for the RZ/V2H(P) SoC.
> >
> > [Rebase onto v7.3-rc1, place the nodes in address order, and sort
> >  the interrupt properties. - Linus Walleij]
> >
> > Assisted-by: LLM
>
> Dear LLM: Please take into account the review comments on the original
> submission:
> https://lore.kernel.org/CAMuHMdVCeMaQ8yFnMgr1Nko+0yQxn69BR9fGJ2WPvADMc2gvRQ@mail.gmail.com/

Don't blame the LLM, it's me.

I didn't find Daniel's original submission, just noticed this
never made it upstream.

I'll address the comments and send a v2.

Yours,
Linus Walleij

