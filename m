Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE4DC021A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1ki+G0JPNrh9TGAEWfL+l/C4IFlJkUDv2DnvQNOIs8=; b=r6sySPIzdctSkVzB6lZYU1y3jq
	gO5JAKXXab5ULYyGJQ2eaQSQr4374MqEY5WZ/P1ysRwCgI0Zz345AnrE5/n5FknGnTBxs9KlEMT18
	rKr4dN+r/ckbxOV4SGoxIXm+Dd4bpNAmNyGpb62LOGDFC8w2EMe9LMEV8IWtOTk+6E0omO+yYUfxW
	NqJ2RZK3TQMqoQyinP7dSfcDDhL3D0hUpRkXOzGh/H1Jvosn0VnKqPvsoA9wMQPrN/MxquAPye4z1
	u7/Big+rj8wGO8CiQ1DwyAvPLa22VSTcbKI+l9UqpAprq9ckdTDZ6FhyLYomxmpx5sA4XQyLG1dpz
	rSclKqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUZC-0000000AGoX-2A0C;
	Thu, 13 Feb 2025 08:27:26 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUMW-0000000AEnc-03IQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:14:21 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30613802a6bso6492831fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 00:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739434458; x=1740039258; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1ki+G0JPNrh9TGAEWfL+l/C4IFlJkUDv2DnvQNOIs8=;
        b=XGTfIM4Czur/ta/ln/2zMzgwKg7PbH6BjJtxvCgoX72bekNhHw9cUXs9tXSfHEEnGJ
         A/pfybkVRcUqqzsz0BoT+xZoWX4njIDrOUCS2XDj3H4NNCLUcM0XBE4GKRmF4RwlUp+D
         VkLirhK3QY8+4ZB2Lgwexvd9oxwwUgY1wDEAfcq4tFsJEBmXh/fkYmx41N4TqzQPnhpI
         gNygtrph+fkpB89oxm2DNrfAV4bBkI7DqkN7jjvXTh2jZl4TLjYraCDbrpC4UbIw/HVe
         ixVigNozFHxLbHObTBWa0Apd72/pIvJQDJHJEyAXdN0Dh3dNwPynur/Nny4P+F7+MuNA
         WPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434458; x=1740039258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1ki+G0JPNrh9TGAEWfL+l/C4IFlJkUDv2DnvQNOIs8=;
        b=wca1UcxyPkYgQGlZOy6yvmAf9I58YwQk/qaImm/ndgBqvRJ/3Ijv9CB/VAzeRyYhqB
         EKtzv53KihUzb5qVWQBtyuFn7Iy64ddunZxq03S60hNfDXMiAqd+OqIvAsJ5YU94U9Yz
         /wiE6SMA6YygGxXCIfDk7EG3r8qTRyObLJ+Dk2PpqDPO/CeCCUuVvbLjzIhPvzFEqDPS
         216j+wmPfkKq5de5BR8TSs+iiG3PpX/9eV101FfU6N3Cz7eZQG4ynF+G6S85ymkza7Qg
         PwdyVq7HGi2uhKieHLTYhlY/xNh3nVz8sly7YTx8H5A82i/rqNl3CGXB0E0pufCd247Y
         JvYA==
X-Forwarded-Encrypted: i=1; AJvYcCU5EA/wAsfKXWH7blpYGoSL4DR2ffTUk6jPUzRGpYUmBlSV8RTgtdcmkNWzrSPQd+lLWLepvyDiIuxrGZBmGZvU@lists.infradead.org
X-Gm-Message-State: AOJu0YzkH/l3aCPixtbvMnOXSazhZFS1IlPciLYvBh4A1AwwoaNztYrM
	aCF73BlusFAGvqzLtZgDnHAYgqrfTGpfTISI46EIVxLtYyw+VsVhACK1v0izzk+F19SjqcVvaoJ
	7S9koFJpIKVyBVXveO5EXWZTUj4rMBHNBRm4X
X-Gm-Gg: ASbGncujj06UURgnEJPzto1Tt53cr0nWtVYNOgJqfdYbJAtis+DBNx7UGQ/MCYmORhN
	xtRgGsyhR2uF4EB2Nfh87tC+8N0z3EBgYVIHZsYWlu2309EW3G/2Aj3u0Rcfg632EwEpkch8=
X-Google-Smtp-Source: AGHT+IHf9iq2n1PUU5HCWe9soaH4SFA9WbopYOlEastjkCTCAX4hoUJGTt7Zw2wOUBlbY2AJ3VKHXgQD1OrOSfhwXZM=
X-Received: by 2002:a2e:bc85:0:b0:2fb:cc0:2a05 with SMTP id
 38308e7fff4ca-3090ddd1604mr8206891fa.37.1739434457896; Thu, 13 Feb 2025
 00:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com> <20250120-scmi-fwdevlink-v2-4-3af2fa37dbac@nxp.com>
In-Reply-To: <20250120-scmi-fwdevlink-v2-4-3af2fa37dbac@nxp.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:13:41 -0800
X-Gm-Features: AWEUYZkG9pGG1E2hWQ62JNBsrZ94QFIvS7VdMRQU29qCe8Cm2dCEy_nhw7vZ3rE
Message-ID: <CAGETcx9E1MYgzd7Hupz8YAqk7-D1Aeb+AAyQiEMia-6hnFQTRQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: scmi: Switch to use machine_blocklist
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_001420_051781_4D4EB652 
X-CRM114-Status: GOOD (  17.04  )
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

On Sun, Jan 19, 2025 at 11:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> With machine_blocklist, the blocked machines will not have pinctrl scmi
> devices created. The fw_devlink will link consumer and supplier
> correctly.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scm=
i.c
> index df4bbcd7d1d59ac2c8ddc320dc10d702ad1ed5b2..f041478758b50e85d99214f4f=
e42208d0c8c808f 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -505,11 +505,6 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl=
 *pmx,
>         return 0;
>  }
>
> -static const char * const scmi_pinctrl_blocklist[] =3D {
> -       "fsl,imx95",
> -       NULL
> -};
> -
>  static int scmi_pinctrl_probe(struct scmi_device *sdev)
>  {
>         int ret;
> @@ -521,9 +516,6 @@ static int scmi_pinctrl_probe(struct scmi_device *sde=
v)
>         if (!sdev->handle)
>                 return -EINVAL;
>
> -       if (of_machine_compatible_match(scmi_pinctrl_blocklist))
> -               return -ENODEV;
> -
>         handle =3D sdev->handle;
>
>         pinctrl_ops =3D handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PIN=
CTRL, &ph);
> @@ -561,8 +553,13 @@ static int scmi_pinctrl_probe(struct scmi_device *sd=
ev)
>         return pinctrl_enable(pmx->pctldev);
>  }
>
> +static const char * const scmi_pinctrl_blocklist[] =3D {
> +       "fsl,imx95",
> +       NULL
> +};
> +
>  static const struct scmi_device_id scmi_id_table[] =3D {
> -       { SCMI_PROTOCOL_PINCTRL, "pinctrl" },
> +       { SCMI_PROTOCOL_PINCTRL, "pinctrl", scmi_pinctrl_blocklist, NULL =
},
>         { }
>  };
>  MODULE_DEVICE_TABLE(scmi, scmi_id_table);
>

Definite NACK to this. Please don't depend on indirect
conditions/flags. There's no guarantee that this check will hold true
in the future.

-Saravana

