Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211A1D65C60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vq+0o5UZAFxdEgelWoO434l6bAqjjNI/4fem/VNfZD0=; b=UVFE0uZxCHV1KjxrlsjR2Duy+M
	Q2IY++8rOZlabY6PH9o0jVgMYnj3qeYaZnFi82E5uGWr7iZ0mjJc+l5s0DNNQljujej7Q7yTvTIDc
	kyvqFuUvmI2ct5vfm6k2vGHIwTHVOZ9C+LRFz+yjRfO4F9/OQWsD9u9+xnCHYDIEl4LTZoP0rFFtZ
	BiOU+v+IAX6dGhSdz38SUAgHB5L5CCbLVN6C0Zn9DKVhITYwpy27J8+9C0lwu6lsspr3314tBbcJo
	hFiiWWQxEMX/Uu6kW2bPZOdplGAxrfNE78n0oRq8icmU6m7b2QZvwIgWEtxKMb2/EKr76SAjVuVMa
	vMCGciIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBVmq-00000009IWG-245J;
	Thu, 14 Nov 2024 09:05:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBVkx-00000009I9L-2dtQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 09:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vq+0o5UZAFxdEgelWoO434l6bAqjjNI/4fem/VNfZD0=; b=zD5NOp4D51nL3FAW1pcBwyJVl2
	FxhxfgJ3tpP/uZ27OAg5hY80Mu9kbLJ7MGktRo9pgJd+G3N8RUkVd1wzUb8YIzxXs6iEI2PMBaqsH
	hoStN7BCuIY/scBdom8a4Mtt72KeszUUBSK1BALW+ob16VYfc2EzNzdztNStW7d9CULAVpHecCKfC
	KAaitanOUdWUkOIUukRB+yRq0Y5y7xJon0P3oEinFzgd7YMQ+43ZBZ3tLN+huJGGe8KLNKNyeLU3k
	UM4P2lYEXKASMHptYgHYQ8Ngglt07QHh8cNWQ3AFhVnb/mrMhxlbM4HqkFDRNXQJASNlQ+OP8J32I
	VQocwMsw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48016)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tBVkc-0007gg-0b;
	Thu, 14 Nov 2024 09:02:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tBVkV-0000yG-1x;
	Thu, 14 Nov 2024 09:02:47 +0000
Date: Thu, 14 Nov 2024 09:02:47 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v1 1/2] net: phy: Introduce phy_update_eee() to
 update eee_cfg values
Message-ID: <ZzW8t2bCTXJCP7-_@shell.armlinux.org.uk>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
 <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
 <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
 <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
 <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_010315_698264_6CADBA3F 
X-CRM114-Status: GOOD (  35.29  )
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

On Wed, Nov 13, 2024 at 06:10:55PM +0800, Choong Yong Liang wrote:
> On 12/11/2024 9:04 pm, Andrew Lunn wrote:
> > On Tue, Nov 12, 2024 at 12:03:15PM +0100, Heiner Kallweit wrote:
> > > In stmmac_ethtool_op_get_eee() you have the following:
> > > 
> > > edata->tx_lpi_timer = priv->tx_lpi_timer;
> > > edata->tx_lpi_enabled = priv->tx_lpi_enabled;
> > > return phylink_ethtool_get_eee(priv->phylink, edata);
> > > 
> > > You have to call phylink_ethtool_get_eee() first, otherwise the manually
> > > set values will be overridden. However setting tx_lpi_enabled shouldn't
> > > be needed if you respect phydev->enable_tx_lpi.
> > 
> > I agree with Heiner here, this sounds like a bug somewhere, not
> > something which needs new code in phylib. Lets understand why it gives
> > the wrong results.
> > 
> > 	Andrew
> Hi Russell, Andrew, and Heiner, thanks a lot for your valuable feedback.
> 
> The current implementation of the 'ethtool --show-eee' command heavily
> relies on the phy_ethtool_get_eee() in phy.c. The eeecfg values are set by
> the 'ethtool --set-eee' command and the phy_support_eee() during the initial
> state. The phy_ethtool_get_eee() calls eeecfg_to_eee(), which returns the
> eeecfg containing tx_lpi_timer, tx_lpi_enabled, and eee_enable for the
> 'ethtool --show-eee' command.

These three members you mention are user configuration members.

> The tx_lpi_timer and tx_lpi_enabled values stored in the MAC or PHY driver
> are not retrieved by the 'ethtool --show-eee' command.

tx_lpi_timer is the only thing that the MAC driver should be concerned
with - it needs to program the MAC according to the timer value
specified. Whether LPI is enabled or not is determined by
phydev->enable_tx_lpi. The MAC should be using nothing else.

> Currently, we are facing 3 issues:
> 1. When we boot up our system and do not issue the 'ethtool --set-eee'
> command, and then directly issue the 'ethtool --show-eee' command, it always
> shows that EEE is disabled due to the eeecfg values not being set. However,
> in the Maxliner GPY PHY, the driver EEE is enabled.

So the software state is out of sync with the hardware state. This is a
bug in the GPY PHY driver.

If we look at the generic code, we can see that genphy_config_aneg()
calls __genphy_config_aneg() which then goes on to call
genphy_c45_an_config_eee_aneg(). genphy_c45_an_config_eee_aneg()
writes the current EEE configuration to the PHY.

Now if we look at gpy_config_aneg(), it doesn't do this. Therefore,
the GPY PHY is retaining its hardware state which is different from
the software state. This is wrong.

> 2. The 'ethtool --show-eee' command does not display the correct status,
> even if the link is down or the speed changes to one that does not support
> EEE.

"eee_enabled" means that the user has enabled EEE. It does not mean the
hardware is using EEE. It is a user configuration knob to turn EEE
on/off.

"eee_active" reports whether EEE has been negotiated, and thus will be
made use of.

There has been a lot of misinterpretation of the EEE API, and this is
one of them - some have thought that "eee_enabled" refers to whether EEE
has been negotiated, and "eee_active" means that the interface is
currently in low-power state. This is wrong.

> 3. The tx_lpi_timer in 'ethtool --show-eee' always shows 0 if we have not
> used 'ethtool --set-eee' to set the values, even though the driver sets
> different values.

The driver needs to set these when attaching the PHY.

> I appreciate Russell's point that eee_enabled is a user configuration bit,
> not a status bit. However, I am curious if tx_lpi_timer, tx_lpi_enabled, and
> other fields are also considered configuration bits.

tx_lpi_timer and tx_lpi_enabled are also user configuration.

> It does not specify which fields are configuration bits and which are status
> bits.

The documentation is in include/uapi/linux/ethtool.h:

 * @eee_active: Result of the eee auto negotiation.
 * @eee_enabled: EEE configured mode (enabled/disabled).
 * @tx_lpi_enabled: Whether the interface should assert its tx lpi, given
 *      that eee was negotiated.
 * @tx_lpi_timer: Time in microseconds the interface delays prior to asserting
 *      its tx lpi (after reaching 'idle' state). Effective only when eee
 *      was negotiated and tx_lpi_enabled was set.

and has been for a very long time, yet people in the past have
implemented it against the documentation, leading to the stupid
situation where using ethtool --set-eee on one network driver
works differently to another network driver. This has to stop,
and by implementing most of the logic for the interface in phylib,
it means there's less scope for misinterpretation.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

