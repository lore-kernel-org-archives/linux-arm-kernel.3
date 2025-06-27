Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FD1C83026
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si55ankKHNNRv5mBFYVG1jZceZrxfv3xYH4f1i34vWI=; b=0bOCqaJOB1WwL32RHfj83c1ziU
	owq3wqCRao4p/mOG+EKC+Bl9ENDS4OlY9UT+T20LV/7fpwVpWCtXlaRivcu7TNEwr0V4B5LMvjQW9
	AM+Bvmt+VR5WJzLi1mBLJwsQ8xbZhxve4YFm/4wVKqasE7MXma9xIc7B7sqEhbV6K44wlk1Y5u8pH
	I5zgROh2yv3GWJhJSCBvVMaNdYGf+ZeBZu/gai35VxRZ4uZ54GgBy5tXtue0iAR7L9goxhDejKrAk
	d3+vGe9J+4T8oOFVa7TsyWDFwZDzZ1jWqcdmyJWQttGcwDsUj9hMePjazX3SQX0Tw/6LhX7KLNNGc
	qy2gQZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEN1-0000000FYBY-2k85;
	Fri, 27 Jun 2025 19:04:19 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCWg-0000000FMb9-0PE5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 17:06:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 753581FCF0;
	Fri, 27 Jun 2025 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751043967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=si55ankKHNNRv5mBFYVG1jZceZrxfv3xYH4f1i34vWI=;
	b=AMbfTvl/x0o7heiDRKemtWabh5ADPBUU55jyeOs0bFOtgEXgnaQxWnrmUUGI30m1n0D3Iq
	LrD39fFIZn3fiz7yjxTF7KasLbEhp03yHB09605r3NU+QJBi16MiSfggcANtnVnmPip/85
	PKBYH/MqK9/sJIHUeCmuIoeSS7aE0ymSrcOwD5KZdl9cuD3s7Loc2a75zmPhWZORwLp/wt
	x2oIZvI9PMiybTXrZjt4Bo2L3duyNYcx3o/HJcp0Vm7iXrEyjPPymaOAE4yxiS43C9UNFP
	ssOBv8rJUpGZDcX9mdk1gx6EL16mtnALf9wqqnfYgAvutoWQP62rt6UBra1kow==
Date: Fri, 27 Jun 2025 19:06:04 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Daniel Golle
 <daniel@makrotopia.org>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 05/14] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <20250627190604.41b26ead@fedora>
In-Reply-To: <5411380.WoAhosY9oF@fw-rgant>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-6-maxime.chevallier@bootlin.com>
	<5411380.WoAhosY9oF@fw-rgant>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_100610_271239_48063BFD 
X-CRM114-Status: GOOD (  15.64  )
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

Hi Romain,

On Tue, 13 May 2025 14:25:18 +0200
Romain Gantois <romain.gantois@bootlin.com> wrote:

> Hi Maxime,
> 
> On Wednesday, 7 May 2025 15:53:21 CEST Maxime Chevallier wrote:
> > Some PHY devices may be used as media-converters to drive SFP ports (for
> > example, to allow using SFP when the SoC can only output RGMII). This is
> > already supported to some extend by allowing PHY drivers to registers
> > themselves as being SFP upstream.
> >   
> ...
> >   *
> > @@ -149,6 +151,21 @@ void phy_port_update_supported(struct phy_port *port)
> >  		ethtool_medium_get_supported(supported, i, port->lanes);
> >  		linkmode_or(port->supported, port->supported, supported);
> >  	}
> > +
> > +	/* Serdes ports supported may through SFP may not have any medium set,
> > +	 * as they will output PHY_INTERFACE_MODE_XXX modes. In that case,   
> derive
> > +	 * the supported list based on these interfaces
> > +	 */
> > +	if (port->is_serdes && linkmode_empty(supported)) {  
> 
> The "supported" bitmap needs to be zeroed out before this check. If the port 
> has no mediums, then the bitmap won't be initialized at this point.

Ah true, thanks !

Maxime


