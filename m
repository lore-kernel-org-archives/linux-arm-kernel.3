Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0D1C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 06:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dtma4NIIxwZ25QmncfJqv/YPoOIELjervTPth/gAlKU=; b=F0N6RUX7On8FRm6iMaeGwootgF
	zvEDELOSJGvwglE+/QKARnuBsl1u2OWzT6l5509novM9eqDgi192ObRepvdET9jOezcIx6gfUfMIl
	rrZso6A8qmkJe4vcu6Jkd71fjLqm+1kDP92U7KWWH3dfbbvZJoV37m7TUWEronIKY2PGD6zxMzvP8
	iIFxxxgybc0nmk8ZgxJjvdCy2oH57uf57vB2SXhWPOaF4Jk0adOCr/wSBy++UeGorEP8iDAhT8Ix/
	ixV6HnuRn/4Glsf+GSFaHhu+l7Se7GyR7T9kyeO10zfYwxknNAi/Ws61MXkQbscvDF0lAxFVUzbTW
	xmTnWZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsyyo-0000000DFd9-2JeB;
	Fri, 14 Mar 2025 06:57:14 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsywh-0000000DFQW-2YtU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 06:55:04 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E6skUj2064774
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 01:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741935286;
	bh=Dtma4NIIxwZ25QmncfJqv/YPoOIELjervTPth/gAlKU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kwK2PpU/bjctEmztwr2AEu5GYAxTepORfZ7T/uDON7Do6KtcT/0PM7dHxR7ccWh/O
	 kDgB6WtEZ5AJHuRsA32IK6VcZErzgbJ/J1f0NuXX6Yv77d+/pts2MX4WLk5Ew59+NJ
	 gM1oxS9pfpG0xFPZweuyWIrit78DYbR9xWstwqDs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52E6skSm003712
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Mar 2025 01:54:46 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Mar 2025 01:54:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Mar 2025 01:54:46 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E6simv093913;
	Fri, 14 Mar 2025 01:54:45 -0500
Date: Fri, 14 Mar 2025 12:24:44 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kw@linux.com>, <robh@kernel.org>, <bhelgaas@google.com>,
        <vigneshr@ti.com>, <kishon@kernel.org>, <cassel@kernel.org>,
        <wojciech.jasko-EXT@continental-corporation.com>,
        <thomas.richard@bootlin.com>, <bwawrzyn@cisco.com>,
        <linux-pci@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 1/4] PCI: cadence: Add support to build pcie-cadence
 library as a kernel module
Message-ID: <20250314065444.fmvhyqmuefnm4mcq@uda0492258>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-2-s-vadapalli@ti.com>
 <20250313174416.n3c4srf6hb2l3bvg@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250313174416.n3c4srf6hb2l3bvg@thinkpad>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_235503_745815_542F6CE0 
X-CRM114-Status: GOOD (  20.62  )
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

On Thu, Mar 13, 2025 at 11:14:16PM +0530, Manivannan Sadhasivam wrote:

Hello Mani,

> On Fri, Mar 07, 2025 at 04:01:25PM +0530, Siddharth Vadapalli wrote:
> > From: Kishon Vijay Abraham I <kishon@ti.com>
> > 
> > Currently, the Cadence PCIe controller driver can be built as a built-in
> > module only. Since PCIe functionality is not a necessity for booting, add
> > support to build the Cadence PCIe driver as a loadable module as well.
> > 
> > Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> > ---
> >  drivers/pci/controller/cadence/Kconfig             |  6 +++---
> >  drivers/pci/controller/cadence/pcie-cadence-ep.c   |  6 ++++++
> >  drivers/pci/controller/cadence/pcie-cadence-host.c |  9 +++++++++
> >  drivers/pci/controller/cadence/pcie-cadence.c      | 12 ++++++++++++
> >  drivers/pci/controller/cadence/pcie-cadence.h      |  4 ++--
> >  5 files changed, 32 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
> > index 8a0044bb3989..82b58096eea0 100644
> > --- a/drivers/pci/controller/cadence/Kconfig
> > +++ b/drivers/pci/controller/cadence/Kconfig
> > @@ -4,16 +4,16 @@ menu "Cadence-based PCIe controllers"
> >  	depends on PCI
> >  
> >  config PCIE_CADENCE
> > -	bool
> > +	tristate
> >  
> >  config PCIE_CADENCE_HOST
> > -	bool
> > +	tristate
> >  	depends on OF
> >  	select IRQ_DOMAIN
> 
> Even though this was added earlier, looks like not needed.

Thank you for reviewing this patch.

drivers/pci/controller/cadence/Kconfig has the following:
...
	config PCIE_CADENCE_HOST
		bool
		depends on OF
		select IRQ_DOMAIN
		select PCIE_CADENCE
...
	config PCI_J721E_HOST
		bool "TI J721E PCIe controller (host mode)"
		depends on ARCH_K3 || COMPILE_TEST
		depends on OF
		select PCIE_CADENCE_HOST
		select PCI_J721E
...
So PCI_J721E_HOST selects PCIE_CADENCE_HOST which in turn selects
PCIE_CADENCE. As of now, none of these configs are enabled in
arm64-defconfig, and they also will not be accepted as built-in modules
as it will bloat the Linux Image for everyone. For that reason, they are
all being converted to loadable modules, and their configs will eventually
be enabled in arm64-defconfig as loadable modules.

Please let me know if I misunderstood your comment regarding the quoted
change not being required.

Regards,
Siddharth.

