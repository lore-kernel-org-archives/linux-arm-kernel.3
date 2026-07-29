Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E556AC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 22:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0U5DHx/vibag0y1MX3xU73yi1W1IoWaz0Zw0N4cnjm8=; b=dcA0Deq+drgacq
	zjFgIE7zhdSVFZsRNQmtk7OtS+aB+8e1d2ZIpaa+uBsy47/fs6+PZOHkdh85E20x2/LgwxhuE8t+c
	o7IMNQJeQ2Eaj4Z65Dna5e6Wk9oxp7PmSZqxM2lWjaeCb724CVnbkCtFkx29SZ+fLwLJAyIXtg6Ht
	EkokeA/onsgSAvYYNazxvBSuMasQsW0nkbBSkCTQjGqEu3eoB4hBFVVycM1PVJ6Geu5dPmT6Qo9GM
	NhQZ+sf2ktmwl3W6WxcjzvTWCGth1NyHN12K4AYDwV5kwX3JM2XhRZdT+DNRpGTAlyfnYhVeT27EA
	bMjufAxU0m4K6yvLV2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCmb-000000093uN-3QDb;
	Wed, 29 Jul 2026 22:29:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCma-000000093uG-3Om1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 22:29:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3241A41892;
	Wed, 29 Jul 2026 22:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAC31F000E9;
	Wed, 29 Jul 2026 22:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785364188;
	bh=0U5DHx/vibag0y1MX3xU73yi1W1IoWaz0Zw0N4cnjm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=npp3Pj8SkNgFweE8i7YmpVumas1g6oBVU96OUQlUBjDF0LDtQtyvi0MXqoszHv9Zo
	 JeiOqIxP5uWNrvyn20RfxtmonJj11aq66qxyQGRk7zC6KkogYC5OdOQzqzPSPYzDsI
	 5qJAX2BODA7CPf1JWuyzsQqkuYhK9bceTAr7Sh2zd3nKPpVugbymxRUCeLxfBKgu24
	 rlO8MR1tujqfrwgfgdekPiZoLV5nvG5m9xe4A+gUmlpuMohfBk9QKMXwRwIdIU+VEW
	 UIVXncmw//H5yU5PTt9ftkoInE/0s4Zoj4gFd9nMA5Dcm3oXM/rLmZ9+8GnA3EgoOj
	 9VRQj3AnIsixg==
Date: Wed, 29 Jul 2026 17:29:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v2] PCI: dwc: Add suspend_poweroff flag for platforms
 with RC power loss
Message-ID: <20260729222946.GA1466768@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717074121.3214222-1-hongxing.zhu@oss.nxp.com>
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

On Fri, Jul 17, 2026 at 03:41:21PM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Some platforms like i.MX power off their PCIe RC controllers during
> system suspend, requiring full re-initialization on resume. These
> platforms need to enter L2 state to properly notify endpoints before
> power loss.
> 
> According to PCIe base spec r7.0, sec 5.2, the system software should
> transition the device into D3Hot before broadcasting the PME_Turn_Off
> message to initiate L2 entry. However, some endpoint devices fail the
> D3cold capability check in pci_host_common_d3cold_possible(), which
> would normally prevent L2 entry.

Wakeup devices that don't support PME from D3cold will fail the D3cold
capability check, but I don't think those are the problem you're
solving.

This appears to handle devices that are not in D3hot, and that's not a
property of the endpoint; it's a property of its driver.  Is the
problem here that some driver didn't put its device in D3hot?

> For platforms where the RC loses power during suspend, L2 entry is
> essential regardless of D3cold support, as the link will be lost anyway.
> Add a suspend_poweroff flag to force L2 entry in such cases, and enable
> it for i.MX PCIe controllers.
> 
> Note: This violates the spec requirement that devices be in D3Hot before
> PME_Turn_Off, but is necessary for proper operation on platforms with RC
> power loss during suspend.

If the device isn't in D3hot, it may still be active, and I think the
PME_Turn_Off will abort any DMAs in progress, which doesn't sound like
proper operation of the endpoint.

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
> Changes in v2:
> - Rename the new added flag.
> - Update commit description and comments.
> 
> ---
>  drivers/pci/controller/dwc/pci-imx6.c             | 11 +++++++++++
>  drivers/pci/controller/dwc/pcie-designware-host.c | 10 ++++++++--
>  drivers/pci/controller/dwc/pcie-designware.h      |  8 ++++++++
>  3 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 98e1db751132a..5a43bf396521b 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1957,6 +1957,17 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		 */
>  		imx_pcie_add_lut_by_rid(imx_pcie, 0);
>  	} else {
> +		/*
> +		 * i.MX RC is powered off during suspend, requiring L2 entry
> +		 * to notify endpoints before power loss. Some endpoints fail
> +		 * the D3cold capability check, which would normally prevent
> +		 * L2 entry. Force L2 entry anyway since the link will be lost
> +		 * when RC powers off.
> +		 *
> +		 * Note: Per PCIe spec r7.0 sec 5.2, devices should be in D3Hot
> +		 * before PME_Turn_Off. This may not be guaranteed here.
> +		 */
> +		pci->pp.suspend_poweroff = true;
>  		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
>  			pci->pp.skip_l23_ready = true;
>  		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_KEEP_MSI_CAP))
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 06722259d2e37..95a31d65e1ca9 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1222,14 +1222,20 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  
>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
> -	bool pme_capable = false;
> +	bool d3cold, pme_capable = false;
>  	int ret = 0;
>  	u32 val;
>  
>  	if (!dw_pcie_link_up(pci))
>  		goto stop_link;
>  
> -	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
> +	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
> +	/*
> +	 * Enter L2 if D3cold is possible, or if the platform loses RC power
> +	 * during suspend (in which case L2 entry is required to notify
> +	 * endpoints before power loss, regardless of D3cold support).
> +	 */
> +	if (!d3cold && !pci->pp.suspend_poweroff)
>  		return 0;
>  
>  	if (pci->pp.ops->pme_turn_off) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index de4b245b1758c..3ce7d30d9a4d5 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -471,6 +471,14 @@ struct dw_pcie_rp {
>  	bool			native_ecam;
>  	bool                    skip_l23_ready;
>  	bool			skip_pwrctrl_off;
> +	/*
> +	 * suspend_poweroff: Force L2 entry during suspend even when D3cold
> +	 * capability check fails. Used on platforms where RC loses power
> +	 * during suspend and must notify endpoints via L2 entry before
> +	 * power loss. May not meet PCIe spec requirement for devices to be
> +	 * in D3Hot before PME_Turn_Off.
> +	 */
> +	bool                    suspend_poweroff;
>  };
>  
>  struct dw_pcie_ep_ops {
> -- 
> 2.34.1
> 

