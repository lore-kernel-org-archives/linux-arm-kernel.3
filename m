Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A71AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLNUCs+iqlLL4bZ21KkgmzgBuUe/jioJ4+dIAbAP7mg=; b=lRHYD/kXe8p9PEwx404sqSWTWA
	5BupMk4CtflhpZYyIct5M+h53oU2MYrf7zQBH5feRYVoWESrEnM32IqH1rTgFrbxIl0MNXYxVIhJt
	TBp/X0UWsF0oKRVzXAY1UXFLX+eAKSJQn4rfWNaHOHVjM5iIj8xhNYalg+GO7QU/Vuu3ajXlhcoq2
	JncydskwG1x5wY/NHhi3rkEGGjYFoZ/5kcu/ab243rzEjg+5pFSpn94QIJ+OEYPBfe7rS+wbVrUVI
	p1B5kp0xa83cMve+yydBxg0G5Sa4V0C37o9dqT/BewCsvkVULpSw/ahwXOGoJk+rpi1wVqxI+xK1S
	XXUBHLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYZq-00000001vtu-06u1;
	Mon, 10 Mar 2025 08:33:34 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYVf-00000001usw-3PrU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 08:29:17 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1364A45229;
	Mon, 10 Mar 2025 09:29:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1741595354;
	bh=frX4G4i69BdoHfaR05B7WfBtiGFjU59BqKAKCBlX6vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLvQJdim6IyNh9OflrLb5oh+e8PpvuLCM7gou4Gbs0/mv/l0Y/CTYc5KJYczw60zh
	 tyB81d0pFn7H4QWWzddDp47l9aIy2fBqzokWlz0g3XJfyBzaHLj7Cw/XF+dOnvcUgx
	 ltV0QEF5YEldt6xlVgABrLyQ8mNC66Vlbe9G+8u9THehDW1Rde0MdBuqOWbjX1VyNw
	 rqWATAisQ6IvQiG29+Xa3szaWqDZjlEB62Nqd/BeNV2EBXhGcEyXVkAdSJvBAaYkOy
	 u8HEDFkVKAkbbvlEbGh0YDF5gu1Oor0qHpQjrXpS2vPEDIswU1Ee60j+y7dGCO00PP
	 lG20mHqj4VUaA==
Date: Mon, 10 Mar 2025 09:29:12 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH v2 0/4] iommu: Fix the longstanding probe issues
Message-ID: <Z86i2BHhmAINErv_@8bytes.org>
References: <cover.1740753261.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1740753261.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_012916_100853_F3A7D810 
X-CRM114-Status: GOOD (  15.87  )
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

On Fri, Feb 28, 2025 at 03:46:29PM +0000, Robin Murphy wrote:
> This spin irons out a couple of issues which v1 had. Firstly there
> should now be no change in behaviour for the weird of_dma_configure()
> calls, other than possibly getting the warning if they deserve it.
> Secondly I think there was still a possibility for probe to run via
> the replay path while its "real" probe was waiting to reacquire the
> lock; this is now solved by making dev->iommu a reliable indicator of
> the probe lifecycle, with a couple more prep patches.
> 
> Thanks,
> Robin.
> 
> 
> Robin Murphy (4):
>   iommu: Handle race with default domain setup
>   iommu: Resolve ops in iommu_init_device()
>   iommu: Keep dev->iommu state consistent
>   iommu: Get DT/ACPI parsing into the proper probe path
> 
>  drivers/acpi/arm64/dma.c        |  5 +++
>  drivers/acpi/scan.c             |  7 -----
>  drivers/amba/bus.c              |  3 +-
>  drivers/base/platform.c         |  3 +-
>  drivers/bus/fsl-mc/fsl-mc-bus.c |  3 +-
>  drivers/cdx/cdx.c               |  3 +-
>  drivers/iommu/iommu-priv.h      |  2 ++
>  drivers/iommu/iommu.c           | 55 ++++++++++++++++++++++++---------
>  drivers/iommu/of_iommu.c        | 13 ++++++--
>  drivers/of/device.c             |  7 ++++-
>  drivers/pci/pci-driver.c        |  3 +-
>  11 files changed, 74 insertions(+), 30 deletions(-)

Applied, thanks Robin.

