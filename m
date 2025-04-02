Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BBCC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqCjN2XnaBIaqPEFvjQc6aei3tdzzIB/3dXAk1qHr5w=; b=IWPjRPQ8XixLQKNQjLUPgt4HFM
	nHQJDCWSa9tHI5rXRFQkw1IXkURzb6BWDvlyj+aj724G7LxhLSRK3qgJbr/vYQ1wI8er84iZo1MSG
	I6cm88LNnU4lHKPSATTuzBUVpD0Oaak46qy4NccVH/RiA53C/zZL+DK2SK/1anbc+DkY3OHcP12lS
	EoSRUHqAcIPxdWu7G3B31iYGuCCRMCcpd6bqPOn3QCjp+IsfbI/mVWuCQzVtuGSkza9477/IBz4m5
	yEKAgsovqLlMFB5x5vY7g8qW24Kteja5nHve1gwTlLvHwleGUkWADyeaviz3lJVnnjhRVltQA+5RI
	jP0xPWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzueN-00000005ilc-3Mpa;
	Wed, 02 Apr 2025 09:44:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzucd-00000005iZi-1LcT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 09:43:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-224019ad9edso49366215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743586978; x=1744191778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqCjN2XnaBIaqPEFvjQc6aei3tdzzIB/3dXAk1qHr5w=;
        b=FN3a3IVVt3/9ne4y1gN4R2kZxBODBPRSDzsuF8b/7+9gAd9ffq9ZGDJ3MmoPx5uwrs
         rtrZFNUUSbmzfWVwSdQp3J0Xu6xd2qNNtdsCeg3UfmMGAWR/GRPwcnfX8AoL8/LSLYOo
         ALDZuOvgmbueUR8avMSwCZcCOXYhU2Iin6nJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586978; x=1744191778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqCjN2XnaBIaqPEFvjQc6aei3tdzzIB/3dXAk1qHr5w=;
        b=FOLj6FH6p4KHuXTfJ2UggxbMmwHTm52QCRiBez30mL/sKqNRy9Flh4nx88wi2HDn9Q
         VhoDSMLvf+YUjdADqdtRflcZfl566WBQ0TxFE6Ne2VeCIpUrJA3+z2L0jAxR5x5AO/sC
         NnEP4u0pUaiEeiaMYlZMOXhAvILCbGw5g7IjkKY+saRJZxrEDAKxUnVA7XGuj39kJBT+
         N2GHjaPbbcGW/XPZuAWXvsBM1f2Vjyvek7sBa8alsHjKzSf4noDxTjHghuAY+WlaY6ty
         pRxTKWBvRBlnWkBZAGN5CYO2nqZ5rPKVoap6qeWlVWymNbtm7d/wBlUqY8Jga3t3oiUC
         8XkA==
X-Forwarded-Encrypted: i=1; AJvYcCVo5xcEe7K/wymkXlwzbPBWCvvZ3OjxOTO5x4kMStTtEuJA/2PeV14AYBVv57ZfmiCUj10dpX374PInzJ/SSEez@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3emE7qkJxc4KP3SyY57cTXfteVDuIqj4vV0R1J8FLTrvN1Bqc
	TS3n7ipCjrLTt6+cfpD42xNXuEL+iSQsBiau51PfdLgVEbhP5nQon6Tc0whOn37U8ZwKuvw6BIp
	uM5cCY99iY4yby8sLjyFr7YPnW621bcNNmNp6
X-Gm-Gg: ASbGncvuIID1/el2zqFe4rhHd/HpV8JIE/i165ytYuNYp0obSnLfBbXAwvI5KkTJTJt
	IxKF+Cj8T8QOQPcd4vQArYXzJyArCpvbNqJkb9YJPJGf2asOtluCiGXu1PtsH5WVyIKjPGZCOVx
	31jdEDipOodhedMgtFtRcSNIOw1KjhNmDunOEWkVTJRFa4xBKuhA4i
X-Google-Smtp-Source: AGHT+IGMZDQXr98ZNR/OTYIob8ILLj+AqDEEsuZ8JN3W+IxwuRQKfzlFXjpxIo8J+CbSTybZ0f55Aqhe9qvbkLunHuc=
X-Received: by 2002:a17:903:1110:b0:223:517a:d2a3 with SMTP id
 d9443c01a7336-2296c65f3b4mr20133075ad.17.1743586978295; Wed, 02 Apr 2025
 02:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:42:45 +0800
X-Gm-Features: AQ5f1JpfpbwiH6bCyV4YV_ME0bLhkIPk06VpTzeijPYQFz6wYmEpVSh-GkNPq_Y
Message-ID: <CAGXv+5EnGbYTPh9vrrcn0T1oskCY=AHDJsd1rfGw4MiPoUAAxQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drm/mediatek: mtk_disp_rdma: Enable/disable
 interrupt on bind/unbind
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
	ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
	bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_024259_352883_183F5A15 
X-CRM114-Status: GOOD (  27.46  )
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

On Wed, Apr 2, 2025 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The RDMA driver is installing an ISR in the probe function but, if
> the component is not bound yet, the interrupt handler may call the
> vblank_cb ahead of time (while probing other drivers) or too late
> (while removing other drivers), possibly accessing memory that it
> should not try to access by reusing stale pointers.
>
> In order to fix this, like done in the OVL driver, add a new `irq`
> member to struct mtk_disp_ovl and then set the NOAUTOEN flag to
> the irq before installing the ISR to manually disable and clear
> the hwirqs with register writes, and enable_irq() and disable_irq()
> in the bind and unbind callbacks respectively.
>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 35 ++++++++++++++----------
>  1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/m=
ediatek/mtk_disp_rdma.c
> index bf47790e4d6b..8c5021365a04 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -81,6 +81,7 @@ struct mtk_disp_rdma_data {
>  struct mtk_disp_rdma {
>         struct clk                      *clk;
>         void __iomem                    *regs;
> +       int                             irq;
>         struct cmdq_client_reg          cmdq_reg;
>         const struct mtk_disp_rdma_data *data;
>         void                            (*vblank_cb)(void *data);
> @@ -295,13 +296,23 @@ void mtk_rdma_layer_config(struct device *dev, unsi=
gned int idx,
>  static int mtk_disp_rdma_bind(struct device *dev, struct device *master,
>                               void *data)
>  {
> -       return 0;
> +       struct mtk_disp_rdma *priv =3D dev_get_drvdata(dev);
> +
> +       /* Disable and clear pending interrupts */
> +       writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> +       writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
>
> +       enable_irq(priv->irq);
> +
> +       return 0;
>  }
>
>  static void mtk_disp_rdma_unbind(struct device *dev, struct device *mast=
er,
>                                  void *data)
>  {
> +       struct mtk_disp_rdma *priv =3D dev_get_drvdata(dev);
> +
> +       disable_irq(priv->irq);
>  }
>
>  static const struct component_ops mtk_disp_rdma_component_ops =3D {
> @@ -314,16 +325,15 @@ static int mtk_disp_rdma_probe(struct platform_devi=
ce *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct mtk_disp_rdma *priv;
>         struct resource *res;
> -       int irq;
>         int ret;
>
>         priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
> -       irq =3D platform_get_irq(pdev, 0);
> -       if (irq < 0)
> -               return irq;
> +       priv->irq =3D platform_get_irq(pdev, 0);
> +       if (priv->irq < 0)
> +               return priv->irq;
>
>         priv->clk =3D devm_clk_get(dev, NULL);
>         if (IS_ERR(priv->clk))
> @@ -347,21 +357,18 @@ static int mtk_disp_rdma_probe(struct platform_devi=
ce *pdev)
>         if (ret && (ret !=3D -EINVAL))
>                 return dev_err_probe(dev, ret, "Failed to get rdma fifo s=
ize\n");
>
> -       /* Disable and clear pending interrupts */
> -       writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> -       writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
> -
> -       ret =3D devm_request_irq(dev, irq, mtk_disp_rdma_irq_handler,
> -                              IRQF_TRIGGER_NONE, dev_name(dev), priv);
> -       if (ret < 0)
> -               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", irq);
> -
>         priv->data =3D of_device_get_match_data(dev);
>
>         platform_set_drvdata(pdev, priv);
>
>         pm_runtime_enable(dev);
>
> +       irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
> +       ret =3D devm_request_irq(dev, priv->irq, mtk_disp_rdma_irq_handle=
r,
> +                              IRQF_TRIGGER_NONE, dev_name(dev), priv);

Same comment as OVL driver change.

ChenYu

> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", priv->irq);
> +
>         ret =3D component_add(dev, &mtk_disp_rdma_component_ops);
>         if (ret) {
>                 pm_runtime_disable(dev);
> --
> 2.48.1
>

