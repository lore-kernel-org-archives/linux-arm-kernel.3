Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFCDC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 20:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbhK64lKfzGoli4FgA99Y7jN3LYJzkq8kXFb4Szyfl4=; b=H0ESulASU1S9S102bvy1kS/+G/
	qx0F26r6W5M8wq+iPZQbEhIP+7Cf2DGrSMo7auuZjWYO4xyFHFzDwUW1qWXCgK/oK88FHrmT3zXdY
	JfGB1UDeSlVAvENAE+x8cU2Ed3X1nblo2MBp+FAFc9Ht0cWxo7DiuBfR4tcGKsnv8Tw8hHQ1gTxEW
	TCBeJaPB9sfP9jzCRHOrglwb3DtUC3ME9GcWadO+mjIyFgKbtbWzOQw81xofxcXTN+rCg833t52Xg
	/BrxJjibc6zVfRa0Xa97c3YAopgoydmJClbInGjq5kle4FBkoBOradlvjormKVfMTiCNd4742XaZ2
	2ZWp2Q0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJtT-00000003SSr-430j;
	Tue, 22 Jul 2025 20:47:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJVl-00000003Q8e-061a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 20:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kbhK64lKfzGoli4FgA99Y7jN3LYJzkq8kXFb4Szyfl4=; b=V4QT5v6a0Feyd72Kw5Aiz/opbu
	w6blYrG1N35+yEilK7qBcjzE8zdnxuuOyZt1stdsPaQshuXWbw80NGGHcTMWdXoINB39EpoZn9/t6
	aXgPDyrY/oGclFya19XRVhvmFGU18AEW/qehpAHn7X/L3GuEzqwURhj07XOWeyfcqnhWlTS4TzWHl
	UQwDqUdWTEsI1/Qv5gnz8v2bNbPrJtlh/A7tvf6bpWyVnQLlQQFdupsoPYPJknNQyszHHAQehBEiR
	jtnOEtFKWU09sJUjIyax8o3pAa4sMMCCjt+vbriqm018nAzaZpdqH60MrmeaMOaaCk1UNMRcw86lj
	OKg/N+dQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52434)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ueJTQ-0000Y8-2A;
	Tue, 22 Jul 2025 21:20:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ueJTM-0007Qz-0W;
	Tue, 22 Jul 2025 21:20:24 +0100
Date: Tue, 22 Jul 2025 21:20:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
Message-ID: <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_132253_061603_4F5DA30F 
X-CRM114-Status: GOOD (  32.78  )
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

On Tue, Jul 22, 2025 at 03:40:16PM +0200, Andrew Lunn wrote:
> I know Russell has also replied about issues with stmmac. Please
> consider that when reading what i say... It might be not applicable.
> 
> > Seems like a fair and logical approach. It seems reasonable that the
> > MAC driver relies on the get_wol() API to know what's supported.
> > 
> > The tricky thing for the PHY used in this patchset is to get this
> > information:
> > 
> > Extract from the documentation of the LAN8742A PHY:
> > "The WoL detection can be configured to assert the nINT interrupt pin
> > or nPME pin"
> 
> https://www.kernel.org/doc/Documentation/devicetree/bindings/power/wakeup-source.txt
> 
> It is a bit messy, but in the device tree, you could have:
> 
>     interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>
>                  <&pmic 42 IRQ_TYPE_LEVEL_LOW>;
>     interrupt-names = "nINT", "wake";
>     wakeup-source
> 
> You could also have:
> 
>     interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>;
>     interrupt-names = "wake";
>     wakeup-source
> 
> In the first example, since there are two interrupts listed, it must
> be using the nPME. For the second, since there is only one, it must be
> using nINT.
> 
> Where this does not work so well is when you have a board which does
> not have nINT wired, but does have nPME. The phylib core will see
> there is an interrupt and request it, and disable polling. And then
> nothing will work. We might be able to delay solving that until such a
> board actually exists?

(Officially, I'm still on vacation...)

At this point, I'd like to kick off a discussion about PHY-based
wakeup that is relevant to this thread.

The kernel has device-based wakeup support. We have:

- device_set_wakeup_capable(dev, flag) - indicates that the is
  capable of waking the system depending on the flag.

- device_set_wakeup_enable(dev, flag) - indicates whether "dev"
  has had wake-up enabled or disabled depending on the flag.

- dev*_pm_set_wake_irq(dev, irq) - indicates to the wake core that
  the indicated IRQ is capable of waking the system, and the core
  will handle enabling/disabling irq wake capabilities on the IRQ
  as appropriate (dependent on device_set_wakeup_enable()). Other
  functions are available for wakeup IRQs that are dedicated to
  only waking up the system (e.g. the WOL_INT pin on AR8031).

Issue 1. In stmmac_init_phy(), we have this code:

        if (!priv->plat->pmt) {
                struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };

                phylink_ethtool_get_wol(priv->phylink, &wol);
                device_set_wakeup_capable(priv->device, !!wol.supported);
                device_set_wakeup_enable(priv->device, !!wol.wolopts);
        }

This reads the WoL state from the PHY (a different struct device)
and sets the wakeup capability and enable state for the _stmmac_
device accordingly, but in the case of PHY based WoL, it's the PHY
doing the wakeup, not the MAC. So this seems wrong on the face of
it.

Issue 2. no driver in phylib, nor the core, ever uses any of the
device_set_wakeup_*() functions. As PHYs on their own are capable
of WoL, isn't this an oversight? Shouldn't phylib be supporting
this rather than leaving it to MAC drivers to figure something out?

Issue 3. should pins like WOL_INT or nPME be represented as an
interrupt, and dev_pm_set_dedicated_wake_irq() used to manage that
interrupt signal if listed as an IRQ in the PHY's DT description?

(Side note: I have tried WoL on the Jetson Xavier NX board I have
which uses stmmac-based WoL, but it seems non-functional. I've
dropped a private email to Jon and Thierry to see whether this is
expected or something that needs fixing. I'm intending to convert
stmmac to use core wakeirq support, rather than managing
the enable_irq_wake()/disable_irq_wake() by itself.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

