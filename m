Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0349CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+y6negsGs/imAQMRkRWgBlJ91wY7jx6h3f2XOctfhN4=; b=DfoBaIS0eO8tl/gcTZfz0bU8zC
	K/GWeKzMZrums66tPC9RECYEusYbv58727Mzgbm/DZswxzLFuqplthkOQiWtyX85W2v76nIWY8LsY
	rjNmwVYTTJxjM9nB30yPScLW96gvLWFD17HewCRy4LquQ8N2NbFGeUZmN32vuGv3zO2dVRQG3yJB3
	cSbF7EYYc+9UCJjjWZgpoes3RDf/Vu2o8x2mA8k0KBPVkaeTQOnAaP74Pp9Xc5yJ7Rk8BV7RCKSMP
	Eiq2xKUywJQl3aAhtkOIsTK2qQqrLPUHyP+fjeiBHuzWia9961C4ex4D86BneM5DdnfcROkXcd9DG
	rYx1HZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Vh-00000002slT-2xft;
	Wed, 15 Oct 2025 20:54:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Vg-00000002slJ-2oAH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 20:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+y6negsGs/imAQMRkRWgBlJ91wY7jx6h3f2XOctfhN4=; b=Tcs2jCAQYWvwS+QNazNgn4T3v0
	78n+gwkI7cRRH3mPGBrN71QsJfOyEXjpKkkN7HG3aeXASRP4oUpPCmGe1V9J9J7Rp8iBgFB9l0XiW
	uxBXvO4ZtaFGiKBwEkhCRXJ9YwaL2HIDXQ2muuKWNVYsaL+LFCBdN5OwPeDyCw7R49u0KhAMlvyQe
	f2IHPDTRcYgqDhk4HE/A7sw7YmiOkRbFB2lnlPDwGYLEH/M63jnnK6FEc5SVDYgbi1Xq58C+eHdV+
	eRINba29FuLRkkcPeHrfii8LwTcAtyg+/Df7rACuAhioYgUF+awmBhqzxG6RfFii5FtTpYYjjpBIk
	zygaJAig==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Va-00000006FqK-2GYV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 20:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+y6negsGs/imAQMRkRWgBlJ91wY7jx6h3f2XOctfhN4=; b=Iqtpg+9FC4m5b8n70PZNXvaQMY
	209mCUQKjNwLOn4BXnBHq4M8JDA0SakH4v/BqfJWc+LR6AFx7U3ZsTj+BoHLJuqsli+zaUshw7vCA
	TDAmYNQaF39qZ2UPbizhCmVLSsTKrdX98YqRZazm/ehuN49QuurpHGp0S0WRakB0LwEI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98VL-00B4fo-En; Wed, 15 Oct 2025 22:53:51 +0200
Date: Wed, 15 Oct 2025 22:53:51 +0200
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
Subject: Re: [PATCH net-next 07/14] net: stmmac: remove RGMII "pcs" mode
Message-ID: <574d5b07-02c9-460d-b968-7d894c597ccc@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92Mj-0000000AmH2-1LHZ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92Mj-0000000AmH2-1LHZ@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_215408_747132_D3A97CDE 
X-CRM114-Status: GOOD (  10.28  )
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

On Wed, Oct 15, 2025 at 03:20:33PM +0100, Russell King (Oracle) wrote:
> Remove the RGMII "pcs" code in stmmac_check_pcs_mode() due to:
> 
> 1) This should never have been conditional on a PCS being present, as
>    when a core is synthesised using only RGMII, the PCS won't be present
>    and priv->dma_cap.pcs will be false. Only multi-interface cores which
>    have a PCS present would have detected RGMII.
> 
> 2) STMMAC_PCS_RGMII has no effect since the broken netif_carrier and
>    ethtool code was removed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

