Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39541C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 18:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zg2Jb4mjM9lxnbHI+cU1WU+MRHlFBAFnzMfMXnUTkU=; b=QLFaf2Dd9MClqZBs0qq7+oybYH
	k7PvLOgyvO0ZlG5SM/jIwJwRDNBWpO4R+al3HjRK0UllvxoIYgNL5gzIBr/yJEG1Gt87hacWT0EEI
	4y6h0En543U295y4Y7jnr7Opceo95NWRUxzPmle2oDZ2IuEYDaX/Ny3zTVyCNVrZumkGF6k8oL9ut
	laZR1Cx5yFuMiqzmagkI9KpRjBqpNNXhaVtKexSdsRJ8V/tugLeF7W4UEQdYqIrLzgAiHXQKNjs3K
	iMVG9fWYcXp7wAufge3wSr116ofxtnhnQqyq2aqx8DAUd1iVydMsd6P/n4RkXxAfSXE0/H8bOAZO9
	j95lKDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PL5-00000009ZUj-1mFS;
	Thu, 03 Apr 2025 18:30:55 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PJH-00000009ZGD-2eWa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 18:29:04 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6e41e17645dso13620976d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743704942; x=1744309742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zg2Jb4mjM9lxnbHI+cU1WU+MRHlFBAFnzMfMXnUTkU=;
        b=pyAWHTCrXQz0JN9tDp3sOCmeiy77Y6OgTx0tlGcJKkB/3qGr5kDLfv9gMB8DGkXgBx
         QD9UPyRwuqqfFPQfndlH7dAbCwMxhC2ImsJWbkbRilDEb5L/Iq/yCyO/pFuHg62xUAso
         buS9J6+uPsC0A87LDzHcWtOhGgRlM509Nx9882/kiR35RkW4SgMUwRxjB1oIcxmKGRuX
         dq0EMv/bqNtok4kTOFLICa8e5fRqIbd97bzcoZHAEcu9bzpXVikDXzrYva3JdpruQI0V
         2Gwrlfl7CgXKaa1hVoF65Yr1tjOcPHKG2obO9Lz8wSKBo+R2L+WCTE5WG7iEmzUCYF0+
         iTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743704942; x=1744309742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zg2Jb4mjM9lxnbHI+cU1WU+MRHlFBAFnzMfMXnUTkU=;
        b=L6HeT9vwkV4ATfJXldaRdJdLjOOcfqiYbXLeZd7skN+w9/gxdB7pAGPk6NRET5uUS4
         0ukUrPdZaQ2/hneUR9yH9IpFrGQNq6EZ90NqptAWVEuleq9FcKJcl6DEMEDLFkyBSs1Q
         UPyQeWJp89MNbmjL2RaOJqxF9vDMQng9GDVPbXMx6drh3D5rULlyNkQ6dF0hlc+L+iKL
         8mlyWQv2rbU+ZQ0sYN1KXCwhPouqcJkxiHtvX0syXA/wfzdEoMWe3qUw5HYwPtSu+Sih
         gFDQvtwiZHPU+cdmhuj/E53CWYran8DFdomWEvA6f0Jj6IVFxxdFlk7z2B7ySm2c2KeB
         MRIA==
X-Forwarded-Encrypted: i=1; AJvYcCXLgk0o25LxXOd8ZGsmgcaI+cHgTCqXrJdn7VNq4qV85TqQcjHCRtC3Jj+zkKD0Cp+YxxO9/xafp41ZhvdlsXtv@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt0tumojvpMdTyhwF3y6Jg8z0M7n3hy1do4p4VC6SFOda2z56+
	aNALhYkXPUr20MmuaK+r7fm0Q5WodMX8ol/KfsCXudgIiz/wqPOZuXx6Gzt03Mu6d8Vg6jPtNjc
	/MsFr2xofAKNUNMptrE/jL32Kp+p/R0ny8Rc=
X-Gm-Gg: ASbGncvn94gxmIdy/mUGJgAasKu2DtjQJH86KNCbywiEJ5y5dpIUYBb6cOT0DHtPvbE
	Hj2ZJeTglJLRd5ZDiRJkIWzIlVBaw9y8H3sX6BmWCXRPjAVYlpTeLYc/Ny4KrjoHOGFFdxN77Dw
	RiKIJoI2H6ZI+JAFevwsZ3Rdn4cA==
X-Google-Smtp-Source: AGHT+IHsibaa4RBPidnYIYAXhq2+2y4kSK/GuwupDt9JKxbRj5XdTvcv2hG1Fb0FypiFjK2ju0hsk4B5/tpdpR109po=
X-Received: by 2002:a05:6214:246f:b0:6ea:d393:962c with SMTP id
 6a1803df08f44-6f01e794d79mr2777326d6.30.1743704942094; Thu, 03 Apr 2025
 11:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-4-yabinc@google.com>
 <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>
 <20250402133232.GJ115840@e132581.arm.com> <CAJ9a7Vg4DGzPhnSBh2taTgUTORMY3GUPpJY2bHjkMdFB1=wP=Q@mail.gmail.com>
 <20250402141228.GL115840@e132581.arm.com> <98c1acbc-7e14-4aa1-9c1e-831be9eb4c91@quicinc.com>
In-Reply-To: <98c1acbc-7e14-4aa1-9c1e-831be9eb4c91@quicinc.com>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 3 Apr 2025 11:28:50 -0700
X-Gm-Features: ATxdqUGtjMjAOmTTi5Zmw5NW02fAgATBKw2AhJ4_RGVkvEkMpKCR__WmcLX3QyY
Message-ID: <CALJ9ZPM0wudVk9nVXgTH0kPyzJ0UXbRzVggWwkG3yvyyNoCERQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_112903_677939_2B5911FE 
X-CRM114-Status: GOOD (  36.19  )
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

On Wed, Apr 2, 2025 at 5:54=E2=80=AFPM Jie Gan <quic_jiegan@quicinc.com> wr=
ote:
>
>
>
> On 4/2/2025 10:12 PM, Leo Yan wrote:
> > On Wed, Apr 02, 2025 at 02:50:22PM +0100, Mike Leach wrote:
> >
> > [...]
> >
> >>>>> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path=
 *path, enum cs_mode mode,
> >>>>>                  /* Enable all helpers adjacent to the path first *=
/
> >>>>>                  ret =3D coresight_enable_helpers(csdev, mode, path=
);
> >>>>>                  if (ret)
> >>>>> -                       goto err;
> >>>>> +                       goto err_helper;
> >>>>>                  /*
> >>>>>                   * ETF devices are tricky... They can be a link or=
 a sink,
> >>>>>                   * depending on how they are configured.  If an ET=
F has been
> >>>>> @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_pat=
h *path, enum cs_mode mode,
> >>>>>                  switch (type) {
> >>>>>                  case CORESIGHT_DEV_TYPE_SINK:
> >>>>>                          ret =3D coresight_enable_sink(csdev, mode,=
 sink_data);
> >>>>> -                       /*
> >>>>> -                        * Sink is the first component turned on. I=
f we
> >>>>> -                        * failed to enable the sink, there are no =
components
> >>>>> -                        * that need disabling. Disabling the path =
here
> >>>>> -                        * would mean we could disrupt an existing =
session.
> >>>>> -                        */
> >>>>>                          if (ret)
> >>>>> -                               goto out;
> >>>>> +                               goto err;
> >>
> >> Going to err here is wrong. The comment above specifically states that
> >> we do _not_ want to disable the path, yet the new code flow disables
> >> helpers.
> >
> > Okay, now I understand here avoids to disable source and links for a
> > sink error.
> >
> >> then falls through to coresight_disable_path_from() - which
> >> the original code avoided and which also disables helpers a second
> >> time.
> >
> > Seems to me, the conclusion for "disables helpers a second time" is
> > incorrect.
> >
> > I checked the coresight_disable_path_from() function, when the current
> > 'nd' is passed to it, it will iterate from the _next_ node after 'nd'.
> >
> >     /* Here 'nd' will be skipped and start from the next node */
> >     list_for_each_entry_continue(nd, &path->path_list, link) {
> >         ...
> >
> >         coresight_disable_helpers(csdev, path);
> >     }
> >
> > This means the _current_ coresight device (here is sink device) will
> > not disable its helpers.  Could you confirm for this?

Yes, without this patch:
If the current coresight device fails to enable, the code calls
coresight_disable_path_from() to disable devices and helpers after this
device. But it doesn't disable helpers for the current device.

With this patch:
1) When the helpers of the current device fails to enable, call
   coresight_disable_path_from() to disable following devices along the
   path.
2) When the current device fails to enable, first disable the helpers for
  the current devices, then call coresight_disable_path_from() to disable
  following devices and helpers.

Regarding the comment about not calling coresight_disable_path_from()
if a sink device fails to enable, I feel that's a case of it not being
necessary,
rather than something that causes logic error. So this patch calls it to av=
oid
duplicating coresight_disable_helpers(). If my understanding is wrong, I am
happy to change to duplicate coresight_disable_helpers() (in three places).

>
> It seems there is an exception that the helper devices connected to the
> sink? The sink device may not the first the device to be enabled in the
> path if the sink device has a helper device.
>
> So I think we should add following logic before return?
>
>                  switch (type) {
>                  case CORESIGHT_DEV_TYPE_SINK:
>                          ret =3D coresight_enable_sink(csdev, mode,
> sink_data);
>                          /*
>                           * Sink is the first component turned on. If we
>                           * failed to enable the sink, there are no
> components
>                           * that need disabling. Disabling the path here
>                           * would mean we could disrupt an existing sessi=
on.
>                           */
>                          if (ret) {
>                                 /* disable the helpers which connected to=
 sink */
>                                 coresight_disable_helpers(csdev, path);
>                                  goto out;
>                         }
>                          break;

This is the change I initially considered. But there are two other cases
(case CORESIGHT_DEV_TYPE_LINK and case default) that may need
to call coresight_disable_helpers() before returning an error.

>
>
> Thanks,
> Jie
>
> >
> > Thanks,
> > Leo
> >
>

