Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F68C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvvAOFUGtBlRNFN5ga2i2bHg+X/ah94U7DI0PCwXwOk=; b=gwz+M29zstZ2onEgsijgFyvygL
	L1qofjfTSGGsWwHrIxxng5fyRhDT2K+rUc+shWdsy/deVbwJYhylKCzjc0KtRcIQUWIuttVdB3jmY
	I2FsItAemx4xxk9NzFoYvf/UsByfN2aT6aPBqv1wP9OAizz2jBQ2yCQNIyTkOlUeHfTZkREOrpaNw
	0ojOGz+gXhLs/lqhKamx9lFLSvbdCoLQ3lvSvy4p0RmOnWs/MeH/udKWZeUJuM3Cpxy9FezCJv30c
	zOr3lSSVk0WdPHYB09cmTBsqubXGmrLCG8KYzZhl+dmiuE5SPpppeA0auOlmNuMM5wJ6zsfEYfLeC
	wGMxV9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvll-0000000Ak1M-1S0n;
	Wed, 18 Jun 2025 16:36:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtxZ-0000000ATKk-2veP;
	Wed, 18 Jun 2025 14:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9A8BFA5207E;
	Wed, 18 Jun 2025 14:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03704C4AF09;
	Wed, 18 Jun 2025 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750257616;
	bh=NZxcboNj0nuhBZTiZGcW1Uoh9H3u/i+DdNNtMO2BCiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fHAFPWY+bjZDxt88PVq4qICdy1RJi09dMFa8vOiWZGgCG0FvkQGsOWm1vvWeifh/y
	 4GxoSjdkIvCB5pIF3Ssu3kLb597vzXRBLBFPIn8CrT0FWDHg3tW2EDGElcRK+7/Wdd
	 D4f9blxctSSEh7VvHA0F391whCHN0kz+076R/CpLk0vzSCh75dLcJL86lRAv6ami0x
	 onyqMfNhrLZYU8ODll/pBG33p2rhancEWnop2WSLAFpXg6+401K4KID/IzMx7ldRc1
	 fgGQaQWRQK7zcnFkTJgFEVmGjXrC8JE4ReqzXpMSGF5UwMPIMHo5rn43VzGhK3KmFx
	 k9DdIMJHMye6Q==
Date: Wed, 18 Jun 2025 16:40:11 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Delay link training after hot reset
 in EP mode
Message-ID: <aFLPyxZD5lkAtw6b@ryzen>
References: <20250617220114.GA1156610@bhelgaas>
 <20250617220523.GA1157905@bhelgaas>
 <aFLL0vPFzxdVOR9a@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFLL0vPFzxdVOR9a@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_074017_860020_03D35EBF 
X-CRM114-Status: GOOD (  23.94  )
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

On Wed, Jun 18, 2025 at 04:23:19PM +0200, Niklas Cassel wrote:
> On Tue, Jun 17, 2025 at 05:05:23PM -0500, Bjorn Helgaas wrote:
> > On Tue, Jun 17, 2025 at 05:01:16PM -0500, Bjorn Helgaas wrote:
> > > On Fri, Jun 13, 2025 at 12:19:09PM +0200, Niklas Cassel wrote:
> > 
> > Oh, and this sets PCIE_LTSSM_ENABLE_ENHANCE | PCIE_LTSSM_APP_DLY2_EN
> > once at probe-time, but what about after a link-down/link-up cycle?
> > 
> > Don't we need to set PCIE_LTSSM_ENABLE_ENHANCE |
> > PCIE_LTSSM_APP_DLY2_EN again when the link comes up so we don't have
> > the same race when the link goes down again?
> 
> Nope, we don't.
> 
> To verify I used this patch:
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index be239254aacd..e79add5412b8 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -506,6 +506,8 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
>         if (reg & PCIE_LINK_REQ_RST_NOT_INT) {
>                 dev_dbg(dev, "hot reset or link-down reset\n");
>                 dw_pcie_ep_linkdown(&pci->ep);
> +               pr_info("PCIE_CLIENT_HOT_RESET_CTRL after reset: %#x\n",
> +                       rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_HOT_RESET_CTRL));
>                 /* Stop delaying link training. */
>                 val = HIWORD_UPDATE_BIT(PCIE_LTSSM_APP_DLY2_DONE);
>                 rockchip_pcie_writel_apb(rockchip, val,
> 
> 
> 
> 
> [   85.979567] rockchip-dw-pcie a40000000.pcie-ep: hot reset or link-down reset
> [   85.980210] PCIE_CLIENT_HOT_RESET_CTRL after reset: 0x12
> [   93.720413] rockchip-dw-pcie a40000000.pcie-ep: hot reset or link-down reset
> [   93.721074] PCIE_CLIENT_HOT_RESET_CTRL after reset: 0x12
> 
> 0x12 == bit 1 and bit 4 are set.
> 
> bit 1: app_dly2_en
> bit 4: app_ltssm_enable_enhance

Oh, and just to verify that the hardware does not clear the app_dly2_en bit
when we write the app_dly2_done bit, I ran the same test, but with the
prints in rockchip_pcie_ep_sys_irq_thread(), just after calling
dw_pcie_ep_linkup(&pci->ep); and got the same result:

[   57.176862] rockchip-dw-pcie a40000000.pcie-ep: link up
[   57.177338] PCIE_CLIENT_HOT_RESET_CTRL after linkup: 0x12
[   72.448052] rockchip-dw-pcie a40000000.pcie-ep: link up
[   72.448527] PCIE_CLIENT_HOT_RESET_CTRL after linkup: 0x12

So I think this patch is good as is.
(Except for the citation style in the commit message which you didn't like :))


Kind regards,
Niklas

