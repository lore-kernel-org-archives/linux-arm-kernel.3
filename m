Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFE3C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 10:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GUvy4NsSEhlxO1mGSlkQ8deO2KrloNrrXAd8AHoYE8=; b=vEFWyNXgl1aTXvaGv81OvlXPG2
	QuMRzBR3rkfZmMDq1FfjaiJcEJdcFQdop36yOecHurc5ke0f+50jJEU6sIPoD8rLat4qQ8LCOcVqm
	97p5E47YvtnehEgsclxU/v4TwtW3UdIVPwnSCuRQc9Yi1g1fk3tm2WvWH0jhHaiEhpT10tPaomjQI
	Q1B02uNw+jzRCcLlhpQ//ZdvkjD1CMdA1Pfnb9gcH33ORc+bK94HPDJf/zB6GkuGw882pOHwr0b7H
	nzDLKcpn7sD2IwbM2VijqRiE/Zfqa+DFbHRYD61oKP9GZCSMb7EmUK7AB39eJs7lj7Vw9ak08FAtb
	XY5lo9lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSP3-00000000Qge-1DDA;
	Thu, 13 Aug 2026 10:11:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSP2-00000000QgH-0Ygn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 10:11:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E7AA600AF;
	Thu, 13 Aug 2026 10:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B2B1F000E9;
	Thu, 13 Aug 2026 10:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786615871;
	bh=1GUvy4NsSEhlxO1mGSlkQ8deO2KrloNrrXAd8AHoYE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uh72INHK/sIbkNYsIDOPjGO143EsGaQlP7xQY3AROGkJGS0/0IdBYQHDCvp1O5oM8
	 oaoI+ZDz/JHZS+7HYo6heMzXrWDq3R9JoHYsJ+6PH8z7UlLt+2dRJCIX8KLOxLsE0W
	 RPhMJleW/O0L2O3kGBOy6PqG73URg60mJM5eCvmmpoypJbq06/4eW3EI2a/z9Ibg1G
	 NgEF8AnsHzQ0yR4Ii3p1AGmKDV//SqJRsEYIo5folawdWjVa7go7BlIMYzhtzP3KtN
	 8LOjezI5ivbdQCFV5ug5X9NRpIeTcTNM/Ry1xf1ieV5i3viFeT1+G6zHTi0twu/0TX
	 kdMpVTQo5iiHQ==
Date: Thu, 13 Aug 2026 11:11:03 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 07/45] arm64: mm: Handle Granule Protection Faults
 (GPFs)
Message-ID: <an2YN7kxB7bjCd2s@willie-the-truck>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-8-steven.price@arm.com>
 <ans1ZSwMEKeT9Gfz@arm.com>
 <d4bdecca-517a-4b4b-bf67-cef6b09bc8c1@arm.com>
 <7d4e5920-aa20-40cd-954e-037631bd0d6c@quicinc.com>
 <anx6YbPMVz3OlpA5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anx6YbPMVz3OlpA5@arm.com>
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

On Wed, Aug 12, 2026 at 02:51:29PM +0100, Catalin Marinas wrote:
> On Wed, Aug 12, 2026 at 06:12:09PM +0530, Pavan Kondeti wrote:
> > There is a valid case for fixup_exception() to be needed here in GPF
> > handling.
> > 
> > -000 |load_unaligned_zeropad(inline)
> > -000 |hash_name(inline)
> > -000 |link_path_walk()
> > -001 |path_lookupat()
> > -002 |filename_lookup()
> > -003 |vfs_statx()
> > -004 |vfs_fstatat()
> > 
> > We observed this in Android running Gunyah when the page is mapped in
> > EL1 but unmapped at EL2. path_lookupat() can actually handle this
> > via fixup_exeption() when a word load crosses the page boundary.
> > However, Gunyah injects a Synchronous External Abort and we have
> > a downstream patch [1] that adds fixup_exception() in do_sea(). pKVM
> > injects [2] such faults back to EL1 and fixup_exception() is taken care.
> 
> Ah, good point, completely forgot about load_unaligned_zeropad(). Since
> we don't unmap the linear map for delegated pages, we'll need the
> fixup_exception(). And I guess warning in this case is not desirable
> either. We could limit it to EX_TYPE_KACCESS_ERR_ZERO and
> EX_TYPE_LOAD_UNALIGNED_ZEROPAD, though not sure it's worth it.

Alternatively, I think the series to unmap guest memory from the linear
map would solve that for gmem:

https://lore.kernel.org/all/20260410151746.61150-1-kalyazin@amazon.com/

but I can't tell whether that's still being actively pursued.

Will

