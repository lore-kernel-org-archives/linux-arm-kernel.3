Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB9CC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 04:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4UBu+84T6JxlOLmyooaE0xl3mvL4E80lscJeguyt6k=; b=JDD9CZ9sqg9KU8k3qZa4C7Vf6k
	To+GxOkW3p0RO3Jro+fMnQVrSIuFX5l48qXv/0ROYNhoo30NWMGRNJ2J2NOSOyUs5/6JGjz2GmZv8
	iz+XRf3t7N7bwz5akR3vo/HBk07fUFROQxSmDpNlcdc4tKlFF9erIlVgTeLzkYfBEMwgLUedVvCFd
	OyI9c5piNEBnQ70oY+ciKODoMvD4uTeeJBpdpwy23IepdhW44lcyV9U1FLHPFmUChoAB1nLDhjsQz
	GRXdIposx9pQz+yaJiNCb4XdpbFAh6zfQYc2xVZqIXbSnG4shc9KWcpODiWXLyDJn1pynw1dy+JdY
	v3mOpasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJaR-0000000EvWn-3yrJ;
	Sat, 26 Sep 2026 04:00:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJaQ-0000000EvWb-2xyL;
	Sat, 26 Sep 2026 04:00:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7578E42E54;
	Sat, 26 Sep 2026 04:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E2D1F000FF;
	Sat, 26 Sep 2026 04:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395230;
	bh=F4UBu+84T6JxlOLmyooaE0xl3mvL4E80lscJeguyt6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bHyOVuAicfEfvrD5EUPlf+cLfE0R3n65imqvZRIrKibD9xfPaWgQKyDPj8o9ohuMQ
	 24JOK8xUwECa7WcNSUGcwSvEKFGDiOKLurxtI7OdzW4J2wsJ47QOFm7vK4MYOvIfsj
	 Lu8En2Q7VGyNOEj15L3JAlPTlYVBWbDoapq1Unl939ES4M+mzsnwn4wF7LqO6Wn4gC
	 p9zbwFfMf7DYDysh6WwF+fAz6CHIRvdswaTZZL09aYXnEES10FucKNhz/azJQ2O590
	 A7qtBRWZQQDXTdvvKZd6Xml4UfxhC074q4UGR0MHetrgzGJlGI1XPj2j9300UinqZN
	 sXibrWe5Gxs6w==
Date: Sat, 26 Sep 2026 06:00:08 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v15 09/16] phy: rockchip: usbdp: Fix LFPS detect
 threshold control
Message-ID: <wnpn67manvymzrkqcnfvemhu32ifycldjgb4gvx2fvpfvayayv@zdeb2caeykxj>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-9-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-9-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:49:56PM +0200, Sebastian Reichel wrote:
> From: William Wu <william.wu@rock-chips.com>
> 
> According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
> the device under test(DUT) must not respond if LFPS below the
> minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
> platforms, because the default LFPS detect threshold is set to
> 65mV.
> 
> The USBDP PHY LFPS detect threshold voltage could be set to
> 30mV ~ 140mV, and since there could be 10-20% PVT variation,
> we set LFPS detect threshold voltage to 110mV.
> 
> [1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf
> 
> Signed-off-by: William Wu <william.wu@rock-chips.com>
> [Taken over from rockchip's kernel tree; the registers are not described
> in the TRM]
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

