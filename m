Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50415E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3A2A2dyYCIFcqs3vUodXDpOQcBZ1CzrLM96sSXpgMM=; b=AmU0Z9RhYnalixIzWCUGltKnbg
	NKn4ulpoFQU1ravIWq5ExpGNiqG8ekBmA0a/ED1m5EbgLGTHflhgODFMwGBS12KwBOTcpstK5M6aA
	ik1IS6GZLs5OBGeP51FC1z0qa/hDXCEB70kdw1XH9AVqeBjSK1GXaLazKc2lYNAcpfVAXDopfdTYU
	wXlUULopXVgd2KbLvPk09gKRFgAqoTGDc0zH19b3Hdr4GXiL6DRWZQwuWsK/q2hZQTl3I7R1ftEP6
	kQ1xQv/xvSuRHkZv5ojmnj9JQvDjoqrmfGAU0MVaTiJQuk8i84Z8zy+vTg/v4JAkBfv/BxWVY7R07
	XYSsUHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImHN-0000000C9lw-0sGp;
	Wed, 04 Dec 2024 10:06:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImBp-0000000C8Vu-1ZSN;
	Wed, 04 Dec 2024 10:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l3A2A2dyYCIFcqs3vUodXDpOQcBZ1CzrLM96sSXpgMM=; b=x5/WXeGBk/irKh/OT/tiRi5Gft
	L3e4DrdCYGtM4Ma9fNynoW6V6Kmkzzcxxo1joTvmLNXUNdOeeKfCI7SVtB7RFrNbte7SqV2CPwvZ1
	5vIMlVkkj8VdPRX2D0Sd3qHS8GxbyLgB0hc4UN1weBpZ60tgh8S+t8SPESfoWHzLXSCYycSevyIa8
	HWt7PR2wuLpeHLgjBGrTldjl35bnKeaDfajJYFrQhkGmp4yOvPIOt4j7BS0fOu1ly0hn6+QN8Mw/f
	2pRNf1ZlU1Vov9hivIupBBoCNuyvZb94GWfOmwsFdi8mg+1UNm5PunkAyTfI3GTMxaAdPGmgT5J1F
	9wdVhP2w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40630)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tImBZ-00035V-2u;
	Wed, 04 Dec 2024 10:00:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tImBV-0005SZ-1k;
	Wed, 04 Dec 2024 10:00:41 +0000
Date: Wed, 4 Dec 2024 10:00:41 +0000
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
Message-ID: <Z1AoSSDqAbEisuzK@shell.armlinux.org.uk>
References: <20241204072427.17778-1-ansuelsmth@gmail.com>
 <20241204072427.17778-4-ansuelsmth@gmail.com>
 <20241204100922.0af25d7e@fedora.home>
 <67501d7b.050a0220.3390ac.353c@mx.google.com>
 <Z1Af3YaN3xjq_Gtb@shell.armlinux.org.uk>
 <675021f1.050a0220.34c00a.3a0c@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <675021f1.050a0220.34c00a.3a0c@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_020101_416156_DF365460 
X-CRM114-Status: GOOD (  15.48  )
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

On Wed, Dec 04, 2024 at 10:33:33AM +0100, Christian Marangi wrote:
> On Wed, Dec 04, 2024 at 09:24:45AM +0000, Russell King (Oracle) wrote:
> > > Added 5000 as this is present in documentation bits but CPU can only go
> > > up to 2.5. Should I drop it? Idea was to futureproof it since it really
> > > seems they added these bits with the intention of having a newer switch
> > > with more advanced ports.
> > 
> > Is there any mention of supporting interfaces faster than 2500BASE-X ?
> >
> 
> In MAC Layer function description, they say:
> - Support 10/100/1000/2500/5000 Mbps bit rates
> 
> So in theory it can support up to that speed.

Maybe the internal IP supports this but the SoC doesn't?

However, I was asking about interfaces rather than speeds - so RGMII,
SGMII, 2500BASE-X... is there a mention of anything else?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

