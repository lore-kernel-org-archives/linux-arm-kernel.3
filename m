Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E8AC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=f5ISdO9CDxMQEFEYi8BQeD9P8yr+qseW8cdrsDI0T8k=; b=Eorga0JwgQ+mZUiIB/CTwGOZOf
	qxkZqvBGb2QQg8P9MoAKzpMglapDeW8R1Gql3uSXyoaGPifR+YoO6ZESu+pk/9fdwzh6AdFwKWHAF
	lNDGRbk3/6uT/nUfMwtNIVDcuZ1QyNDuQYtzHKknOjoVBoZMR96hCFpI071oBpLUY/J/gBRImdLS4
	n76Zn4O3RFb7PxXlDnwFpSFGr1DFoiQpimQOAEvEn00UGoQmqKbEpyGBowBWplDrBjBKVip8koVyi
	fRl/bBVVnGH6xkc4idJT4IjF3WEa8S1AbTwu5/W6G/dXodwwpgSVWq2sNi+/IfFwVZI0JSRCwDP2q
	Ewa+rGRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNgC-00000008n3S-1tKm;
	Wed, 12 Mar 2025 15:07:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNdF-00000008mYP-2wFN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 15:04:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 337625C38FC;
	Wed, 12 Mar 2025 15:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6940BC4CEDD;
	Wed, 12 Mar 2025 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741791868;
	bh=0LPk8+MvfGynbwPGt0NyOytayCc66T5wfAVNQKAjUrY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=I216Xd/eU3neOxcuswv7lF+WIHdCJHXoZollljYS9f5Sg3tH1cpxwS6+GmLSaHZn5
	 OckHLmef0JjB9F/50Ks/GVtqOQsh1YxNfGc2tBFgovF9H/lNV3QgC8bLD6o+3pZQpI
	 hTV/xrbPwP1m0p5ysSBZ+nzGcPuvNx1KAvA0LAszJqGHrwCivPCwcDiTdDXQpqTJPw
	 I7x79FU3hWDQfscuGsp17s5E067AhXp++KBfhbfZ4uUIgQHG3skB8zkiWGm4y5/p5O
	 Fyeo0kuJkdL7ZD0mYuuwFZ/vr6W3zRW0Un9ilz+8pt2G5BlYMSZepkODtztnP9VRs2
	 S0STqRqv1Ah9Q==
Date: Wed, 12 Mar 2025 10:04:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Hongxing Zhu <hongxing.zhu@nxp.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
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
Message-ID: <20250312150426.GA674002@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcb5f09f8e4311c7a6ef60aaf3cb4e3f05a8f05e.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_080429_825238_754F524B 
X-CRM114-Status: GOOD (  33.76  )
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

On Wed, Mar 12, 2025 at 09:28:02AM +0100, Lucas Stach wrote:
> Am Mittwoch, dem 12.03.2025 um 04:05 +0000 schrieb Hongxing Zhu:
> > > -----Original Message-----
> > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > Sent: 2025年3月11日 23:55
> > > On Tue, Mar 11, 2025 at 01:11:04AM +0000, Hongxing Zhu wrote:
> > > > > -----Original Message-----
> > > > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > > > Sent: 2025年3月10日 23:11
> > > > > On Wed, Feb 26, 2025 at 10:42:56AM +0800, Richard Zhu wrote:
> > > > > > Use the domain number replace the hardcodes to uniquely identify
> > > > > > different controller on i.MX8MQ platforms. No function changes.
> > > > > > 
> > > > > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > > > > ---
> > > > > >  drivers/pci/controller/dwc/pci-imx6.c | 14 ++++++--------
> > > > > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > > > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > > > > index 90ace941090f..ab9ebb783593 100644
> > > > > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > > > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > > > > @@ -41,7 +41,6 @@
> > > > > >  #define IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE	BIT(11)
> > > > > >  #define IMX8MQ_GPR_PCIE_VREG_BYPASS		BIT(12)
> > > > > >  #define IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE	GENMASK(11,
> > > 8)
> > > > > > -#define IMX8MQ_PCIE2_BASE_ADDR			0x33c00000
> > > > > > 
> > > > > >  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
> > > > > >  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
> > > > > > @@ -1474,7 +1473,6 @@ static int imx_pcie_probe(struct
> > > > > > platform_device
> > > > > *pdev)
> > > > > >  	struct dw_pcie *pci;
> > > > > >  	struct imx_pcie *imx_pcie;
> > > > > >  	struct device_node *np;
> > > > > > -	struct resource *dbi_base;
> > > > > >  	struct device_node *node = dev->of_node;
> > > > > >  	int i, ret, req_cnt;
> > > > > >  	u16 val;
> > > > > > @@ -1515,10 +1513,6 @@ static int imx_pcie_probe(struct
> > > > > platform_device *pdev)
> > > > > >  			return PTR_ERR(imx_pcie->phy_base);
> > > > > >  	}
> > > > > > 
> > > > > > -	pci->dbi_base = devm_platform_get_and_ioremap_resource(pdev,
> > > 0,
> > > > > &dbi_base);
> > > > > > -	if (IS_ERR(pci->dbi_base))
> > > > > > -		return PTR_ERR(pci->dbi_base);

> > Use the domain number replace the hardcodes to uniquely identify
> > different controller on i.MX8MQ platforms. No function changes.
> > Please make sure the " linux,pci-domain" is set for i.MX8MQ correctly, since
> >  the controller id is relied on it totally.
> > 
> This breaks running a new kernel on an old DT without the
> linux,pci-domain property, which I'm absolutely no fan of. We tried
> really hard to keep this way around working in the i.MX world.
> 
> I'm fine with using the property if present and even mandating it for
> new platforms, but getting rid of the existing code for the i.MX8MQ
> platform is only a marginal cleanup of the driver code with the obvious
> downside of the above breakage.

I don't know the history of these DTs, but if there are any old DTs
for platforms that use controller 1 but lack 'linux,pci-domain', I
agree that we should not break them.

If we need to retain the dbi_base check so that old DTs continue to
work, I think it should look something like this:

  domain = of_get_pci_domain_nr(node);
  if (domain >= 0) {
      if (domain > 1)
          return dev_err_probe(..., "invalid domain %d\n", domain);
      imx_pcie->controller_id = domain;
  } else {
      dev_warn(..., "DT lacks linux,pci-domain, falling back to DBI addr\n");
      dbi_res = platform_get_resource(pdev, IORESOURCE_MEM, index);
      if (dbi_res->start == IMX8MQ_PCIE2_BASE_ADDR)
          imx_pcie->controller_id = 1;
  }

The previous code used devm_platform_get_and_ioremap_resource() and
set pci->dbi_base, but (1) there's no need to set pci->dbi_base since
the DWC core does that anyway, and (2) I think using ioremap() means
we depend on CPU virt == CPU phys, and I don't think we need to depend
on that.

Bjorn

