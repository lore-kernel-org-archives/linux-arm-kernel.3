Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4A1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crJfUyaZFUd3zm6f6eWNF5fFGcJayPgP/WBKMvt7miw=; b=s1Johqk9VmHs5BKr1EFTGLLgsO
	33FkSzTlK2ucMO0U87MIxWZoaosiRDL5V9K7oJD+i3U2xAwxYmGMmprUNMtjtoUqSGo+sSoEd2eZM
	CFlbmc9LVMuHRt+Y3GOK5uIr8KoM5AYFIgMJaZIYTCsmbGk0ymxXtz3a9inFwOabojA5NX/UJsKzH
	2wGn/GPMhhayuNjBMw1Ckr5tcrNep2Vd2C/zvh2YRsydXxuI5ebVf17wFYKvxuh7UhmHmBLMh25eL
	oerRjXHWN7icvZKLu55vDEL8paKQB0gEvkkioe8IbC9AmJErIbsqBnOK/JgCF29thv6z/a1h6Paa1
	qpvlAnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjmw-0000000CXOO-0ZmO;
	Fri, 18 Jul 2025 12:02:06 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucimt-0000000CNJP-3U7j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:58:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1928114b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752836279; x=1753441079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crJfUyaZFUd3zm6f6eWNF5fFGcJayPgP/WBKMvt7miw=;
        b=YDrxdPjfeZbODf0umlvf6ggD5G9Ec4AuNrdJ85+vuL8WQV2yV8+dEyNpPOaL7naSfH
         ndpi86Eq61D3KqOM9CYzPoGaGJ16yC+HQYOu18+ZaW6oJxgwAZuHzUBzWCk4c/lTWgvv
         zPq8pCgW6m+WUWPPrLyVQ+nJ3v6w72ofwXVD87WjWeWhHkSxbyBI3b4tklB0q4pcD0wg
         prsTaLdEgJQAkRuM19LnnJBSYbWVRc1WD0NzdcY2tqhWz78W6MyI5lNlCMaYNm/QOzw9
         2N/31NarDHCWWC5DgcEtlFV3dCM+cxbEYGkXssZasCU+1yKsyz5+UeAx4p56cZreSc3n
         FNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752836279; x=1753441079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crJfUyaZFUd3zm6f6eWNF5fFGcJayPgP/WBKMvt7miw=;
        b=G+Pi5yNqikO0HUy1fByypnLhPTDlyabXedMg54yB2NP+QZPi534PCuqBXSwq0a/Pm3
         G/sbd2TGBqknVn2J9KDLeZedGRbSsh2vi2fFZClZZE9Gp9hDw7fv6/0S6ZhbBHlEJhDw
         TMeL7alIPmSNZ/aYS9r3CyB7khRd6O4BeBhugwoSz//n3F3hYSGgDxkjLDEYACy2S6Et
         zPFIqxbV7rAHpnlz4uLxOTsRKft/RiN8vOWismd1Lr4fu2iIXhmnZa3bOLm/KZ2p9P9Y
         y9DdSUzxhXohTgCOjmzu78IUfbKveG5C9kbkN9DXFZIe7lLOiEjY42T5LjPuM4O4hd3r
         1F5A==
X-Forwarded-Encrypted: i=1; AJvYcCWyKJKKH6ewvVMb2ycDgx6Gxu8aZqsz9mQ/JIoE4QWvIbXjxla6mJI2iCb8xNbxliZNyJbeZ5J65MQoRR0pvWHL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf0g1oW0RMm4Jl/6T2xPpWuDmZ4zMY9eS0sN7XdNx30pWeE8xy
	ZhTo8YwRFq4NG2DI6iNq4RNdaqTcKwvDHr15YWVnrOjjyMK4ZGO6KTGikTrY26tfWbCkMdqahLT
	OHz+6GQGKokzAfxmdML9zdsn9R0GXPIg=
X-Gm-Gg: ASbGnctreTw8FiNMkfJcf4wCS9Z1OUfY8pm5V8IhFqGxw5DWVsMYTN26uGF6+A+/zMw
	oAFjigxHGuQjKVwZJZ9Xzf3iUx2e6842EhBHxpvnwDx8AWhnPSDg8Co3eAlCbFYEgsEy4OsylVx
	BfAB3Sr0/qkTxBrkjxuIwV08QiMdU7Z3nGVtOnxCxJA13wsT8TgymBWmgxtvrdJkyZOSKoMfDkb
	6Oh
X-Google-Smtp-Source: AGHT+IG3K+OJchpvRdKs3tFgBFIPgoho17ujC5cDtqCUPyeRXXDSSMCfEs84NE1rrM2vaVhaZ1ZL/UjRgJAtRS/XdRE=
X-Received: by 2002:a17:90b:57c7:b0:311:eb85:96df with SMTP id
 98e67ed59e1d1-31c9e75b966mr17155358a91.17.1752836278553; Fri, 18 Jul 2025
 03:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com> <20250704052529.1040602-2-shengjiu.wang@nxp.com>
In-Reply-To: <20250704052529.1040602-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 18 Jul 2025 14:00:03 +0300
X-Gm-Features: Ac12FXyvAM2zuSZO19tjGTn3I8j6ZBYP1ezDycsLSWPMXkx77mmnhd_OLQ_GFhA
Message-ID: <CAEnQRZDeXrhHaU-tiAizXL3cNK-6rpbACx9QGNVpV8GBEKAPYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_035759_873876_BC3715C5 
X-CRM114-Status: GOOD (  27.11  )
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

On Fri, Jul 4, 2025 at 8:29=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> When recovery is triggered, rproc_stop() is called first then
> rproc_start(), but there is no rproc_unprepare_device() and
> rproc_prepare_device() in the flow. As the software reset is needed
> before DSP starts, so move software reset from imx_dsp_runtime_resume()
> to .load() to make the recovery work. And make sure memory is cleared
> before loading firmware.

Hello Shengjiu,

Commit mostly looking good but the key point when writing a commit
is to explain why the commit is needed and less about what the
commit does (this should be obvious from the source code).


So, I would start with the context and that is:

Following commit: 6eed169c7fefd9cdbbccb5ba7a98470cc0c09c63
    remoteproc: imx_rproc: Enable attach recovery for i.MX8QM/QXP

enabled FW recovery, but is broken because <and here explain the reason tha=
t
you mostly described in the original commit>.

Then at the end add the Fixes tag.

Also, allow me on more day on Monday to test this patch.

Thanks,
Daniel.

>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 43 +++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_=
dsp_rproc.c
> index 5ee622bf5352..ba764fc55686 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -774,7 +774,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  {
>         struct imx_dsp_rproc *priv =3D rproc->priv;
>         struct device *dev =3D rproc->dev.parent;
> -       struct rproc_mem_entry *carveout;
>         int ret;
>
>         ret =3D imx_dsp_rproc_add_carveout(priv);
> @@ -785,15 +784,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc=
)
>
>         pm_runtime_get_sync(dev);
>
> -       /*
> -        * Clear buffers after pm rumtime for internal ocram is not
> -        * accessible if power and clock are not enabled.
> -        */
> -       list_for_each_entry(carveout, &rproc->carveouts, node) {
> -               if (carveout->va)
> -                       memset(carveout->va, 0, carveout->len);
> -       }
> -
>         return  0;
>  }
>
> @@ -1022,13 +1012,39 @@ static int imx_dsp_rproc_parse_fw(struct rproc *r=
proc, const struct firmware *fw
>         return 0;
>  }
>
> +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware=
 *fw)
> +{
> +       struct imx_dsp_rproc *priv =3D rproc->priv;
> +       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> +       struct rproc_mem_entry *carveout;
> +       int ret;
> +
> +       /* Reset DSP if needed */
> +       if (dsp_dcfg->reset)
> +               dsp_dcfg->reset(priv);
> +       /*
> +        * Clear buffers after pm rumtime for internal ocram is not
> +        * accessible if power and clock are not enabled.
> +        */
> +       list_for_each_entry(carveout, &rproc->carveouts, node) {
> +               if (carveout->va)
> +                       memset(carveout->va, 0, carveout->len);
> +       }
> +
> +       ret =3D imx_dsp_rproc_elf_load_segments(rproc, fw);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
>  static const struct rproc_ops imx_dsp_rproc_ops =3D {
>         .prepare        =3D imx_dsp_rproc_prepare,
>         .unprepare      =3D imx_dsp_rproc_unprepare,
>         .start          =3D imx_dsp_rproc_start,
>         .stop           =3D imx_dsp_rproc_stop,
>         .kick           =3D imx_dsp_rproc_kick,
> -       .load           =3D imx_dsp_rproc_elf_load_segments,
> +       .load           =3D imx_dsp_rproc_load,
>         .parse_fw       =3D imx_dsp_rproc_parse_fw,
>         .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
>         .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> @@ -1214,7 +1230,6 @@ static int imx_dsp_runtime_resume(struct device *de=
v)
>  {
>         struct rproc *rproc =3D dev_get_drvdata(dev);
>         struct imx_dsp_rproc *priv =3D rproc->priv;
> -       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
>         int ret;
>
>         /*
> @@ -1235,10 +1250,6 @@ static int imx_dsp_runtime_resume(struct device *d=
ev)
>                 return ret;
>         }
>
> -       /* Reset DSP if needed */
> -       if (dsp_dcfg->reset)
> -               dsp_dcfg->reset(priv);
> -
>         return 0;
>  }
>
> --
> 2.34.1
>
>

