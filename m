Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155E1C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+8CDJmAjZsPssV0ggSfxxBNl3Gdl3h5RbSdMHhf4co=; b=3fzvMsNlerZGzsm5/UFfRfeb9Q
	vFrrSHLf17FpI9Py5943OhxeO3fjCApKJercpyvcgrrshLcXl8xsiPmMdzT1FjJc/46ctK6s8Dn3/
	hSh+2kU7YglYieGgYnmrr9pTkKW4BpBSree3spEXaSEZ2G+6FEOi+9Hp9JgtAZaKCfxuYebQzahlP
	H5McM/FQWuCt5ROS0V6upUiNcA/3Prc0oWvvmSeVUcMVV9WJuAIQPxCB+tOLO1zF930NYzqRoiXgV
	XoDjqdnbiPG6XErQWIcJ4GHl4mqUujVRyW6/hD3V3l0K6TGfTkKRwn+zFhNgWwo5v2dxd4Keope8h
	JjZhh2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcsG-0000000FDOk-2R2X;
	Wed, 07 May 2025 11:23:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcqH-0000000FD4K-0A62
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 11:21:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4703DA4D844
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 May 2025 11:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD1DC4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 May 2025 11:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746616895;
	bh=3+2fK82d17kLNGEgZ7nbWq+wHF7vu5P36SkVG/tLjvg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=chRTb8fOWggK0N7iiuNQ/v1Rvck/fbugnUfhr4M6/j9UtoMyPx+8j0i6TVpKUhZaf
	 cqw7Q/eS7CESUAz2fYTZoaf37BJfCXzwpEk/1nTAm0521fQ7QBGGVBwROsIIrQli2+
	 sYTH/Kr//ZUuR7R3QBDCflR44wEOJfWvDLeU9h2E7ECFYCg2ajeCOz+tNraBySXDRf
	 rZDoeNDoGbWf1eIIbSH94LMtVmbriNwpNBoP0KcUHzUl5qkXY1JjBca6eR6JFevYdm
	 kjyoS5VMMygbXa3g0asBl3aDcjuPKAPlXNfB/RssGCNqCweSbu0npJVaaIPpdsQShk
	 ciXqvn7OieqbA==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2c2bb447e5eso3938355fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 04:21:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQNb1IFmsXLsUDX87BkPpIMzEfRi85BhxiACOKFt9cKqr6L75EcJyQoW+rGN6xINe5jHj/BrQ9oVs6FDpq966J@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5HmDiSW5TRz8X0co6NNPAsFjmdO2DeKQQYV1O01t/43RHJnem
	xF946s+kk5jebKcHCusOLze9yEeTZ9Q7efUaSrguyeBKk4ihzgVATh0teLLm+V1/wc8BBFPkR4Q
	YdFA5MvuGBQJBAISI4jwUtYfYWiQ=
X-Google-Smtp-Source: AGHT+IHx5aU2gpgR8Hogb7kdz6O2xA5Mgv0dsRK/eORWotywyugm1yRIQFc9U6FAqZ5lkKfQHqoxiY49fdrLDJye6a0=
X-Received: by 2002:a05:6870:7181:b0:29e:559b:d694 with SMTP id
 586e51a60fabf-2db5c126f5amr1748992fac.32.1746616895114; Wed, 07 May 2025
 04:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250507045757.2658795-1-quic_hyiwei@quicinc.com>
In-Reply-To: <20250507045757.2658795-1-quic_hyiwei@quicinc.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 7 May 2025 13:21:23 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g7NX_deRHqxS3BXVKzLU9xt9TADZwynhVw5soNtXXjvQ@mail.gmail.com>
X-Gm-Features: ATxdqUH1_GxH74KxLFis64TfYjpSjmwmTxfnHuyjOZKRF4hFfO_-aKBP95sIa0Q
Message-ID: <CAJZ5v0g7NX_deRHqxS3BXVKzLU9xt9TADZwynhVw5soNtXXjvQ@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: SDEI: Allow sdei initialization without ACPI_APEI_GHES
To: Huang Yiwei <quic_hyiwei@quicinc.com>
Cc: will@kernel.org, rafael@kernel.org, lenb@kernel.org, james.morse@arm.com, 
	tony.luck@intel.com, bp@alien8.de, xueshuai@linux.alibaba.com, 
	quic_aiquny@quicinc.com, quic_satyap@quicinc.com, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@quicinc.com, kernel@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_042137_226639_779EC384 
X-CRM114-Status: GOOD (  32.48  )
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

On Wed, May 7, 2025 at 6:58=E2=80=AFAM Huang Yiwei <quic_hyiwei@quicinc.com=
> wrote:
>
> SDEI usually initialize with the ACPI table, but on platforms where
> ACPI is not used, the SDEI feature can still be used to handle
> specific firmware calls or other customized purposes. Therefore, it
> is not necessary for ARM_SDE_INTERFACE to depend on ACPI_APEI_GHES.
>
> In commit dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES
> in acpi_init()"), to make APEI ready earlier, sdei_init was moved
> into acpi_ghes_init instead of being a standalone initcall, adding
> ACPI_APEI_GHES dependency to ARM_SDE_INTERFACE. This restricts the
> flexibility and usability of SDEI.
>
> This patch corrects the dependency in Kconfig and splits sdei_init()
> into two separate functions: sdei_init() and acpi_sdei_init().
> sdei_init() will be called by arch_initcall and will only initialize
> the platform driver, while acpi_sdei_init() will initialize the
> device from acpi_ghes_init() when ACPI is ready. This allows the
> initialization of SDEI without ACPI_APEI_GHES enabled.
>
> Fixes: dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES in apci_=
init()")
> Cc: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

for the ACPI bits and please route this through ARM.

Thanks!

> ---
>  drivers/acpi/apei/Kconfig   |  1 +
>  drivers/acpi/apei/ghes.c    |  2 +-
>  drivers/firmware/Kconfig    |  1 -
>  drivers/firmware/arm_sdei.c | 11 ++++++++---
>  include/linux/arm_sdei.h    |  4 ++--
>  5 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
> index 3cfe7e7475f2..070c07d68dfb 100644
> --- a/drivers/acpi/apei/Kconfig
> +++ b/drivers/acpi/apei/Kconfig
> @@ -23,6 +23,7 @@ config ACPI_APEI_GHES
>         select ACPI_HED
>         select IRQ_WORK
>         select GENERIC_ALLOCATOR
> +       select ARM_SDE_INTERFACE if ARM64
>         help
>           Generic Hardware Error Source provides a way to report
>           platform hardware errors (such as that from chipset). It
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index 289e365f84b2..0f3c663c1b0a 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -1715,7 +1715,7 @@ void __init acpi_ghes_init(void)
>  {
>         int rc;
>
> -       sdei_init();
> +       acpi_sdei_init();
>
>         if (acpi_disabled)
>                 return;
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index aadc395ee168..7df19d82aa68 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -31,7 +31,6 @@ config ARM_SCPI_PROTOCOL
>  config ARM_SDE_INTERFACE
>         bool "ARM Software Delegated Exception Interface (SDEI)"
>         depends on ARM64
> -       depends on ACPI_APEI_GHES
>         help
>           The Software Delegated Exception Interface (SDEI) is an ARM
>           standard for registering callbacks from the platform firmware
> diff --git a/drivers/firmware/arm_sdei.c b/drivers/firmware/arm_sdei.c
> index 3e8051fe8296..71e2a9a89f6a 100644
> --- a/drivers/firmware/arm_sdei.c
> +++ b/drivers/firmware/arm_sdei.c
> @@ -1062,13 +1062,12 @@ static bool __init sdei_present_acpi(void)
>         return true;
>  }
>
> -void __init sdei_init(void)
> +void __init acpi_sdei_init(void)
>  {
>         struct platform_device *pdev;
>         int ret;
>
> -       ret =3D platform_driver_register(&sdei_driver);
> -       if (ret || !sdei_present_acpi())
> +       if (!sdei_present_acpi())
>                 return;
>
>         pdev =3D platform_device_register_simple(sdei_driver.driver.name,
> @@ -1081,6 +1080,12 @@ void __init sdei_init(void)
>         }
>  }
>
> +static int __init sdei_init(void)
> +{
> +       return platform_driver_register(&sdei_driver);
> +}
> +arch_initcall(sdei_init);
> +
>  int sdei_event_handler(struct pt_regs *regs,
>                        struct sdei_registered_event *arg)
>  {
> diff --git a/include/linux/arm_sdei.h b/include/linux/arm_sdei.h
> index 255701e1251b..f652a5028b59 100644
> --- a/include/linux/arm_sdei.h
> +++ b/include/linux/arm_sdei.h
> @@ -46,12 +46,12 @@ int sdei_unregister_ghes(struct ghes *ghes);
>  /* For use by arch code when CPU hotplug notifiers are not appropriate. =
*/
>  int sdei_mask_local_cpu(void);
>  int sdei_unmask_local_cpu(void);
> -void __init sdei_init(void);
> +void __init acpi_sdei_init(void);
>  void sdei_handler_abort(void);
>  #else
>  static inline int sdei_mask_local_cpu(void) { return 0; }
>  static inline int sdei_unmask_local_cpu(void) { return 0; }
> -static inline void sdei_init(void) { }
> +static inline void acpi_sdei_init(void) { }
>  static inline void sdei_handler_abort(void) { }
>  #endif /* CONFIG_ARM_SDE_INTERFACE */
>
> --
> 2.25.1
>

