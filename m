Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C2AC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vO4zsqd6+CKiqzXBlsgszWemmLXQdGd/m+GIX3H8Vzs=; b=Pq3Loykjb8CQ+Gg02B8awdytS9
	GDBBnnKwr+VuOvN+pMmdy+Pf0woQrXW5OplBz4GsfpMWiUV4N5jTuUeqrhvTk/t68SHtPkwVAwLvm
	QD+PQKBKZ2HbfgaynRRaFM0f8nz74IHwLQtR1/hlOea03WPl2QhrMStIDn/1fb4RhWPKAEOnfWFBj
	ySW8+iaXVFZsu/97KGPMDA6F8/XhaDoX0qYKQ+D523QLb6NhqpBV9CGdbghd9HO5hJU3b9LCQGOO0
	YHy9Y18VN5LKBpD6UF93QPyxmTtkvugA4LrpJbR649VQ0s3ign2b0tNdrQoznYXIiT/EZPyxsnC3N
	lsA4X54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAcT-0000000AiQr-35RY;
	Sun, 09 Aug 2026 20:59:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAcR-0000000AiQ8-0bTh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:59:44 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-480033bdcf4so579004f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786309181; x=1786913981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vO4zsqd6+CKiqzXBlsgszWemmLXQdGd/m+GIX3H8Vzs=;
        b=SyrDrtgLmdoqdb8v/MJFn2wXAh8asgfqdNhZPFIw863ueFiP2YgGdZCwplHH83bySd
         WUtuZtJzp8swPzKOM0tt+Lbbpj4e8faBUytSXi3/xNv+yxBgIMPe5/gFa7WL/kgNm99g
         WRpahvzGvfng0cCGCOIwZg43adCr8ft2+uOPo1Vt/Gi93binh1Gw08ZZ8xaIQuQk1d9/
         nIyJdExklPeJxB0NvE8qQTeBqtQlZYo5nZCPOn8D3rUBL1EHU60SfJK25qxW/IkaE9k1
         iU1HMpt7JmeCpHueSt4vzRxt1F3Q/Gnlmjv0clEaBHbrHJabjz+DeWqAnhprUxbDYXv/
         85hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786309181; x=1786913981;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vO4zsqd6+CKiqzXBlsgszWemmLXQdGd/m+GIX3H8Vzs=;
        b=BZL63j8OYa3TByXe17TCkOav601/UdWdmc34uU4CbG/r+/RQaBtg4WUWBuzrNOS7IP
         DXGpMYR0JnN2SHYsSPSU2WuchO53fZP5hBCvJ0A9MoYncYkXBXuEOtlK0XN8tmeXS5vX
         iBzxCOkIV3uKV1tUu7giPnkFhF6kmvCgw91A0iSwNMBCZRfhm/GVpQl7/XZp3Zno0SVG
         5bC2dfMSnVOrlnSq6E8fLeHtJoUOXBBQFMApMJOCJwSXzkY3Vht7q5D5+2d34828Y4Fx
         07vThbQf5UzPW5KkzjM0Swb/CitFmldZAvSzcX/XoQXBR7nGUNjV8CBtxKkFW17YLb+r
         j7CQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpupw2B8w6REsBbZDN06myzfG4A6vXsyQVvutTzzxD8+PLfycvPJ0aLu0gDQwUbbwi4Ps3Z972sOoZHgN4++me1@lists.infradead.org
X-Gm-Message-State: AOJu0YybJec3qgWTW8+gGr0w9ViEq6k7FPvqxI8RN1jIzo8kec4wA+MY
	nviofgKkwHwBv7Jeq2J56BjpnzDJUXkvlxoq3MduPE7FIaYPbi7hP3VA
X-Gm-Gg: AR+sD11aTvO6IurxtWXh6Iha3Lz8V7Y6SZB+zGroesu7jVJDZxx1FLZ30xUlSK/G07K
	xH/qcud7WFgBwruF0td8CJQFmzhHvQhAcUP50pkhPiUh3UDORWxyyfKZW4jczOfQbxZKemFcj4X
	iUzyFxYaUB3V+i+Hskl0R6Qxbu7q/NMIkoKF5SpXhR2RHdOnq8dkb+HT6hXNThmR8V+b+qRiima
	ZehF1eq/AjFl0JdeMAIDGXoKFCQvHjDRLWII77KBIjpoleB5OyYuEUcw+cSRc805WzpXoG5lE4G
	XYnP3s50NjNFvt/mmgO567W+fDBnOxxH0WQEPo6svHiR2mvmaWXPSU7mnHW773gUXqhcQlikHll
	UZYeEJ8Q/6TFuiwhGQuoI8u67m4B9lZHwHJ/zQqxs0ItnuaEKo9LsI282XbT69toBevaXdTEk7b
	IHib3YXI7VpGQg8fc8bEMA8XHxC1RPIK5PkWSO4DWjpJ5s9Bz6TxhF4ZQTfbW86Oaqhki0hx8G2
	gfqVtnWn+KPr/OWkX+UPplNjBsNZPk=
X-Received: by 2002:a05:6000:2006:b0:480:c5:d635 with SMTP id ffacd0b85a97d-48000c5d6d9mr30371840f8f.0.1786309181299;
        Sun, 09 Aug 2026 13:59:41 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220a6d9sm30149581f8f.34.2026.08.09.13.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:59:40 -0700 (PDT)
Message-ID: <6a78ea3c.be490abf.cfd7.7505@mx.google.com>
X-Google-Original-Message-ID: <anjqOJWkUJvo6Wsi@Ansuel-XPS.>
Date: Sun, 9 Aug 2026 22:59:36 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v11 00/12] net: pcs: Introduce support for
 fwnode PCS
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <4c595c15-17d9-4c23-bb44-344c48d36e9a@lunn.ch>
 <6a78bdc6.89544747.3fcae.b8e0@mx.google.com>
 <f9151481-7dcf-4c9e-9507-7eb0c217851d@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9151481-7dcf-4c9e-9507-7eb0c217851d@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_135943_224892_28A84900 
X-CRM114-Status: GOOD (  29.52  )
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

On Sun, Aug 09, 2026 at 10:43:27PM +0200, Andrew Lunn wrote:
> > I think the most annoying one will be stmmac with the 3 different PCS
> > implementation but we already handled that in a upcoming ipq50xx driver
> > currently present in OpenWrt mainline.
> 
> stmmac is always annoying :-(
> 
> If this can make it more uniform, make internal and external PCS look
> the same, that would be great.
> 
>

I posted v12 that should smooth stuff even more. I think I found a good way
with the notifier approach.
 
> > @@ -6808,7 +6792,10 @@ static void mvpp2_acpi_start(struct mvpp2_port *port)
> >         };
> >         struct phylink_pcs *pcs;
> > 
> > -       pcs = mvpp2_select_pcs(&port->phylink_config, port->phy_interface);
> > +       if (mvpp2_is_xlg(port->phy_interface))
> > +               pcs = &port->pcs_xlg;
> > +       else
> > +               pcs = &port->pcs_gmac;
> 
> I thought the point of new API was that phylink picked the PCS. Why
> this if? Why not register both and let phylink pick?
> 

Yep I'm not sure of this... If they expose different interface mode then
both can be provided at the same time. I think it was done to reduce the
logic difference and patch delta to the minimum.

> > +static int mvpp2_port_fill_pcs(struct phylink_config *config,
> > +                              struct phylink_pcs **available_pcs,
> > +                              unsigned int num_possible_pcs)
> > +{
> > +       struct mvpp2_port *port = mvpp2_phylink_to_port(config);
> > +
> > +       available_pcs[0] = &port->pcs_gmac;
> > +
> > +       if (mvpp2_port_supports_xlg(port)) {
> > +               if (num_possible_pcs < 2)
> > +                       return -EINVAL;
> 
> This seems like defensive programming. If we said there was two, we
> should assume available_pcs has room for two. I would not even pass
> int num_possible_pcs as a parameter.
> 

Yes the if is redundant. The phylink core code ALWAYS allocate based on the
phylink_config value. The num_possible is just as a validation value of
what the space allocated in available_pcs.

If everyone is ok I can change and include this in the series.

-- 
	Ansuel

