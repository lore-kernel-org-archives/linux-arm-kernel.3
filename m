Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FD3C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ex10H+Aq+55ua3cjhNSCwj24phuUI6qfwt/pJsTthvA=; b=X3ympbyc+kjJFVRRZLPg05lKPB
	eUiO7ZrpwSwVkxCDIDWwV/cFB6ri+Goau4k5TcGJ7+g8CDHwAalRewW+SK0W753yfSS8kn2FkO8Bo
	XXVgpR2ftEsGMp99SCTei2wJ0SG/jS/8Vrbj5DvRSHX1wywI/5vnS0TW2uITzFTOJiQdkZC64CvDa
	sfqjBTkNms+Xg0/yaZXCB86p4WIVJdByUF7bJCkc10MW5AfKxcQNWMH3fQaneFTanw1uJFIxv/Z0Q
	O9sLdb67K6hun0eLz+otfjvkuwcAOMgAfc1DsKR6rX4Lz7dYV6695Oq+XicE14ScxF2fNZUBWl09S
	/a0ZYvZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nLT-000000091a5-36Ka;
	Wed, 16 Sep 2026 10:58:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nLR-000000091ZV-1FqG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:58:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3801152B;
	Wed, 16 Sep 2026 03:58:24 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D3B63F882;
	Wed, 16 Sep 2026 03:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789556308; bh=rs65dkxVRVvkoJPhv7tZmzzSj/ofGnKQrGCYnHAnM9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fis+1+JJyMW4AMTvO/ToOq+lYsaWLmQ6s07E78Lbew1eEs868a1RI0rp9PW45HSEj
	 BnTHhgCmo4BVpRE/BENBQFB3beJfqPIXiY46jiETGH5+lG9k8jNp0wOH3NQg5elPBf
	 esx1MgZ/2IntmRX9eJAMldpoCcTrL0+iWv7t8nyc=
Date: Wed, 16 Sep 2026 11:58:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
Message-ID: <aqp2TzS5FAE9ixc8@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-4-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-4-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_035829_419294_05BF07E8 
X-CRM114-Status: GOOD (  15.98  )
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

On Mon, Sep 14, 2026 at 11:35:07AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
> architecture specific definitions. Follow-up changes need to use them from
> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
> driver.
> 
> Move the complete Realm Service Interface (RSI) implementation from
> arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
> command helpers are also moved to include/linux so they can be shared by
> architecture code and firmware or driver code. This also keeps the
> firmware interface outside architecture code, as requested [1].
> 
> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm64/Kconfig                            |  1 +
>  arch/arm64/include/asm/io.h                   |  2 +-
>  arch/arm64/include/asm/mem_encrypt.h          |  2 +-
>  arch/arm64/include/asm/pgtable-prot.h         |  2 +-
>  arch/arm64/include/asm/rsi.h                  | 70 -----------------
>  arch/arm64/kernel/Makefile                    |  2 +-
>  arch/arm64/kernel/setup.c                     |  2 +-
>  arch/arm64/mm/init.c                          |  3 +-
>  drivers/firmware/Kconfig                      |  1 +
>  drivers/firmware/Makefile                     |  1 +
>  drivers/firmware/arm_rmm/Kconfig              | 17 ++++
>  drivers/firmware/arm_rmm/Makefile             |  2 +
>  .../kernel => drivers/firmware/arm_rmm}/rsi.c |  2 +-
>  drivers/virt/coco/arm-cca-guest/Kconfig       |  2 +-
>  .../virt/coco/arm-cca-guest/arm-cca-guest.c   |  5 +-
>  .../linux/arm-rsi-cmds.h                      | 77 +++++++++++++++++--
>  .../linux/arm-smccc-rsi.h                     |  6 +-
>  17 files changed, 108 insertions(+), 89 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/rsi.h
>  create mode 100644 drivers/firmware/arm_rmm/Kconfig
>  create mode 100644 drivers/firmware/arm_rmm/Makefile
>  rename {arch/arm64/kernel => drivers/firmware/arm_rmm}/rsi.c (99%)
>  rename arch/arm64/include/asm/rsi_cmds.h => include/linux/arm-rsi-cmds.h (69%)
>  rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (98%)

BTW, can you also add the new files under the ARM64 PORT in MAINTAINERS,
similar to arm-cca-guest?

Thanks.

-- 
Catalin

