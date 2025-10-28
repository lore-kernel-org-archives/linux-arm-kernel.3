Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23C2CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0wxYpGazz/mbNZkEG1ty2jCdBuuX7dP/ZCMsktvXgQ=; b=15Vxfjxqlp9OnJ92Rlltqa1PEB
	LYFh3c2WGR5bO0N74nx+tgoSdMx4kg9PNj1OJm5e4tX99+Zi3xlrRAXsbzeg/Gplg99tcP4atCZbp
	eHGXSIlYXMA5gPJDQmyO4DPVqah33deZTgUEaosNOieK12Vt6ALPoQqI8fDvbdhKRpTyTk+t9Sb2L
	zm7VHS0JP7+eQL3tpIFO2lU1dB9TDHxChUPVDiaqZas55Fh8pKFHzqTmqusP26pSIjd/GObh8Krx2
	xyvwFriA6VRU505Nvn3Mb+jHPMBf9vcb3gbWz7GhWz6q5GnzlH54VkwUDlXZRyu8GcQ4nIcHaZI+M
	qYq8HJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDh8M-0000000Fm3G-3cz2;
	Tue, 28 Oct 2025 10:41:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDh8K-0000000Fm2s-1M9E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c0wxYpGazz/mbNZkEG1ty2jCdBuuX7dP/ZCMsktvXgQ=; b=FmlJ9xZ3AY35fJOn9eqW4EynqN
	4md0M+JNO60HV64L82O8Q+kAXwSzTSZN8aPxxeiMYBVZ5WP19k8UPJijuTrqIHxsC0ulDf0Y8VZBf
	89DqVHJNgHjrNestsskRMz2dSzcy5w+Qk60EoQJpRKekZw5LrmWRhUY05mp0C6EJZavc1tAyv1C0G
	YNQNMpI+PJxz0WCx4Msg8YSUo0vG59zHvmIsWEMh0+sCJJrbs4QmpT6PkbNSUQoC0HviSuoGnRme3
	ShHPYC/bh9+TgDXHb+WrxgoXMqgc48fmiCQmFGfzRS3wmGhJcbhuhil3H9l4pPIsVzj2qh5PT4wqf
	7FMhcGww==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57222)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDh8A-0000000034l-3TOU;
	Tue, 28 Oct 2025 10:40:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDh88-000000006V0-1YLu;
	Tue, 28 Oct 2025 10:40:44 +0000
Date: Tue, 28 Oct 2025 10:40:44 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothor__ <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Furong Xu <0x1207@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: add support specifying PCS
 supported interfaces
Message-ID: <aQCdrNQHF07BVPti@shell.armlinux.org.uk>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <E1vClC5-0000000Bcbb-1WUk@rmk-PC.armlinux.org.uk>
 <604b68ce-595f-4d50-92ad-3d1d5a1b4989@bootlin.com>
 <aQCcVOYV15SeHAMU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQCcVOYV15SeHAMU@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_034056_367750_51D90F12 
X-CRM114-Status: GOOD (  15.07  )
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

On Tue, Oct 28, 2025 at 10:35:00AM +0000, Russell King (Oracle) wrote:
> Thanks for giving Jakub a reason to mark this "changes required." :D
> I'm not really expecting this to be merged as-is. So why didn't I
> post it as RFC? Too many people see "RFC" as a sign to ignore the
> patch series. Some people claim that "RFC" means it isn't ready and
> thus isn't worth reviewing/testing/etc. I say to those people... I
> can learn their game and work around their behaviour.
> 
> Yes, it will need a better commit log, but what I'm much much more
> interested in is having people who are using the integrated PCS (in
> SGMII mode as that's all we support) to test this, especially
> dwmac-qcom-ethqos folk.
> 
> The 2.5G support was submitted by Sneh Shah, and my attempts to make
> contact have resulted in no response.

I should add - I'm expecting dwmac-qcom-ethqos to reveal that we need
to include 2500BASE-X for the PCS, and possibly 1000BASE-X as well
(which in dwmac terms uses the TBI interface to a platform integrator
provided serdes block.)

The most important thing is for people with the hardware that would be
affected by these patches to test. However, I'm expecting no testing
feedback from such people based on experience - it seems stmmac is rife
for "throw code over the wall into mainline and run away" behaviour. :(

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

