Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF161C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccUdV+bJB0JqpX+VeyHCjAkIupowyxA6d+tOpsGgVs8=; b=QiT1wllP6iRRc4eWhd7LcEWpE+
	4XqBLGd2abJjkRaePzN4nfLx2+YQz+Xm3d1PWbrAn4znBO6wJkaTbcu2AhJbOhXwWi66cPoJaUtMR
	3GMvVbQd7YPT5Wqsm/73waYMyFVL03zoz4Kyo8LnEfm6Z+BOn13Yhwy2wZHzhUA9XD3P7ZZu81ElV
	MnTPldcEDMDlNsOCd0RK6WnOY9ugv3INlV6mW3uQb6QJJoEZSj3OEya28xjamY5wCCwr/KUjykh+j
	WGjf05P31odmkdzVy+Pp56H898bJrhOe4xSTRVc1FkQETWjcaFt48zaRIbneobrRLdRWCH0ggsHL/
	lIfEnpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZYzd-00000004B35-2S3Y;
	Sun, 19 Jan 2025 17:21:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZYyM-00000004Aso-2Ijs;
	Sun, 19 Jan 2025 17:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ccUdV+bJB0JqpX+VeyHCjAkIupowyxA6d+tOpsGgVs8=; b=LPld0bsqaGGBAyeqvvQre2TI23
	miBlbXSrArijsZvPeONXoENHJdsXIGQEi9LK2NJdr6jhD1RpFJja6Kwz8Ii330917aD1RZv4CqPSF
	WtKZ1/51B9vBAojad7ShDX/VrN3J3Keah9SOvqSm/ZYRT2SghI5OaCwnC3bqhnyYFeIc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tZYy9-0066hN-2y; Sun, 19 Jan 2025 18:20:17 +0100
Date: Sun, 19 Jan 2025 18:20:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next 2/3] net: phy: mediatek: Move some macros to
 phy-lib for later use
Message-ID: <af88a47d-9514-4969-9b39-a387d51fdf82@lunn.ch>
References: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
 <20250116012159.3816135-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116012159.3816135-3-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_092030_651894_933595C5 
X-CRM114-Status: GOOD (  17.91  )
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

On Thu, Jan 16, 2025 at 09:21:57AM +0800, Sky Huang wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> Move some macros to phy-lib because MediaTek's 2.5G built-in
> ethernet PHY will also use them.
> 
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
> ---
>  drivers/net/phy/mediatek/mtk-ge.c | 4 ----
>  drivers/net/phy/mediatek/mtk.h    | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
> index 79663da..937254a 100644
> --- a/drivers/net/phy/mediatek/mtk-ge.c
> +++ b/drivers/net/phy/mediatek/mtk-ge.c
> @@ -8,10 +8,6 @@
>  #define MTK_GPHY_ID_MT7530		0x03a29412
>  #define MTK_GPHY_ID_MT7531		0x03a29441
>  
> -#define MTK_PHY_PAGE_EXTENDED_1			0x0001
> -#define MTK_PHY_AUX_CTRL_AND_STATUS		0x14
> -#define   MTK_PHY_ENABLE_DOWNSHIFT		BIT(4)
> -
>  #define MTK_PHY_PAGE_EXTENDED_2			0x0002
>  #define MTK_PHY_PAGE_EXTENDED_3			0x0003
>  #define MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG11	0x11
> diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
> index 712a9f0..cda1dc8 100644
> --- a/drivers/net/phy/mediatek/mtk.h
> +++ b/drivers/net/phy/mediatek/mtk.h
> @@ -8,7 +8,11 @@
>  #ifndef _MTK_EPHY_H_
>  #define _MTK_EPHY_H_
>  
> +#define MTK_PHY_AUX_CTRL_AND_STATUS		0x14
> +#define   MTK_PHY_ENABLE_DOWNSHIFT		BIT(4)
> +
>  #define MTK_EXT_PAGE_ACCESS			0x1f
> +#define MTK_PHY_PAGE_EXTENDED_1			0x0001
>  #define MTK_PHY_PAGE_STANDARD			0x0000
>  #define MTK_PHY_PAGE_EXTENDED_52B5		0x52b5

A patch like this i can easily review. I can see somethings removed
from one file and added to another, without any changes. It is
obviously correct, and toke about 10 seconds to review.

Another way to look at this. Say somebody reports your previous patch
breaks their system. How are you going to debug it? If rather than
being one huge patch, it was 10 simpler patches, you could ask them to
run a git bisect. That will narrow down the code where you need to
look for the bug to 1/10 of the code. And that one patch will
hopefully be a lot simpler, making the code inspection to find the
problem a lot simpler....

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

