Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3827C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 04:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJxJyWw+HNGoEkY0YqzV8FUsX4LKlrT7ZOekNYT3OXg=; b=O7de4wJc9wRKrYjaMjIXsm7GMr
	M0cZfVN9OrzSMkM4tc4cT2F+ESdTdwb5IqryshawWIhEmdn1DXuAZpvSWgF3svv2/KSPcqy92ArDN
	iT/A96lJ4hHoOlEGZDH121NgkGPb3EbgxoBFiStkiPRu2cJ8Ou3vi1t3sYRNK+OBWR5zeXV91KbxY
	zeRGsKoutHmTzka8JzRwQ6/E5wkdOeGUFen0mEI7zy3TSmCsk2wcgA3VZdo8lySymapRquOrqRPxS
	M7JDXCITFUUxCk1J+BpS6/FK3+CfvI3PX1m7bh1Q7s8mQ+yMTdN3WezF60XcRu8aVkdxVtdAnFh+p
	SI/Op0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tswVj-0000000D3Lz-4C2E;
	Fri, 14 Mar 2025 04:19:04 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tswU4-0000000D3Ej-1QxB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 04:17:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E4H7751577816
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 23:17:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741925827;
	bh=uJxJyWw+HNGoEkY0YqzV8FUsX4LKlrT7ZOekNYT3OXg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zKBeeihXhZ1QITWJuK3qrT/tyE4HVnXoRuzNmvNEv9uqrrliXTYcLFgAKLvhfZsry
	 hLUynqqDWXbKfWI1IQS3GtSjXD8/lilRGvXOa9tAzUTxW11lhkleCjV0wa9ib8k5xg
	 YYBPxSIzzeHjpN1ySx20PJb3Sn3MHG8S4sZ7ODsc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52E4H7xI031477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 23:17:07 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 23:17:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 23:17:06 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E4H5Lg046200;
	Thu, 13 Mar 2025 23:17:06 -0500
Date: Fri, 14 Mar 2025 09:47:05 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kw@linux.com>, <vigneshr@ti.com>, <manivannan.sadhasivam@linaro.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <rogerq@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH] PCI: j721e: Fix the value of linkdown_irq_regfield for
 J784S4
Message-ID: <20250314041705.v5j2fjulol5ywvyq@uda0492258>
References: <20250313055519.j3bpvsm6govd5ytk@uda0492258>
 <20250313160215.GA736346@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250313160215.GA736346@bhelgaas>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_211720_471528_724E15DD 
X-CRM114-Status: GOOD (  31.36  )
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

On Thu, Mar 13, 2025 at 11:02:15AM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 13, 2025 at 11:25:19AM +0530, Siddharth Vadapalli wrote:
> > On Wed, Mar 12, 2025 at 11:16:00AM -0500, Bjorn Helgaas wrote:
> > > On Wed, Mar 05, 2025 at 06:50:18PM +0530, Siddharth Vadapalli wrote:
> > > > Commit under Fixes assigned the value of 'linkdown_irq_regfield' for the
> > > > J784S4 SoC as 'LINK_DOWN' which corresponds to BIT(1). However, according
> > > > to the Technical Reference Manual and Register Documentation for the J784S4
> > > > SoC [0], BIT(1) corresponds to "ENABLE_SYS_EN_PCIE_DPA_1" which is __NOT__
> > > > the field for the link-state interrupt. Instead, it is BIT(10) of the
> > > > "PCIE_INTD_ENABLE_REG_SYS_2" register that corresponds to the link-state
> > > > field named as "ENABLE_SYS_EN_PCIE_LINK_STATE".
> > > 
> > > I guess the reason we want this is that on J784S4, we ignore actual
> > > link-down interrupts (and we don't write STATUS_CLR_REG_SYS_2 to clear
> > > the interrupt indication, so maybe there's an interrupt storm), and we
> > > think some other interrupt (DPA_1, whatever that is) is actually a
> > > link-down interrupt?
> > 
> > While it is true that actual link-down interrupts are ignored, it is not
> > the case that there's an interrupt storm because the same incorrect macro
> > is used to enable the interrupt line. Since the enables an interrupt for
> > DPA_1 which never fires, we don't run into the situation where we are not
> > clearing the interrupt (the interrupt handler will look for the same
> > incorrect field to clear the interrupt if it does fire for DPA_1, but that
> > doesn't happen). The 'linkdown_irq_regfield' corresponds to the
> > "link-state" field not just in the J784S4 SoC, but in all SoCs supported by
> > the pci-j721e.c driver. It is only in J721E that it is BIT(1)
> > [LINK_DOWN macro], while in all other SoCs (J784S4 included), it is BIT(10)
> > [J7200_LINK_DOWN macro since it was first added for J7200 SoC]. Matt
> > probably referred to J721E's Technical Reference Manual and ended up
> > incorrectly assigning "LINK_DOWN", due to which the driver is enabling
> > the DPA_1 interrupt and the interrupt handler is also going to look for
> > the field corresponding to receiving an interrupt for DPA_1.
> 
> So I guess without this patch, we incorrectly ignore link-down
> interrupts on J784S4.  It's good to have a one-sentence motivation
> like that somewhere in the commit log that we can pull out and include
> in the merge commit log and the pull request.

Yes, we can prepend the following to the existing commit message:
"Link down interrupts on J784S4 SoC are missed because..."

resulting in the following updated paragraph in the commit message:
Link down interrupts on J784S4 SoC are missed because commit under Fixes
assigned the value of 'linkdown_irq_regfield' for the....


> 
> > I can only hope that the URL will redirect to the latest version of
> > the User Guide if at all it becomes invalid.
> 
> OK, thanks, I guess there's nothing more to do ;)  I guess that manual
> is not really designed for collaborative development.
> 
> Thanks for the patient hand holding!

:)

Regards,
Siddharth.

