Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DFFC55177
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 20:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZuc4JfzKuG/55z+yA9PYJfiUrL8fDWjW2wegwlHAM0=; b=wA+gWqIl7Q0euVCnmEs0oVKSID
	qdGsXgQFM1MnauaeVP8/aM+1OI04raeuOaSkRojxiY21ijmF1UA0Xcc4xhBmmk3QvsIo9T4M4hxPW
	61MMzQHxyZ9vxX6dajRIBctXzJ1VHl67qE7CfRRekGcSf7Jf3I3npQhKiaFAu5Ys5IOHwBkofAyhb
	1txjw7CeIbe99IPk+sKF1jzYRwX2+0Kn+/v3dD/p6paMnuRJ/4GVtGkQ0Fxs+hbBahdJlFlm7GQq7
	9v/J05e4ccbYljrHd+FQZQzeYcrFS7ZvqiY35QOWrfQ/UZqWONYGmez7p4GPbPGEtAP4LuHSw4aWv
	oKiAXKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGnU-0000000F3m9-1fbs;
	Sat, 01 Aug 2026 20:59:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGnS-0000000F3lb-0NFq;
	Sat, 01 Aug 2026 20:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cZuc4JfzKuG/55z+yA9PYJfiUrL8fDWjW2wegwlHAM0=; b=cQmZ48EPkSZ0QTdYvDVqBI/uQ5
	F/8TgqYqXXyVhtpYlxJ4MbOZ6twF0anleKi67Vbe/PSpU3AVcVnacvaEDEEDEemFXfwUV05531Qb8
	/C4Y0ac+s/YLGd7KpPuVoXTDwAuV0JtpmZxgJ6F90/nBCVLq2FehLsw6tkuDrxg7M2w8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqGn1-00FQCq-K1; Sat, 01 Aug 2026 22:58:39 +0200
Date: Sat, 1 Aug 2026 22:58:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 03/10] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
Message-ID: <0cf1f734-69d4-471f-aa22-e1a2e7d0341b@lunn.ch>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-5-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801142244.679437-5-coiaprant@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_135906_157281_C4974B4B 
X-CRM114-Status: GOOD (  11.91  )
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

On Sat, Aug 01, 2026 at 10:22:27PM +0800, Coia Prant wrote:
> On RK3568, the SGMII interface can be routed to either GMAC0 or
> GMAC1 via the GRF register pipe_sgmii_mac_sel.
> 
> Add support for this selection by introducing
> the "rockchip,sgmii-mac-sel" DT property.
> 
> The hardware reset value is GMAC1 (1). If the property is set to 0,
> the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
> remains at GMAC1.
> 
> This is necessary for boards such as the Ariaboard Photonicat, which
> uses the SGMII interface connected to GMAC0.

If SGMII is not selected, what MII is used? RGMII?

Can this setting be implied from phy-mode?

	Andrew

