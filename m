Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1037CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4Vhb+pWajT1Ug9vm6p2q425XInEco8nPyGgnsCFC6I=; b=IO2le4NpMZDkWUkmpcn5USsAWy
	fgU5lBCGKlmKvWCHTTiyWmttuoR4j/mpWL9wmibOZjBXD71dOa3quQxPRWwtoVCwZbCrOJYypOLMk
	ftl5iYDNA/X4dRmIv51cCsNkZibfocZ3hH6DeR6xIruAVCzvGgmEXRdG1s4qaqJR4Ggw+LSJO5vUX
	8ozGmbdtPKfNzE6SUmAPHMkhCENLeMbg0tf+K1RyU+9SYgABqft/5wvaR7Jj9Pb0DDDEAZSo8ybyL
	ZZ4uqTdEK4YbjkZAqeBBj19iT3QPDaqOqmXo5Xi/H2x3oCbJITE3dHNcKjU6d9dpY5eoIY8WTbM0a
	ytuaAdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99V6-00000002yuQ-23Qq;
	Wed, 15 Oct 2025 21:57:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99V3-00000002yu5-1tG5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w4Vhb+pWajT1Ug9vm6p2q425XInEco8nPyGgnsCFC6I=; b=mn7QF/uGABpKN3xNzZQhmz2z8B
	o11ld6ctbXR/ky2Bzy9GmguS3MZrXnF1v2rYnkjP5YhUCZo59ImkCcNqhMFbUqqZQngxwTgx92ZgP
	uUcm3aQsK5C3oeuTJBBTA4Gjy7CdOrDM7lZERKde429KjydqJBEKRvmUAlv4qS4lv/4CxMntHi6Ri
	B4m95goSjEKH1jPj2ZEIvSgu3K+3K8pRLhYL5jP6gUIBKXXpuBTVy5nhRltxZuXFPSEphg8trRGUe
	DyxHgnVYT6D5oWp5MRGliTSF6l4qTUbUxfZn86zYEQT44SrSmakBSNxf9lqsMxS+akwDPJ+7/yJjR
	NxC1+iNw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33366)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v99Uh-000000005Vv-0ZMi;
	Wed, 15 Oct 2025 22:57:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v99Ua-000000002di-3k6X;
	Wed, 15 Oct 2025 22:57:08 +0100
Date: Wed, 15 Oct 2025 22:57:08 +0100
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
Subject: Re: [PATCH net-next 14/14] net: stmmac: convert to phylink PCS
 support
Message-ID: <aPAYtHPcF5bes7Xi@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92NJ-0000000AmHi-1ZGJ@rmk-PC.armlinux.org.uk>
 <040a2f29-4c95-4561-87c0-2a70308d3f00@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <040a2f29-4c95-4561-87c0-2a70308d3f00@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_145737_508856_505F5E77 
X-CRM114-Status: GOOD (  11.69  )
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

On Wed, Oct 15, 2025 at 11:31:37PM +0200, Andrew Lunn wrote:
> > - create stmmac_pcs.c, which contains the phylink_pcs_ops structure, a
> >   dummy .pcs_get_state() method which always reports link-down
> 
> I've not followed the PCS code too closely. Why always report link
> down? Why is a dummy method needed?

If phylink is put into inband mode, and a PCS is supplied to phylink
where this method left NULL, the kernel will oops.

As the code stands today in mainline, if phylink were to be put into
inband mode with the integrated PCS, then there will be no phylink PCS,
and so phylink_mac_pcs_get_state() will fall into the "else" path of:

        pcs = pl->pcs;
        if (pcs)
                pcs->ops->pcs_get_state(pcs, pl->pcs_neg_mode, state);
        else
                state->link = 0;

and force the link down.

So, adding this method keeps the status quo - not oopsing the kernel
and not allowing the link to come up. No unintended behavioural
change in this regard from how it would behave today. :)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

