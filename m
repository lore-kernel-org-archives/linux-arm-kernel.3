Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78728C71141
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6M/Ir30emIyMFunqsSV4/rnSehWU6TMSp6cLXMtHAMI=; b=LpaWrHXfiuWkUbFbH+AX0K9y8z
	9MI2Uoh9xL9sUbywn9urQeLfOD7OLGBRVtlqTAshjOzGlmkSAz6MLL9aX9YI2cL22V4OYloXNh9f1
	+LRLaApcX0DWdR+5cRC0NxhhglKgCHQqk9to25WxaXeNjMxXGHcObT4Gc8zTwZ0wENSJQcODM7mFT
	btDh0XZ6rRvCc9/SXCVOA4KNTMgwPf/nejlf4XhT07zDqTXp6mYonh/7DHulYfbp/9mIU2xZgo8xN
	S99K/BLI8lsd1Ciu8Ceq2Fq7HckbRBorSoi0fW3cCr2LkcxJX5ZGt/M2U+jIyUEK4x2hvzL5QH1tm
	65X3hdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQPsv-00000001Ek2-3E9A;
	Sat, 14 Jun 2025 12:21:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQPqe-00000001Eep-3Hbl;
	Sat, 14 Jun 2025 12:19:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0EA04505B;
	Sat, 14 Jun 2025 12:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A468C4CEEB;
	Sat, 14 Jun 2025 12:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749903538;
	bh=PKJ0MCiecE4yglZMxR339G1ACqEGU8r/l9NXHPYw7Ac=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tPWHVI8PJ/YFW4mFxP8gpuscF+qnzTGShqYvVxG+RXB6OJc3vE5MkB4XnOL3FYbGy
	 zVnavAD1gEV3ABPiELtjvJf7d5phQf/g5HpyBECyplnopLe6sKnWDl7XTzz7Vaxfzx
	 kTbVBTE/DJnsUPZtGM09csSfRm+K/QdNNVqo+8HzALETdAF058aTJ9Ny6J/D0LrN60
	 B82/TQ8eC4KkPMGojhstZDLj6ZPrEH2O7C1qyEB8IrqunqCGWd0AocGyrJYy+5NGGP
	 0fHmi3Wg7fFhSDwRF2vHvEm087IK3ASIb2Z8JoQVhY9pMA3h/eYLTXUtgdR7eK5w4G
	 aB4K2P4LRuymw==
Date: Sat, 14 Jun 2025 13:18:44 +0100
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
Message-ID: <20250614131844.7fdc10b8@jic23-huawei>
In-Reply-To: <aE0a/Y9qVByfA2vI@duo.ucw.cz>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
	<aEqbQPvz0FsLXt0Z@duo.ucw.cz>
	<2243943.irdbgypaU6@workhorse>
	<aEsiTy++yKGe1p9W@duo.ucw.cz>
	<aEsmDyc44P8amm5p@smile.fi.intel.com>
	<aE0a/Y9qVByfA2vI@duo.ucw.cz>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_051900_869675_4C370203 
X-CRM114-Status: GOOD (  26.05  )
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

On Sat, 14 Jun 2025 08:47:25 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> On Thu 2025-06-12 22:10:07, Andy Shevchenko wrote:
> > On Thu, Jun 12, 2025 at 08:54:07PM +0200, Pavel Machek wrote:  
> > > > On Thursday, 12 June 2025 11:17:52 Central European Summer Time Pavel Machek wrote:  
> > > > >   
> > > > > > Jonathan mentioned recently that he would like to get away from using
> > > > > > memset() to zero-initialize stack memory in the IIO subsystem. And we
> > > > > > have it on good authority that initializing a struct or array with = { }
> > > > > > is the preferred way to do this in the kernel [1]. So here is a series
> > > > > > to take care of that.  
> > > > > 
> > > > > 1) Is it worth the churn?
> > > > > 
> > > > > 2) Will this fail to initialize padding with some obscure compiler?  
> > > > 
> > > > as of right now, the only two C compilers that are supported are
> > > > GCC >= 8.1, and Clang >= 13.0.1. If anyone even manages to get the
> > > > kernel  
> > > 
> > > Well... I'm pretty sure parts of this would make it into -stable as a
> > > dependency, or because AUTOSEL decides it is a bugfix. So..
> > > 
> > > GNU C                  4.9              gcc --version
> > > Clang/LLVM (optional)  10.0.1           clang --version  
> > 
> > Even though, what the kernel versions are you referring to? I am sure there
> > plenty of cases with {} there.  
> 
> 5.10, for example. I'm sure they are, uninitialized padding is a
> security hole, but rather hard to detect if they are not specifically
> looking.

The stack kunit test is there back to 5.0-rc4 
50ceaa95ea09 ("lib: Introduce test_stackinit module")

So I think we should be pretty well defended against issues.

Hence I plan to pick this up curently.

Thanks all for inputs on this.

Fun corners of the C spec vs implementations!

Jonathan

> 
> BR,
> 								Pavel


