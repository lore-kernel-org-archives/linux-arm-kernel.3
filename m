Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57DECCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 05:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKZpUop+FVVFZo/GRFyiI1DacY+YwtXsqrnvM06cm/4=; b=3UMoisqzdq/N0qpg/+cyi4xq0K
	LtcZGGdjc0W4CQlsJqf91LV8mv5KHHC4aLvToUBpnGAdSlHmpJgTQhF0AAYbXWhtD2Ty+fbT3Fq17
	HmmfUXTdA7Vb3JuX6PeOVhgIABWbXTRXtWdeJBfH01BhOxz0sN5HnTAXeccntRwBvvtwF62PT+SPI
	61gloiXMW0aftqObvY8aWxAN4a4zkne2foL5MSMU0sYcy9HRg2TnbsLkTOUMTAIA4gjqx8ee5IcTk
	mquMUVkpMALLN9rhAjR2eXKRVMlTiwNXfYiyr5EqpuQzd3Dgi+utMMWZ1CwllZWEwXRe6E7NOhRMf
	kC0rfu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDFWu-0000000D76s-3sbA;
	Mon, 27 Oct 2025 05:12:28 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDFWr-0000000D766-3aFp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 05:12:27 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59R5CBCh2335172;
	Mon, 27 Oct 2025 00:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761541931;
	bh=SKZpUop+FVVFZo/GRFyiI1DacY+YwtXsqrnvM06cm/4=;
	h=Subject:From:To:CC:Date:In-Reply-To:References;
	b=fPaUHYyPDXj37YA7gTyR/FehcVjwtLlFyuvlYugi9syluqsTBk4N2HWOOO8zFGJif
	 Zn1hJFIh5Qy5f1GqZXJ2mSanS140og4rF/uDKhpvnv0yMscMJHOYGZK94lwuzw3qPI
	 QPJXkTx/rZzbKwOEQdgsz3ARW4lbshSPIppJmuN4=
Received: from DLEE203.ent.ti.com (dlee203.ent.ti.com [157.170.170.78])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59R5CAI91432776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Oct 2025 00:12:10 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 00:12:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 00:12:10 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59R5C66j102620;
	Mon, 27 Oct 2025 00:12:07 -0500
Message-ID: <bef3d7015012c4004d21cd829892ca942496a6dd.camel@ti.com>
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
Date: Mon, 27 Oct 2025 10:42:17 +0530
In-Reply-To: <CANAwSgQ2PH1TJLEBVPFJ-RdaNFxn=eTzRYfEmbjx=EYq_YOeQw@mail.gmail.com>
References: <20251025074336.26743-1-linux.amoon@gmail.com>
	 <20251025074336.26743-2-linux.amoon@gmail.com>
	 <e6f4f3c93cfc2f18c36da10d3f86c1a50ab2bbf5.camel@ti.com>
	 <CANAwSgQ2PH1TJLEBVPFJ-RdaNFxn=eTzRYfEmbjx=EYq_YOeQw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_221226_050741_A09DD02D 
X-CRM114-Status: GOOD (  26.51  )
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

On Sat, 2025-10-25 at 14:07 +0530, Anand Moon wrote:
> Hi Siddharth,
>=20
> Thanks for your review comments,
>=20
> On Sat, 25 Oct 2025 at 13:20, Siddharth Vadapalli <s-vadapalli@ti.com> wr=
ote:
> >=20
> > On Sat, 2025-10-25 at 13:13 +0530, Anand Moon wrote:
> > > Use devm_clk_get_optional_enabled() helper instead of calling
> > > devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
> > > the clk_prepare_enable() and clk_disable_unprepare() with proper erro=
r
> > > handling and makes the code more compact.
> > > The result of devm_clk_get_optional_enabled() is now assigned directl=
y
> > > to pcie->refclk. This removes a superfluous local clk variable,
> > > improving code readability and compactness. The functionality
> > > remains unchanged, but the code is now more streamlined.
> > >=20
> > > Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > > v2: Rephase the commit message and use proper error pointer
> > >     PTR_ERR(pcie->refclk) to return error.
> > > v1: Drop explicit clk_disable_unprepare as it handled by
> > >     devm_clk_get_optional_enabled, Since devm_clk_get_optional_enable=
d
> > >     internally manages clk_prepare_enable and clk_disable_unprepare
> > >     as part of its lifecycle, the explicit call to clk_disable_unprep=
are
> > >     is redundant and can be safely removed.
> > > ---
> > >  drivers/pci/controller/cadence/pci-j721e.c | 21 +++++---------------=
-
> > >  1 file changed, 5 insertions(+), 16 deletions(-)
> > >=20
> > > diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci=
/controller/cadence/pci-j721e.c
> > > index 5bc5ab20aa6d..b678f7d48206 100644
> > > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> >=20
> > [TRIMMED]
> >=20
> > > @@ -692,7 +682,6 @@ static int j721e_pcie_suspend_noirq(struct device=
 *dev)
> > >=20
> > >       if (pcie->mode =3D=3D PCI_MODE_RC) {
> > >               gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> > > -             clk_disable_unprepare(pcie->refclk);
> >=20
> > j721e_pcie_resume_noirq() contains clk_enable_prepare().
> Ok I will drop the clk_prepare_enable and clk_disable_unprepare in
> this function?

The clock needs to be disabled on Suspend and enabled on Resume.

The reasoning behind replacing:
devm_clk_get_optional()  + clk_prepare_enable()
with:
devm_clk_get_optional_enabled()
is clear to me, but the removal of the 'clk_disable_unprepare()' on the
Suspend path isn't.

Removing 'clk_disable_unprepare()' in the driver's remove path makes sense
because the
devm() API will automatically disable and unprepare the clock when the
device is "unbound".
However, to the best of my understanding, the device is not "unbound"
during Suspend.
Can you clarify why 'clk_disable_unprepare()' should be removed in
j721e_pcie_suspend_noirq()?

Regards,
Siddharth.

