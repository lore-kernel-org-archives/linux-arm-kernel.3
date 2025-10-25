Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32640CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 07:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbdeyP+eDVCA00Q0ivESHkryAn8CRzx/dtn5+VRV56o=; b=HEdq+b2BokEoUis9Fg9OUiMBcP
	GJH2N8VCmoVIAO9Gq1IAGjKnZPtSvZVcaN6OYo8g3kQlr6eYwi8wnvBfIs5tNrtm33KUi/DBsXS60
	xc53cNSxP9HvdzHCj/FsLbvm70U0b3U0eL9uVBOUeZdv34J+MZ1ljJsv4W9Hloz6gVCI33UtDsw4D
	r1JUqvO3QT8ihcVXGT7RGBAwNEF5pTVDIKBdjM1DQ9CJYPPq14gKk+oFd8PAMwzwKIdDWBvjmg7Xv
	gnTyinZBHTYL0EMToc0ZM0O0HeN+uyyEiAhK77WF/SWsPf0RTTo5Q5t/NUHgVcazvZat67Oh3h1wB
	1aDfb9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZ3M-0000000B660-0DLU;
	Sat, 25 Oct 2025 07:51:08 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZ3J-0000000B65e-41OT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 07:51:07 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59P7owZm2039353;
	Sat, 25 Oct 2025 02:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761378658;
	bh=RbdeyP+eDVCA00Q0ivESHkryAn8CRzx/dtn5+VRV56o=;
	h=Subject:From:To:CC:Date:In-Reply-To:References;
	b=TrVOj+BH9xRNybAjg8fw4lwtU/K9UAAE3YIutcuI8xne/E8EjESIWlft8NvYT4iLf
	 UxBKSqY9ysRpeRtVMv7rBu5NFafRtqMhP66CetvpCxdBNJAFZm/aTOgiaibDrMV0ec
	 8sJ72sFqVMztFZyXr5yByHwYg8W+9n7F8N/aNRzE=
Received: from DLEE203.ent.ti.com (dlee203.ent.ti.com [157.170.170.78])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59P7oviI239962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 25 Oct 2025 02:50:57 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 25 Oct
 2025 02:50:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 25 Oct 2025 02:50:57 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59P7orDT1595972;
	Sat, 25 Oct 2025 02:50:54 -0500
Message-ID: <e6f4f3c93cfc2f18c36da10d3f86c1a50ab2bbf5.camel@ti.com>
Subject: Re: [PATCH v2 1/2] PCI: j721e: Use devm_clk_get_optional_enabled()
 to get the clock
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
        Markus Elfring
	<Markus.Elfring@web.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>
Date: Sat, 25 Oct 2025 13:21:03 +0530
In-Reply-To: <20251025074336.26743-2-linux.amoon@gmail.com>
References: <20251025074336.26743-1-linux.amoon@gmail.com>
	 <20251025074336.26743-2-linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_005106_093371_9AECE560 
X-CRM114-Status: GOOD (  18.19  )
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

On Sat, 2025-10-25 at 13:13 +0530, Anand Moon wrote:
> Use devm_clk_get_optional_enabled() helper instead of calling
> devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
> the clk_prepare_enable() and clk_disable_unprepare() with proper error
> handling and makes the code more compact.
> The result of devm_clk_get_optional_enabled() is now assigned directly
> to pcie->refclk. This removes a superfluous local clk variable,
> improving code readability and compactness. The functionality
> remains unchanged, but the code is now more streamlined.
>=20
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2: Rephase the commit message and use proper error pointer
>     PTR_ERR(pcie->refclk) to return error.
> v1: Drop explicit clk_disable_unprepare as it handled by
>     devm_clk_get_optional_enabled, Since devm_clk_get_optional_enabled
>     internally manages clk_prepare_enable and clk_disable_unprepare
>     as part of its lifecycle, the explicit call to clk_disable_unprepare
>     is redundant and can be safely removed.
> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/con=
troller/cadence/pci-j721e.c
> index 5bc5ab20aa6d..b678f7d48206 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c

[TRIMMED]

> @@ -692,7 +682,6 @@ static int j721e_pcie_suspend_noirq(struct device *de=
v)
> =20
>  	if (pcie->mode =3D=3D PCI_MODE_RC) {
>  		gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> -		clk_disable_unprepare(pcie->refclk);

j721e_pcie_resume_noirq() contains clk_enable_prepare().

>  	}
> =20
>  	cdns_pcie_disable_phy(pcie->cdns_pcie);

Regards,
Siddharth.

