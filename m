Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F46DC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=eD5uitc/xPxEkgf48QxRuWIsvOGBsmL54PCNnxqUzoI=; b=qztl1G7UUXLZvY
	PAFSlaXjBoWRLYNCiDJw6WmnlUaBCaywnJZ3lQ+FSgDRPtAPgB0W/5/VfaxgeOyN6qf0U9nr3kcHe
	QGEH3FLjDbIVYQY4GTajyJHplQE2xYTbgV6bDanvsMDKc31iq2y975DXrpgAY4i/7FivSFucayl+D
	xbEMaCo3hsE6zs/X4p+JRgRusoBrWGYXQCdvNzgunDmNQH+tn/dH8o41wHhwVbwzHVJAIuq62S1G1
	h8WJmYTGYwbLPwmAt8YphxAGLAMQZTWWSKVYn0dY+vuSF6cFjpcD3UokODYG7NrUYhLREhd2w5WqK
	I332GoM4t3X8kB06c3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Cvr-000000079o8-170q;
	Tue, 22 Apr 2025 12:40:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Bua-00000006xyA-0752;
	Tue, 22 Apr 2025 11:35:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF831A4B95E;
	Tue, 22 Apr 2025 11:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438DDC4CEEC;
	Tue, 22 Apr 2025 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745321734;
	bh=iyIAAmPJNlz3e5gWT5Kk9P9NWMtpV70iP2nADcdxgfw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Qsd2/Oj84sxfH8BnbFIuKLhjSmYzFcLJOdoqyUbluLNb/RkJUVIgOpjMvG+7KJyh6
	 sq0cn+MAvwZz4jEl7Lw78rU9TieE+Mhd/wX5KgDiCqP88ymO7ExiCT2r+1DVd+H/zu
	 5+ApLuxwmsphup3ib4DhazauAYACtlis1FE6flSHCxH+PS3C49VwAL/Z53tQxrNlfx
	 OgOTleJOXuFl4brJSwlda6PBP7wKaXMqd2cv5r0zbTnvNBy7WXZ4+nBNG4ZHdxfUn6
	 kJubSLHhTVj58Qx84dWEzw2fdCzRv8VaD30Yn8F8wKfgnGtzWEiGDfuEWEkn6k5bvP
	 1vYK/nFCz6hfg==
Date: Tue, 22 Apr 2025 06:35:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jensen Huang <jensenhuang@friendlyarm.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Anand Moon <linux.amoon@gmail.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: rockchip: Fix order of rockchip_pci_core_rsts
Message-ID: <20250422113532.GA321792@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_043536_126934_B9442C7C 
X-CRM114-Status: GOOD (  20.02  )
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

On Fri, Mar 28, 2025 at 06:58:22PM +0800, Jensen Huang wrote:
> The order of rockchip_pci_core_rsts follows the previous comments suggesting
> to avoid reordering. However, reset_control_bulk_deassert() applies resets in
> reverse, which may lead to the link downgrading to 2.5 GT/s.
> 
> This patch restores the deassert order and comments for core_rsts, introduced in
> commit 58c6990c5ee7 ("PCI: rockchip: Improve the deassert sequence of four reset pins").
> 
> Tested on NanoPC-T4 with Samsung 970 Pro.
> 
> Fixes: 18715931a5c0 ("PCI: rockchip: Simplify reset control handling by using reset_control_bulk*() function")
> Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>

Thanks for the fix!  It looks like 18715931a5c0 appeared in v6.14, so
we should probably add a stable tag so it gets backported there?

> ---
>  drivers/pci/controller/pcie-rockchip.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index 11def598534b..4f63a03d535c 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -320,11 +320,15 @@ static const char * const rockchip_pci_pm_rsts[] = {
>  	"aclk",
>  };
>  
> +/*
> + * Please don't reorder the deassert sequence of the following
> + * four reset pins.
> + */
>  static const char * const rockchip_pci_core_rsts[] = {
> -	"mgmt-sticky",
> -	"core",
> -	"mgmt",
>  	"pipe",
> +	"mgmt",
> +	"core",
> +	"mgmt-sticky",
>  };
>  
>  struct rockchip_pcie {
> -- 
> 2.49.0-1
> 

