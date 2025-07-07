Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F053C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 22:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/O1eYmmlVX+XdTP22WyqwcUWM7eMMMRRzRPqVaa9MUQ=; b=aQxWWP6+9tDAGz01+9SGwhCYsc
	QPnlMrw1EYi5mT7Tay90Jpe2at33rx8TqGCOaS2xvJS1ddnGUDxbTTER1r+yoE1aufXgx2rYJ9kDd
	Il7naKicIyN4PEEMsSVRsJurYs574hcNBEKTCxN+yawReHWByNWo1PFkQHfkRaZBGOeENOmDkV586
	MLDWtP4jY+SUEjTYQd0I1IuZQjVBvRtGhPypiotpq0KdeT52HXb1ihMccUA2UN4vD/eQnzInyl33K
	igY5ePLAAsbIEEFwiu3OYHJjt42G7NF/a0fleB59lEBCEbfl/peCATvBRN/XYNcXkfyVA39SfSyOd
	tgKzTiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuGL-00000003hjw-2bGh;
	Mon, 07 Jul 2025 22:24:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuE2-00000003hbX-0EIO;
	Mon, 07 Jul 2025 22:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC95FA4AC08;
	Mon,  7 Jul 2025 22:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690CEC4CEE3;
	Mon,  7 Jul 2025 22:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751926932;
	bh=VKmtbfxhoTD48D/ekjwLMwNv+Dp8aDndHjI4BucvUmw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MfKa/VY/D8o8WU7cbff2usg9a9qVjvAGjstrw4JfKOUNiEmnK9naUFS4mixRLJPk1
	 jJ2V7GtmTRQ3z95LkSEx6PD8pJAAcx4qR8ZhIMV1HFBPkGP/b1MEqj9rlfp7YHZ1go
	 6s6D8X/Im9CgH+leQZTYV+lNEyL1w0QCOBu7n3Q57j6qrpdNPviZpzpFwRtaJRZzWO
	 wEm0LUHD4zVPrPrnc1B+Zs5qHC73U5SR19nj3EGKXpRLurHN7xTlvB4T7xcLT6kHUr
	 KxemPjXfbUU7B6+tUQRp49II+xFWg0p5Zhs8v/PjK57RzlYWvDbxivuRx8EETx3jLh
	 rb+BuzBG+NS3A==
Date: Mon, 7 Jul 2025 17:22:10 -0500
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
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v9 1/4] PCI: rockchip: Use standard PCIe defines
Message-ID: <20250707222210.GA2114615@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e81700ef4b49f584bc8834bfb07b6d8995fc1f42.1751322015.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_152214_162644_DE36962D 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jun 30, 2025 at 07:24:41PM -0300, Geraldo Nascimento wrote:
> Current code uses custom-defined register offsets and bitfields for
> standard PCIe registers. Change to using standard PCIe defines. Since
> we are now using standard PCIe defines, drop unused custom-defined ones,
> which are now referenced from offset at added Capabilities Register.

> @@ -278,10 +278,10 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
>  		power = power / 10;
>  	}
>  
> -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCR);
> -	status |= (power << PCIE_RC_CONFIG_DCR_CSPL_SHIFT) |
> -		  (scale << PCIE_RC_CONFIG_DCR_CPLS_SHIFT);
> -	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCR);
> +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
> +	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
> +	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_SCL, scale);

Added #include <linux/bitfield.h> for this:

  CC      drivers/pci/controller/pcie-rockchip-host.o
drivers/pci/controller/pcie-rockchip-host.c: In function ‘rockchip_pcie_set_power_limit’:
drivers/pci/controller/pcie-rockchip-host.c:272:24: error: implicit declaration of function ‘FIELD_MAX’ [-Werror=implicit-function-declaration]
  272 |         while (power > FIELD_MAX(PCI_EXP_DEVCAP_PWR_VAL)) {
      |                        ^~~~~~~~~
drivers/pci/controller/pcie-rockchip-host.c:282:19: error: implicit declaration of function ‘FIELD_PREP’ [-Werror=implicit-function-declaration]
  282 |         status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
      |                   ^~~~~~~~~~


