Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38C3C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVOBXpLFpC4lb/F5CWObmG74tJQ/WK094KEZcxE6IMU=; b=E9/i8IFqAgYCbB3sF5hw6MrtNy
	jZ5xiYdpcCXhO4x8P7wDCfenaBCM4lTB27xY4f6Mz11mam87ow6zQZHC/VgSJGQq64cezFzPgCOov
	pjzDmRAws6unbKZ0pCpS6b1dWNWpfghjWplu0qB9AAq2K+MFaI0OKcj6eUOH6kx1gWDOi47XX7a+e
	vcfwldEdyFhiuDG4do7D7GaWs5Wn+gvapWM/q+MExxX93T3XhX7zQYCt8fNYxIoB77d+EuUDmv4I8
	VUw80GNyPHfFXOho9o11ILYeVy8/GwLSGNB+vYmtHoxeqFz7e5BMZEvF+Ry5oFNtJN5N4MWVjOiy2
	5nD+jgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzpT-00000008rsp-18EY;
	Wed, 02 Jul 2025 15:56:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyy0-00000008iop-29ac
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 15:01:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0FBA45C41;
	Wed,  2 Jul 2025 15:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D895C4CEE7;
	Wed,  2 Jul 2025 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751468503;
	bh=SaHDZ4wIBsKxb9s+1iRJfvfGTvCsTriRDi+uhUgl3qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFPz1ekKdZbVNAz4rJGd5xyY5sZ4nqGJ+5hipsT580I38dRu8oiRtgERhYUGL17Dw
	 OLLSrukOiRKQqk1QszwYYUfSyffBrcBmdkpPPNk722l6XE4DDnPXgt9jnW+IsfOyWg
	 6nk2yLMejqVFloDl7E6PNxNapikx72jx4TufUVvI/x/j6wsdr9dRdnfmkOQmQH5XC5
	 9Rcyq+yh2Q9iNexx2zcOy7LZXMM6pb5OQoWn+Bq4f6vfz1n8To/nIOmhdfdvQ+DrGT
	 egmcTbxiUt3JJ413o+IYnU53CQrO2X3C1AeROg3WY7ywthUO4zhjGX8Z9udVC3wkXp
	 Kr8PhJFJNpprQ==
Date: Wed, 2 Jul 2025 20:31:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 03/10] PCI: endpoint: pci-ep-msi: Add MSI
 address/data pair mutable check
Message-ID: <tkamojjbdfrwhvgyufcncikl6fkndedfyzm5ebo7qof66s4gmu@mjsgrcfdkms5>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-3-77362eaa48fa@nxp.com>
 <5axgxbtyqbwwncimjiiedvkm3ap7at553vgj72bht4kynke5cd@xfghwfmp6cy7>
 <aGVFWgnAIwWOnLjK@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGVFWgnAIwWOnLjK@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_080144_596166_DA40D07E 
X-CRM114-Status: GOOD (  24.53  )
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

On Wed, Jul 02, 2025 at 10:42:43AM GMT, Frank Li wrote:
> On Wed, Jul 02, 2025 at 05:00:23PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jun 09, 2025 at 12:34:15PM GMT, Frank Li wrote:
> > > Some MSI controller change address/data pair when irq_set_affinity().
> > > Current PCI endpoint can't support this type MSI controller. Call
> > > irq_domain_is_msi_immutable() check if address/data pair immutable.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change in v18
> > > - update commit message. remove 'include/linux/msi.h' part.
> > >
> > > change from v14 to v17
> > > - none
> > >
> > > change from  v13 to v14
> > > - bring v10 back
> > >
> > > Change from v9 to v10
> > > - new patch
> > > ---
> > >  drivers/pci/endpoint/pci-ep-msi.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/pci/endpoint/pci-ep-msi.c b/drivers/pci/endpoint/pci-ep-msi.c
> > > index 549b55b864d0e..c0e2d806ee658 100644
> > > --- a/drivers/pci/endpoint/pci-ep-msi.c
> > > +++ b/drivers/pci/endpoint/pci-ep-msi.c
> > > @@ -44,6 +44,14 @@ int pci_epf_alloc_doorbell(struct pci_epf *epf, u16 num_db)
> > >
> > >  	dev_set_msi_domain(dev, dom);
> > >
> > > +	if (!irq_domain_is_msi_parent(dom))
> > > +		return -EINVAL;
> >
> > This check is not justified in commit message.
> >
> > > +
> > > +	if (!irq_domain_is_msi_immutable(dom)) {
> > > +		dev_err(dev, "Can't support mutable address/data pair MSI controller\n");
> > > +		return -EINVAL;
> >
> > GICv3 ITS is an immutable MSI controller. From the earlier patches, I could see
> > that you have tested this series with ITS. How did that happen if it errors out
> > here?
> 
> I removed IMMUTASBLE flags in ITS driver to check if go to this error branch.
> 

Sorry, I misread the check and got confused by the error message. Presence of
IMMUTABLE flag is required by this driver, which is fine. Please reword the
error message to,

	"MSI controller not supported\n"

If one bothers to check why, the !irq_domain_is_msi_immutable() check is self
explanatory.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

