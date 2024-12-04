Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F75E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okVu3EWXg5ZKgPN58NmG9R0ASPajE8msC4O7SNVEAX8=; b=aQEsuYnLJGUgZYLdQtTz4SUhDq
	RAAtEDM6v7PKIjS2RyDzWn/Y21Hd4So4SB4TCwkDDTk+nFIh8pynlhg1QDj3MDW6dOeGsZjQgBP3x
	Q+vh7SlK1rQWONOFw7th0pmnk7Kz5AFXZzLj1sTCUCas45kwfdV3+t5jjoFcvs0x7fBvLzsfZidES
	eqe1iCyYiO5K+G3GXX94mbavmzSU7SL9XJqJKeeR1U3/1QNbJHPJDI5FIbCOrAqfsSjxZjjcQDi/S
	kMWa9ve71kWEjVkM+qIZF8kVucbF08C1gzlioHFBaPnqMDrorPgZfqqiWIOSRNd1W7i5DcBnJA7U6
	tIwiFdLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlbL-0000000C1Zd-00kC;
	Wed, 04 Dec 2024 09:23:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlaJ-0000000C1RY-3vDe;
	Wed, 04 Dec 2024 09:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=okVu3EWXg5ZKgPN58NmG9R0ASPajE8msC4O7SNVEAX8=; b=ozygJ8ntGUL2SuY2qeYJa4D8Sl
	PmSm3PgpmrT5v3mdT5RnXi7jA9UdSVRzNj12RyGvlCRDyReEGiHIrj6tlriwes83yo/sqThAPQo9J
	kRajDoRSL/ASBxwZikwhXxH3eaXoG6LxgzWC6OqX8XhIutXgJ+E+yhDA4HR8uRYJyu7wY8axE4jJ2
	oJNsznRYJkizcFYZngvCji3vFeeHVqZRrO05MXOcc8zj+m6wwapZMvZtvH66ZLU+DchaAKbs6mMEj
	BVn6LLjmBXvtwxiO0FfXpV/JlNefpt5wfLxfcljxDXJKq73oFp86UMiTm42ptTMSBwUkvb37KBW/B
	xEo99K7w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41554)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tIla3-00032D-0w;
	Wed, 04 Dec 2024 09:21:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tIlZz-0005RO-1q;
	Wed, 04 Dec 2024 09:21:55 +0000
Date: Wed, 4 Dec 2024 09:21:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v8 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <Z1AfM5PzlTN19hF3@shell.armlinux.org.uk>
References: <20241204072427.17778-1-ansuelsmth@gmail.com>
 <20241204072427.17778-4-ansuelsmth@gmail.com>
 <20241204100922.0af25d7e@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204100922.0af25d7e@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_012215_971671_DBF9413A 
X-CRM114-Status: GOOD (  20.65  )
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

On Wed, Dec 04, 2024 at 10:09:22AM +0100, Maxime Chevallier wrote:
> Hello Christian,
> 
> On Wed,  4 Dec 2024 08:24:10 +0100
> Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > +static void
> > +an8855_phylink_mac_config(struct phylink_config *config, unsigned int mode,
> > +			  const struct phylink_link_state *state)
> > +{
> > +	struct dsa_port *dp = dsa_phylink_to_port(config);
> > +	struct dsa_switch *ds = dp->ds;
> > +	struct an8855_priv *priv;
> > +	int port = dp->index;
> > +
> > +	priv = ds->priv;
> > +
> > +	if (port != 5) {
> > +		if (port > 5)
> > +			dev_err(ds->dev, "unsupported port: %d", port);
> > +		return;
> > +	}
> 
> Looks like the above condition can be simplified to :
> 
> 	if (port > 5)
> 		dev_err(...);

Not quite, since if port is 0..4, the function returns at this point.
If >5, then it prints an error and returns. So:

	if (port > 5)
		dev_err(...);
	if (port != 5)
		return;

However, net/dsa/dsa.c::dsa_switch_parse_ports_of() already validates
that the port number will not exceed ds->num_ports, so if that is set
appropriately, the phylink functions will never be called with a port
number larger than this, and checking it is redundant.

So I think this should just be:

	if (port != 5)
		return;

> > +	case 5:
> > +		phy_interface_set_rgmii(config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> > +			  config->supported_interfaces);
> > +		break;
> > +	}
> > +
> > +	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +				   MAC_10 | MAC_100 | MAC_1000FD;
> 
> For port 5, you may also add the MAC_2500FD capability as it supports
> 2500BASEX ?

Agreed, that's needed.

> > +		case SPEED_5000:
> > +			reg |= AN8855_PMCR_FORCE_SPEED_5000;
> > +			break;
> 
> There's no mention of any mode that can give support for the 5000Mbps
> speed, is it a leftover from previous work on the driver ?

Or maybe it's because 5GBASE-R wasn't a phy interface type when the
driver was originally developed (iirc it's a relatively recent
addition.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

