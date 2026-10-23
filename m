Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0BE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RKQ3RSME;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gkbyTeQN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+9ABaSJ2TNSe2zyjJ/G3TozbAp2nZSVkr4JqPJVrOhM=; b=RKQ3RSMEM/30B7
	UP89PsiZ9kkPdLR3BQsiZTYbKJ54MLADznBQ2LXE48AwVKDv+x8djXjPi6dmgVPYOHP9jiMcmkHRy
	TjuAbEviI+bPTanhpqQRYU4QsCy5t2Pi+8lHdc28igPoixoKL1E+3w4kdFkaOT0+5UE1bpoDv2X5D
	dEfK+VLEWmQEs7b7PaqL2vDZ22AHnRE9oUpWdZjN3v0dULwiCiUU0hALl1w5wvCwtHCNpiZfURKGo
	D9PGgIkZlYvZgoHe4YecCSUzDWJjF139d8ZocRpG9eDiaSyG79VrZqIT3XpVjceLLLqp5MMGqmEtS
	U/SHTGeaFd58bOGOljSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKE6y-0000000GHDM-3P0k;
	Fri, 23 Oct 2026 12:11:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKE6v-0000000GHCw-2z8Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 12:11:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E425B1692;
	Fri, 23 Oct 2026 05:10:56 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E1713F7B4;
	Fri, 23 Oct 2026 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792757460; bh=JWiVKkvqMbPQUX28W4bEe8+RRzv3aXiMK1aPbISQRoo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gkbyTeQN2CCbuK7ji0WSOlNL2NUd3bU79bZU3Du8DyjyL4x3DTnF0oottBvtMuLpS
	 yfp3kipdCxmmP1RXAilIcKX0BcYzkexbMxwckHAwvl9nvh+Jp+G5hXXEs/rGhPedmc
	 vZ1DdIPPqqxCcbiqCL+tLjrfCVGG6boDgtTI/wEA=
Message-ID: <40a2e1a2-138b-42bf-94ea-a42fda128c22@arm.com>
Date: Fri, 23 Oct 2026 13:10:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add support for hitless
 replace of CD entries
To: Samiullah Khawaja <skhawaja@google.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260925011308.3381953-1-skhawaja@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_051101_854159_A6F4B996 
X-CRM114-Status: GOOD (  30.85  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/09/2026 2:13 am, Samiullah Khawaja wrote:
> This patch series adds support for replacing IOMMU domains with S1 page
> tables hitlessly, that is without disrupting the ongoing DMAs. This is
> one of the dependencies of the Liveupdate IOMMU support for Arm SMMUv3.
> 
> S1 domains are programmed by CD entries in the CD table. During a new
> domain attach these are updated using arm_smmu_write_cd_entry(). Since
> ASID and TTB0 are in different 64-bit words, arm_smmu_write_cd_entry()
> considers it a non-hitless update and sets V=0. This means such an
> update is disruptive and would generate translation faults if there are
> ongoing DMAs.
> 
> Replace the CD entries by using an unused temporary ASID in the
> following sequence to allow hitless replacement of CD entry,
> 
> - Update the CD entry with temporary ASID.
> - Update the CD entry with the target TTB0.
> - Invalidate the temporary ASID.
> - Update the CD entry with target ASID.
> - Invalidate and release the temporary ASID.

Why bother transitioning through a 3rd ASID? The old and new pagetables 
must contain the same translations anyway, so why not just: switch ASID, 
switch TTB, invalidate old ASID?

It's perhaps worth noting that for correctness either way this also very 
much depends on no concurrent map/unmap operations being able to happen 
in either hwpt while the switch is ongoing, but then I guess it already 
depends on the caller guaranteeing that the hwpts hold identical 
translations, which we can't realistically verify at the driver level 
either...

Thanks,
Robin.

> The series adds a vfio selftest that triggers a continuous DMA and does
> the hwpt replace while the DMA is ongoing. Since domain replacement is a
> race with the translation requests, the test does it multiple times to
> capture the small window where IOMMU faults can occur.
> 
> Without this change we can observe the SMMU faults in the kernel logs
> and with it the SMMU faults do not occur.
> 
> This is only tested on qemu with the emulated SMMUv3 and an out of tree
> NVMe vfio selftest driver, not on real hardware. Following are not
> covered and can be done later,
> 
> - S2 domains have the same problem, S2VMID is in STE qword 2 and S2TTB is
>    in qword 3. These need the same handling with a temporary VMID.
> - ATS is not tested, the test environment runs with pci=noats.
> 
> Testing:
> 
> Without Fix:
> 
>    TAP version 13
>    1..2
>    # Starting 2 tests from 2 test cases.
>    #  RUN           vfio_iommufd_replace_hwpt_test.domain_replace.memcpy ...
>    [   33.267749] vfio-pci 0000:00:0a.0: enabling device (0000 -> 0002)
>    [   33.270709] vfio-pci 0000:00:0a.0: resetting
>    [   33.385682] vfio-pci 0000:00:0a.0: reset done
>    [   37.128021] arm-smmu-v3 9050000.smmuv3: event 0x0a received:
>    [   37.131885] arm-smmu-v3 9050000.smmuv3:      0x000000500000000a
>    [   37.134585] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>    [   37.136961] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>    [   37.139631] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>    [   37.142188] arm-smmu-v3 9050000.smmuv3: event: C_BAD_CD client: 0000:00:0a.0 sid: 0x50 ssid: 0x0
> 
>    ...
>    ...
> 
> With Fix:
> 
>    TAP version 13
>    1..2
>    # Starting 2 tests from 2 test cases.
>    #  RUN           vfio_iommufd_replace_hwpt_test.domain_replace.memcpy ...
>    [   33.418253] vfio-pci 0000:00:0a.0: enabling device (0000 -> 0002)
>    [   33.421218] vfio-pci 0000:00:0a.0: resetting
>    [   33.539750] vfio-pci 0000:00:0a.0: reset done
>    #            OK  vfio_iommufd_replace_hwpt_test.domain_replace.memcpy
>    ok 1 vfio_iommufd_replace_hwpt_test.domain_replace.memcpy
>    #  RUN           vfio_iommufd_replace_hwpt_test.noreplace.memcpy ...
>    [   88.416453] vfio-pci 0000:00:0a.0: resetting
>    [   88.531989] vfio-pci 0000:00:0a.0: reset done
>    #            OK  vfio_iommufd_replace_hwpt_test.noreplace.memcpy
>    ok 2 vfio_iommufd_replace_hwpt_test.noreplace.memcpy
> 
> Looking forward to your feedback on this.
> 
> Dependencies:
> The patch series includes a patch from the vfio selftest multi iommu
> series as it is required for the hwpt_replace vfio selftest. It is part
> of this series since the original code doesn't apply cleanly on the
> base.
> https://lore.kernel.org/all/20260505221518.619123-1-skhawaja@google.com/
> 
> Related Work:
> Liveupdate IOMMU patch series:
> https://lore.kernel.org/all/20260921004834.2601285-1-skhawaja@google.com/
> Liveupdate IOMMU feature patchset breakdown:
> https://docs.google.com/document/d/1enDn-uPE9U77U-xHEnzn6HHGKiePSAtMIP8EDU3NO0M
> 
> Samiullah Khawaja (3):
>    vfio: selftests: Add support of creating iommus from iommufd
>    vfio: selftests: Add iommufd hwpt replace test
>    iommu/arm-smmu-v3: Add support for hitless replace of S1 domains
> 
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  66 ++++++-
>   tools/testing/selftests/vfio/Makefile         |   1 +
>   .../vfio/lib/include/libvfio/iommu.h          |   2 +
>   .../lib/include/libvfio/vfio_pci_device.h     |   2 +
>   tools/testing/selftests/vfio/lib/iommu.c      |  60 +++++-
>   .../selftests/vfio/lib/vfio_pci_device.c      |  25 ++-
>   .../vfio/vfio_iommufd_hwpt_replace_test.c     | 171 ++++++++++++++++++
>   7 files changed, 316 insertions(+), 11 deletions(-)
>   create mode 100644 tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
> 
> 
> base-commit: 3d7783543c2646af69ad65825e810060494bea21


