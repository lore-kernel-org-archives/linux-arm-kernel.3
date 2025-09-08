Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312D5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCKAONdfc9/0Y5v2kv/17pa0WJYsF9qbdvhNx5w68jE=; b=nfH4sGehmm+g+RU6nHOsF7RYvT
	TbzCiCvZJmr0MWVNduXOWexB9gadmchIQjHvPaGcK2VGvHYJ0qkt4ElKwndAvSf0nYpVw+UU52MTW
	CNOlm3OOQtzEk6lOyiX/xI2VTLT7iiL6EUam5y/5duvctl1+EXmF/8d1p1ZRcyrs9D5DiGq3zaoNM
	cWy3KVYX+Ezu5aTaXE56qXmdd80HrHWCnzVHCE9cbWNJ4/SgDGifJ6Yv5G4u3JTgeYPUdGpfpeOXc
	TgoVtc28CYd/haL255kcqbwUze0V7EicGTk1MAqhko4h2ssAjp+ZTukHStxv7dlNGDG3a5NUvhiwa
	OqFc+Ybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvirp-00000002JLv-1sXj;
	Mon, 08 Sep 2025 20:53:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfXY-00000001ANF-3TBR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 17:20:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F241944A34
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 17:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C9DC4CEFA
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757352027;
	bh=WG6cG0RC7lf6sWYUt9oDwjKz1esgUSQzcQgi7vvimIU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a29NeqFSGpEF+96xbTO1WNJwcaERIetmb81Xgnn4IU83YBoLk8Rutt4IWOwFALEE0
	 Alo/yrF5Txar4LbjfsLU96+5JIOUdLTBbOWWhj863dRSEotYftRw8791NUViEN37uH
	 7vL5SDt8lxvdJgFnXs8yyk5LmDGIhAqer9EnM8XSTbl9he/b2vz7jBdIztMdZ26zOW
	 j7J5aPbexf2saw4lZKNoquB5ePSISpTgK86xUvgoCV98gqE2ZZaswqTjzpouutGG+Z
	 JZZF8UXIBG4kOyYZQKC8Xcwpe9a9BxIFcAWHPiQ0O9LXBnyQ3FExVITht/Di+oXYzE
	 U7DGVsfPwYeGA==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7459fa1ef2aso4603790a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 10:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW885+ulxtS8Lx184OLvMVjWWS1RwSv8Dih/euMldUpIaR2ennoe1QAIDJJ5rv1D2buqAPcHTHMR6gSJAhuj3I2@lists.infradead.org
X-Gm-Message-State: AOJu0YxqmIuLtLwFDnlArLyyuE7gXe7fbs1NTuM3Kw+Tlkzj2j9hqvYp
	6TJ4RZNkVmeYw1eY4YYHLrVmQD0JzXt73hqQBAISmzMxGNEBGeJTSj4XZBaPgc+U49EZdY7fm/T
	ThzIPwP899F9wa/I7+YSgGG/Taa5imZ0=
X-Google-Smtp-Source: AGHT+IGXpy+OU2UasaskUg2nePmnXAYN4fXokbNZNAf4Iw8rD1AI0zGefB9ESZkm15LcjA+jXp80pFZFT6EmdeISh+o=
X-Received: by 2002:a05:6808:181a:b0:43a:2e17:3ba8 with SMTP id
 5614622812f47-43b2988c314mr4081572b6e.0.1757352027077; Mon, 08 Sep 2025
 10:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250908163127.2462948-1-maz@kernel.org> <20250908163127.2462948-3-maz@kernel.org>
In-Reply-To: <20250908163127.2462948-3-maz@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Sep 2025 19:20:15 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hSJ6yMnfZgYDSZRqL_KMLc6f4kcY06dWGSPCFYjdcbfg@mail.gmail.com>
X-Gm-Features: Ac12FXwlVf4kn-tU9YEBjTnrid6i7WBV3fExLJM7cADt4nyooosqwvUywi8aWZo
Message-ID: <CAJZ5v0hSJ6yMnfZgYDSZRqL_KMLc6f4kcY06dWGSPCFYjdcbfg@mail.gmail.com>
Subject: Re: [PATCH 02/25] ACPI: irq: Add IRQ affinity reporting interface
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_102028_908554_7C3484DB 
X-CRM114-Status: GOOD (  22.68  )
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

On Mon, Sep 8, 2025 at 6:31=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> Plug the irq_populate_fwspec_info() helper into the ACPI layer
> to offer an IRQ affinity reporting function. This is currently
> only supported for the CONFIG_ACPI_GENERIC_GSI configurations,
> but could later be extended to legacy architectures if necessary.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/acpi/irq.c   | 15 +++++++++++++++
>  include/linux/acpi.h |  7 +++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
> index 76a856c32c4d0..22f93fe23ddce 100644
> --- a/drivers/acpi/irq.c
> +++ b/drivers/acpi/irq.c
> @@ -300,6 +300,21 @@ int acpi_irq_get(acpi_handle handle, unsigned int in=
dex, struct resource *res)
>  }
>  EXPORT_SYMBOL_GPL(acpi_irq_get);
>
> +const struct cpumask *acpi_irq_get_affinity(acpi_handle handle,
> +                                           unsigned int index)
> +{
> +       struct irq_fwspec_info info;
> +       unsigned long flags;
> +
> +       if (!acpi_irq_parse_one(handle, index, &info.fwspec, &flags)) {
> +               if (!irq_populate_fwspec_info(&info) &&
> +                   info.flags & IRQ_FWSPEC_INFO_AFFINITY_VALID)
> +                       return info.affinity;
> +       }

I would prefer fewer logical negations to be used in this, for instance:

if (acpi_irq_parse_one(handle, index, &info.fwspec, &flags))
      return NULL;

if (irq_populate_fwspec_info(&info))
       return NULL;

if (info.flags & IRQ_FWSPEC_INFO_AFFINITY_VALID)
       return info.affinity;

return NULL;

> +
> +       return NULL;
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

