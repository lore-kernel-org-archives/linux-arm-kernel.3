Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EFDC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUN5pHcyJvvH3OmnBbLrWeM+/zZkkxuwsFuxwTvxTUE=; b=phOq9z3ZSMzIOGXFtsuIe/T07h
	LDZ+EZ01w99nx7NIDKX2aGKynddZij5a0AlDEcmkS6qbwLQbR+vXaRhY/YH76exUqxNRBElT4DOMT
	fEPcmCJwyGP9BbQcQGRb5LWN1m0LDPNzIWUPN7+3Qq4R9G0KIfB5X9YYyovuxSpljGmvvqqfyaQcr
	C0gc9JQBse+XVey3iwyLWdke2h/O50+IIy3u1mSHMHfhMnkcdo3ncBQvlqViQ+dPeUBAEC6iGkVFv
	f970kAzPi+5ILxyEmhjTS8n29vkjHE+VMReCEuSdYPwmrafFyd/H4kXpN4rxdhld6NsT2fU2+ILIn
	KN0kmnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABsA-0000000EIS8-30H1;
	Fri, 25 Sep 2026 19:46:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABs7-0000000EIRN-44zX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZUN5pHcyJvvH3OmnBbLrWeM+/zZkkxuwsFuxwTvxTUE=; b=2pm9hX620kdefDI1x8sSar48MA
	grw9ppEZSLamxgXUaAViwpIWQ1FbE07rTAX8Fa92eu8FbRoKh1Y/May3YTNzdd6imgS4+h41Caiij
	8/sybZyoqGrceia0Qqcn4eldN4Tb6sCVDJyu/+VhWrvnGwHmQoVhiY6vAmk1qleBadI0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xABrq-007I4E-Cr; Fri, 25 Sep 2026 21:45:58 +0200
Date: Fri, 25 Sep 2026 21:45:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 0/5] net: stmmac: Add support for Allwinner
 A733 GMAC210
Message-ID: <b41e7fe4-2ec8-428e-81ff-47e1c75003b1@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
 <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
 <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
 <1jv77u8yak.fsf@starbuckisacylon.baylibre.com>
 <491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch>
 <1jse2x91oh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jse2x91oh.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_124616_022796_C865A94C 
X-CRM114-Status: GOOD (  18.21  )
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

> > You need to differentiate between small fine tuning delays, and the
> > 2ns delay required by the RGMII standard. If the MAC is just doing
> > fine tuning, you need to still pass PHY_INTERFACE_MODE_RGMII_ID so the
> > PHY adds the 2ns delay. If the MAC is adding a big delay, you need to
> > pass PHY_INTERFACE_MODE_RGMII to the PHY.
> 
> The PHY is one concern but the series here does not really address this
> topic. DTS and board specific concerns will come later.

They are all interconnected. When phy-mode says 'rgmii-id', it is the
MAC/PHY pair which needs to decide who adds the delay. If the phy-mode
is 'na', how does the MAC know it needs to use RGMII, not MII, as you
said.

We need to keep the big picture in mind, otherwise you could go down a
dead end, and a dead end which makes backwards compatibility really
messy.

> It is really just the MAC. So, how does the MAC is supposed to
> make the decision to amend the PHY mode ? is there a threshold you'd
> like to recommend for this differentiation ? 

This is the first time we have had this condition. So it has not
really been thought about too much. Maybe 1ns. That is the middle of
the 2ns required by RGMII.

> I'll try to reach out, just in case. I have the schematics but without
> the PHY doc, it does not help much.

From that i assume you missed the other emails. Somebody from ARM give
a link to the data sheet. It documents the strapping. Search for the
patch adding the PHY driver, it is in that thread.

	Andrew

