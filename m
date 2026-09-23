Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE443C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUoQDWHb/l+6k19FrArKmt1pfReWHaZCAaEIs75K+TA=; b=qauO7n8z8lDH0qCdJyAjpL1zPb
	q7VOGsk0j+7zMTO/dF+Fq8Khhp3V76GI677oYwcCJzgYVaNEh0oTieU/s84RYIgkKne2tmtmEVBtv
	rrf6hFlDPrEk8b/1lStDwpot6BSqYa6P1GKCijKKfqrHWsmReIjYgbVKB/w39codoBRuljeEMvhED
	LtzmQPjbvpQwxtArCWsdl2t+hD9wCZqZjuQufC+8T5jQYEtt8gYZamYIXWuUW7LESBhdZ2hWY81AA
	f5oQEq9WRwpTCTOkUMYArrOIxE136EI7BwLakHTFtPTjSIESrgpi8IbGlhweIOY4vaGrGCo5EAeKM
	MOPyUNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rti-00000009ExI-2cmL;
	Wed, 23 Sep 2026 18:40:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rrk-00000009EcZ-0H4w;
	Wed, 23 Sep 2026 18:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=LUoQDWHb/l+6k19FrArKmt1pfReWHaZCAaEIs75K+TA=; b=Ux
	10jPK/Jr2kaGr5zP5pmxeJ9F5DC1v2qDGJnC3X5sZiMz15wOrvsdzigv88YtSfPk/J7YH5Di4Le/5
	IFCyhnFkTBQ0A7F75M8IP61B9YJnFm1Dy2dNwbtKcPHEg8ZC6fHm7u89c9yqcYky2vQo8GpJifxF2
	cqsvWLT+oUfqMi0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9Rrb-006rCZ-36; Wed, 23 Sep 2026 20:38:39 +0200
Date: Wed, 23 Sep 2026 20:38:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak
 when the PHY clock fails
Message-ID: <b6d534b0-8ccc-4cbd-8d13-cd0c887a3260@lunn.ch>
References: <20260919174223.2356964-1-coiaprant@gmail.com>
 <20260922191758.2730da7a@kernel.org>
 <CALj3r0gPjraK9wy_WbTkeYD1OK_HhSeMi8bDmk03gOVJUb825g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALj3r0gPjraK9wy_WbTkeYD1OK_HhSeMi8bDmk03gOVJUb825g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_113848_124514_4DEF08CF 
X-CRM114-Status: GOOD (  10.95  )
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

On Wed, Sep 23, 2026 at 08:31:08PM +0800, Coia Prant wrote:
> Jakub Kicinski <kuba@kernel.org> 于2026年9月23日周三 10:18写道：
> >
> > On Sun, 20 Sep 2026 01:42:23 +0800 Coia Prant wrote:
> > >                       if (ret)
> > > +                             clk_bulk_disable_unprepare(bsp_priv->num_clks,
> > > +                                                        bsp_priv->clks);
> > >                               return ret;
> > > +                     }
> >
> > Missing a bracket, EBUILD. I almost appreciate seeing a human error like
> > this these days :)
> > --
> > pw-bot: cr
> 
> That's what I get for hitting send while my brain was EBUSY. Will fix
> and repost shortly.

I almost appreciate a human brain being involved this these days :-)

  Andrew

