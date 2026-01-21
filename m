Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE61D262AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDOJWUmdk5su3pn932MroBf+XrhEzSL8mJ7nZmaOaZY=; b=YcobzO2NW+zTNbG6LsBC8iSu/V
	504Sb3a3wjFXP/9bdUl5mZIUOg7IkHLVGTDV9GyCWPl5LvNLag/gI1oVnzLB/WFGXLwCI+cs2RMUI
	ufPiiPxvfasEHQTtHUr4P8uaQbmFUU8aResOzOUyjYWYzGZFzD2Nkr90TEOnB9MTlTRSF50lWZTQp
	BNRQ39alyOSVzRBpk3wqBUQ4k4vSDqYsmnGUUHZubDLJu7WJ0PlyHlpi+wjCgXCtB4VrFl74xoQgM
	NS5WUu3cOe/PsrCetnLRn276HDy+hx5+4O1u/ERUYxj913nWOGgv6Hmvmf6lOLgjwCQHQALyGeMVO
	3bBfMS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viN2q-00000004i4s-1d6E;
	Wed, 21 Jan 2026 01:30:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viN2o-00000004i47-1UfA;
	Wed, 21 Jan 2026 01:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BDOJWUmdk5su3pn932MroBf+XrhEzSL8mJ7nZmaOaZY=; b=YMq82IemHhQwH5ZmuAYjfxC2ca
	SiARZTjIS9ursQLhJulw2hwL2pS9h8JGcdqkhS5tzb73fNnp+WPXGxnC84w8j98KyuLvs4SzlC+1a
	KFPU2ljW13NNkUUIyxAh+nJj5WIIU+BtsAuiYoKCLAQ3cVDhElltuenA/diVPsOkYdvw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viN2B-003lN7-E1; Wed, 21 Jan 2026 02:29:23 +0100
Date: Wed, 21 Jan 2026 02:29:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <cd5c882e-1632-4623-92d3-8a433c8ccdbb@lunn.ch>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <f8e4c5ec-94b1-4da0-8a40-976770514828@lunn.ch>
 <aXACRN7BaumIySp3@inochi.infowork>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXACRN7BaumIySp3@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_173002_396616_9B98BE23 
X-CRM114-Status: GOOD (  15.88  )
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

On Wed, Jan 21, 2026 at 06:36:01AM +0800, Inochi Amaoto wrote:
> On Tue, Jan 20, 2026 at 02:56:26PM +0100, Andrew Lunn wrote:
> > > +/* Note: the delay step value is at 0.1ps */
> > > +static const unsigned int k3_delay_step_10x[4] = {
> > > +	367, 493, 559, 685
> > > +};
> > 
> > Am i reading it correctly that RGMII delays are limited to these four
> > values?
> > 
> > If so, please add this list to the DT binding.
> > 
> 
> No, these value are just adjustment interval, and it is also
> controlled by another code register, the final delay is calculated
> by the following formula:
> 
> delay = delay_step * delay_code * 0.9;
> 
> So the delay configuration needs to be calculated instead of
> directly assigned.

O.K.

So what is the actual range? Can is do 1000ps? 2000ps? 3000ps? Should
there be a basic range check to avoid dumb typos?

  Andrew

