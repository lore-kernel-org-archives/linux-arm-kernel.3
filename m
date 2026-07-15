Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F86BC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7qi0wjqw+T24Xr8wpK4TVGLaBhYNi0U20FSDe/v/ig=; b=yA8/Dfc13PKnh7sEYdGwTYuylj
	2Lg9ESdj9zD03snPBzJXo3l7TSwSsMbTdMo+7iF6LrT4KNfCWRZk+TY+OSubiHZH8/eYOktVVTmgF
	BPx54LjFsW7WsuCeFkDc3BYfPx3yv0FB+40pkvEaVxRqvjCT7srC12I5vr2BVSDHQnIWFlrfH91sk
	L568ycum6Fgtqj5Dj9HWye/XsUu+nTgFg3IGMAvMJ3tkaELZNC0XMqHLjekNCxIAt/9P9+HvzGEri
	nLy1o5Kmu2qh41H510iIzBSJdOhxlOK/IjLPMlYvReqsTmkJ31+K2BWs6JOK2vlAiXbHCl3nopkd2
	b/Rvwbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2Ad-0000000FPfm-1YZg;
	Wed, 15 Jul 2026 16:09:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2Ab-0000000FPe3-15Q2;
	Wed, 15 Jul 2026 16:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=T7qi0wjqw+T24Xr8wpK4TVGLaBhYNi0U20FSDe/v/ig=; b=vO3cm7v27gbIX2NkA8hpCjAP7e
	pxKwIkxWJO9cj6JatLoo1VS7q/2JBz1/WHrKVzJKM9BK5dq5AEXP+HU8LtDLpoYVX1Mq9jI6xuN4u
	G3JlaHoEkW71eb6GTZwh6/2Tr5gUXXo5ahYVWeE7ls2PwtkGzGKnArVqtVo+XRlyxEyw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wk2AQ-00CNlk-VJ; Wed, 15 Jul 2026 18:09:02 +0200
Date: Wed, 15 Jul 2026 18:09:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, kuba@kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, robh@kernel.org, krzk+dt@kernel.org,
	heiko@sntech.de, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [RFC PATCH 01/10] net: stmmac: move XPCS lifetime management to
 platform drivers
Message-ID: <685d91a3-be6f-42c6-9e23-07629e21bcee@lunn.ch>
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-2-coiaprant@gmail.com>
 <dc21b2fc-ae11-4fde-a5b9-09e2c6bee5c9@bootlin.com>
 <CALj3r0gWyfHHp0S4=71M1-TjgHKcgGax4Lr0DzPi37Q69-iCwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALj3r0gWyfHHp0S4=71M1-TjgHKcgGax4Lr0DzPi37Q69-iCwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_090913_310881_B0DEE08F 
X-CRM114-Status: UNSURE (   6.16  )
X-CRM114-Notice: Please train this message.
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

> I actually spent all night debugging call traces caused by the current
> stmmac PCS lifetime management, and it was not a pleasant experience.
> The code feels like accumulated technical debt that should be cleaned
> up.

Russell King will strongly agree with you, if he was around. The
phylink integration into stmmac causes a lot of pain, and he wanted to
rip it all out and start again. But doing that without breaking stuff
is going to be interesting.

If you feel up to it, have a go. But take a good look around first,
make sure you understand the different variant, internal vs external
PCS.

	Andrew

