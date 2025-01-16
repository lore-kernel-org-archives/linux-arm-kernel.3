Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD6DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 03:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0k2tjWflbKcVqC6zMuhNKy98nVj8U7DcPtvNyfmp/OM=; b=mDL6lgD0SZVmg1stqaFScOiEBp
	xroPa2WOl3oTjKfFZIkGpb1WDOpZrj4rGk98++fXSw3hDhjenJ7gyk7YZ4o9s0fId1Zd0BVwjhobR
	0EMJfpp3Fn78SYoknJvz331CawIvWk3tQe3nY2xSE5+KBFBFx8M9ayGGouX5Vp+VJuNDJFMUcsVBG
	l6i9jraaQbsEbJMFIjCjXn9EfiL0NB4EjKyUFuBKme5xrrhnBM/8VKElOfppWtxJvYVYBckI/GJZi
	lBRFTAW2tOj9/3ljB2w4LHjtiEo6RZzyRwoY/ukOA/XtzcYFjhu/gAlR7wo7rs2kFGvn1pbEQhSir
	CoaQfKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGHJ-0000000Dhl8-10H8;
	Thu, 16 Jan 2025 03:10:41 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGG3-0000000Dhg9-073b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 03:09:24 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-215740b7fb8so73485ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 19:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736996962; x=1737601762; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0k2tjWflbKcVqC6zMuhNKy98nVj8U7DcPtvNyfmp/OM=;
        b=0I+ZPxPaQhtKIQVZ7KbtTg3jBkgCxJhnaPpfkRFIlwTCjZuGKCkDSJ1dFl2ilz6uXa
         31/ZPkWwx2jhTT2Sf+2IKeYcivf5Zm/dPg/3pUshnNbNGfb2ZVlNb/H42kVNHV5MpIAN
         YBkl5z/KPrdz1+7rnSmdnJIPqF7PVXViNTOUC0HLhdmCpP8DOTq/QiYuNMQw9j8BW/2O
         4UCOT4r38Jd9g8KtUHbQP0XuRo9acS8lamfx7VO4cABXeK4KXl5DtW5tyZEOiakvKSoE
         IH9ipPQ0wC/d900ABJYtm/0TB03OEjrIMm3EMyI9tqF3bnobh0zWlTueKuwafWjON7fx
         9vcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736996962; x=1737601762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0k2tjWflbKcVqC6zMuhNKy98nVj8U7DcPtvNyfmp/OM=;
        b=B0o/i5FtoPu+Lf8zM3OF2niM3YoHtezdiq4zXG5cwykAjIK9iK3rD2JEwhrXIe9Aon
         iwFUOKsymE8NOm5aHgzUPII+n5V8WhDHxf+/t04O2Roaosa7GLyN/GIJGzVmWaWGp0M+
         tGrBLmo6ulJOlaRApVPd1UCN3IZy2yrvzUYwdzJfxixSakDlsNKEgf6IML0FVv4skme4
         d8Fc3d0vTJR4n09CqzTdvVDJBFfVol8GrxWZ1XdVMCwHI65Zxz6/DSbO5/nb9AxA1hl7
         +OQmbkHcBervJmupzuio2uA6HeWxkXpmElXFbfiCAw5+Hf3Q1W3+YWqIkBVOZ2YXPQCr
         /DBg==
X-Forwarded-Encrypted: i=1; AJvYcCXLI1YuMjnWygl1TwG92GgQXSdQYDz/dVO0omCcACDOf1LmaC1UzoA1wS1HKj2dQ3UiyNOEMhC79PGji00PHq7b@lists.infradead.org
X-Gm-Message-State: AOJu0YwkNuifREYF7xsv+4xvX6l1hymQQSRFBPAGZYClcgtkLAqsYt94
	mZ+gAbBDSeE1Bo1VDnf4AWYd24Dd3JPpWB32QFuun0cQ315KYUuljbwy5Wztlg==
X-Gm-Gg: ASbGncsryLW+udK6V24O4kfFuduqxTEdlvfsXvnZUw+ZLvWL6WkEisnULKYMpgTAGPA
	7pZk/dsyWkXe0Hyz6s87h/vlN2E+Am+5HKcOViqX0Eml2+6fUESfQISkNnG9mMeqqO4ESgIbYN+
	1SF9+X01iM3HsadtbiBJIa0ONMhhXGimaUAM7K3keG0yO2vKQaoVbm/FlthHqHAsS8wSD0a7p8w
	vcYKtEMNqheYe1kZWjWKv2Mgy+ddKy9/WoDuV/qqOWqPxFRC5ZfiEs3r6A/9kZAk7XEKyOaD+q/
	q7Hf/86pZj+0
X-Google-Smtp-Source: AGHT+IHZcCbVA815LPJGb0bCjcocKzrwMS8Y8KUYeVaCrLeZOxiM8S63vOxnYqo99Qw0ZPV4r1BBuA==
X-Received: by 2002:a17:903:443:b0:21b:b3c4:7e0a with SMTP id d9443c01a7336-21c165a4395mr788135ad.13.1736996962080;
        Wed, 15 Jan 2025 19:09:22 -0800 (PST)
Received: from google.com (1.243.198.35.bc.googleusercontent.com. [35.198.243.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658b71sm9879160b3a.85.2025.01.15.19.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 19:09:21 -0800 (PST)
Date: Thu, 16 Jan 2025 03:09:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Robert Marko <robert.marko@sartura.hr>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	luka.perkov@sartura.hr, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: add missing header
Message-ID: <Z4h4WePiB7G0BZj-@google.com>
References: <20250114160630.1122885-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114160630.1122885-1-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_190923_065402_2FBFF09E 
X-CRM114-Status: GOOD (  16.43  )
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

On Tue, Jan 14, 2025 at 05:05:56PM +0100, Robert Marko wrote:
> str_read_write is currently undeclared and thus compilation will fail with:
> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1911:25: error: implicit declaration of function ‘str_read_write’; did you mean ‘sb_end_write’? [-Wimplicit-function-declaration]
> 
> So include the missing linux/string_choices.h header to fix compilation.
> 
> Fixes: f2c77f6e41e6 ("iommu/arm-smmu-v3: Use str_read_write helper w/ logs")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501111926.qOpnlK9J-lkp@intel.com/
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 0e4cbb2c64d7..a0e395da8a88 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -26,6 +26,7 @@
>  #include <linux/pci.h>
>  #include <linux/pci-ats.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>  #include <kunit/visibility.h>
>  #include <uapi/linux/iommufd.h>

Hi Robert,

This fix has already been merged to the arm/smmu/updates branch [1]
which should appear in -next when Joerg next rebuilds the branch.

Thanks,
Praan

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git/commit/?h=arm/smmu/updates

>  
> -- 
> 2.47.1
> 
> 

