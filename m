Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3D7CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGUlpL6+1iGPt0HKO40nGtEwoabEliAOtZw65tCU5lw=; b=kTERPPPre/cGRmYgti3lp0k7qx
	B6MkHEBz1d4W/in7x0PLqbik678AbMWcZ2q2JlOI75TnXy5pVeO1GSXxwNsAddYqzIHY99DgzFK6z
	VdMws0K+J0N7Qx+IMYc+P+mZ6RrvH76dHzawBNbVoyz4DvHaeVNBoNnMBYgqj62FQrEhvYwEk/qvJ
	SJI8iqDJaglCj8P5tQCu6EBcRjj4F7RhO9mCI1Fq+gd/F04KNJCeMteI1MXRi8z01wB6kyLdyMOoj
	PChxGzl5mER9j7wk53yuiy8MKr8JO0EjEcdjmMURZFiyUVKR174PXcJMa6LlKUqbbtn+/BJrrrnxq
	RDUGaQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoE8-0000000H3JU-2p2d;
	Tue, 12 May 2026 14:36:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoE5-0000000H3Ii-2W0E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:36:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FC011688;
	Tue, 12 May 2026 07:36:40 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14EF23F836;
	Tue, 12 May 2026 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778596605; bh=QmAgh1IVWGWULMF4dhinH/gWH7u1s9tJt0lMBXUirdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIV0RW8XFFjNZCmZBbL/boBzDWtytxxxKsMf4ztunC9xu6qfdu9CFUHRgVpF5MpF+
	 H7tTpU9mf3YNQYxS3u8iEGh5hniSY1MtbOMNCSfX1dV3UYTEQiCF75CSTLkNtCA3s+
	 z+WBspdt419dmI7HQryUBdB13IGo2dMzsfrC4PEs=
Date: Tue, 12 May 2026 15:36:39 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v4 1/2] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <agM699d4KwdjnS39@arm.com>
References: <20260427061615.905018-1-aneesh.kumar@kernel.org>
 <20260427061615.905018-2-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427061615.905018-2-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_073649_753313_FF14A987 
X-CRM114-Status: GOOD (  19.63  )
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

+ Suzuki

On Mon, Apr 27, 2026 at 11:46:14AM +0530, Aneesh Kumar K.V (Arm) wrote:
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
[...]
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index bdee057db2fd..fc9b44b7c687 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -12,6 +12,8 @@
>  #include <linux/platform_device.h>
>  #include <asm/archrandom.h>
>  
> +#include "rmm.h"
> +
>  static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
>  static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
>  
> @@ -85,6 +87,18 @@ static int __init smccc_devices_init(void)
>  {
>  	struct platform_device *pdev;
>  
> +	pdev = platform_device_register_simple("arm-smccc",
> +					PLATFORM_DEVID_NONE, NULL, 0);
> +	if (IS_ERR(pdev)) {
> +		pr_err("arm-smccc: could not register device: %ld\n", PTR_ERR(pdev));
> +	} else {
> +		/*
> +		 * Register the RMI and RSI devices only when firmware exposes
> +		 * the required SMCCC function IDs at a supported revision.
> +		 */
> +		register_rsi_device(pdev);
> +	}

So as per the cover letter, instead of "arm-cca-dev" as a platform
device, we get "arm-smccc" as a platform device with an auxiliary
"arm-rsi-dev" child device. This does not get rid of the platform
device, it just creates a synthetic platform device to represent the
SMCCC firmware interface.

Looking at the earlier discussion, I think this is what Greg/Jason were
suggesting, except that we do not currently have an SMCCC platform
device:

https://lore.kernel.org/all/2025101534-frosty-shank-00b1@gregkh/

If we go this route, shouldn't the platform device above be created only
if !SMCCC_CONDUIT_NONE?

"smccc_trng" would also fit this model (together with the driver),
assuming we don't break any user-space (searching the Debian codebase
did not find any use).

-- 
Catalin

