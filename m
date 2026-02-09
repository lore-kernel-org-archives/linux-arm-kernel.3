Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA78E94603
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 21:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gY+UaA5P0w/ezq5fU8Wq6QkhiYjloxkC/sCSCgFfkBc=; b=tEb9OnRzdIcPkNG44txu1gjfol
	RY5oLjNWxqySi+LuO3i+CyX0vzMVE9YWQVHZG3BGwW3z7H0DRI1nlE+7Ina45L5qoMWajfPAF/hrk
	V7UxR3wQraul3HOhSxss7XGA3PInPQCRJm68FIpcoMn4Fo+yltdHqgK1IMdIv8Alxoi0XeAdObhjO
	2rLX5eRK9J2kVhng9Ls2Hu+GQ1yow8BPAhj6zaA/11irBvUA5N70ctGqXQlZ4iqU7q+l0p4vbs+Q9
	XIsUlWH3SkGLR4Zr3ULfXQW5Mi8y23DfDgJxlM9RDml/4h4bPTLamdNH63nYQzJhIylZEtUJSwSvy
	zFYhcxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpYxH-0000000G33y-0WSV;
	Mon, 09 Feb 2026 21:38:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpYxF-0000000G33g-3qQg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 21:38:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E4636013F;
	Mon,  9 Feb 2026 21:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A991C116C6;
	Mon,  9 Feb 2026 21:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770673080;
	bh=V5k7yronzuPg2/sQDnDLiZPJmoREh3DS6In0CZNegm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2/CxZyE7D7NuC7727GzKNmG8L0gFdn827lwUEFhrk1GcDYwfKzMWilh9KCwLySN2
	 tDMTyIgjKpNBsz+CrnFUB8QrkqCqmuexDnRgYALsArlPL7MYxDDAkqQGMRry/iQQEz
	 tXkZ9aLz2eqJBLP0lhFLwX/6MjqEStYuaBxUaPzS36VebR2KunZkZR9O1OXhOtXp8N
	 y7WKLM3eEtcCOQ9wRj+umXbC0jg6B9FNMdR1WBBVMG3pafl6iUuxvb1YkCeBuik/q3
	 twvcXwcELPoyngclQnEGLBF2iDgahBFNYk+KVc3S2d7b59tHFINf47IiCuGxldwxT1
	 EqvORhp9jn0CQ==
Date: Mon, 9 Feb 2026 15:37:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-renesas-soc@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Shevchenko <andy@kernel.org>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Konrad Dybcio <konradybcio@kernel.org>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <epechyewxhlkp2dgw7yxmz5duak3illbmjpeux5jgt2ewskc3j@cre3vpa5wnhy>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato>
 <aYnBrN0JRCf9-UjB@ninjato>
 <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
 <aYo60vooftdem4Lt@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYo60vooftdem4Lt@ninjato>
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

On Mon, Feb 09, 2026 at 08:51:46PM +0100, Wolfram Sang wrote:
> Hi Bjorn,
> 
> thanks for the reply!
> 
> > > Moving maintainers from CC to To ;) Do you, in general, approve this
> > > change to the headers?
> > 
> > Certainly, I don't think we should force unnatural slicing of drivers
> > across the source tree.
> 
> Cool, glad you like it.
> 
> > I've always found the current model unergonomic, resolving this part
> > might very well have the side effect that Andy is looking for (and I'd
> > welcome that).
> 
> Yeah probably, but frankly the task of redesigning hwlock-allocation is
> a bit exceeding my bandwidth for this project. Can we make this a second
> step on top of this series?

I'm okay with that. It's winter and the yak might need its fur.

> And if so, would be this series acceptable
> as-is then (modulo the better include-sorting mentioned by Andy)?
> 

Sounds good, I'll pick up your v2 once we get out of the merge window
and share a immutable branch for the other subsystems.

> Hope you are well,
> 

Likewise,
Bjorn

>    Wolfram
> 

