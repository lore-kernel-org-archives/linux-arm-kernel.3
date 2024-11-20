Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910B5D63930
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pj3fkjxRBBRbKsik6UaWTJe/SP1ioAOvTFAZ8+3xNBI=; b=nQV36qtqizNgHBrRoqR2VZ+LTD
	ysQsNI5fbmBxJ4pztsWXZJsPsiviAAJM4VgcZca13tEqaty2WKvG9w6n/ikTVkEtynC6yGvo1Dy7Q
	+Hf5Rs5skhsZ1syhUocL8evd+mfLl6KH3t4Nse7NC1HHLuOqCCoazpcklz6Kkxhu34zk7o+MhMeUk
	ken9QBVgVMY2lbgXXMEBZJvL/iA9v8jF6vejIbNRfNPfYYR057PUtUc+PJHTVDQ3sA8A/mqbdE8Cy
	tZx39XKiV9xxUk+KBngKhb5jS94AZxizqrqfyxXizMB171MbnMd8Vsb5z11fq46WqApsAU3oEmptP
	iKKfEwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDj6V-0000000FDB1-0BY2;
	Wed, 20 Nov 2024 11:42:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDj5X-0000000FD0N-0g1s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 11:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Pj3fkjxRBBRbKsik6UaWTJe/SP1ioAOvTFAZ8+3xNBI=; b=pIyXcthefqtcgadsqRc7qaaHRG
	hi6v7ChfC1RQB61X13RRO558mhfiV7ABPoiP+LbCJC5ykYHJp9gMouduUCMqwKwlSu9s+69cS+z8o
	Fcaxl3IrTM8U+lK75izHvfmo6U0tfHz1btxRHGekSWzD5d5UpI+RX4E8XO5C48sc0Lr8BBC8fENdJ
	9KnW8TS+sR5ecuJqMbFwRi24lKmbCsdaGT+hxPk4CAz7fGFwDF9ppHmRb5dRomHG0HYCHBW82Kde8
	lo8NIIH2JAQghOEBjMH1v5ssYwuHvFzxJgRwJK15sDP52FiGqKN47Uo+1MiEjoXL0H2lJYzf5483y
	akhr1DCQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44762)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDj5F-0005PY-1e;
	Wed, 20 Nov 2024 11:41:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDj5A-00073k-2J;
	Wed, 20 Nov 2024 11:41:16 +0000
Date: Wed, 20 Nov 2024 11:41:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
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
Message-ID: <Zz3K3DnAkDgeNP7R@shell.armlinux.org.uk>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
 <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
 <c1bb831c-fd88-4b03-bda6-d8f4ec4a1681@linux.intel.com>
 <ZzxerMEiUYUhdDIy@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzxerMEiUYUhdDIy@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_034139_200161_0773313A 
X-CRM114-Status: GOOD (  20.91  )
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

On Tue, Nov 19, 2024 at 10:47:24AM +0100, Oleksij Rempel wrote:
> On Tue, Nov 19, 2024 at 05:06:33PM +0800, Choong Yong Liang wrote:
> > Sorry for the late reply; I just got back from my sick leave. I wasn't aware
> > that you had already submitted a patch. I thought I should include it in my
> > patch series. However, I think I messed up the "Signed-off" part. Sorry
> > about that.
> > 
> > The testing part actually took quite some time to complete, and I was
> > already sick last Friday. I was only able to complete the patch series and
> > resubmit the patch, and I thought we could discuss the test results from the
> > patch series. The issue was initially found with EEE on GPY PHY working
> > together with ptp4l, and it did not meet the expected results. There are
> > many things that need to be tested, as it is not only Marvell PHY that has
> > the issue.
> 
> Hm, the PTP issue with EEE is usually related to PHYs implementing the
> EEE without MAC/LPI support.

I think you are referring to PHYs that implement EEE on their own,
without requiring support at the MAC, such as Atheros SmartEEE.

It wasn't clear that you aren't referring to a situation where the
PHY has EEE support, requiring the MAC to generate LPI but the MAC
does have that ability.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

