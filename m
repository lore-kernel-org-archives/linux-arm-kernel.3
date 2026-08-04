Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85962C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 02:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBCTp/Dj4hax8K4vdk++/al4/OPtT9I69ZVO8QctjQ8=; b=LvZxP0fiwQRZoOXLaxA5NTvwiG
	C/RdHBw6ZT/oKBmcbTwdmE6gmWQk7+w0PfMzogGOvJGuMN7hvKsbsgoFjgl3Jz7WfcbFwa3j9BGwd
	Dj0DHyx7TdUrrbujPVNW+guafGAtrcQpamb06kiWjEPN6oMWJvzNWnUqfhGPmPbMBTvPuX2G8rWjA
	+2WK029r4mS8IvA7fLNTaEYxwVEEavqxFIucx5p7EXAtqkk8u+UxeM2SSCVZqSNcEt+JGnDUIeNB7
	LRXKRYe4zAmOG4164LBKVaCbh0bSy6S1uxbe+V66zeSB0Dqtx5y8pxRmwuC+cTEf8MWUJAIQvV2Em
	G6+MBLgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4o4-00000000q6Y-0PhG;
	Tue, 04 Aug 2026 02:23:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4o1-00000000q5W-2UD5;
	Tue, 04 Aug 2026 02:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KBCTp/Dj4hax8K4vdk++/al4/OPtT9I69ZVO8QctjQ8=; b=cfJHnsPS8+lt50R34OIpYaoLFK
	3lvFwqf1TuEaHrQJmULImiw3DzOwrg5RFpQF9v0Ipby2paypRM5+7jvqmZmujLgRwKkFh9J/juiLJ
	X1Qz8nuJE34gNeAFfnoL6029h1zKwlN23cRHzSHI+DEAFprImoSaATxAc7NSwMLiGJKw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wr4nj-00FtTG-BR; Tue, 04 Aug 2026 04:22:43 +0200
Date: Tue, 4 Aug 2026 04:22:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, mfd@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
Message-ID: <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch>
 <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch>
 <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_192301_630032_F642B1F0 
X-CRM114-Status: GOOD (  19.54  )
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

> > So what i'm trying to do with both of these is make it look more like
> > standard Linux building blocks.
> >
> > If that is not possible, i would actually put all this code into the
> > PHY driver. You then have a regmap property to gain access to the I2C
> > registers.
> 
> I understand the goal of using standard Linux building blocks where they
> fit, but I do not think folding these control paths into the common PHY
> driver gives the right device model here.
> 
> The AC200 and AC300 expose the same Clause 22 PHY interface, but their
> control functions are separate devices with different transports and
> lifetimes. The AC200 control function is an MFD child accessed through
> the parent I2C regmap. The AC300 control function is a separately
> addressed non-PHY MDIO device. A regmap reference only describes the
> AC200 transport; it does not represent the AC300 control device.
> 
> Folding both implementations into the common PHY driver would make that
> driver manage AC200 MFD registers and resources as well as an AC300 MDIO
> control endpoint. That would mix the package-specific control transports
> with the otherwise common Clause 22 implementation.

Given how messy this hardware is, i doubt it is discoverable. We have
been pushing back on hacks to enable various things before probe in
order to make it discoverable. So you are going to end up putting IDs
in DT so that the driver probes without it being discovered. That
means you can put any ID you want in DT, and the driver. So you have
two different phy driver structs, two different probe functions, etc.

	Andrew

