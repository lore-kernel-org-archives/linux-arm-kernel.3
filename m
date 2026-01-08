Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBD2D1D480
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3siOpUNTPvOetSwU3kkXTXaIQvHOmBaMe0L2dosaTxU=; b=Cj8Cvo9mmGKLVQ1buP7d1Vw3kd
	q0EFex1Gopo1hI9d3lUkhTZw4DtHdGVbfHFj3lrZTPUZbLXfX3aInyLaeF6t8dmrAShBdg3NoTSFR
	r6jy+ALRO5RB6OLmKuU+xltxFg2uY3jka5VLx+gMsPcHET+w5B13rFz95MK1n5+RVqd897oPmm1fJ
	x/YN3ppQ3PuwIbAuIPZi+I0s8op3jQOw7eq0W3EynuRHCILPZG7ZlAfuP1cgc8h7El7ycugXPytbk
	K5RzIHZNkJ4vzcmppy1S3WjKvI8Z1x9dyOrVF2RujeeBYUq9XM+AqhZTkJAOJURZE3tRU744o60pH
	T1SeSDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtGY-00000000Dg3-4AFV;
	Thu, 08 Jan 2026 16:53:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtGW-00000000De2-2mHU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3siOpUNTPvOetSwU3kkXTXaIQvHOmBaMe0L2dosaTxU=; b=o6ybf19FQhA2/H0eXyYAWhtYCg
	E8J7QNNibSepM+CpqXDcjTCEXSDmnR7+vAORpbZk4kTZVsegRNEgFkFKinfF9y0Z2M4cnpsdnuDzL
	I2rpUSBEqhBNs9pXdH3OOo7nj6AT4CkgeTF8RlYKVLskcyCD3aEgYDT3wNANa9m+a3ws=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdtGL-001zEW-Ds; Thu, 08 Jan 2026 17:53:29 +0100
Date: Thu, 8 Jan 2026 17:53:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v22 02/14] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <b8da3ec2-0775-4d81-8867-4993325a1e6c@lunn.ch>
References: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
 <20260108080041.553250-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108080041.553250-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_085340_702512_AA090941 
X-CRM114-Status: GOOD (  19.22  )
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

On Thu, Jan 08, 2026 at 09:00:27AM +0100, Maxime Chevallier wrote:
> In an effort to have a better representation of Ethernet ports,
> introduce enumeration values representing the various ethernet Mediums.
> 
> This is part of the 802.3 naming convention, for example :
> 
> 1000 Base T 4
>  |    |   | |
>  |    |   | \_ pairs (4)
>  |    |   \___ Medium (T == Twisted Copper Pairs)
>  |    \_______ Baseband transmission
>  \____________ Speed
> 
>  Other example :
> 
> 10000 Base K X 4
>            | | \_ lanes (4)
>            | \___ encoding (BaseX is 8b/10b while BaseR is 66b/64b)
>            \_____ Medium (K is backplane ethernet)
> 
> In the case of representing a physical port, only the medium and number
> of pairs should be relevant. One exception would be 1000BaseX, which is
> currently also used as a medium in what appears to be any of 1000BaseSX,
> 1000BaseCX, 1000BaseLX, 1000BaseEX, 1000BaseBX10 and some other.
> 
> This was reflected in the mediums associated with the 1000BaseX linkmode.
> 
> These mediums are set in the net/ethtool/common.c lookup table that
> maintains a list of all linkmodes with their number of pairs, medium,
> encoding, speed and duplex.
> 
> One notable exception to this is 100BaseT Ethernet. It emcompasses 100BaseTX,
> which is a 2-pairs protocol but also 100BaseT4, that will also work on 4-pairs
> cables. As we don't make a disctinction between these,  the lookup table
> contains 2 sets of pair numbers, indicating the min number of pairs for a
> protocol to work and the "nominal" number of pairs as well.
> 
> Another set of exceptions are linkmodes such 100000baseLR4_ER4, where
> the same link mode seems to represent 100GBaseLR4 and 100GBaseER4. The
> macro __DEFINE_LINK_MODE_PARAMS_MEDIUMS is here used to populate the
> .mediums bitfield with all appropriate mediums.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

