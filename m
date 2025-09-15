Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B61ACAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dqLGG8XlcR0E1wkJEw7pADcrCrNtRMG0R3bYF9N508=; b=kFcjuEpuPLrKKqjdkpB9T7ETDO
	Ts+lRFqLid+HhfWUcHrjPlxpPg20FwRFlnUCY+Ys4xcmcU27jpeggE0u5ByVwZxgoGD+N+OtCs27D
	MX9ct1+LcK4zMrdiFXZFbHmMdsBzfY27jchm5h//1DoFv2ped9Q2C1pphIpGPla06HIEDkMlAJ5er
	TEj+34GESctfc5pBvh77KhmPIEnQ476vnBgZQ3gzqy+7REgJ85AytjqKFDXz3ykJLxCVLHPl6PAYD
	s+b3dWDl2EwwVAgpk/Q2xGUQhYzAywGdBvo8aFA/KqY+ZYDP1hfrBVvOxHmqcxUq/ptqM632VCadC
	asx30WfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6GU-00000003cHF-3J11;
	Mon, 15 Sep 2025 10:16:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6GT-00000003cH4-3ROz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 446B6601D2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 10:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8334C4CEFE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757931412;
	bh=ZiVvWIffehN2Q6Px9dVsyvsbdVXJBkYiBFE/Cflc4qk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QZ1/4pDhC1cWxgrKZd+MijpZMUOwnrbAZMoJye29rbze6U7HMz4Vh6eukaUDKIEfq
	 IAoAMiepVsym0GEhrKGouXjtJtnt5OcZep0kOiE7VpVGbogBYX5+oAZG9TveynIjWp
	 VfBCFmq1RiH5GlNjjbs6XHKHpZu8EyCzHJRz4++eQqnfb8GsPKNmYIJNab9YeIhPl7
	 c5z/ZtRJ9uIWWoOxaBwXa0wSTZonUefCyPsU2mV27QUzFgtDKoPN2ooVBE4lHuXYol
	 gsYwbjSWJ5R2Lk3U2EWpHbRuiSZg2trzf4fxmj3KMjvj2uzNn7K/UDx7ZK14vqgJsR
	 kos6FSmduZ9+w==
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-746d3b0f7e5so3526741a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 03:16:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCPRupBoULqZezH6UhSgySpPbqjIV9/cXTnyLTjgpOLF5hCB4VBFdA7eCCTS0GhcuT758BJNa6iVjQW/kF47GJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwhebcCcpAFE52neebwe6HwWz0WEa3kEcCoSGibzDX/6UkNoTZ1
	j4pmXbV2yNKmQvV887pHmgQujdwj8TpyRkNf7aNAJ0HF9z8nQS3/APuw6IeSCvTZyrXaA+T4935
	L1zf2ZNjIQzZukuKDmF727tIt19YeTLo=
X-Google-Smtp-Source: AGHT+IHkc9WA1H1RAzKSXflZFNZUb5BQK4FvLF4EHvdkLxrAnXIuGEhgXx7Jom4DNm6HBoQZRGmY5ncRbgMzQeiN+RA=
X-Received: by 2002:a05:6830:65d2:20b0:757:5bc5:3f2f with SMTP id
 46e09a7af769-7575bc544c7mr1998812a34.36.1757931412233; Mon, 15 Sep 2025
 03:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250915085702.519996-1-maz@kernel.org> <20250915085702.519996-3-maz@kernel.org>
In-Reply-To: <20250915085702.519996-3-maz@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 15 Sep 2025 12:16:36 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iMQJV6mXS3STN6qkNT+eBpC8wGwOorA=-N8Jt+9dDm4A@mail.gmail.com>
X-Gm-Features: Ac12FXwK7HYdc3TEF2ZC4JVY_CmEo3BbTiV6hYw23p4jbXZLrpzMKN2MNXJ-Jik
Message-ID: <CAJZ5v0iMQJV6mXS3STN6qkNT+eBpC8wGwOorA=-N8Jt+9dDm4A@mail.gmail.com>
Subject: Re: [PATCH v2 02/25] ACPI: irq: Add IRQ affinity reporting interface
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Sep 15, 2025 at 10:57=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Plug the irq_populate_fwspec_info() helper into the ACPI layer
> to offer an IRQ affinity reporting function. This is currently
> only supported for the CONFIG_ACPI_GENERIC_GSI configurations,
> but could later be extended to legacy architectures if necessary.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/acpi/irq.c   | 19 +++++++++++++++++++
>  include/linux/acpi.h |  7 +++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
> index 76a856c32c4d0..d1595156c86a4 100644
> --- a/drivers/acpi/irq.c
> +++ b/drivers/acpi/irq.c
> @@ -300,6 +300,25 @@ int acpi_irq_get(acpi_handle handle, unsigned int in=
dex, struct resource *res)
>  }
>  EXPORT_SYMBOL_GPL(acpi_irq_get);
>
> +const struct cpumask *acpi_irq_get_affinity(acpi_handle handle,
> +                                           unsigned int index)
> +{
> +       struct irq_fwspec_info info;
> +       struct irq_fwspec fwspec;
> +       unsigned long flags;
> +
> +       if (acpi_irq_parse_one(handle, index, &fwspec, &flags))
> +               return NULL;
> +
> +       if (irq_populate_fwspec_info(&fwspec, &info))
> +               return NULL;
> +
> +       if (!(info.flags & IRQ_FWSPEC_INFO_AFFINITY_VALID))
> +               return NULL;
> +
> +       return info.affinity;
> +}
> +
>  /**
>   * acpi_set_irq_model - Setup the GSI irqdomain information
>   * @model: the value assigned to acpi_irq_model
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 1c5bb1e887cd1..c506ae4bacc86 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1509,12 +1509,19 @@ static inline int acpi_parse_spcr(bool enable_ear=
lycon, bool enable_console)
>
>  #if IS_ENABLED(CONFIG_ACPI_GENERIC_GSI)
>  int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource=
 *res);
> +const struct cpumask *acpi_irq_get_affinity(acpi_handle handle,
> +                                           unsigned int index);
>  #else
>  static inline
>  int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource=
 *res)
>  {
>         return -EINVAL;
>  }
> +static inline const struct cpumask *acpi_irq_get_affinity(acpi_handle ha=
ndle,
> +                                                         unsigned int in=
dex)
> +{
> +       return NULL;
> +}
>  #endif
>
>  #ifdef CONFIG_ACPI_LPIT
> --
> 2.39.2
>

