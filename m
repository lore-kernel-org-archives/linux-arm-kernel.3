Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DEFEA3F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 07:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6H6xeo+pUwr2FCjKMwN+h4Sl6QfqrlTLjZgysFt4u6o=; b=iREcgGi3w7x7G1mtIm4/U7JV7/
	HxlTXoEnXFby/IsBO4+PiIeE/BHw1tfjcTQFMqd1CBcJneVMWvR97HYMxeiHWNtwJIpouZcXRq0Ko
	ujFznd2ZH71SrlYzLXE5q0X5wsl/ZYoLh73pEbEon3S9ooQ23PY4yZMnozRCHErATnI4Eketwr2lW
	T8NMrdVwjiZSnjYJmcYN557IOpgfwrKc2OjSQZYGs46xoWBUsWXP1CO0tQpUQPyBPN2CIR5hIfLZj
	TnxarPZJsQ4AXoCZCfCZJabwy0iY30C9kKOfLYQFIEJ6R7NG5KbvmRkE6WVhJKJWlOgUmHVJzSVfy
	wUKowYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpi3W-0000000Gch4-2LZR;
	Tue, 10 Feb 2026 07:21:06 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpi3U-0000000Gcge-1fAj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 07:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770708064; x=1802244064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OBZ7vmJOuXFVdEocUKywotsuTZKHpBEwnRySOMXd6l0=;
  b=f/pLcOe3zsUaXu3GlMgtti46BxdIVBuVyjO6rwvbj+KWwD9xoSY10gI/
   96i01ZEnr7UH58ZBXG6jUXqPKTjAE/YNCC2un3z47QBbcX0VsnSHzVQKm
   hjf/CPMky5jmBuA3NCSC74MV7sKVck1ThykWAGKblXeaNrMjpCKOmTW+W
   Os+vGGnacqb96AG/hi5taHF1LpedpM8GrXz+8503nu2KbWTZArMomEWOF
   1dSULFaTqfQ1yGlhyhJMv+XXmSE2pItH4LNuGxZpcScJIvq9pwAMcLqCu
   JcVdI8zBqf9KhU3lUzD9MlyUp+YRGfZeXN876Knd8QfHR8NHqaUr+KzUY
   g==;
X-CSE-ConnectionGUID: 3xpsPhVXS2SGHSdPEsY7Kw==
X-CSE-MsgGUID: aVxC3CdkRSqTbY2/Ch8OgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89414244"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89414244"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:21:03 -0800
X-CSE-ConnectionGUID: YtCzlq72TW+BC8VOT+lUBA==
X-CSE-MsgGUID: rEiM7InjQtaVWLV1ZmJ1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="234791955"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.39])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:20:55 -0800
Date: Tue, 10 Feb 2026 09:20:52 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <aYrcVE9HsDNAwqIB@smile.fi.intel.com>
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
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_232104_447441_2113D4F1 
X-CRM114-Status: GOOD (  18.85  )
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

How do you see it's done if others will (*) start (ab)using that struct
directly?

> And if so, would be this series acceptable
> as-is then (modulo the better include-sorting mentioned by Andy)?

*From my experience it's not the Q "will they or not?", the Q is "when?"
 they start abusing it. I really prefer to hide as much as possible from
 day 1. Maybe the structure can be split to two? Currently IIO has a
 (painful and long) conversion from open to opaque. Taking this into account
 I really don't won't to repeat this design mistake. But it's all up to
 the maintainers, of course. Just my deep worries about this... while
 the idea, as I said, I fully support.

-- 
With Best Regards,
Andy Shevchenko



