Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69143C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJOaIwJksVgqzkyxULme5s0lvGaz8JLS/ZEFwROlRsc=; b=4KNGXEFOO726uw4j8FKRUNu9aI
	nCnzApgCZnvlGqzcgHHp1zM8b7zyW6zXIN/Fvc6FJ9AVScCvDxG1DIQYk+j+MsVJx7IrIi70jx0Ga
	x4XqFLyOZ8SO6VNgy4FkueiUdryaoi9DVMfr3FMst6jAA5BgLvFyhjo8cnfwukCLuIEDhNdMprrFE
	sP80s4OeJhJDUGu4Hxk824pHGkZlH/IcxCwJOCIRXPjaIpgOVXs0dg1Ui1bcAJgA/U8hmBH9Uzo+H
	kk9Nz0MXssDru6L0bWKuyQPDfc6Pvw5UWYei8N7WZvBtKQDxFm/haAjWDz8wA3BUOOHly6TjUSq2/
	qjYLwURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSYc-00000008prC-43Ww;
	Wed, 26 Mar 2025 15:20:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSAD-00000008lQq-0jWO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D59AB4418D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 14:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E48C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743000928;
	bh=2FjJkXZ1Sr7UVOgZLzCfOaayYT0ey4QBq9TK9OK+P/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EDcfB9qLmelk6xZBmGSi6mVmBLovFad1OlocQSjvhAzVhMR4BNYCA3B1ucq9r7CFS
	 cWRFZXzLCJPSfvojCRGMK+jR9d4nmSuyVqNj+RKWjOga4AOIwX9euhqO39IrABy41l
	 2KdRhz6J2dE7iA90FqghusvHqjBxxG7N+7URoK8Ztvs1/u4mS2Oznn+lfI6vPX+GG5
	 De+ihB8MKEnkpQWKZmoXR7gSaGKmeITCRHvHQwuOxCdmySMsM6qjYkCAZoeG7/Yb0h
	 za/Ajad6cxqyEm4G8qFFp6CPHdFMYNH/P0aPMpvwRZ0BaNIqZqgL8BOTFf60d2SM7/
	 wtstXXj3BMV3Q==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2c2ada8264aso3066042fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:55:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVt9jb5BJr0Ot1vyb2g4TJUCQA13cNFE7hoxbyTUSmNz+VTqkO/Twub72AlhDi03nU/kYIOcyzTtIx7gh5gBbRq@lists.infradead.org
X-Gm-Message-State: AOJu0YyyY3r49HYgePmuRxBueOmEXS4lLAfnPm31T8CwzOwtJwMRwdxT
	G4iExW2lwyKfcLSdn0HAj9JPLrv/e+qHftuFMN7QvB4pmHCFnT20CgsFDpdECN+JIb5eqFckqbS
	DdKtasv1rB+IkWQSWMVVy0LK9kNU=
X-Google-Smtp-Source: AGHT+IEYYA/6LylePhPYpVsBFlVh+o1a/2X6ugf3+5Zk77UyBnBXpaSo0UzJzWGtji5Mqp0Q8hwWmxY8a4Ns27KKFng=
X-Received: by 2002:a05:6871:5223:b0:2bd:455e:c22e with SMTP id
 586e51a60fabf-2c7803002damr12663712fac.19.1743000926945; Wed, 26 Mar 2025
 07:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250315001931.631210-1-romank@linux.microsoft.com> <20250315001931.631210-11-romank@linux.microsoft.com>
In-Reply-To: <20250315001931.631210-11-romank@linux.microsoft.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 26 Mar 2025 15:55:15 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g1bX_3zRUUf-=euuvhm1dPB6bjEXPH9O-kMGcZjRspcw@mail.gmail.com>
X-Gm-Features: AQ5f1Jr4yQ264W4Fr4uvYbe-kFtKKfam4-v0_OqzzA1JU-y-jScH9oT2tKvFv-0
Message-ID: <CAJZ5v0g1bX_3zRUUf-=euuvhm1dPB6bjEXPH9O-kMGcZjRspcw@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v6 10/11] ACPI: irq: Introduce acpi_get_gsi_dispatcher()
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, catalin.marinas@arm.com, 
	conor+dt@kernel.org, dan.carpenter@linaro.org, dave.hansen@linux.intel.com, 
	decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com, 
	joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com, 
	lenb@kernel.org, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, 
	mark.rutland@arm.com, maz@kernel.org, mingo@redhat.com, 
	oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org, 
	ssengar@linux.microsoft.com, sudeep.holla@arm.com, suzuki.poulose@arm.com, 
	tglx@linutronix.de, wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com, 
	devicetree@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org, 
	apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com, 
	sunilmut@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_075529_252745_9B3CB786 
X-CRM114-Status: GOOD (  22.95  )
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

On Sat, Mar 15, 2025 at 1:19=E2=80=AFAM Roman Kisel <romank@linux.microsoft=
.com> wrote:
>
> Using acpi_irq_create_hierarchy() in the cases where the code
> also handles OF leads to code duplication as the ACPI subsystem
> doesn't provide means to compute the IRQ domain parent whereas
> the OF does.
>
> Introduce acpi_get_gsi_dispatcher() so that the drivers relying
> on both ACPI and OF may use irq_domain_create_hierarchy() in the
> common code paths.
>
> No functional changes.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>

This basically looks OK to me except for a couple of coding style
related nits below.

> ---
>  drivers/acpi/irq.c   | 15 +++++++++++++--
>  include/linux/acpi.h |  5 ++++-
>  2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
> index 1687483ff319..8eb09e45e5c5 100644
> --- a/drivers/acpi/irq.c
> +++ b/drivers/acpi/irq.c
> @@ -12,7 +12,7 @@
>
>  enum acpi_irq_model_id acpi_irq_model;
>
> -static struct fwnode_handle *(*acpi_get_gsi_domain_id)(u32 gsi);
> +static acpi_gsi_domain_disp_fn acpi_get_gsi_domain_id;
>  static u32 (*acpi_gsi_to_irq_fallback)(u32 gsi);
>
>  /**
> @@ -307,12 +307,23 @@ EXPORT_SYMBOL_GPL(acpi_irq_get);
>   *     for a given GSI
>   */
>  void __init acpi_set_irq_model(enum acpi_irq_model_id model,
> -                              struct fwnode_handle *(*fn)(u32))

Please retain the indentation here and analogously below.

> +       acpi_gsi_domain_disp_fn fn)
>  {
>         acpi_irq_model =3D model;
>         acpi_get_gsi_domain_id =3D fn;
>  }
>
> +/**
> + * acpi_get_gsi_dispatcher - Returns dispatcher function that
> + *                           computes the domain fwnode for a
> + *                           given GSI.
> + */

I would format this kerneldoc comment a bit differently:

/*
 * acpi_get_gsi_dispatcher() - Get the GSI dispatcher function
 *
 * Return the dispatcher function that computes the domain fwnode for
a given GSI.
 */

> +acpi_gsi_domain_disp_fn acpi_get_gsi_dispatcher(void)
> +{
> +       return acpi_get_gsi_domain_id;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_gsi_dispatcher);
> +
>  /**
>   * acpi_set_gsi_to_irq_fallback - Register a GSI transfer
>   * callback to fallback to arch specified implementation.
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 4e495b29c640..abc51288e867 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -336,8 +336,11 @@ int acpi_register_gsi (struct device *dev, u32 gsi, =
int triggering, int polarity
>  int acpi_gsi_to_irq (u32 gsi, unsigned int *irq);
>  int acpi_isa_irq_to_gsi (unsigned isa_irq, u32 *gsi);
>
> +typedef struct fwnode_handle *(*acpi_gsi_domain_disp_fn)(u32);
> +
>  void acpi_set_irq_model(enum acpi_irq_model_id model,
> -                       struct fwnode_handle *(*)(u32));
> +       acpi_gsi_domain_disp_fn fn);
> +acpi_gsi_domain_disp_fn acpi_get_gsi_dispatcher(void);
>  void acpi_set_gsi_to_irq_fallback(u32 (*)(u32));
>
>  struct irq_domain *acpi_irq_create_hierarchy(unsigned int flags,
> --

With the above addressed, please feel free to add

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

to the patch and route it along with the rest of the series.

Thanks!

