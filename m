Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661F4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3/dT7fVjuGjsbWgOZgOtPP4PWvx3UD0bx0HBuFb9KY=; b=rDnTZve/0pmwFSb7gr2+rAsEWC
	fk3P+IEfO/d4Vmg2yt6bwhxvjc2rGDl+qjDnFxIocgWWvnoAIEFHL/hVAPUldvW3X9hn0XS5CCrVx
	LP7C7U79MHxf7JBeClhNwKYYxsdyMUFaHcgbHahmR8TgTzEl/DdsEB7chUVRU8ACUWoY71V6z/kt/
	MX+turRmMnB0UOZ05v6EQY6qmuhpTS4SQUo1t7rY3fExYn1sQShEfNFnkdvj4i3+VWpnieHEus2ky
	5Ct1gFHUin25aU/V2qexydzkBCmCOvpNdzDW/RtEGcedCGP2NishcRub1dC1IiNHwWKwGOeJCys3T
	KcbQVovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wieS7-00000006sMf-2Eyi;
	Sat, 11 Jul 2026 20:37:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wieS7-00000006sMX-053D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 20:37:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA13B41918;
	Sat, 11 Jul 2026 20:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189341F000E9;
	Sat, 11 Jul 2026 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783802252;
	bh=h3/dT7fVjuGjsbWgOZgOtPP4PWvx3UD0bx0HBuFb9KY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=I61qDaH1wGQpS///KPcrExYUG0Ejv7PBV1iAfYBwBG3HG6tDnlDoHOPgUER76gsPy
	 TLydrkw4vGJCHO849+xeFo5W6uVhcpYgNY16iPlgZFZ9V3P11/AuJ66bBgxIO2FxGr
	 ZOHw0cXZxABA0o2vg+3m5yy1gFcgPEVDbsmIYN59cqPOvKPoLaiGmHM1Dci09goU3x
	 uJoefZoQ8Zhgeuefp7RW63bn+qpxRDirfYwrJejk8sBScbOJBtXqLIkO8caxggrDiO
	 MesSLW7hs3GHf7kbgPL0H1EpkcrgprEBbrcYvGxWH1qrDq1owAJzZb4d4IIS5pgU74
	 ynXXvihXHss9Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinqian Yang <yangjinqian1@huawei.com>, lpieralisi@kernel.org,
 maz@kernel.org, alex@shazbot.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 liuyonglong@huawei.com, wangzhou1@hisilicon.com, linuxarm@huawei.com,
 Jinqian Yang <yangjinqian1@huawei.com>
Subject: Re: [RFC PATCH v2] irqchip/gic-v3-its: enable dynamic MSI-X allocation
In-Reply-To: <20260711022015.3049867-1-yangjinqian1@huawei.com>
References: <20260711022015.3049867-1-yangjinqian1@huawei.com>
Date: Sat, 11 Jul 2026 22:37:30 +0200
Message-ID: <877bn1qn3p.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sat, Jul 11 2026 at 10:20, Jinqian Yang wrote:
> On ARM64 platforms with GICv3 ITS, VFIO PCI passthrough currently
> cannot dynamically allocate MSI-X vectors after MSI-X has been
> enabled. When QEMU needs to extend the vector range, it must
> disable MSI-X, free all interrupts, then re-enable with a larger
> allocation. This creates an interrupt loss window for already-active
> vectors.
>
> Consider HNS3 with RoCE: NIC and RDMA share one PCI device and
> ITS DeviceID, with MSI-X vectors partitioned as NIC (lower range)
> then RoCE (starting at base_vector = num_nic_msi). In VFIO
> passthrough, loading hns_roce after hns3 forces QEMU to tear down
> all interrupts before re-allocating the larger range. During this
> process, NIC interrupts may be lost. Testing confirmed that this
> occasionally occurs, causing the network port reset to fail. This
> appears to be unavoidable, as it's a standard approach adopted by
> all network card vendors.
>
> On Hisilicon HIP09 (ARM64, GICv3/GICv4.1) with latest upstream kernel
> and QEMU 8.2. VFIO passthrough of HNS3 NIC to VM: load both hns3 and
> hns_roce_hw_v2 drivers and trigger FLR, this bug will occur occasionally.
> After enabling dynamic MSIX allocation, this bug no longer occurs.
>
> Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
> ---
> Changes in v2:
>   - Updated the commit message to add test information.

Well, it contains test information, but it does not tell me _WHY_ this
is safe to do, i.e. what makes gic-v3-its eligible to set this flag? 

