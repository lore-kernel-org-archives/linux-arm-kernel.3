Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EF1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 05:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJezcyfF+yORt8Uw98gj4iwE+jSOmsLoiF2fnCYB870=; b=uAoHy34FYLFkNZDCgzcB/WI2hC
	hGUpCvgAYnk1qBFqKrwzPG5Y446LtGzmcDgHNEVnzEhLp3Ea4um0N0OGKyg/IQuCNSUW0bSA7Jaye
	L3qLTTjPTSgHsJRiPGfsbs1mdWE3Svdo/47hs7D4OHkBy8NHEMi85+T3Bd0ITTOsPicLAv7z3DAzk
	dOZ0lQ6kgWw6ivl4xMh2rM7ff7pgl8NK/5vNygxs4iVFbT/rfzd08koIbd8/NpwYKgXdekX3UdfBv
	5+xa21YYUw3tt8VsjyCQpEPJmTvblJRnXIFIZsZlM79rMfti/5RbJCwzsL15cKtM9D7y+HHeGV9r/
	+67GpKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsbZD-0000000AB2V-36je;
	Thu, 13 Mar 2025 05:57:15 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsbXY-0000000AAtV-1Vcd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 05:55:33 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52D5tLKc1737463
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 00:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741845321;
	bh=XJezcyfF+yORt8Uw98gj4iwE+jSOmsLoiF2fnCYB870=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zGmHtGiYaruD/5pWpaw3Km0ciUIhgr2MyPPLZyMnga2DreISPKbwWt5W+1+CUH44N
	 1wDnb6Q9N5BwlRdwN+asaguym9HKZPgajwDhL9nPpaqDZvDdgLJUGKIZL9ZZ9sE01u
	 h1WZOIbJy5u/ZVVEsSbJppqWKnNYybMNNtqW3q18=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52D5tLrL018383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 00:55:21 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 00:55:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 00:55:20 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52D5tJmY065334;
	Thu, 13 Mar 2025 00:55:20 -0500
Date: Thu, 13 Mar 2025 11:25:19 +0530
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
Message-ID: <20250313055519.j3bpvsm6govd5ytk@uda0492258>
References: <20250305132018.2260771-1-s-vadapalli@ti.com>
 <20250312161600.GA680640@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250312161600.GA680640@bhelgaas>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_225532_646375_A5028882 
X-CRM114-Status: GOOD (  29.72  )
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

On Wed, Mar 12, 2025 at 11:16:00AM -0500, Bjorn Helgaas wrote:

Hello Bjorn,

> [+to Matt, author of e49ad667815d]

I dropped Matt's email on purpose since it will bounce as the email is
no longer valid.

> 
> On Wed, Mar 05, 2025 at 06:50:18PM +0530, Siddharth Vadapalli wrote:
> > Commit under Fixes assigned the value of 'linkdown_irq_regfield' for the
> > J784S4 SoC as 'LINK_DOWN' which corresponds to BIT(1). However, according
> > to the Technical Reference Manual and Register Documentation for the J784S4
> > SoC [0], BIT(1) corresponds to "ENABLE_SYS_EN_PCIE_DPA_1" which is __NOT__
> > the field for the link-state interrupt. Instead, it is BIT(10) of the
> > "PCIE_INTD_ENABLE_REG_SYS_2" register that corresponds to the link-state
> > field named as "ENABLE_SYS_EN_PCIE_LINK_STATE".
> 
> I guess the reason we want this is that on J784S4, we ignore actual
> link-down interrupts (and we don't write STATUS_CLR_REG_SYS_2 to clear
> the interrupt indication, so maybe there's an interrupt storm), and we
> think some other interrupt (DPA_1, whatever that is) is actually a
> link-down interrupt?

While it is true that actual link-down interrupts are ignored, it is not
the case that there's an interrupt storm because the same incorrect macro
is used to enable the interrupt line. Since the enables an interrupt for
DPA_1 which never fires, we don't run into the situation where we are not
clearing the interrupt (the interrupt handler will look for the same
incorrect field to clear the interrupt if it does fire for DPA_1, but that
doesn't happen). The 'linkdown_irq_regfield' corresponds to the
"link-state" field not just in the J784S4 SoC, but in all SoCs supported by
the pci-j721e.c driver. It is only in J721E that it is BIT(1)
[LINK_DOWN macro], while in all other SoCs (J784S4 included), it is BIT(10)
[J7200_LINK_DOWN macro since it was first added for J7200 SoC]. Matt
probably referred to J721E's Technical Reference Manual and ended up
incorrectly assigning "LINK_DOWN", due to which the driver is enabling
the DPA_1 interrupt and the interrupt handler is also going to look for
the field corresponding to receiving an interrupt for DPA_1.

> 
> > Hence, set 'linkdown_irq_regfield' to the macro 'J7200_LINK_DOWN' which
> > expands to BIT(10) and was first defined for the J7200 SoC. Other SoCs
> > already reuse this macro since it accurately represents the link-state
> > field in their respective "PCIE_INTD_ENABLE_REG_SYS_2" register.
> > 
> > [0]: https://www.ti.com/lit/zip/spruj52
> 
> Thanks for the spec URL.  Can you include a relevant section number?
> I searched for some of this stuff but couldn't find it.

The URL above is taken from the "User Guide" section of the following
webpage:
https://www.ti.com/product/TDA4VH-Q1
corresponding to the J784S4 SoC (TDA4VH is another name for it).

The User Guide [0] is a zip file containing the Technical Reference
Manual (without Registers) along with an Excel Sheet containing the
Registers. There unfortunately is no particular section that I can
quote in the Excel Sheet. The PCIe registers described in the Excel
Sheet contain the "PCIE_INTD_ENABLE_REG_SYS_2" register in one of the
rows (I didn't want to mention the row number since things could change
over time, similar to how you pointed out below that the URL could
potentially change). However, the register name should remain the same,
the reason being that the name is consistent across all SoCs supported
by the pci-j721e.c.

> 
> Since I have low confidence that the URL will be valid after a few
> years, I wish the spec also had a human-readable name and revision
> number.  But maybe the alphabet soup or "SPRUJ52D", "revised July
> 2024" is all we can hope for.

I can only hope that the URL will redirect to the latest version of the
User Guide if at all it becomes invalid.

Regards,
Siddharth.

