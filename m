Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83168D6DDE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+1mHkW5xeUn98DLU2MzEmZyX/j5XKeY/1cmO/2lLi0=; b=xM0Ad3BeAA/x+jS8GS2T7Hzg+Q
	LWncQ6jfRsIIkZuFBcoZglbL1vLrR9u6uvRPSWYNRKv1/aDtazqAWZYJqgamF5fxJHMai+ghOfGjG
	PTa5RN7ninKfYOPs4cWo0i9iH0jBym4CC/tcjOm8Z6fHOS4r9jV5TIUuHZ/U/SnlAOzgleBUxOmTs
	KCUJcOpSHllut0QjCLqdYVdR5f6ZoI91fpK40zwVtbWnd5/o6tio+9LsYFTQIzhbkb1BySYP4JgwC
	+bgBhl5Ad6Ph3mtd6Bbjtu5irDRQ79bmZDJ/TjaE/bqty1vSRJyDK8UbEj/gESu7fJggEa8nbh3tI
	oyEk/EYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwX7-00000002r18-0oPV;
	Fri, 15 Nov 2024 13:38:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwWC-00000002qmT-1161
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 13:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8+1mHkW5xeUn98DLU2MzEmZyX/j5XKeY/1cmO/2lLi0=; b=Kl27prUPtKYLoQ/s2vZBSQyK7n
	io0y6C+YFo3TFcRYOPId/ovLvP0qnH4MTTmrLCxykNrMAgDlcjuEKYNVgmLD0AZp19EbK4AnN9AMQ
	d2BNDZbM9fF77Uc96Q+nxoFC+wIz1pzysRw6sDoZzSa5/0QH/84rJz04uqaaf8eUUavgjq89VY10V
	IDEScKjh1+tLlUHzQwe3Dcd/ZG9AUCz28wcHJEhUWDeaYKZjmqII/edIgVwkDKi5OuzyWvXADw4vR
	KkpT5l5b86Q3467cLtrC48K/+RD+6P5FkGnwLWRNB6g+B3DsMoen12t09Pu66ZSTV8DuHSRput/f7
	R8PShxVw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36000)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tBwVq-0001Pv-1F;
	Fri, 15 Nov 2024 13:37:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tBwVk-00029i-1G;
	Fri, 15 Nov 2024 13:37:20 +0000
Date: Fri, 15 Nov 2024 13:37:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2 1/2] net: phy: replace phydev->eee_enabled with
 eee_cfg.eee_enabled
Message-ID: <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_053748_284404_0CB100A9 
X-CRM114-Status: GOOD (  17.13  )
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

On Fri, Nov 15, 2024 at 07:11:50PM +0800, Choong Yong Liang wrote:
> Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
> designed to have EEE hardware disabled during the initial state.
> 
> In the initial stage, phy_probe() sets phydev->eee_enabled to be disabled.
> Then, the MAC calls phy_support_eee() to set eee_cfg.eee_enabled to be
> enabled. However, when phy_start_aneg() is called,
> genphy_c45_an_config_eee_aneg() still refers to phydev->eee_enabled.
> This causes the 'ethtool --show-eee' command to show that EEE is enabled,
> but in actuality, the driver side is disabled.
> 
> This patch will remove phydev->eee_enabled and replace it with
> eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(),
> it will follow the master configuration to have software and hardware
> in sync.

Hmm. I'm not happy with how you're handling my patch. I would've liked
some feedback on it (thanks for spotting that the set_eee case needed
to pass the state to genphy_c45_an_config_eee_aneg()).

However, what's worse is, that the bulk of this patch is my work, yet
you've effectively claimed complete authorship of it in the way you
are submitting this patch. Moreover, you are violating the kernel
submission rules, as the Signed-off-by does not include one for me
(which I need to explicitly give.) I was waiting for the results of
your testing before finalising the patch.

The patch needs to be authored by me, the first sign-off needs to be
me, then optionally Co-developed-by for you, and then your sign-off.

See Documentation/process/submitting-patches.rst

Thanks.

pw-bot: cr

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

