Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A90CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoqplH1KkbJvKNh+298dRJYaB3aRXcNveXxZuGwchBw=; b=NVhMRYMISZ+rs8QHCAJQQ0tTaw
	1f2USOY4YzDDuSDJqSofeVz2mALpogWt6nN+J776xMRXTzIFx7nPqW5i2EHufK7DlODFonJUV9Gnz
	e8FsZAfuTQIbU1HLj4/Z70ElpilGdsPb6JdhabjstlwVtnwmOyXjKawWTNigF1GsJi8dNT9fi3pR4
	tTj03HQHumNQ7MwTuQtZqYSUGR3UhMGQG/dgzr3vAg8W9uAiKhj7ZJg/8oS8Ey9JnFsZBFtHg0Rok
	WJshqIr/S7jkH/VSSw547Q/4LUbhfUFmWpqmOFoOoPwP3KsxBoIBwlhf6ZP2BLSXxFF6Hb5O48Ae7
	rT6fsxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcXc-0000000FHzS-48gj;
	Tue, 28 Oct 2025 05:46:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcXb-0000000FHzM-1dky
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 05:46:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 866D461162;
	Tue, 28 Oct 2025 05:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9E3C4CEE7;
	Tue, 28 Oct 2025 05:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761630402;
	bh=GIhQbgstKqKNQsX/bs0Wtz1Bd+P3U6ihgvZLbC5Zffk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKIkt7/tnQBjx1ozQ6sp7zdz8KisgToH5jMgNOiVLFpVvd8vpHFRVxzjwDhOa2Jr7
	 6vrGO9AkZZdDTdEw8iunpiu6Xm/Itn/uSiHd6p86nTwsdHX78rlWIPGvXnO1XHteC9
	 Nb/lLYeM0G7korAuDwRe3PJ+XGDyoHO5VPp75QoUXYuT4YmF024DDE3JgG7BJuSoOp
	 6qvSuRYZWJOo4OlPhTDcfvLjTBGY4jIaxGq2vxrcINr4Mw+a8stNwG/svOE52cAcZa
	 Fb6aRzCajsje6BiH744MAOwebTEgTE5EWSwyzbOAjeuoMhyRDAvgD6fC+eoRfHU6yq
	 HSGnr5z4IOO7g==
Date: Tue, 28 Oct 2025 11:16:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vitor Soares <vitor.soares@toradex.com>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] PCI: j721e: Add support for optional regulator
 supplies
Message-ID: <5ogtnqbf32fy4rprcsthip5byl4dtgybsys2ur3ph6mc77q7po@apfcl7olp4zj>
References: <20251014112553.398845-1-ivitro@gmail.com>
 <20251014112553.398845-3-ivitro@gmail.com>
 <p3l2p2raecqqkpdjswiddkthpxzvhm3rl4cw56y2epgcxfiwbb@gsieef3yqvpk>
 <91e8f4346a677a2ea46a210d7422adb99e70b3be.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91e8f4346a677a2ea46a210d7422adb99e70b3be.camel@gmail.com>
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

On Mon, Oct 27, 2025 at 08:24:12PM +0000, Vitor Soares wrote:
> Hello Mani,
> 
> Thank you for the feedback.
> 
> On Tue, 2025-10-21 at 07:36 +0530, Manivannan Sadhasivam wrote:
> > On Tue, Oct 14, 2025 at 12:25:49PM +0100, Vitor Soares wrote:
> > > From: Vitor Soares <vitor.soares@toradex.com>
> > > 
> > > Some boards require external regulators to power PCIe endpoints.
> > > Add support for optional 1.5V, 3.3V, and 12V supplies, which may be
> > > defined in the device tree as vpcie1v5-supply, vpcie3v3-supply, and
> > > vpcie12v-supply.
> > > 
> > > Use devm_regulator_get_enable_optional() to obtain and enable each
> > > supply, so it will be automatically disabled when the driver is
> > > removed.
> > > 
> > > Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> > > ---
> > >  drivers/pci/controller/cadence/pci-j721e.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/pci/controller/cadence/pci-j721e.c
> > > b/drivers/pci/controller/cadence/pci-j721e.c
> > > index 5bc5ab20aa6d..f29ce2aef04e 100644
> > > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > > @@ -21,6 +21,7 @@
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > >  
> > >  #include "../../pci.h"
> > >  #include "pcie-cadence.h"
> > > @@ -467,6 +468,10 @@ static const struct of_device_id of_j721e_pcie_match[]
> > > = {
> > >  };
> > >  MODULE_DEVICE_TABLE(of, of_j721e_pcie_match);
> > >  
> > > +static const char * const j721e_pcie_supplies[] = {
> > > +       "vpcie12v", "vpcie3v3", "vpcie1v5"
> > > +};
> > 
> > Please don't hardcode the supplies in driver. The DT binding should make sure
> > the relevant supplies are passed (including the optional ones). Just use
> > of_regulator_bulk_get_all() to acquire all the passed supplies.
> > 
> > - Mani
> > 
> 
> I checked the bulk regulator APIs as suggested and of_regulator_bulk_get_all()
> does handle optional supplies correctly, however it is not a managed function
> and doesn't enable the  regulators automatically.
> 
> To use of_regulator_bulk_get_all(), I would need to:
> - Manually enable regulators with regulator_bulk_enable()
> - Add cleanup/disable logic in remove path
> - Handle error cleanup path manually
> 
> This would actually make the code more complex and error-prone compared to the
> current approach using devm_regulator_get_enable_optional(), which provides
> managed cleanup and automatic enable for optional supplies.
> 
> I also checked devm_regulator_bulk_get_enable(), it treats all supplies as
> required and needs the supplies name as well.
> 
> Unless there is a devm_regulator_bulk_get_optional_enable() API I'm not aware
> of, the current per-supply approach is the standard kernel pattern for this use
> case. Would you still prefer the bulk approach despite these limitations?
> 

Fine then. If you do not have a reason to manualy turn off/on the supplies
(during suspend/resume), then it might be better to use
devm_regulator_get_enable_optional() for now.

I'd love to add the managed version of of_regulator_bulk_get_all(), but I guess
Mark wouldn't want it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

