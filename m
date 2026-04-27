Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56D6FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGkxyW6rfS21L1dfxtkH8kzEZmrM4OzETLi8RhRisVg=; b=wOpNvHPlj8/MDZsd2wZl1J4KeP
	y8LgFg2K4trzFKbMRgpVyXhxS+yGWXb2+5y4gLxzg+k5LEaz/mw9n+JX6b6azPp6claMmG/RsFsGJ
	yEZMmyG2CGlZVylLPzzEHGXe0qlftbd3cki9ar5+PxL9oMrZs1/e9stY5C4M5/qMd1IDZK5IPZf2D
	tWN3h/etO17SyUR/SIErDjBoGNcy94wMv+U1fgi4vItDEZIE7VjhLkYYvbh4komDZTaSVPVV7+CYL
	eQraHIdEm9VJc/wbMSoR6cMS4jyxfZIdGmrWVbdxDicvEWN7LkzaOlRa/R4Nw+Pz0Lljq+fIr54Zm
	X+KkpE+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQ3q-0000000HVdP-18E4;
	Mon, 27 Apr 2026 17:47:58 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQ3o-0000000HVcu-3qW5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777312077; x=1808848077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e+J+iOPJfP6z+ZH6Ruj8nWFBBRT4ttpezIBE6Sl1LSc=;
  b=kewLCBnPx61fL8puw3sagSE7uRNc57Hx0Eid9VNhs7euANKsOeBlHTi/
   D0SngDKg7pos1W3yMh+ePrNP0bFOVPMiIMdM6vFdAXGCE2f52tBE90iTV
   LNLVWJACnhP+11gjbso71TDODnh2EMD0gEdHZUKbb1WJmRiutHPoLW2Mo
   ZhyDGw/JtjNlPiMuRh5QtW5TAAmOvg5bHc4oyzFIIskopFqbQRmByNZy+
   uZmz0WNcEHdYhgVGvufHaNcw0X0xetqOxwat+tGtWUGCIZ9aczHEaDXTe
   Ch8rU8rXUraWexy05qFRpYLrVeAId3i9XYrlnKIpT/AbM09wax2591z+K
   w==;
X-CSE-ConnectionGUID: RTcpx9PXTi2ajOkJPbrGmw==
X-CSE-MsgGUID: pkqiuwl0QFWrc0W5JdxbAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="80784610"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="80784610"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 10:47:55 -0700
X-CSE-ConnectionGUID: bdt4f1QrSvqbpmLyWvoIuA==
X-CSE-MsgGUID: NZEGh0wLSNqo3U3TR5hHyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="229156488"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 10:47:51 -0700
Date: Mon, 27 Apr 2026 20:47:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: pxa: integrate sound/arm/pxa2xx into
 sound/soc/pxa2xx
Message-ID: <ae-hRXdoVCeNhNSm@ashevche-desk.local>
References: <20260427144658.3609647-1-arnd@kernel.org>
 <20260427144658.3609647-3-arnd@kernel.org>
 <ae-GOQjD4Kq0ve8D@ashevche-desk.local>
 <2e77971c-ce4d-4489-9e8a-7766c6576a39@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e77971c-ce4d-4489-9e8a-7766c6576a39@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_104756_964830_09E192AC 
X-CRM114-Status: GOOD (  25.01  )
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

On Mon, Apr 27, 2026 at 05:58:00PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 27, 2026, at 17:52, Andy Shevchenko wrote:
> > On Mon, Apr 27, 2026 at 04:46:31PM +0200, Arnd Bergmann wrote:
> >
> >> The pxa2xx sound library modules are only used by the ASoC driver since
> >> commit b094de7810f3 ("ASoC: codec: Remove pxa2xx-ac97.c"), so move the
> >> code into the one module that uses as a simpliciation.
> >
> > Is this part of the series that touches UDC? Btw, the UDC one despite on being
> > mentioned as v2 in the changelog still have no versioning in the Subject.
> 
> Both patches came out of my work to hide the last users of GPIO numbers
> behind CONFIG_GPIO_LEGACY that I first posted last year. A lot of my
> patches got merged (or replaced with other work) in the meantime,
> so there are only a few drivers and platforms left that won't use
> GPIO descriptors any time soon.

I'm fine with that, I just got patch for UDC and patches 2 and 3 out of 3 of
some series related to ASoC PXA. I was wondering if they are coming from the
same series. Anyway, it's not so important.

...

> > What a lovely change! I would like to give a tag, but see a comment below.
> 
> >> +extern int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
> >> +			      struct snd_soc_pcm_runtime *rtd);
> >
> > Can we kill 'extern' while at it?
> 
> I can change that, though I usually try to minimize changes to
> code that I just move around.

I don't see the point to have another patch to drop 'extern' while we anyway
move the code around and all those are being touched.

-- 
With Best Regards,
Andy Shevchenko



