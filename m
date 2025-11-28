Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F0CD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCl9X4qI8yhLb81mSCvOL49MIOZcpHAsJ/PLn0AOLzs=; b=dGu1y2sm6GOZZgU9a0ZPWLSMvs
	DVg53j2Lo1FSyVElE1Ij7FEAuhdgK3VlOok2K2uw+GycKdcgnk2GmF/ZzOxW1AWMp1xn06+tR1OHd
	ibLPkrbPAoq3Hhqc954fkoxPU9u8lxiJduoPGPWtymrOAZkUyK5QE02xhvBCT0WunUpWENmuShOtg
	PkeQ8IPuSgJ6Suz9eAOrHTEB5rL/lS/XYpSPuCInL0FCMZPAhMiyUiebUm64QRv70UTZBOUW83fQu
	iSanyvl/L6b1W7cluWONMHccjaMyI7G5IIYgwW/d2yqMCOfR3Jc3T35WO1/NZhcHzKpgiz3KQfVEX
	AlzVNTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1ld-00000000gu3-1A0k;
	Fri, 28 Nov 2025 16:56:21 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1lb-00000000gtZ-22cs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 16:56:20 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-8b3016c311bso251403085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 08:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1764348978; x=1764953778; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCl9X4qI8yhLb81mSCvOL49MIOZcpHAsJ/PLn0AOLzs=;
        b=JeTZloiYnLUzWZIwNbzHxx6PsWEeVAdJIwwSoQucxjO4fUJx9s3bFzJR0ZFZ+C8SQR
         XlVx8DyRUSWHlUdQ5JXIDvpR/x94FiuR58/bQXEPYi3VVqssTK1UOufbGGl0fs9rIp3I
         dBjMWcPgUEl7n/dPz2V/X9V1WTZuddZiZoDTQeigWV+PtsWt7O43Zkry2yJa77Zc69yH
         LuO4wnR6m77/323n1r7Yz9TbrfH9gPyGEsgl9vL6JjN7U8FAX05FBkp1q/C/iGKB5Gxu
         dN/1iu9BbAAAzfvdemK8oxZmB8+XcSmH2JjPDGvHZA8wCjcSBrxHxg11Lxfj26spUYPp
         Ridg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764348978; x=1764953778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCl9X4qI8yhLb81mSCvOL49MIOZcpHAsJ/PLn0AOLzs=;
        b=cuZ3h5jRRI4d/BGY0zZaF/mtnopYXiaEpYv2/beUYmWbMOVOZydg4G8De8t6BXwAW0
         fkhNT5ngOZIBpER3bAqNPeJjJ04MZi1vQbf9brrLKwKwE3+n5+RRX1kAg3tYd8Y9qn1T
         7IvTb1MPfmgjWBQZsueQF9BYWCMLeTIHfIVqs4uQWQUTPh18EfsnR6JUI7wDVOw6O4ni
         PpG/2LM2UF6xr+qDkyLlnz58SFzhdFy9prGhSmHdLFtYJMZv+GheA+IeOkA8UesTM6gb
         s2OT2zAOqR6h3BZsbgTaRsoHrVyQJ9LN/hLiCZDKT1JWzDRxu7u+jnVaw3lfqnciWkhg
         hR1Q==
X-Gm-Message-State: AOJu0Yxf/zXpFTU1/hXrzCKRRTfNf6gEHAQMEPZKRQXdYTZfo2892MS1
	WJ7JwrFMfnDUgF9X9434RIPOv15a53rm4BV4+/izjiyWRv248cg8U4kYjEO4+b9g/WQ=
X-Gm-Gg: ASbGncvFQgeK+OYP3v+2C9tkNkB80bR7eeD6w82Z+n6LbKMFc2zqxXU1sjbMXplcqa5
	7MnjaMjiqf81ome7gcbTobt88reLXWpcpjwDedWD6ToFqw2oZIdxP4VL8hQ3D6uO6pY5sJYjktd
	ep1AbwRI7ZZBVX2pGVTkikQjIJBOVGI4T+sjd792gdhgzThAd6iTLRKKIsCch7oplVHs5FbLw06
	oKFh2pqBwHm3lSvzFsXI/+uwXpATQ92Ig94IVOml4VdsOBYTMyTH4AM/VhBMEugSfUM4gpVVc7s
	nHEg/o6N040/fyuNG762rUjVuDafQThizlpwE0/axdbtDBbacDrRf1C1D6StLlMsG0ViXWgEcTl
	tuWV9g8nKqzTwHn8J/1FKZheiWo+uuBUWAo6vR164btGAd5Wm9VfEHBU6VbwVCh7wriLlkeRHNb
	y1faC4RLqXAH3XdH7gpoWekVMV5r65MokoyzUQknfFvr3NgdozLI3PmTYw
X-Google-Smtp-Source: AGHT+IGIckk1twmdF2dvhlgnAkNoETKwIZpnGAw6TiBLkZPFGsmOSfaowEINSQpVofG9sVXQPmMVQQ==
X-Received: by 2002:a05:620a:4546:b0:8b2:ea33:389d with SMTP id af79cd13be357-8b33d203829mr3744011185a.4.1764348978095;
        Fri, 28 Nov 2025 08:56:18 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b5299946dbsm342827685a.7.2025.11.28.08.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:56:17 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vP1lY-00000003Q4b-3UBP;
	Fri, 28 Nov 2025 12:56:16 -0400
Date: Fri, 28 Nov 2025 12:56:16 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 14/27] iommu/arm-smmu-v3: Support probing KVM emulated
 devices
Message-ID: <20251128165616.GD812105@ziepe.ca>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-15-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117184815.1027271-15-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_085619_553848_0AADFBE2 
X-CRM114-Status: GOOD (  34.62  )
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

On Mon, Nov 17, 2025 at 06:48:01PM +0000, Mostafa Saleh wrote:
> When KVM runs in protected mode, and CONFIG_ARM_SMMU_V3_PKVM
> is enabled, it will manage the SMMUv3 HW using trap and emulate
> and present emulated SMMUs to the host kernel.
> 
> In that case, those SMMUs will be on the aux bus, so make it
> possibly to the driver to probe those devices.
> Otherwise, everything else is the same as the KVM emulation
> complies with the architecutre, so the driver doesn't need
> to be modified.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 58 +++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 7b1bd0658910..851d47bedae6 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -11,6 +11,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/acpi_iort.h>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/bitops.h>
>  #include <linux/crash_dump.h>
>  #include <linux/delay.h>
> @@ -4604,6 +4605,63 @@ static struct platform_driver arm_smmu_driver = {
>  module_driver(arm_smmu_driver, platform_driver_register,
>  	      arm_smmu_driver_unregister);
>  
> +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> +/*
> + * Now we have 2 devices, the aux device bound to this driver, and pdev
> + * which is the physical platform device.
> + * This part is a bit hairy but it works due to the fact that
> + * CONFIG_ARM_SMMU_V3_PKVM forces both drivers to be built in.
> + * The struct device for the SMMU is used in the following cases:
> + * 1) Printing using dev_*()
> + * 2) DMA memory alloc (dmam_alloc_coherent, devm_*)
> + * 3) Requesting resources (iomem, sysfs)
> + * 4) Probing firmware info (of_node, fwnode...)
> + * 5) Dealing with abstracted HW resources (irqs, MSIs, RPM)
> + * 6) Saving/reading driver data
> + * For point 4) and 5) we must use the platform device.
> + * For, 1) pdev is better for debuggability.
> + * For 2), 3), 6) it's better to use the bound device.
> + * However that doesn't really work:
> + * For 2) The DMA allocation using the aux device will fail, as
> + * we need to setup some device DMA attrs (mask), to match the
> + * platform.
> + * For 6) Some contexts from the pdev as MSI, it needs to use the
> + * drvdata.
> + * Based on the following:
> + * 1- Both drivers must be built-in to enable this (enforced by Kconfig),
> + *    which means that none of them can be removed.
> + * 2- The KVM driver doesn't do anythng at runtime and doesn't use drvdata.
> + * We can keep the driver simple and to claim the platform device in all cases.
> + */

It is OK I guess, I wouldn't insist you change it, but I think it is
kind of gross. Registering the iommu driver against the platform
device instead of the aux is pretty ugly and denies userspace the
ability to see that the hypervisor is sitting in there through the
sysfs topology.

Not sure why the commentary about built-in though, what does that have
to do with anything? If the aux driver is not built in then it will
just module load later and everything should be fine?

Jason

