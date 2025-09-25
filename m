Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0103CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=bLz+eCfPxQRSJq/FYoup19CDiPxNuQfA57VJY+B5wAA=; b=2+Lk75fPBNIUvE
	MMfQXLou8nsXobyoEiazLIoib3XqTEYOd2f33B9Hkggpm3DtiwUvZWBLmwGsL/TLyAldUsCmhtGZf
	7yvFY2GhBaYGT/R7U2FFuInvc78Owkbx31OkirklPQrp3zBjmISRiaim/CIRykSIc60UOyFG1ED6x
	pWJ3QOGaj/8tqHA/X47XSqFWGmbu3epw1AsUZrWF7yQfCl/K5qzAyoxWc5tgyjTNl0ZDZmrUaLjVt
	Y/bahjAfLG/8ATE+KITOu8WqIDPadFz0MWKtp94GmUVSdY3TfbkFVpB/dMgQGLlfLkiqAqArf67+b
	qhsGP/qRdWjSbUx6s5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nMT-0000000AIni-1UIP;
	Thu, 25 Sep 2025 14:54:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nMR-0000000AIm7-3htk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:54:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 512B86060B;
	Thu, 25 Sep 2025 14:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1156C4CEF5;
	Thu, 25 Sep 2025 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758812059;
	bh=jPB4xVjcQGBdG5oVew+Lht5SAent64Z1rar77L6+Oek=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=u0ikscfs6G31P4bXOTz2TswSzOQR1fdgspn6lZ9NqdIHjbRuPl15mbV861jRpCSKh
	 ONvJHPSdZM0VQeYD6iNJ22uILG6QNWyf/AloAuCz3WEFLN8B5MfTy2fDdP7lJsYS7P
	 vLG4AbgEUPbVVSPUSzdqXrNxu6uMJ6IdN417gD/aevH9gFc1x74tpQuA5LplmbtVfE
	 eD11RHPJKmcJYA71znv9g5U8UfhkdBzU1qOzhnEad5xxWHVkHj8XJYB5pL9rDGZMC8
	 M3QXZyRYhzwSrWnHvXoyvj2oWYw4hsJefjMtK4o65vqycS5pl0o9GTT4tVhEYYb9C0
	 28VOTxnZsP7Pg==
Date: Thu, 25 Sep 2025 09:54:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	chaitanya chundru <quic_krichai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
	amitk@kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6 5/9] PCI: dwc: Implement .start_link(), .stop_link()
 hooks
Message-ID: <20250925145416.GA2164008@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-qps615_v4_1-v6-5-985f90a7dd03@oss.qualcomm.com>
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

On Thu, Aug 28, 2025 at 05:39:02PM +0530, Krishna Chaitanya Chundru wrote:
> Implement stop_link() and  start_link() function op for dwc drivers.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 952f8594b501254d2b2de5d5e056e16d2aa8d4b7..bcdc4a0e4b4747f2d62e1b67bc1aeda16e35acdd 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -722,10 +722,28 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
>  
> +static int dw_pcie_op_start_link(struct pci_bus *bus)
> +{
> +	struct dw_pcie_rp *pp = bus->sysdata;
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +
> +	return dw_pcie_host_start_link(pci);

This takes a pci_bus *, which could be any PCI bus, but this only
works for root buses because it affects the link from a Root Port.

I know the TC9563 is directly below the Root Port in the current
topology, but it seems like the ability to configure a Switch with I2C
or similar is potentially of general interest, even if the switch is
deeper in the hierarchy.

Is there a generic way to inhibit link training, e.g., with the Link
Disable bit in the Link Control register?  If so, this could
potentially be done in a way that would work for any vendor and for
any Downstream Port, including Root Ports and Switch Downstream Ports.

> +}
> +
> +static void dw_pcie_op_stop_link(struct pci_bus *bus)
> +{
> +	struct dw_pcie_rp *pp = bus->sysdata;
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +
> +	dw_pcie_host_stop_link(pci);
> +}
> +
>  static struct pci_ops dw_pcie_ops = {
>  	.map_bus = dw_pcie_own_conf_map_bus,
>  	.read = pci_generic_config_read,
>  	.write = pci_generic_config_write,
> +	.start_link = dw_pcie_op_start_link,
> +	.stop_link = dw_pcie_op_stop_link,
>  };
>  
>  static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
> 
> -- 
> 2.34.1
> 

