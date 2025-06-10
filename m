Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BC7C71132
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdWagi9BC/IaPFKFJsoyl8mflRquqguGZo8vpgDAe70=; b=S/OFW22/AfCN8e2D1ksN9aDFlm
	HQnMUDJmLYIpu7i7YGwmwrpefhmZvqjmZudv3X603MgcrzGifeleR7JHBImQLQJIZ/7nxmPwO+Cvm
	WOzY+s3kwA+ea2tZ0GpHnb2hyavDQd0yqN4XJqkjpQDsMZgfehyC+Af0Pl9RjM7uhJsYxui9APoYm
	RzpjX+gxrfdK3BI/iiQEE3XRFv6npYdzgSiIqPG7IH53AEABA9iAR2cHSA69VuRICToV7J1F8Pd4x
	4INUw58R34c1qSH45+LO6cuKRMzdC6bvLS78HFMX2dYzp1JWCCGGAI8/xa66HH00XqHyRydZUaVD1
	TtxuXFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwen-00000006Xvz-2qae;
	Tue, 10 Jun 2025 10:56:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvTI-00000006N1N-2tKx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 09:40:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 901BE1424;
	Tue, 10 Jun 2025 02:40:24 -0700 (PDT)
Received: from [10.163.32.103] (unknown [10.163.32.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D0973F59E;
	Tue, 10 Jun 2025 02:40:40 -0700 (PDT)
Message-ID: <85830220-8144-4df2-9e02-d34b48782c34@arm.com>
Date: Tue, 10 Jun 2025 15:10:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: trbe: Add ISB after TRBLIMITR write
To: James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_024044_773176_F58336C4 
X-CRM114-Status: GOOD (  14.34  )
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



On 09/06/25 3:49 PM, James Clark wrote:
> DEN0154 states that hardware will be allowed to ignore writes to TRB*
> registers while the trace buffer is enabled. Add an ISB to ensure that
> it's disabled before clearing the other registers.
> 
> This is purely defensive because it's expected that arm_trbe_disable()
> would be called before teardown which has the required ISB.
> 
> Fixes: a2b579c41fe9 ("coresight: trbe: Remove redundant disable call")
> Signed-off-by: James Clark <james.clark@linaro.org>

Agreed. An isb() barrier is required to ensure that the TRBE is disabled
even after clearing TRBLIMITR_EL1 and before writing/clearing other TRBE
registers. Besides trbe_reset_local() seems to be the only function where
such a scenario exists.

LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8267dd1a2130..10f3fb401edf 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -257,6 +257,7 @@ static void trbe_drain_and_disable_local(struct trbe_cpudata *cpudata)
>  static void trbe_reset_local(struct trbe_cpudata *cpudata)
>  {
>  	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> +	isb();
>  	trbe_drain_buffer();
>  	write_sysreg_s(0, SYS_TRBPTR_EL1);
>  	write_sysreg_s(0, SYS_TRBBASER_EL1);
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250609-james-cs-trblimitr-isb-523f20d874d6
> 
> Best regards,


