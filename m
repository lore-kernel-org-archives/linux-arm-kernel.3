Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C28CC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HMguzqC9j9EV0of1YoNXfPm1mjs9rcmoyuc3Vef0Cg=; b=TxnxGcC1svIKsYRuxBBMlZBp+2
	BrTBVHzZqDXGJyRaYQqflfBUDJcFAOBbEA8DoA5flmw+xlX6J/VaA1/8BVu5POmi96EssuUkHUinA
	nKAcKH+RV8/Z6LuEX0sMHmTCG7zBY9oNu2qQc3QXDJEtlIMZSkQmuDCnRAiebMdcsd487L335n9CQ
	u1TUIFeELUakh1yqSX+9bsSqJCllL2gJ5K9ePtsQ3KQHdG/CA8CY0Bt7v0gG8PlJeNl+Zyz95PcSt
	2rzSDehcdrOj0Dlgisb9DP47oLuEuEm6cG6hZuuI1FtiCaoK/UVFxl1wrphlX9CXEVcxIViWKCOm7
	o1JdlhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyWM-00000006JSB-1T3C;
	Wed, 02 Apr 2025 13:52:46 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyUF-00000006Izt-2psd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 13:50:36 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-739525d4e12so141607b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 06:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743601835; x=1744206635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HMguzqC9j9EV0of1YoNXfPm1mjs9rcmoyuc3Vef0Cg=;
        b=bynArFFsC4upJcnyUukFmazZ76eFz7oH6pjBujkl7rMxh8XlwLz9ISv/rgGT1Vy6me
         ZypqD0NXASEFZ7lNSB9rszS51Uu4vaHhVCXcTtVYvmRfINB2rKUT7VoPW/sITcy0bcCn
         5ab6ip+uOhPLVHcFFx+nZ3QZm9tFYKDvc6TrjnWzLegqW+Kr4ozcJsLGmgUW2NnStkDj
         4z/1E++YO5Zk2QzeenlpT1+zUmyIbdtBjFvhnyO1VqAAuns8I0phdjd8XqM9e92HSnPn
         M+O08nfPpwm95gMQsgMcikLaf+MtKyqwV5AWqcYZsiTfZ/TuU3lfjfgBgYJ/zkWxb35A
         rElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743601835; x=1744206635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HMguzqC9j9EV0of1YoNXfPm1mjs9rcmoyuc3Vef0Cg=;
        b=dmG2juHn6MxitnvqCFsm+MNX/xTyRmJwFm+9MGlx70UxkSVNFSovU+nN340ubKUd87
         0rwpddvkHQt4ChSNWVb2Rb+6GA2QZkJyVC/MHGtXTlR5ltbUSoyw3H5Ck6Bax+Fg3NiH
         NtWZMfe7jAGyqqwsr5QzMKpb8wdv5vRtJ2TcL43pkSW0npqZJMC4cQUtwqNEXFNz8huw
         gfvQBm+o9hCcUy7/+kJMuVvwXS44k6EVeLCrmbXmKpxrTCOXopidh+J/39K2Y9XGFRwW
         2yYEi3CU4f/400/bRU48qh3OwuR7OKerxsXuOvaBH98PmmiBv1P0Q80VLSSDmtZs/H6X
         0Dfw==
X-Forwarded-Encrypted: i=1; AJvYcCVqqU7bC9W/0KzXBfDtY01vnG5NdAqEZyu9RJGZiU7+eDq3w1jfCLbvvWlnWyQ+CIQDoe9dFTdAV2lRxy9xJDi2@lists.infradead.org
X-Gm-Message-State: AOJu0Yykem8uOem6Wui+krWnZBWBWwJgNeGj2/t0nRXeADr878XGK7R4
	SPvK55jykouTgh+4fZqYHG4Mbgo28wYLd5XMkIGZEA7TMLbnuz8vUN4sdw/7lRIrAJfZYJAHmp+
	DQ44yLIiI7KG7RbGXQE7lyWkabom8yTb22tYsYw==
X-Gm-Gg: ASbGnctCN0cLhd+jJLmRHK+wBeFwCUeIU0TSAwmQ8Tr/G0xS04OS09w+1S/JGjoSZ0P
	81tZ+en2bND2s3rVOKqPzu9mzl+n5ALkvcFKbeeawqKjPNhAgK58/M7lRyjjw4BwP06+Qd3KAQr
	7rpk0EWCNRY2g8s9JQiMyYqYdS52k=
X-Google-Smtp-Source: AGHT+IHp7t8r2pydSNbANhxJKeymRIZ/eKV+x2OT6vup6idos5f2KZpXXuu/OXbiS7W8QYIoIkAWymldruKbA3f2VXo=
X-Received: by 2002:a05:6a00:1942:b0:736:a82a:58ad with SMTP id
 d2e1a72fcca58-739b60fb517mr8295648b3a.15.1743601834707; Wed, 02 Apr 2025
 06:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-4-yabinc@google.com>
 <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com> <20250402133232.GJ115840@e132581.arm.com>
In-Reply-To: <20250402133232.GJ115840@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 14:50:22 +0100
X-Gm-Features: AQ5f1Jq5mPtgzeoLUURAuYqDE_iAPk5v6h-VWiYx7OA5tNNn0TL6E8vkrRSIDow
Message-ID: <CAJ9a7Vg4DGzPhnSBh2taTgUTORMY3GUPpJY2bHjkMdFB1=wP=Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
To: Leo Yan <leo.yan@arm.com>
Cc: Yabin Cui <yabinc@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_065035_717934_793D8A4E 
X-CRM114-Status: GOOD (  30.27  )
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

Hi,

On Wed, 2 Apr 2025 at 14:32, Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Apr 01, 2025 at 06:22:46PM -0700, Yabin Cui wrote:
> > On Tue, Apr 1, 2025 at 6:19=E2=80=AFPM Yabin Cui <yabinc@google.com> wr=
ote:
> > >
> > > When enabling a SINK or LINK type coresight device fails, the
> > > associated helpers should be disabled.
> > >
> > > Signed-off-by: Yabin Cui <yabinc@google.com>
> > > Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > ---
> > >  drivers/hwtracing/coresight/coresight-core.c | 12 ++++--------
> > >  1 file changed, 4 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/h=
wtracing/coresight/coresight-core.c
> > > index fb43ef6a3b1f..e3270d9b46c9 100644
> > > --- a/drivers/hwtracing/coresight/coresight-core.c
> > > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > > @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *=
path, enum cs_mode mode,
> > >                 /* Enable all helpers adjacent to the path first */
> > >                 ret =3D coresight_enable_helpers(csdev, mode, path);
> > >                 if (ret)
> > > -                       goto err;
> > > +                       goto err_helper;
> > >                 /*
> > >                  * ETF devices are tricky... They can be a link or a =
sink,
> > >                  * depending on how they are configured.  If an ETF h=
as been
> > > @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path =
*path, enum cs_mode mode,
> > >                 switch (type) {
> > >                 case CORESIGHT_DEV_TYPE_SINK:
> > >                         ret =3D coresight_enable_sink(csdev, mode, si=
nk_data);
> > > -                       /*
> > > -                        * Sink is the first component turned on. If =
we
> > > -                        * failed to enable the sink, there are no co=
mponents
> > > -                        * that need disabling. Disabling the path he=
re
> > > -                        * would mean we could disrupt an existing se=
ssion.
> > > -                        */
> > >                         if (ret)
> > > -                               goto out;
> > > +                               goto err;

Going to err here is wrong. The comment above specifically states that
we do _not_ want to disable the path, yet the new code flow disables
helpers. then falls through to coresight_disable_path_from() - which
the original code avoided and which also disables helpers a second
time.

Please rework to get the correct program flow.

> > >                         break;
> > >                 case CORESIGHT_DEV_TYPE_SOURCE:
> > >                         /* sources are enabled from either sysFS or P=
erf */
> > > @@ -507,6 +501,8 @@ int coresight_enable_path(struct coresight_path *=
path, enum cs_mode mode,
> > >  out:
> > >         return ret;
> > >  err:
> > > +       coresight_disable_helpers(csdev);

Drop this - put it where it is needed  in the flow

Regards

Mike


>
> Given it is unconditionally to enable helpers, I would suggest we
> disable helper unconditionally.  Thus, we don't need to add a new
> 'err_helper' tag, simply reuse the 'err' tag would be fine.
>
> I would like to know if mainatiners have different opinions.
>
> Thanks,
> Leo
>
> > > +err_helper:
> > >         coresight_disable_path_from(path, nd);
> > >         goto out;
> > >  }
> > > --
> > > 2.49.0.472.ge94155a9ec-goog
> > >

coresight_disable_path_from() also disables helpers.

--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

