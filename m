Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BB9C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=au0zSD9uIzk8KDMl++CozfwYKHXdQtHsW0yP2b3i6kg=; b=uw2LR+nax3r4ONdS7k0ilVvCSO
	iBPtYgHTwUjMrbrJ/2ujfuNtF9EPEzlu15CRi36LKF7NfuDcdMYbOIivjsalpAD1XI9GiUe1fBDRU
	ct3+yiTvAhF/dw7ErZzOhe5caTV65gtpC1gYqqOgNw7XHDsT5i9xY2GqgRsF0BQFuovfaJw4D6R4/
	wndWThRAs2CDIz5hmWSZBXxBJqgQnTLmHnVJ/DAoAEGgzq2iRYGnoyMvAPViTu5v6aYuHv6bggNdO
	c01zxCQ5QK5IZFe9b8rZ1FUvJzJJOAuIEodoZxAPzlUiQYYp068rSNmRaXI0/ZOFUFQoF5wyN8aPD
	UXErpatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnQB-00000009erc-0C0u;
	Tue, 14 Jan 2025 20:21:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnOu-00000009elR-3MDJ;
	Tue, 14 Jan 2025 20:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A25C7A41BBD;
	Tue, 14 Jan 2025 20:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6502AC4CEE5;
	Tue, 14 Jan 2025 20:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736886035;
	bh=I9Ekx6aq/CtvmHlK2JuDkCREj16AUwVV0szqwfvn2B8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JD22uIFW+fdCoYLcYeIsO2Txr02Nmv6PaD3vP9xJM7UUTueYcu0+ONzHQG06vXduq
	 lkoMo+Ps9CQCr69LMbVC2r9TQ2pbJeuo+AKkJiGA41O1f7iirwWhLVUxRW/AUz8kuH
	 jZpbpAJaemRr7wa9BNXuP5WR85oNMonECKjO4soOFO0HIZB1U6fpR0kVfbKf6g947P
	 Y0CUnLeoKueHwxpK6IgZ0MpvJ1xE8c/iapkJ0dgX+jM1tRAv2LScMM/ZaftTdnfnDI
	 dd1+xdcog1URclurHKunuZhxCOkXFYMDTm+uoXHKvSb/xOSY6nu/t6ezK5/fcoCUEJ
	 DvZGIPiGaAZsg==
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3eba559611aso1765144b6e.0;
        Tue, 14 Jan 2025 12:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7HnT46gy4c7diljr/3qmUFelG2OpDxeur4Y73hmwTsnUxVNQw0ISEmkCRtB9HmvfB+BHPHU8ZS9LlUHY=@lists.infradead.org, AJvYcCUKhWyRRFmJBkA25vTSlf5keFvvw9tGsySe9TKv48vfpCspJhPsjeA55BDDGPTiSStDi/xYdb+u6A7K3CnMw/7k@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4R7HDLms8Yd3J1A/Z3UVr9u6QJyK8wcP48RIukgyQuUWf4QHH
	LY/JbS7sTxDyujUmJuzSv4dzJM6hzCE8O4rT4EmfHGWVEHPi/LQ7/MgA2xe95ydTPMiVTIlqjgI
	SRFUB8NH5pbVDSljbGERkDd8qkHk=
X-Google-Smtp-Source: AGHT+IHBdFDv09GmJQAPh9/RI61yRA+OUJBTYVfB4ZAfwslXJG+AQnvyEewTo5F7++0A17YOZNGuMRHAq8Q+xsm4lZ0=
X-Received: by 2002:a05:6808:198d:b0:3eb:615a:ece5 with SMTP id
 5614622812f47-3ef2ec54eedmr15212295b6e.15.1736886034615; Tue, 14 Jan 2025
 12:20:34 -0800 (PST)
MIME-Version: 1.0
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com> <20250103-wake_irq-v2-1-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-1-e3aeff5e9966@nxp.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 14 Jan 2025 21:20:22 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hj7wUU3f_j5QH3fNUFKokaXr0octaP2M1Ho_L_BspoUA@mail.gmail.com>
X-Gm-Features: AbW1kvZ2IsMpRpq9v9cu6FjARLwcHzjMVAJFZcTXGy5umUj9Q22VPlrSsSvyjVE
Message-ID: <CAJZ5v0hj7wUU3f_j5QH3fNUFKokaXr0octaP2M1Ho_L_BspoUA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] PM: sleep: wakeirq: Introduce device-managed
 variant of dev_pm_set_wake_irq
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_122036_967072_F77D43B7 
X-CRM114-Status: GOOD (  22.49  )
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

On Fri, Jan 3, 2025 at 9:42=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add device-managed variant of dev_pm_set_wake_irq which automatically
> clear the wake irq on device destruction to simplify error handling
> and resource management in drivers.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/base/power/wakeirq.c | 26 ++++++++++++++++++++++++++
>  include/linux/pm_wakeirq.h   |  6 ++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/drivers/base/power/wakeirq.c b/drivers/base/power/wakeirq.c
> index 5a5a9e978e85f3fc9d89cb7d43527dc1dd42a9b1..8aa28c08b2891f3af49017536=
2cc1a759069bd50 100644
> --- a/drivers/base/power/wakeirq.c
> +++ b/drivers/base/power/wakeirq.c
> @@ -103,6 +103,32 @@ void dev_pm_clear_wake_irq(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_clear_wake_irq);
>
> +static void devm_pm_clear_wake_irq(void *dev)
> +{
> +       dev_pm_clear_wake_irq(dev);
> +}
> +
> +/**
> + * devm_pm_set_wake_irq - device-managed variant of dev_pm_set_wake_irq
> + * @dev: Device entry
> + * @irq: Device IO interrupt
> + *
> + *
> + * Attach a device IO interrupt as a wake IRQ, same with dev_pm_set_wake=
_irq,
> + * but the device will be auto clear wake capability on driver detach.
> + */
> +int devm_pm_set_wake_irq(struct device *dev, int irq)
> +{
> +       int ret;
> +
> +       ret =3D dev_pm_set_wake_irq(dev, irq);
> +       if (ret)
> +               return ret;
> +
> +       return devm_add_action_or_reset(dev, devm_pm_clear_wake_irq, dev)=
;
> +}
> +EXPORT_SYMBOL_GPL(devm_pm_set_wake_irq);
> +
>  /**
>   * handle_threaded_wake_irq - Handler for dedicated wake-up interrupts
>   * @irq: Device specific dedicated wake-up interrupt
> diff --git a/include/linux/pm_wakeirq.h b/include/linux/pm_wakeirq.h
> index d9642c6cf85211af603ce39e280a5b4de6617ee5..25b63ed51b765c2c6919f2596=
68a12675330835e 100644
> --- a/include/linux/pm_wakeirq.h
> +++ b/include/linux/pm_wakeirq.h
> @@ -10,6 +10,7 @@ extern int dev_pm_set_wake_irq(struct device *dev, int =
irq);
>  extern int dev_pm_set_dedicated_wake_irq(struct device *dev, int irq);
>  extern int dev_pm_set_dedicated_wake_irq_reverse(struct device *dev, int=
 irq);
>  extern void dev_pm_clear_wake_irq(struct device *dev);
> +extern int devm_pm_set_wake_irq(struct device *dev, int irq);
>
>  #else  /* !CONFIG_PM */
>
> @@ -32,5 +33,10 @@ static inline void dev_pm_clear_wake_irq(struct device=
 *dev)
>  {
>  }
>
> +static inline int devm_pm_set_wake_irq(struct device *dev, int irq)
> +{
> +       return 0;
> +}
> +
>  #endif /* CONFIG_PM */
>  #endif /* _LINUX_PM_WAKEIRQ_H */
>
> --

I can apply this patch for 6.14, but the rest of the series will need
to be picked up by the respective driver maintainers.

I hope this works for you?

