Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD88D13569
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 15:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4R7lu/kAshlAJXnNL3llyVtKBCbHq8h1Es4W4nUkAU=; b=E3onkEJTSTBGx1xNd6WzMYKAc3
	xzAEYhNGwjyGwM2Bc6lzBy+OsdycWDANi+L4HzePiVP/gpbR8xYMpLg6mKiyz7sxCKWcXJdfDxVYL
	fIXgYxC7njU2odxc29TT3/CViIxzg//rGUrf9bwIefgcieSFLwFmSbQ90py+7gwKErfVNo3qzIrFF
	JQAaogaFh+SRHY+MrVBQwIiwfA7YQ/yI/b+zxSd/K+p4SXcL/GjvT8Ir3I0nAiPoq1IAm02JjTAtB
	unUu/eL0bpvTiT8ZqYTvUXBfrfP0k2JWDhkF6mRGqpzOkpZwHLvXmkvU0bYL9PW0IcEGdaTWob/O9
	fPbNXb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t54oa-00000008SNW-1uIj;
	Sun, 27 Oct 2024 15:04:24 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t54n0-00000008SGa-0yk8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 15:02:48 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb443746b8so32568361fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730041363; x=1730646163; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x4R7lu/kAshlAJXnNL3llyVtKBCbHq8h1Es4W4nUkAU=;
        b=A2Pb4hgDXmtAdD1hdzsG9YZAO9EEzgYkBoCqrvICADE9XsOb0N2a/YMRpEwUs4hR+B
         kqXUZ0fDas8QWh2DAew5LMgwlv3wmRV0KoySQn9zRmuYgI9pGxFcgfagce2e4zvVuYa2
         ZEbNaU4oItdlQV2d+uZ6WLsvJil50XMc3nNv681nrtf+preyTPVI/lRsKRLlLDmz9VpW
         GXXziUt+T4JyJ6Q0G4AszScDJIJkoEwRs8i3TECry73kG/x1XH+waEq6KMr0gHEl4F3d
         nrWhFW+pJvKtMyDNkeVseEp0Vrw0HzhMHmLerWP3mkhXXFbfVhnUaTyU/rzF8qudtgDF
         dSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730041363; x=1730646163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4R7lu/kAshlAJXnNL3llyVtKBCbHq8h1Es4W4nUkAU=;
        b=HuXqjyhSUIcUx4SY62KfvzLtIxYHto/6aQTKUgGHgYwogdjgAxI/iZPdmKvOBl0vSG
         h3sh18OFF6dS7bYJ9KWW0ViRjFHBmyJY2fc+Y69sjBhfTTYU49Dvf/PNSdILSTPyBKwe
         nFucAbKUQ28+ES/sLgWxndV/cdgqEVKtoNb8WQSYjxWSuZXeKijsFHjiV9LJVpwRkbmx
         5X+r7WVP9eyqHh5mMPEHkMim4wwKrHadNr1sCAr96F/9cLfCDxjw4STLNDtCWeb3BxHa
         1le9cgVgtSfEPoCf+2Nzlx+hki3XutpyKfyROshWwXxnDv4e9+oliXyeH5pw0T+n7n9i
         2Reg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+dghUa7rxKVWtTc47oSHabWHL3RbqGXfWzuVfz83GPkIo1v43oP3J3WtwAKSiAlh8oCFwHjSHWmz75IgNJf0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+nBhgu9j2Wq2ECZR0u8rmqNcUA2sVwbfzlGHo29SDvsbSVFuj
	l2J3Vfy6oFxA0JQezc6mWOFjalr3CcIHUhUahyGkEMGWt7dGAgHm6cHsVcV8k+Yuu3Jn76Tuyjn
	jIp6gOHOT+47SCEk37uQ6KgHnIlYz86wTmvdXKQ==
X-Google-Smtp-Source: AGHT+IFqLjsyKJ5CxjDNJGvvyW3lXMFUulX6UFQluIj2OcmHgocN09ZljnrI5ISQ8+uIxzhs+el7dmiVvKGjST2wbUc=
X-Received: by 2002:a05:6512:1092:b0:53b:20a1:1c4a with SMTP id
 2adb3069b0e04-53b34a19077mr1821924e87.42.1730041363426; Sun, 27 Oct 2024
 08:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729897278.git.nicolinc@nvidia.com> <384f7b4333a1f75da09e390902b8f82be21a0dd3.1729897278.git.nicolinc@nvidia.com>
In-Reply-To: <384f7b4333a1f75da09e390902b8f82be21a0dd3.1729897278.git.nicolinc@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Sun, 27 Oct 2024 23:02:31 +0800
Message-ID: <CABQgh9EpGPwdQhv7mepiMGVgR-8NMx5dcXyJ2A92W8ZzQt3bJw@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] iommufd/viommu: Add iommufd_viommu_find_dev helper
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
X-CRM114-CacheID: sfid-20241027_080246_318592_B8A57263 
X-CRM114-Status: GOOD (  19.60  )
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

On Sat, 26 Oct 2024 at 07:51, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> This avoids a bigger trouble of exposing struct iommufd_device and struct
> iommufd_vdevice in the public header.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommufd.h        |  8 ++++++++
>  drivers/iommu/iommufd/driver.c | 13 +++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index 0287a6d00192..dc174d02132b 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -184,6 +184,8 @@ static inline int iommufd_vfio_compat_set_no_iommu(struct iommufd_ctx *ictx)
>  struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
>                                              size_t size,
>                                              enum iommufd_object_type type);
> +struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
> +                                      unsigned long vdev_id);
>  #else /* !CONFIG_IOMMUFD_DRIVER */
>  static inline struct iommufd_object *
>  _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
> @@ -191,6 +193,12 @@ _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
>  {
>         return ERR_PTR(-EOPNOTSUPP);
>  }
> +
> +static inline struct device *
> +iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
> +{
> +       return NULL;
> +}
>  #endif /* CONFIG_IOMMUFD_DRIVER */
>
>  /*
> diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
> index c0876d3f91c7..3604443f82a1 100644
> --- a/drivers/iommu/iommufd/driver.c
> +++ b/drivers/iommu/iommufd/driver.c
> @@ -36,3 +36,16 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
>         return ERR_PTR(rc);
>  }
>  EXPORT_SYMBOL_NS_GPL(_iommufd_object_alloc, IOMMUFD);
> +
> +/* Caller should xa_lock(&viommu->vdevs) to protect the return value */
> +struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
> +                                      unsigned long vdev_id)
> +{
> +       struct iommufd_vdevice *vdev;
> +
> +       lockdep_is_held(&viommu->vdevs.xa_lock);
> +
> +       vdev = xa_load(&viommu->vdevs, vdev_id);
> +       return vdev ? vdev->idev->dev : NULL;
> +}

Got this error?

ld: Unexpected GOT/PLT entries detected!
ld: Unexpected run-time procedure linkages detected!
ld: drivers/iommu/iommufd/driver.o: in function `iommufd_viommu_find_dev':
linux/drivers/iommu/iommufd/driver.c:47: undefined reference to
`lockdep_is_held'
make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
make[1]: *** [/home/linaro/iommufd/linux/Makefile:1166: vmlinux] Error 2
make: *** [Makefile:224: __sub-make] Error 2

