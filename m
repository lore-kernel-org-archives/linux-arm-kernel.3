Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81D4D40CF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 05:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AN4uQlg4JmmnskoZUbD9ajWs6/v+l9dkVw03I1zm8cw=; b=fp2PL6JkPZnE/o6nzklDxOBBA6
	i6YllbOonTbqamg9hPL3tLSmcjq8IJjwlqZkLCNif3BjTIpS197a7AIOtWYts/sxKsZoGz0Op06mG
	9Jx7HVMjSST8A5DkojRmyms37ovjM7wl7M3oMnyS1xStCFBC+jsMj7JA1JK+WV/mwOElmFbehROXa
	zwxf1pKU7HsAIfVekTmhw5jwG6CSmZmnZ4J80VaoDhA1tDl+WjM8hS+59Uo/TPyh/jS0utWUlg5l5
	YJE9k5CSoxJgHCDqZlMDGitpp2KEkCPaVB+xC+Ip6MoegftQQ08d0TK9+KHlDzV4+HUuVGUurlJOj
	kO6XrzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Yn3-00000001su8-40AI;
	Wed, 06 Nov 2024 05:41:13 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8YlL-00000001skf-2neD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 05:39:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53c78ebe580so493326e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 21:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730871565; x=1731476365; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AN4uQlg4JmmnskoZUbD9ajWs6/v+l9dkVw03I1zm8cw=;
        b=qk6ZJj9dqqPtR4O9NWJHKKVDIBdo6UB+US8GZdSscK0T6aUJc8I9POIfoqcQG0m8x6
         ZkbMfdAu84eGTP4MVcR4I3h5BfFaUz7r0L+UGQVydmI/lOGDgkpTkRZH8o3Zqrg4xsLQ
         Ycanw2YnXOiVG3fhLkk0wBQkfyQhAjgAs8s+Ev2arWgSk9C/zVAXH0XQpuvRPpbgoijh
         Eh5tYFD4kSla3YO9piqeYPwbX8+eCj7LmuEmn7PwpR1nYx3ffeK430wX/fkLIpVfgG+y
         qm+OdhgL1htScLylJKlzxs7F5bQOaY7VwqiLqkmMZpy8su4wlFr8fVklzXFWwUjLEClB
         lxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730871565; x=1731476365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AN4uQlg4JmmnskoZUbD9ajWs6/v+l9dkVw03I1zm8cw=;
        b=IrjL0zkIohyTceUNS3fiupFZ4TKGaXoAPsE37BjEZAQceorm07DMud1b6bODIagMW4
         xqBW34aFj4AM6XoaY7x/NtgLjgBpXz1teZ5bWt+3dREErdJ//m5MVF+JeDEZYbsdxO6W
         njGon++SwG6R+mPXcWsHHMv7rI/L68bVD6hKAsJzVCbuBcSKNtu6+tepQm7/T8SE4dMn
         iEW1bKdFtg/rvtanKooO5lTJaPQqECXUzwqmxaLNJjJzeSWOAUCMCsw2aWFBHbj/8PoA
         d0onpDn3vyXNAdFBE4ADEeqyqqky/6cnRfMhOiTwMLPsd/Rbz0VAIRhG5hVZDXKmvO+U
         EJgA==
X-Forwarded-Encrypted: i=1; AJvYcCVAj2IGZJHmTowgIjqdmvs73ck1lb4WGPDnV93Rlv6KUJ3apSS79E+uMhOtpHe4WkcZHQ/036FqR8930ymI9D8w@lists.infradead.org
X-Gm-Message-State: AOJu0YwS5DNFloYeAx3SqGE5ZD7rUyl1z35bSKZfwsnPr2gpZoqCt8h4
	Vf2KGhs1zBxuUpesF9mXSM1TovJgOcqAHSrUVMV5Cx7fvctlhWegqnJTZ44l2N6qOYQbFG3Px6n
	V+3Va3Jh6SE3fqRn85o5M8VwF+sJzDzTB1r7qgfX2IaY5Cl2KKmht7dy9
X-Google-Smtp-Source: AGHT+IHkFZmS15Yat+yA6wTIjddaBPNP6Qu4/1YXgkU7r7C/EE/mZc+JCaJP3gRrzyZ+p7mBuvSg1qn/MJDQimjHDOk=
X-Received: by 2002:a05:6512:4803:b0:53b:1ede:9174 with SMTP id
 2adb3069b0e04-53d7cff7502mr316569e87.28.1730871564937; Tue, 05 Nov 2024
 21:39:24 -0800 (PST)
MIME-Version: 1.0
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
 <9-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com> <CABQgh9HoGFGDTEqziQt6WrJ7Bm9d-0c259PYsms3nOVEidn5BA@mail.gmail.com>
 <20241104171931.GB10193@nvidia.com>
In-Reply-To: <20241104171931.GB10193@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Wed, 6 Nov 2024 05:39:13 +0000
Message-ID: <CABQgh9HSAhat3_P43F_z07oqDaJ9h_YrZ-+SdHZ=ijzrZD1CVw@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED
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
X-CRM114-CacheID: sfid-20241105_213927_748388_2634D88D 
X-CRM114-Status: GOOD (  19.66  )
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

On Mon, 4 Nov 2024 at 17:19, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Thu, Oct 31, 2024 at 02:21:11PM +0800, Zhangfei Gao wrote:
>
> > > +static struct iommu_domain *
> > > +arm_vsmmu_alloc_domain_nested(struct iommufd_viommu *viommu, u32 flags,
> > > +                             const struct iommu_user_data *user_data)
> > > +{
> > > +       struct arm_vsmmu *vsmmu = container_of(viommu, struct arm_vsmmu, core);
> > > +       struct arm_smmu_nested_domain *nested_domain;
> > > +       struct iommu_hwpt_arm_smmuv3 arg;
> > > +       int ret;
> > > +
> > > +       if (flags)
> > > +               return ERR_PTR(-EOPNOTSUPP);
> >
> > This check fails when using user page fault, with flags =
> > IOMMU_HWPT_FAULT_ID_VALID (4)
> > Strange, the check is not exist in last version?
> >
> > iommufd_viommu_alloc_hwpt_nested ->
> > viommu->ops->alloc_domain_nested(viommu, flags, user_data) ->
> > arm_vsmmu_alloc_domain_nested
>
> It should permit IOMMU_HWPT_FAULT_ID_VALID, I'll add this hunk:
>
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -178,12 +178,18 @@ arm_vsmmu_alloc_domain_nested(struct iommufd_viommu *viommu, u32 flags,
>                               const struct iommu_user_data *user_data)
>  {
>         struct arm_vsmmu *vsmmu = container_of(viommu, struct arm_vsmmu, core);
> +       const u32 SUPPORTED_FLAGS = IOMMU_HWPT_FAULT_ID_VALID;
>         struct arm_smmu_nested_domain *nested_domain;
>         struct iommu_hwpt_arm_smmuv3 arg;
>         bool enable_ats = false;
>         int ret;
>
> -       if (flags)
> +       /*
> +        * Faults delivered to the nested domain are faults that originated by
> +        * the S1 in the domain. The core code will match all PASIDs when
> +        * delivering the fault due to user_pasid_table
> +        */
> +       if (flags & ~SUPPORTED_FLAGS)
>                 return ERR_PTR(-EOPNOTSUPP);

Thanks Jason, this works

