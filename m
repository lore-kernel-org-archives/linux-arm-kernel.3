Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73A1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=u/h9HQjJH1bWylQQT/J8qEDaltCmR2pOTk7fZ7W7lv0=; b=KeatVddklOWN51
	Qm2YTIRhx+giQzxoJt8W2anN6esg/viQ7DDNUOxQhWVNCxzzVedzJlatZapz2xQDFncJoozVdCdEG
	G0XlDt9yOz/A60ZrmFyZDxn/1Tag3cCyUKXCyP45ol37DXKWwZLBg1rnV2U/K6xS1c8ZwU/Ok3WER
	yBeQ7Xn51D/WMsTwAwAYW3+AasH2rOyvwFjTx0iV4h9VM0rY1FrBL0qRs3PSvXAxS/fjK112tSl3n
	24kFdkFp6O2DyVa6po+/sZAaNHClILsPKMzJTUT8D/eTXPenzz8mFTKgjsTvg2INz2AaZn12kHzVl
	1z58NbS8Cy1QUvoKn5iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAx5-0000000HYyI-04Zv;
	Fri, 13 Jun 2025 20:24:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAtX-0000000HYU3-1hMf;
	Fri, 13 Jun 2025 20:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 604E55C54A9;
	Fri, 13 Jun 2025 20:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD5CC4CEF0;
	Fri, 13 Jun 2025 20:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749846057;
	bh=6KUd6SjVInqm4qHBGUp3HKQszrrAseaeXFamTSXmz2g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aKTWHR0Pj5XwixyMybSxmRXMXqFopnZeQjwxw+eWNwNhtratX2Fbax6AgWr98Ilrq
	 Xk25jE2ldYwGCX/BaWf5e9/O0gSF/CZsF2be3nn1/N7IXDm7jmuu/Y/Deeh3cTZ7Te
	 xId65s512KOKFMjtHi9+pPsqL69FSZxPwXzScQg3T036KXeg7F5TUOPFiKIYM93gKk
	 XEMmDsqzwNLIrzAd5QNY7NboalW/wi6L4juJS7b4pcjZoJ/VjGz0K3e2Tc55Vn+NRL
	 irccNfeU7j54nmkZrGByvaETg7hex3mXJIzu73WxXyqY4fS7nJz90A0bPuJLbDuKMq
	 liK0r/XgoPa0g==
Date: Fri, 13 Jun 2025 15:20:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v4 5/5] phy: rockchip-pcie: Adjust read mask
 and write
Message-ID: <20250613202056.GA974155@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b32c8e4e0e36c03ae72bff13926d8bdd9131c838.1749827015.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_132059_487176_29FB9390 
X-CRM114-Status: GOOD (  15.83  )
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

On Fri, Jun 13, 2025 at 12:06:28PM -0300, Geraldo Nascimento wrote:
> Section 17.6.10 of the RK3399 TRM "PCIe PIPE PHY registers Description"
> defines asynchronous strobe TEST_WRITE which should be enabled then
> disabled and seems to have been copy-pasted as of current. Adjust it.
> While at it, adjust read mask which should be the same as write mask.

Not a PCI patch, but "adjust" doesn't tell us what's happening.

From reading the patch, I assume that since PHY_CFG_WR_ENABLE and
PHY_CFG_WR_DISABLE were both defined to be 1, this code:

        regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
                     HIWORD_UPDATE(PHY_CFG_WR_DISABLE,
                                   PHY_CFG_WR_MASK,
                                   PHY_CFG_WR_SHIFT));

actually left something *enabled* when it meant to disable it.

Maybe the subject/commit log could say something about actually
disabling whatever this is instead of leaving it enabled?

PHY_CFG_RD_MASK appears unused, so maybe it should be just removed.

> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-pcie.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
> index 48bcc7d2b33b..35d2523ee776 100644
> --- a/drivers/phy/rockchip/phy-rockchip-pcie.c
> +++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
> @@ -30,9 +30,9 @@
>  #define PHY_CFG_ADDR_SHIFT    1
>  #define PHY_CFG_DATA_MASK     0xf
>  #define PHY_CFG_ADDR_MASK     0x3f
> -#define PHY_CFG_RD_MASK       0x3ff
> +#define PHY_CFG_RD_MASK       0x3f
>  #define PHY_CFG_WR_ENABLE     1
> -#define PHY_CFG_WR_DISABLE    1
> +#define PHY_CFG_WR_DISABLE    0
>  #define PHY_CFG_WR_SHIFT      0
>  #define PHY_CFG_WR_MASK       1
>  #define PHY_CFG_PLL_LOCK      0x10
> -- 
> 2.49.0
> 

