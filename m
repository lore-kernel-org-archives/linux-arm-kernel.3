Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CC9CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czAFqwUxu1RRvsaEwmwAhemzu37izgwHbHusC3tw3xY=; b=a1ISNsvefcRO2mWbESurvUfSkr
	Y3JxCDXkFPvmV4u+gjycHEGZnRxww/z4d6CGf22Gy+sbVOBfhspVq6T/AU+PJGGlm/QLXsXCLAy7q
	PF+F7hwo+kt4ztAfeg+/spw4/V6c03jxlrJ0e39h6NT7yMeMk0MDdontP3rw3+bYcfJhcrG/ho5e9
	97/Mx7anE2Lnwm8FiZgdrTPuCUQKDPEya7oY094uV18+Ic4tqVr4WfZlRFCNY2lR+o8k9nhsdkkLa
	pVJMMM/X+YaJTkplkxJHt7HLigZZHLubhDV+HIFU1esXw35kBt1y2pruRXCPrK6E5qTdZc5Kmzhvy
	E83O9tag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GUZ-0000000Czbu-3JH6;
	Mon, 13 Oct 2025 11:13:27 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GUX-0000000CzbP-0pRj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 11:13:26 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DBDHAJ808399;
	Mon, 13 Oct 2025 06:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760353997;
	bh=czAFqwUxu1RRvsaEwmwAhemzu37izgwHbHusC3tw3xY=;
	h=Subject:From:To:CC:Date:In-Reply-To:References;
	b=HuXZx5OYB3ddlEdZPRO4NTYU+0xRZ26O5qAyPPbwmnOohhT1mNgNjwJE4BEpEmqC9
	 6CPCUGJzCgmE/HsidzKd6bRPWqcMOn5gfGlFk2KjV02e16thXrCkE/2RT/xMNPOiYW
	 OPHcUOuRCCAbsaehysxKvqFEapg/DIlySP6+hs/8=
Received: from DLEE204.ent.ti.com (dlee204.ent.ti.com [157.170.170.84])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DBDHvH2918415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 06:13:17 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 06:13:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 06:13:17 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DBDDct1726378;
	Mon, 13 Oct 2025 06:13:14 -0500
Message-ID: <11a8783345566d5ea6c696ecd007490289ba0b5f.camel@ti.com>
Subject: Re: [RFC v1 1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to
 get the clock
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Anand Moon <linux.amoon@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Lorenzo Pieralisi
	<lpieralisi@kernel.org>,
        Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        "open
 list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>,
        "open
 list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>,
        "moderated
 list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
Date: Mon, 13 Oct 2025 16:43:19 +0530
In-Reply-To: <20251013101727.129260-2-linux.amoon@gmail.com>
References: <20251013101727.129260-1-linux.amoon@gmail.com>
	 <20251013101727.129260-2-linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_041325_511869_593BD4EC 
X-CRM114-Status: GOOD (  17.52  )
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

On Mon, 2025-10-13 at 15:47 +0530, Anand Moon wrote:
> Use devm_clk_get_optional_enabled() helper instead of calling
> devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
> the error handling and makes the code more compact. This changes removes
> the unnecessary clk variable and assigns the result of the
> devm_clk_get_optional_enabled() call directly to pcie->refclk.
> This makes the code more concise and readable without changing the
> behavior.
>=20
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/con=
troller/cadence/pci-j721e.c
> index 5bc5ab20aa6d..d6bbd04c615b 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -479,7 +479,6 @@ static int j721e_pcie_probe(struct platform_device *p=
dev)
>  	struct cdns_pcie_ep *ep =3D NULL;
>  	struct gpio_desc *gpiod;
>  	void __iomem *base;
> -	struct clk *clk;
>  	u32 num_lanes;
>  	u32 mode;
>  	int ret;
> @@ -603,18 +602,11 @@ static int j721e_pcie_probe(struct platform_device =
*pdev)
>  			goto err_get_sync;
>  		}
> =20
> -		clk =3D devm_clk_get_optional(dev, "pcie_refclk");
> -		if (IS_ERR(clk)) {
> -			ret =3D dev_err_probe(dev, PTR_ERR(clk), "failed to get pcie_refclk\n=
");
> -			goto err_pcie_setup;
> -		}
> -
> -		ret =3D clk_prepare_enable(clk);
> -		if (ret) {
> +		pcie->refclk =3D devm_clk_get_optional_enabled(dev, "pcie_refclk");
> +		if (IS_ERR(pcie->refclk)) {
>  			dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
>  			goto err_pcie_setup;

'err_pcie_setup' returns 'ret' which isn't being updated above.
Maybe add:
		ret =3D pcie->refclk;
above dev_err_probe(...

>  		}
> -		pcie->refclk =3D clk;
> =20
>  		/*
>  		 * Section 2.2 of the PCI Express Card Electromechanical

Regards,
Siddharth.

