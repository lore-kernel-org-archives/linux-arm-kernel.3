Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E07FC97E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ivZ2O70O4T+32qkZNJULjgO0M7a9nMVQ7ecV+OceaI=; b=3uu2oZABQ7xd0MeV6hVbt9xkYV
	mxlhYTHeWE39n4zNhHnJpyGtI+db4GlWrMbOM+dh3eZQvP+rkVPNw2olSW8/gd/7mXddgvt10F/Fo
	E+5zm3JFMhM4xaRL8asJ81RpDNEadaw0jR6N4YXUl3Uq3kRyulBpwiK2tcCqARkXr8gYI7rQ6fLQ4
	b5qc2BFhER7ueWmF0/KMNnJgy8c5ZZP7NtqrYruXTVDtosTT5sYYneolZNyRjEzXSF2k1QMIp1pmZ
	YtITb0k5kfLWyB6cUi1yikzXMT9T2kcp38D9Z2DTyibWVhsdec69UdLoSLsYQBWKKcNDNCSoDzbkp
	Pnxtl4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78DD-0000000Atwa-1ZLh;
	Mon, 30 Mar 2026 08:43:07 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78DA-0000000Atw0-1mxU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774860184; x=1806396184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x+luIYl184hnu2wsYl6KHzVpPW719gOm551v3luzkNs=;
  b=DHuC38jkizmQf2Jfz48O1PGPp3UK4GQXTxl4Ll4ssDzub27Qj9oFX5ZV
   Hn2uF9hz8Z+/AOSGVg7+SZaxstFzI/AhZwddh/2QOifrhGASHjMKzgzCN
   zQDH8oPxzpuwDcFjLA3KEjZiXtiPmc+dS2dR1PzmYHcRF4R7h9bqazaaO
   fHK8AIELREKZ8+HN1TOq5lReRGUOOTJPTEqeNq3teunIpvFfdgiFmCLp+
   SXWTVaRajBhVoh+ZC8bWvvwNrTPpTnHxZLF3EeJJxWafLP4uF5JwIIKaB
   NB2yuLeTOzE65gKWoQnh+2XRPvlDTcl6y/yp3oZwB9tiTKIyyy/I0XNo0
   w==;
X-CSE-ConnectionGUID: +PXCU7QSTJWNUFJ5Fdc3wg==
X-CSE-MsgGUID: 6HeTNHOzQSypHiX2noBCog==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="63398924"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="63398924"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:43:03 -0700
X-CSE-ConnectionGUID: WPfsgOUKRzKMOV9q/wI69w==
X-CSE-MsgGUID: EksjGDglS/Cmn5IHSbbIlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="230904375"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 30 Mar 2026 01:43:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 6BD0A98; Mon, 30 Mar 2026 10:42:58 +0200 (CEST)
Date: Mon, 30 Mar 2026 11:42:08 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Message-ID: <aco3YBCQsT2BN2_N@kuha>
References: <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com>
 <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
 <7h1phxpzml.fsf@baylibre.com>
 <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
 <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
 <acaOlGcGQEZHQ_mJ@darkstar.musicnaut.iki.fi>
 <CAMRc=McDdK8Y7wtG8WObjD6WF-2ftKBDwKbvj=xL-NMfeV=bPQ@mail.gmail.com>
 <aca3ajb_G3gD24S7@darkstar.musicnaut.iki.fi>
 <CAMRc=McVPskF4pMQSz=hR8CkyZhoPmCU_yJFT66vgTCPJd3-Vw@mail.gmail.com>
 <ackRzly0mXHReI7V@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ackRzly0mXHReI7V@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_014304_525967_BA10DF1B 
X-CRM114-Status: GOOD (  24.39  )
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

On Sun, Mar 29, 2026 at 02:49:59PM +0300, Andy Shevchenko wrote:
> +Cc: Heikki, the author of the code in question.
> 
> On Fri, Mar 27, 2026 at 06:23:29PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Mar 27, 2026 at 5:59 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > > On Fri, Mar 27, 2026 at 03:22:12PM +0100, Bartosz Golaszewski wrote:
> > > > Hmm, I'm wondering if there's a race with consumers already requesting
> > > > the GPIOs after the controller device is registered but before the
> > > > software node is added. I'll send a version with software nodes being
> > > > registered first, then passes as firmware nodes to the platform device
> > > > API before the device is registered.
> > >
> > > It crashes early, I was able to get an UART log from OSK (another
> > > 16xx board):
> > >
> > > [    1.001525] Register r12 information: 2-page vmalloc region starting at 0xc2808000 allocated at kernel_clone+0xa4/0x20c
> > > [    1.013092] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> > > [    1.019500] Stack: (0xc2809ed0 to 0xc280a000)
> > > [    1.024230] 9ec0:                                     c072d000 c0529474 c06b3aa0 c050a3cc
> > > [    1.032958] 9ee0: c072d000 c085c000 00000002 c052582c c050a324 c072d000 00000000 c0503160
> > > [    1.041687] 9f00: 00002710 00000000 c04da8f8 c0060900 c2809f64 ffffffff 00010000 946f70b5
> > > [    1.050384] 9f20: 00000062 c0816120 00000002 c052582c c0525848 c072d000 c04da8f8 c0060a18
> > > [    1.059112] 9f40: c2809f64 c2809f64 00000000 946f70b5 00000062 c0816120 00000002 c052582c
> > > [    1.067810] 9f60: c052584c c072d000 c04da8f8 c050352c 00000002 00000002 00000000 c0502400
> > > [    1.076507] 9f80: c2809f7c 00000000 c03f86f4 00000000 00000000 00000000 00000000 00000000
> > > [    1.085205] 9fa0: 00000000 c03f8704 00000000 c000850c 00000000 00000000 00000000 00000000
> > > [    1.093902] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > > [    1.102600] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> > > [    1.111206] Call trace:
> > > [    1.111328]  software_node_to_swnode from device_add_software_node+0x20/0x80
> > > [    1.121704]  device_add_software_node from omap16xx_gpio_init+0xa8/0xe4
> > > [    1.128997]  omap16xx_gpio_init from do_one_initcall+0x68/0x1f4
> > > [    1.135620]  do_one_initcall from kernel_init_freeable+0x1ec/0x240
> > > [    1.142517]  kernel_init_freeable from kernel_init+0x10/0x108
> > > [    1.148864]  kernel_init from ret_from_fork+0x14/0x28
> > > [    1.154357] Exception stack(0xc2809fb0 to 0xc2809ff8)
> > > [    1.159820] 9fa0:                                     00000000 00000000 00000000 00000000
> > > [    1.168518] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > > [    1.177185] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > > [    1.184295] Code: e3500000 012fff1e e59f3034 e5932000 (e5923000)
> > > [    1.191040] ---[ end trace 0000000000000000 ]---
> > > [    1.196350] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> > > [    1.204559] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> > 
> > Thanks. This makes sense. Both omap16xx_gpio_init() and
> > software_node_init() run as postcore_initcall() so if the order is not
> > right, it will fail.
> > 
> > Cc'ing Andy who's a reviewer for software nodes. Andy: is there any
> > reason to run software_node_init() as a postcore initcall? It only
> > allocates the kset, can we move it to core_initcall() by any chance?
> 
> Good question. I don't know why it's chosen like this.
> Let ask Heikki, who is the author of the code.

I don't remember why it was it made a postcore initcall (I only
remember that there was some reason at the time). It's probable
fine to just make it a core initcall.

thanks,

-- 
heikki

