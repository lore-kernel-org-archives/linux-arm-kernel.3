Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEB8C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpOAwhaaQKzA9a+hLMz4Fdbv7o6Lk/Fl/Twzh3KUUnM=; b=1OZC7XLJbgudJtcNq2hqRdmpFj
	UxJ2pJc3R7oYb7/swN+WACEzBa90yzrLQMFITDrBlJDQ8NZO1okn0iaKDEDACg5qcS9MBAp8lmmT5
	v6x7XrDkXwh0GwYSyHnX4lJvO3XvYAPO30lbj7yXyGTUThv72RaqRZ/8XsdZawNywV909vPtsm+qI
	7ErqgpvJsyReLoohvDm1PF04P68oKvamP8HuMw7uI3zZHL9Li7TNmchWUCKv6ZTFfFWz+31gzEjHF
	qjCGajbz+yznN0mnsevuxrs2ct2MBQ2I+WOJlQm2eQrUylaS/CPZcJltN6OzBLBHwR+G29lwG9Tro
	PhQI0uzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYI9-00000007jqT-0FnA;
	Tue, 17 Jun 2025 15:32:05 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXGe-00000007Y7H-1YlQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:26:29 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-52f28e83e13so225469e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1750170386; x=1750775186; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YpOAwhaaQKzA9a+hLMz4Fdbv7o6Lk/Fl/Twzh3KUUnM=;
        b=fL9HgE4iww95zsm3JE7MRHJdh2p//lz5Ads1sv0ceRhsNehxlsCHGl+VqUB9jbLt2Z
         ZBC+TpctMghYzsL6mrCEC53hRL7M+qis2dqdlO8XLp7K6schPAk05aPj0JVA95oFlc7h
         Qn2tKFIZezoRjyExGxJd/C8Wxxwr6o8qWMoCmneFvDSc2LyugbckELgPjtd3qzumjviO
         M7oVUYRHp/ylkvPk0KPsRfzlJqACPPv8aaPnzlgs9bQkcaUp7bEJVqHlUyfWqbQjuoGI
         RdNPeAqQnRb7QUOLjzSAxGoFkVec+bhFrE9arXojRn8b8bNlQwUGK9VqdqE295N7Sj37
         Wahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170386; x=1750775186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpOAwhaaQKzA9a+hLMz4Fdbv7o6Lk/Fl/Twzh3KUUnM=;
        b=fQY1PdFpAz/CK9txHfKponDyNf/rkg08YJ3QSQNrccNMi/r2PKL0duTGf35Thcffuv
         yC64Soz2Yrx6FKRijj3g81+EkMpGV+wg/+I2cHS3mt9BR3wQ93PqysuE/A/kThPPZXEN
         5patgpSG0eyk6JuJkDlIHaC5+bSbt9W/ypIS54nzr3gOanm9iIkZuda3PtpB4v6cVQ30
         HOB4zbEzTKkJHbriQhw8aPp8inzMGP3Jg91h4cKWq0KHOL/AYhj/aK4uM7PI/JfJZK/B
         Isq1M+WZi4x0C2aqrfTdQ9AfTlAuiLXQIvMCqI47xzu9PeI29G1sOMzQXb4kxr3rXTis
         RF1A==
X-Forwarded-Encrypted: i=1; AJvYcCXHkdBNzXU0SYGYERcOmdgCczJxWAnKlYMEjPgYVCTqDArbKGrCFEWaYeDai7WSVapmQSoEUeT2VXJalXsnKg7T@lists.infradead.org
X-Gm-Message-State: AOJu0YxVvf62Pa/d3LpLa3FdZRA0Vq7S3Wqg4gXHGfCk/v+ZySr153hz
	5R0b3r8t2h37Df6yuu96KzuppVW/ZR+qS82Fx6lamZIB8Q4sM6nDEu4bOZi6HQcXFwzBmtnWBap
	XmQtezndUD+62yN5Woi5tPszV6S0BRIqw3GgWLbs8ig==
X-Gm-Gg: ASbGnctmOl1KeOie8XSPRaumAmQ7BbcUWtOUjPni1pZABBDBrIAZeuwrDh+GV4LYNm/
	VViZHX22Twpuch8S0UBrVAlM8wX90KujesYyFKIofnD/7hFC9cKU3R5nqglsu/Sy+phXcJzBKnE
	XQBruZ6pj0P94oDYeD/YfFTu4iNi2r7P88es4LlDvn
X-Google-Smtp-Source: AGHT+IEvy629BwKiuNFR6pwMejlGO2WAZGwWZVOcmHQsFf0NqpfbXWmZwN4PhhADQC4Yr8/b+9IDSb34HzZ3UTA0+E8=
X-Received: by 2002:a05:6122:4881:b0:530:2422:68a8 with SMTP id
 71dfb90a1353d-53172c40e8cmr906039e0c.1.1750170386532; Tue, 17 Jun 2025
 07:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
 <20250617-pispbe-mainline-split-jobs-handling-v6-v8-4-e58ae199c17d@ideasonboard.com>
In-Reply-To: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-4-e58ae199c17d@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Tue, 17 Jun 2025 15:25:52 +0100
X-Gm-Features: Ac12FXxY2MjozgnKj7SQp4qGI8gl5dx5KqJMAcZDD_ubJWJD9OKIvfSseMEz2Tk
Message-ID: <CAEmqJPoxHSgXBp+EH+MWQVHVwYL2N5CnOwC-7W+AFWt1k7Zv+Q@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] media: pisp_be: Fix pm_runtime underrun in probe
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_072628_587864_014C463F 
X-CRM114-Status: GOOD (  26.17  )
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

Hi Jacopo,

Thank you for this fix.

On Tue, 17 Jun 2025 at 14:54, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> During the probe() routine, the PiSP BE driver needs to power up the
> interface in order to identify and initialize the hardware.
>
> The driver resumes the interface by calling the
> pispbe_runtime_resume() function directly, without going
> through the pm_runtime helpers, but later suspends it by calling
> pm_runtime_put_autosuspend().
>
> This causes a PM usage count imbalance at probe time, notified by the
> runtime_pm framework with the below message in the system log:
>
>  pispbe 1000880000.pisp_be: Runtime PM usage count underflow!
>
> Fix this by resuming the interface using the pm runtime helpers instead
> of calling the resume function directly and use the pm_runtime framework
> in the probe() error path. While at it, remove manual suspend of the
> interface in the remove() function. The driver cannot be unloaded if in
> use, so simply disable runtime pm.
>
> To simplify the implementation, make the driver depend on PM as the
> RPI5 platform where the ISP is integrated in uses the PM framework by
> default.
>
> Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> Cc: stable@vger.kernel.org
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Tested-by: Naushir Patuck <naush@raspberrypi.com>
Reviewed-by: Naushir Patuck <naush@raspberrypi.com>


> ---
>  drivers/media/platform/raspberrypi/pisp_be/Kconfig   | 1 +
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 ++---
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> index 46765a2e4c4d1573757ff842f208834216e582cb..a9e51fd94aadc6add70f883bfcea0c9fa91f0c4b 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> +++ b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> @@ -3,6 +3,7 @@ config VIDEO_RASPBERRYPI_PISP_BE
>         depends on V4L_PLATFORM_DRIVERS
>         depends on VIDEO_DEV
>         depends on ARCH_BCM2835 || COMPILE_TEST
> +       depends on PM
>         select VIDEO_V4L2_SUBDEV_API
>         select MEDIA_CONTROLLER
>         select VIDEOBUF2_DMA_CONTIG
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index ccc6cb99868b842ac0d295f9ec28470303e60788..be794a12362020f42b3cf5bd291b4a1625543b5f 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -1725,7 +1725,7 @@ static int pispbe_probe(struct platform_device *pdev)
>         pm_runtime_use_autosuspend(pispbe->dev);
>         pm_runtime_enable(pispbe->dev);
>
> -       ret = pispbe_runtime_resume(pispbe->dev);
> +       ret = pm_runtime_resume_and_get(pispbe->dev);
>         if (ret)
>                 goto pm_runtime_disable_err;
>
> @@ -1747,7 +1747,7 @@ static int pispbe_probe(struct platform_device *pdev)
>  disable_devs_err:
>         pispbe_destroy_devices(pispbe);
>  pm_runtime_suspend_err:
> -       pispbe_runtime_suspend(pispbe->dev);
> +       pm_runtime_put(pispbe->dev);
>  pm_runtime_disable_err:
>         pm_runtime_dont_use_autosuspend(pispbe->dev);
>         pm_runtime_disable(pispbe->dev);
> @@ -1761,7 +1761,6 @@ static void pispbe_remove(struct platform_device *pdev)
>
>         pispbe_destroy_devices(pispbe);
>
> -       pispbe_runtime_suspend(pispbe->dev);
>         pm_runtime_dont_use_autosuspend(pispbe->dev);
>         pm_runtime_disable(pispbe->dev);
>  }
>
> --
> 2.49.0
>

