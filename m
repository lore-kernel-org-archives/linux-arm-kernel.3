Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4D8109E557
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIe/d+aqEF+Og+dkwi/qcOoP5kcHDvehyPihNn/5TwE=; b=obBjenxwNvkv5d4LG+jG2rnVMm
	E1HjKr+feX9ThE2Obd40EdpgHtIkYyzA5p4IxTeWR+jSxQ6Vxd3z7Tl+UWCbQ8Yj5EMUqoGfV+T0G
	6V4ECSUXpqqxJTMQLTgciM+aK5Gy9suHxfoMUPWX1AN1N/f3kFT9VY3AuSXaQkT8MEZr4+qmagKMr
	2y7oS1oiDPYHg7FRMEFsYNNSnCGpCLkIxLRzL2bywhLvLe9/czZqXYh4MU2ZM4g8eSeQEEpagbTCx
	c4hDhm5HpLsDsUupHwff5fvLamCAMIjunE9rBZgtm9uoyXGWnr85C3DRG7x8PTaQb8/9wnFrjSksM
	q656lXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eAr-00000004off-3kut;
	Thu, 26 Mar 2026 06:26:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eAn-00000004oea-0ykj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 06:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C03243F50
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 06:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C6CC2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 06:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774506388;
	bh=PONUkDK5Nxfv+FEOSWCheKX6fc5iX8BXeD7AcKEe1tc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dlyOxobOD7/nYy9+GasYYrE2iASEDUSRxFdWw1g0dcvJ4AsHzlIvOXc3dyxqz6OGe
	 iePLcbc3KY61fK+dGD0uWopqKF+KDAXk31JmHENFOHpPn2RB6Y4RV38PPmSweUxx7u
	 TG/FaySOkJSwu0+G9SHUuAeoUJVS3i+dOiTEIJvjunaJBJ3jAPmje6cUajjXedI1GY
	 vlDC+bfj0EBGstW5vD9jBTCyfu42HYpK9w7ilvWyGSya0GPpymj10n7HBWRCOJepdf
	 MN9gvYuix0F5WM9Mbvss+cJ80ACOdCxo47rIXLrykg/HulJ01EL1IT+5WnGpw/9fC+
	 Md+/8dUSc4T0A==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38aef9cc451so4401981fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 23:26:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWF7wFkYi2B70O0IRuWnSJ9OEIUem/wSAo7KRfg9JHxgJbnidvWP9QE1pl9FEgA7vA6Vr9mdek57ldC/fxDjtZV@lists.infradead.org
X-Gm-Message-State: AOJu0YwsV83yvCwEJGIqgmEWImrB9njFZ5ttkEsfzpG0kX7F40Jo78c9
	dAmoUX7a+UqykJu9hMFLoxpg4UDNtwffcUhhQvzllObhN5CUkurtllbPQABlscwFh1RvAjh5EE3
	PBnq5K7wrT0GN1E4BhE8Eeum5XOM6USw=
X-Received: by 2002:a05:651c:4406:20b0:38a:8b97:7e9c with SMTP id
 38308e7fff4ca-38c4309e800mr18002601fa.11.1774506386686; Wed, 25 Mar 2026
 23:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me> <20260325-mt7927-wifi-support-v2-v3-13-5ca66c97a755@jetm.me>
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-13-5ca66c97a755@jetm.me>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 26 Mar 2026 01:26:17 -0500
X-Gmail-Original-Message-ID: <CAGp9LzpZy70T61o7q0t5AAYQwBK+ywp_zbLGw=4SD5Ga_gxmmQ@mail.gmail.com>
X-Gm-Features: AQROBzBJ6-X-H7xt9CpRo8Vppnuc0zRH3pX-AHj4xX39HuOpZCQktesCUmP5MEQ
Message-ID: <CAGp9LzpZy70T61o7q0t5AAYQwBK+ywp_zbLGw=4SD5Ga_gxmmQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] wifi: mt76: mt7925: enable MT7927 PCI device IDs
To: Javier Tia <floss@jetm.me>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Deren Wu <deren.wu@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>, 
	George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, 
	Samu Toljamo <samu.toljamo@gmail.com>, Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>, 
	Chapuis Dario <chapuisdario4@gmail.com>, =?UTF-8?Q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>, 
	=?UTF-8?B?5byg5pet5ra1?= <Loong.0x00@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_232630_111534_0D61ED45 
X-CRM114-Status: GOOD (  23.97  )
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

Hi, Javier

On Wed, Mar 25, 2026 at 5:14=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> Add PCI device table entries for MT7927 hardware variants:
>   - 14c3:7927 (ASUS ROG Crosshair X870E Hero, Lenovo Legion Pro 7)
>   - 14c3:6639 (Foxconn/Azurewave modules)
>   - 14c3:0738 (AMD RZ738 / MediaTek MT7927)
>
> This is the final patch in the series, enabling MT7927 device
> enumeration after all infrastructure (DMA, IRQ, HW init, band index,
> power management) is in place.
>
> Tested-by: Marcin FM <marcin@lgic.pl>
> Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
> Tested-by: George Salukvadze <giosal90@gmail.com>
> Tested-by: Evgeny Kapusta <3193631@gmail.com>
> Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
> Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
> Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
> Tested-by: Thibaut Fran=C3=A7ois <tibo@humeurlibre.fr>
> Tested-by: =E5=BC=A0=E6=97=AD=E6=B6=B5 <Loong.0x00@gmail.com>
> Signed-off-by: Javier Tia <floss@jetm.me>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 29 +++++++++++++++----=
------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/pci.c
> index 693e08f35d68..00c3601f14ff 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> @@ -16,6 +16,12 @@ static const struct pci_device_id mt7925_pci_device_ta=
ble[] =3D {
>                 .driver_data =3D (kernel_ulong_t)MT7925_FIRMWARE_WM },
>         { PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0717),
>                 .driver_data =3D (kernel_ulong_t)MT7925_FIRMWARE_WM },
> +       { PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7927),
> +               .driver_data =3D (kernel_ulong_t)MT7927_FIRMWARE_WM },
> +       { PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x6639),
> +               .driver_data =3D (kernel_ulong_t)MT7927_FIRMWARE_WM },
> +       { PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0738),
> +               .driver_data =3D (kernel_ulong_t)MT7927_FIRMWARE_WM },
>         { },
>  };
>
> @@ -530,7 +536,8 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
>         if (ret)
>                 goto err_free_pci_vec;
>
> -       is_mt7927_hw =3D (pdev->device =3D=3D 0x6639 || pdev->device =3D=
=3D 0x7927);
> +       is_mt7927_hw =3D (pdev->device =3D=3D 0x6639 || pdev->device =3D=
=3D 0x7927 ||
> +                       pdev->device =3D=3D 0x0738);
>
>         /* MT7927: CONNINFRA power domain and WFDMA register access are
>          * unreliable with PCIe L1 active, causing throughput to drop
> @@ -546,16 +553,16 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
>                 goto err_free_pci_vec;
>         }
>
> -       /* MT7927 firmware lacks the connac2 feature trailer, so
> -        * mt792x_get_mac80211_ops() can't detect CNM support and
> -        * replaces chanctx/ROC/mgd_prepare_tx ops with stubs.
> -        * Force CNM and restore the original mt7925 ops.
> -        */
> -       if ((pdev->device =3D=3D 0x6639 || pdev->device =3D=3D 0x7927) &&
> -           !(features & MT792x_FW_CAP_CNM)) {
> -               features |=3D MT792x_FW_CAP_CNM;
> -               memcpy(ops, &mt7925_ops, sizeof(*ops));
> -       }
> +               /* MT7927 firmware lacks the connac2 feature trailer, so
> +                * mt792x_get_mac80211_ops() can't detect CNM support and
> +                * replaces chanctx/ROC/mgd_prepare_tx ops with stubs.
> +                * Force CNM and restore the original mt7925 ops.
> +                */
> +               if ((pdev->device =3D=3D 0x6639 || pdev->device =3D=3D 0x=
7927 ||
> +                    pdev->device =3D=3D 0x0738) && !(features & MT792x_F=
W_CAP_CNM)) {
> +                       features |=3D MT792x_FW_CAP_CNM;
> +                       memcpy(ops, &mt7925_ops, sizeof(*ops));
> +               }

I think the quirk should be applied before the CNM check in
mt792x_get_mac80211_ops().

That helper already owns the fw_features detection and the ops rewrite,
so adding another memcpy() later to restore mt7925_ops feels fragile.
The final ops selection is no longer decided in one place, and the extra
full memcpy() depends on the current call flow and implementation
details of mt792x_get_mac80211_ops().

If MT7927 should force MT792x_FW_CAP_CNM despite the missing trailer,
please fold that into mt792x_get_mac80211_ops() and keep the ops
selection in one place.

>
>         mdev =3D mt76_alloc_device(&pdev->dev, sizeof(*dev), ops, &drv_op=
s);
>         if (!mdev) {
>
> --
> 2.53.0
>
>

