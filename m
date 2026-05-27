Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD1DCD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 04:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tcqr7MQL0zVS1iggjXewT5XwoMIhxNcBR9iISEez5U=; b=nI4ChoriBIS6vZZfnKm+cHhZFz
	yadIUBHYY3JX2Cxauf6vmI/4vJtAc8flsdDUgG1KpXrvysF8doyE375pdTYdygPCJKM6AhI+7iGBl
	ffhhJT4/AiMyy+hEtd5X8Ey/8uaLEOZ4Sjw5SRTzDAJ587jesVWMcDrnmJMT/gTjNUtjqhCLD/Uz3
	4J209runbDjMFUfdX9Jhe6/jZhdEvhc5AU/m0uI8oAaB4LpFOYf9RU0iQ/6GzIcac17ATTL3baRVL
	1nnvlwvqNIaQTBb59SuicKh/FWSgJ85DK8EKqqgk+vLz+H69D3BOQsNGPBXPmJGSvebkESyMMRZ3X
	UXmjpSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS6CL-00000003Jej-1L8q;
	Wed, 27 May 2026 04:48:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS6CI-00000003Je8-3O3z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 04:48:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF87C43DDD
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 04:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A7F1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 04:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779857329;
	bh=7tcqr7MQL0zVS1iggjXewT5XwoMIhxNcBR9iISEez5U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kfqGdCQUuAaBiaTBh3y9ct9XAO1y+AKkBZMqZ4H2SaloagRykPxJ0R+LSm/5MmI08
	 r1zv+XFg8cuVIwejzMDeJTKAjnYdmnYLXpx2cRqBvWimcwyFQj511vVNBDAkxdc45K
	 G/vXDhWYDYhh3q7ltZcBxavTOnJ8BZkyzC6FPW560HXG1VOv5ZfxUBPzI7Q/zQCw9t
	 Vbrtam07tYTDe+Dj3jmtVvAn6zi9yfy6SOPFklSc/nRoyk+mwloOr+mQVtPLivihoH
	 eGZTi0nOfLGMGnMs6dg7nd11JatMrD8f0o7CdZQJAFIfZgPMMOAppO8tKqHySJKBXs
	 E+Xw0xJ8F9f9w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a858881ad2so14045080e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 21:48:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Av39KJ/pxuLx6fbmdmmwyKC/X2RzU2nf+gyzYhjw26RdUC/JhZQG1BANHNjxdViyfbe51HkQvpXFZvGD6T9d0@lists.infradead.org
X-Gm-Message-State: AOJu0YwEH9M09MA6gi/q5cbvxNRsou2sJ34e4Lw4eMkS4UtQSgPl4XiE
	8jCTapEWcBfSaiFSIsZF7KVpGvt0bN0iWhsAp3qKDKQzg8lALp3pIHF2FyriqSw6VLIjA2wZdM5
	UYpXx87xdwTO1GFud5GJcBplT8CpnckY=
X-Received: by 2002:a05:6512:1452:10b0:5a6:31e9:1e56 with SMTP id
 2adb3069b0e04-5aa323263a9mr4824355e87.18.1779857328106; Tue, 26 May 2026
 21:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260527034350.527482-1-zenghongling@kylinos.cn>
In-Reply-To: <20260527034350.527482-1-zenghongling@kylinos.cn>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 26 May 2026 23:48:36 -0500
X-Gmail-Original-Message-ID: <CAGp9LzruaD57tE5XHHAM8mKoPc-JQSAcaTdgvdSfESJjz-9XnA@mail.gmail.com>
X-Gm-Features: AVHnY4Kn3PRAO-yghCTyjcaeRLsdka-fBpVL84WPL3a52LfxGBU64M6Iy9-CHoY
Message-ID: <CAGp9LzruaD57tE5XHHAM8mKoPc-JQSAcaTdgvdSfESJjz-9XnA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: mt7921: fix resource leak in probe error path
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, xiong.huang@mediatek.com, 
	madhurkumar004@gmail.com, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_214850_892749_D5B240FF 
X-CRM114-Status: GOOD (  20.97  )
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

Hi,

On Tue, May 26, 2026 at 10:44=E2=80=AFPM Hongling Zeng <zenghongling@kylino=
s.cn> wrote:
>
> When pcim_iomap_region() or devm_kmemdup() fail, the code returns
> directly without cleaning up previously allocated resources:
>   - mt76_device allocated by mt76_alloc_device()
>   - pci irq vectors allocated by pci_alloc_irq_vectors()
> Fix this by jumping to the existing error cleanup path instead of
> returning directly.
>
> To avoid using an uninitialized variable in the error path, move the
> dev initialization before the error checks.
>
> Fixes: 234738ea3390 ("phy: ti-pipe3: move clk initialization to a separat=
e function")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>

The code change itself looks correct, but commit message Fixes: tag is wron=
g.

It points to 234738ea3390 ("phy: ti-pipe3: move clk initialization to
a separate function"), which is unrelated to mt76/mt7921.

The two direct-return leaks appear to come from:
      - ee5bb35d2b83 ("wifi: mt76: mt7921: Replace deprecated PCI
function") for the pcim_iomap_region() path.
      - 222606f43b58 ("wifi: mt76: mt7921: handle MT7902 irq_map quirk
with mutable copy") for the MT7902 devm_kmemdup() path.

> ---
>  Change in v1
>    --fix uninitialized variable warning
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index 7a790ddf43bb..49a37185f056 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -343,11 +343,14 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>
>         pci_set_drvdata(pdev, mdev);
>
> +       dev =3D container_of(mdev, struct mt792x_dev, mt76);
> +
>         regs =3D  pcim_iomap_region(pdev, 0, pci_name(pdev));
> -       if (IS_ERR(regs))
> -               return PTR_ERR(regs);
> +       if (IS_ERR(regs)) {
> +               ret =3D PTR_ERR(regs);
> +               goto err_free_dev;
> +       }
>
> -       dev =3D container_of(mdev, struct mt792x_dev, mt76);
>         dev->fw_features =3D features;
>         dev->hif_ops =3D &mt7921_pcie_ops;
>         dev->irq_map =3D &irq_map;
> @@ -359,8 +362,10 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>                 /* MT7902 needs a mutable copy because wm2_complete_mask =
differs */
>                 map =3D devm_kmemdup(&pdev->dev, &irq_map,
>                                    sizeof(irq_map), GFP_KERNEL);
> -               if (!map)
> -                       return -ENOMEM;
> +               if (!map) {
> +                       ret =3D -ENOMEM;
> +                       goto err_free_dev;
> +               }
>
>                 map->rx.wm2_complete_mask =3D 0;
>                 dev->irq_map =3D map;
> --
> 2.25.1
>
>

