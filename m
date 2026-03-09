Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD8DEFCD7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWeaPrifSSMRUWB4Mh2PSSqaQqzRJCxB4I6fl1F/hUw=; b=FG2JaJ54pZJXaglIsS+wlP2xNW
	L0mxTeGt7Od6XijTys2H+ucR2HmgSYGDYxOn9SHORHCvZiy8CUj7yv+sZDXTf1drDqXJlGXESRUs1
	3RpfGhJkYPagU1kH8t3L+HTE2ntgHgIJwM79LCRbodzvaJKI964CWlXZ/3Wuld8ibSI5ckg4R1Zcc
	bJw60kxwJpr0DQh+i8Nc5GZTsS7jJZzMW02ZT39wykhwJGYcniftfrh8ucJHpdaJ8MzkE1fCfSbPW
	EOU2+UoQgno5lmJd2eiRk9j6mYiXDASeM5EAJV1qlapPRHImHy0tJvjJNn+UzKNMMQUXe0zCbPfVU
	wSBEdIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXco-0000000742u-1VoK;
	Mon, 09 Mar 2026 10:14:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXcm-0000000741y-0GVB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C28F34430C;
	Mon,  9 Mar 2026 10:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA43C4CEF7;
	Mon,  9 Mar 2026 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773051246;
	bh=bGcLCHMf0kG6KAQcgQti9IyFFTGBwB7azJrRnMTCKvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9lnxTrpUTwB5jhlwwD4lOPmM9JnvcwkqQ3NUA3ntcvizK1dwmii6J7FnL7OpomNe
	 r5OukbjD9/s6lTdIDq/lme3SKYdbNuukjYpxIG2IFhD8yDzurfxOBkXpadJ/EI7vMH
	 BO9p0uNa6TOAhZLS2aAkVuxuWJpKxBvmDMkGXP2o=
Date: Mon, 9 Mar 2026 11:14:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v3 1/2] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <2026030923-relieving-dollhouse-28f8@gregkh>
References: <20260309100507.2303361-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309100507.2303361-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_031408_148287_09F586F1 
X-CRM114-Status: GOOD (  24.33  )
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

On Mon, Mar 09, 2026 at 03:35:06PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Make the SMCCC driver responsible for registering the arm-smccc platform
> device and after confirming the relevant SMCCC function IDs, create
> the arm_cca_guest auxiliary device.
> 
> Also update the arm-cca-guest driver to use the auxiliary device
> interface instead of the platform device (arm-cca-dev). The removal of
> the platform device registration will follow in a subsequent patch,
> allowing this change to be applied without immediately breaking existing
> userspace dependencies [1].
> 
> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Jeremy Linton <jeremy.linton@arm.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm64/include/asm/rsi.h                  |  2 +-
>  arch/arm64/kernel/rsi.c                       |  2 +-
>  drivers/firmware/smccc/Kconfig                |  1 +
>  drivers/firmware/smccc/Makefile               |  1 +
>  drivers/firmware/smccc/rmm.c                  | 25 ++++++++
>  drivers/firmware/smccc/rmm.h                  | 17 ++++++
>  drivers/firmware/smccc/smccc.c                | 14 +++++
>  drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
>  drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
>  .../{arm-cca-guest.c => arm-cca.c}            | 59 +++++++++----------
>  10 files changed, 92 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/firmware/smccc/rmm.c
>  create mode 100644 drivers/firmware/smccc/rmm.h
>  rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (84%)
> 
> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> index 88b50d660e85..2d2d363aaaee 100644
> --- a/arch/arm64/include/asm/rsi.h
> +++ b/arch/arm64/include/asm/rsi.h
> @@ -10,7 +10,7 @@
>  #include <linux/jump_label.h>
>  #include <asm/rsi_cmds.h>
>  
> -#define RSI_PDEV_NAME "arm-cca-dev"
> +#define RSI_DEV_NAME "arm-rsi-dev"
>  
>  DECLARE_STATIC_KEY_FALSE(rsi_present);
>  
> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index c64a06f58c0b..5d711942e543 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -160,7 +160,7 @@ void __init arm64_rsi_init(void)
>  }
>  
>  static struct platform_device rsi_dev = {
> -	.name = RSI_PDEV_NAME,
> +	.name = "arm-cca-dev",
>  	.id = PLATFORM_DEVID_NONE
>  };
>  
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 15e7466179a6..2b6984757241 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -8,6 +8,7 @@ config HAVE_ARM_SMCCC
>  config HAVE_ARM_SMCCC_DISCOVERY
>  	bool
>  	depends on ARM_PSCI_FW
> +	select AUXILIARY_BUS
>  	default y
>  	help
>  	 SMCCC v1.0 lacked discoverability and hence PSCI v1.0 was updated
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
> index 40d19144a860..146dc3c03c20 100644
> --- a/drivers/firmware/smccc/Makefile
> +++ b/drivers/firmware/smccc/Makefile
> @@ -2,3 +2,4 @@
>  #
>  obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
>  obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
> +obj-$(CONFIG_ARM64) += rmm.o
> diff --git a/drivers/firmware/smccc/rmm.c b/drivers/firmware/smccc/rmm.c
> new file mode 100644
> index 000000000000..03496330630f
> --- /dev/null
> +++ b/drivers/firmware/smccc/rmm.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Arm Limited
> + */
> +
> +#define pr_fmt(fmt) "smccc: " fmt

No need for this define as you never use it in this file.

thanks,

greg k-h

