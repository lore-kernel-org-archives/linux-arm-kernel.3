Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA612C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wz2Pp4NKveXDGybOZvUBUVWwEBJwIqad3g3WPhZc9y0=; b=FAkIPjjunJKIAuKi6hgURj9vbq
	pLofOHQ1+zyX5WkhFav3aCf9bkcoLOZR5k6AHhpYP9inkCwQKGdhvbXiCAMbkpOwEvyHgOjdb8tRA
	+06bDz9xBCX91l8ie8LZChB08uI/9URcJH0IKspJAGSMKVUshVNeeKqCg+FyS/ZxlvTiMW6tE2a0G
	BXgZFU216EXVL5QUVy73fWiEnAGSu1S6nRA6gb+rjyhEIv3D1Q2xrFpJyGq6r/Xs0vNmV9Fb2ShLn
	HR10aPeQ3iKHZK0p36xIiEjidqUkD3GRP8eT5E6E8nRa9RVPPvFKtdUtC2qZo8KH60X52tOIkXu9X
	zJqGLOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VJE-00000009gfN-0Jnk;
	Wed, 23 Apr 2025 08:18:20 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UZn-00000009Wl4-1Rrv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:31:24 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-700b17551cdso46879257b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393482; x=1745998282; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wz2Pp4NKveXDGybOZvUBUVWwEBJwIqad3g3WPhZc9y0=;
        b=BX/RiswUpTIuER5uWnpYwvIzLrNGN62BXkaRTqgHF+Mvahcch+EtPW+CTRcFSmqgBI
         fXtzIEKz4QeXE9MSurjA6ko7dLfYUh1WhMcXjpQOFTaTOnyHq0WqKGbAqvH6QegfQnFv
         u6JAS9i5n4o7oQuYlcP1K5Obr7jDoGVVTYSwxspiHQqVKupNEiMZ0cPQKr/o2lWDGVaX
         9t+7aMdRNYvV4ffsBwOgYpDIrHd5qtR6i0DHFztVZP+nxJs8HRGvCJgqVCNLWVozeg08
         gEWnK1HMbI5tOgyO5b/hGS2iPLOGjUff7/KggsxsLaQNR9xWrwRJmrvykwkm7moq25Qf
         rhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393482; x=1745998282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wz2Pp4NKveXDGybOZvUBUVWwEBJwIqad3g3WPhZc9y0=;
        b=X7oJCD24APr1T5WMC7neir0DJOaYHkYmgblyk5Sok4FchNp6LPx0IL9+yTontwTk50
         DVc32LQO6A8DGj1Ide7soNfl7Jjfm+HefgCmVbhrYnkJpRBD+npoL3M1MptzlhHT2+pl
         SqLT2nk3Bbzn0icsQK+cP87ILgQxIxcWokm8SbBfRTP7dzT8Z226GZ7ItvLueHW22EsP
         wg8K5WLuesVQKPPjC4/k58x+hxMaL7mAtcaX6tM18WKZZ1dBwsHziRTx9oDOoYU/gmRU
         3JZMIBeRQlqVAiU2ksDS5FrXlKTHeUBj3y/YflVJ3KUvJugzHaqwViV/g7vH/LEjNJg4
         klaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFGB5D2Rq2J5xufFEEG1AOzag6j2q4cwzXUZ2zbVFqb+p9Ap+TL6YIzImVn9VtQauJFenKxGHqtLn0vd05MV8H@lists.infradead.org
X-Gm-Message-State: AOJu0YyV3/a/Hz3EWEyT8uC8nUD6XxJKzWBFV+SxFoR/ZVnc07Y64HgC
	5EWjJcMV4H0MFZ8PwZQvuIGSDc5krGF3MgrYLHvx1eCO86r7JZQMvu2fW8iNaVlxoRbF7cyUdX8
	lFB5U3Bz3T7XIXLsWnJ+j8mfQNlW+Qqb46OYPWw==
X-Gm-Gg: ASbGnctfOiLsHhVyxl7dq3UQRxxzFUKuNeJy6/sxsJ6UOhmE9I4AzkAgderQJdwfzav
	FB1OOOrhHaPmeYYQufdRW4jsnHuAaAWkClVGFg5vYkQnILYHMNN9MtSdHOzvLNoUexneonRFRyy
	5G+yZPGETVgurUQ6p7K6qA6Q==
X-Google-Smtp-Source: AGHT+IE+vAxAxZJmVGsaCnTFHZjG8MA1QnR3dHhv/DlYpHbMQAbbJHrQ+/iv4PqqOdBAor/gFff+5XP0bi9r4uUyOEw=
X-Received: by 2002:a05:690c:905:b0:6fd:4485:9255 with SMTP id
 00721157ae682-706cce1025cmr244056317b3.24.1745393481950; Wed, 23 Apr 2025
 00:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-6-ulf.hansson@linaro.org> <CAGETcx9bHGuJ_J6yF14x0NJJXGWgoDn_X_ScBKaGdD4aTBvo5w@mail.gmail.com>
In-Reply-To: <CAGETcx9bHGuJ_J6yF14x0NJJXGWgoDn_X_ScBKaGdD4aTBvo5w@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 23 Apr 2025 09:30:45 +0200
X-Gm-Features: ATxdqUEwA6P7n5uoj4yF10q5muEKuOPxhwor3p-HG94_3W4Rslh-b95bMMDwj7M
Message-ID: <CAPDyKFoBm_MbHzuf9AOLZ+xLDOmscZATiqkOfOmd5igN6WSu8A@mail.gmail.com>
Subject: Re: [PATCH 05/11] pmdomain: core: Use device_set_node() to assign the
 fwnode too
To: Saravana Kannan <saravanak@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_003123_448541_6AFD7213 
X-CRM114-Status: GOOD (  16.84  )
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

On Thu, 17 Apr 2025 at 22:56, Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Apr 17, 2025 at 7:25=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > Rather than just assigning the dev->of_node for the genpd's device, let=
's
> > use device_set_node() to make sure the fwnode gets assigned too. This i=
s
> > needed to allow fw_devlink to work correctly, for example.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/pmdomain/core.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index da51a61a974c..3911d3e96626 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -2627,6 +2627,7 @@ static bool genpd_present(const struct generic_pm=
_domain *genpd)
> >  int of_genpd_add_provider_simple(struct device_node *np,
> >                                  struct generic_pm_domain *genpd)
> >  {
> > +       struct fwnode_handle *fwnode;
> >         int ret;
> >
> >         if (!np || !genpd)
> > @@ -2635,7 +2636,9 @@ int of_genpd_add_provider_simple(struct device_no=
de *np,
> >         if (!genpd_present(genpd))
> >                 return -EINVAL;
> >
> > -       genpd->dev.of_node =3D np;
> > +       fwnode =3D &np->fwnode;
>
> Use of_fwnode_handle() please.

Sure! Thanks for reviewing!

[...]

Kind regards
Uffe

