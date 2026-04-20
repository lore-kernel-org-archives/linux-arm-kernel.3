Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67531F588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99fgHE25P8Rf1g7JLxo27iNfMt0M4KYBWTaNW36OxW8=; b=rPgOunJJ0VBxl9TptyPzy+R2gX
	rzBHd4A3WNY9Fv38yfqHzFrbMButNCb7bYcpyYSJ6rYj3gvKrDYidANMPfPbke2rFtf8Gsf9039Bt
	cIkwJr4IafaS1mkLj6kqy47MFjNQqnBfkZ1sxMCpbixCSvx6VXFwYUmBJ3g696IgexSZLTAFD+/JU
	04k+RwtPXDCczPk3W/kQtRqCta3Z5t/8t2lcYzjiu7Bj2B2DzS/VMnbo/cbbIdYNjOm+nsdxfuEDb
	0QRmS6nA8z4kAp6uZuA0xyse+0aB0SJNytbYw11MrX5+6jL9uXXMcI7yBPGAvsm3/SC94qj8uledF
	BhCSCGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnnx-00000006t1i-0SG4;
	Mon, 20 Apr 2026 12:32:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnnu-00000006t0r-09Cr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:32:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so84005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776688359; x=1777293159; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=99fgHE25P8Rf1g7JLxo27iNfMt0M4KYBWTaNW36OxW8=;
        b=WV4q369UFUvgFmBlVRN9ieMq3KD/LN6/3B/rnnsh1gr9j6w1PNInO9zI6oTk7gYZaN
         0pWsTJr2iCYwmZPlYSjzrxNJgRiv2057GEmDw+IE2/3iNN3QzDmt1/g4E7pdFGwdMYFe
         GNsa5moxJD9iec5ATltjfJawG0QkiJE9cEXqBdBvYJrSBSVQJzt1bwBLu6zNZ1HRuj79
         f/TOLEddXJMQ0hZ8B4uN2LmO1gN033KE7qjhAnxmfEwSbgV2krOz6swQ4YqFdv/fliYy
         aiA1vAmTZEMlDuK5UEFfl0M7RpKws9G+Qiawhl7XImsJ0L0t9iCBVmuuAoD5VekEQO3s
         k/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688359; x=1777293159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99fgHE25P8Rf1g7JLxo27iNfMt0M4KYBWTaNW36OxW8=;
        b=jcyoCkKm0m1JNGw3XbMQaQna9f3gKG50oCZvY8gELYCab/8GxpYOLcqnGLNZI1A8oA
         OS7k9h/KvanbgFNIYwnoo3B4/L8vnDEg8qpSh8rRTbEFa78Z6anwvOVblAA5nSWeHb9C
         IJu5traTyCOlzeN66kK9EzY51BFF57cOcbXfUbkooK5wpElcz6nYHvPz0lsoAGJv4qCF
         YzHSdUbvAh7tF1X+xwoEvCtBdGBiGrZNJ7ZU1LJLVB/GccSgBcYDxPewb0FAlC/GdlA0
         YxN3H9lm/DSrHNu8kIeqh7DrXnN3FwWdTjr6dLbbMGiSLLpOBlT2mYcTtXun54euGJ/9
         fqWw==
X-Forwarded-Encrypted: i=1; AFNElJ+44g7xKniYbgdg0s3NB1cy4VfiqrrwwqE+lDgz5u1mQaGYqt2P9vonsoEzb8Kchaj58ZYRxS+kDxTrL8Zlvb6d@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbr7kV42FP6XuFzFxxTxgR/GwkGm1Z258mn9dQg3yYGCOiU/RM
	Z5DW4a7yg8+PrUZzljQsxpUZDK3IzO+6gM+C8FW5fXuN7uH6CH/bBnUiXSZyMWGlnw==
X-Gm-Gg: AeBDievcTex7o2Xfl9XldgBTcDe0EYjhQeLSmMtZwmBpj2sPJgRgTyE3wG0/iOVH8aO
	1SxXKUriQhEpQlM4cDPZzyaUIkz9/54qIHhP1/rCrdBUBHWMjWmh9wZE94BE8SXPvf7CyVFXrrR
	AufwbuLnR0bFbpXU+tgrGpK7zgI2MPlldvFUmr1gVM+hfGwWRSnAcK1Vw1iVCkkgG5jXt2UbayG
	cQfUUzPswpjLPPVnaK928nfTNdw9HfAeZaPbJkwvSzHj4PNtIS4D11zsnGOmqrTl8fN7eltDuYb
	rTtgHpJ4Xr2J/4Ht6VdaTS3at0c9AZEn7DjSmx/a4aGplNMM283Ufi/plky53OQu1nfnovJO+Uq
	fC2JWq8WgbM2VV7fpoV5DrPLE4DzJGjNHKqKLO6h+5kqNbYiw8FI8Ynw+jSg3M7z78kCsT7rH1A
	rcG0p/6JNgTmhdYHZUAAfGkV4VSY1jExE07Rv2R2j9hPHhSPJnxyjhBknI2QR2y2wfXzyMlbRSr
	ieVffW8KT1nh2M1hGo=
X-Received: by 2002:a05:600d:848c:20b0:485:4133:4021 with SMTP id 5b1f17b1804b1-489013bd634mr1545925e9.7.1776688358586;
        Mon, 20 Apr 2026 05:32:38 -0700 (PDT)
Received: from google.com (117.15.199.104.bc.googleusercontent.com. [104.199.15.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc375dsm26265240f8f.14.2026.04.20.05.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:32:38 -0700 (PDT)
Date: Mon, 20 Apr 2026 12:32:32 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <aeYbdmshGZJ4GhXd@google.com>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417175759.3191279-5-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_053242_089167_6B71C00B 
X-CRM114-Status: GOOD (  23.92  )
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

On Fri, Apr 17, 2026 at 06:57:59PM +0100, Yeoreum Yun wrote:

Hello Yeoreum,


> When pKVM is enabled, the FF-A driver must be initialized after pKVM.
> Otherwise, pKVM cannot negotiate the FF-A version or
> obtain RX/TX buffer information, leading to failures in FF-A calls.

At the moment this already happens after you move back ffa_init() to
device_initcall().

> 
> During FF-A driver initialization, check whether pKVM has been initialized.
> If not, defer probing of the FF-A driver.
> 

I don't think you need to add this dependency. pKVM is
installed through KVM's module_init() which ends up calling hyp_ffa_init() to
do the proxy initialization. The ARM-FFA driver comes after it (since
pKVM is arch specific code). We don't have to call finalize_pkvm(..) to
be able to handle smc(FF-A) calls in the hyp-proxy.

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/kvm/arm.c              |  1 +
>  drivers/firmware/arm_ffa/driver.c | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 410ffd41fd73..0f517b1c05cd 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -119,6 +119,7 @@ bool is_kvm_arm_initialised(void)
>  {
>  	return kvm_arm_initialised;
>  }
> +EXPORT_SYMBOL(is_kvm_arm_initialised);
> 
>  int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>  {
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index 02c76ac1570b..2647d6554afd 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -42,6 +42,8 @@
>  #include <linux/uuid.h>
>  #include <linux/xarray.h>
> 
> +#include <asm/virt.h>
> +
>  #include "common.h"
> 
>  #define FFA_DRIVER_VERSION	FFA_VERSION_1_2
> @@ -2035,6 +2037,16 @@ static int __init ffa_init(void)
>  	u32 buf_sz;
>  	size_t rxtx_bufsz = SZ_4K;
> 
> +	/*
> +	 * When pKVM is enabled, the FF-A driver must be initialized
> +	 * after pKVM initialization. Otherwise, pKVM cannot negotiate
> +	 * the FF-A version or obtain RX/TX buffer information,
> +	 * which leads to failures in FF-A calls.
> +	 */
> +	if (IS_ENABLED(CONFIG_KVM) && is_protected_kvm_enabled() &&
> +	    !is_kvm_arm_initialised())
> +		return -EPROBE_DEFER;
> +
>  	ret = ffa_transport_init(&invoke_ffa_fn);
>  	if (ret)
>  		return ret;
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

Thanks,
Sebastian

