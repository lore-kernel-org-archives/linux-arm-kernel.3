Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B59C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/APbMMoptvgmVOcC3DCamdZKCFsDdmpfRcBVMyr5yc=; b=nDOiS7Juo3NwrYKoWns27HZyZd
	0+Uh1GbF0ckt3pULOcgy4qyNNrYl/cO3iCUl0brHFEBxo21gFRyz8MkZ4PzXhBlH1BmMAZxsTEcet
	MIsZhEBk1PllDyco7JFQ2G+fAy+W0He+FhZQgqptFOOkfw8FiS75N+k+5aD2o/f+0c1oi+Cq7gXVc
	l3JMsbn+LymYI4uEPXo3EH7DR1mpFO/N9GtRf6OUQNLk34+3IPctENIxP4Upbaab3EuqRRxKv2c+r
	xW5chiYLa3YTaRhT0r0YT0sOcvozKTCJrQTqpQx8o7rGvtgGwmxOo21GvKA8+VluUrYXxjNEMuz6H
	vKNIhaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOn-00000007cEp-3PYt;
	Thu, 24 Jul 2025 13:54:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueulG-00000007Obt-45qa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 12:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3B1D4A56316;
	Thu, 24 Jul 2025 12:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAE3C4CEED;
	Thu, 24 Jul 2025 12:09:17 +0000 (UTC)
Date: Thu, 24 Jul 2025 13:09:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	lcherian@marvell.com, bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com, baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
Subject: Re: [RFC PATCH 13/36] arm_mpam: Add probe/remove for mpam msc driver
 and kbuild boiler plate
Message-ID: <aIIiazUK4S_G6loe@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-14-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711183648.30766-14-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_050923_079052_D240FEF2 
X-CRM114-Status: GOOD (  17.62  )
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

On Fri, Jul 11, 2025 at 06:36:25PM +0000, James Morse wrote:
> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
> only be accessible from those CPUs, and they may not be online.
> Touching the hardware early is pointless as MPAM can't be used until
> the system-wide common values for num_partid and num_pmg have been
> discovered.
> 
> Start with driver probe/remove and mapping the MSC.
> 
> CC: Carl Worth <carl@os.amperecomputing.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  arch/arm64/Kconfig                          |   1 +
>  drivers/platform/arm64/Kconfig              |   1 +
>  drivers/platform/arm64/Makefile             |   1 +
>  drivers/platform/arm64/mpam/Kconfig         |  10 +
>  drivers/platform/arm64/mpam/Makefile        |   4 +
>  drivers/platform/arm64/mpam/mpam_devices.c  | 336 ++++++++++++++++++++
>  drivers/platform/arm64/mpam/mpam_internal.h |  62 ++++
>  7 files changed, 415 insertions(+)
>  create mode 100644 drivers/platform/arm64/mpam/Kconfig
>  create mode 100644 drivers/platform/arm64/mpam/Makefile
>  create mode 100644 drivers/platform/arm64/mpam/mpam_devices.c
>  create mode 100644 drivers/platform/arm64/mpam/mpam_internal.h

Bikeshedding: why not drivers/resctrl to match fs/resctrl? We wouldn't
need the previous patch either to move the arm64 platform drivers.

I'm not an expert on resctrl but the MPAM code looks more like a backend
for the resctrl support, so it makes more sense to do as we did for
other drivers like irqchip, iommu. You can create drivers/resctrl/arm64
if you want to keep them grouped.

-- 
Catalin

