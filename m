Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85695C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZ0QdohGt0uP6s8O+UNeN8PYRn5d7EkWYTCfF6wBdJA=; b=0VMQsdNYDk87sAroiKhGiRzatP
	8UMOunWVJLmhApuZDm9176PwtivvZ2dGIzoDBYVWDK/dtaZSZHs0ohbVBhhS5KaATTor4x1ykgcrR
	OIwOc5gRL970OEP2CgZo6VLmHdza/tPSfKyj9lG6KjkGzW4o+idKZDd+GaxiUqPE2LCS/kG1AVHOm
	n0+pxxAH9r1IvAHSVOFlzDjRXnwTT2sjqoQkQs5fNtUfUy0PpWPRIzzy3PAifD53H3xDPnAb3C/6o
	D+RWfTh9zyNYPEfWwC/FTWjeFeJfzyX8wH3qoJ6Z57/nkzq0gA4qi/LVhxjaaaqU4WcbDg9hzZBhg
	5ZXoiHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgth-00000002p6m-3mhj;
	Mon, 23 Jun 2025 13:07:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfMz-00000002VUw-1fVO;
	Mon, 23 Jun 2025 11:29:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEF0143F43;
	Mon, 23 Jun 2025 11:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE97C4CEF7;
	Mon, 23 Jun 2025 11:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750678188;
	bh=w6AaO6fgK2fNbORRzUvx6Qa3WCSt0XSFElEO927wLeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqSFoUy60QVVLtbY4efKUq1P1PcXwr3lo6+JMXseUEvm9py7YL7hax6kFOSdZwdym
	 pTpZJh8spMc7wsGJXNvqY21TZArnFf5DV4hBRq0OxOzUd6GwDcmYQdd4J1eKvLEtlD
	 AJLG+YlZNMWC/1H2uMoN+rbrbbLrP7vqX5C67lAzhbSZB1GV9XWz00+6wGx6F6eWto
	 L5XtZS/rW+goRAs5AX+JNetLMNKAYTyAjsJNR3mC5ZmjWGu+Kf7eoiL4Y8L0r0BrEu
	 z9R8efYMX4mKAU89Yf/gBmIuL5DVZafBAb1zVfMSVph/EPQeOAufP4yXBkhCx1AyTS
	 Pcn2e2Bnp0C2g==
Date: Mon, 23 Jun 2025 05:29:46 -0600
From: Manivannan Sadhasivam <mani@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: linux-rockchip@lists.infradead.org, 
	Hugh Cole-Baker <sigmaris@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/3] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <zuiq3b2rsixymtjr3xzrb26clikvlja62wgj65umnse4kuk75c@x5qan73ispxe>
References: <cover.1749582046.git.geraldogabriel@gmail.com>
 <b7c09279b4a7dbdba92543db9b9af169776bd90c.1749582046.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7c09279b4a7dbdba92543db9b9af169776bd90c.1749582046.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_042949_474240_C76CA5A2 
X-CRM114-Status: GOOD (  28.84  )
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

On Tue, Jun 10, 2025 at 04:05:40PM -0300, Geraldo Nascimento wrote:
> After almost 30 days of battling with RK3399 buggy PCIe on my Rock Pi
> N10 through trial-and-error debugging, I finally got positive results
> with enumeration on the PCI bus for both a Realtek 8111E NIC and a
> Samsung PM981a SSD.
> 
> The NIC was connected to a M.2->PCIe x4 riser card and it would get
> stuck on Polling.Compliance, without breaking electrical idle on the
> Host RX side. The Samsung PM981a SSD is directly connected to M.2
> connector and that SSD is known to be quirky (OEM... no support)
> and non-functional on the RK3399 platform.
> 
> The Samsung SSD was even worse than the NIC - it would get stuck on
> Detect.Active like a bricked card, even though it was fully functional
> via USB adapter.
> 
> It seems both devices benefit from retrying Link Training if - big if
> here - PERST# is not toggled during retry.
> 
> For retry to work, flow must be exactly as handled by present patch,
> that is, we must cut power, disable the clocks, then re-enable
> both clocks and power regulators and go through initialization
> without touching PERST#. Then quirky devices are able to sucessfully
> enumerate.
> 

This sounds weird. PERST# is just an indication to the device that the power and
refclk are applied or going to be removed. The devices uses PERST# to prepare
for the power removal during assert and start functioning after deassert.

It looks like the PERST# polarity is inverted in your case. Could you please
change the 'ep-gpios' polarity to GPIO_ACTIVE_LOW and see if it fixes the issue
without this patch?

If that didn't work, could you please drop the 'ep-gpios' property and check?

> No functional change intended for already working devices.
> 
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip-host.c | 47 ++++++++++++++++++---
>  1 file changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index 2a1071cd3241..67b3b379d277 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -338,11 +338,14 @@ static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
>  static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>  {
>  	struct device *dev = rockchip->dev;
> -	int err, i = MAX_LANE_NUM;
> +	int err, i = MAX_LANE_NUM, is_reinit = 0;
>  	u32 status;
>  
> -	gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
> +	if (!is_reinit) {
> +		gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
> +	}
>  
> +reinit:

So this reinit part only skips the PERST# assert, but calls
rockchip_pcie_init_port() which resets the Root Port including PHY. I don't
think it is safe to do it if PERST# is wired.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

