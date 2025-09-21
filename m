Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99074CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 05:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjfAWdx3qllN2H0M+sW0dm7oGyFJwrK43aFNVvYCDkE=; b=rQnlvlb0zhIXnVbN036FgdlrMf
	iv/svrUO0k/DLVTjLQxCEROTDmyjIeVG2p6KOfyNLubuFHu1J34j7BnKTdyTBjhFQGV11+DDarc5p
	RsYX04JsZj9uu1GOBpXfXqwMtYCTzc2sPbLMF4fjnp3c8IrkAed6xANCP4XA4WOlWnVuKOIQK2EuL
	s9cz+E68Pc1ryILP2Wo8wiC/iy8T7Qn3IlEoynA9bKr1SBwf8thY1v+Lt8XdFPQ86lUFsscra0mRL
	PbdNQli3ZJ1CBR0UxuXhXZdaccnLmYoPGzjIzgQAWl/0YZC11RqFKYmtzGynzI9z59qvOkbd2Jxyr
	iuuGNgEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0CCI-00000006bf3-3CXF;
	Sun, 21 Sep 2025 05:01:14 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0CCF-00000006bdx-3eXl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 05:01:13 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-331d60b0a37so1085698fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 22:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758430871; x=1759035671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjfAWdx3qllN2H0M+sW0dm7oGyFJwrK43aFNVvYCDkE=;
        b=AMsivfWW/mRsJmXalj2XT1NbWd+RfcJWJxAzdx7n9B2vX2Wp5EN9CPFynS0qzUHFJh
         usYqxX3bxjERmJm0A5ILRjjLd8HWZgY7XOyWpwBIKVREvbH8zW0tWp+ukjnBeJNmuzAC
         0SbAOPrY8T2leYIJZUfUVzTjWitNW2tuwiBHFDwmSy1lH9clIARNbFtoLGShEgOghXUT
         VWnSd8/mD6kkyBrZxGoSgOxusrco5Aa5uwVjPuUqIANVxVdr+9sf1WDV3O6vzo7+OFy1
         fUpOVpL4icftVwXwisUPjZJMjpKmHaHa/IzqZH9qnuHnqFvt6NKxmH0Urjmdt6XqW21D
         f04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758430871; x=1759035671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjfAWdx3qllN2H0M+sW0dm7oGyFJwrK43aFNVvYCDkE=;
        b=Uu/3kOc9AGraRPRqgL1PNe3EFMePBLg+ccybRn01uaeBr891oW+IdjBFmDaDNAIrZi
         xEUylxUKwnbVErGSm/JtLgS/w6hdWsjtcUGHJgUJak9kS8L/DrZMm2dvz0k0CmSH96Sc
         9ErhH+8eZ8r91fX0vReQUctMN6SPIQBQgUtP4VUeYcRc42Efxks/cwq7j6dcxJdbbfXx
         ZKv+t7RtSEKMre15pyKVR3pWF0tWRAzZ9vyFcznkJcw3jBpw5qwF2F4Oun9Vy0zPVtCO
         Ip9pwwDDEUX/PnQOpFDfgTy8ggdtieCZb1BVtdVRYQOM4dN9SRABv8tE65yuRW/57eVZ
         CVfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfgQjkLoJvPXiVINjpyl7njFKfdiKQfqE3fvcnMf6dSBxfNcrGTCqYclC+Vf3EHKc9Q6/VGc5lnti4YoHB+kYI@lists.infradead.org
X-Gm-Message-State: AOJu0YypVvSbfykvCOD3OV+k9EO01np/1RjTKj/vnDCfZT+xOU+BvE5j
	VoZguGPWC+kzFqdygibGSBxzQNNjD3HiTMBO6oneY3WwTXwMZtMIPtiRCtgvAFm5/V9U33vi/en
	MNkb8CMXlFaeJcrpSZcl2Gb0e92lLNEY=
X-Gm-Gg: ASbGncvU252P6r9M5dqcEKejrTtUWYTOG4WpmaYq3hzULj0kb50SKX6P9TKFZgEZDwT
	bRohWlZvVKpB3LlBD5CgKnWqd/fbKsNGQQwONJgz9NDzO//PBNRl3ekQ8DYtcxPVFtAEyxGc/PE
	/h4akfWSo0uWiLA6mc14GZH8RpBT3Lao+AK64zJ0Ge84R5vxSnR6aXe3hjwIt+Aq5C1EGRxCLvX
	RGZlmNA
X-Google-Smtp-Source: AGHT+IFKpKCb+G5+tP41Jly7b1/38Uvws70S97XKQpr/S5rzy7zAFBiiLMjEcsLoKodvfvth4fS5Yj3OP9ZLUPhO44s=
X-Received: by 2002:a05:6870:6e83:b0:31d:718f:a09d with SMTP id
 586e51a60fabf-33bb5c80cf2mr4292754fac.25.1758430870653; Sat, 20 Sep 2025
 22:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com> <20250917-mt8196-gpufreq-v3-5-c4ede4b4399e@collabora.com>
In-Reply-To: <20250917-mt8196-gpufreq-v3-5-c4ede4b4399e@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 21 Sep 2025 00:00:59 -0500
X-Gm-Features: AS18NWDK9SEswNrgx0QIzUV1feO9ul79WZJVBOk2Mw-YsP45swDD7fxXXq-LHKs
Message-ID: <CABb+yY0_TZC0Dd3Rue=6Am4=Urs8hdkaa6RE=42t58SYUsLV0w@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_220111_921324_F288AF66 
X-CRM114-Status: GOOD (  21.48  )
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

On Wed, Sep 17, 2025 at 7:23=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
....

> +#define MBOX_CTL_TX_STS                0x0000
> +#define MBOX_CTL_IRQ_SET       0x0004
> +#define MBOX_CTL_IRQ_CLR       0x0074
> +#define MBOX_CTL_RX_STS                0x0078
> +
1) Please don't pollute the global namespace. Make these something
like MBOX_MTK_GPUEB_xxx. Here and elsewhere.
2) You don't write short values, so maybe just 0x04, 0x04 0x74 and 0x78.


> +#define MBOX_FULL              BIT(0) /* i.e. we've received data */
> +#define MBOX_CLOGGED           BIT(1) /* i.e. the channel is shutdown */
> +
This is confusing. CLOGGED usually means malfunction, but it seems you
want to call it STOPPED or UNINIT?


> +#define MBOX_MAX_RX_SIZE       32 /* in bytes */
> +
> +struct mtk_gpueb_mbox {
> +       struct device *dev;
> +       struct clk *clk;
> +       void __iomem *mbox_mmio;
> +       void __iomem *mbox_ctl;
> +       struct mbox_controller mbox;
> +       struct mtk_gpueb_mbox_chan *ch;
> +       int irq;
> +       const struct mtk_gpueb_mbox_variant *v;
> +};
Other structures have kernel-doc, so why not here too?
...

> +
> +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> +       int i;
> +       u32 *values =3D data;
> +
maybe order in decreasing lengths ?


> +
> +       /*
> +        * We don't want any fancy nonsense, just write the 32-bit values=
 in
> +        * order. memcpy_toio/__iowrite32_copy don't work here, because f=
ancy.
> +        */
>
Please make the comment technical. Currently it just expresses your
distaste for fancy :)

> +       for (i =3D 0; i < ch->c->tx_len; i +=3D 4)
> +               writel(values[i / 4], ch->ebm->mbox_mmio + ch->c->tx_offs=
et + i);
> +

...
> +
> +static struct mbox_chan *
> +mtk_gpueb_mbox_of_xlate(struct mbox_controller *mbox,
> +                       const struct of_phandle_args *sp)
> +{
> +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(mbox->dev);
> +
> +       if (!sp->args_count)
> +               return ERR_PTR(-EINVAL);
> +
> +       if (sp->args[0] >=3D ebm->v->num_channels)
> +               return ERR_PTR(-ECHRNG);
> +
> +       return &mbox->chans[sp->args[0]];
> +}
>
Just use the default of_mbox_index_xlate()

....
> +
> +       for (i =3D 0; i < ebm->v->num_channels; i++) {

You make this block a bit cleaner by using a temporary variable
        echan =3D &ebm->ch[i];
and using echan instead of ebm->ch[i] a dozen times below.

> +               ebm->ch[i].c =3D &ebm->v->channels[i];
> +               if (ebm->ch[i].c->rx_len > MBOX_MAX_RX_SIZE) {
> +                       dev_err(ebm->dev, "Channel %s RX size (%d) too la=
rge\n",
> +                               ebm->ch[i].c->name, ebm->ch[i].c->rx_len)=
;
> +                       return -EINVAL;
> +               }
> +               ebm->ch[i].full_name =3D devm_kasprintf(ebm->dev, GFP_KER=
NEL, "%s:%s",
> +                                                     dev_name(ebm->dev),=
 ebm->ch[i].c->name);
> +               if (!ebm->ch[i].full_name)
> +                       return -ENOMEM;
> +
> +               ebm->ch[i].ebm =3D ebm;
> +               ebm->ch[i].num =3D i;
> +               spin_lock_init(&ebm->mbox.chans[i].lock);
> +               ebm->mbox.chans[i].con_priv =3D &ebm->ch[i];
> +               atomic_set(&ebm->ch[i].rx_status, MBOX_CLOGGED);
> +       }
> +


-j

