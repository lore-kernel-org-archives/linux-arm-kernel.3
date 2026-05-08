Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DD3CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gy20RbtrLiFqOu/TWYiYwq/89f7A/UUGp6Uxpl1nDPk=; b=oiPIMXuxnHwRkadX7saiS+HSYK
	VSRhdiPvy0Yg5EkujFhW5zVezbA3DsJkg5eeiuTUW3jPnfMk2ToLJR5Fx3tv5CmNRVZpmLHlO56l0
	mqaKUnb81mVWeUxOR0nXVqfbjzVJb6w1tofLthPEKCEiawZpwHIA6b0yJRsxcb6oAasIg9RTJOh+e
	iiNd24+zTEuv4qG9+XFMbLOwuWzdLwVGgBj4j1PQlzTiAnYDlbNn+lF47WLABldypfaF8/z3EAlsH
	0rLfi1Lmd4AiSf+1K+/xSQibaXlVrASzZbasvjlpdCv3akd82GOkRiWeJgk077NdV65ZypQnFg2DE
	ntsxNZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQCX-00000007HwB-1T9o;
	Fri, 08 May 2026 18:45:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQCS-00000007HvW-3Oq6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 18:45:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E21E35C8;
	Fri,  8 May 2026 11:45:17 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDF5D3F763;
	Fri,  8 May 2026 11:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778265922; bh=Um9WPFqN7H2ySkHiR2sGQgTz8RH4w81WnNll++kO0KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uTmdZouwo9E6t00HxpLFDySDpfjnNQYivZlR7bZalwSAXnoqbqYhjPvhASnVaTCdp
	 c/ZkWgRYxg9hxDM47Ti/paOahAhtcGINq//R1N/fEcFhDwNnLr/2NNnQ2ZM37aqDxo
	 o07keQreCRyqmvemlEU1mqlyhUq0Bs/VVc178Upg=
Date: Fri, 8 May 2026 19:45:19 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 4/4] firmware: arm_ffa: Defer probe until pKVM is
 initialized
Message-ID: <af4vPxsKXpJlX8Ds@e129823.arm.com>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
 <20260508-b4-ffa_plat_dev-v1-4-c5a30f8cf7b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-b4-ffa_plat_dev-v1-4-c5a30f8cf7b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_114525_762725_44825349 
X-CRM114-Status: GOOD (  16.63  )
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

Look good to me.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> When protected KVM is enabled, the kernel includes a pKVM FF-A proxy
> that sits in front of the normal FF-A driver. The proxy has to perform
> its own FF-A version negotiation and setup first, so that it can mediate
> subsequent FF-A traffic correctly.
> 
> Defer FF-A core probing until pKVM has completed initialization. This
> keeps the normal driver from negotiating the FF-A version or performing
> other transport setup before the pKVM proxy is ready, and lets the
> driver model retry probing once the protected KVM state required by the
> FF-A transport is available.
> 
> Suggested-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_ffa/driver.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index e9d7dc71c06d..1fba064c2aba 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -43,6 +43,8 @@
>  #include <linux/uuid.h>
>  #include <linux/xarray.h>
>  
> +#include <asm/virt.h>
> +
>  #include "common.h"
>  
>  #define FFA_DRIVER_VERSION	FFA_VERSION_1_2
> @@ -2039,6 +2041,10 @@ static int ffa_probe(struct platform_device *pdev)
>  	u32 buf_sz;
>  	size_t rxtx_bufsz = SZ_4K;
>  
> +	if (IS_BUILTIN(CONFIG_ARM_FFA_TRANSPORT) &&
> +	    is_protected_kvm_enabled() && !is_pkvm_initialized())
> +		return -EPROBE_DEFER;
> +
>  	ret = ffa_transport_init(&invoke_ffa_fn);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.43.0
> 

-- 
Sincerely,
Yeoreum Yun

