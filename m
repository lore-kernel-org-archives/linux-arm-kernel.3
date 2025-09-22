Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB9ACA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVviXf5YU+9P2d/aDTKI7LbuCiNyt7cF6b374RUwvtY=; b=zYixBm8zBRVEmR1w2Ty2o8jWPF
	pwdTlCQSJ+xBJJlTMdUCa8oS57EeGuT3QYM17JvgmBiHkW+Qqto1K29wQU6WrZhHz6q2MYiQsuAj8
	UG+/WNotZOp5lkoh50RZchcRS/x5oP83VHnsSklv7zzsjKGu7S2OvuxePo8Cjdoqj0SLtRLbck47P
	keFuNChkueoOEzg0UpOhsGPqJyslEiXFBIXTy8lWVXsJFUytFXUwgMnMAXNcMpESfDo30HQW/zIsx
	TQZCw4LmFLPtKToUOGg/14ek1sq43g2gW8HE6i5O4ZjJh0YnFk9KFKigR+dV+Zp7i3LS7uBzj/hii
	eK41Z2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0k3M-0000000B4Pb-06w5;
	Mon, 22 Sep 2025 17:10:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0k3K-0000000B4PK-0tUU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9381C601FE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 17:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E46C113D0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758561013;
	bh=LjfO8KQZ0pOYPVi6VN1I03sM/JgE4fiqagXrNbVWxZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lrj9Z2fxus0EQD+OB8bJazR3ZDEcJSQZ18UQsQULqJ5Iq/2vZufMw5d4giGj7gNNa
	 pN5PYjh+13AUKIwXi2iTfzlanD897Sw+SFtyZrYMLvg2VzDJVDpElUWHtXpr49HdFC
	 MiRqsd8tPCaR8ldWVTFwqNPyLSwkvlErbo+t4SYAa+1WrlHlrbKd8hVbkR3rVRKQtM
	 N4QS7Pd+JeKbhZYawQnaK+jGr2G18cAqnI/tRMUWeR2LncyOvSm7TkirwKqPFVo2ug
	 zhFJr01QXTlmzN4mzXR5sHcjM+OnjjzaxKbYHituJStPbR+ud6HZp8MqMXf1k+1LTn
	 +3TEuGJxT22Eg==
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-750b77699b4so3213871a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 10:10:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+LjZgvcdN6HO6Ua791GztyHXuGU96tr4azncDwOC4+eVeq/MY840Jdxp6pnjD6k78MSi1ZrsArYSK9ySSNLQ2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcugx2ho9QlQ/kJK2LETdHT+qRlXlMlS4eJI4YVOchoKYvddAs
	JTjSfA125eMCOJwW0twvnS5K3qmOzIxpL3WXcsIuSypM3EIY1gvKfDZlIEXr2C5MQG420fu++wj
	ujrEne3A3UF9iD24BGArDBQ806tEHaio=
X-Google-Smtp-Source: AGHT+IEQgrPHe32vZeMLsnLLopfoaTVSCbgyw3/FvnA92tK1XG9E0pwJSaFqOTcNR67lm0Y9z3GITnD3dGbnCFY+o04=
X-Received: by 2002:a05:6830:611a:b0:756:a322:2f8 with SMTP id
 46e09a7af769-76f6e58e005mr8523341a34.5.1758561012535; Mon, 22 Sep 2025
 10:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250922082833.2038905-1-maz@kernel.org> <20250922082833.2038905-3-maz@kernel.org>
In-Reply-To: <20250922082833.2038905-3-maz@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 22 Sep 2025 19:10:01 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jPdvdTUWqW1OEkLUSrucifEQxmKjEn2H5Xp4g_4q_+Gw@mail.gmail.com>
X-Gm-Features: AS18NWB5qQhnXhcfR4zq93qjbiiurDZoCQiEBrfaJ7614-vzCAHGIWYi6x8OUsg
Message-ID: <CAJZ5v0jPdvdTUWqW1OEkLUSrucifEQxmKjEn2H5Xp4g_4q_+Gw@mail.gmail.com>
Subject: Re: [PATCH v3 02/26] ACPI: irq: Add IRQ affinity reporting interface
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>
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

On Mon, Sep 22, 2025 at 10:28=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
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
> 2.47.3
>

