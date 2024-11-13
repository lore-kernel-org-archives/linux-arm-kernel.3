Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EDED597C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 01:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/yyOuGNVIzT+zYvh4v3hplD3RNbNSCQhrz/FBYBpRw=; b=eK2oe1YtPRtwO2w/k3QMMTpf5O
	vATUrmxZv2k0vWUzyy7RvF+6a/dcQ4wdS3URVZbg/n4WbZERn08PVfEcW4V0/g86yQ3w3BqzcQ765
	+y0QaWLkOfkcma4r3/rqnsj1qdGlOxN5nxt1V18bLfKUQByl2JZ0p2+xUHUSjCMSft/k4bwUx3duc
	ooSY+oGLl9/trQJdXFtrjJ2Lyvjgzhn6LUQxUXonvTU06fMCKnMs4y1/3TOb9n/GaIFc1cZ0XZdlV
	Nk5Lkm6DaOxPy0cS4i3IFpgtyB9hkBAmqs4OqiE+GKVQ6WmG+chBwwCjfut6+2OXM+h/+bliHRZtn
	C/SIhZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB1nf-00000005TYr-2Kg6;
	Wed, 13 Nov 2024 01:04:03 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB1lb-00000005TLk-2veL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 01:01:57 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539fe76e802so7009632e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 17:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731459713; x=1732064513; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X/yyOuGNVIzT+zYvh4v3hplD3RNbNSCQhrz/FBYBpRw=;
        b=jc+KhD5Vj65e/Lh0lVTn7Mp4Wb/hnp+5bfnj+7TZUBattZh277DaWDbzchmfe2gVwx
         t7pM7lzBPSWJFUqrKq8ma8YlEuQxHQPl7NOZKMSj6dtaUswYw2JD1q1CRERk91H3V37k
         50kmvB6n+ivYavFSrwbpx35eonyczuAAIupURqjlyYGPfLLkesyuMmlE4IP8JWaYHuLX
         t5f5RSksckJBQIf4LiUGAyliEz9Lz6el+vqBzaxkeK4aUyai+CYm0h9ocF7GmQhqU6vz
         kysUSRiV/1jHKcjaaHV5bqF45w17bIwnTvGHhtfyVgU2Tbr3j7BmuIEOdQm+zuUFtkUQ
         uqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731459713; x=1732064513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/yyOuGNVIzT+zYvh4v3hplD3RNbNSCQhrz/FBYBpRw=;
        b=ZxISAVoj55KWsEOH8ZaQFHDjVuXlF7nXPhr5tgURCK+8xyu4pP2L7hGgvzhPvugEct
         6Q+Bda4o44inqol8/2/NJE5ejulivRlWELJnDlrcWKTT0tDTQ5hoe//fE3e0sAk2HeGu
         FlzqWekm8y03awKRDCWYeM+d/3hbHRpmATiIDIA8CV6KEqFxo1V2bUz1AbFXLl7aBGit
         KlXRsNBB3kfg1hc0vIXEjDQatp4KvZkR7Hq6GXsAS4wVowaHxPgQHY2pa/3JWf4gAp3o
         J/wQvAfqfsVwegF9WpHDIoc939wCEIqt/ULOOO0qnJun1QdQTYYMjEHJLvI9JyIklTvw
         4aLA==
X-Forwarded-Encrypted: i=1; AJvYcCUhturiKfwyKUX4yLuVK/bcjtGjUzORcSq+vJdnOqZ2M61mS+CuL8MMaWZHP1/a8Lzxml14zSDwuMmrvgIznM6V@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg6OSi196Ex6fFVsF+A6GBqfQYsNPWwfVGdYGFDlLA30C7jaUy
	TFH9IsKAr7ExyxN007FUApHYsPiVv9ltLdYbLcAhLyqSRnck62iM98LBOLAHs9FHCuXwZ72YkiC
	OabPTSqWaWgnkvZqVUSDZ8G1QUiJ5MwXQKJYdqg==
X-Google-Smtp-Source: AGHT+IGrTpBP4XZN2inszS5LiWIDhaTOAjWYv1IN45jLudjPrpRKEn2OnUUglHnQBM+zZuWyWdAuDjaQVoneTf1/DNk=
X-Received: by 2002:a05:6512:ba0:b0:539:e436:f1cd with SMTP id
 2adb3069b0e04-53d862d38c5mr9315032e87.16.1731459712927; Tue, 12 Nov 2024
 17:01:52 -0800 (PST)
MIME-Version: 1.0
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com> <20241112182938.GA172989@nvidia.com>
In-Reply-To: <20241112182938.GA172989@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Wed, 13 Nov 2024 09:01:41 +0800
Message-ID: <CABQgh9HOHzeRF7JfrXrRAcGB53o29HkW9rnVTf4JefeVWDvzyQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Initial support for SMMUv3 nested translation
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Williamson <alex.williamson@redhat.com>, Donald Dutile <ddutile@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jerry Snitselaar <jsnitsel@redhat.com>, 
	Moritz Fischer <mdf@kernel.org>, Michael Shavit <mshavit@google.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	patches@lists.linux.dev, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_170155_775091_68C6596D 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

On Wed, 13 Nov 2024 at 02:29, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Wed, Oct 30, 2024 at 09:20:44PM -0300, Jason Gunthorpe wrote:
> > Jason Gunthorpe (7):
> >   iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED
> >   iommu/arm-smmu-v3: Use S2FWB for NESTED domains
> >   iommu/arm-smmu-v3: Allow ATS for IOMMU_DOMAIN_NESTED
> >
> > Nicolin Chen (5):
> >   iommu/arm-smmu-v3: Support IOMMU_VIOMMU_ALLOC
> >   iommu/arm-smmu-v3: Support IOMMU_HWPT_INVALIDATE using a VIOMMU object
>
> Applied to iommufd for-next along with all the dependencies and the
> additional hunk Zhangfei pointed out.

Thanks Jason, I have verified on aarch64 based on your
jason/smmuv3_nesting branch

https://github.com/Linaro/linux-kernel-uadk/tree/6.12-wip
https://github.com/Linaro/qemu/tree/6.12-wip

Still need this hack
https://github.com/Linaro/linux-kernel-uadk/commit/eaa194d954112cad4da7852e29343e546baf8683

One is adding iommu_dev_enable/disable_feature IOMMU_DEV_FEAT_SVA,
which you have patchset before.
The other is to temporarily ignore S2FWB or CANWBS.

Thanks

