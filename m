Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA11CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 19:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FB+Mopw+KqIVgqvvOn7oaKklU78nD3/cxIwgMbOunWQ=; b=FHcR+SoQgB3Y9G28hZjO78IE1+
	+zV1qZieIKuu2tRfEnOFUURptADKKrvumD70C1jx4cW2R2BOXHRCc7oOKkQO2Z3XcdgoEUKEygE3L
	W8U1yvlbZS7hRmTcOh+bqrS8mSqDMu3gf2qbq32o2vlc3/Xp4Se5jFu5VzikbOkjyYewNcIR5ntnk
	91oiQAekOK+UzvrC3uVIPS/tN8VjGfuevflcHo8X1D7oVt7PpTKhRPwY2oD6XevP6A7Jy1L3s0Ufg
	n9iWUo3aCp0e/2m4f9TOcl2n+6k/8Ze+BYSfqGttWfZ9+NafrJ2NwWfpCKVaAQW5ZAZ76zVWBLDRQ
	i/VDdlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5r8s-0000000HZIX-2T6N;
	Fri, 18 Apr 2025 19:12:50 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5r12-0000000HYIn-2UTD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 19:04:45 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IJ4UWC354523
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 14:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745003070;
	bh=FB+Mopw+KqIVgqvvOn7oaKklU78nD3/cxIwgMbOunWQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vWLwv5/PaGhUDQv7GsHSU4MvHYboclMD12ndQi7ynfvL3LgspKFHGgekxZn2BdC33
	 U7YBXgM/HFX+Kxk3I0k90Cu7Wyo8ywn9RmObP2RFYjIgIYMP5sG452I9Snli9BrQSV
	 o8GGHTRr+lNqzYjPfaE/S6uKVI79P4ZerHWx0rWE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IJ4ULQ118070
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 14:04:30 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 14:04:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 14:04:30 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IJ4Tth126391;
	Fri, 18 Apr 2025 14:04:29 -0500
Date: Fri, 18 Apr 2025 14:04:30 -0500
From: Nishanth Menon <nm@ti.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <huaqian.li@siemens.com>, <m.szyprowski@samsung.com>,
        <robin.murphy@arm.com>, <baocheng.su@siemens.com>,
        <bhelgaas@google.com>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <diogo.ivo@siemens.com>,
        <jan.kiszka@siemens.com>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
        <kw@linux.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <lpieralisi@kernel.org>, <robh@kernel.org>, <s-vadapalli@ti.com>,
        <ssantosh@kernel.org>, <vigneshr@ti.com>, <iommu@lists.linux.dev>
Subject: Re: [PATCH v7 0/8] soc: ti: Add and use PVU on K3-AM65 for DMA
 isolation
Message-ID: <20250418190430.onhuowuu4bwtlm5f@sequel>
References: <20250418134324.ewsfnze2btnx2r2w@country>
 <20250418163401.GA159541@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250418163401.GA159541@bhelgaas>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_120444_720519_2050BACE 
X-CRM114-Status: GOOD (  20.99  )
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

On 11:34-20250418, Bjorn Helgaas wrote:
> On Fri, Apr 18, 2025 at 08:43:24AM -0500, Nishanth Menon wrote:
> > On 15:30-20250418, huaqian.li@siemens.com wrote:
> > > 
> > > Jan Kiszka (7):
> > >   dt-bindings: soc: ti: Add AM65 peripheral virtualization unit
> > >   dt-bindings: PCI: ti,am65: Extend for use with PVU
> > >   soc: ti: Add IOMMU-like PVU driver
> > >   PCI: keystone: Add support for PVU-based DMA isolation on AM654
> > >   arm64: dts: ti: k3-am65-main: Add PVU nodes
> > >   arm64: dts: ti: k3-am65-main: Add VMAP registers to PCI root complexes
> > >   arm64: dts: ti: iot2050: Add overlay for DMA isolation for devices
> > >     behind PCI RC
> > > 
> > > Li Hua Qian (1):
> > >   swiotlb: Make IO_TLB_SEGSIZE configurable
> > 
> > I see at least 3 or 4 maintainers needing to co-ordinate, gets
> > complicated as I am not sure which maintainer needs to pick up what
> > patches in what dependency order. This looks like a mixed bag. Can
> > we split this patch into independent series for each maintainer with
> > clear indication of dependencies that is spread around a couple of
> > kernel windows (maybe dts comes in last?)
> 
> The keystone patch ("[4/8] PCI: keystone: Add support for PVU-based
> DMA isolation on AM654") depends on interfaces added by "[3/8] soc:
> ti: Add IOMMU-like PVU driver", so I can't really take 4/8 by itself.
> 
> But I've acked 4/8, so it can be merged along with the rest of the
> series.  I assumed the easiest would be via the drivers/soc/ti/
> maintainer, i.e., you, Nisanth :)
> 
> Let me know if I can do anything.

Thanks Bjorn, the swiotlb probably is one of the first to go in, I
guess.. I will let Li Hua/Jan suggest how they'd like to queue this.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

