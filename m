Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBD4CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 05:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQqJLxn/uck2ZUWoChhjcCs9bxIpI9w0PlNK/2siEoQ=; b=rcEEpzKKSTc3lq6GcpBQZjNwnV
	pYR1wdK3nwwmUCa5qO1Tz/DbCLQQn6Elq9T2OMeNbkhT7HeiyRvDsNYCW8PqGcxJnbZAKL8UrJ2cA
	Vp7Oi1cO/AcukWmY6bE+ZHpFOb4czustfFkW6VXuNiOvJWJdnf8kKZe1qcVsK4UxOW//yQwHHnyU8
	yKeMLqgzKxpmhfQ5jnrqYY2JPB9DUJP2IMDCfOiodVqZJu6GWEYUgRZyaqUoEoUX/AbbPP0AX4Mz7
	SZaZJrpK0RNG3BsUQAPTSZKlTtp2heiB5IziUoarfGrqwTIOaqo9ZZe8YQRmfd9MYcKjdUtfiVsYL
	4VHIY3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsag-00000006ZFG-1TXq;
	Mon, 18 Aug 2025 05:39:30 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsXE-00000006Z3m-0FgG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 05:35:57 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57I5ZbsT2585902;
	Mon, 18 Aug 2025 00:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755495337;
	bh=ZQqJLxn/uck2ZUWoChhjcCs9bxIpI9w0PlNK/2siEoQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IJ39ERdw/bmMCyb6LoyfEhp83XHLt5GQ1RmUr4GyGOYmkf4+NvTL8FMpFMAb0oqEd
	 Tdu51zKveZLvXWZB2EMLqBlnXPUy6TNTzdlPxkIG1SAZqNMrBz7WkmqdhHxTgtK0s5
	 7+Sww05vkrrhX6fmV170nVv2rsJRx5Foh+Go9KfM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57I5ZbUW069851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 00:35:37 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 00:35:37 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.1748.24; Mon, 18 Aug
 2025 00:35:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 00:35:36 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57I5ZZQc478080;
	Mon, 18 Aug 2025 00:35:36 -0500
Date: Mon, 18 Aug 2025 11:05:35 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <arm-scmi@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <sudeep.holla@arm.com>, <james.quinlan@broadcom.com>,
        <f.fainelli@gmail.com>, <vincent.guittot@linaro.org>,
        <quic_sibis@quicinc.com>, <dan.carpenter@linaro.org>,
        <johan+linaro@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <quic_mdtipton@quicinc.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Rework quirks framework header
Message-ID: <20250818053535.owst4ilq2oxfgqnq@lcpd911>
References: <20250815102736.81450-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250815102736.81450-1-cristian.marussi@arm.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_223556_264362_7E5DDCBE 
X-CRM114-Status: GOOD (  26.31  )
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

Hi,

On Aug 15, 2025 at 11:27:35 +0100, Cristian Marussi wrote:
> Split and relocate the quirks framework header so as to be usable also by
> SCMI Drivers and not only by the core.

Could you elaborate a bit more on this reasoning? I am not fully
convinced as to why I shouldn't just include quirks.h in the other scmi
drivers as well?

Oh or perhaps you mean to say scmi driver like scmi cpufreq / clk-scmi
etc.. which lie outside the firmware/arm_scmi folder? If so then that's
not coming out clearly in this patch commit message.

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/clock.c  |  2 +-
>  drivers/firmware/arm_scmi/driver.c |  1 +
>  drivers/firmware/arm_scmi/quirks.h | 33 +++-------------------
>  include/linux/scmi_quirks.h        | 44 ++++++++++++++++++++++++++++++
>  4 files changed, 50 insertions(+), 30 deletions(-)
>  create mode 100644 include/linux/scmi_quirks.h
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index afa7981efe82..5599697de37a 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -7,11 +7,11 @@
>  
>  #include <linux/module.h>
>  #include <linux/limits.h>
> +#include <linux/scmi_quirks.h>
>  #include <linux/sort.h>
>  
>  #include "protocols.h"
>  #include "notify.h"
> -#include "quirks.h"
>  
>  /* Updated only after ALL the mandatory features for that version are merged */
>  #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30000
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index bd56a877fdfc..6f5934cd3a65 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -34,6 +34,7 @@
>  #include <linux/processor.h>
>  #include <linux/refcount.h>
>  #include <linux/slab.h>
> +#include <linux/scmi_quirks.h>
>  #include <linux/xarray.h>
>  
>  #include "common.h"
> diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
> index a71fde85a527..260ae38d617b 100644
> --- a/drivers/firmware/arm_scmi/quirks.h
> +++ b/drivers/firmware/arm_scmi/quirks.h
> @@ -4,49 +4,24 @@
>   *
>   * Copyright (C) 2025 ARM Ltd.
>   */
> -#ifndef _SCMI_QUIRKS_H
> -#define _SCMI_QUIRKS_H
> +#ifndef _SCMI_QUIRKS_INTERNAL_H
> +#define _SCMI_QUIRKS_INTERNAL_H

Or as per your commit message wording, better to call it
_SCMI_QUIRKS_CORE_H ?

>  
> -#include <linux/static_key.h>
> +#include <linux/device.h>
>  #include <linux/types.h>
>  
>  #ifdef CONFIG_ARM_SCMI_QUIRKS
>  
> -#define DECLARE_SCMI_QUIRK(_qn)						\
> -	DECLARE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn)
> -
> -/*
> - * A helper to associate the actual code snippet to use as a quirk
> - * named as _qn.
> - */
> -#define SCMI_QUIRK(_qn, _blk)						\
> -	do {								\
> -		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
> -			(_blk);						\
> -	} while (0)
> -
>  void scmi_quirks_initialize(void);
>  void scmi_quirks_enable(struct device *dev, const char *vend,
>  			const char *subv, const u32 impl);
>  
>  #else
>  
> -#define DECLARE_SCMI_QUIRK(_qn)
> -/* Force quirks compilation even when SCMI Quirks are disabled */
> -#define SCMI_QUIRK(_qn, _blk)						\
> -	do {								\
> -		if (0)							\
> -			(_blk);						\
> -	} while (0)
> -
>  static inline void scmi_quirks_initialize(void) { }
>  static inline void scmi_quirks_enable(struct device *dev, const char *vend,
>  				      const char *sub_vend, const u32 impl) { }
>  
>  #endif /* CONFIG_ARM_SCMI_QUIRKS */
>  
> -/* Quirk delarations */
> -DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
> -DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
> -
> -#endif /* _SCMI_QUIRKS_H */
> +#endif /* _SCMI_QUIRKS_INTERNAL_H */
> diff --git a/include/linux/scmi_quirks.h b/include/linux/scmi_quirks.h
> new file mode 100644
> index 000000000000..11657bd91ffc
> --- /dev/null
> +++ b/include/linux/scmi_quirks.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * System Control and Management Interface (SCMI) Message Protocol Quirks
> + *
> + * Copyright (C) 2025 ARM Ltd.
> + */
> +#ifndef _SCMI_QUIRKS_H
> +#define _SCMI_QUIRKS_H
> +
> +#include <linux/static_key.h>
> +#include <linux/types.h>
> +
> +#ifdef CONFIG_ARM_SCMI_QUIRKS
> +
> +#define DECLARE_SCMI_QUIRK(_qn)						\
> +	DECLARE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn)
> +
> +/*
> + * A helper to associate the actual code snippet to use as a quirk
> + * named as _qn.
> + */
> +#define SCMI_QUIRK(_qn, _blk)						\
> +	do {								\
> +		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
> +			(_blk);						\
> +	} while (0)
> +
> +#else
> +
> +#define DECLARE_SCMI_QUIRK(_qn)
> +/* Force quirks compilation even when SCMI Quirks are disabled */
> +#define SCMI_QUIRK(_qn, _blk)						\
> +	do {								\
> +		if (0)							\
> +			(_blk);						\
> +	} while (0)

Did you happen to run checkpatch on this?
8<---------------------------------------------------------------------------
WARNING: Argument '_qn' is not used in function-like macro
#142: FILE: include/linux/scmi_quirks.h:32:
+#define SCMI_QUIRK(_qn, _blk)                                          \
+       do {                                                            \
+               if (0)                                                  \
+                       (_blk);                                         \
+       } while (0)

total: 0 errors, 2 warnings, 0 checks, 116 lines checked
--------------------------------------------------------------------------->8


> +
> +#endif /* CONFIG_ARM_SCMI_QUIRKS */
> +
> +/* Quirk delarations */
> +DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
> +DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
> +
> +#endif /* _SCMI_QUIRKS_H */
> -- 
> 2.50.1
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

