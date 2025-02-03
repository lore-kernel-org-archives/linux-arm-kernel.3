Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AF1C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 19:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjSMXIe/t7D3aWSnW15L0P45rvBEvtBRwJ1jLxKsXF8=; b=gZP+VYQXRoqkp9pHTNYR50X0uI
	+eCU2F2qkHvDlVmrmhfK7GA6800jqP+pnctXvq8j0Hrzw9+k/BazadsFONgkP+GTQ6x/WR6eokvzc
	c3BtgDWmGHSRkj6FxoVFVFPN7qFNZ6yPRNZnf1aOv9g6PGq7A7t1r3a/VnqXr08ceS2VBnLzmEi4m
	xDy+HZBGB2TOkfdjMz84ihDG5ZKyd5kT3W2D3vjX4Ggu7svi2WukWJcnkqDqla7ar3GyIVOH+N9pn
	0/alRLHEqrw+z0WSyFDnnu/SPM1zt4lyecMYWe+G9n5yGEMyOXrl5jb4aUtq+AH3ykT4qV9dUAXx+
	ecsoBFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1hW-0000000GNxZ-3sue;
	Mon, 03 Feb 2025 19:01:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1Vw-0000000GKTY-0OMW;
	Mon, 03 Feb 2025 18:49:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A66155C684D;
	Mon,  3 Feb 2025 18:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C132C4CEE5;
	Mon,  3 Feb 2025 18:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738608583;
	bh=e6mfjCAhjspD99GgKLJ+Kp3DDrQVj0wKKan7rFRR2f0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pSvxJvFF9UrjbVoIUYRuKL8lqdMqjS9oiOYB4XkfY+N/aKtbtlPuD3WnV6xRx4yfF
	 SGjNNta3TeOU6GasV3698gpylNBR3o+AvQRHdvl9gNUrzXnRxxzEKz9Io+Wa0Ytg9y
	 s0FjFS+x1I/yk3ZxLNgIyjb5ef9IN9gxgErdsVNdZc/ZzpaJARwOa1ZHt3uMaSEA1+
	 2JPLKv3q9llRr5B4w+x3yQa+/jd48QiMC9XqEc4C1Mbxiw9r2JOsy65WEtY7p7zNOi
	 /ECsK0HWi5hUNeRSDrD/q6u181GIBrqatCMVoDHGxU+wn8DMaXuDE9OWxO7uLUw5UQ
	 9tHTGyWcu92Rg==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso9580524a12.0;
        Mon, 03 Feb 2025 10:49:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQ9JcPgMAPXZyfnhGm/IVHLMEUCN8oZgWBwjEnIItdvql8i/t3OOfH/8vasRyxuw3LHBeSwKc+eWmOA5ykQec=@lists.infradead.org, AJvYcCVX9msrUa2TWZcnba2XNoTyc9tCRKT9jwuPSKIhxFqYQkqyO5sm6Cfl5OJ8fmCvUtn1mO5aw73fvQfJ@lists.infradead.org, AJvYcCWB4cyjM5iGDwa+Tu3TTpUQDfslPRtm2Wp+Xii+ZrkBb6YFANsqYKpiCI501mMNqBlrQxnaC5nR0RE9AznFMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmExncuFQbbOto/5kR4fHhHFGPT8qP2aX0zqNbsxeJC9aF2PPl
	e2n18Vz03nz2kDnHXKRKjGog90vEkhi2nZx0A2WTwo/pcfqedp3q4lmZpnV/1gVCS1jfoLVFd0t
	iWs5i7iqIsqfwYMyqIZhQ6hLwuQ==
X-Google-Smtp-Source: AGHT+IHRZ8R8fpMxBKgCgw8bavXdzA9H5kA8wOOZn2wZu4+SQJ2Dew1ZJUxSmYvEqAH1df8byjuznOAH4vRk3K9otZo=
X-Received: by 2002:a05:6402:274f:b0:5dc:58ad:b8d5 with SMTP id
 4fb4d7f45d1cf-5dc5efc112cmr25980752a12.9.1738608581813; Mon, 03 Feb 2025
 10:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20241231163121.241543-1-robh@kernel.org>
In-Reply-To: <20241231163121.241543-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Feb 2025 12:49:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL7jUGqfFcpv6-WahhF69xQb9ODTU_xxm-Q3ySJusyi3w@mail.gmail.com>
X-Gm-Features: AWEUYZmiVScQsdeQTyyJLHGWj9QAFvMynSzif201Zu1U_YbABWsPT1LJOWLY8wM
Message-ID: <CAL_JsqL7jUGqfFcpv6-WahhF69xQb9ODTU_xxm-Q3ySJusyi3w@mail.gmail.com>
Subject: Re: [PATCH] phy: Use (of|device)_property_present() for non-boolean properties
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_104944_215889_57BC3E85 
X-CRM114-Status: GOOD (  16.73  )
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

On Tue, Dec 31, 2024 at 10:32=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:
>
> The use of (of|device)_property_read_bool() for non-boolean properties
> is deprecated in favor of (of|device)_property_present() when testing
> for property presence.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/phy/mediatek/phy-mtk-tphy.c           | 4 ++--
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Ping. These now cause warnings in v6.14-rc1.

>
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/p=
hy-mtk-tphy.c
> index 3f7095ec5978..d36f68dd622e 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -1215,7 +1215,7 @@ static int phy_type_syscon_get(struct mtk_phy_insta=
nce *instance,
>         int ret;
>
>         /* type switch function is optional */
> -       if (!of_property_read_bool(dn, "mediatek,syscon-type"))
> +       if (!of_property_present(dn, "mediatek,syscon-type"))
>                 return 0;
>
>         ret =3D of_parse_phandle_with_fixed_args(dn, "mediatek,syscon-typ=
e",
> @@ -1278,7 +1278,7 @@ static int phy_efuse_get(struct mtk_tphy *tphy, str=
uct mtk_phy_instance *instanc
>         }
>
>         /* software efuse is optional */
> -       instance->efuse_sw_en =3D device_property_read_bool(dev, "nvmem-c=
ells");
> +       instance->efuse_sw_en =3D device_property_present(dev, "nvmem-cel=
ls");
>         if (!instance->efuse_sw_en)
>                 return 0;
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/=
rockchip/phy-rockchip-inno-usb2.c
> index 96f3d868a526..b5e6a864deeb 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -440,7 +440,7 @@ static int rockchip_usb2phy_extcon_register(struct ro=
ckchip_usb2phy *rphy)
>         struct extcon_dev *edev;
>         int ret;
>
> -       if (of_property_read_bool(node, "extcon")) {
> +       if (of_property_present(node, "extcon")) {
>                 edev =3D extcon_get_edev_by_phandle(rphy->dev, 0);
>                 if (IS_ERR(edev))
>                         return dev_err_probe(rphy->dev, PTR_ERR(edev),
> @@ -1323,7 +1323,7 @@ static int rockchip_usb2phy_otg_port_init(struct ro=
ckchip_usb2phy *rphy,
>                         goto out;
>                 }
>
> -               if (!of_property_read_bool(rphy->dev->of_node, "extcon"))=
 {
> +               if (!of_property_present(rphy->dev->of_node, "extcon")) {
>                         /* do initial sync of usb state */
>                         id =3D property_enabled(rphy->grf, &rport->port_c=
fg->utmi_id);
>                         extcon_set_state_sync(rphy->edev, EXTCON_USB_HOST=
, !id);
> --
> 2.45.2
>

