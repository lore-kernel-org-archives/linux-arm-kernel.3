Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADB0CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 13:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVOOi63ZhPXMxempK5lZHLkxz38ev6/FULudejb/aYM=; b=m0UeipA7mW7qmM
	2ZDGbeN40EQM9lnExql1ocr9EOBoNxp9EY4pUBGvgV/XxS+ZWydKrLxueHMdFUWjY/XPMCHbQRhrY
	uE8+bePqj62AgnpPPtz9Ve0QNE7pM2Nd9yk5JcjKg9amewNDq3dInn5NLNddSAl//HxDO/K3obntw
	b1tyENjU3VoYAzM/6DvYYYdbEJF0MgpHWG3pEMUM1Zrwqu/MXyR7kXDcf+/RraByKumr8A34zJ2SG
	4vfPuOaLA8aLRW16PKk9lFxT2yYlgcnar1RJnR7GSOOKk46JWjjyYCxCambH8CVtOUdUxkbDWL/nP
	cgL6BBgqknYUDlXjBgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCoA-00000001MRs-1tnT;
	Thu, 18 Jun 2026 13:29:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCo9-00000001MRk-2DvO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 13:29:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 570D260008
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 13:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA411F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781789364;
	bh=wVOOi63ZhPXMxempK5lZHLkxz38ev6/FULudejb/aYM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=FJqDnySiiQggoMnvVag4iimdFdyfNCrz6C4LC2zDdRov2lhC6+T6/F1uD4JNanERV
	 UEExDkLvzRWLEnNZbOm4twkIElmffckM47WnnaIy8C8+bFgE7ndBQYaxa1fahaICK6
	 L6sAICvD7Aeuh6AUZWo8omK75anpjQhQVuPMvGBwpvrxUhOtC/aJBxVPGc3cniC/Wo
	 hvRf7OgASfVyAAw+Jp5QmQ/rmSp9hSmu1FpVozmbAp1Pn15/xZ2TqtwpRfZzmMHdeu
	 tP8+/NsmgLZs+QRFTBM4jJh7lbU2yvVL080UAbM4pRf+YWtF/5+dCuP2FUTIHWIadE
	 8Tqqx7JgleQEQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3967738c801so10135221fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 06:29:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8RqhoTYdPtGfDCduxEkxoknVv/cU8CV9M40335iq1Q2AJjmoBuKLVmX/xC3xT6iqZfp41HW95c5cPARmgUDRhN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5C/ijNxmIZ0AKDVGiheVwrUTiLQ/vPOWjIYQ+nSSb8yUBNV8P
	pcDLDujYRtb0Y73zlf/nSMQx7QQPQXfDqk27XFfBNMbhGOq2a5bTjVQyyG8TM4rQZoExUsM/2VC
	8mQG9dFfGjr3mFZIrD5cHkXubKPO4EB0=
X-Received: by 2002:a05:651c:3c8:b0:399:87c9:4573 with SMTP id
 38308e7fff4ca-39987c94856mr1182931fa.22.1781789362548; Thu, 18 Jun 2026
 06:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260618132139.11114-1-udaykhare77@gmail.com>
In-Reply-To: <20260618132139.11114-1-udaykhare77@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 18 Jun 2026 21:29:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v65GFVkJ+YL2=kCRX4mDe_xE0fgvpjsVD6biOga3cFwNPg@mail.gmail.com>
X-Gm-Features: AVVi8Cf_QbtsxS3-TRCHlybZZ480cZ0SxK9nD8A_JEFe5k3XZDF_8tXlFc7mpuQ
Message-ID: <CAGb2v65GFVkJ+YL2=kCRX4mDe_xE0fgvpjsVD6biOga3cFwNPg@mail.gmail.com>
Subject: Re: [PATCH 2/4] i2c: sun6i-p2wi: Fix device node reference leak in p2wi_probe
To: Uday Khare <udaykhare77@gmail.com>
Cc: andi.shyti@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Thu, Jun 18, 2026 at 9:21=E2=80=AFPM Uday Khare <udaykhare77@gmail.com> =
wrote:
>
> In p2wi_probe(), the device node reference obtained via
> of_get_next_available_child() is stored in childnp. This reference is
> never released via of_node_put() - neither on the error path when
> of_property_read_u32() fails to read the 'reg' property, nor on the
> success path after the target address has been read.
>
> Fix this by calling of_node_put(childnp) on both the error and success
> paths.
>
> Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) c=
ontroller support")
> Signed-off-by: Uday Khare <udaykhare77@gmail.com>
> ---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c=
-sun6i-p2wi.c
> index dffbe776a195..1ef0e82eeb63 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -220,10 +220,13 @@ static int p2wi_probe(struct platform_device *pdev)


I would just include linux/cleanup.h and make the following line:

>         childnp =3D of_get_next_available_child(np, NULL);

          struct device_node *childnp __free(device_node) =3D
                  of_get_next_available_child(np, NULL);

No other changes needed, and much cleaner.

>         if (childnp) {
>                 ret =3D of_property_read_u32(childnp, "reg", &target_addr=
);
> -               if (ret)
> -                       return dev_err_probe(dev, -EINVAL,
> -                                            "invalid target address on n=
ode %pOF\n", childnp);
> -
> +               if (ret) {
> +                       ret =3D dev_err_probe(dev, -EINVAL,
> +                                           "invalid target address on no=
de %pOF\n", childnp);
> +                       of_node_put(childnp);
> +                       return ret;
> +               }
> +               of_node_put(childnp);
>                 p2wi->target_addr =3D target_addr;
>         }
>
> --
> 2.54.0
>

