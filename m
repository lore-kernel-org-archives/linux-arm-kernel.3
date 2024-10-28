Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFB3D13597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 03:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPB781Fw9J1BfJU7n/hLb4L32sFtxc+a4gofCEvfGmg=; b=ykEGSK/rs8kVghhgpuGM7scN8O
	7Be8kDtJBY1WIAXGAexRRr01l7dvEqFud26rHLAyvaQn+Bjyo4PC1fs0RaxRGww8pJ/cnCqgaxidk
	3YWcC/0Ey5bgXCDyJyyN/Qt1KLvHBOhuR6IHCrsQl5Wl/x73CeQ5FPku5T6aCwq9duCviso2uNL35
	BxML/bltFtLFVmhdGb534QwdmW+ysuRJeU1JIjCx5hgMbwoB0oxClbzzTWouY0SgbnnPMNR6S8CVS
	eOMjMGWkmEqMjw84W8Zi0Xoq+ed4FwPzmRiDRiCAzTcDRrK+xzBENhYuZQHLPGI30vV8+f+J0/QlR
	r4ZN9pJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GcP-00000009SSf-1Kly;
	Mon, 28 Oct 2024 03:40:37 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GMi-00000009Qp1-226g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 03:24:26 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539fe02c386so4520171e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 20:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730085862; x=1730690662; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tPB781Fw9J1BfJU7n/hLb4L32sFtxc+a4gofCEvfGmg=;
        b=DtRqBRx+vcQkBi3fpn3XiJ+EyOQCIt4zzrL3exi7/fzDal9kr96VJM4QqifbC6pvqA
         g9vWvBsKwQ9i4fgGGNpOjHQ3yUX8V8dvUR5//phsjgAyJXhOawO1jywk6ERtQXd2231H
         xAl/eRuh2fSUQGo5ESAabUMGWORB+0LyNySiUMb5sVAs3iMk7sRLYwEiMs40U6Ih03Vi
         zgdzMvN8SwLj9UVJMzpUN7GHru4/o50LBaTU//L8vfqSRjKed5hp1yXauVl2/p/SXTOw
         wBmD7ah3/1qyXq7n+5LfWqEH7vjBsFe8vLVonIVonngjZtn/KW7eIsa6ZKJKb6LbHRGL
         hCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730085862; x=1730690662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPB781Fw9J1BfJU7n/hLb4L32sFtxc+a4gofCEvfGmg=;
        b=jXn5nGzoxRZ2QXa7Gs+V0F+dqqDeIj2npGGpDCHvRzPvUE5XpWt9S4AI9NoBr1OybX
         wRFN6BWu6ZKJzrKPCNN1/wkBh36BqZz5MquPagh45KLRUqv3S9XrwisGBFTrkUukQLwa
         QEQfRTZ6rYsLHFDQlm9k7UnJ794zGnHmaqS1WVIczFKl6hPMXNsNi+wEhnpRysf+8XZM
         oWNWwVJ5HUpfSoVzn7RMMtrEn/pBrWXSOiZhFI95s9sa7hl2vxNGbXyeQYlacQnaNbje
         MCCX6AKH3D/cBX45Bi7hXXNb/D1kM9w7ORoY4Ab66c3HsncFsOuCskyPRZojo1ez7O9I
         cvxA==
X-Forwarded-Encrypted: i=1; AJvYcCUhmRlpXrYWEwlYqIphqDMq9Ko+7Gs+b7/PDEzEZei77hVZrSCbDtcmAAUmxpK6Fm55O1nrW/o+b+zi710j6THC@lists.infradead.org
X-Gm-Message-State: AOJu0YwITIC7WAov4nh4PvDtA9z/1taOESrNDc8dttk4LtRxEqN0Kncv
	KFz7wEaygAOeHjlWeGAAerFj/nyDzGnGCXuFreG+Nffcg7GrKo2R2/x28FsmoYKXjsHU6EFY+EA
	GCowFv3g7sws4tKGsOxQGW3ZrRa5+b4SGVDL0gw==
X-Google-Smtp-Source: AGHT+IE3RYlMkjtpEmFCkSX9mMBH+mzTWtOwY6YLaPVzyehp5OXOXoK0z0ORaPfXJdTZ0CLfc2oO9l8aOUX21W6z4Ew=
X-Received: by 2002:a05:6512:3d16:b0:53a:423:6ea9 with SMTP id
 2adb3069b0e04-53b33e159a1mr2038562e87.13.1730085862110; Sun, 27 Oct 2024
 20:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729897352.git.nicolinc@nvidia.com> <4f5ed9d75c23a503ffe672a85cf9010569652794.1729897352.git.nicolinc@nvidia.com>
In-Reply-To: <4f5ed9d75c23a503ffe672a85cf9010569652794.1729897352.git.nicolinc@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Mon, 28 Oct 2024 11:24:10 +0800
Message-ID: <CABQgh9Gkt5tsw+wr_=WeA+m=Kz2xY5Z7aSBNhHCvBG2r=7O3TQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] iommufd: Allow pt_id to carry viommu_id for IOMMU_HWPT_ALLOC
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org, joro@8bytes.org, 
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com, dwmw2@infradead.org, 
	baolu.lu@linux.intel.com, shuah@kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com, 
	jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com, 
	shameerali.kolothum.thodi@huawei.com, smostafa@google.com, yi.l.liu@intel.com, 
	aik@amd.com, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_202424_582425_13B47B8F 
X-CRM114-Status: GOOD (  29.25  )
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

On Sat, 26 Oct 2024 at 07:50, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> Now a vIOMMU holds a shareable nesting parent HWPT. So, it can act like
> that nesting parent HWPT to allocate a nested HWPT.
>
> Support that in the IOMMU_HWPT_ALLOC ioctl handler, and update its kdoc.
>
> Also, add an iommufd_hwpt_nested_alloc_for_viommu helper to allocate a
> nested HWPT for a vIOMMU object. Since a vIOMMU object holds the parent
> hwpt's refcount already, increase the refcount of the vIOMMU only.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  1 +
>  include/uapi/linux/iommufd.h            | 14 ++---
>  drivers/iommu/iommufd/hw_pagetable.c    | 71 ++++++++++++++++++++++++-
>  3 files changed, 79 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 9adf8d616796..8c9ab35eaea5 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -288,6 +288,7 @@ struct iommufd_hwpt_paging {
>  struct iommufd_hwpt_nested {
>         struct iommufd_hw_pagetable common;
>         struct iommufd_hwpt_paging *parent;
> +       struct iommufd_viommu *viommu;
>  };
>
>  static inline bool hwpt_is_paging(struct iommufd_hw_pagetable *hwpt)
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 3d320d069654..717659b9fdce 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -430,7 +430,7 @@ enum iommu_hwpt_data_type {
>   * @size: sizeof(struct iommu_hwpt_alloc)
>   * @flags: Combination of enum iommufd_hwpt_alloc_flags
>   * @dev_id: The device to allocate this HWPT for
> - * @pt_id: The IOAS or HWPT to connect this HWPT to
> + * @pt_id: The IOAS or HWPT or vIOMMU to connect this HWPT to
>   * @out_hwpt_id: The ID of the new HWPT
>   * @__reserved: Must be 0
>   * @data_type: One of enum iommu_hwpt_data_type
> @@ -449,11 +449,13 @@ enum iommu_hwpt_data_type {
>   * IOMMU_HWPT_DATA_NONE. The HWPT can be allocated as a parent HWPT for a
>   * nesting configuration by passing IOMMU_HWPT_ALLOC_NEST_PARENT via @flags.
>   *
> - * A user-managed nested HWPT will be created from a given parent HWPT via
> - * @pt_id, in which the parent HWPT must be allocated previously via the
> - * same ioctl from a given IOAS (@pt_id). In this case, the @data_type
> - * must be set to a pre-defined type corresponding to an I/O page table
> - * type supported by the underlying IOMMU hardware.
> + * A user-managed nested HWPT will be created from a given vIOMMU (wrapping a
> + * parent HWPT) or a parent HWPT via @pt_id, in which the parent HWPT must be
> + * allocated previously via the same ioctl from a given IOAS (@pt_id). In this
> + * case, the @data_type must be set to a pre-defined type corresponding to an
> + * I/O page table type supported by the underlying IOMMU hardware. The device
> + * via @dev_id and the vIOMMU via @pt_id must be associated to the same IOMMU
> + * instance.
>   *
>   * If the @data_type is set to IOMMU_HWPT_DATA_NONE, @data_len and
>   * @data_uptr should be zero. Otherwise, both @data_len and @data_uptr
> diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
> index d06bf6e6c19f..1df5d40c93df 100644
> --- a/drivers/iommu/iommufd/hw_pagetable.c
> +++ b/drivers/iommu/iommufd/hw_pagetable.c
> @@ -57,7 +57,10 @@ void iommufd_hwpt_nested_destroy(struct iommufd_object *obj)
>                 container_of(obj, struct iommufd_hwpt_nested, common.obj);
>
>         __iommufd_hwpt_destroy(&hwpt_nested->common);
> -       refcount_dec(&hwpt_nested->parent->common.obj.users);
> +       if (hwpt_nested->viommu)
> +               refcount_dec(&hwpt_nested->viommu->obj.users);
> +       else
> +               refcount_dec(&hwpt_nested->parent->common.obj.users);
>  }
>
>  void iommufd_hwpt_nested_abort(struct iommufd_object *obj)
> @@ -260,6 +263,56 @@ iommufd_hwpt_nested_alloc(struct iommufd_ctx *ictx,
>         return ERR_PTR(rc);
>  }
>
> +/**
> + * iommufd_viommu_alloc_hwpt_nested() - Get a hwpt_nested for a vIOMMU
> + * @viommu: vIOMMU ojbect to associate the hwpt_nested/domain with
> + * @user_data: user_data pointer. Must be valid
> + *
> + * Allocate a new IOMMU_DOMAIN_NESTED for a vIOMMU and return it as a NESTED
> + * hw_pagetable.
> + */
> +static struct iommufd_hwpt_nested *
> +iommufd_viommu_alloc_hwpt_nested(struct iommufd_viommu *viommu, u32 flags,
> +                                const struct iommu_user_data *user_data)
> +{
> +       struct iommufd_hwpt_nested *hwpt_nested;
> +       struct iommufd_hw_pagetable *hwpt;
> +       int rc;
> +
> +       if (flags)
> +               return ERR_PTR(-EOPNOTSUPP);

This check should be removed.

When a user page fault is required, IOMMU_HWPT_FAULT_ID_VALID is set.
if (cmd->flags & IOMMU_HWPT_FAULT_ID_VALID) {

By the way, has qemu changed compared with v3?
I still got a hardware error in this version, in check

Thanks

