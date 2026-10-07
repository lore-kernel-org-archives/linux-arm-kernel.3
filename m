Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0B6CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 00:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6LiwQHe9JStXBgqo8euqJ3iQ3N1ssekSUFRPrSC/aU=; b=uX8vfSFR+yeDg1mj8xxFVP+kCX
	8WjWY2yIEnTWyUdMsVVlZOhPR5RL5MRCfE6hAZ7TNRkHsWewbGifeFn3E+SeaXo7XHf+TMdBPEvOx
	chMC5H99MSCYvyiQy69+O+jjajl1NpAnFz833r2tsqv/Rt6pRfD9agSk7To0wUBRnXAOqwvLxODpM
	rX5r+0OmygfhjOc5rIsMo75nNVn5Bhm2Rk/+61OnPoql/pV0vRhmI+3iAMlc+0g83SbL5rFNcEqWp
	DVAYiDH5Xw5G8E79/TpKilboq9zatn+EbSkyEPaEa2AbCzOpekI9C/55VGia5KOhilqOLNBs3BtY+
	X773ZOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFyD-00000001YZy-2lBP;
	Wed, 07 Oct 2026 00:57:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFyC-00000001YYM-0wRQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 00:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=e6LiwQHe9JStXBgqo8euqJ3iQ3N1ssekSUFRPrSC/aU=; b=Ek
	wM3ffr8MAZY7fcx1NpeRA1p4M5PrHgtGCUTiuD4JPWsc/OThoxXyB/UQoHkWdhltdMiib0vZIiy80
	1w9iW3QOkwZ986gZKJTO2W7gntOcJV7REuqEnTybJ8+DwB11HEjamYoVzD/e54N9zo8JOtRgG6d49
	G4sG6WUP1qYRMKY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xEFxv-009NLU-DH; Wed, 07 Oct 2026 02:57:03 +0200
Date: Wed, 7 Oct 2026 02:57:03 +0200
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
Message-ID: <e7fea95d-1ce2-4c5a-891d-5e5899931329@lunn.ch>
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
 <179127056620.2231598.8882282421523696709@kernel.org>
 <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
 <20261006155214.63c5cb5b@kernel.org>
 <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_175720_267077_BCCA9D26 
X-CRM114-Status: GOOD (  17.88  )
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

On Tue, Oct 06, 2026 at 05:17:20PM -0600, James Hilliard wrote:
> On Tue, Oct 6, 2026 at 4:52 PM Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Tue, 6 Oct 2026 01:14:52 -0600 James Hilliard wrote:
> > > > Please do not repost the series just to address the above. Instead,
> > > > reply to this email with the missing information, so that reviewers
> > > > can take it into account. If the series needs another revision for
> > > > other reasons, please include the information in the commit messages
> > > > then.
> >
> > Please make sure you read this paragraph, to the end.
> 
> How much detail should I be including?

We want to decide should the patch go to net, because it is a real
problem which bothers somebody. Or is it a theoretical problem which
will never happen, so we might want net-next, or maybe /dev/null.

Sometimes it is really obvious, things like a:

Reported-by:
Tested-by: 

from the same person, makes it clear it should go to net, and it
probably is correct.

If not, a statement like:

Tested on real hardware, regression solved, no other regressions
found.

or

amd64 Compile tested only, probably broken, RFT.

or

New feature tested on real hardware.

Put yourself in our position. You are the Maintainer, what would you
want to read to know it is going to the correct tree.

     Andrew



