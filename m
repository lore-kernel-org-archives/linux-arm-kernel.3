Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F64D6204F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 09:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lehm2E2Ghd4Klp9dMDc9xaKx+hfA1vHJJkOnPu9oa0s=; b=IEyN1XQKuvp/sjgKGnU+xKa3Ga
	FmAKkt6MO3fohOr0fHBBw6eHr+9WaYkg+4khUIN6UIDGq0PBENHpeeWAzwNXehn/xDgciBj+bSMPs
	NwLwaR2fMfZK2Gy5Tbe73brultbR9OHHx0P2e7ErFizxp1Ud1LKut8IS1hTgdP4uB9fhNadtwqL9K
	OzCZof7jD6aSP+IPnOzhhGgx0lJ1qrS90P3uG44jB6UUYSy3Rfzwk5ATw0Li5+CZTfs32egDzvBHF
	e7MBG6jZEPxsOmeR6Qv7vXCMYjOOL6MVxG6cqqSDkffTRnF40Tr0Z2PHzEXUcgct8/Akr1UefHRlC
	weHjWkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKqn-0000000BwaC-2Jml;
	Tue, 19 Nov 2024 09:48:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKpr-0000000BwOj-1sQM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 09:47:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tDKpT-0005uf-6K; Tue, 19 Nov 2024 10:47:27 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tDKpQ-001Xed-1N;
	Tue, 19 Nov 2024 10:47:24 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tDKpQ-003HSG-10;
	Tue, 19 Nov 2024 10:47:24 +0100
Date: Tue, 19 Nov 2024 10:47:24 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2 1/2] net: phy: replace phydev->eee_enabled with
 eee_cfg.eee_enabled
Message-ID: <ZzxerMEiUYUhdDIy@pengutronix.de>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
 <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
 <c1bb831c-fd88-4b03-bda6-d8f4ec4a1681@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c1bb831c-fd88-4b03-bda6-d8f4ec4a1681@linux.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_014751_482297_AB164E8B 
X-CRM114-Status: GOOD (  41.46  )
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

On Tue, Nov 19, 2024 at 05:06:33PM +0800, Choong Yong Liang wrote:
> 
> 
> On 15/11/2024 9:37 pm, Russell King (Oracle) wrote:
> > On Fri, Nov 15, 2024 at 07:11:50PM +0800, Choong Yong Liang wrote:
> > > Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
> > > designed to have EEE hardware disabled during the initial state.
> > > 
> > > In the initial stage, phy_probe() sets phydev->eee_enabled to be disabled.
> > > Then, the MAC calls phy_support_eee() to set eee_cfg.eee_enabled to be
> > > enabled. However, when phy_start_aneg() is called,
> > > genphy_c45_an_config_eee_aneg() still refers to phydev->eee_enabled.
> > > This causes the 'ethtool --show-eee' command to show that EEE is enabled,
> > > but in actuality, the driver side is disabled.
> > > 
> > > This patch will remove phydev->eee_enabled and replace it with
> > > eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(),
> > > it will follow the master configuration to have software and hardware
> > > in sync.
> > 
> > Hmm. I'm not happy with how you're handling my patch. I would've liked
> > some feedback on it (thanks for spotting that the set_eee case needed
> > to pass the state to genphy_c45_an_config_eee_aneg()).
> > 
> > However, what's worse is, that the bulk of this patch is my work, yet
> > you've effectively claimed complete authorship of it in the way you
> > are submitting this patch. Moreover, you are violating the kernel
> > submission rules, as the Signed-off-by does not include one for me
> > (which I need to explicitly give.) I was waiting for the results of
> > your testing before finalising the patch.
> > 
> > The patch needs to be authored by me, the first sign-off needs to be
> > me, then optionally Co-developed-by for you, and then your sign-off.
> > 
> > See Documentation/process/submitting-patches.rst
> > 
> > Thanks.
> > 
> > pw-bot: cr
> > 
> 
> Sorry for the late reply; I just got back from my sick leave. I wasn't aware
> that you had already submitted a patch. I thought I should include it in my
> patch series. However, I think I messed up the "Signed-off" part. Sorry
> about that.
> 
> The testing part actually took quite some time to complete, and I was
> already sick last Friday. I was only able to complete the patch series and
> resubmit the patch, and I thought we could discuss the test results from the
> patch series. The issue was initially found with EEE on GPY PHY working
> together with ptp4l, and it did not meet the expected results. There are
> many things that need to be tested, as it is not only Marvell PHY that has
> the issue.

Hm, the PTP issue with EEE is usually related to PHYs implementing the
EEE without MAC/LPI support. This PHYs are buffering frames and changing
the transmission time, so if the time stamp is made by MAC it will have
different real transmission time. So far i know, Atheros and Realtek
implement it, even if it is not always officially documented, it can be
tested.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

