Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CBCCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHdeL3/eB4SwEyjto5YmpdXlDcK1xj+0ORvxmNvmZno=; b=u21L+t/oahnKqhV+Q89VfaUvfO
	Unm6a9I+ql5bo0kAEEC/82shOY3BpMSPOVLCoPpgmmzdONoJxX/+zifwEuoYl3jFIcJIkR+KITM5C
	HpZFfc7Ri3Rlva7PgMrpNbtLQfIBTB9esq8Uzlwy4B++jtyv3WcAO+MwzsA9aNYt5MJSpuJEVR9JG
	mWnuTl+KOYe/WiVjej+A1KWZmqgg8NhnOzpclXF/AQigcepoLj/s3XQVeNcvDRHod596PzkSeDZWp
	mL4gITDjjVM6PfhVvLKhaqkwLEholRCmGknMtlgbVNNIiIurNGvb1vITTeMC0qHLV3Qnl7DtSMmsj
	CmBM4Nmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Gxc-0000000AJwW-1GkB;
	Thu, 02 Oct 2025 10:54:56 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Gxa-0000000AJvz-1elz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:54:55 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b551b040930so551459a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 03:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759402493; x=1760007293; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VHdeL3/eB4SwEyjto5YmpdXlDcK1xj+0ORvxmNvmZno=;
        b=XGyDD4VNo/U8sBiSHqzG0KJNQEqJB7Rmz+El48IibJO6VDFHE0E0BvT9lGSqkRVQx0
         GaGRiO6YV8AhvC97FoOlzjpalZ0db/2dgI+qaMjiTLZyBHfUfGMKo8ycUlKXpcVxxVsC
         6F3KHln3kFoe0raZRzqZEt6q0RpmuYvCwJtaUhJANtKPhNKCD2B/VshKyfrXyQrkNIdf
         YyqZ1HGNf1wBj3REjUnT21CGAGX26/C2sinh/9soMrhjN/KtaXyzQ8mzkfV2CNXvTW4K
         2tUoKuX17hIs9MjhSywwbdavKMzuaKktFBaRgUJpZhU/DCexrVUwqStV+VEWK7A4ZSWn
         pAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759402493; x=1760007293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHdeL3/eB4SwEyjto5YmpdXlDcK1xj+0ORvxmNvmZno=;
        b=ERvogVKQGzx9BtVDFgXQgqZgjz3f1v6lWVVhobyDU+YbjuoqtPXRodBISE83lFM0RC
         A8XC7syQ696EiHW+Mtt5/GsjGiB8329Fad8CfCoUWSYKXhXl+VCK911UNKZ7LISpGIdd
         huFzNuuJpVauInOMqIygRPB7y9AEQTaqgvlsukLaQzbhCREEOBAwti/wMfS2J+/jTZuL
         7JujsqM5eniVIGgK9mxqgGoxt9hsQk8KpZww4sPNtt6IKKleg0JLsOlloSFiwzj78TWL
         ZKO85BwTgs/PYLoTg1zIbqFQiVf7zA8h/NOg+xFCfpL/MNwoDyF7O0DYO4IegkP0++JB
         g21w==
X-Forwarded-Encrypted: i=1; AJvYcCXFNj0UyXDnxaGJTHGH+oGNmoW19WmoOr0FSnkLriBPAaA+XOIf4LgmEXUJr3nW7SlP14lqPpTzCyQ9P4w4UaH1@lists.infradead.org
X-Gm-Message-State: AOJu0YxXlyBIfkLXoB7XK+RSDm8zhHMqHMPtWrOwF9/rKlH8Dsx/xmiB
	3cBXVRI/PfiI9iGh9v+5JGWo5AO3vQ9Twd+2yHmra0SBEjWGzF5A1KXTwEBUQcOwcXUFnBf1bI0
	yg602YH+4ZfDMBQGWpB6aECULl6mSez8voKAldCdY3A==
X-Gm-Gg: ASbGnctfT+6S9V5p+ylFcfLY6rNHS4153QibYnfaip7IgXWtV9hZwGY6KsC2Vd7Yy1f
	Q4ETWHrSmrs5istRrv741XFdUgx6Oa7W6hqsmMX8NDOsfLdJPuTtXOvkA179+E3wz7Q+morEyaV
	Ss4ek+HBg9eyVA9NKFdO8LdY+nhsUNnZ6ZXjcqvytDozUokAXC+HWOIzFQdHr1Ad7oz84wc4YPh
	AbLwm5WPUMC4cJmdIAhu3d8ly8Q0CSYag3A
X-Google-Smtp-Source: AGHT+IEhkuF7l3l1YNQrwUGdKSblNmbW+XTCTpivSeWhDIkFeTs1PhnCzM8/0bZl4txxxlgH+icDXwv2zvEnSWvZkCk=
X-Received: by 2002:a17:903:1107:b0:27e:dc53:d239 with SMTP id
 d9443c01a7336-28e7f48a359mr79118305ad.35.1759402493285; Thu, 02 Oct 2025
 03:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-11-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-11-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 2 Oct 2025 11:54:42 +0100
X-Gm-Features: AS18NWBDJNV5emwzQyfvWwF2zgy6zbzyYNWm5O6Lvy6hUTJ9AlfFG5RixeRkbDA
Message-ID: <CAJ9a7VgDqQpWJacQbsYqXTeAr2aeR0hQNvoaCJC3MxB29PU2zQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/31] coresight: Populate CPU ID into the
 coresight_device structure
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_035454_475978_FD1223BF 
X-CRM114-Status: GOOD (  18.99  )
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

Hi Leo,

Not obvious from the patch itself why this is being done - as no use
cases until later patches - perhaps expand the explanation here.

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> The coresight_desc structure is a temporary structure for passing the
> information to the coresight_device structure during registration.
>
> Introduces a new "cpu" field in both structures to store the CPU ID. For
> components that are not CPU bound, set this field to -1.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c       | 1 +
>  drivers/hwtracing/coresight/coresight-core.c       | 1 +
>  drivers/hwtracing/coresight/coresight-ctcu-core.c  | 1 +
>  drivers/hwtracing/coresight/coresight-cti-core.c   | 1 +
>  drivers/hwtracing/coresight/coresight-dummy.c      | 1 +
>  drivers/hwtracing/coresight/coresight-etb10.c      | 1 +
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 1 +
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
>  drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
>  drivers/hwtracing/coresight/coresight-replicator.c | 1 +
>  drivers/hwtracing/coresight/coresight-stm.c        | 1 +
>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
>  drivers/hwtracing/coresight/coresight-tpda.c       | 1 +
>  drivers/hwtracing/coresight/coresight-tpdm.c       | 1 +
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 1 +
>  drivers/hwtracing/coresight/coresight-trbe.c       | 1 +
>  drivers/hwtracing/coresight/ultrasoc-smb.c         | 1 +

Missing coresight-tnoc.c from here?

>  include/linux/coresight.h                          | 4 ++++
>  18 files changed, 21 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index a3ccb7034ae14d7339bc2549bccadf11e28c45e2..2685e3a883b1f8067de643519b5fc91153123c57 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -575,6 +575,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>         catu_desc.type = CORESIGHT_DEV_TYPE_HELPER;
>         catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
>         catu_desc.ops = &catu_ops;
> +       catu_desc.cpu = -1;
>
>         coresight_clear_self_claim_tag(&catu_desc.access);
>         drvdata->csdev = coresight_register(&catu_desc);
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 3267192f0c1c667b0570b9100c3c449064e7fb5e..db325dff884d21cc8d93f32bfe3be5c0491ffc8d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1336,6 +1336,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>         csdev->ops = desc->ops;
>         csdev->access = desc->access;
>         csdev->orphan = true;
> +       csdev->cpu = desc->cpu;
>
>         csdev->dev.type = &coresight_dev_type[desc->type];
>         csdev->dev.groups = desc->groups;
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index c586495e9a088a63cec481a82fd9f4ec7c645160..05497a5114785397a98e408466df0b937c87ab61 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -231,6 +231,7 @@ static int ctcu_probe(struct platform_device *pdev)
>         desc.dev = dev;
>         desc.ops = &ctcu_ops;
>         desc.access = CSDEV_ACCESS_IOMEM(base);
> +       desc.cpu = -1;
>
>         drvdata->csdev = coresight_register(&desc);
>         if (IS_ERR(drvdata->csdev))
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 8fb30dd73fd20ae613a45b1a467f457a046a9412..2c8bf5dbe8b8206c92ae5ea64a26c947ef5b9582 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -931,6 +931,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>         cti_desc.ops = &cti_ops;
>         cti_desc.groups = drvdata->ctidev.con_groups;
>         cti_desc.dev = dev;
> +       cti_desc.cpu = drvdata->ctidev.cpu;
>
>         coresight_clear_self_claim_tag(&cti_desc.access);
>         drvdata->csdev = coresight_register(&cti_desc);
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index aaa92b5081e3d2bb85d57f90ab68a1dc6a1f0dd8..653d37cd0bd12a57c78e2615f839e0d8af25d7f0 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -179,6 +179,7 @@ static int dummy_probe(struct platform_device *pdev)
>
>         desc.pdata = pdev->dev.platform_data;
>         desc.dev = &pdev->dev;
> +       desc.cpu = -1;
>         drvdata->csdev = coresight_register(&desc);
>         if (IS_ERR(drvdata->csdev)) {
>                 ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index 35db1b6093d154d67dc567df42f838e2ba3d1d58..8e0bbffdf36215fe82c89a34767e425e03f4a744 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -770,6 +770,7 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
>         desc.pdata = pdata;
>         desc.dev = dev;
>         desc.groups = coresight_etb_groups;
> +       desc.cpu = -1;
>
>         coresight_clear_self_claim_tag(&desc.access);
>         drvdata->csdev = coresight_register(&desc);
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index f759a47eaed9e804e30530a232370c9504912ac6..2cce5f4dd0e168cab066e882c0856886b30aaf91 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -885,6 +885,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
>         desc.pdata = pdata;
>         desc.dev = dev;
>         desc.groups = coresight_etm_groups;
> +       desc.cpu = drvdata->cpu;
>         drvdata->csdev = coresight_register(&desc);
>         if (IS_ERR(drvdata->csdev))
>                 return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 4a75c76bb44fc284034e25f8eb8e7a04e9d35885..7e66d094269de4a1344f5d962bc320b2603b7627 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2062,6 +2062,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
>         desc.pdata = pdata;
>         desc.dev = dev;
>         desc.groups = coresight_etmv4_groups;
> +       desc.cpu = drvdata->cpu;
>         drvdata->csdev = coresight_register(&desc);
>         if (IS_ERR(drvdata->csdev))
>                 return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 3b248e54471a38f501777fe162fea850d1c851b3..457291bb24212c502de9aadecb41da218c733c2f 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -263,6 +263,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
>         desc.ops = &funnel_cs_ops;
>         desc.pdata = pdata;
>         desc.dev = dev;
> +       desc.cpu = -1;
>         drvdata->csdev = coresight_register(&desc);
>         if (IS_ERR(drvdata->csdev))
>                 return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index e6472658235dc479cec91ac18f3737f76f8c74f0..38518ba862928ea904c953c8303559e349e45200 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -273,6 +273,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>         desc.ops = &replicator_cs_ops;
>         desc.pdata = dev->platform_data;
>         desc.dev = dev;
> +       desc.cpu = -1;
>
>         drvdata->csdev = coresight_register(&desc);
>         if (IS_ERR(drvdata->csdev))
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index e68529bf89c9815a8118955bf3114ad1ed4fb346..e2197ae0a7c8412785ce8b1161311048cbaa3f58 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -901,6 +901,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
>         desc.pdata = pdata;
>         desc.dev = dev;
>         desc.groups = coresight_stm_groups;
> +       desc.cpu = -1;
>         drvdata->csdev = coresight_register(&desc);
>         if (IS_ERR(drvdata->csdev)) {
>                 ret = PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 36599c431be6203e871fdcb8de569cc6701c52bb..bd783c9dcb56afa0adfa9724e45fcd0c4cfe367b 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -868,6 +868,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>         }
>         dev->platform_data = pdata;
>         desc.pdata = pdata;
> +       desc.cpu = -1;
>
>         coresight_clear_self_claim_tag(&desc.access);
>         drvdata->csdev = coresight_register(&desc);
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 333b3cb236859f0feb1498f4ab81037c772143fd..6739deda402ed5024e17add349314d6db793dd13 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -324,6 +324,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
>         desc.pdata = adev->dev.platform_data;
>         desc.dev = &adev->dev;
>         desc.access = CSDEV_ACCESS_IOMEM(base);
> +       desc.cpu = -1;
>         drvdata->csdev = coresight_register(&desc);
>         if (IS_ERR(drvdata->csdev))
>                 return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 7214e65097ec9ac69f6c7c9278bcd28d25945c9e..ec1e9a585f90a02f06db27d6dfb22091eb66cbd9 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1392,6 +1392,7 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
>         desc.dev = &adev->dev;
>         desc.access = CSDEV_ACCESS_IOMEM(base);
>         desc.groups = tpdm_attr_grps;
> +       desc.cpu = -1;
>         drvdata->csdev = coresight_register(&desc);
>         if (IS_ERR(drvdata->csdev))
>                 return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 9463afdbda8ad74eee78c72185fe7603f81b7888..3ade05e268e31dd2572b84e91f9448fcf317f2ab 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -171,6 +171,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
>         desc.ops = &tpiu_cs_ops;
>         desc.pdata = pdata;
>         desc.dev = dev;
> +       desc.cpu = -1;
>         drvdata->csdev = coresight_register(&desc);
>
>         if (!IS_ERR(drvdata->csdev))
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 7a226316c48fa516293bf4e88e4009c8606485d5..3fd379f327eb4f82665b216856d43ec39e4e7d10 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1288,6 +1288,7 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
>         desc.ops = &arm_trbe_cs_ops;
>         desc.groups = arm_trbe_groups;
>         desc.dev = dev;
> +       desc.cpu = cpu;
>         trbe_csdev = coresight_register(&desc);
>         if (IS_ERR(trbe_csdev))
>                 goto cpu_clear;
> diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
> index 26cfc939e5bd810295a336f392ac282ccf316f9f..e5897767d9ae2c21ef39e9280dea211c110bd168 100644
> --- a/drivers/hwtracing/coresight/ultrasoc-smb.c
> +++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
> @@ -483,6 +483,7 @@ static int smb_register_sink(struct platform_device *pdev,
>                 return -ENOMEM;
>         }
>         desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
> +       desc.cpu = -1;
>
>         drvdata->csdev = coresight_register(&desc);
>         if (IS_ERR(drvdata->csdev))
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 3e5e5acd0c7fcde7d312d440da4355faaf682c7b..222597ec7a089e10ad763df206917e90f34bb5c2 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -153,6 +153,7 @@ struct csdev_access {
>   *             in the component's sysfs sub-directory.
>   * @name:      name for the coresight device, also shown under sysfs.
>   * @access:    Describe access to the device
> + * @cpu:       The CPU this component is affined to (-1 for not CPU bound).
>   */
>  struct coresight_desc {
>         enum coresight_dev_type type;
> @@ -163,6 +164,7 @@ struct coresight_desc {
>         const struct attribute_group **groups;
>         const char *name;
>         struct csdev_access access;
> +       int cpu;
>  };
>
>  /**
> @@ -261,6 +263,7 @@ struct coresight_trace_id_map {
>   *             CS_MODE_SYSFS. Otherwise it must be accessed from inside the
>   *             spinlock.
>   * @orphan:    true if the component has connections that haven't been linked.
> + * @cpu:       The CPU this component is affined to (-1 for not CPU bound).
>   * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
>   *             by writing a 1 to the 'enable_sink' file.  A sink can be
>   *             activated but not yet enabled.  Enabling for a _sink_ happens
> @@ -287,6 +290,7 @@ struct coresight_device {
>         atomic_t mode;
>         int refcnt;
>         bool orphan;
> +       int cpu;
>         /* sink specific fields */
>         bool sysfs_sink_activated;
>         struct dev_ext_attribute *ea;
>
> --
> 2.34.1
>

Regards

Mike
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

