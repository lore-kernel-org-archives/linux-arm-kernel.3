Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F190F3D610
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEoMF+RBv39WsZBwbT0yI7vq+gErMCo84OM5Ru4mKP4=; b=rDNtscRDXGbUrvP/XdyPg5+1nT
	TPSuhM+qJW6r55vIlolLbJXp2WUwBIJJoNh+oCVXM+NkrrthFoKQgXb07XbGVVw68DEImcXWHwOdY
	Y6m5cQyw1/+fSH1w3JEBj//lVL0bVTa09MdD1nnQdzRXBwKRJwR9EgiEydd+OhGcEyesFyKHgmxPq
	GO/iJBTm9zmEWsmUjUOUkookaRH0AgAElkxtwBQ4+Cvs0XywdIUxqEICL+VaU/MUYXtWJPAy61eGu
	h4un4gztQPHLqSvDqyt5d8I8VAjF5Rq+/NXclUAhwiQqI02dCbZMRcA2BqtTraR4ZY0laco8IKmDH
	z2KlTmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t0W-0000000A79s-1QLg;
	Sun, 29 Mar 2026 16:29:00 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t0T-0000000A797-1FAS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:28:58 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-466f00535cfso2296587b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 09:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801736; cv=none;
        d=google.com; s=arc-20240605;
        b=aWSSha/Gp03K00OONlen8MIdcvpVrsmJh845XlKPTCUHClfgrg2nIUyUxyG0W3s5mP
         jtuitGxux9OPfUZ14sJezo5FM9mdAZP5vNpDfFMS1gVr4TIRThpW4l/8xR7fhMsCeagk
         s92iFtqJ2vIAiPSFgALdFOTwbu3XqsjPlTcNnY+BmeCNiK7s1PbElEh4kmVNXnDWsqWW
         LJxiheBYAceMiBjafTxjcVMxN9/iAZU40/IXstYHfKDPTy7JSX5oBg/xSDT96CJUngZX
         3gSu8MDsV9vyIkzWjeJOldbk9mglk11s17dYCk5HqyDvTVCN4dmcJFWkBgSC8w1hxVai
         UPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MEoMF+RBv39WsZBwbT0yI7vq+gErMCo84OM5Ru4mKP4=;
        fh=5pzC9sz18mMG3kZ48l3VZQfcK5licMbxjloJ4FDomw0=;
        b=CY3BVeKL5L9/4x4GHOJrHWdtBmaR4VEJEpiD82XmdsjVbs4d4Hd1PB9KyzaKMVXgvM
         MfvRL4m5OyQoNKT+Nuqkg6L1KHNbYUVOkDFqwYcIbegETXEjiBRZo4uiYNzV1K+I7N0Y
         QNFUTqZwkBB2lnaR0uocXZtzbpazHGg6gAxYx1aVpveAIuL7NKteJ8/UN42gfxCR6v21
         iB++EufFFIc19Zaxj83F3zXpQ3r8NB9eSjkPpZY1GIpUVRzQNI8LwEFttiQvHAFgr928
         dX/6ckgq/282cMwC34DdrAzgwn1RU5RQB/Etc1efa24peO6I0a52mxY6B8pSj6Z87UFK
         F37Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801736; x=1775406536; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEoMF+RBv39WsZBwbT0yI7vq+gErMCo84OM5Ru4mKP4=;
        b=hvaykoeHp+kS46060BJafxPu7wpbTBRR1COB+XQRyDlXu+UxL/D9MPPZBvNYToudZn
         b6iEeWuY5lfgQgOW/NPe2jmDExPS8AlWdPxZQ2t9BfxFvwi6Nv/Ji0mVzT8J+r2b9J1k
         WuZo8mX+4hFbLHHCnkFZAsEjsQpRBdkRigd1dP4iLYKuFT205h+7reK7Gg/5eZU0D/QU
         71+MoGsuPTH9NZOCKdwKL71CbPPjXBNFk8QiBBsYCfiyrIyCUEIM489PhYhkXs6EJz6C
         Zi/FsCsET/CiISubAWBMamCVZ14M+MXQ9t2j5EHtY5F9hgVivJMyx65l+HrUtEgInr9l
         NUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801736; x=1775406536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MEoMF+RBv39WsZBwbT0yI7vq+gErMCo84OM5Ru4mKP4=;
        b=PM1gjFp7J94R0V+Z3wV8Dp0RCxYWENa2TzwxOeOAoeN508psBzQkpo6dVzgVn/fpfv
         G+xz4mYurdcI02h6WPp8HCtBUUW9oc2ycXuhmtJIBngwiA3AS93ylKaJplyzDEZXJNSL
         RN1qF0ex/FbUH1Ja0z+VA87i+qy3rogw5naYm+aqZr+1LlmARUgNbT++r6s4hvMIqGE0
         36NSw4nwY2caN1EDOQlRjGF5qFZAMLze5Gi7vVm7/BYHk5jEiO8F7WFdECUCpvIQLtTc
         04CB8mwW1ELq54lKRFbCQj24yesXHTcfTZCOb6QGDEnG0Qihe1gZO6K1u5bQbLIyf2oa
         Flbg==
X-Forwarded-Encrypted: i=1; AJvYcCVZW1o0lE8lnjNiMOgaB0dYaNp0IbZfJ5isF+LddwG7xCdojDnMkBuyHHuvuS1wgLexz185IcLutoB1hiRbw0t3@lists.infradead.org
X-Gm-Message-State: AOJu0YxmsRFhLkXJJIgBgDoReyYNibIaOlhYsm10XayEFztBKa/ZI2fT
	WdM91hBlh867X2XrfAHbDV01pLEFt7CHR71MwohAxrWyKT4PSfdbI8xMFOknKRH5XXvic54DAhq
	J6CfcyX7R+3poRgw16wppgfc96RhbU6k=
X-Gm-Gg: ATEYQzy7rq3p3rqb/EUwntgW6WEtpblg58ku2w/KYdPKMrfelmAB8ozzNZCQPzK/Y0d
	Yo4zon3/5A9OmPHE0cSNrcC0noxc2C5LHHTfe+rzTKLmx6PMq9nLk1f3jJduIyq7nGS+3sUlZKa
	8Fr7reTHXIYM3kWGvEVhzGTcihYfLYLYO7fTUkuMxkBCIiE01wNRNG7RV9yqxGtVOyrcz/0OpXA
	JjE3lr9AN2FEPdfXebvf4NDGHphOI3OxxSQ1dhXowlJ4FZl3HVgQgmGkjdIZQvuX1+8UHIuhmnx
	/3n1WSAe
X-Received: by 2002:a05:6808:1787:b0:466:f25d:3289 with SMTP id
 5614622812f47-46a8a59ada9mr4202752b6e.36.1774801736228; Sun, 29 Mar 2026
 09:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260311003744.32099-1-rosenp@gmail.com>
In-Reply-To: <20260311003744.32099-1-rosenp@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:28:44 -0500
X-Gm-Features: AQROBzCwjIyGP-w7kiYReAgguovzguNLv2tsCv9-iol2yPNpc4COdHBUbjt8abo
Message-ID: <CABb+yY3jgD53t2ii_xmPvBG6pu2eX0cFP10sFGRMiqqS-z9zoA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: rockchip: kzalloc + kcalloc to kzalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_092857_345222_88EC665B 
X-CRM114-Status: GOOD (  15.76  )
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

On Tue, Mar 10, 2026 at 7:38=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Use a flexible array member to reduce allocations.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/mailbox/rockchip-mailbox.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchi=
p-mailbox.c
> index 4d966cb2ed03..a1a7dee64356 100644
> --- a/drivers/mailbox/rockchip-mailbox.c
> +++ b/drivers/mailbox/rockchip-mailbox.c
> @@ -46,7 +46,7 @@ struct rockchip_mbox {
>         /* The maximum size of buf for each channel */
>         u32 buf_size;
>
> -       struct rockchip_mbox_chan *chans;
> +       struct rockchip_mbox_chan chans[];
>  };
>
>  static int rockchip_mbox_send_data(struct mbox_chan *chan, void *data)
> @@ -173,15 +173,10 @@ static int rockchip_mbox_probe(struct platform_devi=
ce *pdev)
>
>         drv_data =3D (const struct rockchip_mbox_data *) device_get_match=
_data(&pdev->dev);
>
> -       mb =3D devm_kzalloc(&pdev->dev, sizeof(*mb), GFP_KERNEL);
> +       mb =3D devm_kzalloc(&pdev->dev, struct_size(mb, chans, drv_data->=
num_chans), GFP_KERNEL);
>         if (!mb)
>                 return -ENOMEM;
>
> -       mb->chans =3D devm_kcalloc(&pdev->dev, drv_data->num_chans,
> -                                sizeof(*mb->chans), GFP_KERNEL);
> -       if (!mb->chans)
> -               return -ENOMEM;
> -
>         mb->mbox.chans =3D devm_kcalloc(&pdev->dev, drv_data->num_chans,
>                                       sizeof(*mb->mbox.chans), GFP_KERNEL=
);
>         if (!mb->mbox.chans)
> --
> 2.53.0
>
Applied to mailbox/for-next
Thanks
Jassi

