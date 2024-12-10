Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB92E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnO56ocUjPfv+bgOKk5gIkhPUA621URHfVhC+NJz7p4=; b=k8qVxktDdQ/NhqbPaUq3ReWQTY
	yJeczuwR9vJIrbXXrtN8qu+9Vgnd+xNj4nFQQVhBFacVCCve48sWJJiFJ3JcL+6pq3kU7YJhuGRJd
	ceZCKxZhblCYnkDBfJ78lfv6h9oirX+CO7tgbSwc9jamypsnsiPdnuJlcIXaEH6S23dxlGNYxxCVJ
	i1k6aPsJL+3S7zYMX9XGLcL2Ax7MuPRqSRVjiB26p3r7HdANxuT21+gWZl4mIZKSsDg8K+olEQm00
	ZZKjIZGef7Lhe4kF6m20ZEPCYf01XS21rZk6H+qphn6dwKZIy/ChWpxs+pS9i2GjHDY100OxVcwie
	ZNgrNURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8nJ-0000000D0rp-1Pih;
	Tue, 10 Dec 2024 22:33:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8mG-0000000D0iy-02oW;
	Tue, 10 Dec 2024 22:32:25 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3863703258fso47251f8f.1;
        Tue, 10 Dec 2024 14:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733869942; x=1734474742; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QnO56ocUjPfv+bgOKk5gIkhPUA621URHfVhC+NJz7p4=;
        b=eegNGwbcBkdfJ0B5KSnw+LEyQn2CdHBWHj6pq/JNQ50cfaizHjxAnNqdjk7Xxp3CsY
         Jj/2UDUbD85b+sg0izWQYI+AQFOhnvJ8iqdfPCbTuqUyRlc+BP3AkpvTTOPQ3DUeLySJ
         dKoH9XyzfPUi+8wOQh1uh/IpyB7vxQC0QTrHvw0NOo6WDTOl80b1cclb7gG5lS/6x6Lj
         tkH0LS7NPAVjutu3i+zxyTwLwB/eL3BN7Kw/JBpeGNEgA/hrrrhB3d9I6I80PWNkHPxT
         qD+vrQdxu0krA0JJvxMbJqFV04GMqZJ6Piy3XeRancYNpaIGUGB1To1avI+6ymGo47yt
         305Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733869942; x=1734474742;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnO56ocUjPfv+bgOKk5gIkhPUA621URHfVhC+NJz7p4=;
        b=byor2no+dT7wuIEUrZSBbpaerS4W9LvXhQKSm0HxGEUbhueOcZvz3gZ2yJVG1+zPBe
         K6T0vZFw6R/f5u+Ht1uZ61xHCRFg0Zy1zn9O6VHt2dlihCSeN/L/P8Yx8YvUh6hARWiN
         b0TaoM+VmhFbeRrmkWYkk2Bo3ZDxk5SGoJzIczcxAbt0AZIyY6e706wIv/MpYt0kGL9B
         gzKTQHoDfZYBov1CzeJAwCDSoPaLr3qEUyN5b/TZha+Dz5/qOWB2Oi++StcM7OXO8W/X
         jS9IbzZsxSKKaS3xA6bpE1ElWPMMMljyJENmgs9wu3cpo2ox/vELfRTPmtwGZZlSPUwR
         PvaA==
X-Forwarded-Encrypted: i=1; AJvYcCW07Lx45j4Kdc8YoxkN4Kk9g1zQ/CzW3W9tbw4BHc9a3ghn9BV1WmEWW2WT2E2ygNmduZ93wGE09yMYhkwRFFkF@lists.infradead.org, AJvYcCW90bKB7AUit90I42qqJtQU2IM0Koa1Uzl3ToMqhfCHTp3B8yATW3h6iqBR0/2ccynO7t/RqPfN9lYS9kbtvZw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0mWiBRXXTdHodaIDyngfWcTgIp0YAS7EC5Ou/eGbSf5YNWRpc
	ltLTdTBIQx6OI1vft7HuEiZYRPVSj+UCfywzoRJPLh/hCLB5mmne
X-Gm-Gg: ASbGncucWFncyf3FKJb/IW72cZ6FGd5tDP3PqMhJHe7EYUC+m/mTKBlglZ4U7IoL5y0
	Eu1u9pMiTgybuoaOrarJEtrs5KWfDqzaRD473Du/Ww6GJiF3iPHkt2Hk2QUW7uXd0E6edqbQby4
	4m/mA5HX94eMIol6603mGfp3ENGQa2ByjnonMx2a9wpMZXX7GYgT5g9vps0Oio8Bf604ehGdDua
	NZn7GMUPwnBHx4UC4/3sEmqCdz5G3xM/F/E7uux6bRyg5L1S9ngpFLufwjl7Cu30//7i0yukQoX
	+2kc7STkXw==
X-Google-Smtp-Source: AGHT+IG1bSXHS0bpB9SrnpgSiy3t2o7skv79APs7LVWlF3TOUod3SzTBdm60dVBBJHjBYfbo6u0icA==
X-Received: by 2002:a05:6000:1a85:b0:386:3c93:70ff with SMTP id ffacd0b85a97d-3864de9e47emr286354f8f.8.1733869941960;
        Tue, 10 Dec 2024 14:32:21 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f8836dbbsm62231295e9.0.2024.12.10.14.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 14:32:20 -0800 (PST)
Message-ID: <6758c174.050a0220.52a35.06bc@mx.google.com>
X-Google-Original-Message-ID: <Z1jBccAhjYjXTNRV@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 23:32:17 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241210211529.osgzd54flq646bcr@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210211529.osgzd54flq646bcr@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_143224_054497_A02D9D8D 
X-CRM114-Status: GOOD (  20.05  )
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

On Tue, Dec 10, 2024 at 11:15:29PM +0200, Vladimir Oltean wrote:
> On Mon, Dec 09, 2024 at 02:44:22PM +0100, Christian Marangi wrote:
> > +int an8855_mii_set_page(struct an8855_mfd_priv *priv, u8 phy_id,
> > +			u8 page) __must_hold(&priv->bus->mdio_lock)
> > +{
> > +	struct mii_bus *bus = priv->bus;
> > +	int ret;
> > +
> > +	ret = __mdiobus_write(bus, phy_id, AN8855_PHY_SELECT_PAGE, page);
> > +	if (ret < 0)
> > +		dev_err_ratelimited(&bus->dev,
> > +				    "failed to set an8855 mii page\n");
> > +
> > +	/* Cache current page if next mii read/write is for switch */
> > +	priv->current_page = page;
> > +	return ret < 0 ? ret : 0;
> > +}
> > +EXPORT_SYMBOL_GPL(an8855_mii_set_page);
> 
> You could keep the implementation more contained, and you could avoid
> exporting an8855_mii_set_page() and an8855_mfd_priv to the MDIO
> passthrough driver, if you implement a virtual regmap and give it to the
> MDIO passthrough child MFD device.
> 
> If this bus supports only clause 22 accesses (and it looks like it does),
> you could expose a 16-bit regmap with a linear address space of 32 MDIO
> addresses x 65536 registers. The bus->read() of the MDIO bus passthrough
> just performs regmap_read(), and bus->write() just performs regmap_write().
> The MFD driver decodes the regmap address into a PHY address and a regnum,
> and performs the page switching locally, if needed.

Doesn't regmap add lots of overhead tho? Maybe I should really change
the switch regmap to apply a save/restore logic?

With an implementation like that current_page is not needed anymore.
And I feel additional read/write are ok for switch OP.

On mdio I can use the parent-mdio-bus property to get the bus directly
without using MFD priv.

What do you think?

-- 
	Ansuel

