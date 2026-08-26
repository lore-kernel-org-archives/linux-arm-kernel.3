Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D628DC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 03:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qWanT6gYm3HAacbnAtggJfeeI5p5/Qpb1KAGvhVW4U=; b=f/ATchta+HzJggjK/Z6upAQq+e
	BEdOgmoULDIcNSyjyweeL/GRzvEfoixg9O6gKj4n6xEhx4lNHE+jY7nwAxLXMuZWdyoOPX9i2vHbv
	0B5oWvXycO5JErxh4roy1VR2/bSEcSMq4iWD2MecAoOzMecQdrzHICbFftRVjJCxyUA7OB+T5FLF8
	u0zaaGbyQ+559lBc9uC2r+Et9RN1sS/XmhQQhTECAhzNxutfo1F/KL0if26i72NV7MgIs5MCeHc1q
	hsORby/CuZRQEvMEhqpD+jrR1ihBghsWjrmBz9KzbfWxYklgJGEl2ikTY4iw8MdwzpQRKIbALLf+V
	hznxVVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz4Ik-00000001qcA-07Q4;
	Wed, 26 Aug 2026 03:27:46 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz4Ig-00000001qb1-3qqN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 03:27:45 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-97c79f2db08so204229241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 20:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787714861; x=1788319661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qWanT6gYm3HAacbnAtggJfeeI5p5/Qpb1KAGvhVW4U=;
        b=R1WeCSegCYC8X1qCdrQFVCrLPRZ8zQRsLVCCTuWAgZSMBVJiHbP6dgll4y4EKdiCFc
         WLzcXjg1D0ze3Ka2ZxkNbOu3f7WgGWOnamL/PKXnBiLgp4Wwt2sGVLe2gFDoQ4JIl9t7
         FAtAZszue0fzEEvx2JVEk87qGiwtpmuhEL+MsNJ+GKnKX/y8wktxQFBZuSt3L9S2+jLz
         mQZyDNsDGLKwNhgapV8SXnyg7mihWihbVTtFUepNHfmoQQJAfvHfhpasSdKbRKkeqdyV
         x5g+HkHE6mcYfuGH+T5QbAGGcs4Rd5FCR5qFRoG2JEBgBXlBA2efeLsBgv9RVjWvreEw
         bycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787714861; x=1788319661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qWanT6gYm3HAacbnAtggJfeeI5p5/Qpb1KAGvhVW4U=;
        b=YoEOeK+uUbN2uhZNLGiCTn6DNfiQdTQo1vnrzGNNMnrALfudJFgGSTniXJ9yzNVMt7
         o4zPf8etJbeuWO3bNAyfALYGj/yXq19TJ6FJAhM/+5NP6sauPRw6OMVGvsUk7KJWkjIZ
         uL1RfslnkSi4DHODaKCIsf2WKnXCFmdGV8+pFIYOt9O00IWBdfovfRT9SIY74ZDQ9Gl6
         pQh9UsXrap+2FRtbqiDmSg7h3gL4yho8eFohxjQwjZWviRHre6E/tmDYajwzcA72Ys7H
         jhKxj1H+baAtktJaJmtPcUjYWXxa8KRyzpl8UMPVSiHAfEsYeSvaAQzXshsXMkwHOVVH
         gKnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKillbgkZH+w6OE/4hHyx4LQRj60yb6M6OF9Wtra7OFC/qZknANENazza9C4k7Mmkv91OyIQKmzVfBCnUQOq/1@lists.infradead.org
X-Gm-Message-State: AFuF++nLUUozs0VgAbIBcJ8wI8vV3nSkdcc62Rs7WeCU08/56eRiOLvi
	Um4jExNro6nrmAvI4G+ovXzkZ/GI02SrVKRpV5hJ/xMHRjlEWz2Fge3I
X-Gm-Gg: AR+sD13nj2p8UYvrwfZs2MGY1afRJ1kBi2xQ8pgGVh8ZO0iz3ut7wNuk/fb7WhFwxoz
	09kl/y/j8oaJbNm2LO7LXXaSGGfHFS0iJOkVdobPO7q2MSiEgUVRw4XhDBMVdw8eUx+MEzsYeUq
	nkWNcn9GPQB8AjduzXt1w+7PGlMysiB6M5IpFylqo6BrKn3hFDfDrpyFja/CH08sEDy1QknsqrL
	orUVDQyUC361Ai3gFp1Ee5XsS1XvLT4f8VK8xWnr52dqKexUHQqBGCMQjW/njoE1lyzGDzXhGYK
	dQGqyMjHwoVgZ3qJprQ2RqP4IJ69AebzqFa/Kv6hT31gCF9NmlCzyp/hL8P3ySVqZgNFcoz2zYu
	IUYIAWJilmdA7UTeFXaiPAAA0bwixP1D+moPDxsquvbKmJX4X8qcPdMNdCpKEXWnwAI+X7mnuCw
	chHqqTmfCrtJ+3LIqBU9l6t6P+WppcHv1A0vn/ijML7aPo+KUFUvss8aFDUNiiNoTdatUV
X-Received: by 2002:a05:6102:2924:b0:77a:ce37:9884 with SMTP id ada2fe7eead31-782c2d07c5fmr1413440137.14.1787714860922;
        Tue, 25 Aug 2026 20:27:40 -0700 (PDT)
Received: from localhost ([2804:30c:97d:e800:9454:1179:18df:ab33])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-783081c3988sm665463137.11.2026.08.25.20.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 20:27:39 -0700 (PDT)
Date: Wed, 26 Aug 2026 00:28:22 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] iio: adc: bcm_iproc_adc: sort headers
 alphabetically
Message-ID: <ao5dVuReF1Q63ccU@debian-BULLSEYE-live-builder-AMD64>
References: <20260825172155.250484-1-mdshahid03@gmail.com>
 <20260825172155.250484-2-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825172155.250484-2-mdshahid03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_202743_005428_BAA92B11 
X-CRM114-Status: GOOD (  19.81  )
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

Hello Mohammad,

On 08/25, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Sort the Linux kernel headers alphabetically to improve consistency
> and make the include list easier to maintain.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index ab66b97d2f04..e46e3761993a 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -3,14 +3,14 @@
>   * Copyright 2016 Broadcom
>   */
>  
> -#include <linux/module.h>
> -#include <linux/io.h>
>  #include <linux/clk.h>
> -#include <linux/mfd/syscon.h>
> -#include <linux/regmap.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  
>  #include <linux/iio/iio.h>

The sorting looks okay to me. Though, there are some includes missing and a
couple of them that don't seem to be needed (delay.h and io.h). Either in
replacement of this patch or as a follow on extra patch (not sure how maintainers
would like to have it in this case), it would be nice to also update the include
list according to include-what-you-use principles.

If you decide to work on the update to make it iwyu compliant, it may be
helpful to set an IIO tailored mapping file such as the one shared by Jonathan
a while ago.
https://lore.kernel.org/linux-iio/20250629194336.34a03946@jic23-huawei/

