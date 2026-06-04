Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4214FCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1HiQn7Sj8ACG6yAdiTjOB9XT8tmQZ7bjDWPDZ23wt0=; b=LlOnceuV+1ZsXiTECVqkNYgtxC
	wnKXM2xbse3aiRZYsg0WQVsiN3RC0hdfctQTDQ6MU5JGdRC4CbHJVn/gEpj/Qkc1FAzVXFxx/t9QH
	Qm7tf6KVk7HbjQMREjy9qW2NCIt34dQuP14OtyMr8lqS1vhf4ddQ9J0QYRl3o8PYcwNebTO+5PGwd
	q4Wb8645aRZw3uEJcqxeGP7DA55qndSbZrOH4j4vka3Y/cLqvJFXbqthZvjSei84hZ1OLPza28F47
	MvkIW9M6zVA4ogRXyw9JcIZdKVC51AYF/GOj4AozAuRy61QEELQH4trR3ED7cPPVhoL69GPlybfTz
	bZZ6Mk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV85l-0000000GnFt-1P9T;
	Thu, 04 Jun 2026 13:26:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV85k-0000000GnFn-3lts
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:26:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 90A2140338;
	Thu,  4 Jun 2026 13:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5461F00893;
	Thu,  4 Jun 2026 13:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780579596;
	bh=X1HiQn7Sj8ACG6yAdiTjOB9XT8tmQZ7bjDWPDZ23wt0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bbdbeaSHdffGKrFkjEGKKLzhXkGm8ZRRyvvk2T38YWtxavtizF10huPufi3qBVIXc
	 D/lrOcC6l4hAYS+dzW0pvH2k2SR8hkhpgMueiMPgMFQAokTjua6hv25qB5IeRq2JvA
	 AJKheqD9FJGfs3gfN4V/5T8SVCIH1doGkFdILE4ZpJ2sfX4hjyN2PJO82AbYgB12Am
	 J73q0GNh+IL7WbrJr4alMW2oZY/cPU3+bmr8yxgySP9/sTYsTIi0FxD8bZwqyYcqek
	 ylMnfjPr5LVber9b3ojKwALS+3BaHJZGYtu2CR/Mt3j4NKScfSzgTKl2ImiQEDoO+U
	 +YIsckLx1kFpA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
In-Reply-To: <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
Date: Thu, 04 Jun 2026 18:56:28 +0530
Message-ID: <yq5ase72qvwb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Sudeep Holla <sudeep.holla@kernel.org> writes:

...

> +static const struct smccc_device_info smccc_devices[] __initconst =3D {
> +       {
> +               .func_id        =3D ARM_SMCCC_TRNG_VERSION,
> +               .requires_smc   =3D false,
> +               .min_return     =3D ARM_SMCCC_TRNG_MIN_VERSION,
> +               .device_name    =3D "arm-smccc-trng",
> +       },
> +};
> +
> +static bool __init
> +smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> +{
> +       struct arm_smccc_res res;
> +       unsigned long ret;
> +
> +       if (!IS_ENABLED(CONFIG_ARM64))
> +               return false;
> +
> +       if (smccc_conduit =3D=3D SMCCC_CONDUIT_NONE)
> +               return false;
> +
> +       if (smccc_dev->requires_smc && smccc_conduit !=3D SMCCC_CONDUIT_S=
MC)
> +               return false;
> +
> +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> +       ret =3D res.a0;
> +
> +       if ((s32)ret < 0)
> +               return false;
> +
> +       return ret >=3D smccc_dev->min_return;
> +}
> +
>

I am not sure we want the check to be as simple as ret < 0. Some
function IDs may return input errors based on the supplied arguments
(for example, RMI_ERROR_INPUT). In those cases, we would likely want
this to be handled via a callback.

We also want to use conditional compilation for some function IDs.
Given the callback approach and the #ifdefs, I wonder whether what we
currently have is actually simpler and more flexible.=E2=80=9D

>  void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit c=
onduit)
>  {
>         struct arm_smccc_res res;
> @@ -31,7 +68,7 @@ void __init arm_smccc_version_init(u32 version, enum ar=
m_smccc_conduit conduit)
>         smccc_version =3D version;
>         smccc_conduit =3D conduit;
>
> -       smccc_trng_available =3D smccc_probe_trng();
> +       smccc_trng_available =3D smccc_probe_smccc_device(&smccc_devices[=
0]);
>
>         if ((smccc_version >=3D ARM_SMCCC_VERSION_1_2) &&
>             (smccc_conduit !=3D SMCCC_CONDUIT_NONE)) {
> @@ -241,14 +278,20 @@ subsys_initcall(arm_smccc_bus_init);
>
>  static int __init smccc_devices_init(void)
>  {
> -       struct platform_device *pdev;
> -
> -       if (smccc_trng_available) {
> -               pdev =3D platform_device_register_simple("smccc_trng", -1,
> -                                                      NULL, 0);
> -               if (IS_ERR(pdev))
> -                       pr_err("smccc_trng: could not register device: %l=
d\n",
> -                              PTR_ERR(pdev));
> +       const struct smccc_device_info *smccc_dev;
> +       struct arm_smccc_device *sdev;
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(smccc_devices); i++) {
> +               smccc_dev =3D &smccc_devices[i];
> +
> +               if (!smccc_probe_smccc_device(smccc_dev))
> +                       continue;
> +
> +               sdev =3D arm_smccc_device_register(smccc_dev->device_name=
);
> +               if (IS_ERR(sdev))
> +                       pr_err("%s: could not register device: %ld\n",
> +                              smccc_dev->device_name, PTR_ERR(sdev));
>         }
>
>         return 0;
>

-aneesh

