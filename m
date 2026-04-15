Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DC1F42122
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 18:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6flUdCan8KDneouYjRU7Yn8NH91DZWgBiHsYuTsSA2Y=; b=O3/mLERZdCJ1QLDNr8OIcfYzfS
	DYsoWQlKBayxZzbMwmFVzVcgZT+ACSNedOh1f1qY5+A9Brr3Q+fyUdmz8jrhfX+Q9NusjK6ZjrXZP
	3iippz1rewCanUxbqh+AAYuJ/9CIzitNr0ooHq0oi14d8dhibPh2vHt0faby0GsbNQ8YTJtFE1QDl
	J9Cm8BRnTKoAlNlJjCYrDSnUZ2yWwRO29Kz5LtOKdi22/m45SrNMD9VMmPtZFhjotfXcw6R0ro2vX
	Wa7r7d2a68nJ5dUCe4gys0D77mY31Yf9Pl1tQYgBH8jrIAmFBzsoyaF+zZaRUwm1QQw/n9bf71Nix
	8pP7O96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4pe-00000001Uzq-3eQw;
	Wed, 15 Apr 2026 18:19:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4pa-00000001Uz1-3Ieo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 18:19:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B68BA2BC0;
	Wed, 15 Apr 2026 11:19:08 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 977123F7D8;
	Wed, 15 Apr 2026 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776277154; bh=T5wSEKNxd+WK6Gf12aNHbt22JqawJsPgYLmrIq9kvGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6UUQyGbDM+4d1xYsZHLm7gPViLNXhJiX2q68G5XuHafRIDjh8ZMJc5aP582JXxtM
	 LhKTA6OlAkHj3A+WUEf7VYl20ppC2Z7d26LDku2Y/1B+6Of6R7/SASqNriYcKfb6qD
	 U57viy9EAm2s3J+iHKUfW4sSGseR1g1YAwDy8MGM=
Date: Wed, 15 Apr 2026 19:19:06 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm_pmu: acpi: fix reference leak on failed device
 registration
Message-ID: <ad_WmuauLJ3xDKqh@J2N7QTR9R3>
References: <20260415174159.3625777-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415174159.3625777-1-lgs201920130244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_111919_205461_18142D88 
X-CRM114-Status: GOOD (  34.91  )
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

Thanks for the patch, but from a quick skim, I don't think this is the right
fix.

Greg, I think we might want to rework the core API here; question for
you at the end.

On Thu, Apr 16, 2026 at 01:41:59AM +0800, Guangshuo Li wrote:
> When platform_device_register() fails in arm_acpi_register_pmu_device(),
> the embedded struct device in pdev has already been initialized by
> device_initialize(), but the failure path only unregisters the GSI and
> does not drop the device reference for the current platform device:
> 
>   arm_acpi_register_pmu_device()
>     -> platform_device_register(pdev)
>        -> device_initialize(&pdev->dev)
>        -> setup_pdev_dma_masks(pdev)
>        -> platform_device_add(pdev)
> 
> This leads to a reference leak when platform_device_register() fails.

AFAICT you're saying that the reference was taken *within*
platform_device_register(), and then platform_device_register() itself
has failed. I think it's surprising that platform_device_register()
doesn't clean that up itself in the case of an error.

There are *tonnes* of calls to platform_device_register() throughout the
kernel that don't even bother to check the return value, and many that
just pass the return onto a caller that can't possibly know to call
platform_device_put().

Code in the same file as platform_device_register() expects it to clean up
after itself, e.g.

| int platform_add_devices(struct platform_device **devs, int num) 
| {
|         int i, ret = 0; 
| 
|         for (i = 0; i < num; i++) {
|                 ret = platform_device_register(devs[i]);
|                 if (ret) {
|                         while (--i >= 0)
|                                 platform_device_unregister(devs[i]);
|                         break;
|                 }    
|         }    
| 
|         return ret; 
| }

That's been there since the initial git commit, and back then,
platform_device_register() didn't mention that callers needed to perform
any cleanup.

I see a comment was added to platform_device_register() in commit:

  67e532a42cf4 ("driver core: platform: document registration-failure requirement")

... and that copied the commend added for device_register() in commit:

  5739411acbaa ("Driver core: Clarify device cleanup.")

... but the potential brokenness is so widespread, and the behaviour is
so surprising, that I'd argue the real but is that device_register()
doesn't clean up in case of error. I don't think it's worth changing
this single instance given the prevalance and churn fixing all of that
would involve.

I think it would be far better to fix the core driver API such that when
those functions return an error, they've already cleaned up for
themselves.

Greg, am I missing some functional reason why we can't rework
device_register() and friends to handle cleanup themselves? I appreciate
that'll involve churn for some callers, but AFAICT the majority of
callers don't have the required cleanup.

Mark.

> Fix this by calling platform_device_put() after unregistering the GSI.
> 
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
> 
> Fixes: 81e5ee4716098 ("arm_pmu: acpi: Refactor arm_spe_acpi_register_device()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/perf/arm_pmu_acpi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm_pmu_acpi.c b/drivers/perf/arm_pmu_acpi.c
> index e80f76d95e68..5ce382661e34 100644
> --- a/drivers/perf/arm_pmu_acpi.c
> +++ b/drivers/perf/arm_pmu_acpi.c
> @@ -119,8 +119,10 @@ arm_acpi_register_pmu_device(struct platform_device *pdev, u8 len,
>  
>  	pdev->resource[0].start = irq;
>  	ret = platform_device_register(pdev);
> -	if (ret)
> +	if (ret) {
>  		acpi_unregister_gsi(gsi);
> +		platform_device_put(pdev);
> +	}
>  
>  	return ret;
>  }
> -- 
> 2.43.0
> 

