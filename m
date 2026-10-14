Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F9DCC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 19:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Nwo7fummJ1+6uAUT8/LcA06d2mBN1HNQjSCHgbIgjcU=; b=2f7MU+x2GZv9SS
	3b02GpJCwEOdR56iuYBKT6zHaJAs1N4CnauYI2uWAJ9zbxbEfbMgmQWbLPuApujmmE/9KbZhLF751
	R+yjS8rlM2z1x2/C0KgQvtm+sxg9LBPdM3XRQPRAP4JsBXvjiUdV+3EyZDGHXCQC2rnQ1SHjJL90d
	8/SspJdDiECT8ypzf06fS7vFNfWx++yFtcKFMN2j7L8ybQTb2NiVYesmX7iqGYNqbZnmmDWmnQqJJ
	Er/RCfSpnuNnXFkRhocm535K8dH740PR2luwz0+81MRLo6WWbx8K+H7VPV2PCdugLXUX1kMwn0d/A
	aW4qSOJqi1Y78R8w112Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4mX-0000000GDJW-0qQk;
	Wed, 14 Oct 2026 19:36:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4mW-0000000GDJP-1zsA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 19:36:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E582B41523;
	Wed, 14 Oct 2026 19:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975291F000C4;
	Wed, 14 Oct 2026 19:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792006615;
	bh=Nwo7fummJ1+6uAUT8/LcA06d2mBN1HNQjSCHgbIgjcU=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=DVvcvc7UX80k12qRiHESe3D5qMFFVXrS38E48C9Buz1YyN3x0yyLjfN8PE2O8obfo
	 z1EWyL8sTL4Zx59tmp6xOzDVuU7hCj2hbkXdM89M3tJdnXtlc9u49ZO+Lto+g3BsGu
	 hsyH6xqZqSuHs9uSkr1db02NQdGYUUb5hKuZQNs6e0mShBs1+p9oLvNshC5gBtfnxU
	 5ICHjv7tO8lQQurcDTA1KP612gBPLumtixcyZjH0oDoeejT+40FVxVkP9zTNGRb27e
	 QFXad8keYB8IZ/hC1pkcJr6OqlI6NaCTwLEk0M52Cn+ZuieNdgR4uXGSCl8QqcT2Fo
	 xOB+33S6zENxQ==
Date: Wed, 14 Oct 2026 14:36:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: vjardin@free.fr
Cc: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: layerscape: async probe by default
Message-ID: <20261014193654.GA1656473@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-for-upstream-pci-layerscape-async-probe-v1-1-76412d887baa@free.fr>
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

On Mon, Sep 28, 2026 at 03:48:09PM +0200, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> dw_pcie_wait_for_link() polls for up to
>   PCIE_LINK_WAIT_MAX_RETRIES x PCIE_LINK_WAIT_SLEEP_MS (10 x 90 ms)
> per controller.
> 
> The controllers are probed one after the other, so, it leads to slow
> boot time.
> 
> On an LX2160A board with 4 enabled controllers and no link on any
> of them, ls_pcie_driver_init took almost 4s.

"ls_pcie_driver_init" doesn't exist; I suppose this means
dw_pcie_host_init()?

> Probing the 4 in parallel allows to have it down to 1s.
> 
> The controllers are independent, other DWC based drivers are already
> using async probing such as qcom, imx6, s32g, rcar-gen4 or stm32.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  drivers/pci/controller/dwc/pci-layerscape.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 14d6ac4fc53f..7f37a0537159 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -419,6 +419,7 @@ static struct platform_driver ls_pcie_driver = {
>  		.of_match_table = ls_pcie_of_match,
>  		.suppress_bind_attrs = true,
>  		.pm = &ls_pcie_pm_ops,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  	},
>  };
>  module_platform_driver(ls_pcie_driver);
> 
> ---
> base-commit: 94e8d4e94266bb9737a5963810a3f9365cb2f39d
> change-id: 20260928-for-upstream-pci-layerscape-async-probe-084cae5d0907
> 
> Best regards,
> -- 
> Vincent Jardin <vjardin@free.fr>
> 
> 

