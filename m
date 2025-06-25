Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13093C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLQEk9nf4M+xfxN9yU2UZz0oobzrPxuu3GxjJlT/J5Q=; b=eycIew0Ij5qBz/RgRVuISzsK7y
	GwNhITcSVnedXh4juWSPDTedxtLId3gaz1Yc3fKIQLFAD0qm0VXHdo5NaWaz69TgHQJ3Cgd8x6plz
	85Z2JVlHRMS0FYCvZo/U11RmL5fspCR/5K9QKo4YsKqXhzbU3Cgi+E1y2mJgXqfGpuSn+NP7fpFOE
	1vEyAMGS2DJVWkKo1xIrJMUT8aSTZYgDhi3yBVhvPl6mjIHTZGXP9YlFsFI7FBPZDILIAvuoQP+Xj
	wkznRK7yCvcpeBF0+caZWDnRSUHUlR59b9JN2SNoM9wolV8uD8RqaBKRb8a2OPeNWU21tn7l/hyxx
	tQnU/pPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYGn-0000000A2Bi-2ILS;
	Wed, 25 Jun 2025 22:07:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUY0Z-0000000A0KI-3nvK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 21:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3659A52E8E;
	Wed, 25 Jun 2025 21:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AD3C4CEEA;
	Wed, 25 Jun 2025 21:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750888218;
	bh=dmiwvHrq20K4u2vHveigUjMypKXxfJB0t/PI8qx1mlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYk5T0MhHnnsC8r5IcS9ZzR+lUEedaC7Nl19Hci1qtGjyjRwkD8VQ7fApeK8aRPxx
	 +o65L0dBxH5la4KE7SDYnr2p+OsrOWkQeZZ4x525W2ku+lWQpN6PtiGq/Yd1wvlGjG
	 N7xbv5Hh70vE1caNvbfthO4nY/z39U8uaCstEIorIzTBixpLI6OeQ72FewVKPP/a0Z
	 0DeDw/drEUQtnR9huigRtrEB2Hew7rDJ53DRYa1/57mlkOCanb0hk1wU7d0JPTEzXb
	 qQ+rbzsCNKbQ3MpW84vy9qc0PLYWkH/7WSI9VX5CxhA22LeIC9l3KpL36VjPdOkuOo
	 2xqfAjV6Gv/6Q==
Date: Wed, 25 Jun 2025 15:50:12 -0600
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] PCI: xilinx: Wait for link-up status during
 initialization
Message-ID: <cto6st65jsa36vbyrnazwrdu6m4f7rocmtz6ez25qoija73s74@fkpw6wla5cma>
References: <20250610185734.GA819344@bhelgaas>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.bd37b5e5-7e20-4db7-b2f4-b11b97bc1326@emailsignatures365.codetwo.com>
 <9f8a7c43-4862-45aa-951c-bf3e3c1f5513@topic.nl>
 <vwipw5opvx42e6l7ofphg47rlsoebbts7dwzq5knaf4iz4hmhw@gk6lo4b6plxh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vwipw5opvx42e6l7ofphg47rlsoebbts7dwzq5knaf4iz4hmhw@gk6lo4b6plxh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_145020_090890_E2C1BE02 
X-CRM114-Status: GOOD (  39.38  )
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

On Wed, Jun 25, 2025 at 03:46:56PM -0600, Manivannan Sadhasivam wrote:
> On Wed, Jun 11, 2025 at 08:48:51AM +0200, Mike Looijmans wrote:
> > 
> > Met vriendelijke groet / kind regards,
> > 
> > Mike Looijmans
> > System Expert
> > 
> > 
> > TOPIC Embedded Products B.V.
> > Materiaalweg 4, 5681 RJ Best
> > The Netherlands
> > 
> > T: +31 (0) 499 33 69 69
> > E: mike.looijmans@topic.nl
> > W: www.topic.nl
> > 
> > Please consider the environment before printing this e-mail
> > On 10-06-2025 20:57, Bjorn Helgaas wrote:
> > > On Tue, Jun 10, 2025 at 04:39:03PM +0200, Mike Looijmans wrote:
> > > > When the driver loads, the transceiver and endpoint may still be setting
> > > > up a link. Wait for that to complete before continuing. This fixes that
> > > > the PCIe core does not work when loading the PL bitstream from
> > > > userspace. Existing reference designs worked because the endpoint and
> > > > PL were initialized by a bootloader. If the endpoint power and/or reset
> > > > is supplied by the kernel, or if the PL is programmed from within the
> > > > kernel, the link won't be up yet and the driver just has to wait for
> > > > link training to finish.
> > > > 
> > > > As the PCIe spec allows up to 100 ms time to establish a link, we'll
> > > > allow up to 200ms before giving up.
> > > > +static int xilinx_pci_wait_link_up(struct xilinx_pcie *pcie)
> > > > +{
> > > > +	u32 val;
> > > > +
> > > > +	/*
> > > > +	 * PCIe r6.0, sec 6.6.1 provides 100ms timeout. Since this is FPGA
> > > > +	 * fabric, we're more lenient and allow 200 ms for link training.
> > > > +	 */
> > > > +	return readl_poll_timeout(pcie->reg_base + XILINX_PCIE_REG_PSCR, val,
> > > > +			(val & XILINX_PCIE_REG_PSCR_LNKUP), 2 * USEC_PER_MSEC,
> > > > +			2 * PCIE_T_RRS_READY_MS * USEC_PER_MSEC);
> > > > +}
> > > I don't think this is what PCIE_T_RRS_READY_MS is for.  Sec 6.6.1
> > > requires 100ms *after* the link is up before sending config requests:
> > > 
> > >    For cases where system software cannot determine that DRS is
> > >    supported by the attached device, or by the Downstream Port above
> > >    the attached device:
> > > 
> > >      ◦ With a Downstream Port that does not support Link speeds greater
> > >        than 5.0 GT/s, software must wait a minimum of 100 ms following
> > >        exit from a Conventional Reset before sending a Configuration
> > >        Request to the device immediately below that Port.
> > > 
> > >      ◦ With a Downstream Port that supports Link speeds greater than
> > >        5.0 GT/s, software must wait a minimum of 100 ms after Link
> > >        training completes before sending a Configuration Request to the
> > >        device immediately below that Port. Software can determine when
> > >        Link training completes by polling the Data Link Layer Link
> > >        Active bit or by setting up an associated interrupt (see §
> > >        Section 6.7.3.3).  It is strongly recommended for software to
> > >        use this mechanism whenever the Downstream Port supports it.
> > > 
> > Yeah, true, I misread the comment in pci.h. I cannot find any #define to
> > match the "how long to wait for link training". Each driver appears to use
> > its own timeout. So I should just create my own?
> > 
> 
> We recently merged a series that moved the timing definitions to
> drivers/pci/pci.h:
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/linkup-fix&id=470f10f18b482b3d46429c9e6723ff0f7854d049
> 
> So if you base your series on top this branch, you could reuse the definitions.
> 

You could also introduce a new macro if all you need is 1s:

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 9d20f0222fb1..f03bb882bf2e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -64,6 +64,7 @@ struct pcie_tlp_log;
  */
 #define PCIE_LINK_WAIT_MAX_RETRIES     100
 #define PCIE_LINK_WAIT_SLEEP_MS                10
+#define PCIE_LINK_WAIT_MS              PCIE_LINK_WAIT_MAX_RETRIES * PCIE_LINK_WAIT_SLEEP_MS
 
 /* Message Routing (r[2:0]); PCIe r6.0, sec 2.2.8 */
 #define PCIE_MSG_TYPE_R_RC     0

- Mani

-- 
மணிவண்ணன் சதாசிவம்

