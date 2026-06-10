Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0B5CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 06:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sf27jUZrV/4ePYlo+ltQi/cb6ikm1nezgKuVcZuPbNE=; b=cTz75nkmGJ7iM9MtvOq1OwJ5oX
	CBQxoSWNDK6HwSg+sJh5zJ+KoBVOQTWELvq2K3SUE9wxCfpfLS9o2bAEl2a6ywbMa9MSvcLpDCyPb
	KHpCZnxksABh6AS8FJqE8/rwOpEQ1UC0ttRO22k/AzySGMoYD1tJrHS3ChC+8EQ69EzHXRQ0h+veI
	sT4jKxT3AeK0UJmlWDMS1GCdMLkq6MF+5d39r7bvzW7bClTjQOOCQg+UwsSJsXwxW/TvJhHc7QJ8g
	j7ELVuSpBdpjlCEZcxlo7IGqB8pD1P97mISWza0cJwVBqeEzRujrJETgsP30QvFLgPxlw1qy84S4b
	dhvOwfWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXC5A-00000006r0N-3KVb;
	Wed, 10 Jun 2026 06:06:32 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXC55-00000006qyr-1wN4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 06:06:31 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so11672576a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 23:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781071585; cv=none;
        d=google.com; s=arc-20240605;
        b=Y+/hDsUsWh2nymcicFk/j1AeSM9Nwu/8WinUChETVq3VOH8vAGO0V0ErvfxVz3gRul
         oUAXhVnsoWhhQIUpze/VZaeAItOFLGx0SiaVNMz+Q0eE6LKwo7SwArUOJxwDqbe/CFNm
         Hgp+Ou72HsMHbGwEp43qm6/2ICvJ7ESUEFNmWPxCBz1m95peF/bX6Xmw+n/WGZ78Ieqf
         oA+uSD5VkgX/fMG8v8RpEi9z6uziLOvZRQCpx8ajLn5o+Nr2opdnAHVX5/sJ8VJlg33t
         57l/7H8SQuM0N9bJzhPjo/cHxbv+MrgZL+LXLpQgnrYJhP5S/dd34gIMzH4ouC1QntfV
         oPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sf27jUZrV/4ePYlo+ltQi/cb6ikm1nezgKuVcZuPbNE=;
        fh=PzqCgWqdg7iNLbC01ZYUV1k0ug0ML8eaJe6JSCyqaUY=;
        b=AAADrJSvqzGw9BCFCkrot4EvNLflN4cStUgXSljDj9fnVZAgStvhrxCiwmJdIX+Hij
         Q9bcRhgPex2GvuWyWRXV7OszDpsWtmAFd8LXcNLR9hjaab4Wu9uyr2iGngnJK552rakJ
         RRliieCSETFrO9qzaP6Pa4iLByY7ImMK7s4AubLcXtzwBwA/6Kty3/09KKlv1uxtuyc0
         bNJHFzPHKbHum5NiSUev71T4yWEVQ+BlNRD5x0sgE4e2HHcfu3o/oeg0HqhV//Ycp03h
         XwEv1DAguP9DD55lY2gWcpKVk/y3Z0HscyDrb2ruRfgXpClCilYIILZ2+eDlnAX5ST10
         FPwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781071585; x=1781676385; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf27jUZrV/4ePYlo+ltQi/cb6ikm1nezgKuVcZuPbNE=;
        b=fNZ6BshYUa1fSu2TuwM4Dw/9nBZHWUrsJvFkQNuATVbSvv3fFvpt+13HQmE7Gv2xAs
         oMia0EAvhl0I/KFOxAobzLfM4qImykIoc446UzMCeBHx9f01S1Yv0vkwGshmjIcVrh5i
         co7yW6janorPDEOWN7qCKiPRqXFE2GrQO+S0PSIH2kjuf1NAjozPCUa9UV06N9kSg8kD
         sLurv7brR+wfGbIeUOI6O/w9cVK7L9Y6KOv5tkh7Vc1cZuIhwzmfr4WdhvENazs0FRV9
         MJ5o/oCDpaaXOBeROb+TpqEER4/myqlrssqYWljjGaqTTvUmw5LuuTGbl2H92mSp8dcV
         AZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781071585; x=1781676385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sf27jUZrV/4ePYlo+ltQi/cb6ikm1nezgKuVcZuPbNE=;
        b=k7fmJb6q65XPaAPu0PtT0hmp/PMmGzPwfjtU2yDk4D72biJewRO+7715z1o0cxCN0X
         4LchGYVabC/Nj5YJjHqlLZ9dTe+nHeNmH4Tz59NE3c8U/Q6qnKaUJQiLGLiWSWjxZOO/
         SNuUm+g8IC9fMWnm8HE+iGemEQPwnioA5fFLzmQi3T7qwV+XHcuj70jKDr8Qq7VMm5Bh
         nTqsiWfIiJOmpqk1YIMigLRYtV+PtVYTcJrdWypZ+98gRVng8mjOZgRmtCjUR+yOyUv5
         tJmMZZXVJqREPvg1dhnVEHNdGfg815k8NlNaS7t+sUoj8uQI/o3YByuRkAHDKplEHnF1
         FHMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CIOt4vlSaGyvVpY5oGC0piT7gJA1CqGiKsJvSnCLKUAlcUuVKqKyq7B32KMuWPXD1V2cQNL4gmcUaJC+ektl8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdn+ZzLbVv9+E+5knjoW2W3Jcij57sFN9J7gYdIlapwcIlGMoA
	RV4Rh4/TjOrN7drFTKWeXvkaNrFeLVqhCzuRkxgYm9MJN+A+hqpX+pgbQvLaGYHyvOW2HBi7g73
	y1M2rUsJVTjtYPqIh30U7SjfOPiU/zM8=
X-Gm-Gg: Acq92OE9MBzUN85Q/QiAiMUEoZCWe3Df6ppUkBqCQbush/pffUdM3md0NW6+anPHnHf
	/RJ9HkWg4s3nCSHndw72wDR9C+I6yalloLQYtlplwUzb9uNEoGOblVC9Vegyd3J+vnPaLBg0vux
	JYpYdrxPKgGLFwpRmAyxSzhq7ClE6jmDkq5MiOTEDGd1q8QsyCG31C9RqaNspbpZQelI2XYGspp
	RprF+E3baA6PQVjoPjviruDoA8f74cXwA7j9SS0NGutrxT3hV4HG7GfdxugsWEgo3HGB+BukA4x
	U717il8GB4a9EExJV7ZH+d9jA7IAgjQyHI30B2AALZp9zdl0Ird6ek85RQn6G6qXLXEPHC1mPVz
	GuYyXk/MJFS4mcbN8YvHBbIfvBfOtt86LuCKkby2BAsa5AUiLpP0d7UvIWo0E8ZiqDkzgMcrpwp
	dahjk=
X-Received: by 2002:a05:6402:5216:b0:687:1c98:a19a with SMTP id
 4fb4d7f45d1cf-68fa4f3d294mr12615404a12.13.1781071585304; Tue, 09 Jun 2026
 23:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260609223717.41670-1-rosenp@gmail.com> <20260609223717.41670-2-rosenp@gmail.com>
 <aii6RX0321fJV99W@SMW015318>
In-Reply-To: <aii6RX0321fJV99W@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 9 Jun 2026 23:06:13 -0700
X-Gm-Features: AVVi8CdoKJGr2CY6Ts2b1YU7fzVQIRGuXCKSNkOV6YDrgIls9cvowFQd_CqCISg
Message-ID: <CAKxU2N_KcPHAAd=JO6CQuJMqs3PsQd9HBtdW=KbLGOKbfB4H1Q@mail.gmail.com>
Subject: Re: [PATCHv2 1/4] serial: mxs-auart: fix cast type for of_device_get_match_data
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-serial@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_230627_521249_B90707D0 
X-CRM114-Status: GOOD (  20.64  )
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

On Tue, Jun 9, 2026 at 6:13=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> On Tue, Jun 09, 2026 at 03:37:14PM -0700, Rosen Penev wrote:
> > of_device_get_match_data returns const void*. Cast to unsigned long to
> > avoid implicit integer truncation warnings. All the data parameters are
> > correct anyway.
>
> It is not worth to fix it by this ways. cast void * to int/long is not go=
od
> at all.
It's just a compilation fix. The same solution is used in many other places=
.
>
> struct drvdata
> {
>         enum mxs_auart_type type;
> }
>
> static const struct drvata chip_imx28;
>
> &chip_imx28 as drv data.
That's a lot of work just to avoid a cast.
>
> Frank
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/tty/serial/mxs-auart.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-au=
art.c
> > index 697318dbb146..de97c0f74e7d 100644
> > --- a/drivers/tty/serial/mxs-auart.c
> > +++ b/drivers/tty/serial/mxs-auart.c
> > @@ -1598,7 +1598,7 @@ static int mxs_auart_probe(struct platform_device=
 *pdev)
> >               return -EINVAL;
> >       }
> >
> > -     s->devtype =3D (enum mxs_auart_type)of_device_get_match_data(&pde=
v->dev);
> > +     s->devtype =3D (unsigned long)of_device_get_match_data(&pdev->dev=
);
> >
> >       ret =3D mxs_get_clks(s, pdev);
> >       if (ret)
> > --
> > 2.54.0
> >
> >

