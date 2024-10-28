Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2134BD33996
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYb/zBUosi1Aw03l7Ek5wmBbG3dG3J1OV92E6B3BlZg=; b=BabOUzPZyaNuzmHZYL6LtWvzG6
	3E6BCB9oFtSiKX+XYEz8w3z1DkMeUuL+p6ysDkMUQSSfIKQ9zby9JCQDXiZcmZVUf31cziuTfpHz7
	IXFdB0HpmSXuKf95bi1nMRHVgBdwuMfAR/PTUcT5oiXShri23ouLZDYezvlECH95zSfoGXHNbMHF3
	N+txgSmXLXUf9Lw78f6QtVqD2KudtEbPCzYwwbDh2IzoovRZEthZgvlksr/DuYfGIeXOELOl80yNy
	lZy4COuahpje0xRt+JvRbRMKaMiESErQN+wu/p3vpDAgew7pZGwOwI/QtuoMqSSWgrixssW3quugh
	zjr1f41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RXh-0000000BHvk-0kJL;
	Mon, 28 Oct 2024 15:20:29 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5R7v-0000000BCd0-2JpY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:53:52 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so4621183e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730127230; x=1730732030; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tYb/zBUosi1Aw03l7Ek5wmBbG3dG3J1OV92E6B3BlZg=;
        b=ygGeyc+KjUPBwgftGEqCIsuDo+m53ho8lY0saUivxAd7DBR4WJvm5PEd7753LV85OK
         paaxuLVSyYaDbxAjVoBoZ05pPuquQ7TYEyIFHucW5dvTNlKLjUHch8URu555soK7ejId
         Ddw6WNOZ33BC2cuzjipvNxHAGld1OwnccKs0TsvbsvxM7zqfTTi8lag5p8xsGjgLS9tK
         zSq+0pMsndYF79Pj9Dz3gXbgSzRIS0dZKvfvIgH7/CBxvSqQw12Wy9Lw6/X42WgeOYtU
         7Dk2NXC7z1ZT7vb0T1BLgxjQS4Vf0cUUht76W+CLbGx9mwRWoQGxvqBf5/8Jao3Wl4u1
         mv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730127230; x=1730732030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYb/zBUosi1Aw03l7Ek5wmBbG3dG3J1OV92E6B3BlZg=;
        b=uACduDCSotkJ7Ymqk0uHBzMbM5PAGDEOSblGY7bwjfzsJHrTW4QAsYdhnJ+d8cZTxo
         QlFcAjpYgUMdulQyOWV/5Se56b6HPkQO0J8VzcaSCLaRXFULYKoqfSvR9dG4mhc2B77s
         Km+QRE1IMvJ3uNADIk8JLaY4xLdJu5e6yV01v6khkkyjEdRHArtYnek+iQgb9btdWoX3
         iT8JIgo1NDP+gChfF+8/kJyKnOHXSv7weV512BLPeikDR5WkiaQiLfe4hXp/HaD6iptx
         gh1JAobV8UfrXuUtJLZYFPh7djYpIvsh4rFc8peBx+1AhsMxDbHdcLLiinJBqMXf/Wmq
         02PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkho5GqwJh2Kuydtle/i7f6D2iIB40DMtDJJt9uRK4W/NTKDBOQcqxgwNrZx9DtpUmWWQNXXVtK8jOdLKv9N0I@lists.infradead.org
X-Gm-Message-State: AOJu0YywtgQyQYeAj9kEIpR2wltObC9buTQYs7cAtzWSycsDBnuDgYl8
	T/dZv8DhQtTW0jVcnayfUUmUQwShNQlBkyEk8yhZ7hfwJ7dxj6oufFT7Vs9skrV44pPA9/3Nn9z
	YlNC4ucZf2LNUVuPlOvYCmOSpLrYdlwV/tklLSQ==
X-Google-Smtp-Source: AGHT+IGlKQWc3SNm51s3PmWaJ7k8IkmWwj+g1zwTCjME9I3N35fBxQXDjWPZqSRQvbi+ZoURs9MmaNgH4mwrA6FxW5g=
X-Received: by 2002:a05:6512:1590:b0:539:f554:78ac with SMTP id
 2adb3069b0e04-53b348b9125mr3453985e87.9.1730127229738; Mon, 28 Oct 2024
 07:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729897352.git.nicolinc@nvidia.com> <4f5ed9d75c23a503ffe672a85cf9010569652794.1729897352.git.nicolinc@nvidia.com>
 <CABQgh9Gkt5tsw+wr_=WeA+m=Kz2xY5Z7aSBNhHCvBG2r=7O3TQ@mail.gmail.com>
In-Reply-To: <CABQgh9Gkt5tsw+wr_=WeA+m=Kz2xY5Z7aSBNhHCvBG2r=7O3TQ@mail.gmail.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Mon, 28 Oct 2024 22:53:38 +0800
Message-ID: <CABQgh9EgXsyHDzZHK2FMuUw-eu9zeczyMGLTUjS3AKYUHKwwDg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241028_075351_617381_58B32028 
X-CRM114-Status: UNSURE (   7.72  )
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

On Mon, 28 Oct 2024 at 11:24, Zhangfei Gao <zhangfei.gao@linaro.org> wrote:

> By the way, has qemu changed compared with v3?
> I still got a hardware error in this version, in check

Found iommufd_viommu_p2-v5 misses some patches,
Simply tested ok with iommufd_viommu_p2-v5-with-rmr, (with some hacks)

Thanks

