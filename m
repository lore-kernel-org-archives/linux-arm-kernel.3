Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D82C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 07:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDAFPXKS82gTS92dWyyL8gD8KrfvGGRfui3h5/5pRJ0=; b=NQ9Av4uO/qXUblRZlInpvfBt4W
	xpmhXsms/ZMg5RJnLUJ0a4kZuhgacf/wkeACu4voyL7F3IQCuUQyxxojpUgHUySKc3CjG2LW5KPSu
	mH2nraLKVjTvHEbmuMLLkqYii/OFUSjEU9LzJiwVrZByo0e3t8yZqC674sijSnPWYbBV0dR36v4m8
	v82QIWFMaFaXGfQtrxnLYnXfGcmvqjfrqoSs4phaTr/MJ+udgDgYGJWjiVxc7+zIA+NgniF81SoLz
	1dFJFlAQjbO6Nk1KBYcNjq32ys4uJWfDMH98met/AficUYAnvHyHlkwygVbhQMVcEwn/pc89OnMqs
	d6tXa3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkOR-000000012pp-2UfK;
	Fri, 02 May 2025 07:01:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkMV-000000012XX-20Dd;
	Fri, 02 May 2025 06:59:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82F09A4B4DC;
	Fri,  2 May 2025 06:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E737C4CEE4;
	Fri,  2 May 2025 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746169146;
	bh=6sClcWYGukBbkpULYb0l3opl4yAyv99xyShFUXuykaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZ+518aayrvUeQVuipI53moncuZzz4Ed/Dxji11skD7ZoU/b8gOmjfcFisHFnOejD
	 2H5xYuuxFMt83VfJdsM7XgiERYCLpi+Vp7GPfHA9/+FVKOMljmLiY8ZpT6e/iKg7wJ
	 nizYqciu1F9qXd4WqTODYU2hO5nO8p7Tr2SM3InYqL1ZXhj48gc2MHuwECjTbfWsSE
	 nxl0K8UkWJ+BABy1L3v4uOSlh1iyZZ7HEgsGwd+N3IkkBZvgbSi8bl0oBeX9CNQqF/
	 vE/ksOsT8chgpOzjxV3Qp8JItztaXuCleeQfhQHliip5rBU/ZMNjodJXuwNkE5CpKp
	 dWtzAxdeOe4nw==
Date: Fri, 2 May 2025 08:59:00 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Wilfred Mallawa <wilfred.opensource@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [PATCH v2] PCI: dwc: Add support for slot reset on link down
 event
Message-ID: <aBRtNOLQ6R-5iOB4@ryzen>
References: <20250501-b4-pci_dwc_reset_support-v2-1-d6912ab174c4@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501-b4-pci_dwc_reset_support-v2-1-d6912ab174c4@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_235907_576708_F818F8F3 
X-CRM114-Status: GOOD (  12.17  )
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

Hello Wilfred,

On Thu, May 01, 2025 at 11:57:39AM +1000, Wilfred Mallawa wrote:
> @@ -688,6 +699,79 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static int rockchip_pcie_rc_reset_slot(struct pci_host_bridge *bridge,
> +				       struct pci_dev *pdev)
> +{
> +	struct pci_bus *bus = bridge->bus;
> +	struct dw_pcie_rp *pp = bus->sysdata;
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
> +	struct device *dev = rockchip->pci.dev;
> +	u32 val;
> +	int ret;
> +
> +	dw_pcie_stop_link(pci);
> +	rockchip_pcie_phy_deinit(rockchip);
> +	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);

Sorry that I didn't see/mention this earlier, but the order which we deinit
things should be the reversed order of how we initialized things.

(i.e. it should match the ordering of the error path.)

In both the error path of this function, and the error path of
rockchip_pcie_probe(), we do deinit_clk before deinit_phy, so I suggest we
do the same here.


Kind regards,
Niklas

