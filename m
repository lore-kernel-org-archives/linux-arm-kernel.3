Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1E2CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 19:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIDdUlwLSUQ6HmbQcd4EJ2Xlpe/x6RgpxVHPUBtWOWQ=; b=WzY0y2evyzE6SB
	1o32kog6/wzbqjOuVfm/9tWNRoLMA/xNAdP19vpOB8aaeugoOM9Cn9Z6Td1NA1juJQ3EB/KDT1weJ
	+tM388xGjkoinMWpz2d5tYgtga73PS/8n8PHttwT9zTENLVT8dKaUQ6tXfMv60+vK1x9Xovo3+7WG
	TVhC6GDkTgIKBNqOT9kRj8P9IP8m01J7Edygfm6wpIL0XSv7X2+jeJBl6rVY9UCL7rT/IAsuxHcuL
	X6mYN/AUFCCXv/j/sVLH7qHW3UQd2Lgsy/fbCkB6XW5820rTspwIDJR7l9EAwBuPKXydPtKF/ijhI
	STBGAWsgiY0KEYj3j0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVQa-0000000BlXt-3YH1;
	Fri, 22 May 2026 19:21:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVQU-0000000BlUs-3iEr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 19:20:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25D2244432
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 19:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AA31F0155A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 19:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779477654;
	bh=wIDdUlwLSUQ6HmbQcd4EJ2Xlpe/x6RgpxVHPUBtWOWQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=CyxIvblafc9o1zBDFIS2/n6XwOdH2KLkAR6YxrHNRK+aCoBzHB0qSLh3WcjFw05RA
	 fRO289iHal7bHRlyVAzmx79wA8o0STWO8xtsyG0wtwUdVCfgLsMF2uXD0ABUfoCNMq
	 2nrjIOmHPDhauAPpxFxw7Um0/KDq8bqxvtzWTNQhRdoSOTPvtZhzRQaXTaOoFvKrIz
	 NlT01TtRsyuMKNPJX0kRFh2ax0BMTBQ+lqoI9DgxeyCQnX+967g/BO3Vy5TohRv7/n
	 j/MVsZiKdAFkKOyB11UtL1ff+zWXUt6lA7zqqj68/LkZWvYcfy6ren5ie+yrhToI0I
	 MRBD27xeHUoNw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-393c40246afso88143611fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 12:20:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+qU4wqP5S7FlHoqXy2lUtxvhJMFyYIci8c1rLxzeKW0Zxs9x74p0KFxZeSIHvQylhuwSiiV9o74k0IDSPwZGb@lists.infradead.org
X-Gm-Message-State: AOJu0YweDY8EPa+8E2K8gNQpPN1FhVIWlmdbMtxsKrg3PBZ6qH4b1NVI
	C979mUNULBUgRl/HvhiPSSIHxhjPxqBxtEmragHTl0+a1h1ZhiLYclEJkLW5GIyKjkmSXU0/QLA
	6Od4fjwiTLQ+wRYsSORfTrDKIYkkxZuM=
X-Received: by 2002:a2e:bd83:0:b0:38a:6537:6f51 with SMTP id
 38308e7fff4ca-395d88d8c98mr16564161fa.5.1779477652493; Fri, 22 May 2026
 12:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
In-Reply-To: <20260522095401.72915-4-phucduc.bui@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 22 May 2026 22:20:40 +0300
X-Gmail-Original-Message-ID: <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
X-Gm-Features: AVHnY4KTFRLsmgQYHw4_DylTQJci_NqnQ4LhdImsNnc-4boV7ByQgHAhKlvxOjM
Message-ID: <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_122054_965027_5AAA3082 
X-CRM114-Status: GOOD (  16.30  )
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
> Enable the APB bus clock before the SPDIF module clock
> during runtime resume, as register accesses depend on the
> bus clock being enabled first.

That does not even matter here. Access will only happen once the runtime
PM callbacks return.

> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-spdif.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.=
c
> index f54eb14c9ed8..102db1a2afbb 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -643,15 +643,15 @@ static int sun4i_spdif_runtime_suspend(struct devic=
e *dev)
>
>  static int sun4i_spdif_runtime_resume(struct device *dev)
>  {
> -       struct sun4i_spdif_dev *host  =3D dev_get_drvdata(dev);
> +       struct sun4i_spdif_dev *host =3D dev_get_drvdata(dev);
>         int ret;
>
> -       ret =3D clk_prepare_enable(host->spdif_clk);
> +       ret =3D clk_prepare_enable(host->apb_clk);
>         if (ret)
>                 return ret;
> -       ret =3D clk_prepare_enable(host->apb_clk);
> +       ret =3D clk_prepare_enable(host->spdif_clk);
>         if (ret)
> -               clk_disable_unprepare(host->spdif_clk);
> +               clk_disable_unprepare(host->apb_clk);
>
>         return ret;
>  }
> --
> 2.43.0
>

