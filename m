Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72F3C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfVlQSwZL1nhPF/0vodhMV4Ljezl2mlJxN9U77McRrM=; b=uK+CPUGTQdpTJlfBMRjkCGaCBI
	VvCcaSgnmnvi6lWIC/+rI2LeKyF+ncjMg2SxiFqr+NQ4/IW08sMRE130giT3J4ZYNCETDP+yKoZyy
	Uk5Mgwj8fpxvVxzoJk5LSqNhppSKPzl3umPpSHcHMAtvBt4MFYbTWdQpsygssWxBPOxCd9m+Km//q
	cgc4cCzlJwSeFrSDyCkzxAmORWzfF7wPql+ZznktUQlWZAr3A78YDtwIjDul3mgCtGQrYMYoLub5G
	N8eYJEZvJwuoVe655sKIcds9hPJpVT8/xj47zxC1QFym/veznMvrXdxFZvg1tPjFkqJMNIjH1vieU
	DAyxm+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tie1i-0000000CG4C-1mUa;
	Thu, 13 Feb 2025 18:33:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidRx-0000000C6HH-1O7B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:56:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 173295C58F4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 17:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E21C4CEE8
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 17:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739469392;
	bh=zu6XwvxRWfLZhbU+NQRFBvpihnBJdGqYI23riG2Rn94=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DQSCv8KVcTJfUl5QCqlb1aPWdpHME3qfxr2BivoYk1VpoYEyZwZG/Pk73Czq+skEu
	 oKKCCD/YJjrItngdSK0146kMNHvpo0YkaPBs2GSQF3YY6jsjbUj1Qmd70VJ6dqs9vx
	 GnfnwHfUjdQv3ruq2pVdRmm4oX3pqAjgUizmTb1TfQrk/IxgTI5462HQQ/XYudg5mb
	 VCo1ECe0H2RaG8JXOcuWkm5I9C6hXAOnFQT2ZcXtvOPnPWmZjv3wiqBa2zd6tVfEYI
	 d9oguZ7nRm0jEJEWZSDpj+xYvjAVtW1lSsY6CbbfbEt+iq73hNwrnGSNtLsgDGZlj+
	 FOUMn/2lxIQfA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so2309536a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 09:56:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUILhaMKMHRgkIxRORZ3CktvIIoq1Em9weCggIDVQnaXyRHF/68qklpI8qAMiTSZ9TNpEyJO3fs0pvWHHDz8tfw@lists.infradead.org
X-Gm-Message-State: AOJu0YzXs9VPhbcr2GRDwp1PC1C0ThK8wzw4+Nr5PYkU0a/Mykr/jwHK
	MReNYDmesBYnIaW6N1tiNb+PYUQReszrpdUg2ORPWFOS8ytTNTnR2SpWbr4dFOzL27uOzOSOS7y
	0BSAXvHGChnGIZ/QoEEejUCEfoQ==
X-Google-Smtp-Source: AGHT+IHTeCe7WowntB6fs9UcxQzrutTfaoimXk6oistVCJvHwS4uUZuMCGZVr/Sa699J0jyvKNfSQ6RXSzn0q5mmsec=
X-Received: by 2002:a05:6402:2755:b0:5de:a972:8c7 with SMTP id
 4fb4d7f45d1cf-5decba4bf54mr3906685a12.5.1739469390719; Thu, 13 Feb 2025
 09:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io> <20250211-pcie-t6-v1-7-b60e6d2501bb@rosenzweig.io>
In-Reply-To: <20250211-pcie-t6-v1-7-b60e6d2501bb@rosenzweig.io>
From: Rob Herring <robh@kernel.org>
Date: Thu, 13 Feb 2025 11:56:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ-sYsy-11_UiEKrKok49-a-VJUvm3vBGbpu9vY3TKLUw@mail.gmail.com>
X-Gm-Features: AWEUYZnNrV6AeqfriIoD2NAW7TvpHv4rdwKYJwl0y8ybKwiiM0n7mQqePyuXunc
Message-ID: <CAL_JsqJ-sYsy-11_UiEKrKok49-a-VJUvm3vBGbpu9vY3TKLUw@mail.gmail.com>
Subject: Re: [PATCH 7/7] PCI: apple: Add T602x PCIe support
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Marc Zyngier <maz@kernel.org>, Stan Skowronek <stan@corellium.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_095633_456838_94EF6BFB 
X-CRM114-Status: GOOD (  20.96  )
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

On Tue, Feb 11, 2025 at 1:54=E2=80=AFPM Alyssa Rosenzweig <alyssa@rosenzwei=
g.io> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> This version of the hardware moved around a bunch of registers, so we
> drop the old compatible for these and introduce register offset
> structures to handle the differences.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
>  drivers/pci/controller/pcie-apple.c | 125 ++++++++++++++++++++++++++++++=
------
>  1 file changed, 105 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller=
/pcie-apple.c
> index 7f4839fb0a5b15a9ca87337f53c14a1ce08301fc..7c598334427cb56ca066890ac=
61143ae1d3ed744 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -26,6 +26,7 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/msi.h>
> +#include <linux/of_device.h>

Drivers should not need this...

> +const struct reg_info t602x_hw =3D {
> +       .phy_lane_ctl =3D 0,
> +       .port_msiaddr =3D PORT_T602X_MSIADDR,
> +       .port_msiaddr_hi =3D PORT_T602X_MSIADDR_HI,
> +       .port_refclk =3D 0,
> +       .port_perst =3D PORT_T602X_PERST,
> +       .port_rid2sid =3D PORT_T602X_RID2SID,
> +       .port_msimap =3D PORT_T602X_MSIMAP,
> +       .max_rid2sid =3D 512, /* 16 on t602x, guess for autodetect on fut=
ure HW */
> +       .max_msimap =3D 512, /* 96 on t602x, guess for autodetect on futu=
re HW */
> +};
> +
> +static const struct of_device_id apple_pcie_of_match_hw[] =3D {
> +       { .compatible =3D "apple,t6020-pcie", .data =3D &t602x_hw },
> +       { .compatible =3D "apple,pcie", .data =3D &t8103_hw },
> +       { }
> +};

You should not have 2 match tables.

> @@ -750,13 +828,19 @@ static int apple_pcie_init(struct pci_config_window=
 *cfg)
>         struct platform_device *platform =3D to_platform_device(dev);
>         struct device_node *of_port;
>         struct apple_pcie *pcie;
> +       const struct of_device_id *match;
>         int ret;
>
> +       match =3D of_match_device(apple_pcie_of_match_hw, dev);
> +       if (!match)
> +               return -ENODEV;
> +
>         pcie =3D devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
>         if (!pcie)
>                 return -ENOMEM;
>
>         pcie->dev =3D dev;
> +       pcie->hw =3D match->data;
>
>         mutex_init(&pcie->lock);
>
> @@ -795,6 +879,7 @@ static const struct pci_ecam_ops apple_pcie_cfg_ecam_=
ops =3D {
>  };
>
>  static const struct of_device_id apple_pcie_of_match[] =3D {
> +       { .compatible =3D "apple,t6020-pcie", .data =3D &apple_pcie_cfg_e=
cam_ops },
>         { .compatible =3D "apple,pcie", .data =3D &apple_pcie_cfg_ecam_op=
s },
>         { }

You are going to need to merge the data to 1 struct.

And then use (of_)?device_get_match_data() in probe().

Rob

