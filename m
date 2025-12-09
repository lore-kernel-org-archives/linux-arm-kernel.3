Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE2BD3B994
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1Q2uDduf66UtYmH0gKmUDjODIcqlhFNLGyTzwxqXLw=; b=waClZY1kEgtDxVEMmPVm5mApUu
	Ep0K24lJppgHMr1cUdfQK1Nss/A40gfausWJZuhuIgMIOovH/PbF1Hwdl5k2aw5/nLRmNt6Mo3Iy/
	FLhD/dQmt8nokAQJQamFcK5JB0pvDe6YPGPs89WFiEq25gC/ov4br5/cOP4NGcozUysUkQWRwElt4
	tLl04K+iJnquDMjM3IIkMqo6aXW9AedAytfuQbMN3nmvUSLXe/QGUlA7Gf56gtrtIdIvMoQ1qwLSP
	qeMfRVobS5GCwFjh5D0a4kHI71lw7HMKbEaeTL2i+ftdV8guzX6QVyNRlb69rqUloZvc64NsG3DUT
	KSLsNJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4fO-0000000EkOw-3NCP;
	Tue, 09 Dec 2025 20:50:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4fO-0000000EkOo-0fUa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:50:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3973D60051;
	Tue,  9 Dec 2025 20:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA14C4CEF5;
	Tue,  9 Dec 2025 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765313436;
	bh=+NrxrvZMgkcpBUKcfznjEv3pgGvqP8bd/L6BGqUssYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2FHVx10lU9ymJ024KMK22dlyRk155qhGloao/pSRz4jhhFpXovieBQvErMqIjWb0
	 AdZYlCm48RH3jrzdGsS/A55Wdu3GDDkl+qUTLvPs0cg1bd27lhDg6VjF4eyQtc9Pv7
	 ucRGmTR5z070mWSQ0GBmGg/MF17WszEWWkJA8b7e+bvOBrI8mFv8yg92qsOdtvQv0M
	 fsUjo5De94mBVOfFI1b3L7nVyZbOFGz60p5XuV1v/cjaI8zRQnF7Z6a4UX1Q8q98YJ
	 RO6IGfa/XlMnaLYkxPSQ1XFordW8jMm90tsWcYYLbYfoot2Y8PoiZ3n0nYeQ3yOJ0Z
	 buLKTnh/ZOkGA==
Date: Tue, 9 Dec 2025 14:50:34 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v5 3/4] net: ftgmac100: Add RGMII delay support
 for AST2600
Message-ID: <20251209205034.GB1056291-robh@kernel.org>
References: <20251205-rgmii_delay_2600-v5-0-bd2820ad3da7@aspeedtech.com>
 <20251205-rgmii_delay_2600-v5-3-bd2820ad3da7@aspeedtech.com>
 <8a991b33-f653-4f0c-bbea-b5b3404cdfe6@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a991b33-f653-4f0c-bbea-b5b3404cdfe6@lunn.ch>
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

On Sat, Dec 06, 2025 at 07:30:30PM +0100, Andrew Lunn wrote:
> > @@ -1907,6 +2179,10 @@ static int ftgmac100_probe(struct platform_device *pdev)
> >  		priv->rxdes0_edorr_mask = BIT(30);
> >  		priv->txdes0_edotr_mask = BIT(30);
> >  		priv->is_aspeed = true;
> > +		/* Configure RGMII delay if there are the corresponding compatibles */
> > +		err = ftgmac100_set_internal_delay(priv, &phy_intf);
> > +		if (err)
> > +			goto err_phy_connect;
> 
> Thinking forward to when you add 2700 support, i really think you need
> to break the probe up into helpers for 2500 and before, 2600 and in
> the future 2700. You currently have a couple of tests on the
> compatible which you can reduce to one.
> 
> In fact, this driver has 10 calls to of_device_is_compatible(). I
> think you should first refactor the code to list each compatible in
> ftgmac100_of_match[], and add a data structure which contains an enum
> of the MAC type. You can then transfer this to priv, and replace all
> the of_device_is_compatible() tests to just look at the enum value.

Better yet, define a structure which defines the different settings 
directly. Such as:

priv->rxdes0_edorr_mask
priv->txdes0_edotr_mask
priv->is_aspeed

And anything else needed...

Rob

