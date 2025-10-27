Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED59CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdru/g1UDfmEH8Ssu1G/uWYFsLY+kwVhWPET9PZ9Xs0=; b=zIa42kZytx94bXUnRVPBAhXcgr
	ufUWKdlzurichnttbwG/edXWgdTfBF+vmainT/8ofOISfM72gjdjjIQLVIl+X2E6jFQ7pFmKbyH1H
	iLOba381aJkNliDGTqq8qQmI7MDihvD9X37JLvOMbBdpj+HOBefmzZqudAhuKjjePqd2lpVmJeohm
	4bv7NxPY7CtpcLHubG5Kf/lS0eSCl2vjy0f5c/Rpq3KYfhE10uags6myp5LcSwymuEN82mMbfFXaw
	OkbOPSVE1wEb1ThZW8sJ6qXUueOO+kk2dnAjh7qpngjiv457RYn46gefaOjYnilmA7GmFUQo/OdUL
	HQU0YQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNM4-0000000E3SJ-43ql;
	Mon, 27 Oct 2025 13:33:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNM3-0000000E3Rm-2hqM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 13:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jdru/g1UDfmEH8Ssu1G/uWYFsLY+kwVhWPET9PZ9Xs0=; b=b5oxrt02zwm8+Z0LzXg+oSwvzw
	WHiJzOBTAicdSMiBpQgaFgHvX5LClMe4Sv0yzKj3z68lyFMGBKurdtBSrWoPA2fKgSmTfMIOSiW2d
	oV2cK4KJULZqL0Of5CoKep77nPFGf/dcl+QNb8oQqz8cVhtWLJ9UX+nvNGT08qpLbrp5hsCKkF/Hx
	HvDGOp1Me98DKKEdOfUeQBlXQECN7E/p2Zf5dTbH755pBaIG79+cZHAbUEw4wFfCB08XZiS6IxZdh
	f4Zxx34wnU/wLP9P/xaJH6andJfnE181wkkk6Z84YzqBHgSA3wq0fSIK0VhmJgIokP9HKTtKnHjvO
	QRAiMutg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMUG-00000002Bpf-1L6q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jdru/g1UDfmEH8Ssu1G/uWYFsLY+kwVhWPET9PZ9Xs0=; b=DHPcyJSk6sjzs7WSFEoWbKk0kY
	q0u6hTxBXjylBWdZ4mUpAPChK/JLqlU1lRbRDru6tToO6DUyrYQOxEOmhGBLw0/T/+dTamGDbnU/x
	S/9odHu07HjB6uoprKTHP/MT12z0HLcgKENeOGmHD+FhoTIhWNpCgemdCyT9aLkoXkI4k9h/Q5eRE
	1YQgwyaVCco8ZcrhF58yMEFzHzSMUyJzpJtCuo0WaNaNJJ5WeuzFG5u0YBYA1sp3xv6VHwTskP2PE
	/UluW7RwKMBMgCh8A7zhwi44CzoTkW/jpj8JA5Mqq/QrEajf9qHKA6jT5SUoUMTNCXvMZeJpXkyXJ
	Vk4k0USA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48776)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDNLv-000000001uq-0oOg;
	Mon, 27 Oct 2025 13:33:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDNLt-000000005cR-1q37;
	Mon, 27 Oct 2025 13:33:37 +0000
Date: Mon, 27 Oct 2025 13:33:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aP90sT5c-_xajH8S@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP82VEjNDgrNAZzy@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP82VEjNDgrNAZzy@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_123812_472551_CFD5805C 
X-CRM114-Status: GOOD (  15.52  )
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

On Mon, Oct 27, 2025 at 09:07:32AM +0000, Russell King (Oracle) wrote:
> The changes to stmmac have been tested on nVidia Jetson Xavier NX,
> which uses RGMII with dwmac4 and a RTL8211F PHY, connected to a Netgear
> GS108 switch. It seems to be the same that your board is using similar.
> 
> I will re-test today.

I just booted net-next on this platform.

# ethtool -S eth0 | grep lpi_mode_n
     irq_tx_path_in_lpi_mode_n: 24
     irq_tx_path_exit_lpi_mode_n: 23
     irq_rx_path_in_lpi_mode_n: 201
     irq_rx_path_exit_lpi_mode_n: 200
# ethtool --show-eee eth0
EEE Settings for eth0:
        EEE status: enabled - active
        Tx LPI: 1000000 (us)
        Supported EEE link modes:  100baseT/Full
                                   1000baseT/Full
        Advertised EEE link modes:  100baseT/Full
                                    1000baseT/Full
        Link partner advertised EEE link modes:  100baseT/Full
                                                 1000baseT/Full

So it looks like everything is working as it should here.

stmmac was converted to phylink managed EEE in v6.14-rc1. I've built
v6.13 to check that my assertions w.r.t. EEE defaulting to being
enabled are correct, and:

# # ethtool -S eth0 | grep lpi
     irq_tx_path_in_lpi_mode_n: 15
     irq_tx_path_exit_lpi_mode_n: 14
     irq_rx_path_in_lpi_mode_n: 0
     irq_rx_path_exit_lpi_mode_n: 0
# ethtool --show-eee eth0
EEE Settings for eth0:
        EEE status: enabled - active
        Tx LPI: disabled
        Supported EEE link modes:  100baseT/Full
                                   1000baseT/Full
        Advertised EEE link modes:  100baseT/Full
                                    1000baseT/Full
        Link partner advertised EEE link modes:  100baseT/Full
                                                 1000baseT/Full

So, as I have asserted in response to Emanuele, the conversion of
stmmac to phylink-managed EEE hasn't changed whether EEE is enabled
by default. It was enabled by default before phylink-managed EEE, and
as I always try to do, I try to avoid introducing different behaviours
when converting drivers to a new implementation. That point holds up
here w.r.t. whether EEE is enabled by default. Hence, blaming these
problems on the phylink conversion enabling EEE by default is
incorrect - and I wish people would *stop* jumping to false conclusions
without evidence. As phylink maintainer, it is extremely disheartening
to keep having problems falsely levelled at phylink.

Note that the difference here is the receive path at the MAC doesn't
enter LPI mode. This is because PHY-mode EEE is enabled, which prevents
the LPI state on the receive side being forwarded to the MAC. I fixed
via commit bfc17c165835 ("net: phy: realtek: disable PHY-mode EEE") for
RTL8211F PHYs merged in v6.15-rc1.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

