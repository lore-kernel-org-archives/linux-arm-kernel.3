Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FE1C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 03:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVZBAJ5EXu46k88wk2XqEWl9oBv9MxHKCH3s/g0zXt0=; b=WfvPEQ0KBrwcnZoj/QrceG8aDa
	uQlpDaaUqWxw5bMVQT5piO/zUzaz7bmiJEczsXCP5YEXAUJVChEFtMEsKZoCRonEQN8MClZ7hSPXC
	/9DGiuJiEY7NXAfGwz+d9x9NI0zaEFiSPfnnHBo3/fS2ZvUP0ILPgDyfBhJ8M3CN2kuGOL7xyhJEv
	5LP4KtERC7I4KF+WiulyEyWXzcSOuHxQwPgp9onIHXi/mMpExLI/hCMRbcthegYgJb5BUbCulMrSU
	ZYJfvEy2an5siJul4D0LJ2yE4tFo3kaHQx8xTF1/LSVSPDIaZwsxhx71BOcv5DbQOVTuIGjkzgWwU
	2YxM1nwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikzd-00000006LwL-2Elg;
	Thu, 22 Jan 2026 03:04:21 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikzb-00000006Lvy-0Eci
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 03:04:20 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so4503895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 19:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769051057; x=1769655857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVZBAJ5EXu46k88wk2XqEWl9oBv9MxHKCH3s/g0zXt0=;
        b=ccMt7k3iJG+5HjmMi5KmSm/iq+vtzz0WJNljacVhF+3dI61xy23Fyv/QmHg41i76c8
         9HNsXDWk808U0V3XEb2cV/4c/scRaSiXqenE/IQwZgpj8F/zHroreYSXTdmLRtJpb/QC
         jJfanyusmDrvBgmMJwrr3MnTjcwZAuMvkkJ/OuNf0xwbX0dsgu7qCkYArvGfJGiMAXUT
         hjnyfcQ+34tRKZ5QwTVfsaWGpLXqTYzTjmA83aqnNXG05Zd6gnrjg5p1g6PEbSWIv7Vv
         jPCCV+66CrmNAei79Gq3LhUTuZ3WLz0uliYPiflTOFWbBnMLfB07/Tesou0BPUuxa0rO
         Y8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769051057; x=1769655857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AVZBAJ5EXu46k88wk2XqEWl9oBv9MxHKCH3s/g0zXt0=;
        b=xLiUPdGU36r2NIXgx3zgP2U2zgKBkvUY3KFnqcl9IB9LN6vKZAdNRbqZWTH5zoLdly
         zplgS+cUX5Gwmg6eKi2mdexuAfXo6qwruRWcJRWuqdZ2yvHTB6oFNZoR2VwQ46zKEoLW
         Vm2jfYlJIpaisCyGMRNZnFQe76uJyH5WuRsv3dGqkF2L9K/z4LGqv6/NCvdrHOljGALX
         yrJQUsiHeZy82iNYvuJhuIYLziMsZLf+ChymUR3AzA1JY0mfg49p8FZqtH0DOKE2ghMH
         /mBtdtzBGPQn9ZUFGoy8jMIF4HR4zx2hf6GtJe8SyqvqEKFOEwSHMXTLqnt/K6WUzJQP
         aGWg==
X-Forwarded-Encrypted: i=1; AJvYcCVKHUpNZClIpnCsHwfFEciujJKilujciTLjLOlZYsZ4vjf0yFvTfO6bVwgAmjm8FJ+rhoMb+Qs7DDmBcwkuVx8X@lists.infradead.org
X-Gm-Message-State: AOJu0YyZRHKKruA3OgGTRB8IDj6zWAcqDp0j+LOhK8r7vEZyAEAx+H5m
	bCJ3Qr2aCWPO7oc/ZJ6dU0ylVYIFttR26wwW0/I0rBJfJ6Y12wghoKuL
X-Gm-Gg: AZuq6aKYA4js/YpcTsJeIlG+asuVJA9+MnmjAd2cpdaHpvanJLt0ZnppTpGQXZpFdJx
	Xeqe7SYAzL0FcTcsDmmu51XuLOxSPIBjqKLdl3kHX0wd2MKGsmiIjWJSKbzjtrQfG7SwN0pxpmL
	cVJ+7elcTtbtkulbVUV2eA8qXhxDLeHVHaTpYCmCv2c34cHsalzZn6Yp60yg6Y+gRcImvaSUyiW
	gBy0aVpHPU+N4MrMZuxgn7QHAkDJU9LZntA5YRj9mr3cAQxDigK1xcBug1qZ2tzgqE6O7cCzmR9
	wKUICp/0mSN7mYSrdP8peB06OaTiUZijxlRUMsu1KewTwjV0uO/FqOQHgVKprgroPJfEb5EBvI6
	bv9x+x/w3MR5GD8sS6u9zb8Jo9WMFyp0adNSxmH3EFr+L/4U0J4mxc7EY7QCMGw4JBqvUVRNFye
	z5fjtZuV1RT94zD8a63E6dZKuJcyPlA1QPDQhF+6B5KOkk7aNbdFpL2VK5N9saZ9E6tw==
X-Received: by 2002:a17:902:cf41:b0:29e:fd60:2cf9 with SMTP id d9443c01a7336-2a76b169703mr73489085ad.54.1769051057371;
        Wed, 21 Jan 2026 19:04:17 -0800 (PST)
Received: from eurus-Lenovo-Legion-Y70002021.. (n058152022160.netvigator.com. [58.152.22.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fb998sm168938085ad.69.2026.01.21.19.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 19:04:16 -0800 (PST)
From: Wang Jiayue <akaieurus@gmail.com>
To: dakr@kernel.org
Cc: broonie@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	hanguidong02@gmail.com,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_c_gdjako@quicinc.com,
	rafael@kernel.org,
	robin.clark@oss.qualcomm.com,
	robin.murphy@arm.com,
	will@kernel.org,
	Wang Jiayue <akaieurus@gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Date: Thu, 22 Jan 2026 11:03:56 +0800
Message-Id: <20260122030356.61373-1-akaieurus@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
References: <20260121141215.29658-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_190419_101084_C8442E3E 
X-CRM114-Status: GOOD (  22.52  )
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

On Wed, Jan 21, 2026 at 10:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:=0D
>=0D
> Commit 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in=0D
> qcom_smmu_impl_init") intended to also probe the TBU driver when=0D
> CONFIG_ARM_SMMU_QCOM_DEBUG is disabled, but also moved the corresponding=
=0D
> platform_driver_register() call into qcom_smmu_impl_init() which is=0D
> called from arm_smmu_device_probe().=0D
>=0D
> However, it neither makes sense to register drivers from probe()=0D
> callbacks of other drivers, nor does the driver core allow registering=0D
> drivers with a device lock already being held.=0D
>=0D
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce=0D
> device_lock for driver_match_device()") leading to a deadlock condition=0D
> described in [1].=0D
>=0D
> Additionally, it was noted by Robin that the current approach is=0D
> potentially racy with async probe [2].=0D
>=0D
> Hence, fix this by registering the qcom_smmu_tbu_driver from=0D
> module_init(). Unfortunately, due to the vendoring of the driver, this=0D
> requires an indirection through arm-smmu-impl.c.=0D
>=0D
> Reported-by: Mark Brown <broonie@kernel.org>=0D
> Closes: https://lore.kernel.org/lkml/7ae38e31-ef31-43ad-9106-7c76ea0e8596=
@sirena.org.uk/=0D
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/=
 [1]=0D
> Link: https://lore.kernel.org/lkml/0c0d3707-9ea5-44f9-88a1-a65c62e3df8d@a=
rm.com/ [2]=0D
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")=0D
> Fixes: 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in qco=
m_smmu_impl_init")=0D
=0D
Glad the backtrace helped identify the root cause.=0D
=0D
I applied this patch to the qemu setup where I successfully reproduced the=
=0D
boot hang earlier, and the deadlock is resolved.=0D
=0D
Tested-by: Wang Jiayue <akaieurus@gmail.com>=0D
Reviewed-by: Wang Jiayue <akaieurus@gmail.com>=0D
=0D
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>=0D
> ---=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 14 +++++++++++++=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 +++++++++----=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 24 +++++++++++++++++++++-=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 +++++=0D
>  4 files changed, 52 insertions(+), 5 deletions(-)=0D
>=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-impl.c=0D
> index db9b9a8e139c..4565a58bb213 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c=0D
> @@ -228,3 +228,17 @@ struct arm_smmu_device *arm_smmu_impl_init(struct ar=
m_smmu_device *smmu)=0D
>=0D
>         return smmu;=0D
>  }=0D
> +=0D
> +int __init arm_smmu_impl_module_init(void)=0D
> +{=0D
> +       if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))=0D
> +               return qcom_smmu_module_init();=0D
> +=0D
> +       return 0;=0D
> +}=0D
> +=0D
> +void __exit arm_smmu_impl_module_exit(void)=0D
> +{=0D
> +       if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))=0D
> +               qcom_smmu_module_exit();=0D
> +}=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c=0D
> index 573085349df3..22906d2c9a2d 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c=0D
> @@ -774,10 +774,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct a=
rm_smmu_device *smmu)=0D
>  {=0D
>         const struct device_node *np =3D smmu->dev->of_node;=0D
>         const struct of_device_id *match;=0D
> -       static u8 tbu_registered;=0D
> -=0D
> -       if (!tbu_registered++)=0D
> -               platform_driver_register(&qcom_smmu_tbu_driver);=0D
>=0D
>  #ifdef CONFIG_ACPI=0D
>         if (np =3D=3D NULL) {=0D
> @@ -802,3 +798,13 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct a=
rm_smmu_device *smmu)=0D
>=0D
>         return smmu;=0D
>  }=0D
> +=0D
> +int __init qcom_smmu_module_init(void)=0D
> +{=0D
> +       return platform_driver_register(&qcom_smmu_tbu_driver);=0D
> +}=0D
> +=0D
> +void __exit qcom_smmu_module_exit(void)=0D
> +{=0D
> +       platform_driver_unregister(&qcom_smmu_tbu_driver);=0D
> +}=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c=0D
> index 5e690cf85ec9..1e218fbea35a 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c=0D
> @@ -2365,7 +2365,29 @@ static struct platform_driver arm_smmu_driver =3D =
{=0D
>         .remove =3D arm_smmu_device_remove,=0D
>         .shutdown =3D arm_smmu_device_shutdown,=0D
>  };=0D
> -module_platform_driver(arm_smmu_driver);=0D
> +=0D
> +static int __init arm_smmu_init(void)=0D
> +{=0D
> +       int ret;=0D
> +=0D
> +       ret =3D platform_driver_register(&arm_smmu_driver);=0D
> +       if (ret)=0D
> +               return ret;=0D
> +=0D
> +       ret =3D arm_smmu_impl_module_init();=0D
> +       if (ret)=0D
> +               platform_driver_unregister(&arm_smmu_driver);=0D
> +=0D
> +       return ret;=0D
> +}=0D
> +module_init(arm_smmu_init);=0D
> +=0D
> +static void __exit arm_smmu_exit(void)=0D
> +{=0D
> +       arm_smmu_impl_module_exit();=0D
> +       platform_driver_unregister(&arm_smmu_driver);=0D
> +}=0D
> +module_exit(arm_smmu_exit);=0D
>=0D
>  MODULE_DESCRIPTION("IOMMU API for ARM architected SMMU implementations")=
;=0D
>  MODULE_AUTHOR("Will Deacon <will@kernel.org>");=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h=0D
> index 2dbf3243b5ad..26d2e33cd328 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h=0D
> @@ -540,6 +540,11 @@ struct arm_smmu_device *arm_smmu_impl_init(struct ar=
m_smmu_device *smmu);=0D
>  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *sm=
mu);=0D
>  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu=
);=0D
>=0D
> +int __init arm_smmu_impl_module_init(void);=0D
> +void __exit arm_smmu_impl_module_exit(void);=0D
> +int __init qcom_smmu_module_init(void);=0D
> +void __exit qcom_smmu_module_exit(void);=0D
> +=0D
>  void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);=
=0D
>  int arm_mmu500_reset(struct arm_smmu_device *smmu);=0D
>=0D
>=0D
> base-commit: dc23806a7c47ec5f1293aba407fb69519f976ee0=0D
> --=0D
> 2.52.0=0D
>=0D

