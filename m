Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA08D0C5FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2MW9dBfGIjPH9ia2UnRa1xMIgs+qL+dRFmTpOXPkFQ=; b=T0aF6gyXaSnCHncOMQUABzYZzH
	brkEmKvY3fZVYeVVYP6ISyw251aGqDwIxQR4CbMHdK9Uhc75me4R3rMDYOhWaqhEErCrt+l+pABw4
	w/iS2KHRvFMOdYMHE6grXgQry9nV7HChhgJ6PjmjcHMCTL0BNZBAQ53mmqpasdb+ObwDzeyPK6MwP
	+Y/kq/lhD6EQ60e9bmljbMyoepntEoscx/lPKqIEUANm2up2t4APgaGgaajTzwOp5eLK38LUI+T7T
	/exPbajif64VoIQMfVHXqDVaXgmQ+MKs3BbwIi4UCqZD/+COgpafbhrnEg6lE6GvkeTMRrvKL/2Ww
	ciA+AQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IMx-00000003UXJ-2IYG;
	Fri, 25 Oct 2024 11:20:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4I4Y-00000003Riz-1Rf2;
	Fri, 25 Oct 2024 11:01:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43159c9f617so18809165e9.2;
        Fri, 25 Oct 2024 04:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729854096; x=1730458896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q2MW9dBfGIjPH9ia2UnRa1xMIgs+qL+dRFmTpOXPkFQ=;
        b=F8QL4b4X7B87Eb5IH3WDT+Bn8iMlBzGfDaFSqD7cckT6cM4UMXKS+KTZEinhhfR8/K
         4ebujlcw9Xtq4dJG08PnovOPjkB5/AoEzuI7HjbxjDvyiopf7ggAzRFJbkT3DlSsxUX2
         VqKl21Oek7X1wahpfS6XhHA5lz6e0xt69EqWLk+0Kop+wE32Lob1aJz/u8H2kkhdGFhn
         /4wNiSgKYWDYiWCg1sFQqP1AgyrOsbY3pqDzV5buJ6KHBkOljQonGHWAdr8UOoMG2Kvc
         pBPSdDQcHHY4fZQkY5U/O+6P1Azj21yvfaKvHrs7o8jL6zZMcY/nVGKi9k6sFnbg375h
         HsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729854096; x=1730458896;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2MW9dBfGIjPH9ia2UnRa1xMIgs+qL+dRFmTpOXPkFQ=;
        b=EatNjlYyFDDWRL8Dh3IeF/NUv0r1x8nj++2TfEbP1eX8s8Rlk+lI6X6pOipMBH/BsS
         Yfx+2iCSN0WgAjcOgvIeQtPi5eH20b7CiQIelNFj7fMO4mNW5DPpeKCKnOBaDWmPJqHj
         1kWvIyHw/3h/LULM0Yr4w1xl6fzB7MKFXIgNVguH+njRE3LsvZd9ZVt3YGxWiWDXKyAw
         Sa50oo/++LqqaVW8nq8KGEnVO449D8RJvdBBoQ50+PIuBHDQMQdnDdU3cc0ZIjJLJs1+
         jAouF4HqHLRCBdhpI+YYBacW33I1M8BN2G5eYqTvvgUh5y+dGAzYKfjnkOEcOpPlY1Zq
         5qrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRHmoSUlT9BHXIMXfX11oi2mCA+Oyy/ijFnCC8NUtf1iMU2Xmj/KWBktEakZp8BikzoG+gOzQL9IHgnPHB1q8b@lists.infradead.org, AJvYcCWOz2DRfhqh48vHOXWvcRqN1C2hkHrunpXU+W+DN5osx11jksbMIcfc1I+N8fGhX771r53UQQPvhJEJuREme3U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzS2OVot3MyENDYzNEqw1Ksg4s4RCQtpzVVzPrB4aYIEaHx457D
	6OJVqKy8Ea9Wjeov5VRs7WuQenrMcRM5FOQXotVJ1Bew8NipKmuY
X-Google-Smtp-Source: AGHT+IFNhA5S7E2asJvPBIxZKjdqjJxeVzeuZAGwlEL6Zq8xq/EZ0pf8rhhnc8extFgzX6L5U64l5g==
X-Received: by 2002:a05:600c:3b9c:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-4318beac86fmr46015925e9.0.1729854096266;
        Fri, 25 Oct 2024 04:01:36 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935f744esm14487515e9.34.2024.10.25.04.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:01:35 -0700 (PDT)
Message-ID: <671b7a8f.050a0220.5b160.446a@mx.google.com>
X-Google-Original-Message-ID: <Zxt6i6Rq3Ylr1jnV@Ansuel-XPS.>
Date: Fri, 25 Oct 2024 13:01:31 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH v2 3/3] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
References: <20241023161958.12056-1-ansuelsmth@gmail.com>
 <20241023161958.12056-4-ansuelsmth@gmail.com>
 <4ad7b2e9-ddf1-4a82-9d60-7afd1856c770@lunn.ch>
 <67192d40.5d0a0220.33f6c1.23bc@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67192d40.5d0a0220.33f6c1.23bc@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_040138_409452_B4107AD7 
X-CRM114-Status: GOOD (  28.41  )
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

On Wed, Oct 23, 2024 at 07:07:08PM +0200, Christian Marangi wrote:
> On Wed, Oct 23, 2024 at 07:00:22PM +0200, Andrew Lunn wrote:
> > > +static int an8855_config_init(struct phy_device *phydev)
> > > +{
> > > +	struct air_an8855_priv *priv = phydev->priv;
> > > +	int ret;
> > > +
> > > +	/* Enable HW auto downshift */
> > > +	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_EXT_PAGE);
> > > +	if (ret)
> > > +		return ret;
> > > +	ret = phy_set_bits(phydev, AN8855_PHY_EXT_REG_14,
> > > +			   AN8855_PHY_EN_DOWN_SHFIT);
> > > +	if (ret)
> > > +		return ret;
> > > +	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_NORMAL_PAGE);
> > > +	if (ret)
> > > +		return ret;
> > 
> > There are locking issues here, which is why we have the helpers
> > phy_select_page() and phy_restore_page(). The air_en8811h.c gets this
> > right.
> 
> Ugh didn't think about it... The switch address is shared with the PHY
> so yes this is a problem.
> 
> Consider that this page thing comes from my speculation... Not really
> use if 1f select page... 
> From what I observed
> 0x0 PHY page
> 0x1 this strange EXT
> 0x4 acess switch register (every PHY can access the switch)
>

Just to followup on this... I checked air_en8811h registers again and
they match MII access to the switch so yes my speculation is correct.

Also extra happy since I now know what those magic values means at least
for MII.

> > 
> > Is there anything in common with the en8811h? Does it also support
> > downshift? Can its LED code be used here?
> > 
> 
> For some reason part of the LED are controlled by the switch and some
> are by the PHY. I still have to investigate that (not giving priority to
> it... just on my todo)
> 
> For downshift as you notice it's a single bit with no count...
> From their comments in the original driver it's said "Enable HW
> autodownshift"
> 
> Trying to reach them but currently it's all very obscure.
> 
> -- 
> 	Ansuel

-- 
	Ansuel

