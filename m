Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5A4C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRxMGoDpTwq9LCPo6am3xiYDTxZ0V1j1TOEM418TNfw=; b=xkonGtLNuU4FipJ+aahfGGybjD
	InQKHurNCH5NRSlJBhPrPbvGqWo+9D4v/nUtdZWMOPH0/qL4wG7CqCYe2IZKBI9fEK44ISQQvYirW
	97U/6JG88kMpMYobTGxvV+QS6P8vQvr78Go/MxL8NR8iyDeukZEqmDEVKl87PxrmoyTeQJGv4WwOd
	hWKF0cXy1PVKqfrmth2P9L0OpYCyzQ0MFRDPWGxOAPnZHMek+Rd5uT7C0QWVhTRj8240tPdA60UlV
	iBl5GETlpdCaFe/h6NW2gvsj/zdq2bFPbs57WI1BM7MehPEwD6nzWw2uEbAGJXiToFDJUJARY0yds
	r9hlRpbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63uc-000000038Yo-1gXc;
	Mon, 14 Sep 2026 10:27:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63ub-000000038Yh-22zb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:27:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE2C7406F0;
	Mon, 14 Sep 2026 10:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4861F000FF;
	Mon, 14 Sep 2026 10:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789381664;
	bh=vRxMGoDpTwq9LCPo6am3xiYDTxZ0V1j1TOEM418TNfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=el9UUB8KFLWk3BECCbN0rFvBxBfsOeTb5BeP2XIlAeiak8DQr36rxCsaC4rbxXPkL
	 fVajd+aLMaY5iaPvzQqStycmoxpTVpbWfmUdaLVJTpUVJLbdwIgX481arVagH40jKJ
	 FrHNgadgpYwF0A/TztVd7Uy1hn8ijVct+uAIK0+Eqb08E5cYfwYHfJHePzb3KkOQH2
	 GoAdL6LC9GXQ9aA/cVXMa4GlqexfE2yeuGCiwdmg7B3L3J6lPJvcGm+T2WoUGFKf7D
	 MjPuED9OWrLiw2aQxmDstQPanUak4z49eXwc5AZqRhOViYHknTzuqSverlgsWlk2ZE
	 OGt4Sr0kcG7+Q==
Date: Mon, 14 Sep 2026 11:27:39 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
	yuzenghui@huawei.com, linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 2/7] firmware: arm_rmm: Check for RMI support at init
Message-ID: <20260914-nano-narwhal-of-blizzard-dbc6a0@sudeepholla>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-3-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912083611.2513845-3-suzuki.poulose@arm.com>
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

On Sat, Sep 12, 2026 at 09:36:05AM +0100, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Query the RMI version number and check if it is a compatible version.
> The first two feature registers are read and exposed for future code to
> use.
> 
> We only support this for Little Endian kernels, the Big Endian kernel
> support is anyway marked BROKEN and is being removed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> v18:
>  * Always use arm_smccc_1_2_invoke() for all RMIs making sure the unsused
>    parameters are 0 - Sashiko
>  * Move rmi_features() calls away from the arm-rmi-cmds.h to rmi.c - Gavin
> v17:
>  * Rename ARM_RMM to ARM_RMM_RMI to make it easier to add Guest facing RSI
>    support, which is also in progress
> v16:
>  * Update Kconfig text to include PCIe TDISP.
>  * Export rmi_feat_reg() here rather than in a later commit.
> v15:
>  * The code is moved again, this time into the 'firmware' directory.
> v14:
>  * This moves the basic RMI setup into the 'kernel' directory. This is
>    because RMI will be used for some features outside of KVM so should
>    be available even if KVM isn't compiled in.
> ---
>  arch/arm64/Kconfig                |   1 +
>  arch/arm64/kernel/cpufeature.c    |   1 +
>  drivers/firmware/Kconfig          |   1 +
>  drivers/firmware/Makefile         |   1 +
>  drivers/firmware/arm_rmm/Kconfig  |  26 +++++++
>  drivers/firmware/arm_rmm/Makefile |   2 +
>  drivers/firmware/arm_rmm/rmi.c    | 122 ++++++++++++++++++++++++++++++
>  include/linux/arm-rmi-cmds.h      |  36 +++++++++
>  8 files changed, 190 insertions(+)
>  create mode 100644 drivers/firmware/arm_rmm/Kconfig
>  create mode 100644 drivers/firmware/arm_rmm/Makefile
>  create mode 100644 drivers/firmware/arm_rmm/rmi.c
>  create mode 100644 include/linux/arm-rmi-cmds.h
> 

[...]

> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> new file mode 100644
> index 0000000000000..9792bf0e00cb9
> --- /dev/null
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +
> +#ifndef __LINUX_ARM_RMI_CMDS_H_
> +#define __LINUX_ARM_RMI_CMDS_H_
> +
> +#include <linux/arm-smccc-rmi.h>
> +#include <linux/bug.h>
> +#include <linux/processor.h>
> +#include <linux/types.h>
> +
> +
> +/*
> + * rmi_smccc_invoke: Invoke the RMI call and return the results in @regs_out
> + * @regs_in: Registers with the arguments filled in.
> + * @regs_out: Ouptput results from the call.
> + */
> +static inline void rmi_smccc_invoke(struct arm_smccc_1_2_regs *regs)
> +{
> +	struct arm_smccc_1_2_regs args = *regs;
> +	unsigned long status;
> +
> +	while (1) {
> +		arm_smccc_1_2_invoke(&args, regs);
> +		status = RMI_RETURN_STATUS(regs->a0);
> +		if (status != RMI_BUSY && status != RMI_BLOCKED)
> +			break;
> +		cpu_relax();
> +	}
> +}

I haven't done a detailed review, this is just a drive through comment.
The while(1) gained my attention.

Should RMI_BLOCKED be returned to the caller instead of retried here?

RMM spec defines RMI_BLOCKED as persisting until the Host takes action.
It also says it is returned when another SRO on the same context is
incomplete. You may be running it on different CPUs and hence different
context I assume. But this loop takes no such action and hides the status
from the caller, so a command issued against that context if that can
happen can spin indefinitely while the operation which would unblock it
cannot run. Ignore me if it taken care not to happen elsewhere. I am
just looking at this in isolation.

Could this retry only RMI_BUSY and propagate RMI_BLOCKED so that the caller
can arrange for the incomplete operation to make progress if the above
scenario is possible ?

-- 
Regards,
Sudeep

