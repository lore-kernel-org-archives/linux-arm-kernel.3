Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D07EE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cy/XJ04+zf5LbxiN66hAMvCUA3gWid9DTtZSOXqwwIw=; b=e1lnjETkdL+PaC/jCdG2TMimNW
	+aSQeWJOc6+Fsp6JUOhynhX9kbybKO20UnBafsu7XmFSmT5Z79ezs1BhJVSkliUY9mI0P6BRpQzwD
	Tj7Xn8WL5K9vJUBfY4b2io5OVb75YTI4tG4LNIoyJQYyArnSf7tsH+vsasPDT7w3VJLMbYWKQ94oE
	dLdcW5TNdOUql+mbVzy0gQk/Q115UomtqckhNdPF+UIxN/G5NPFkzTxPnQ/a9V7ue4K1bYSJCMw5g
	HSKW2dzHf1uOyVdmq/dMKotIeOnLW/8HkqTZTim+ykK1P0LZJEEPYFQwQn3MxDFzW3unBAW9ccQi+
	InKfXRaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIldv-0000000C2EK-40zO;
	Wed, 04 Dec 2024 09:25:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlcv-0000000C25E-1aOt;
	Wed, 04 Dec 2024 09:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Cy/XJ04+zf5LbxiN66hAMvCUA3gWid9DTtZSOXqwwIw=; b=xpd9hEgI7XauUdJTL4JW/stQ64
	5V8Pt/IwwETi+P6/XqImUjn6tmDH8mGrBM985xtQ0aL16sW0E0Ru1UccmYSx6CKH5cwUqFK7UtYe3
	JWCUBmQ//Q3GNNP7zTe01I3eGt7LjayInwDb9h36o+UVftNZBBNcOBQS5gZWbgspf8NXQY4RJMZTU
	JgcOVNWPpXqyJx4Ro8XpKpq8oxtM0voPZg14xD8GmvqA6BpS/A95hKQhTFAxlSmeYk2fm3WNJrg7b
	1qrRt0H20hDOM1QQxFrK0GW/9OOxiKsx7LyQBpP2n+hqgUtJrDH8HAinYxqQhkk+Wb4D438hcK49/
	oFd3awpw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43590)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tIlcl-00032d-0T;
	Wed, 04 Dec 2024 09:24:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tIlcj-0005RX-2j;
	Wed, 04 Dec 2024 09:24:45 +0000
Date: Wed, 4 Dec 2024 09:24:45 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
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
Message-ID: <Z1Af3YaN3xjq_Gtb@shell.armlinux.org.uk>
References: <20241204072427.17778-1-ansuelsmth@gmail.com>
 <20241204072427.17778-4-ansuelsmth@gmail.com>
 <20241204100922.0af25d7e@fedora.home>
 <67501d7b.050a0220.3390ac.353c@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67501d7b.050a0220.3390ac.353c@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_012457_416639_BCEA89C8 
X-CRM114-Status: GOOD (  20.60  )
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

On Wed, Dec 04, 2024 at 10:14:31AM +0100, Christian Marangi wrote:
> On Wed, Dec 04, 2024 at 10:09:22AM +0100, Maxime Chevallier wrote:
> > > +	case 5:
> > > +		phy_interface_set_rgmii(config->supported_interfaces);
> > > +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> > > +			  config->supported_interfaces);
> > > +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> > > +			  config->supported_interfaces);
> > > +		break;
> > > +	}
> > > +
> > > +	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > > +				   MAC_10 | MAC_100 | MAC_1000FD;
> > 
> > For port 5, you may also add the MAC_2500FD capability as it supports
> > 2500BASEX ?
> > 
> 
> I didn't account for the CPU port that runs at 2.5. The LAN port are
> only 1g. Will add or maybe add the 2500FD only for cpu port?
> 
> Maybe Russel can help in this?

*ll* please.

Well, 2500BASE-X runs at 2.5G, so if MAC_2500FD isn't set in the mask,
validation will fail for 2500BASE-X.

> > > +		case SPEED_5000:
> > > +			reg |= AN8855_PMCR_FORCE_SPEED_5000;
> > > +			break;
> > 
> > There's no mention of any mode that can give support for the 5000Mbps
> > speed, is it a leftover from previous work on the driver ?
> > 
> 
> Added 5000 as this is present in documentation bits but CPU can only go
> up to 2.5. Should I drop it? Idea was to futureproof it since it really
> seems they added these bits with the intention of having a newer switch
> with more advanced ports.

Is there any mention of supporting interfaces faster than 2500BASE-X ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

