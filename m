Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36191D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 20:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMeL4JyWTglPNStJrCnRRegNxn7l/H0tOrgAzvtGHzw=; b=RjduV5hEyJMDUhX9TXAaFZUz3A
	AqbOeT3D5IUWGTwanUil0yUUO8G2S0Cfm+nKRLfS7P690nYxfGC1dyQK4WhGpKmjJx1/Wn9TKTgnl
	Z0bpQxuutX1UEijXgqqywHSZUI/vA+esiqS0PtY72HFj26m+3pONNQKiuEI64wzIMn3y+CCl2+12/
	RKxPpVAYPZLC7jQGRk/M9In9KupCkH1eMEwf2+PAgHjz/JDX6ghz8cSdz796M0sPXUSRBZe99sUw5
	iecoUZeByooW8Lg15VvdaETxQXQGE+FjbdlfMyiOlTAC1CKCb+sPqOnfz20KzY1VW3tSEZXQItNKp
	HgA2PpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPnrc-00000002Y2w-2gws;
	Sun, 30 Nov 2025 20:17:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPnra-00000002Y2T-29pC;
	Sun, 30 Nov 2025 20:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TMeL4JyWTglPNStJrCnRRegNxn7l/H0tOrgAzvtGHzw=; b=jTLmQRdf4HJhzV66zMbIIGcOdK
	tId1vBslJDT5vLxueql2nfF37y4DcGRxg9XZzVq39KHCFivb6Wss3r05d3u42f6zeYCNL8m4ZdVzC
	vnmIDC1OUSjYLAF0q0O1/cJR76fWo7sltq7jsWObxvu3GpoHrxbP9zO7Cq13IjSaF7MU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vPnrH-00FTH9-QN; Sun, 30 Nov 2025 21:17:23 +0100
Date: Sun, 30 Nov 2025 21:17:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130080731.ty2dlxaypxvodxiw@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_121742_576879_4CB35FB9 
X-CRM114-Status: GOOD (  20.57  )
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

On Sun, Nov 30, 2025 at 10:07:31AM +0200, Vladimir Oltean wrote:
> On Sun, Nov 30, 2025 at 02:11:05AM +0100, Andrew Lunn wrote:
> > > -		gpiod_set_value_cansleep(priv->reset, 0);
> > > +		int is_active_low = !!gpiod_is_active_low(priv->reset);
> > > +		gpiod_set_value_cansleep(priv->reset, is_active_low);
> > 
> > I think you did not correctly understand what Russell said. You pass
> > the logical value to gpiod_set_value(). If the GPIO has been marked as
> > active LOW, the GPIO core will invert the logical values to the raw
> > value. You should not be using gpiod_is_active_low().
> > 
> > But as i said to the previous patch, i would just leave everything as
> > it is, except document the issue.
> > 
> > 	Andrew
> > 
> 
> It was my suggestion to do it like this (but I don't understand why I'm
> again not in CC).
> 
> We _know_ that the reset pin of the switch should be active low. So by
> using gpiod_is_active_low(), we can determine whether the device tree is
> wrong or not, and we can work with a wrong device tree too (just invert
> the logical values).

Assuming there is not a NOT gate placed between the GPIO and the reset
pin, because the board designer decided to do that for some reason?

So lets work on the commit message some more, but i'm still not
convinced it is worth the effort, unless there is some board today
which really is broken and cannot be fixed unless a change like this
is made.

	Andrew

