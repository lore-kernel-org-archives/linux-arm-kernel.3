Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A8FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMB6bu75t+ZZ5TxFVUnvCCWgfugEUPmSZZ3Ssad5w0I=; b=TcKt9r/QwEL4ML2agh1gsMQa1o
	ssECpjUNdU7RHTkekXPr4S15tgF4Abo1OCxHVPrCyhwFNVguDqVM0q24apTiniO5VY/Y8ZREyASyw
	hTZ1ru5EsFnLsww0UBZKrKKlrHvg4IC9nObzDdkS3UsYLmUrnmMDOVCUuFFBpTAJZHIBNc8zMnAUZ
	cA/VLFpXp073Zc8E5Otd8x2KywT3tIgAuncRShNV0c1i+8czkngBtCjDgdrLjkcddV2CBVhemPH2U
	pcs7tDTjx1ja9aFxIxeotuITyPfWIbVRqQtjZEC7NAO30dB6a8lq0i1S586wPaTIN6U4kGldBMQW5
	ATkv/+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jue-00000007qoj-0d9F;
	Wed, 23 Sep 2026 10:09:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jub-00000007qoB-0OLZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:09:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49e65a8f70eso30575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790158151; x=1790762951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NMB6bu75t+ZZ5TxFVUnvCCWgfugEUPmSZZ3Ssad5w0I=;
        b=AszWacmeZlJqeqHzyr+XFU4+6cN9yk0rd9sMQ+5aj/eQUMcciUDWgvO2dOQfmOUpea
         Sv4f+6taSRuBGvF/SqJvyaWrnh5Ka56wdfPnj5NO0yiQDwj5K8IsNJroIhYvrN6P0CyV
         V9hDIVqoiEha3UL6fH3FJP8o8ddLDQ+n4JvdiSO0anoSLZyoITP/eu4CfhXYdn/f55Ky
         gPo20bYAoI2bCvAp2+3VMp8AEpk/0Q+v3VMqPb8WOeVNm/LB1hay9JkRO9KrPN/54vvN
         8Y5CgCX5pXE/IDh7Ks2e8bZnR3sO6p/fd/d06qyN828r2MLCKi6b6K2tnHpazLWhHsxk
         JeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158151; x=1790762951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMB6bu75t+ZZ5TxFVUnvCCWgfugEUPmSZZ3Ssad5w0I=;
        b=AVzJ+TFttC/m/6j9WcWZA+KfXa8TagHo6oBz5vdJY1h3s9LlYHtZpRkLR6iCBRsn7I
         dvQxE8JNQiBagFtLaK7sVpqSJAhvjYPHJ80NOZXQIxfiJb9j00KrPTEzkbrr/YC+dTXc
         7vfQQju9EMOA/Q77EhBnv7jXpvxI6G444c0Bo3B6Ih4bxiMtSAeY9wLM1LnRRboIWeiD
         sJmtqA18Q1hV11ce9haoahVlAyYAFEdUEDhy74hxWtCkLVAJMmmNnSvGec76IVAGB5KJ
         jZfpOVv9oFvsURSoft/+gn3OeHwC1kMVGZgQmUrL2RqBcmQE8cFfqKW5RVqbKIknrYyT
         kxcw==
X-Gm-Message-State: AFuF++nhiV6tGTxkuOtavA+UgpQMZm3boDiQ4VxNwu7zjFx8FT+7Aoli
	CrTpCXqE9q4rWlWmvx+3c4lhVhjO4V+rN1Yz5K8utTCotMPjBMNRPSa0GGGwB3T8WA==
X-Gm-Gg: AYBFou2VajoxVorFEwVUz5wmlh6GqYl99y23FfYfGHcGxIFhlo0PuXMbU5v+5NBsk3G
	rvZm9xMcDdrZzb+Y30C5bF0bKiyK1Ia43eFrCNv+9GyxxrEOAqeDk5HclwOMnkgr187z0K7B6w2
	9E+p8rvPAkIVECKiBeZpJlUvQ/AFd9AwL79Y8YOmL/DSfSJNYjxyl6n/HX51Hvzdu7m/Cpalu1C
	5eYwchk0pkk3834mQ0s1W+8+kA9Rfh+PbOp2Lfhbtj4ZXnO8KSayrXopNldgjYTWTeKuKbHHfwL
	sHNxuPiS7wv0k9PYzhBKQbDBsV7aKZhoQRaLu1l1/1cDuykPQkI097wXH/kic/VdBiUz2jP3Beb
	tT2GMh4r8FvcEQalmX5qyD4kaI3YE9k2LObBcrewBz5x6gE5hUnR1Qy/qmFNrp1hPM2xroiB/0G
	osXTThKLBC+vWoGNj9EExvNQDRpTJzn87OYe1HcIlO3OP21djIU8l+hrmsNUluc7EsCqbPak+fh
	7Yk6Lirzpfh5747z748UVx6UwJlm8uA01AdVr2i3ASO+sM4IY8=
X-Received: by 2002:a05:600c:8588:b0:49f:e185:f3ae with SMTP id 5b1f17b1804b1-49fe185f460mr486475e9.2.1790158150774;
        Wed, 23 Sep 2026 03:09:10 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18555bsm68255055e9.2.2026.09.23.03.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:09:10 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:09:06 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 04/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <arOlQtPYzF5yT8fP@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-5-smostafa@google.com>
 <arLa0E3xq5dGuPpd@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arLa0E3xq5dGuPpd@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_030913_252616_3F65573B 
X-CRM114-Status: GOOD (  37.23  )
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

On Tue, Sep 22, 2026 at 12:45:20PM -0700, Nicolin Chen wrote:
> On Tue, Sep 22, 2026 at 01:12:37PM +0000, Mostafa Saleh wrote:
> > Move parsing of IDRs to functions so that it can be re-used
> > from the hypervisor.
> > 
> > As the new functions operate on structs from both the hypervisor
> > and the kernel which would be different, we rely on the compilation
> > unit to having ARM_SMMU_OBJ point to the correct struct; some
> 
> s/to having/to have

Will do.

> 
> > best-effort static asserts were added .
> 
> s/added \./added\.

Will do.

> 
> > +#ifndef __ARM_SMMU_V3_COMMON_LIB_H
> > +#define __ARM_SMMU_V3_COMMON_LIB_H
> > +
> > +#include <linux/build_bug.h>
> > +#include <linux/compiler_types.h>
> > +#include <linux/kernel.h>
> > +
> > +/*
> > + * The IDR probe functions are used by the kernel and the
> > + * hypervisor drivers where ARM_SMMU_OBJ might be defined
> > + * differently.
> > + * Ensure fields used by them are defined and has the correct
> > + * types.
> 
> s/has/have
> 
> We have 80 cols per line to write comments :)

Will do.

> 
> > + */
> > +#ifndef __KVM_NVHE_HYPERVISOR__
> > +typedef struct arm_smmu_device ARM_SMMU_OBJ;
> > +#endif
> 
> It's probably safer to include arm-smmu-v3.h so everything would
> be self-defined.
> 

Yes, I was not sure about that, I was thinking of making this file
included strictly after the struct is defined first but I didn't
find a suitable place for that.
So, I can just add the include here before the typedef.

> Also, Jason's suggestion in v7 was hyp_arm_smmu_v3_device, which
> looks nicer than ARM_SMMU_OBJ...
> 

I think having another name makes the code more readable (not sure if
some tools can be confused also) than renaming the hypervisor struct
to the kernel one. That makes it clear what is the intent of this.

> > +static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, features), u32));
> > +static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, options), u32));
> > +static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, oas), unsigned long));
> > +static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, pgsize_bitmap), unsigned long));
> > +static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, base), void __iomem *));
> > +
> > +void arm_smmu_device_iidr_probe(ARM_SMMU_OBJ *smmu);
> > +u32 arm_smmu_idr0_probe(ARM_SMMU_OBJ *smmu);
> > +void arm_smmu_idr3_probe(ARM_SMMU_OBJ *smmu);
> > +u32 arm_smmu_idr5_probe(ARM_SMMU_OBJ *smmu);
> 
> Can we use "arm_smmu_device_xyz_probe" matching with the existing
> arm_smmu_device_iidr_probe?

Sure.

> 
> > +	if (coherent && !disable_msipolling &&
> > +	    smmu->features & ARM_SMMU_FEAT_MSI)
> > +		smmu->options |= ARM_SMMU_OPT_MSIPOLL;
> 
> Will pKVM ever use MSIPOLL?

No, this version does not support MSI and hides it.
And this check can not be moved because disable_msipolling is a
module_param.
Although it might be possible to pass it as an argument to the
function and assume (smmu->features & ARM_SMMU_FEAT_COHERENCY) is set
based on FW before the IDR probe similarly, no strong opinion, so this
part can all be moved as is.

> 
> > +	if (smmu->features & ARM_SMMU_FEAT_HYP &&
> > +	    cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
> > +		smmu->features |= ARM_SMMU_FEAT_E2H;
> 
> Why is ARM64_HAS_VIRT_HOST_EXTN left behind?
> 

cpus_have_cap() can not be used in the hypervisor.
Also, ARM_SMMU_FEAT_E2H is not exactly FEAT_HYP. As it defines the
world the translation lives in based on the kernel EL.

With pKVM at EL2 ARM64_HAS_VIRT_HOST_EXTN is always true anyway.
And the hypervisor never owns a page table itself, so it never
checks this feature.
Otherwise, I think we can move this check and use cpus_have_final_cap()
instead as it can be used in the hypervisor.

> > -	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
> > +	if (!(smmu->features & (ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
> >  		dev_err(smmu->dev, "no translation support!\n");
> >  		return -ENXIO;
> 
> This change seems unnecessary. The code above and below this line
> still uses "reg" returned by idr0_probe(). So, the original code
> should have read well:

True, I will change it back.

Thanks,
Mostafa
> 
>         if (!!(reg & IDR0_COHACC) != coherent)
>                 dev_warn(smmu->dev, "IDR0.COHACC overridden by FW configuration (%s)\n",
>                          str_true_false(coherent));
> 
> 	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
>                 dev_err(smmu->dev, "no translation support!\n");
>                 return -ENXIO;
>         }
> 
>         /* We only support the AArch64 table format at present */
>         if (!(FIELD_GET(IDR0_TTF, reg) & IDR0_TTF_AARCH64)) {
>                 dev_err(smmu->dev, "AArch64 table format not supported!\n");
>                 return -ENXIO;
>         }
> 
> Nicolin

