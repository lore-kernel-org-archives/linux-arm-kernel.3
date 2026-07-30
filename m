Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B5EC55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9wvIaksClS1jB3hklR/Msv5qmQ/ojOlrqo8+jkn6vQ=; b=aDzdLR9dy2+z48zJEh2Wl4ewRh
	5rAkTcv5QlGZcTAyrJo6lrSG1iHKrYf7G3oqGscCrlSpxd6EUuzgzqc9fqIUtzNHimsq+IgJKMH20
	lDWvtmMMvvWkU9726aWZ+uEEXK8bg+ZYZaRKE7i8LkqdSuAnEQMR184PSm3jgAXcKQX6tQQDP53vR
	dZYFxQ8+gyyolS79YN14mTsebv67/HxRv7n4IK3JWM1ELyqbvdAoTyx16LIFbpSVaLeNsmVej9APF
	56Uuc+jGNUlqnIdA5FkucWl/ZeOc8qZ81E3D4bEd86g0YaoDnfHOMZLpFYmPsWkHBGAUE8etFk9Mf
	CfiKpiWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTVY-0000000Az0p-187q;
	Thu, 30 Jul 2026 16:21:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTVV-0000000Az07-31zh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:21:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 687EF44FCD;
	Thu, 30 Jul 2026 16:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B676F1F000E9;
	Thu, 30 Jul 2026 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785428477;
	bh=f9wvIaksClS1jB3hklR/Msv5qmQ/ojOlrqo8+jkn6vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vPJ9CUUgL/+A/2/2zFeWe0+jlEx+O/0w5vk71RJ4KmWGMLkGVfZ81vi9T7l3eZ3L9
	 qWCIHptjOhjv+lJAcRjYraoe8LMZG7BeICluw2kWTgPa7AE8ntWWVP6BNuPA4B6gfq
	 XhaYe0CCG9+da8wV1G5HwWOW7S2tOZVR7N/7duT0=
Date: Thu, 30 Jul 2026 17:05:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Gompa <neal@gompa.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>, asahi@lists.linux.dev,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] firmware_loader: Add /lib/firmware/vendor paths for
 Apple ARM platforms
Message-ID: <2026073008-crane-jolly-2204@gregkh>
References: <20260730004759.3089449-1-neal@gompa.dev>
 <2026073019-emoticon-decidable-200e@gregkh>
 <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>
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

On Thu, Jul 30, 2026 at 10:55:00AM -0400, Neal Gompa wrote:
> On Thu, Jul 30, 2026 at 2:01 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Jul 29, 2026 at 08:42:58PM -0400, Neal Gompa wrote:
> > > On Apple ARM machines (branded Apple Silicon Macs), there is
> > > non-redistributable firmware provided in macOS that is required
> > > for Linux to leverage the hardware to run properly.
> > >
> > > The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
> > > touchscreen, and the trackpad.
> > >
> > > In order to ensure this firmware can be installed without messing
> > > with firmware provided by linux-firmware and other packages that
> > > put things in the tree, the empty "vendor" subdirectory was created
> > > to serve this purpose. This directory is used by the asahi dracut
> > > module as part of the Asahi Linux installation process to transfer
> > > firmware from macOS to the newly installed Linux system.
> >
> > Why is this needed when there is the ability for userspace to add their
> > own firmware search path to the list today?
> >
> > We aren't going to keep adding random paths here, please use the option
> > that is designed specifically for this:
> >
> > >  * fw_path_para - module parameter - default is empty so this is ignored
> >
> > Right there.
> 
> I was not familiar with this feature, and I had inherited the patch as
> part of our cleanup effort to upstream the Asahi work. Sorry about
> that!
> 
> Based on the documentation, this is the patch I've created for our
> dracut module: https://github.com/AsahiLinux/asahi-scripts/pull/72
> 
> Is this how it is supposed to be used?

If it works, yes :)

