Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F28D68BDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 06:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UFC4yjm46o/95pLz89SY2kNNNW5WrsmrncinmpRfao=; b=KK4KyrQig4WswXkG5joNYW/Ufh
	U4Qpnoxy6DC4qtutt5Xr0tdmM5kvz3mWYJZBsvtCzRzgRkK3s5RYGiGKJtVZrY+ZTVMpWIsygpN0s
	qKHjdYBdlBIIMqpHfG0psZYvk5+X2VjejOlWVwUfkdezv34MIRFvdFk2KWT4J4I5Wk0gKX6RPLmId
	dAxIbyDygByCQECXLnjH7wBRldLnDo2isD7Kpu8aVh+A+de2WdZu970LdItsOYa4LpsqyQhzhOCe3
	2G8hNib/wyQlwGcAFRJexoL3cz4NRQ/PClWNL8BVIXrIovzquM+DMQxauC+J9hQTKeoxOjA2MFOgq
	RdUhGZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7UB-00000007tbD-0h2U;
	Thu, 18 Dec 2025 06:27:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7UA-00000007tav-1SxD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 06:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50A9460010;
	Thu, 18 Dec 2025 06:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65953C4CEFB;
	Thu, 18 Dec 2025 06:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766039257;
	bh=YhIlSeZO2iMUWTxjdXd1CpKLs4JM1e3VWgkxEUxp0vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/2Syp7Fqq53yJmJnGnrgu9Dp+zKAbDVxVvr5TrRqj19dfUg685x1K+ITLg3BOaF1
	 3MGStfVKbldiBrrJtYGN5F2JQq1KCe08Kiv0D2zEZmek1pPkPfyoYmSVnMzFQpaVui
	 bnTD76IbZE/EGEMwIOTUUILpho7ay+OzuItGtPGM=
Date: Thu, 18 Dec 2025 07:27:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Doug Anderson <dianders@google.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Message-ID: <2025121847-swifter-pug-a1f7@gregkh>
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com>
 <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
 <2025121728-reliably-crabgrass-2601@gregkh>
 <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
 <CAD=FV=U63F-wxwKDo9be6_X2P2zp6aTBjNghZRbXX1rn4jFNyg@mail.gmail.com>
 <CA+zupgyG4Nov0=jihSApp_3_0hy6YNZMkfOp6Q4-zmERFm10Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+zupgyG4Nov0=jihSApp_3_0hy6YNZMkfOp6Q4-zmERFm10Ag@mail.gmail.com>
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

On Wed, Dec 17, 2025 at 05:34:37PM -0800, Roy Luo wrote:
> On Wed, Dec 17, 2025 at 12:14 PM Doug Anderson <dianders@google.com> wrote:
> >
> > Hi,
> >
> > On Wed, Dec 17, 2025 at 11:18 AM Roy Luo <royluo@google.com> wrote:
> > >
> > > On Wed, Dec 17, 2025 at 5:24 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
> > > > > On Thu, Dec 4, 2025 at 10:05 PM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > > > > > > +config USB_DWC3_GOOGLE
> > > > > > > +     tristate "Google Platform"
> > > > > > > +     depends on ARCH_GOOGLE || COMPILE_TEST
> > > > > >
> > > > > > There is no ARCH_GOOGLE in the tree now, so how is this supposed to
> > > > > > work?  Shouldn't tools that check for "invalid config options" trigger
> > > > > > on this?
> > > > > >
> > > > > > thanks,
> > > > > >
> > > > > > greg k-h
> > > > >
> > > > > Hi Greg,
> > > > >
> > > > > The menuconfig looks like the following and it doesn't complain:
> > > > > | Symbol: ARCH_GOOGLE [=ARCH_GOOGLE]
> > > > > | Type  : unknown
> > > > > |
> > > > > | Symbol: PHY_GOOGLE_USB [=y]
> > > > > | Type  : tristate
> > > > > | Defined at drivers/phy/Kconfig:104
> > > > > |     Prompt: Google Tensor SoC USB PHY driver
> > > > > |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=y]
> > > > >
> > > > > According to Kconfig documentation [1], the unknown symbol
> > > > > would simply be evaluated as an "n", which is what we want.
> > > > > "Convert the symbol into an expression. Boolean and tristate
> > > > > symbols are simply converted into the respective expression
> > > > > values. All other symbol types result in ‘n’."
> > > > >
> > > > > In a different Kconfig documentation, an environment variable
> > > > > "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
> > > > > undefined symbols in the "config input", but I can't find one that
> > > > > catches undefined symbols in the Kconfig tree itself.
> > > > >
> > > > > That is, the tool seems to allow this.
> > > > > However, if this turns out to be a major problem. I think we
> > > > > can either:
> > > > > - Remove ARCH_GOOGLE and leave COMPILE_TEST as
> > > > >   the only dependency. Then add ARCH_GOOGLE back
> > > > >   later once it's in the tree.
> > > >
> > > > Please do this.  I do not want to take patches that purposfully add
> > > > dependencies on config options that might, or might not, appear in the
> > > > future.  Please just remove all of the dependancies for now, as they are
> > > > not needed, right?
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > Greg,
> > >
> > > Yes, we can remove ARCH_GOOGLE for now.
> > > To clarify, we're not removing all of the dependencies, we still want
> > > to keep COMPILE_TEST for build tests, right?
> > > Please let me know if you think otherwise.
> >
> > I think you'd just remove all of them. Normally COMPILE_TEST just
> > allows folks to compile stuff even when they don't want the ARCH. We
> > can can add ARCH_GOOGLE back in later once the config exists.
> >
> > -Doug
> 
> Doug,
> 
> Thanks for chiming in. I'm hesitant to remove COMPILE_TEST
> because Greg specifically requested its inclusion in v7 [1].
> Also it seems beneficial to get some build coverage before
> ARCH_GOOGLE is officially added to the tree.
> Greg, could you clarify?

I wanted it in because it would not build without it on a non "google"
system.  But now, as that option isn't there, just don't have any
dependency, as it's obviously not needed.

thanks,

greg k-h

