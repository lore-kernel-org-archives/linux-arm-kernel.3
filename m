Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72656CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 18:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bA1Tyu08pBfCHkqfVoKs1WHfW1LeJHm5dUdedfcw7is=; b=Mh3pXgSZu/XRQ8hc/RVtVfqNP9
	p/zJVQ5U3VVznsIBibS3jzkOFbtK8ADhBQd4ylgqwY17eiKnJDp+1InyWqCW+6qUEARHFEHAexNgN
	ELOiyiQuz7uIKPauNI3b+pvhr9EO7MWL46oCq9Olg0v+CdsZyhEAQ5DV12YLXSxn9/ZAfN0tKzU46
	PSKdnrGQyIz64BNqrCytxm+EiO/gzGuDrSORvI/TYLC5Bqx7Ra/FbfkBUeE9mpMqYyk/vyqFTguO5
	ddkAl6r/Tk2HimzNzeGYDVuuWt+NG8anGOo0bqZ9Kfb4lwRaYm9R73BxmBMEnwnclOyLbH/7DFt/V
	ku4jKCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWS1-00000002xUg-3OBp;
	Wed, 07 Oct 2026 18:33:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWRw-00000002xRZ-2VfA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 18:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=bA1Tyu08pBfCHkqfVoKs1WHfW1LeJHm5dUdedfcw7is=; b=0S
	uPaxNt/vCCuu7MdtJDS+918gtrDICn2cOkDC3jELsQg7udTEo0dJJ1fCy7AKVgx8WTTqVo2MlEAub
	Xi7TvzUGejx/NwLPyWVpGmz7xTJcLW6b9KL0wn/TGLJA4p1l5Cma/Lf1K/C2INK6a1pZXbaTF2/mx
	LLbwUTS3xdszLBQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xEWRk-009VAD-PW; Wed, 07 Oct 2026 20:32:56 +0200
Date: Wed, 7 Oct 2026 20:32:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sinfo@kernel.org,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety
 IRQ request failure
Message-ID: <98a7f952-37cd-4886-acb2-e87743e51fba@lunn.ch>
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
 <179127056620.2231598.8882282421523696709@kernel.org>
 <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
 <20261006155214.63c5cb5b@kernel.org>
 <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
 <e7fea95d-1ce2-4c5a-891d-5e5899931329@lunn.ch>
 <CADvTj4pm8fbgGDiyXVHubnM93qOey7o18O+MDU68MSisXVvHtw@mail.gmail.com>
 <f304ee6d-bbc2-4f76-964a-998c3febb8dc@lunn.ch>
 <CADvTj4pniuLUzsHP_kv03rFUkUD87PD9yVZ=HnW0CsZX78OxLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4pniuLUzsHP_kv03rFUkUD87PD9yVZ=HnW0CsZX78OxLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_113308_642682_70941C18 
X-CRM114-Status: GOOD (  26.46  )
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

On Wed, Oct 07, 2026 at 11:00:50AM -0600, James Hilliard wrote:
> On Wed, Oct 7, 2026 at 6:46 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Tue, Oct 06, 2026 at 07:27:05PM -0600, James Hilliard wrote:
> > > On Tue, Oct 6, 2026 at 6:57 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > >
> > > > On Tue, Oct 06, 2026 at 05:17:20PM -0600, James Hilliard wrote:
> > > > > On Tue, Oct 6, 2026 at 4:52 PM Jakub Kicinski <kuba@kernel.org> wrote:
> > > > > >
> > > > > > On Tue, 6 Oct 2026 01:14:52 -0600 James Hilliard wrote:
> > > > > > > > Please do not repost the series just to address the above. Instead,
> > > > > > > > reply to this email with the missing information, so that reviewers
> > > > > > > > can take it into account. If the series needs another revision for
> > > > > > > > other reasons, please include the information in the commit messages
> > > > > > > > then.
> > > > > >
> > > > > > Please make sure you read this paragraph, to the end.
> > > > >
> > > > > How much detail should I be including?
> > > >
> > > > We want to decide should the patch go to net, because it is a real
> > > > problem which bothers somebody. Or is it a theoretical problem which
> > > > will never happen, so we might want net-next, or maybe /dev/null.
> > >
> > > I mean, it's in an error handling pathway that could be hit if there's
> > > an -ENOMEM error on an IRQ-action allocation.
> >
> > ENOMEM does not happen for small allocations.
> >
> > https://lwn.net/Articles/627419/
> >
> > So at first glance, this seems totally theoretical, it will never
> > happen. So net-next, no need for a Fixes tag, etc.
> 
> It looks like there might be a few other ways to hit this cleanup pathway,
> not sure how plausible this is in practice however.

So lets go for net-next. If anybody hits this for real, we can
backport the change to stable.

	 Andrew

