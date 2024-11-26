Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C09CD6555A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 21:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcl4MNMZwnljfA1EBKJpg0e8T/uMkHnaIji3KIQZjZs=; b=i0v6HHNe2MLne3ERICti9y6JCk
	A2eNwbuhopeIgkKi1UVXwqJ+n60Q4iTtbwlk3qIjHMIuLF5U+0QgT0UU1f1VWZo+zw2LvshwFwXGN
	D0R98ISTr7NDAJUOvfaeEt2RkMq3e6m4Cig8nmrSxigYW0Whaln/fUvJbwpPGAsCMCbWidaXvWsZy
	f9WcX3YrYOSM52dqrFom4qTzQJUcL8A37NDPmYAG7fFEpr91kOzcWvIaFmTVprGbMiSA4Deb5MIdJ
	5kdouoSDNIwIDd6zLzRkK7aeoPUa2LjTnn6+SLYi5IBjJkiRy1hk8BUtPtgYIO3cxwW4Tjt5zuTiv
	amepF3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2yh-0000000Bk7C-0iXK;
	Tue, 26 Nov 2024 21:20:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2xi-0000000BjyG-3DUE;
	Tue, 26 Nov 2024 21:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tcl4MNMZwnljfA1EBKJpg0e8T/uMkHnaIji3KIQZjZs=; b=RCptV+VEeg8w8GKOmmNrDBrRuB
	MK5xZZEaDiUCcfp/TPKMi8n0UXIJRGz+DTKw+KNN/aU2yxU7Fdsh0Crl7C4UV7lb6TbFYAnHIaqox
	AriCFpezQDX46IeSYaahPUNOhQCk+YjIbQef8/8OEDQcr8jSpH5PTad/Hg+c33mAzS0s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tG2xU-00EZI5-Oh; Tue, 26 Nov 2024 22:18:56 +0100
Date: Tue, 26 Nov 2024 22:18:56 +0100
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
Subject: Re: [PATCH RFC net-next 15/16] net: phylink: add negotiation of
 in-band capabilities
Message-ID: <e8a11b23-3918-458f-8888-4ca32058968a@lunn.ch>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
 <E1tFrp6-005xR2-6W@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFrp6-005xR2-6W@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_131910_800946_D2F1053A 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

> +		if (pcs_ib_caps && pcs_ib_caps != LINK_INBAND_DISABLE) {
> +			/* PCS supports reporting in-band capabilities, and
> +			 * supports more than disable mode.
> +			 */
> +			if (pcs_ib_caps & LINK_INBAND_DISABLE)
> +				neg_mode = PHYLINK_PCS_NEG_OUTBAND;
> +			else if (pcs_ib_caps & LINK_INBAND_ENABLE)
> +				pcs_ib_only = true;
> +		}
> +
> +		if (phy_ib_caps && phy_ib_caps != LINK_INBAND_DISABLE) {
> +			/* PHY supports in-band capabilities, and supports
> +			 * more than disable mode.
> +			 */
> +			if (phy_ib_caps & LINK_INBAND_DISABLE)
> +				pl->phy_ib_mode = LINK_INBAND_DISABLE;
> +			else if (phy_ib_caps & LINK_INBAND_BYPASS)
> +				pl->phy_ib_mode = LINK_INBAND_BYPASS;
> +			else if (phy_ib_caps & LINK_INBAND_ENABLE)
> +				phy_ib_only = true;

Looking at the different handling between PCS and PHY, i asked myself,
does PCS BYPASS exist? If it is invalid, i don't see a check if the
PCS is reporting it and should we be issuing a warning?

    Andrew

