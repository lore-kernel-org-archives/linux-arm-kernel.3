Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E76D6555A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 21:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmbIlKcAVLKjRxHa4VqPo5WKB6DBh0l4jMgac7lFpys=; b=pQmR68JwgFUtcMUirbHSXAZQ68
	hZWTXytmuUVLO11FWB492B+mkUPqkKAdL6IriAHc5hFxVvyRCLNte6B5EdxNqGoKZOfftDQGYSp/s
	h5XYwbgi+bg9Ea/uXWyeNF8JQzxL7Bhe8uJli4pSkybqFoHE9kRgV5/hELdtF/QN3w1TbKhHobVMw
	2wPTaVj0vTsGJmGe+xm2Z3Wqs8jf96/JyTE30cvCzcMD/oEJpmf//+FMIOQUAXWoJzfXsBowhKKUp
	/1sJ9x/sfuxkFaytXPJL0j6qlcvQ/DxnG+Fj76T5bVXZThddNIpfOtCkPdhcMaLk7Xbz5ia81+q2J
	E61Mzrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2lv-0000000BipP-3Ohb;
	Tue, 26 Nov 2024 21:06:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2ky-0000000BikY-0h03;
	Tue, 26 Nov 2024 21:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vmbIlKcAVLKjRxHa4VqPo5WKB6DBh0l4jMgac7lFpys=; b=2YmdRRZZY4+znhtWTOHGszWkHO
	XKS4VJ6cFoEnwfe+1zYyvj2QNk8+PYK1euFHc8u1Ls3yto/aFg5E3Jrx2mvIr2QwTj5K/P5Hs697N
	kFoEUXWw6s+MfOGqaj9bY0qlCef+z5uXd7E+0INSpUGiQRVK0o13tIsctWj1ebVHdn1c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tG2kf-00EZCH-OJ; Tue, 26 Nov 2024 22:05:41 +0100
Date: Tue, 26 Nov 2024 22:05:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 09/16] net: phylink: add pcs_inband_caps()
 method
Message-ID: <7dcf8936-29fb-45f3-9ce9-69ef2a1e9f1e@lunn.ch>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
 <E1tFrob-005xQS-Hz@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFrob-005xQS-Hz@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_130600_201611_33C211CD 
X-CRM114-Status: GOOD (  11.14  )
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

On Tue, Nov 26, 2024 at 09:25:01AM +0000, Russell King (Oracle) wrote:
> Add a pcs_inband_caps() method to query the PCS for its inband link
> capabilities, and use this to determine whether link modes used with
> optical SFPs can be supported.
> 
> When a PCS does not provide a method, we allow inband negotiation to
> be either on or off, making this a no-op until the pcs_inband_caps()
> method is implemented by a PCS driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

