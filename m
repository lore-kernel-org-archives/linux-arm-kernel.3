Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659D9CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfdLP83mHPHFMso2iF2XtpyrYtYAJ695PtbO2PEHxYc=; b=IOOf9QVlPtP2/zLmGfK8Zd3cai
	A9i/KS8/UET+0YQf46xLpQk7Jcr1a+fVUXMju6RbR2V+hyFQxVrTqnm+5PlexOem+TLK5pW2KM+PF
	uLt40T1KEhKMXiSO7WFPgIY79zXF+7shkjatPonW62TsZQ6VcXj6MbpwuOZUVorMofwFaPfPghy5O
	4Z5Y661vwtnEQAWGLuM4o9YR6Ckri+0Yaka5EyHRdPqnNdkodxh0CDlH0eeSkJkWbZOpvVDqeTinW
	RltzAsdm0+4dW4Slu4H0MoxQpf7ogVkEZ8b/H1gjskj2mbvxXllnm2ZsZ41mQU0hd09tNWeefhL1k
	ZnZYTXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZJH-0000000CVzv-0j0v;
	Tue, 13 Oct 2026 10:00:40 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZJB-0000000CVyp-1rI5;
	Tue, 13 Oct 2026 10:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791885633; x=1823421633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fTGeNaBIaLCVqoO0T9Dn+Yn3xOiEnsjDiubugzTxCX0=;
  b=N79QuZTnTwcUOhG7c86B8A4dx6iFEk0JgJI2hRtm8HwwZCdgg67hYw9P
   BxMBgJG6XnUajEMInzV/AfBeJHH7RaCKR3v9VpfEccTat+fR4Ui2vnH21
   fxB7YJ1fJ85T+SqevGyXoMadGVStwRkGJg5csLNvVu8OwtlXnH5u/cGHf
   88CET2JrqWyfpFURmR0VkfZpt0oBP9TAHAvD1/qqpv8rxu2/vsW6E3hud
   xHZZBWQ7JzOfxTFpZUVH9WvyDbib4EgcQZz4uwgQnOxoj64ycB1Q2iM7o
   JPEQvBNTitdblOvwNEPmrIMozjC85ss0Y2xv9iIfxp6W+t2Tggw4QVZLO
   w==;
X-CSE-ConnectionGUID: /M0I8sbRTO2l2F1cWQU2ag==
X-CSE-MsgGUID: rF4qhaTFR4qUNAuH3h2G7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="700904"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="700904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 03:00:31 -0700
X-CSE-ConnectionGUID: 1iNYISSoTuuhs5glB6ekBw==
X-CSE-MsgGUID: SGL4lvnmTw63CNrOzbER/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1174167"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 03:00:18 -0700
Date: Tue, 13 Oct 2026 13:00:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <ray.jui@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-parisc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 6/6] serial: 8250: make port operations work on struct
 uart_8250_port
Message-ID: <as4BML-VUC9xUgOf@ashevche-desk.local>
References: <cover.1791873876.git.jirislaby@kernel.org>
 <c59fa203f325e0fe7601ea0fbc0d222c8b37f9eb.1791873876.git.jirislaby@kernel.org>
 <as3etnbZatn4sbfx@ashevche-desk.local>
 <c6b08f53-b5ee-44c8-93d1-54fdf5994ed2@kernel.org>
 <as31PsESOgLUhMB6@ashevche-desk.local>
 <b404f3d7-1b2d-418a-8634-72c61ce33f8b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b404f3d7-1b2d-418a-8634-72c61ce33f8b@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_030033_521471_2FF6B6D8 
X-CRM114-Status: GOOD (  29.67  )
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

On Tue, Oct 13, 2026 at 11:39:00AM +0200, Jiri Slaby wrote:
> On 13. 10. 26, 11:09, Andy Shevchenko wrote:
> > On Tue, Oct 13, 2026 at 09:53:26AM +0200, Jiri Slaby wrote:
> > > On 13. 10. 26, 9:33, Andy Shevchenko wrote:
> > > > On Tue, Oct 13, 2026 at 08:48:51AM +0200, Jiri Slaby (SUSE) wrote:

...

> > > > > -	rc = serial8250_register_8250_port(&port);
> > > > > -	if (rc < 0)
> > > > > +	struct uart_8250_port *uport = serial8250_register_8250_port(&port);
> > > > > +	if (IS_ERR(uport)) {
> > > > > +		rc = PTR_ERR(uport);
> > > > >    		goto err_sysfs_remove;
> > > > > +	}
> > > 
> > > > Also do not define
> > > > variables in the middle of the code (it's only allowed for auto cleanup
> > > > variables and for-loop iterators).
> > > 
> > > Why, actually?
> > 
> > Because it's the style.
> 
> There is no hard style though. It varies across subsystems.

The keyword is *slightly*. I do not see much of deviation in style in the
subsystem maintainer-XXX.rst. Do you?

> > Linus also told it many times
> 
> Which is neither an argument. Linus is wrong at times ("Link:" use as an
> example).

Link is different, it wasn't about the code. So, for coding style we have stricter
rules.

> All in all, I do not insist on this at all. It's easier to read and follow
> the code for me. Not necessarily the case for others...

> > > First, it is used in the kernel quite a few times already
> > > [1]. Second, while it is sort of c++ism (and I like to use modern c++), it
> > > makes the life of the variable a lot more obvious.
> > > 
> > > [1] eg. see output of: rg -U -C 5 '}\n+\s+struct .*\*.*=' drivers/
> > 
> > (you made me to install something I haven't heard about, it's better to use
> >   `git grep` though)
> 
> rg is order of magnitude faster (searches in parallel). More importantly in
> this case, supports multiline matches. (And respects .git ignores.)

Isn't `git grep` fast enough due to looking into index and not into the files?
`rg` may not look at the Git index, right? So I may not to use an arbitrary
hash without checking it out first.

> > Note excluded __free() if I get regexp correctly
> > 
> > $ rg -U -l '}\n+\s+struct .*\*[^)]*=' drivers/ | less
> > drivers/ufs/host/ufs-qcom.c
> ...
> > drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > 
> > So, less than dozen of drivers doing wrong is not an argument, try something
> > better. But thanks, I will check and address this in some of the above.
> 
> Well, it's only an example of a declaration after a previous opening brace
> "{" -- this one turned out to be easy to search for. There is a lot of more,
> of course. kernel/ included.

Please, provide a better search line, I will look at that. For now it's just
a hypothetical assumption, I am afraid.

-- 
With Best Regards,
Andy Shevchenko



