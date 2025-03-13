Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0308C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rq/qv+y8dDgw7ZhPUrX84eJg7W99kBcA3pyMfFCVdG0=; b=joV8jV/R9bbwYvj3aumpZwT544
	nYIOUCZNg+glnRYahM2kb/Cb7xqvIHQ6IoIbENd7DuNIF3OrmN0a0XFYC8ULI0vOjTLGkL2CS2vJ2
	FLHrOHS8XrImVJnNktc8HjxeHpxxJHuOcuoxej7tdbPrtohWV9LM2+MbVro9VaXdyGkdx+qh/Pd9k
	A5fVxLA48cLmYzISox03GMY31LIAISM8IZtLqY975lskYBwZn0g+V6ZfU2Q+Anbl6pEnYyQwcDic1
	oa7QTPECsGPcX4WIACzXEftkN0nhUC9GahuBwKidkkDG8JLpZZJEVYVvjCnxBBeWjaNPhgSyifia+
	J0Hwxyvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsngA-0000000CEzz-03Q6;
	Thu, 13 Mar 2025 18:53:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnY7-0000000CDvi-2NRR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 18:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB444A478C8
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 18:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002D8C4CEFE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 18:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741891494;
	bh=QlrkRP5I6RTz1lPCtN5zk3M5pm0O9z7QzlqRgomvjQM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LnhXIoTkCwWwLQy654e32ktSRBBCvIiG9b2hKyu6onBsTkAjERAmziuGX0st7Auqg
	 SYpt7I+8sO50eeWmFz4B+ezIQL3iphfcwaLQCecNPFG238AST/I6mJjR9Cm7Qhtnsp
	 uqShKstvAdW4lKiXALVRC54yMBumFkP74kiRY5MvfBxq67fW2SVAaJuVvhRfMffnds
	 tCwJOnfiTqJ8ELFf0ZhW/7PFSl/BeJpC2wgo7+yoqk6AfscXq/e4I4u82rnPIoWM9t
	 hph5YEyoLUulJuNAdCm6KiWPYR7vKjMA3MNxqmcbQWjEQ0bEc8Bjy9bsWw3JEjXvpy
	 LdfYkYUvJQx2A==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso282097166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 11:44:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/BC3O/PoOYzQrLpFBPZL+j9GGE/hsKZFYLXaOLAthI+Wghj3Vz4jFC+Uar0BIwSKRdMGiKj8NJnB9zhs66ImA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo9FBwpZW7y4lPqBtkUfscz/QH3ON+xZcqZS4YVCINPQjDgRKD
	+WziaAiUh5/UgUlsYWshwQ3TX0ah1/bKy8a2xzhc86x1ANsMq6lTbLH1izy+5pNIOHf4tzWvHUk
	nX87jVQeJj78X3FLRln38OlxGNA==
X-Google-Smtp-Source: AGHT+IE84CwfiOJs5wEvz9/gyK0Vhm2tPQAYrNHeBZsspi51p+XlCkmCog0DPrxtkstcI25d+u0kzAVhA8ECGZ8aCbU=
X-Received: by 2002:a17:907:9382:b0:ac2:7a3b:31e2 with SMTP id
 a640c23a62f3a-ac2b9ea186bmr1272361466b.45.1741891492123; Thu, 13 Mar 2025
 11:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250307220304.247725-1-romank@linux.microsoft.com> <20250307220304.247725-9-romank@linux.microsoft.com>
In-Reply-To: <20250307220304.247725-9-romank@linux.microsoft.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 13 Mar 2025 13:44:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLmS4EEoPkOmaH6F_0XtQu5wkM-WEfxFvjLA=bJroEUVw@mail.gmail.com>
X-Gm-Features: AQ5f1JoBoOFXWy0RvRDKcw8n2aFR2QulZQgf-P4S7wWE9_vZ-wABCiQ7BInknts
Message-ID: <CAL_JsqLmS4EEoPkOmaH6F_0XtQu5wkM-WEfxFvjLA=bJroEUVw@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ
 number from DeviceTree
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, catalin.marinas@arm.com, 
	conor+dt@kernel.org, dave.hansen@linux.intel.com, decui@microsoft.com, 
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com, krzk+dt@kernel.org, 
	kw@linux.com, kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org, 
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com, maz@kernel.org, 
	mingo@redhat.com, oliver.upton@linux.dev, rafael@kernel.org, 
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
X-CRM114-CacheID: sfid-20250313_114455_737998_4BB15D02 
X-CRM114-Status: GOOD (  19.53  )
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

On Fri, Mar 7, 2025 at 4:03=E2=80=AFPM Roman Kisel <romank@linux.microsoft.=
com> wrote:
>
> The VMBus driver uses ACPI for interrupt assignment on
> arm64 hence it won't function in the VTL mode where only
> DeviceTree can be used.
>
> Update the VMBus driver to discover interrupt configuration
> from DT.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> ---
>  drivers/hv/vmbus_drv.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index 75eb1390b45c..c8474b48dcd2 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -2345,6 +2345,36 @@ static int vmbus_acpi_add(struct platform_device *=
pdev)
>  }
>  #endif
>
> +static int __maybe_unused vmbus_set_irq(struct platform_device *pdev)
> +{
> +       struct irq_data *data;
> +       int irq;
> +       irq_hw_number_t hwirq;
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq =3D=3D 0) {
> +               pr_err("VMBus interrupt mapping failure\n");
> +               return -EINVAL;
> +       }
> +       if (irq < 0) {
> +               pr_err("VMBus interrupt data can't be read from DeviceTre=
e, error %d\n", irq);
> +               return irq;
> +       }

I don't think why you couldn't get the interrupt is important. Just
check for (irq <=3D 0) and be done with it. I'm not even sure if
returning 0 is possible now. There's a long history to that and
NO_IRQ.

Rob

