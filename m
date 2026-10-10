Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9B0CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 08:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRQCjk8o/a/C0+wV15inpx1btX0H9yvKy9U4k4uppuo=; b=RKujE0ZEzHZBZDIGDQShNNS88l
	V+S767T8DsEUkIfvdw2uyh8J037Nl4bJob7ZygMZ3U0uvUf1I7Ep7Wfhy9WDkEsu6MBQJZGrXHrQH
	ttWyUUmWF66q2985CjBzM85bLbYvzi9UzI8CG8aqH3k6kUwLC/Tz4zqLb6PB2QKBhaUTBpuUms9Pi
	/eikhz9nbqYCoRTQkljqmyAGzt/77+aTHKcT8oKKl7Sgxztbwxm9GprHRdxzmKqg3ntGw/5wTzla1
	3qSKORmr508NDUe+iUh3Wsf4N0L+D60U5+W5n7n9i1w1HYHjZI1xIX18j0zlcIcNZw3ne9+Zyeq8U
	g3ANKXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSnx-00000007iBn-3RwX;
	Sat, 10 Oct 2026 08:51:45 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSnt-00000007i6Y-2NwI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 08:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=GRQCjk8o/a/C0+wV15inpx1btX0H9yvKy9U4k4uppuo=; 
	b=COXd/rYh6c/YIeSmGHxKuzPrhoV2lB4EI1g+3cavw5LEJgQ1BzD4kOybLc4/lzQu3/5477pYrgA
	AhrlmfN/9ALE2CrEvAlevl8YMcU46aRk/h0oWUADoPrAvJ1Pe8HOH/VZTdd19Q16Vx+aS5sKui5yy
	ygS/NQGpLe4vSCZ+hZqC+ZXFAA2dBE5nRSlRsib4i5OSLoLcmf5ihPKeGOhiLPIq2aC978V7eEht/
	Dw+ccFzuLz3Ph2daSx7iloaS5RzQOQikYKHB/o5bFMl0EkIK8n6Y5aQ84buPl32/CMb5MoCDDLGL9
	Y7imYxMT9vHgC2Oi/7Vzlhr2gKxjnYBbXOHA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xFSnL-00000002TuW-2Zcm;
	Sat, 10 Oct 2026 16:51:08 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 10 Oct 2026 19:51:07 +1100
Date: Sat, 10 Oct 2026 19:51:07 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Greg Ungerer <gerg@polyxeno.com>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Olivia Mackall <olivia@selenic.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 2/2] m68k: coldfire: Add RNG support for MCF54418
Message-ID: <asn8e5puc3I01Lva@gondor.apana.org.au>
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-2-5309548c9555@yoseli.org>
 <bd25e903-30fc-4905-986c-96d1b42e9f02@linux-m68k.org>
 <ddf0ab32-5b66-453e-b7aa-1722aeaf2aa0@yoseli.org>
 <9ba1ebd8-61cc-4e1a-b68d-906b20dd4999@polyxeno.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ba1ebd8-61cc-4e1a-b68d-906b20dd4999@polyxeno.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_015142_103874_01098B99 
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

On Wed, Aug 19, 2026 at 07:36:36AM +1000, Greg Ungerer wrote:
> Hi JM,
> 
> On 19/8/26 01:09, Jean-Michel Hautbois wrote:
> > Hi Greg,
> > 
> > Sorry for the very long silence on this one, it fell off my radar...
> > 
> > Le 03/12/2025 à 13:15, Greg Ungerer a écrit :
> > > Hi Jean-Michel,
> > > 
> > > On 26/11/25 17:08, Jean-Michel Hautbois via B4 Relay wrote:
> > > > From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > > > 
> > > > Add support for the hardware Random Number Generator (RNGB) found on
> > > > MCF54418 ColdFire processors with clock enabled at platform
> > > > initialization.
> > > > 
> > > > The RNGB block is compatible with the imx-rngc driver.
> > > > 
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > > > ---
> > > >   arch/m68k/coldfire/device.c       | 28 ++++++++++++++++++++++++++++
> > > >   arch/m68k/coldfire/m5441x.c       |  2 +-
> > > >   arch/m68k/include/asm/m5441xsim.h |  9 +++++++++
> > > >   drivers/char/hw_random/Kconfig    |  3 ++-
> > > >   drivers/char/hw_random/imx-rngc.c |  7 +++++++
> > > >   5 files changed, 47 insertions(+), 2 deletions(-)
> > > 
> > > I am happy with the ColdFire arch parts, so from me:
> > > 
> > >      Acked-by: Greg Ungerer <gerg@linux-m68k.org>
> > > 
> > > I don't mind taking this commit via the m68knommu git tree if the hw_rng
> > > maintainers are ok with that. Otherwise if you break out the arch/m68k
> > > parts I can apply those on their own.
> > 
> > I think Herbert acked ?
> > Do you need another ack ?
> 
> I would like to see an acknowledgement that taking this patch via the
> m68knommu git tree (to Linus) is ok with the RNG maintainers.

I have no objections to this.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

