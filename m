Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87643CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9Vd50llGKlJUDtO+EduzVWWAqtczGOx8sjS49cA9dk=; b=czmS6LkvyWKqBRSOQIMRHPyLyx
	6MUXoT1oRepC8HCzkITMLXEhBiudLcRHqYTcnBdz8HCfu5lkMHJFxyuKb1Ox8fBeUJ1wd+U37FODp
	Igy5pD4xafKuwQa7igi7nntlXLpwlBnVnAyh/S/CIgowK9k63rWpdu2ODCLV2yT8jJ7rDf+5gWUqK
	sysKt5z2cpmh0EFY+80EjrXrUwcVsuaO/ZpDn2l0PjMdEaR5aVu4wZPG8z0jraWOaH5dVZcs1j+Hm
	soMTsk7PnUqf+pLWtWtaqeYL+48D0Ejnb2dV2mvY6UQ4DTh1QDS6xv3SUgn+Ea2N7XlOFk8y5Xlki
	OZlsSh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98dK-00000002uJa-1CzE;
	Wed, 15 Oct 2025 21:02:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98dI-00000002uHY-243u
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u9Vd50llGKlJUDtO+EduzVWWAqtczGOx8sjS49cA9dk=; b=rOLERcnT2PfwMAxaH5FjWK+iSY
	ePVZqZjn/9HAfP4yVkyT+InUPNwlsuqS8n1mpgrbH3TwnW5NC/Sf4/8fivjTweEpy9SETTw4XUd2P
	7MmdTR2qD8nlf+iRocgWKn783p6LQJdIpuFczAUDjhKttocbajLapejr6UqCdCE2BKwV4L89Lrtrk
	VoZnmcEL4viFA1VorNyCNEDYEEnBPQIDtvRnV/UbuKwUbAEACInxX13dhG8g+6/YDRuLEr6OGd/tx
	gyh3qqwpi9VDU52jERpfiKzLeEnGX5ADU4dV5pqvpFOqxm323BISk4WNONtYC2hBuDZnBuFw8mGs1
	gq3TVn8g==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98d6-00000006GIb-2X2T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=u9Vd50llGKlJUDtO+EduzVWWAqtczGOx8sjS49cA9dk=; b=lPN1FzPvrEnEGdf/5DGvQidRRO
	KJ5J8zqk9k3JB5y6fJ14/5mp2e7wWv7356ulG6IYc49OvXw1+rc7IsCUxnOMNW0jrCSAwMv5KTL9J
	n5pz55iGmNuvnBdS7skj93TFnJjxmMFG6vWzjb/DsgBMNNgo/nn4VPY8j77XEDzXTMyQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98cr-00B4oN-8p; Wed, 15 Oct 2025 23:01:37 +0200
Date: Wed, 15 Oct 2025 23:01:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 12/14] net: stmmac: only call
 stmmac_pcs_ctrl_ane() for integrated SGMII PCS
Message-ID: <79822da1-d797-43f5-b0d3-533d5e914b07@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92N9-0000000AmHV-0WAA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92N9-0000000AmHV-0WAA@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_220159_773101_56D65F13 
X-CRM114-Status: GOOD (  11.27  )
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

On Wed, Oct 15, 2025 at 03:20:59PM +0100, Russell King (Oracle) wrote:
> The internal PCS registers only exist if the core is synthesized with
> SGMII, TBI or RTBI support. They have no relevance for RGMII.
> 
> However, priv->hw->pcs contains a STMMAC_PCS_RGMII flag, which is set
> if a PCS has been synthesized but we are operating in RGMII mode. As
> the register has no effect for RGMII, there is no point calling
> stmmac_pcs_ctrl_ane() in this case. Add a comment describing this
> and make it conditional on STMMAC_PCS_SGMII.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

