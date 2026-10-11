Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09DACA9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzklMIa+OcS580+DlUByvFd6dTQm7xRfECj9JDqQ+Ic=; b=PiEC6UxbnAyBcQlOYR7dIgJYp8
	MWt+AYogy/ahg4kWcW3LElUXFGY9wKgdm5tXHAXQEP48zGZoKuT5hry3IGZD/3EUW7JACvAvPtlPg
	gJ8LiNi0jvOGsg5yZECSlW1cmKWeb3HbyrdAU3J3uwiFUfh/KEwjbGiQoTWb1/6Am3G6s2ZZF28Nt
	CkRTnD001CUI4W56HKtvsdwTgJNL0zvWV9uEDpL+NKtYXfuh0AKguwk7PylVJW+xtFa30jF5m1aHq
	3gV865Lvq/zt7dZQ9hV6KJyuc977lDJiUXk+Etgu2Unk5lhrLOyXIQxCIqUNjn2sjXAdVcQyl6kIn
	G3Me5wPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFq7N-00000008u5b-3ZlK;
	Sun, 11 Oct 2026 09:45:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFq7K-00000008u5B-0Uzp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 09:45:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CB151682;
	Sun, 11 Oct 2026 02:45:10 -0700 (PDT)
Received: from [10.57.13.91] (unknown [10.57.13.91])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60FE03F882;
	Sun, 11 Oct 2026 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791711913; bh=phYLsYaGezB/4VFRSxSZQZLhUrUxyt689g+K6n1e57g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TSZD1LhJJBKLyR8FUnRN2F3Zi766+Qsh2PiIOXHCAXkm0XYuD3L5XUp9RTPWVhg0L
	 na1EvLuX5igyKGppH7bz7pzHtngbHMAuDoP5MDrMdf/vDi/Wg65mpfn/71+JcMN3C1
	 q8zvMSTP6/FdQGvxrMTZykCZ2L3JQGCf4k5IPqrQ=
Message-ID: <ebb8c99c-5f76-4c36-b3cd-c238b53b3d8a@arm.com>
Date: Sun, 11 Oct 2026 10:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: Pass only the required device probe
 arguments
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>, Russell King
 <linux@armlinux.org.uk>, kernel test robot <lkp@intel.com>
References: <20261010100249.643327-1-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261010100249.643327-1-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_024518_289905_9447E013 
X-CRM114-Status: GOOD (  16.58  )
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

Hi Aneesh

On 10/10/2026 11:02, Aneesh Kumar K.V (Arm) wrote:
> The device probe passes zeroes for all seven argument registers to
> arm_smccc_1_1_invoke(). On ARM32 Thumb-2, this binds an input to r7 and
> GCC 8.5 reports "r7 cannot be used in asm here".
> 
> The current smccc_devices entries need at most one argument after the
> function ID: TRNG_VERSION has none and RSI_ABI_VERSION takes a requested
> version. Pass zero for that argument and omit the unused arguments,
> avoiding the r7 constraint. Check argument requirements when adding new
> probe functions to smccc_devices.

Is it safer to use x1-x3 to 0 as they could be the results that we
get back from SMCCC v1.0 onwards ?


Suzuki



> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
> Cc: Andre Przywara <andre.przywara@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Fixes: d8263a131bb0 ("firmware: hwrng: arm_smccc_trng: Register as an SMCCC device")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610070641.B8hxBJcf-lkp@intel.com/
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   drivers/firmware/smccc/smccc.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index 07b864ff079d..377d2cda2b6e 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -122,8 +122,7 @@ static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smcc
>   	if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
>   		return false;
>   
> -	arm_smccc_1_1_invoke(smccc_dev->func_id,
> -			     0, 0, 0, 0, 0, 0, 0, &res);
> +	arm_smccc_1_1_invoke(smccc_dev->func_id, 0, &res);
>   	ret = res.a0;
>   
>   	if (ret == SMCCC_RET_NOT_SUPPORTED)


