Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62085E668AA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 01:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvfEcA4ngmwX8Z/ReyrjfSyYYOfbBzOa2QWavuhPe1g=; b=dnbpJwdXL+y9fS7muXdMaNynC1
	mndkKNXzLePAs0F1qdgq0SvtjWD2QXninVb/e/PBIa3/seZR6BPt7ngsJqfdZrogCNiJu5/ckSUIf
	//VEA6vNdBE6VMxIab4YE4fYjZtALlcbJWD9omAFDxY86d3+f5cGSfHN/BMxYYMxLpmJIdcozbO92
	LVtF9Xyk/3NG06VInn5uS6JKOcUTtIYDfURYLT+iWpuW/3Usg76qAg/Chxz+0ukb+FSjb3An9Z5Fy
	XCeVCTSEIN/C8HFl7UsICrArKcGaBhqokpVJMHi2vvz9ga6GtK7D6jDxkygLClY5H2e/3YtqypIGl
	gx/zSQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWlOg-0000000B9Tq-2LFx;
	Sat, 20 Dec 2025 01:04:38 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWlOc-0000000B9T3-4BuS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 01:04:36 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-64472121ad5so1653515d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 17:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766192673; x=1766797473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvfEcA4ngmwX8Z/ReyrjfSyYYOfbBzOa2QWavuhPe1g=;
        b=WnysS1FN0KRNayr7jH7iqY/URVydj/pNCXY3vYnErlEBNK7byhjI4QxHsh6Vkb53Mj
         x0njkr0cM4CrogeikJLrj7COd6xDydHxU1k6X4BRaX3s12Xw++Fon10O4yMfDqmSzSyV
         8OPd09eYkqb6b0bIPXijjnDZmmkOX+RdbwJ4gfvN05GgXOQ08modGzaqbirrFuYKdEXo
         DwA6RahIAQDoWz2SXH/eerrKOlblwlPcYDl0LK8BqikIEdA1caQyNIJSVTBpYeB0YTY8
         8is+nrXgpFupkjULh9EX9x4L/k4oF1wfssOFKVOkA6C857Olt+SOiYCFgE1cE52rDbhm
         yDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766192673; x=1766797473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uvfEcA4ngmwX8Z/ReyrjfSyYYOfbBzOa2QWavuhPe1g=;
        b=UhFgdemRLlsfaHSyoQSiUEYl9YdWyIeqlTyA7dsUnObTxkWTXGVriwBTVABFQfniDJ
         7GtWwHoT2mLJpiSKCNOfSJUG2BqhjMU4lbCaPu3bo79OaUolrOdooTiRL75a/wAbtMhP
         isAEdYqwasslaU/s+AY03dRoCrNJZkDqQzfbli+NvYY6icLrkI5N47pRbDigWtZKvqcu
         Vg5HkFmE7uL+2yGla3G0OjZBeyL/2g1YLUTDQg/kwQtRLJRFHBTvzNOeD4pn9ZCHZlg9
         G8eDggJUBNO0GMmozqF3k+SsTjUr79FKx4lRSzx3AxDJ7YqblP6qGjq3uD75rrsOGGhR
         36GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdWerHpd/Kgubk+3QmaiHbZ/M2DSTUlQuelpshHyb6B8CzSpzE6qcmiURlCuQQoA4eVUTTWBHdpA+ANebhC+kr@lists.infradead.org
X-Gm-Message-State: AOJu0YygvVb9TyY7Dn2CrWhbk9bRM7Dv8VdiJpSW5f4wshd+QZgwlNOd
	LYTaSqQk8CjfJ4IG7YX0ApLL90hNg6gRgno9m9QXLPGQsyxTSGXGyvJkO5Ss309CzRHk+H/AIKV
	dCbTw7CxUlBq+Iu+zcimmXWi2xkJNQFA=
X-Gm-Gg: AY/fxX6qRL5xzZtlZCoMJiQOecqci0XdUdmnh/PCO4petGLArZXghk4+D12+m30PtHX
	C1H8Aqf5ebCXqwBEr8+GRWX6MqYt1kBF7WnHL7fnYHbboyKzW7PvuZgPoXcamoERoDK0w1WjfTy
	zWBiqJO9nRYs35iJL1s/xCbg+2IsS7SB0xSV1C18ZOYtzmEJPuQacV00xrswKW+9VIByyYKhifl
	BUJ9SN28bxGyyZ1EFepfbXaUG9oZ/2bIuaTUyNXuV5Wh7ThrP4QVxIi4l+DmHEcgmME6x54Dxq+
	HmO9PUNlBmRvR9mj80PYGiunfKra
X-Google-Smtp-Source: AGHT+IEnRAac6u07uzA3LUk5jCrz4OGRvCsnGojqOSsZK7RLqvjo5JYP+wh5edVRUn03IOrbdzCAkAqdhNZxSYFsGbc=
X-Received: by 2002:a05:690e:3c9:b0:645:5467:29f3 with SMTP id
 956f58d0204a3-6466a859780mr2828699d50.39.1766192673550; Fri, 19 Dec 2025
 17:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com> <20251217-mt8196-shader-present-v1-4-f6f8f3aa1e93@collabora.com>
In-Reply-To: <20251217-mt8196-shader-present-v1-4-f6f8f3aa1e93@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 19 Dec 2025 17:04:22 -0800
X-Gm-Features: AQt7F2pOYJ6wtBd4hNgFJlclGwmWabkkUpx6tjcAEWdTtCs7JRe062F7FH3q2go
Message-ID: <CAPaKu7TVeaEFRWBt7rF_uVUyYO72GHqFwKi7D52juPTRAk7URw@mail.gmail.com>
Subject: Re: [PATCH 4/4] pmdomain: mediatek: mtk-mfg: Expose shader_present as
 nvmem cell
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_170435_145329_E5D4BCA5 
X-CRM114-Status: GOOD (  23.10  )
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

On Wed, Dec 17, 2025 at 9:04=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Implement nvmem-provider functionality in mtk-mfg-pmdomain, such that it
> can expose its GF_REG_SHADER_PRESENT value in the shared memory as an
> nvmem cell for panthor.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 57 ++++++++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdom=
ain/mediatek/mtk-mfg-pmdomain.c
> index 9bad577b3ae4..725ebc678f1b 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -10,6 +10,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/container_of.h>
>  #include <linux/iopoll.h>
> +#include <linux/nvmem-provider.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -872,6 +873,58 @@ static int mtk_mfg_init_clk_provider(struct mtk_mfg =
*mfg)
>         return 0;
>  }
>
> +static int mtk_mfg_read_nvmem(void *priv, unsigned int offset, void *val=
, size_t bytes)
> +{
> +       struct mtk_mfg *mfg =3D priv;
> +       u32 *buf =3D val;
> +
> +       if (bytes !=3D 4)
> +               return -EINVAL;
> +
> +       if (!mfg->shared_mem)
> +               return -ENODEV;
> +
> +       if (offset + bytes >=3D mfg->shared_mem_size)
> +               return -EINVAL;
> +
> +       *buf =3D readl(mfg->shared_mem + offset);
> +
> +       return 0;
> +}
> +
> +static int mtk_mfg_init_nvmem_provider(struct mtk_mfg *mfg)
> +{
> +       struct device *dev =3D &mfg->pdev->dev;
> +       struct nvmem_cell_info cell =3D {};
> +       struct nvmem_config config =3D {};
> +       struct nvmem_device *nvdev;
> +       int ret;
> +
> +       config.reg_read =3D mtk_mfg_read_nvmem;
> +       config.dev =3D dev;
> +       config.read_only =3D true;
> +       config.priv =3D mfg;
> +       config.size =3D 4;
> +       config.word_size =3D 4;
> +
> +       nvdev =3D devm_nvmem_register(dev, &config);
> +       of_node_put(config.of_node);
This looks like a dead line.
> +       if (IS_ERR(nvdev))
> +               return dev_err_probe(dev, PTR_ERR(nvdev), "Couldn't regis=
ter nvmem provider\n");
> +
> +       cell.name =3D "shader-present";
> +       cell.offset =3D GF_REG_SHADER_PRESENT;
> +       cell.bytes =3D 4;
> +       cell.np =3D of_get_child_by_name(dev->of_node, cell.name);
> +
> +       ret =3D nvmem_add_one_cell(nvdev, &cell);
> +       /* cell.np purposefully not put as nvmem_add_one_cell does not in=
crease refcount */
I think you still need to of_node_put on errors.
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Couldn't add cell %s\n", =
cell.name);
> +
> +       return 0;
> +}
> +
>  static int mtk_mfg_probe(struct platform_device *pdev)
>  {
>         struct mtk_mfg *mfg;
> @@ -984,6 +1037,10 @@ static int mtk_mfg_probe(struct platform_device *pd=
ev)
>         if (ret)
>                 goto err_power_off;
>
> +       ret =3D mtk_mfg_init_nvmem_provider(mfg);
> +       if (ret)
> +               goto err_power_off;
> +
>         ret =3D of_genpd_add_provider_simple(dev->of_node, &mfg->pd);
>         if (ret) {
>                 dev_err_probe(dev, ret, "Failed to add pmdomain provider\=
n");
>
> --
> 2.52.0
>

