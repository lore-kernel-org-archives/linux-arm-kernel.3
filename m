Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFEEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoB0EWW2RDZaUJiqYLd1EGoHFiBhYJK8r8MHAwgkWuw=; b=0oJOBMGgv8W4UkDhWVpZnWcmam
	ueTj2mI3jCF/6QIV7AjaUdrmOrq2+2Is48q+yna0c9qH0QCXqPiXZUbk+BNNiNwjToUzkZ2XcSrQJ
	6poZxSwItKejY1vtzjdDbTmt5s1ER0vyy068ognvHqiL9Pe9zNyVbDGEr70ph2ZGZJDAtXE1+LGtN
	p8AihXvuUJtj5YlQX5mvXboC9k8cHliBxFxfpao6CEw7xuINO5sChWUrARAf3Ab2+oXHtaZuTEzUG
	5lRiOX1VfL4vsJEmoZ96MQF7ZnhGmyD3M5eH7tIWrM/M1y9w0WD51CPHiVlfZQahA/jQdLnsf/zp/
	A3rL+6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUSn-000000004e6-3C68;
	Mon, 10 Feb 2025 14:08:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUQQ-00000000490-1x4r;
	Mon, 10 Feb 2025 14:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IoB0EWW2RDZaUJiqYLd1EGoHFiBhYJK8r8MHAwgkWuw=; b=V+TIswjDzP474U55wenzHJBHaU
	I7bVlVRKEZYOxz4+ozjuh0ic6srYPKzMs2BpF4V9QaKdFqmRCQ0syBWBHi389hqnAzl3QzvGGuxrN
	Y6N4HhmQj/iits0ndz6xaGAXkoGpbXMHGS6O89ZM2uqIH1Hq81y2604BLxmLE28s2s0bDB5J3P+Yh
	/nNxjmzIQ5dYHc+e2oK6M8oWSme8N4S1ab6YHPCjibgdQNZrxYOZbDQrL4G4XV8+OjijAKa/WjLLI
	nVpNrQuIn8ULwKuv4BRe23J+3e572a9G63H6PAa3Xm2ptrDVEkNsneaKSBxe6IPLja+c6DyAQZe5a
	eE0iPPIg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57222)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1thUQE-00075e-35;
	Mon, 10 Feb 2025 14:06:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1thUQA-0007Y7-0X;
	Mon, 10 Feb 2025 14:05:58 +0000
Date: Mon, 10 Feb 2025 14:05:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v3 1/3] net: phylink: provide
 phylink_mac_implements_lpi()
Message-ID: <Z6oHxrtBHAvaMqd3@shell.armlinux.org.uk>
References: <Z6nWujbjxlkzK_3P@shell.armlinux.org.uk>
 <E1thR9g-003vX6-4s@rmk-PC.armlinux.org.uk>
 <20250210132054.oaqb5mboh6qiixfv@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210132054.oaqb5mboh6qiixfv@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_060614_502509_CC1D15BD 
X-CRM114-Status: GOOD (  21.27  )
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

On Mon, Feb 10, 2025 at 03:20:54PM +0200, Vladimir Oltean wrote:
> On Mon, Feb 10, 2025 at 10:36:44AM +0000, Russell King (Oracle) wrote:
> > diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> > index 898b00451bbf..0de78673172d 100644
> > --- a/include/linux/phylink.h
> > +++ b/include/linux/phylink.h
> > @@ -737,6 +737,18 @@ static inline int phylink_get_link_timer_ns(phy_interface_t interface)
> >  	}
> >  }
> >  
> > +/**
> > + * phylink_mac_implements_lpi() - determine if MAC implements LPI ops
> > + * @ops: phylink_mac_ops structure
> > + *
> > + * Returns true if the phylink MAC operations structure indicates that the
> > + * LPI operations have been implemented, false otherwise.
> 
> This is something that I only noticed for v3 because I wanted to leave a
> review tag, so I first checked the status in patchwork, but there it says:
> 
> include/linux/phylink.h:749: warning: No description found for return value of 'phylink_mac_implements_lpi'
> 
> I am aware of this conversation from November where you raised the point
> about tooling being able to accept the syntax without the colon as well:
> https://lore.kernel.org/netdev/87v7wjffo6.fsf@trenco.lwn.net/
> 
> but it looks like it didn't go anywhere, with Jon still preferring the
> strict syntax for now, and no follow-up that I can see. So, the current
> conventions are not these, and you haven't specifically said anywhere
> that you are deliberately ignoring them.

It was explained in this email as part of that thread:

https://lore.kernel.org/netdev/ZzjHH-L-ylLe0YhU@shell.armlinux.org.uk/

The reason is that it goes against natural grammar. The only time that
"Returns:" would make sense in grammar is when listing with e.g. a
bulleted list, where the part before the colon doesn't have to be a
complete sentence.

This is why it's going to be an uphill battle - grammatically it is
wrong, and thus it doesn't flow when thinking about documenting the
return value.

If we want to go to a bulleted list, then it will be natural to add
the colon.

I'm not going to explain to this level of detail in every email, and
because of the grammatical nature of this, it's going to be very
difficult to use a form that goes against proper grammar.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

