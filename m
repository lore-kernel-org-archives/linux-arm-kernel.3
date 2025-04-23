Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDD7C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPPQRfeBlp3SWyGU6Y2ZQ8P7vL3m0Qv9EW5gsCWy8+k=; b=fllz659jheTieavxeBjGjJVOJJ
	8VAT0KtnIw9gY0V78ddMgNGsCxfTL30dpo47iedp/fKw3sRK6+bB3nwY+iIzo+oYcKuUYPuBRXSgb
	kTMIihiUDYYORH0wS86DVhnLgvvOI1+gr2FzJXsR85t9AcOOesBBqWKhm/bC2MBHJ7njOpOQmvN/I
	GSa5QBTfSTjlf8WbhT6ixMxw9aGcfzT28hrkaTk0p5aHu7Mz/dhcQWw1sPsaJkcPrgHeeb6zntakE
	LxkiNm1PtsJFqu/TUxoiqtOwl08cnyt7nLpZ6inFJpVjS+BKcM6wYM/cTSiKFoSGMNdzQAutFgTC0
	bUe7vtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7f7r-0000000Bd6n-12dF;
	Wed, 23 Apr 2025 18:47:15 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7doV-0000000BG0d-2zzh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:23:13 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-47691d82bfbso1510231cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745428990; x=1746033790; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPPQRfeBlp3SWyGU6Y2ZQ8P7vL3m0Qv9EW5gsCWy8+k=;
        b=ArBsNR5+iOma9ISLwnixIw+C9pD1eJBZRrwuxNvK+gr53YUsieCN9IvAYnwyHUN4ax
         /zH1wzKoe3EHKPM4M4sFPD/xsDexHHYkrCezAf3jC74rrshN3/b7wlZ7DR2vMgwR7+z/
         PXEAFX1kfz2drZ+ZieSEnijkk3PxtAALDIhowqMwexuageeR3FRPM2U60f6TIhnieNaN
         MTzeoFqxbE8bO4SwfyXhpAbYt2xju5b5adAHZMjouRs+PdH/EKil2M5bCkMuyiKq0CNO
         EmhtBTnP8CiM+fGbzCF7xCByQzffEBUR1dW6yIphLYnd12ezHQJWc8KjJ2FcWlFGiCbQ
         KsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428990; x=1746033790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPPQRfeBlp3SWyGU6Y2ZQ8P7vL3m0Qv9EW5gsCWy8+k=;
        b=OuuY10A9fAiAwwac97tu9EpIrlRSDaTjcm6dT0H3ACGTRH7q/KiAbaPRWhO0L0Sabo
         +uyJegsCpd1ZB2H/ewt8ZtxLQTe8fSq8WDs9irwKHzhh7hgoT11h+kxL3Lt9EAs7POHw
         9fA3G+StKJe+OGhTmeueA9CivtfPJqA2rORqy35goVgWhFNeA3JFeE41Gv6FvkV6a8lK
         xhCKiK4dhxpJ1YMMeLkvmnmucpNy/JIFjBaDSJ2oiSNQWduT03jjmwKa2jKM9yyzk/j3
         QCvzAVkaneobtN6J9nvHKkbJ2DNpr4U+7XlbmAgVTGPhxv5hQ6twdeyC5Gt+xLG3q4jo
         9oSA==
X-Forwarded-Encrypted: i=1; AJvYcCXd4g0KmqqbgQQ8KmPNhrzrn43UQ6KPxJbcrM13vY8iFMrd+GW2wWUE8TNwnnpZNW1HImHpGZzzTJio06e3X9Xp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/WqnqgDNaW9VK6101bT1ndRYbm+glucN6tIu0+jLV2Y+OI1LN
	nnCvJ+Khf8KBlIY3QxdpbHCMSxw9n+mEI58lXFpFJUv4uwL3qGWWqaP+FlqPn0/8TqWBzgCiUKy
	1oyqu8SLkw3HpxMirI/Q9b9JDkZYn6M1n01A=
X-Gm-Gg: ASbGncvO5jbj66ydL+oOTuEtZs8TBHRzxukjvDDQ3LQG+QVyqct6zFhzwmId2WLWk0o
	b5cH2rTReYmqJrYW3Q5m0nu+fbi4/Xzm93vqrdo2Gaqg8joV4A02CMUYLlHhFqX4eCl297OwN3h
	rgV2dyPSRRthKEzWlWsPoJz5XO8ofn0AmhsmBmjm9l8RUrEygFYTg=
X-Google-Smtp-Source: AGHT+IFT7muf/Vxs1o8pCt5PFOY4VsNRFef6m/B+3PW19ED9YKuGbCGJMgFt1ru5tRZSh3iKhw4E+kHLfwSZYxMRLYY=
X-Received: by 2002:ad4:5969:0:b0:6ea:d629:f492 with SMTP id
 6a1803df08f44-6f2c4636224mr288412496d6.29.1745428990103; Wed, 23 Apr 2025
 10:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250415184649.356683-1-yabinc@google.com> <20250415184649.356683-3-yabinc@google.com>
 <20250423093253.GK28953@e132581.arm.com>
In-Reply-To: <20250423093253.GK28953@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Wed, 23 Apr 2025 10:22:58 -0700
X-Gm-Features: ATxdqUF72f6_dDAXXZfAZUH1pqys_MpJEp8XrE7HUAwBMqB2Ct_VO5XimnZtuhk
Message-ID: <CALJ9ZPMSuSCE8RO=7Jh0im5VoYS_rZf4zJji_8k=FR-CfEzN7w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] coresight: core: Disable helpers for devices that
 fail to enable
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_102311_756525_CD1A40BF 
X-CRM114-Status: GOOD (  34.99  )
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

On Wed, Apr 23, 2025 at 2:32=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Apr 15, 2025 at 11:46:49AM -0700, Yabin Cui wrote:
> > When enabling a SINK or LINK type coresight device fails, the
> > associated helpers should be disabled.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-core.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwt=
racing/coresight/coresight-core.c
> > index fb43ef6a3b1f..d9fcea69d221 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *p=
ath, enum cs_mode mode,
> >                        * that need disabling. Disabling the path here
> >                        * would mean we could disrupt an existing sessio=
n.
> >                        */
> > -                     if (ret)
> > +                     if (ret) {
> > +                             coresight_disable_helpers(csdev, path);
>
> I think we can do better for code consolidation - we can use a central
> place for error handling.  I will give details below.
>
> >                               goto out;
> > +                     }
> >                       break;
> >               case CORESIGHT_DEV_TYPE_SOURCE:
> >                       /* sources are enabled from either sysFS or Perf =
*/
> > @@ -497,15 +499,17 @@ int coresight_enable_path(struct coresight_path *=
path, enum cs_mode mode,
> >                       child =3D list_next_entry(nd, link)->csdev;
> >                       ret =3D coresight_enable_link(csdev, parent, chil=
d, source);
> >                       if (ret)
> > -                             goto err;
> > +                             goto err_disable_helpers;
> >                       break;
> >               default:
> > -                     goto err;
> > +                     goto err_disable_helpers;
>
> I know this is not a problem introduced by your patch - for an error
> case, it returns 0.  This will hide unexpected issues.  I would like
> to suggest to return -EINVAL for unknown types.
>
> >               }
> >       }
> >
> >  out:
> >       return ret;
> > +err_disable_helpers:
> > +     coresight_disable_helpers(csdev, path);
> >  err:
> >       coresight_disable_path_from(path, nd);
> >       goto out;
>
> I am just wandering if we can handle errors in a unified way and
> without using goto.  I would change the code as below.
>
> The point is to use a general flow for error handling, include a
> sink error.  For sink error, we still invoke
> coresight_disable_path_from() for an empty operation.
>
> Also, I think we need an additional patch for error handling in
> coresight_enable_helpers(). If any errors are detected while enabling
> a helper, we should disable the helpers that have already been
> enabled.
>
> Please let me know if you have any questions.

I'm fine with these changes. However, there's one spot below that's
controversial in the v2 patch.

>
> Thanks,
> Leo
>
> ---8<---
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtra=
cing/coresight/coresight-core.c
> index fb43ef6a3b1f..cf2a3708a05e 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path=
, enum cs_mode mode,
>                 /* Enable all helpers adjacent to the path first */
>                 ret =3D coresight_enable_helpers(csdev, mode, path);
>                 if (ret)
> -                       goto err;
> +                       goto err_disable_path;
>                 /*
>                  * ETF devices are tricky... They can be a link or a sink=
,
>                  * depending on how they are configured.  If an ETF has b=
een
> @@ -487,7 +487,7 @@ int coresight_enable_path(struct coresight_path *path=
, enum cs_mode mode,
>                          * would mean we could disrupt an existing sessio=
n.
>                          */
>                         if (ret)
> -                               goto out;
> +                               goto err_disable_helpers;

I made a similar change in this area in the v2 patch, which
contradicts the original comment here.
Mike had concerns about it. I explained my reasoning, but haven't
heard back. Could we get confirmation
that it's safe to remove the comment and proceed to err_disable_helpers her=
e?

>                         break;
>                 case CORESIGHT_DEV_TYPE_SOURCE:
>                         /* sources are enabled from either sysFS or Perf =
*/
> @@ -497,18 +497,21 @@ int coresight_enable_path(struct coresight_path *pa=
th, enum cs_mode mode,
>                         child =3D list_next_entry(nd, link)->csdev;
>                         ret =3D coresight_enable_link(csdev, parent, chil=
d, source);
>                         if (ret)
> -                               goto err;
> +                               goto err_disable_helpers;
>                         break;
>                 default:
> -                       goto err;
> +                       ret =3D -EINVAL;
> +                       goto err_disable_helpers;
>                 }
>         }
>
> -out:
> -       return ret;
> -err:
> +       return 0;
> +
> +err_disable_helpers:
> +       coresight_disable_helpers(csdev, path);
> +err_disable_path:
>         coresight_disable_path_from(path, nd);
> -       goto out;
> +       return ret;
>  }
>
> > --
> > 2.49.0.604.gff1f9ca942-goog
> >

