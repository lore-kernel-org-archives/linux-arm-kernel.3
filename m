Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E733CCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3vy2y7L3kPE58fCukjhM9NjJEBR+78/a8BS7ldleJo=; b=t/5JNhN011TF/0uO5iFiPdXffR
	6MK36F8ACOtuQtzEQaiEZIlmNW1wcwMVSy+xptKMy98IdyXPJzV/1WaXHj4RVBrD53/ahBrEGfhTD
	SxlKPpK7tQIi1z1yKcd9tLFVKWmjoT7xYX2gv6TulSYG2KhkYUe5dqMSq1zLBsgLGTznDIJLQkQ49
	i6qOPyWSYhgYs7o3Yynfh365g5rp9YADaBO3PdW/On1wLOh2NoUPXkhHRiJXafdhfx0aBu5U2obzZ
	Y14FsbY7v5Avtm5yK00ZWl8Utqz/LErfvp3PkPrcMuGuwj9Yp8uIOHEF7Nn3aRP2MniYFmZBfPbCe
	IVTVhKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTbI6-00000009MfN-17od;
	Sun, 31 May 2026 08:13:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTbI3-00000009Mf2-41NV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 08:13:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 64329406BC;
	Sun, 31 May 2026 08:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97301F00893;
	Sun, 31 May 2026 08:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780215179;
	bh=v3vy2y7L3kPE58fCukjhM9NjJEBR+78/a8BS7ldleJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aVVGjGywLCBbgFBMmc+J7+KfGIZ2b3bZc/5QrNuDeREfmpl9xBqIMimr2dsDIY2Ml
	 MEB7cZTqmy+SdS0FTqWsBEbRoY9uwSWWRaQpr1MNksAxHs7zMB1yCXh0FaRHAIRUH0
	 bQjqrKKmGsTIkzAMwnjENtmK9XCpBYJKlK77nijg=
Date: Sun, 31 May 2026 10:12:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCHv2] serial: mxs-auart: fix probe error paths and clock
 handling
Message-ID: <2026053149-baggy-reaction-ff9d@gregkh>
References: <20260530195525.5059-1-rosenp@gmail.com>
 <2026053127-nastily-fool-88eb@gregkh>
 <CAKxU2N8bNT+irM-gOk9SM5DHPbcbh7zvNM7n4wF5+q4TSEMkSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N8bNT+irM-gOk9SM5DHPbcbh7zvNM7n4wF5+q4TSEMkSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_011300_020175_8D27A5F3 
X-CRM114-Status: GOOD (  16.51  )
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

On Sun, May 31, 2026 at 01:00:21AM -0700, Rosen Penev wrote:
> On Sun, May 31, 2026 at 12:52 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, May 30, 2026 at 12:55:03PM -0700, Rosen Penev wrote:
> > > Sashiko reported three pre-existing bugs in the mxs-auart driver:
> > >
> > > - For non-ASM9260 variants, mxs_get_clks() obtained the clock but never
> > >   prepared/enabled it, leaving register accesses in probe at risk of
> > >   faulting if the bootloader had gated the clock.
> > > - The error path and remove function used pdev->id instead of
> > >   s->port.line to clear the auart_port[] slot.  For DT-probed devices
> > >   pdev->id is -1, causing an out-of-bounds write and leaving a dangling
> > >   pointer in the array.
> > > - The probe error path called iounmap() while the IRQ was still
> > >   registered. An interrupt during that window would dereference the
> > >   unmapped membase.
> >
> > This should still be broken up into smaller pieces, don't you think?
> >
> > Whenever you have to list the different things you do in a patch, that's
> > a huge hint to do so.
> I'll do so. Although I doubt the bot will be happy either way.

What bot?  Yours?  If so, please don't use it.

