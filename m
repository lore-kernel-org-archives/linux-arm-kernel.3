Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6609EFA3737
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lir7N+PKdb6wAs4ijty5cr6Rc1e4WEGVLKOhpiWnZnQ=; b=GH8IZmOsle4tawBFaDKKL7XpzM
	LnnUDKVNowwmPgHSev/3OsJ2sLgU21+a3Af/ZsPqksrKDRbVO8c/ibHB/ksjPS6gjQxokRtmJWzKS
	qea7PqOxQeiN3/dY6TcTyJtDpjuoKD3xvTXndZjqDhfxxj8Rvc2oCyUdz3lfxgesS0tMQ5X0Wy4Mc
	Cbbl4wBAHO7znwZJ/AOnuujrngG5pzwQxD7zfTAfk+KYQpKeJkKTRvcB7Ah1dVJp3lEX8hccTu/TR
	m8POtdlNvSjzOCvvW0e9z6JlXI+05GBngB24bpFZ3odwzfLYAy3Eod61n/tM6k9oxfGXAk1y900Ki
	gpAklUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdnA-00000008AN5-495Q;
	Fri, 02 Jan 2026 11:58:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdn8-00000008AMi-2rrU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 11:58:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 985C7441F2
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Jan 2026 11:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA0FC16AAE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Jan 2026 11:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767355081;
	bh=OOGEjXmkNZBdRQAKqI/w24brTc3UbeLXjGqJU6rxA9Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IeWTKfd+Fk/gvvkFii9UdxAE2Rdwm85vq/0Y9Oi3EGgKimj2KuJmRqZTLflWf0Jf3
	 jVsIPfZSP89LMYOd70vs7WqZ0f/woBAcjA6ShM1Ssv2oo7eHeLAzAe9hAqmvwCQLSI
	 //nH1cWuZnfaoATJuIzNAr5/E3ZzCcKxB555G13mcMJ6CHrUj3mLYME/Q6FMdRnrLF
	 0/Sw8II2tW8yocs75r1Em3Vsntl/7dk2AmR6tX89XhPF6Xo2n0qMQG2ZigBjvSxDyj
	 FNmdf++W0fnYXpbJq1accwd0I+Y+i6cMOWY22LFMViiNCh+8fGbtDHR8AQ8LrRUFJe
	 WgL+Vo2yHu1NQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59584301f0cso2865739e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 03:58:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnkDb8D4qxhvY8qt/2l/AuUUR2OEu0M1ZOxoixu9eF3nyM5h7bYHPMWDZiwYddafOATvGdYN27aU9vZB9gp+F1@lists.infradead.org
X-Gm-Message-State: AOJu0YwRkdPO8VG7B2mWhBRgItvXZfJchsvdepTmbQ2Mn8ZJ30VOp/hG
	9+LwAnU07UBIF4EbOboDKZVqgbwRMslyMt4qQaUm152aMlBPAul1cJ/9TSlkpmpyRz0Xffr0msu
	QDWsX4KyZ6E03PXj/RXsf9t08DpPd+Ct/AFOAvNnQ9Q==
X-Google-Smtp-Source: AGHT+IES0kIDjgnYGEOnKFGJNYFH0vsVl7fqRNUatfgND9VTY3QWFONMo7Hx4HSU6Gk61wbu2Oe+VULtLcRg9b8wJ6Y=
X-Received: by 2002:a05:6512:4887:b0:59a:10c1:8f25 with SMTP id
 2adb3069b0e04-59a17d5dac9mr8692071e87.41.1767355079664; Fri, 02 Jan 2026
 03:57:59 -0800 (PST)
MIME-Version: 1.0
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-6-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-6-ebb956053098@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 12:57:47 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com>
X-Gm-Features: AQt7F2p2LtuO3Z-xskVqWJd7KmTcH-PyEGQI74hc0fHTK246U1sFcvAjuK93DWQ
Message-ID: <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com>
Subject: Re: [PATCH v19 06/10] power: reset: Add psci-reboot-mode driver
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_035802_767978_8991A44C 
X-CRM114-Status: GOOD (  18.86  )
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

On Sun, Dec 28, 2025 at 6:21=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>

[snip]

> +
> +static int psci_reboot_mode_probe(struct faux_device *fdev)
> +{
> +       struct reboot_mode_driver *reboot;
> +       struct device_node *psci_np;
> +       struct device_node *np;
> +       int ret;
> +
> +       psci_np =3D of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> +       if (!psci_np)
> +               return -ENODEV;
> +
> +       /*
> +        * Find the psci:reboot-mode node.
> +        * If NULL, continue to register predefined modes.
> +        * np refcount to be handled by dev;
> +        * psci_np refcount is decremented by of_find_node_by_name;
> +        */

Can you make this comment into full sentences, I had trouble parsing
the meaning for a minute.

> +       np =3D of_find_node_by_name(psci_np, "reboot-mode");
> +       fdev->dev.of_node =3D np;

The logic of the device assigning its own node is a bit sketchy,
ideally this should be done before the device probes.

> +
> +       reboot =3D devm_kzalloc(&fdev->dev, sizeof(*reboot), GFP_KERNEL);
> +       if (!reboot)
> +               return -ENOMEM;
> +
> +       psci_reboot_mode_set_predefined_modes(reboot);
> +       reboot->write =3D psci_reboot_mode_write;
> +       reboot->dev =3D &fdev->dev;
> +
> +       ret =3D devm_reboot_mode_register(&fdev->dev, reboot);
> +       if (ret) {
> +               dev_err(&fdev->dev, "devm_reboot_mode_register failed %d\=
n", ret);
> +               return ret;

Use dev_err_probe().

> +       }
> +
> +       return 0;
> +}
> +
> +static struct faux_device_ops psci_reboot_mode_ops =3D {
> +       .probe =3D psci_reboot_mode_probe,
> +};
> +
> +static int __init psci_reboot_mode_init(void)
> +{
> +       struct faux_device *fdev;
> +
> +       fdev =3D faux_device_create("psci-reboot-mode", NULL, &psci_reboo=
t_mode_ops);
> +       if (!fdev)
> +               return -ENODEV;

This will always create this device for everyone who includes this
module. Move the of_find_compatible_node(NULL, NULL, "arm,psci-1.0")
call from probe() here instead and don't create the device if it
fails.

Bart

> +
> +       return 0;
> +}
> +device_initcall(psci_reboot_mode_init);
>
> --
> 2.34.1
>

