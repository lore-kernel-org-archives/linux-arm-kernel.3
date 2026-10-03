Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D61ACA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 17:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=; b=d7fAIGONHuJ07YXO/1Y1+91svq
	BrujmHWc1zuUzsIoibwk+mvt5uRl63C9XhB62AxoxlqJCW4uiMWw1Yo2GHvJKfR+FQjrcWiejDj3a
	zyVq0e+OkVvzxm0f+BlpZu0FfuJbKZ+QPgIP7MKstSid5WUdCktA9+JmwgIDNTOVhXgUGfejtpFVt
	pImVtcnrJF1Q3ccrt4kHMLfG6CdE4rJ3sJpqrMnJgG943LYr18yN8PRlW+D2yq3snFdMkKt7sGB1g
	pClZDwixSjMPDYXByL6WSWDeW6RIoN5lC+s3DOy9A0Ic3yfvPVQlB3zSnN4IXjrx01cNr5TGP19uq
	wRz0z5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3ul-0000000Dsej-3xOL;
	Sat, 03 Oct 2026 17:52:51 +0000
Received: from mail-ej2-x0c.google.com ([2a00:1450:4864:34::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3uj-0000000DseP-1Q69
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 17:52:50 +0000
Received: by mail-ej2-x0c.google.com with SMTP id a640c23a62f3a-c2e01f5c0aeso99079066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 10:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049967; cv=none;
        d=google.com; s=arc-20260327;
        b=jkZb5O8OtT0iykkS7FGFdFxiNACVPdsF2scZxhXHlEi7/OnMhjaCyLDNkIu3sqfd7C
         iOVbReW7T0hDP1XuXGX2cz7lE053wsIToWUq7GTViwNz8xpfxuK2WGkDvaLV6hI7ej/G
         VQJVR/7Q0dLGlhL6BMLL39bvTK9iALh9boPoIqQOMHt8y164a8ZNZQHzn2reCYOUgsJr
         DztFFTMot7ydrgjJxaLV6uEUkUULiv5JwFka5ApOYLNY5D4n6tsw8Ts7PD8iNZxZ7u7Z
         WTCSND71OS6wgX30zgMt96VxAFsvC4MuBn1XELIFvSfncSloIXsDV8xt683F2XRFjdQp
         8uag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        fh=G6f9s9MYdL0w3VbpVMPAX7ZJ2wuaJOBqcCdOn/iJUQU=;
        b=irVdgO3qeVVyQwXaTlpTuj5zUTTeMdhlsoC88G34dhUa4XRWw2rs70/94ke7C3fwFp
         VtNUKYjn04n6NINbxh8wYIENOxmFfZJGHXzJdgR6kWS+s911dwTHK4au4XOD4myjYEbK
         wJevczxP9ca/3RG2jR1rqMEDYKli+08ovsauZH3E78Jl6riCExTNA2C/H0POjt9ZZdoX
         d1FQpgVaE6hSXVhYCfC4ARm5Tc8x9Gd7yTLysKvpyeQ5eju61DH5liWZeWZL9wlxnN1x
         Aytb1BCT3IpWZK1SbMwKsjZ/7HnNoPPyi04Gf0uZEaJXH9U19BqliMU2c+onj+R65L8+
         1hhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049967; x=1791654767; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        b=mgdFL1dYJNcyvcH4O9MpZxU5XVTqElJ2RUEaQjB1JHwXBEhXW6ejScc5yj71hemz14
         RMfNhUHO2TRKriz7j1+scxYQpRk9gDeHLo/82XrPBO+CTsMOkePC711EQiSu/scxVUCi
         RxIcpKNNKfWqaaPBuZoFGS2bajyv9g1547WxyKNCLVktUSsTyDKuEKNjxG7H41yGAVT9
         0ZaAbhPHevZHZXyzMV3UYOEfPueRw5xtZCwxF6CGWXqqA5XZKQc6ixsU6ySRfsz9xPRI
         y1bdHBX8CmAWT6KxbXrHSmVTpE/VxsVRVRvpE9hv6uWqVLp7e8Od3ovihHrmAzZrIKun
         Lr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049967; x=1791654767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        b=KxLiqPLoVpz7uvtdQRfBj2F1X8O9kZ0imyw2yH4e1LhE1hA7Rs6IYlZWBO561wXZ6K
         s9UOGWqGRFORvBph3NAUvaaRmd/sL6ktxUySoN/PB9gn35JTLamOAwgr/Z7bruM30OcL
         9QcblgsrWRCx1oUNumnX2G3ObKUc3MsmGAcHspXDBEgczP/fENQOIXTj19PZGSElL0lV
         zpu3VY4rXAUGxjbKs6f3sx0Oe4r/Dsiz43DnyDCibGAEFyu5tJd/xVUoHZiNccdNWioK
         fPPb5xuIJCzdNglTpsGUPUqdJdWx+H6nLeZzx0FTCDUfSxb4OaXmgZt03xtKs7at3nl3
         PHlg==
X-Forwarded-Encrypted: i=1; AKwUvBzBsNpXUvXe16XimFb+85+AkwL7sLv9+RRXLdRWfpdVG+ziBlGhv7Xvvu/MuOQMsdDUy4kHYHTud9d21b5CRizZ@lists.infradead.org
X-Gm-Message-State: AFuF++l1VtCHpupZX7fHkQuofadSb20h/1y5nyaTxR8MpxhBlprUzYvW
	lVzMH36o66Ac72u4xs5HOb1dMbpeZQrGu+Q5hW/F/0lwX27hZXPaow9U9Yv5nr3ZD+vedBlnKzY
	P1jLsLJD5I/SlhKlqcy3Z7QiJwRfFYcc=
X-Gm-Gg: AYBFou0e/9y2P7DT3Nal+sgyRLUu/I0hYfBngyhdHTybB/BOOGnn5r6QBsqWChfyoe2
	2aLbF2v4egym0yZuBpvgjYqswaXSBw0uLdGPbVYFPzURxjoVgW/lNPxLPFGl2RFkghliGH7qI9y
	d6GOTQTRtHnBGGDalq+qars/jQJ95R2Uv9gf1uE9wbSkRBejm3nJSohoYpGVPQsGBVtP5ilNFwI
	clPzrdsYBYbi8HqPwIlOTtnJdj1hiUhS7UCZRDMJksezMbjgodxw/fKxt86/FPCH1fPcrvoPfiD
	F85Ipg++5lc0QTJYIMLaTUuWIdZrN3wFzybbm0zhg/NeUq+Ci6kWeMIafqTSHC5ArDlIcNyX7n3
	x0scCvXK2Oce28ylG6X/rsUAxr9HAbHatifAAFTSXzenAjSMdkU02MAxTkPxSEHzuZw7xPthcNW
	0sRJvkdUyqQa0K73YFmv+j0V/30JAY1JYHvxu3mgAF
X-Received: by 2002:a17:906:ba8f:b0:c2a:f1e7:d1ff with SMTP id
 a640c23a62f3a-c2e4a8fd869mr493909266b.4.1791049967157; Sat, 03 Oct 2026
 10:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:52:10 +0300
X-Gm-Features: AclHuK-UG3tTAL01WV2ZDjC5tjM6igwBQLvqa3RPpfuP_ptSFYX_iuwDV1YsoBk
Message-ID: <CAHp75VdyMJUBv9Y-4vdAWp2f2JB0toX+y7hV_esXxtni0wXutw@mail.gmail.com>
Subject: Re: [PATCH 5/9] gpio: mxc: use devres-managed PM runtime and dev_err_probe
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_105249_411352_37A42065 
X-CRM114-Status: GOOD (  12.15  )
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

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> Switch pm_runtime_get_noresume() and pm_runtime_enable() to their
> devm-managed variants so that pm_runtime_put_noidle() and
> pm_runtime_disable() are handled automatically by devres on both
> probe failure and device unbind.
>
> Remove the out_bgio goto label and replacing all error paths with

replace

> direct returns using dev_err_probe(), which provides better
> diagnostic output and handles -EPROBE_DEFER.

...

> -       pm_runtime_get_noresume(&pdev->dev);
> +       devm_pm_runtime_get_noresume(&pdev->dev);
>         pm_runtime_set_active(&pdev->dev);
> -       pm_runtime_enable(&pdev->dev);
> +       devm_pm_runtime_enable(&pdev->dev);

Definitely not.  There is little point to using devm_*() if you don't
check the return value.

...

>         err =3D gpio_generic_chip_init(&port->gen_gc, &config);
>         if (err)
> -               goto out_bgio;
> +               return dev_err_probe(&pdev->dev, err, "Failed to init gpi=
o chip\n");

>         err =3D devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port=
);
>         if (err)
> -               goto out_bgio;
> +               return dev_err_probe(&pdev->dev, err, "Failed to add gpio=
chip data\n");

These (and more) don't belong to the change =E2=80=94 split it to the
logically isolated ones.
One patch for dev_err_probe() and another for PM calls.

--=20
With Best Regards,
Andy Shevchenko

