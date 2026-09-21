Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1C0C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YQCVKEwuPz81MJW5xayuzPdi8C8P1Vrd1vg8KUxeJg=; b=ccqd9Fxd6QpDwZdNDyfOChqdbX
	Dh+B7YV63rjyOauW6RCGMmdHlK1oYXoNv31mLWAGgAbKSFI+7anx0j/hUJD85qOA/+0RvNIeVcvW1
	Ccz9TQbvujhuRNxyxFoqV/YNN9fltlLMWItuy9CxYvlNK/IcSPdU++VWroO7XG0JHNk2uL0fSbFM8
	4YKRaa3/gkxkZCHl3kT69XqSLBTjl4GTbIWIWyNJXPznC+qWtC3POE6plUMwDZRvm7YTmLOjlUhJf
	9CbSJZtc1bSy8DB1X1K2Q6dDsaX5SkxYwKe2VMcklJEfGW2hCDw5lZE51Cutx2yE/FSGOKHfKOvDN
	EFQiYYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zj7-00000001OmK-2N38;
	Mon, 21 Sep 2026 08:50:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zj4-00000001Olb-2nx4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:50:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 073EE175A;
	Mon, 21 Sep 2026 01:50:08 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96CC53F86C;
	Mon, 21 Sep 2026 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789980611; bh=zkJ6zamsKffplX1HXtrc8mnFcQsdKLrkWao+Syhic58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jvJSfPqLf3HN3z+KPhvue54b/EtRQfqDF2kHtGW67M77rt+wnCXhmkm/1WsNMtE07
	 o5+IdFoiz9kgEfxWcB6RLBl1iMrurkg7cBAfH033tNTteqbaTzvwE3HtiifRkMpNqv
	 mmQPzdSKn8FH5n6VbL2u7b7fWhFSRikwpoVVdsXs=
Date: Mon, 21 Sep 2026 09:50:06 +0100
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
	Andre Przywara <andre.przywara@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
Message-ID: <arDvvvqkm0O4OSlP@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-4-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921053807.354802-4-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_015014_787485_41AD8FE4 
X-CRM114-Status: GOOD (  18.15  )
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

On Mon, Sep 21, 2026 at 11:08:03AM +0530, Aneesh Kumar K.V (Arm) wrote:
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
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  MAINTAINERS                                   |  2 +
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
>  18 files changed, 110 insertions(+), 89 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/rsi.h
>  create mode 100644 drivers/firmware/arm_rmm/Kconfig
>  create mode 100644 drivers/firmware/arm_rmm/Makefile
>  rename {arch/arm64/kernel => drivers/firmware/arm_rmm}/rsi.c (99%)
>  rename arch/arm64/include/asm/rsi_cmds.h => include/linux/arm-rsi-cmds.h (69%)
>  rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (98%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42364c540f50..b867d537a579 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3953,6 +3953,8 @@ F:	Documentation/arch/arm64/
>  F:	arch/arm64/
>  F:	drivers/virt/coco/arm-cca-guest/
>  F:	drivers/virt/coco/pkvm-guest/
> +F:	include/linux/arm-rsi-cmds.h
> +F:	include/linux/arm-smccc-rsi.h
>  F:	tools/testing/selftests/arm64/
>  X:	arch/arm64/boot/dts/
>  X:	arch/arm64/configs/defconfig

Does it need drivers/firmware/arm_rmm/ as well?

-- 
Catalin

