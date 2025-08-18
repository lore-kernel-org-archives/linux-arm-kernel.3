Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D475CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwgsS4PG4ITMx3PNJl2dLL2bUNgpR+5bLVuJH1edoYM=; b=mqmJuJWW4Oxo3jYBnlWAoyhyWh
	iArgJvVXEhsmSNIbkgdjXLu5oHJPPQaoO0tIWLLw0b3sDE7aWx9/9UK0MS4XuvehKU5TaIzmpitXf
	2jhlMs8R3VyyrgBfZx2wmSohDbzYh9Me3cJuAoCayCIEoYgJkSEzcsZUGNTrTiTMvKPrQ8cHFElCZ
	kM8kwI1WfFpEabsQ/nvx1WPzbXr3fkGwrWcwpBWCWYQ+EGaqkniya5BG03Hij0FJ5JZ80Xbzv+pdV
	8Gno83le2CkKApZcK5FGb9/39gEMhD7p/x/h3w9g9Mi7h6yVV8GRxpijD0ZHqHeM+IIGQZ5uekKbk
	Bq6uFFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7OG-00000008iZI-2nsA;
	Mon, 18 Aug 2025 21:27:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6Bj-00000008anl-1F78
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 20:10:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2026345AAB;
	Mon, 18 Aug 2025 20:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7B7C4CEEB;
	Mon, 18 Aug 2025 20:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755547838;
	bh=qg6GZTp8IOOZdRgNGIXFARftWitXEVGq3DzHCuGmImo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=JIpOS1xk7YahMhN5Ye/QxfvM1KFZzF+ZJKLD1lPbylumH+5cNqfFXMwBkxuvWL60v
	 qi4ZUeXgTw+TLW1+3cnLUthS8RU/rplcG2CDUkqpiPPW5RqF3PHaiPwyJulrJuDI4N
	 xQISNqlI4R6NnYQXtV7jw0ApGiVSjH6JLT5rYnjmzThfKjzuu67dyZnWdWYpXXcy0x
	 Y9B7SkxmxNElXdnU8JtDZfUQMFGt/K1e6TgmtamsG6LunbtISoRzbTA3gkeFvrU7Pl
	 jUDODGTn5iRWh6am2TOOeB+pWZdb+TF7c+v7Ej012BUzj8hGZvqiqXubas7FFeT0bM
	 rHR/aKgHbW/hA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9A80ACE122F; Mon, 18 Aug 2025 13:10:37 -0700 (PDT)
Date: Mon, 18 Aug 2025 13:10:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC] net: stmmac: Make DWMAC_ROCKCHIP and DWMAC_STM32
 depend on PM_SLEEP
Message-ID: <4c3b0193-4fa7-47ef-9d61-f060c10d3ed4@paulmck-laptop>
References: <7ee6a142-1ed9-4874-83b7-128031e41874@paulmck-laptop>
 <aKN-Tdfvc3_hD2p7@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKN-Tdfvc3_hD2p7@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_131039_373599_961596BB 
X-CRM114-Status: GOOD (  27.64  )
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Aug 18, 2025 at 08:26:05PM +0100, Russell King (Oracle) wrote:
> On Mon, Aug 18, 2025 at 12:11:09PM -0700, Paul E. McKenney wrote:
> > Hello!
> > 
> > This might be more of a bug report than a patch, but here goes...
> > 
> > Running rcuscale or refscale performance tests on datacenter ARM systems
> > gives the following build errors with CONFIG_HIBERNATION=n:
> > 
> > ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-rk.ko] undefined!
> > ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.ko] undefined!
> 
> The kernel build bot caught this, and I asked questions of Rafael last
> week and have been waiting for a response that still hasn't come.
> 
> However, there was some discussion over the weekend (argh) on IRC from
> rdd and arnd, but I didn't have time over a weekend (shocking, I know,
> we're supposed to work 24x7 on the kernel, rather than preparing to
> travel to a different location for medical stuff) to really participate
> in that discussion.
> 
> Nevertheless, I do have a patch with my preferred solution - but whether
> that solution is what other people prefer seems to be a subject of
> disagreement according to that which happened on IRC. This affects every
> driver that I converted to use stmmac_simple_pm_ops, which is more than
> you're patching.
> 
> I've been missing around with medical stuff today, which means I also
> haven't had time today to do anything further.
> 
> It's a known problem, but (1) there's been no participation from the
> kernel community to help address it and (2) over the last few days I've
> been busy myself doing stuff related to medical stuff.
> 
> Yea, it's shocking, but it's also real life outside of the realms of
> kernel hacking.

;-) ;-) ;-)

I am happy with whatever solves the problem.  In the meantime, I will
be using my patch in testing to get this failure out of the way of
other bugs.

							Thanx, Paul

