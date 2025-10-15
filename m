Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55300CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTSdOvDlbsuQj/667Lv/041NU1iVeaPF8hOZogCvbXQ=; b=btpNAdLcUZWD/LAuQG/Ujiim+n
	kRA+EgJWpMrJmR/C2NwQO7v/26wP7MRJaw/7V/4dKQGhqFxqVRQIud6xICac8NavyIh75kJrEjxyv
	NCGlgA9f6375DEH8ZGA8WtL/4Dj9jgbO58Eu2fiGmCXUMzDCl3bDuHF9yn9wdMfULEROG85XjXuIu
	GZPP2UGzZnqsPUefQEKQVtt+icYpUUf0qcir361XfBUB7KTVTkNrxD93uznJ3s5wD+FVktXjmX7m/
	U7EDp947LPjc1r0UghempvVk2LVcDY0VXh/V0TBZSy8RSKDbCSXqrNf3FDD1m81dmKiAvs3rCXWX1
	M10fJKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99Mc-00000002yG0-1BRU;
	Wed, 15 Oct 2025 21:48:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99Ma-00000002yFY-0y7G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZTSdOvDlbsuQj/667Lv/041NU1iVeaPF8hOZogCvbXQ=; b=YuylOvSujLmb3kYb3oa3KZhd1o
	wcivn+oEGR5jMG+fLOcoNiGMQFOKlJReF4ZhQCgW6UNgwmkI7KBv/Rwe7BlB8vQBvcxbkJM/FS25R
	nbkiY2chbvHiaGiXJbu3uf20ojRKMuT53zFf1J2Vf4jui+7wXJdVEhEPIEYB3on4i4Z/ijLr3qM2t
	5pMpZA4Bg/QIYfx62+RbxJ00uIQTNyetpbTjGOrPLJvbE8pLkT9GtmaUtTSoyx3s3qK8bSjc+uYNQ
	aJ4+ULCk2sB3TksqCuRGzjct29p90b4FiKHUhV0wbNIgFvMGQR+yHmUjhLcpll5Gzf3Tl7vYPHTBd
	Oxs7DzZQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50176)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v99MA-000000005Ut-17h0;
	Wed, 15 Oct 2025 22:48:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v99M1-000000002dZ-0S6N;
	Wed, 15 Oct 2025 22:48:17 +0100
Date: Wed, 15 Oct 2025 22:48:16 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 11/14] net: stmmac: do not require snps,ps-speed
 for SGMII
Message-ID: <aPAWoDGVgeRFV95b@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92N3-0000000AmHQ-4Bm2@rmk-PC.armlinux.org.uk>
 <15ea57e0-d127-4722-b752-4989d5a443c0@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15ea57e0-d127-4722-b752-4989d5a443c0@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_144852_268844_E793BC0A 
X-CRM114-Status: GOOD (  26.12  )
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

On Wed, Oct 15, 2025 at 11:26:03PM +0200, Andrew Lunn wrote:
> On Wed, Oct 15, 2025 at 03:20:53PM +0100, Russell King (Oracle) wrote:
> > SGMII mode does not require port-speed to be specified; this only
> > switches SGMII to use the MAC configuration register speed settings
> > and the actual value is irrelevant when the link comes up.
> > 
> > As it seems the intention was to support "reverse SGMII" with this
> > setting, but the code didn't actually configure that due to a typo,
> > the warning and bad DT binding documentation has led people to
> > specify snps,ps-speed in their DT files inappropriately.
> 
> I know you hit the patch limit. Do you have a patch in the next series
> which updates the binding?

I don't at present, and I'm not sure what the point of updating it
would actually be, because this is another thing that's just broken.

The purpose of this property is to allow DT to specify the operating
speed of the link when acting as if it were a PHY on the end of a
SGMII (or RGMII) link using in-band signalling. However, because the
code mixes up GMAC_CONTROL_TE instead of GMAC_CONTROL_TC, when this
is set, the _transmit enable_ is set, rather than the _transmit
configuration_ bit, meaning the core doesn't actually send the
inband status as if it were a PHY.

So, the whole thing is pointless, it's never worked from what I can
see, and lastly... this property should not even be specifying a
speed at all, because that's what we have the fixed-link stuff for.
At best, this should have triggered a discussion about PHY
interface modes such as reverse-SGMII and reverse-RGMII that we've
recently had where the MAC is acting as if it were a PHY.

We can't get rid of it because doing so would break existing DTS
files. We can't fix it to work, because given the vagueness of the
current definition, people have added this property even when they
do not want to be operating in reverse mode.

Hence, I would like this property a slow and painful^h^h^hfree death.
Maybe mark the property deprecated, and remove all explanation of it
apart from stating that it's obsolete after this patch series has
been merged and we've proven that it's never been useful.

IMHO, it's a property that should never have existed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

