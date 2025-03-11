Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A41C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=H95WLd/HmwJKm9bEn9fufaox+NHKURefqPOC5fv8/cg=; b=nKmTzUHBQ7HAlAh1RSLYi15GMi
	NbirUyptZppzLsQE5tv8PQ7IAecjuBpIjovvu67sOSCaPtuxJU6hxRVWAwCt6tMKQWL3mWOaGqsjs
	LrMMEt/iStLMdR+ySResoWfBu8TprBhqZlNUA0HLQdGUxSPNebwTZ+MhfDoCSrfZH7++5Y+emdMsR
	T9r0ywMy+MvwZoOn7QJ18/k8MGUO7ACAxjoS4bBCReaUGHePFnm5tL3sfnwO3hAWrfuIfpD0PfBCo
	jtwqN0rLyJhF9E7IQRtts2ODNBwxjTc5XH6KkeRnwy4ekVslf+cjza+i4gx3uqt79n8w9IJjvAd5K
	ed+ne7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1yD-00000006Ei7-1chV;
	Tue, 11 Mar 2025 15:56:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1wW-00000006DVV-0EZA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:54:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9DCACA45D8C;
	Tue, 11 Mar 2025 15:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B81C4CEE9;
	Tue, 11 Mar 2025 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741708494;
	bh=59F6J7gJoDFQunyroBn4G1SonEz9fZYnbkG7e7m9IQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=t0yA/FyC7lczjY8YSNzsRaULUN+PBIZd2eGD73GoaovsruwvmZ8igVjOGsovn/t8c
	 2sFn8Vsmrd8uRE8LRmyBN+rIVHYAliR4OpPBIljRCC5KBTV3v8saF9DyI73ZsME04h
	 bbEznsUiUuxYBqW1U43M/5D29DCmk85we3nYORuXfYmR9iF3V+98GVPAefwbQ8xRsJ
	 5/9a9x3lUgVWq0ZkFxcO64LY4HTab44jiE5/PgSzK20DMdQfxrG8x+wgMlZNNF3jKC
	 ay84W9nFwOV/CHw2DfQrlBUwsJuPtyFK36F7WZ7afC8DhVt7EH4e21gmnV8CLKd/Kk
	 w2rnsiYaUEWzQ==
Date: Tue, 11 Mar 2025 10:54:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] PCI: imx6: Use domain number replace the hardcodes
Message-ID: <20250311155452.GA629749@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676E66BD40C37B2A7E390178CD12@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_085456_281348_F7847E8D 
X-CRM114-Status: GOOD (  31.92  )
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

On Tue, Mar 11, 2025 at 01:11:04AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: 2025年3月10日 23:11
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > kw@linux.com; manivannan.sadhasivam@linaro.org; bhelgaas@google.com;
> > s.hauer@pengutronix.de; festevam@gmail.com; devicetree@vger.kernel.org;
> > linux-pci@vger.kernel.org; imx@lists.linux.dev; kernel@pengutronix.de;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v1 2/2] PCI: imx6: Use domain number replace the
> > hardcodes
> > 
> > On Wed, Feb 26, 2025 at 10:42:56AM +0800, Richard Zhu wrote:
> > > Use the domain number replace the hardcodes to uniquely identify
> > > different controller on i.MX8MQ platforms. No function changes.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 14 ++++++--------
> > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 90ace941090f..ab9ebb783593 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -41,7 +41,6 @@
> > >  #define IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE	BIT(11)
> > >  #define IMX8MQ_GPR_PCIE_VREG_BYPASS		BIT(12)
> > >  #define IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE	GENMASK(11, 8)
> > > -#define IMX8MQ_PCIE2_BASE_ADDR			0x33c00000
> > >
> > >  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
> > >  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
> > > @@ -1474,7 +1473,6 @@ static int imx_pcie_probe(struct platform_device
> > *pdev)
> > >  	struct dw_pcie *pci;
> > >  	struct imx_pcie *imx_pcie;
> > >  	struct device_node *np;
> > > -	struct resource *dbi_base;
> > >  	struct device_node *node = dev->of_node;
> > >  	int i, ret, req_cnt;
> > >  	u16 val;
> > > @@ -1515,10 +1513,6 @@ static int imx_pcie_probe(struct
> > platform_device *pdev)
> > >  			return PTR_ERR(imx_pcie->phy_base);
> > >  	}
> > >
> > > -	pci->dbi_base = devm_platform_get_and_ioremap_resource(pdev, 0,
> > &dbi_base);
> > > -	if (IS_ERR(pci->dbi_base))
> > > -		return PTR_ERR(pci->dbi_base);
> > 
> > This makes me wonder.
> > 
> > IIUC this means that previously we set controller_id to 1 if the first item in
> > devicetree "reg" was 0x33c00000, and now we will set controller_id to 1 if
> > the devicetree "linux,pci-domain" property is 1.
> > This is good, but I think this new dependency on the correct
> > "linux,pci-domain" in devicetree should be mentioned in the commit log.
> > 
> > My bigger worry is that we no longer set pci->dbi_base at all.  I see that the
> > only use of pci->dbi_base in pci-imx6.c was to determine the controller_id,
> > but this is a DWC-based driver, and the DWC core certainly uses
> > pci->dbi_base.  Are we sure that none of those DWC core paths are
> > important to pci-imx6.c?
> Hi Bjorn:
> Thanks for your concerns.
> Don't worry about the assignment of pci->dbi_base.
> If pci-imx6.c driver doesn't set it. DWC core driver would set it when
>  dw_pcie_get_resources() is invoked.

Great, thanks!  Maybe we can amend the commit log to mention that and
the new "linux,pci-domain" dependency.

