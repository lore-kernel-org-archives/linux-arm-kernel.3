Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD08CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 19:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/963SaMdjSqaZV3E16x7QC3H7CLh1B3KU72kSN0hNJI=; b=gqsH0P1+fQ8AKP
	O1HP4obQaXVy+4hWAiwKkrMFtaPbBCz9l3exeA2f38ptWJHddetJ8MGVCK+XxRm5MWmbmOXdHbxP5
	245bbRxUIENc5vTBln6xfFcDZKqbEBHMU2qXejRGYeEHnOoWLT2i5qL46wQeMJ6REL5L3EhltUO8M
	gBui+F462Bri6L5xk4IzXnyDyqLP+4ZY47rW/TWUPhiXDaSoph9E0TadKtOx+QezIICglKnQiVCsb
	SxK/7iUAYgwVFpu8RbuBgWSO54LGikKppTkCZ6SWEFTAxp4ilEm9CBgc6BXsP8xn98ACrtq7mx+er
	MLL4wz6rk8l2z1fMKtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVPN-0000000BlC8-1YAb;
	Fri, 22 May 2026 19:19:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVPM-0000000BlBY-0YId
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 19:19:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E85260204
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 19:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DB21F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779477583;
	bh=/963SaMdjSqaZV3E16x7QC3H7CLh1B3KU72kSN0hNJI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=E+ZNmlE0DoCuxSB48HVESxbd5crug2jNY3dHaKN/XlwzPFfOV9+sCUQW1Pn4fhDsh
	 xDAFd1tvGCoYYhBC22ZQH7isYQO5/zD0c2rxFznuidrsgVXKv2CmVDJeuCxh6pTP6h
	 jXRnPYz+MSmPEbyfvH+bV9yv+uuUu9ZDpCGCDSw58hDPQqdVyh/WDGj7NwshPcrwm2
	 tm3UkYKR4SMJ38x2/3bSFwp3wScaeiZy8pUbNX69LMNbhEKFpFVWsZuTFhW/ALbtm1
	 O1wkGHZFcg0j40vw8rmRkysMwq3pIxREAf+vdCpREMKQUzohCTnYbpKHjcllRUE50V
	 K+Pp2rSpV3ikw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a8dc2606a0so8267370e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 12:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8YJVg9n15sgbprtR2bJymDHno+R9Q8aDCltpayAB7SXYYuIGBGKQfNyq9RHJZicF32DeiKgk4Nopnv3C8Q2h8Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwubYgoff756v7tn1SD7cy8kckPj8vEzlM1IUXe4p0/uwj/MQP7
	+aB4J7t3hTIjfX5OZdaMVpO4K2uaTVfMGrbOukxgUEY6oKJFeOjK6LYzBnYnxPfoPNNW5B74UQ2
	s+tOCOR15A9l5W/+MQC2QNpZjKKjcU7U=
X-Received: by 2002:a05:6512:3b25:b0:5aa:b6b:93c0 with SMTP id
 2adb3069b0e04-5aa323a9144mr1722768e87.42.1779477581606; Fri, 22 May 2026
 12:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
In-Reply-To: <20260522095401.72915-3-phucduc.bui@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 22 May 2026 22:19:29 +0300
X-Gmail-Original-Message-ID: <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
X-Gm-Features: AVHnY4L8PhtBwUpCMgPdVH7zJKEZWisTWbNT00mcsDhEyaF4lTxulcCeLkrcUQA
Message-ID: <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 22, 2026 at 12:54=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Accessing registers while the device is runtime-suspended
> may lead to invalid hardware accesses on systems where the
> APB bus clock is gated during runtime suspend.

Did you actually reproduce the issue, or did you add the patch simply
because Sashiko mentioned it?

On sunxi, either it will hang the system because the bus transaction
got ignored, or it won't as something else enabled the clock.

And when you do add patches due to Sashiko raising an issue, please
do mention it in the commit message.

> Ensure the device is resumed before accessing registers.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-spdif.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.=
c
> index 89eccc83a130..f54eb14c9ed8 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -428,6 +428,11 @@ static int sun4i_spdif_get_status(struct snd_kcontro=
l *kcontrol,
>         struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai)=
;
>         u8 *status =3D ucontrol->value.iec958.status;
>         unsigned int reg;
> +       int ret;
> +
> +       ret =3D pm_runtime_resume_and_get(cpu_dai->dev);
> +       if (ret)
> +               return ret;
>
>         scoped_guard(spinlock_irqsave, &host->lock) {
>                 regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
> @@ -443,6 +448,8 @@ static int sun4i_spdif_get_status(struct snd_kcontrol=
 *kcontrol,
>                 status[5] =3D (reg >> 8) & 0x3;
>         }
>
> +       pm_runtime_put(cpu_dai->dev);
> +
>         return 0;
>  }
>
> @@ -453,8 +460,13 @@ static int sun4i_spdif_set_status(struct snd_kcontro=
l *kcontrol,
>         struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai)=
;
>         u8 *status =3D ucontrol->value.iec958.status;
>         unsigned int reg;
> +       int ret;
>         bool chg0, chg1;
>
> +       ret =3D pm_runtime_resume_and_get(cpu_dai->dev);
> +       if (ret)
> +               return ret;
> +
>         scoped_guard(spinlock_irqsave, &host->lock) {
>                 reg =3D (u32)status[3] << 24;
>                 reg |=3D (u32)status[2] << 16;
> @@ -479,6 +491,8 @@ static int sun4i_spdif_set_status(struct snd_kcontrol=
 *kcontrol,
>                                    SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
>         }
>
> +       pm_runtime_put(cpu_dai->dev);
> +
>         return chg0 || chg1;
>  }
>
> --
> 2.43.0
>

