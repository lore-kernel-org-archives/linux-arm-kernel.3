Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFADE6F084
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQ+XXkvHSA2dGT1VpgVey3NASrpnvjmCvzg+N/lld3Q=; b=BCS5A0Y0HjmMXS
	KV7N4RBLCjIUe1+t07DvClmRGRxj7PSiDgkw/KP8HwU+74j3hHr5S1/IlZXsJCfjsbxwiwXYGGY/R
	33IKf/DWCyeeBiG/SZ9m7xOE9obg+HMdpMxXXqwOKRMMqPBY3ume4eBckVHxt2lFT1/5WuM24GWTX
	re8olFZFWcg7W0kDkes18bvp/KJvdpAIM1Hg7DPOqgaIg5DawYwdYXABQmTNJcSJsCl23CD94WR0O
	BuTyQorQEYChP8aQ15nsukJvVToDn9yooInGU9xLS8a6QKtKLoe7AUu6ALT3v2lenLUVsVkybYrm3
	gVuyFb/VpeKH5GNslEPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Bq-0000000EvN4-1j7p;
	Tue, 23 Dec 2025 11:04:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Bn-0000000EvMC-0kNj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:04:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E632A44369
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 11:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B833BC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766487865;
	bh=biUgEjzTLA2qxnGKmM6Ej5xs7lQ2WYxGQ9yr+adss88=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=r4iFTtyUaJSeS53r1g6gYRFQ7LBaaU420AqItPgA01WKlV5q/GSaZwo5Y56adUcE8
	 u2d8PJaKvSBlyIoSlSx9EBMkmTqI5lE7OhtEd3m0mt0ypIdXUu86yEReqPgADay1Wu
	 1TnsXU79RRm0GCehzjxo1DccTqpYKDFimY3zRVGjBpBp140cl2IXt8llhHYbkzj44P
	 qS0WPx5fFkv3eVcFgNTxYag6jaHPWTkeJ/ATaaWXfpJNzDAbCJOolk76PdEn3+RgFT
	 6TM0VIWEe4Bs2OipQqftao//8I0zJxrPlQ1NbUAPqeZEUiBGfxuVW3LxW5SuVxbQy7
	 Ut4XKpDb0EqCQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59911cb8c3cso5311827e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 03:04:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8dPbqj9tCLntLrUKZ1rvVi3Lz09xcvPjnYXOgaONrd5KZEkKcn1ZEkSPXptTfBF77175Fmh72YuAvyct4mcwQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0IYJg1qs+Eyc+JV6tSdLqO1EvcRf54AVH7WWT+M/1DW/U0SPa
	ABQwH/jX4mi0EKOyHiql3lM8XYVIPow3zS1GNEnBV1Q+dx5j9wALXd4CooOo2TYdlWlm6zZdmo0
	Uesnq0PrJ26mxautpzm8xM9E/zy0IGdY=
X-Google-Smtp-Source: AGHT+IHFRCOw1OndrHUP8fu/5Pu86rNoly2fZw9WpBncVYiaNKQ4oxRlCC+E8Yk0b5wLZeLJPra7VnbPIBMd4pnW17A=
X-Received: by 2002:a05:6512:b85:b0:598:853e:4865 with SMTP id
 2adb3069b0e04-59a17d670demr5354973e87.50.1766487863823; Tue, 23 Dec 2025
 03:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 23 Dec 2025 19:04:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v65_bC23uVNdXXy0OW3Zx4wxO+CAuae5zPR4m2zt29kYXA@mail.gmail.com>
X-Gm-Features: AQt7F2oTKoNzOiHRkxSJE0lLrLQx6-2c3kaid1cyT2kNWjPKTkvyybHt0ZNsvmc
Message-ID: <CAGb2v65_bC23uVNdXXy0OW3Zx4wxO+CAuae5zPR4m2zt29kYXA@mail.gmail.com>
Subject: Re: [PATCH 02/12] i2c: sun6i-p2wi: use i2c_adapter-specific printk helpers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_030427_320871_905148ED 
X-CRM114-Status: GOOD (  15.36  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Dec 23, 2025 at 6:02=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Convert all instances of using device printk helpers with struct device
> embedded in struct i2c_adapter to the new i2c-specific macros that hide
> that dereference.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c=
-sun6i-p2wi.c
> index fb5280b8cf7fc0e3cba8ea6a318172ea2b011a02..845ca56cdae2d056c122eb648=
c082f319d955b5e 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -122,7 +122,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, =
u16 addr,
>         unsigned long dlen =3D P2WI_DLEN_DATA_LENGTH(1);
>
>         if (p2wi->target_addr >=3D 0 && addr !=3D p2wi->target_addr) {
> -               dev_err(&adap->dev, "invalid P2WI address\n");
> +               i2c_err(adap, "invalid P2WI address\n");
>                 return -EINVAL;
>         }
>
> @@ -139,7 +139,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, =
u16 addr,
>         writel(dlen, p2wi->regs + P2WI_DLEN);
>
>         if (readl(p2wi->regs + P2WI_CTRL) & P2WI_CTRL_START_TRANS) {
> -               dev_err(&adap->dev, "P2WI bus busy\n");
> +               i2c_err(adap, "P2WI bus busy\n");
>                 return -EBUSY;
>         }
>
> @@ -154,12 +154,12 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap=
, u16 addr,
>         wait_for_completion(&p2wi->complete);
>
>         if (p2wi->status & P2WI_INTS_LOAD_BSY) {
> -               dev_err(&adap->dev, "P2WI bus busy\n");
> +               i2c_err(adap, "P2WI bus busy\n");
>                 return -EBUSY;
>         }
>
>         if (p2wi->status & P2WI_INTS_TRANS_ERR) {
> -               dev_err(&adap->dev, "P2WI bus xfer error\n");
> +               i2c_err(adap, "P2WI bus xfer error\n");
>                 return -ENXIO;
>         }
>
>
> --
> 2.47.3
>

