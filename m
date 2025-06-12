Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C52BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR0dRbES+djCk871EvFuYPXeaS3gynvrA8wMIo/eRkk=; b=sTMKrpnfW6AakhS3PgyQr/jE28
	FvHlGg8jTc1b+u0lgMNuJvQ3YPUGgse7eocDW1X6PfWjDCrUysCDo/F87h5WNOeB1gJQqU7KkM/Yu
	dRkv6kOW8dKLmuyrLBzvjHINN2m+88mNs8hGwoTdFmLecwq4ZaJQNLnJUG8YlUiWhsTw+/LCDpQTg
	gUWl5hS4vPPJgEaWKjiUKIrvMsnYfhhgesVAkWYFJI+3d8rfFkUNkiqdBRU79PED98DZcLoJQesgw
	3p+ATGZoU3/R+uyMaTEjxT5sqe9qvekQ39ketsASanf5EWNimTNj/Wkq4dujcgYtNz82Gy/9uebP5
	F5eyO7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7Y-0000000EkEE-41cN;
	Thu, 12 Jun 2025 22:10:04 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnJi-0000000ECL0-2GbK;
	Thu, 12 Jun 2025 19:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749755427; x=1781291427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQ0TV5Stz/vWyyu62ZhSbJbmlu58TvJYqNpEEOYBVC0=;
  b=Z9fdBnBxaQ4kHop2kZtkSzAkk9inYw5f12I71aXNGB9kgIhFiOAId3BT
   0cdswwDQDrdAmJZvdtWs6AK/Z5BIUG8lIBhbIRCcsDiXY3e8g9VBkin3v
   +Kj4vwdRrahYXLl2aq0pIND3oE7XNMEMaAc4TbV8jVQX3t2kFBzncUD1W
   GqwS7xT5KHvsAP3PysqOAPKz/0q9ersa1XdRoFkke4PpcxUMIDsW4O1pS
   c6lP6xs5atSEvQs1N6QgFCJw2jTuEdlKVLM1bW35Uy6XDuZxdx2nEOhUe
   4wgNQbQzTvHDkEkoHENgcoEmmPd5kK1ejzH7DK0hjb9w7v6A949jSMTe/
   w==;
X-CSE-ConnectionGUID: 1vQ6mywGTHedCjvm5zZ+FQ==
X-CSE-MsgGUID: 2E7fJDrgSheCL7MkXFQlng==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52093205"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="52093205"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 12:10:21 -0700
X-CSE-ConnectionGUID: e9iD3O3SS36bVUZFVNkguw==
X-CSE-MsgGUID: lSBa5jyTT9mJ70WAU7t4XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="184852801"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 12:10:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uPnJQ-000000061me-0q0g;
	Thu, 12 Jun 2025 22:10:08 +0300
Date: Thu, 12 Jun 2025 22:10:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	David Lechner <dlechner@baylibre.com>,
	linux-rockchip@lists.infradead.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
	kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>,
	Tomasz Duszynski <tomasz.duszynski@octakon.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Mudit Sharma <muditsharma.info@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Andreas Klinger <ak@it-klinger.de>,
	Petre Rodan <petre.rodan@subdimension.ro>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/28] iio: zero init stack with { } instead of memset()
Message-ID: <aEsmDyc44P8amm5p@smile.fi.intel.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <aEqbQPvz0FsLXt0Z@duo.ucw.cz>
 <2243943.irdbgypaU6@workhorse>
 <aEsiTy++yKGe1p9W@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEsiTy++yKGe1p9W@duo.ucw.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_121026_662005_7C62EB51 
X-CRM114-Status: GOOD (  21.36  )
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

On Thu, Jun 12, 2025 at 08:54:07PM +0200, Pavel Machek wrote:
> > On Thursday, 12 June 2025 11:17:52 Central European Summer Time Pavel Machek wrote:
> > > 
> > > > Jonathan mentioned recently that he would like to get away from using
> > > > memset() to zero-initialize stack memory in the IIO subsystem. And we
> > > > have it on good authority that initializing a struct or array with = { }
> > > > is the preferred way to do this in the kernel [1]. So here is a series
> > > > to take care of that.
> > > 
> > > 1) Is it worth the churn?
> > > 
> > > 2) Will this fail to initialize padding with some obscure compiler?
> > 
> > as of right now, the only two C compilers that are supported are
> > GCC >= 8.1, and Clang >= 13.0.1. If anyone even manages to get the
> > kernel
> 
> Well... I'm pretty sure parts of this would make it into -stable as a
> dependency, or because AUTOSEL decides it is a bugfix. So..
> 
> GNU C                  4.9              gcc --version
> Clang/LLVM (optional)  10.0.1           clang --version

Even though, what the kernel versions are you referring to? I am sure there
plenty of cases with {} there.

-- 
With Best Regards,
Andy Shevchenko



