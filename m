Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CAAC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8e3DxKlTkHkq34hhZRfANEedfniwXUt08LpkkMu370o=; b=sczbhtTvOLR2LGrIssBGshG0yq
	fz4ACIGQsVirp0sLS2M+Dl3brOYDocfz0RhPsjHtKChAyDGmhgyfPN+iobP+YAcEJc6uGQ4OJEL4A
	tg1AdnqIldpeNhbBQAdqo6e5y9xeux2hhNKkQX4lnlB0vV4X5XwKl4UZkbbaXAj/APUO1lCLX/8V6
	S4rEAcX+yD+wVqxp0Dx7yDqts6Lhs0oFN0keRb7TapqJ1Pa1Cx7hvHtjXJw1I3t0u5hOZxTZhgh6/
	QHlnW+eL7MJPwe95dt8fIfX4hcg0gZKvqfx7KyJdtQIXzAWeaWKbUydO5JN7X28NRXFfq2nxAmIr8
	H92p6bVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQRl2-00000001NvU-3wCH;
	Sat, 14 Jun 2025 14:21:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQRik-00000001NpH-2weC;
	Sat, 14 Jun 2025 14:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC98EA50B0B;
	Sat, 14 Jun 2025 14:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDCEC4CEEB;
	Sat, 14 Jun 2025 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749910737;
	bh=TAefawj8sFz6PzX77ED0UDRrtR9qcAx7l29OSrOfCJ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ta9SO3rEXMSLA10FI7fBR3F6/8k5nRYF+su0+OPjS5hW+vMPqYqkjwkBqhYYBZJzi
	 WkxbcgQaolfGAHRjZceYZBqeLjg3nxqewEpEhi/mc3fXRRgOVjQmxu7ghIAZztiJWi
	 rcXaFy9n2AswtVLbxFPrJHJQ5k7DbNhVzkcrWFm8KVbZvInGvZmzv0P2o5TRxwzScJ
	 EXpRqYx7xKx2ZA5uXP8ZlvfB0XTbU8PVP30WMoANTItUUqs4EdtCQcckRCKr/THZHj
	 QqEd2x3S4DlvrLbcIOo7MzysAEzgrI8Z9I2cHL8+5MkDlEBeHuyeU6NRmGWVCBNvn6
	 0y8FcKrLKOhAw==
Date: Sat, 14 Jun 2025 15:18:44 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, David Lechner <dlechner@baylibre.com>,
 linux-rockchip@lists.infradead.org, Michael Hennerich
 <michael.hennerich@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Francesco Dolcini
 <francesco@dolcini.it>, =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZl?=
 =?UTF-8?B?cw==?= <jpaulo.silvagoncalves@gmail.com>, Leonard
 =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, kernel@pengutronix.de,
 Oleksij Rempel <o.rempel@pengutronix.de>, Roan van Dijk <roan@protonic.nl>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Mudit Sharma
 <muditsharma.info@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, =?UTF-8?B?T25kxZllag==?= Jirman
 <megi@xff.cz>, Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/28] iio: zero init stack with { } instead of memset()
Message-ID: <20250614151844.50524610@jic23-huawei>
In-Reply-To: <20250614131844.7fdc10b8@jic23-huawei>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
	<aEqbQPvz0FsLXt0Z@duo.ucw.cz>
	<2243943.irdbgypaU6@workhorse>
	<aEsiTy++yKGe1p9W@duo.ucw.cz>
	<aEsmDyc44P8amm5p@smile.fi.intel.com>
	<aE0a/Y9qVByfA2vI@duo.ucw.cz>
	<20250614131844.7fdc10b8@jic23-huawei>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_071858_886743_2B8C1A17 
X-CRM114-Status: GOOD (  29.76  )
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

On Sat, 14 Jun 2025 13:18:44 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Sat, 14 Jun 2025 08:47:25 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
> 
> > On Thu 2025-06-12 22:10:07, Andy Shevchenko wrote:  
> > > On Thu, Jun 12, 2025 at 08:54:07PM +0200, Pavel Machek wrote:    
> > > > > On Thursday, 12 June 2025 11:17:52 Central European Summer Time Pavel Machek wrote:    
> > > > > >     
> > > > > > > Jonathan mentioned recently that he would like to get away from using
> > > > > > > memset() to zero-initialize stack memory in the IIO subsystem. And we
> > > > > > > have it on good authority that initializing a struct or array with = { }
> > > > > > > is the preferred way to do this in the kernel [1]. So here is a series
> > > > > > > to take care of that.    
> > > > > > 
> > > > > > 1) Is it worth the churn?
> > > > > > 
> > > > > > 2) Will this fail to initialize padding with some obscure compiler?    
> > > > > 
> > > > > as of right now, the only two C compilers that are supported are
> > > > > GCC >= 8.1, and Clang >= 13.0.1. If anyone even manages to get the
> > > > > kernel    
> > > > 
> > > > Well... I'm pretty sure parts of this would make it into -stable as a
> > > > dependency, or because AUTOSEL decides it is a bugfix. So..
> > > > 
> > > > GNU C                  4.9              gcc --version
> > > > Clang/LLVM (optional)  10.0.1           clang --version    
> > > 
> > > Even though, what the kernel versions are you referring to? I am sure there
> > > plenty of cases with {} there.    
> > 
> > 5.10, for example. I'm sure they are, uninitialized padding is a
> > security hole, but rather hard to detect if they are not specifically
> > looking.  
> 
> The stack kunit test is there back to 5.0-rc4 
> 50ceaa95ea09 ("lib: Introduce test_stackinit module")
> 
> So I think we should be pretty well defended against issues.
> 
> Hence I plan to pick this up curently.
> 
> Thanks all for inputs on this.
> 
> Fun corners of the C spec vs implementations!
> 
> Jonathan
> 
I want to give this some testing exposure from 0-day etc in case
we missed any build related issues so I've queued it up on my testing branch.
I can still pick up tags / rebase etc for now.

Thanks,

Jonathan

> > 
> > BR,
> > 								Pavel  
> 
> 


