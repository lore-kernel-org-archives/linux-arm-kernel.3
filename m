Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9148CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 23:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=p566VH11WOTEQM+KlajmaQW9QYXXQNM1rv++dhPkvo0=; b=s6iavzJYhP7T+7
	gPRFddGFVG3zNYZwXuLYMBq59GWnTSA8JMOenxP8CbIth4uAHMCK8RNGfL6L4mvFjnOT4sWbvhZQh
	zZ82al5rYWAt5ZbfYQ/HFP4j9S9QkoYSFEiQuGaTRiKGxMmCfwzJd6yblAY6j1emt7E3qBfvwXc9z
	uCktdqG3pOiNuJLZWCHDhrbvPVvGiDyHyvA+ww/zquzTBhsid9bTAWU7sevKysPa/VAZBl0vsCndd
	McAzgEA6t6Gn1OBDkAXm0B9t4Dw7xuNgSiVwDig352wN1S1CzS2u7XgNPjWKkwEotdmbwOVxc7YmA
	60aoFWAKJTa55wnVcMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEFQF-00000003EYu-1AMw;
	Wed, 29 Oct 2025 23:17:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEFQE-00000003EY6-1EJA;
	Wed, 29 Oct 2025 23:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 811AC603B5;
	Wed, 29 Oct 2025 23:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126F7C4CEF7;
	Wed, 29 Oct 2025 23:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761779860;
	bh=aFz6dNrVlKIsZLpN20nJ2pqC29DlAbSGUScdk1UfEz8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bFPw5cOcCeFltvMCeaFuRH9GwUMurde5R12RYt+oJg3qbctMpxuK5FXdcZ6ygBwLS
	 9VDIdDWrNlpnvsTL+FeMImz7l6LF3AGWv9MC2RM7YeV3NyuTmVaYowz2oFdvIAa6Q0
	 Gqqnm60U7PCSxtUKbus8yFgeae/L7bVwy2gs+dPXFROrxO9dHFZW4dYvhI9GacMf4d
	 4YGszKJGMSs6hWZHUNq9qFaYSsAfKWnRiWMTAlHIy0NksgYmzmchkRna1ba62HWwqE
	 b3lUz9uzLuOYisZfBFpOSuGv48ZaQTEUOy7ZGVyJ5dhWiIFMi6HZS23JUd9eyyrROP
	 I9Ui74I1Y8SCg==
Date: Wed, 29 Oct 2025 18:17:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jingoo Han <jingoohan1@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v4 9/9] PCI: dwc: support missing PCIe device on resume
Message-ID: <20251029231738.GA1601908@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-rockchip-pcie-system-suspend-v4-9-ce2e1b0692d2@collabora.com>
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

On Wed, Oct 29, 2025 at 06:56:48PM +0100, Sebastian Reichel wrote:
> When dw_pcie_resume_noirq() is called for a PCIe root complex for a PCIe
> slot with no device plugged on Rockchip RK3576, dw_pcie_wait_for_link()
> will return -ETIMEDOUT. During probe time this does not happen, since
> the platform sets 'use_linkup_irq'.
> 
> This adds the same logic from dw_pcie_host_init() to the PM resume
> function to avoid the problem.

s/PCI: dwc: support/PCI: dwc: Support/  (in subject; capitalize first word)
s/This adds/Add/

Can you mention 8d3bf19f1b58 ("PCI: dwc: Don't wait for link up if
driver can detect Link Up event") here?  I think that's what added the
similar probe-time code.

I see you did copy the comment from 8d3bf19f1b58, thanks for that!

Maybe also word your subject and commit log along the same lines so
the two commits are easier to connect to each other.

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index e92513c5bda5..f25f1c136900 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1215,9 +1215,16 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  	if (ret)
>  		return ret;
>  
> -	ret = dw_pcie_wait_for_link(pci);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * Note: Skip the link up delay only when a Link Up IRQ is present.
> +	 * If there is no Link Up IRQ, we should not bypass the delay
> +	 * because that would require users to manually rescan for devices.
> +	 */
> +	if (!pci->pp.use_linkup_irq) {
> +		ret = dw_pcie_wait_for_link(pci);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	return ret;
>  }
> 
> -- 
> 2.51.0
> 

