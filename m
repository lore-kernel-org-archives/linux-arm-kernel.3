Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6772BC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 01:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GofoErHI9T810tytuenQDsE4GnxZ6SooxECYzx95nys=; b=X1yu8HNTcHcslLn5drfOm0hAC2
	WXuMJ5Yq1HCW/t8JOdbcLGiU/6bkUvLbiN0UsGiflAk1zfb8Vsx0PnU+swebumeH/FWd1Gyig1+Mp
	JCmbOx8Me0uhBJ6UPCGXXbt/nMkeGJw1uhE8XyXwGItwApir1jLEApGx1PBK26DjHpOjcfewb0NQp
	F/UZxXfFq72NMgCeyQWSMfAzghZDB8eyq5RFpTFuV9oFakZr967ipPB17guxliXq4DQiylkwO9zUm
	S+SlUwSs2Z2NSjOhMMHBMz7q8s6E54xTDvHR2AkOGT5hviwFKptX7ef4KgNEa8nl8r8gOmupXm3uY
	ppjidtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmto-00000004qDu-0Bv8;
	Wed, 02 Apr 2025 01:28:12 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmo1-00000004pTe-0MNM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 01:22:14 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso63780506d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 18:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556931; x=1744161731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GofoErHI9T810tytuenQDsE4GnxZ6SooxECYzx95nys=;
        b=kHwCo6vCsoXLHGMSGLv+5BhSJ7EA10z+50YAqgZiov1x8KqdroBXH5wpX8NHTVlQKU
         Z58eJhLXiCK611jBhU4Hf6y6JawpjNxeBPq/mntObwYcRtbkJQAKNsPF5qph/qsz1nxQ
         miV+Wj8KB9suhRo3IBOfwqmJdsRwdr/VBMV2EjbfoauTc2TtY98kpmzFoVpuq1zZwkEX
         /8Hz7Tkir71KuwE2/uNh/4ThHvQJyba8X+bdWmbxX5Hh8vrc2imMhDghidAMClOZD/Gv
         gMEKtjGmnkrOpANdyEsTICWeeImEmcR3geK/94Pg6VHjWvVGRtc9Fb0eaiuK/jO7LGsa
         e7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556931; x=1744161731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GofoErHI9T810tytuenQDsE4GnxZ6SooxECYzx95nys=;
        b=jhEe4UZQq9UgzER9LAnR2tmKcCL5RrZAs4GMDat41ZI6BnIYFvMouKRrA+OVrZLcK8
         2AKmWLfl8FtwT26MmMC/7ou6V7K7aVIIYowSjh3zjrBYRMfg2QD9BV3Hkka1ZGuQFHAF
         E5sC3/yJK2yFghY8u43e2uj6zGeNXwgPHyTtJNfpMY/p6LSGIRBe2rEs8AeqrgV0DdnV
         tBk1LVT+6b5p6QEaVzfeII6Qtna86hYS10plRqJJVHDcS7zt5bLb83aLxAh8IBa/Tpw9
         gBT9TzkgUBsEpBKf3HKZxWxkycUfInxzCCuCzgPAayAm7fUh0gcgkaD69HcS1Tw0BlBv
         ltag==
X-Forwarded-Encrypted: i=1; AJvYcCXgQZq427knlRLBx9TVuXUSW/2zknroLb8diYZG4GhqkGGgUiPZbX8vIY+qgYyIUdLIz5gy8P5O26WpcO6b8PZz@lists.infradead.org
X-Gm-Message-State: AOJu0Yynv2aDzwAhEDxBSslBW5SBj7nDiW+5i9iUREH3GxF5r3L9+wdX
	D887fD73g3G21x6QtaD9hadW4z70PPnwDL7cFfeYvoRB5Nv0TjDdQ8HEAjaNGcEj2lhLOIvV10w
	5jqrJqmeQb2bNlFMmP/a9Zh3SuPo+AIFifvg=
X-Gm-Gg: ASbGncsqgxGuXcZrYtRf+cWPrmAshGkSLXRam71BBLb5/dkI42zEynCy6344y7zmUDR
	Nqxz4jOdfp2W5ZONEvC2NpRDYtHnE8OBDuLuVIkGSzIviIzTP6AxMTBcAPiGSgjdNssWMv9Ib8i
	1cdYpwzWOQA/nHC6mR85iMXyGoDA==
X-Google-Smtp-Source: AGHT+IFNgYbnbBXVlpFQqcBdZGewOZnpTP2ZbadklR5ZyIYHzakO6QVp2iSwpF6RIqS/Zt3n6YrcxZbDmVj3XHmvwuU=
X-Received: by 2002:a05:6214:2a49:b0:6e8:f4e2:26d9 with SMTP id
 6a1803df08f44-6ef02d0d895mr12378236d6.35.1743556930967; Tue, 01 Apr 2025
 18:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-2-yabinc@google.com>
In-Reply-To: <20250402011832.2970072-2-yabinc@google.com>
From: Yabin Cui <yabinc@google.com>
Date: Tue, 1 Apr 2025 18:21:59 -0700
X-Gm-Features: AQ5f1JrgVf9BlOqU8nJc8AGx92KxV31d-C-bB1fxTFWAWir3Ez9IcMJEkhnV41I
Message-ID: <CALJ9ZPNBGBd9OTBgedoQStXh3d2oGDGi6fUF7PXbU5qTEBRHew@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, leo.yan@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_182213_123610_3D333815 
X-CRM114-Status: GOOD (  27.44  )
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

On Tue, Apr 1, 2025 at 6:19=E2=80=AFPM Yabin Cui <yabinc@google.com> wrote:
>
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously.
>
> To address these race conditions, this patch introduces the
> following changes:
>
> 1. The enable and disable operations for the CATU device are not
>    reentrant. Therefore, a spinlock is added to ensure that only
>    one CPU can enable or disable a given CATU device at any point
>    in time.
>
> 2. A reference counter is used to manage the enable/disable state
>    of the CATU device. The device is enabled when the first CPU
>    requires it and is only disabled when the last CPU finishes
>    using it. This ensures the device remains active as long as at
>    least one CPU needs it.
>
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c | 27 ++++++++++++++------
>  drivers/hwtracing/coresight/coresight-catu.h |  1 +
>  2 files changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtra=
cing/coresight/coresight-catu.c
> index fa170c966bc3..b1d490dd7249 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvd=
ata, enum cs_mode cs_mode,
>  static int catu_enable(struct coresight_device *csdev, enum cs_mode mode=
,
>                        void *data)
>  {
> -       int rc;
> +       int rc =3D 0;
>         struct catu_drvdata *catu_drvdata =3D csdev_to_catu_drvdata(csdev=
);
> +       guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
>
> -       CS_UNLOCK(catu_drvdata->base);
> -       rc =3D catu_enable_hw(catu_drvdata, mode, data);
> -       CS_LOCK(catu_drvdata->base);
> +       if (csdev->refcnt =3D=3D 0) {
> +               CS_UNLOCK(catu_drvdata->base);
> +               rc =3D catu_enable_hw(catu_drvdata, mode, data);
> +               CS_LOCK(catu_drvdata->base);
> +       }
> +       if (!rc)
> +               csdev->refcnt++;
>         return rc;
>  }
>
> @@ -486,12 +491,17 @@ static int catu_disable_hw(struct catu_drvdata *drv=
data)
>
>  static int catu_disable(struct coresight_device *csdev, void *__unused)
>  {
> -       int rc;
> +       int rc =3D 0;
>         struct catu_drvdata *catu_drvdata =3D csdev_to_catu_drvdata(csdev=
);
> +       guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
>
> -       CS_UNLOCK(catu_drvdata->base);
> -       rc =3D catu_disable_hw(catu_drvdata);
> -       CS_LOCK(catu_drvdata->base);
> +       if (--csdev->refcnt =3D=3D 0) {
> +               CS_UNLOCK(catu_drvdata->base);
> +               rc =3D catu_disable_hw(catu_drvdata);
> +               CS_LOCK(catu_drvdata->base);
> +       } else {
> +               rc =3D -EBUSY;
> +       }
>         return rc;
>  }
>
> @@ -550,6 +560,7 @@ static int __catu_probe(struct device *dev, struct re=
source *res)
>         dev->platform_data =3D pdata;
>
>         drvdata->base =3D base;
> +       raw_spin_lock_init(&drvdata->spinlock);
>         catu_desc.access =3D CSDEV_ACCESS_IOMEM(base);
>         catu_desc.pdata =3D pdata;
>         catu_desc.dev =3D dev;
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtra=
cing/coresight/coresight-catu.h
> index 141feac1c14b..755776cd19c5 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -65,6 +65,7 @@ struct catu_drvdata {
>         void __iomem *base;
>         struct coresight_device *csdev;
>         int irq;
> +       raw_spinlock_t spinlock;
>  };
>
>  #define CATU_REG32(name, offset)                                       \
> --
> 2.49.0.472.ge94155a9ec-goog
>

