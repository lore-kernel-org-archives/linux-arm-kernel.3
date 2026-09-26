Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EEFC98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+eweznmMsk2P2IzCzlZYwI84IrX3waF/RZqKOP1zaw=; b=aUixYnAkqUZUnHPvsC84x6Hl/B
	bzAV/bId9VZbK3tLXsBnsqBbWrA6WsTO70Bm74p+Kecal9pqh1Tq10JTSWTDMZRiaOsRaAa/rHGdN
	i8vE8ZuzKPSV9IJ4QbkWemt1svJsSiKc89Zchdaaj4EJ7rUdF+cz7Jl6Xb2dLCcBtiE370turmhBU
	y0faFvnjTaUX9W/CJ4h3mP1zlg2khd9sY1MQrcyo7QdkfxpuFBgdgBOVd2nqyI7lVfOQ3rDNdEuGH
	zN9mKdSPgzViXpwWvzkDfS4CuW5gKbPpIbEkrvVhf4kAp+AGyQmqZMbFg9Xo0XV3GnHRcn39Vg9zI
	iHAGXOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANKJ-0000000F8rn-2Mab;
	Sat, 26 Sep 2026 08:00:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANKI-0000000F8rb-1Fri;
	Sat, 26 Sep 2026 08:00:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CC82601E4;
	Sat, 26 Sep 2026 08:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A79A1F000FF;
	Sat, 26 Sep 2026 07:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409604;
	bh=3+eweznmMsk2P2IzCzlZYwI84IrX3waF/RZqKOP1zaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d3r2f5xME8FiSRbcMOAzEW0t5VgVeFwMAMDFHU5fGjmONv+NgQ1efmgPYD5bLNVwj
	 4DnOhfOTMaqy6+EBBqEqkhWh4YLTE9SRxp0QHyp0kgEDqMH/jTtsuQNh363jHiyR5Y
	 9HjeOzD+hjx4Vwmjq9fLTR+PiSfKeRgK5VLWh7hCoqoHLlHGZlWfafn4wTxEMrRiHU
	 X1GTK0I7uzmF6tPEu8S1C7XK/D1dBkl6Wb+tq6EVYm/1iGIZywPQ/JR8yUEZFZGz9H
	 OwjPjUE128CxUx4HU5/l4uImHHUIiaMLeAtk6ksVOhQ/c16swTNhHkgn0A5EclI0HI
	 uVKszlRlS6qKA==
Date: Sat, 26 Sep 2026 09:59:44 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 4/6] phy: rockchip: usbdp: Fix power state handling
Message-ID: <o2xcbcpuzetrabvclyyauhrculkevfrmp7eeszlyviiphrcohi@ejg5wc3oq4bb>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-4-9ad90a456953@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-4-9ad90a456953@collabora.com>
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

On Tue, Sep 15, 2026 at 05:32:51PM +0200, Sebastian Reichel wrote:
> Restructure power state handling by introducing sw_mode in addition
> to the hw_mode field, so that the PHY knows about the currently
> supported modes from the hardware perspective, the current modes
> requested by software and the actual hardware status.
> 
> Now anything updating either the hardware or software state can simply
> update the status field and call rk_udphy_update_power_state().
> 
> This makes it a lot more obvious what is going on and also fixes a few
> potential resource leaks identified by Sashiko as a side-effect. For
> example if USB3 is requested by software while the USB-C is in DP-only
> mode, things are decently handled after this.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

