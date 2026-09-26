Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6872EC98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 07:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwqnBwRVIsXRmAyRc8E8Ijh+jmQBFm2/IFbbIbxTCKY=; b=iHRKCeeNHYvJb56C0cvw4UDuJk
	NpgmDmX0fo7JQwNeO/3ORNqNHRqSMQLrHk5XM4M8Zchesd9mZzKdvs6+9cAoraCHjYWx6T8skM9FK
	Hrd8vxfsQ8aj20p9mKsJ7IMjN5VYljVyfMguwClnIexkZTsKuIQC9YbWJ7cH0eD9ncitnkFtRfqAs
	YoCHtNyT0VVBlTW0bnUgniqsTRnZ+uq+WUl66+zRzyF/DNtTuP6GLY38J3T3AYnPtvnufBS3wWeqE
	clcYxqdBINCSVEYzHGf+TApZlPxIgzmh/uZ9bBUVz1AjPwVRWWnkUnLf6HZWp/HI9K14cWW0XVIgU
	yRy7Y/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANFe-0000000F8If-1A9j;
	Sat, 26 Sep 2026 07:55:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANFd-0000000F8IT-0aDh;
	Sat, 26 Sep 2026 07:55:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BDFD6020C;
	Sat, 26 Sep 2026 07:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9281F000FF;
	Sat, 26 Sep 2026 07:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409314;
	bh=GwqnBwRVIsXRmAyRc8E8Ijh+jmQBFm2/IFbbIbxTCKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nw8RAwckFc8w9qeay/H8ZADcvi7dKiR7OsXOjQ8dlqrRmM1IEqKzdBOH+G0hDFe6P
	 r6Yq7+iL+LhiKfY8+dG97aAKl1KMOzgKEPDkpQmX95p7b5Of91/szL+0sHeFG0YOzR
	 sVZKq9PpqAs5VAYdp8tGFWCR+aXDIw7xKpPfSgSBiUTJcT4jZtvjG8U+jpNeZqBWes
	 xlwso6VnNctjdRTTsHvDHPBOHXbFJ42+zHpJqBPly4Cg+K6lhEbotkpcofO4+irj/o
	 PAWdia6ZZVgalw01zhEuBqmoDBN8e+HsKGf1OXBdRqqZd/ifMiDJPHq7nL4KZOzkeb
	 YNhboKlk4US5A==
Date: Sat, 26 Sep 2026 09:54:56 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 1/6] phy: rockchip: usbdp: Add phy reset notification
 support
Message-ID: <zbqy5gqtmprapsqpodoohyxs6gml6swkie6fy7fxszfvtfgz6c@eae55gdmknaw>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-1-9ad90a456953@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-1-9ad90a456953@collabora.com>
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

On Tue, Sep 15, 2026 at 05:32:48PM +0200, Sebastian Reichel wrote:
> To resolve issues with running into permanent "cmn ana lcpll lock
> timeout" errors after a few device replugs, add support for reset
> notifications, which will be handled by the DWC3 driver to gracefully
> handle the PHY being disabled. This avoids corrupting the controller's
> internal state and the PIPE interface between the USB3 controller and
> the PHY, thus fixing the issue.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-usbdp.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index e748acdd2d31..0f39982c70b1 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1004,24 +1004,39 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
>  	}
>  
>  	if (udphy->status == UDPHY_MODE_NONE) {
> +		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
> +
> +		rk_udphy_u3_port_disable(udphy, true);

This change is not described in the commit message.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

