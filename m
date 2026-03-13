Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B03C107BCCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4UYISWV9qsLkjeT4fVqIPgPQOAh7Ipf/hHHbX4km0c=; b=qyKCImrUqf6fysWEC3H+QyY4VS
	Y+8FN++lDqiqmXm3+xSFw6O51yEua/UTEXnDPdH87uNUuUkMXYVP3zJdwFHCrmzafxNj+Gf8NH905
	Ex9Gyp5Hx5b5C+zhYBxu8VHMS3wAt395+X3cWkZEqK4kdxIGgjU/JG4qlNnVBunpn/cSF0iRqBsjq
	W/cGjgam2/+xKduam4JmBnPpe2oOnVnBWtreKidL1POTGGstLO61DmfW4LRFPlHSgwgqNcqtTXZ+v
	gw1RfpGHrrFYkf9sN1PxTwDeURicWoVigG1r7+Dr6CNFWMMwlPIjZ1nca/jj9KWSjmbtAM2x2n7Mo
	FdZg5nqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Tq-00000000evm-3XCD;
	Fri, 13 Mar 2026 16:35:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Tl-00000000ev3-06nJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K4UYISWV9qsLkjeT4fVqIPgPQOAh7Ipf/hHHbX4km0c=; b=vyZ719YDZ7x1Wv2Yziaf0ilgd8
	GVAoLBpJyrEPbe/ZVuu4/iCYIeN9QzHcaKjigbe1Z44LRjN4ubkTSVUtWj4wiuRIv4f0UwdTYGwdp
	H2ZBENCKH2+jP4v+/CkRpbantH82zSQVIcpIpUlM1L75V8Aawc1pKeJ5ZZQFOHZtiNkHsCRL3qwAU
	Hx3LNSUvhGGRFKO22eIQi2lDAgRqWOMbZScTQLvCiTUucBwrW2O19RQSwlS/O+CgSMwUaCx+CxiLt
	JqaTPxXl4XY3wp96Js9j8TnBGh1XV/V6H/pIhubXOZh7zkShC5wmh6k4Da0t45rXYwEtkWGT3iYrK
	vPvVrgvA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47814)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w15Td-000000001GI-369L;
	Fri, 13 Mar 2026 16:35:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w15Ta-000000008MN-2V7O;
	Fri, 13 Mar 2026 16:35:02 +0000
Date: Fri, 13 Mar 2026 16:35:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Christoffer Sandberg <cs@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH net-next] net: stmmac: fix dwmac4 transmit performance
 regression
Message-ID: <abQ8tlRYrU5W4VaK@shell.armlinux.org.uk>
References: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
 <6f4929c3-d727-44a3-abc5-c33923dc69d7@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f4929c3-d727-44a3-abc5-c33923dc69d7@tuxedocomputers.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_093513_068016_FC00AEE8 
X-CRM114-Status: GOOD (  26.11  )
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

On Fri, Mar 13, 2026 at 04:03:16PM +0100, Georg Gottleuber wrote:
> Am 16.01.26 um 01:49 schrieb Russell King (Oracle):
> > dwmac4's transmit performance dropped by a factor of four due to an
> > incorrect assumption about which definitions are for what. This
> > highlights the need for sane register macros.
> > 
> > Commit 8409495bf6c9 ("net: stmmac: cores: remove many xxx_SHIFT
> > definitions") changed the way the txpbl value is merged into the
> > register:
> > 
> >         value = readl(ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, chan));
> > -       value = value | (txpbl << DMA_BUS_MODE_PBL_SHIFT);
> > +       value = value | FIELD_PREP(DMA_BUS_MODE_PBL, txpbl);
> > 
> > With the following in the header file:
> > 
> >  #define DMA_BUS_MODE_PBL               BIT(16)
> > -#define DMA_BUS_MODE_PBL_SHIFT         16
> > 
> > The assumption here was that DMA_BUS_MODE_PBL was the mask for
> > DMA_BUS_MODE_PBL_SHIFT, but this turns out not to be the case.
> > 
> > The field is actually six bits wide, buts 21:16, and is called
> > TXPBL.
> > 
> > What's even more confusing is, there turns out to be a PBLX8
> > single bit in the DMA_CHAN_CONTROL register (0x1100 for channel 0),
> > and DMA_BUS_MODE_PBL seems to be used for that. However, this bit
> > et.al. was listed under a comment "/* DMA SYS Bus Mode bitmap */"
> > which is for register 0x1004.
> > 
> > Fix this up by adding an appropriately named field definition under
> > the DMA_CHAN_TX_CONTROL() register address definition.
> > 
> > Move the RPBL mask definition under DMA_CHAN_RX_CONTROL(), correctly
> > renaming it as well.
> > 
> > Also move the PBL bit definition under DMA_CHAN_CONTROL(), correctly
> > renaming it.
> > 
> > This removes confusion over the PBL fields.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thank you for this patch, which significantly speeds up the transmit (by
> more than a factor of nine on our devices with Motorcomm yt6801).
> 
> Unfortunately, this patch also causes DMA errors on two of our devices;
> logs from a iperf3 test are attached.
> 
> Strangely enough, a third device with the same Motorcomm yt6801 does not
> appear to be affected by the DMA errors. However, further testing is needed.
> 
> Do you have any ideas for further tests?

I would suggest dumping the contents of these control registers prior
to commit 8409495bf6c9, and after this commit, comparing their values
to identify what has changed. I'm sorry, I don't have the bandwidth to
inspect the patches to see what may have been inadvertently changed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

