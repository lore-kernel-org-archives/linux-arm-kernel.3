Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBCEE8304A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 04:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AYDOnVeyr7XkjmW69gqzpd4sgSElLWRSK0PUikLTaw=; b=R8QEhqW6K9FjO+uZhd2S8kPJoB
	EdnPyazQ1X4CSzYZ6p41yVJOAYzg/wfwuivA5my0GL78WzHz2QG9U87lFV+smfV/jMebA2JRUuynz
	cbjITs5RGtyNpnyzREwVsxtMs1FPSPISPlZd5Fjqq3+LPkRCJt8yTnEgoYJlus0PuQdI1ij6D0O5Z
	5beosclA393TbUDS9j/dhYlqFhrSjBFM6xh/AcgkExQUZJeWFQtdvE7g6+jpRtxBIY+tbtbnINuZP
	4lBdJBwEMundB78HnwPYijB3tqcSa7WsijtUP1eQTHV9++aTaljy5Y7GATwaQviHjQnFYxvifT3h8
	LW/v9jPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn8Nw-000000063zw-2TSd;
	Tue, 03 Feb 2026 04:51:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn8Nu-000000063zo-1wo4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 04:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8ACA7600C3;
	Tue,  3 Feb 2026 04:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCFDC116D0;
	Tue,  3 Feb 2026 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770094289;
	bh=vztEDDY5I/Z2WxelwAVH4Ye7ACWYcyxoY2rW84OdqMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thiESWPjK1xf1O+EirRXINuCiZij/qOhAY6hbP9dtc/OQoQCWPhA7bgfDS87ZGjMt
	 DPJQps4Jyhhjopsw46qlZYMPIFmXJ2TC27NvSAdIpQ814JQ2RZqUIc/En3evkPs7BC
	 kIesYpLSC4/ESGLt2BtcqjVNYTPU22YYVQ/YmiE3zWpZLTtUffRWeljLO+XH65uDtm
	 fsSAEorqja6ONipyPjQl9nMsl8ZK8jSyyA+y+D8O+7ypjft5WttVrI9mw7j2T4tFMh
	 9ppHjbKsyyZUUF8MXTI0zceUmWKivjlZ0lKhNQJtAFwgXndkChnt8F/aVypzzOkT3l
	 gXhCKgoxvRD6Q==
Date: Mon, 2 Feb 2026 21:51:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Nick Terrell <terrelln@fb.com>, Nicolas Schier <nsc@kernel.org>,
	Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/6] scripts/make_fit: Support ramdisks and faster
 operations
Message-ID: <20260203045123.GB3049363@ax162>
References: <20260106162738.2605574-1-sjg@chromium.org>
 <CAFLszTgQWjewjYHWUhG44em+deNY9xWDFz_YohduWvM=Bd_D5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLszTgQWjewjYHWUhG44em+deNY9xWDFz_YohduWvM=Bd_D5A@mail.gmail.com>
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

Hi Simon,

On Tue, Feb 03, 2026 at 03:45:36PM +1300, Simon Glass wrote:
> On Wed, 7 Jan 2026 at 05:27, Simon Glass <sjg@chromium.org> wrote:
> >
> > This series updates 'make image.fit' to support adding a ramdisk to the
> > FIT, provided as a parameter.
> >
> > It also includes a few performance improvement, so that building a FIT
> > from ~450MB of kernel/module/devicetree files only takes a few seconds
> > on a modern machine.
> >
> > For this version I have dropped inclusion of built modules, as there is
> > still more discussion to happen in that area.
> >
> > Changes in v9:
> > - Rename the variable to FIT_EXTRA_ARGS
> >
> > Changes in v8:
> > - Drop erroneous line 'kbuild: Allow adding modules into the FIT ...'
> >
> > Changes in v7:
> > - Add a note about the " -> ' change
> > - Add a new patch with the MAKE_FIT_FLAGS change
> > - Mention xz as well, in the commit message
> > - Drop patch 'scripts/make_fit: Provide a way to add built modules'
> > - Drop patch 'kbuild: Split out module targets into a variable'
> > - Drop patch 'kbuild: Allow adding modules into the FIT ramdisk'
> >
> > Changes in v6:
> > - Drop the load address for ramdisk, as it is not needed
> > - Bring back the ramdisk 'compression' property, set to 'none'
> >
> > Changes in v5:
> > - Fix 'use' typo
> >
> > Changes in v4:
> > - Update the commit message
> >
> > Changes in v3:
> > - Move the ramdisk chunk into the correct patch
> > - Add a comment at the top of the file about the -r option
> > - Count the ramdisk in the total files
> > - Update the commit message
> >
> > Changes in v2:
> > - Don't compress the ramdisk as it is already compressed
> >
> > Simon Glass (6):
> >   scripts/make_fit: Speed up operation
> >   scripts/make_fit: Support an initial ramdisk
> >   scripts/make_fit: Move dtb processing into a function
> >   kbuild: Support a FIT_EXTRA_ARGS environment variable
> >   scripts/make_fit: Support a few more parallel compressors
> >   scripts/make_fit: Compress dtbs in parallel
> >
> >  scripts/Makefile.lib |   2 +-
> >  scripts/make_fit.py  | 179 ++++++++++++++++++++++++++++++++++---------
> >  2 files changed, 145 insertions(+), 36 deletions(-)
> 
> Can this series be applied, please?

Who are you expecting to apply this series? It does not look like it has
gone through one tree consistently and it is not clear from the
addressees. I guess it could go through Kbuild?

Cheers,
Nathan

