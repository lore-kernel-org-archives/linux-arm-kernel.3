Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B818CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TblJnP0G9WT88M2TZcj3zg5YJeY+7C7HhDuNxDIznE=; b=Z1fjh0XdLBlHeUZmZF6J8YZkw/
	sdiywCflMoaSZsRciyU4grK2aBi0SE8Td3XQCWBIvVYkhZiBZUK4GJ4bVGZEdRDm1GsUmRKS32drg
	o0MGD2iwyXSotzcP1KwJtbBSxZlKkOG+03bKLV2im4E9vcupJuxiDmZqV0erUsACF2qCGZH8YlxKd
	85T9TDQu19QNvm3WmwujIZOFhkF9TaVBH5xntNgfv3UlTGbLgETMG7uxJ+Zav6EcPvFFwGnLC882q
	1EljMukmNNJENVNfj0giSbdJ2EiDl7+tjhwMkveK/b7nhoy3jdswJx5TleekA6aXhuaBmCKqvtDA+
	6xacAxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QDf-00000000sdL-048E;
	Fri, 25 Apr 2025 21:04:23 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QBm-00000000sMV-0Yp2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:02:27 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so35667206d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 14:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745614944; x=1746219744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TblJnP0G9WT88M2TZcj3zg5YJeY+7C7HhDuNxDIznE=;
        b=sMcRmfaMPjH6zaEx1c9H99F8QaNZJ+f6jfnJx/HUbluoy3IVUaClAegxLBwzwZ/ova
         hpoPJdDNUMWLByT2M43swCoSO9z82FmKKKmrze1Q8zpd1r1bjPwyAJorY7psv6CZJkTH
         mZtkd0BdguNetgyu0M8yRLEJlrSfYb7zt3c/p3q99a+QvJsMgitGfRI01WSBwxLkVqbf
         Qg87pfnTiLJUvy7wgcnkpNrkxYaTR510QTDhTBhp8ZBz0dAgfYLEKqcpDbJtdU1l3qmj
         nuTv2j7hjIdmkaESi2xuoj9Q1lDIBqM3mDzSNoG0xIFR0u9xNwHO7OjMBgYDBkR/AMSf
         ZjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614944; x=1746219744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TblJnP0G9WT88M2TZcj3zg5YJeY+7C7HhDuNxDIznE=;
        b=kq6blYVYOAMCB7athHA7fgelWwmhnsH7lv+MrDFD17elOqKZ1NVHXhEQFeP9q5dSmF
         LF5IAlqY6Kbzv4LJa4fM3CMP/wahMSW2+eakp6V9s07xlnQw8K/DfXIrsHXf7LhOPvjX
         flLyh1UH0ayLR0d+ZDSdjQH/KSanocFC6Qo9CLVCt4pd68smLUAVK+6sr9C0zItRj7EW
         PgI9V9mqNBiIZtlYfSizgW6oLdAoVcnhMZl6bEAJTCXVFoAVGM8R7poShnVPGU68isBN
         zXNJNaCZHZgWlJ54GOlMsCts3bwUEnh/u5VzzghT5wL5fTiETZ8bPz23+8aCr8LKlzyy
         ezoA==
X-Forwarded-Encrypted: i=1; AJvYcCVXoZkXj1AzMa71S/9aGZ6iIsuf/eOj/KxPFfOAH/N6cBofIofbZcCM0ZuZMrmnOve//alZaFKwbulvoLpfVVZO@lists.infradead.org
X-Gm-Message-State: AOJu0YyOGG31N/Fh+KUyDKJ8PzKCf1L1zlcOeIO6N+LCWdfPJjh4bOlj
	p0Tw/zx30Fyt8ub5XKJFVSyhx0KUOgrUtJEU5oFT2npFCLiaHevfaX1Bmu64Bu5gDt5Hi7xkNBo
	/5LMuMliX176r6/BIXjGf/Ci+tBDhL1KkuB8=
X-Gm-Gg: ASbGncsU1d5pAobOa1mZi+q1kxWo+BYeifctr9V9tFbrqjLBLpvDgaSEfIA7u7aTYH+
	UrzXIPztWIS8N8OoauSf5ybBo7Ilf4fMgQ1D8C+uMewPjnk42S03irvuqPb+rFnOqfEpeM+wku8
	p+FL0OHg==
X-Google-Smtp-Source: AGHT+IHkfUlwUem4PfnopT+6TlRr3jMpAyAEE+AOQNIQWcfuRd3shIIoUe9Vc6WoUsRXgu3w115ogjdW1I4zauvHggE=
X-Received: by 2002:ad4:5c6e:0:b0:6e4:4adb:8c29 with SMTP id
 6a1803df08f44-6f4c11cfccamr135354956d6.12.1745614941905; Fri, 25 Apr 2025
 14:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250408195922.770377-1-yabinc@google.com> <20250408195922.770377-3-yabinc@google.com>
 <358f4a8c-29ad-4e5e-91b9-063f06e769ec@linaro.org> <CAJ9a7VigiBrcenP9w84KS21iE8gnB7bGC9Q6ZFF33ZHveu9SEg@mail.gmail.com>
In-Reply-To: <CAJ9a7VigiBrcenP9w84KS21iE8gnB7bGC9Q6ZFF33ZHveu9SEg@mail.gmail.com>
From: Yabin Cui <yabinc@google.com>
Date: Fri, 25 Apr 2025 14:02:10 -0700
X-Gm-Features: ATxdqUHAWEV7N_YSxfaedx7b1DR8Tf9gK0wjsx7y8UL4mHWQiNO2xurmvYk0Xu8
Message-ID: <CALJ9ZPPdqrAJkV7CHJBLGKoqQm5hmR7s_4_qRJ=gWyTvxJtL-g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] coresight: core: Disable helpers for devices that
 fail to enable
To: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@linaro.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_140226_170305_9D4DFBE4 
X-CRM114-Status: GOOD (  25.93  )
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

On Fri, Apr 25, 2025 at 8:25=E2=80=AFAM Mike Leach <mike.leach@linaro.org> =
wrote:
>
> On Tue, 15 Apr 2025 at 14:51, James Clark <james.clark@linaro.org> wrote:
> >
> >
> >
> > On 08/04/2025 8:59 pm, Yabin Cui wrote:
> > > When enabling a SINK or LINK type coresight device fails, the
> > > associated helpers should be disabled.
> > >
> > > Signed-off-by: Yabin Cui <yabinc@google.com>
> > > Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > ---
> > >   drivers/hwtracing/coresight/coresight-core.c | 9 +++++++--
> > >   1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/h=
wtracing/coresight/coresight-core.c
> > > index fb43ef6a3b1f..a56ba9087538 100644
> > > --- a/drivers/hwtracing/coresight/coresight-core.c
> > > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > > @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path =
*path, enum cs_mode mode,
> > >                        * that need disabling. Disabling the path here
> > >                        * would mean we could disrupt an existing sess=
ion.
> > >                        */
> > > -                     if (ret)
> > > +                     if (ret) {
> > > +                             coresight_disable_helpers(csdev);
> >
> > Hi Yabin,
> >
> > Unfortunately coresight_disable_helpers() takes a path pointer now so
> > this needs to be updated.
> >
> > I tested with that change made and it works ok.
> >
> > >                               goto out;
> > > +                     }
> > >                       break;
> > >               case CORESIGHT_DEV_TYPE_SOURCE:
> > >                       /* sources are enabled from either sysFS or Per=
f */
> > > @@ -496,10 +498,13 @@ int coresight_enable_path(struct coresight_path=
 *path, enum cs_mode mode,
> > >                       parent =3D list_prev_entry(nd, link)->csdev;
> > >                       child =3D list_next_entry(nd, link)->csdev;
> > >                       ret =3D coresight_enable_link(csdev, parent, ch=
ild, source);
> > > -                     if (ret)
> > > +                     if (ret) {
> > > +                             coresight_disable_helpers(csdev);
> > >                               goto err;
> > > +                     }
> > >                       break;
> > >               default:
> > > +                     coresight_disable_helpers(csdev);
> >
> > Minor nit, you could collapse these last two into "goto
> > err_disable_helpers" and add another label before err: that disables
> > helpers before falling through to err:.
> >
> > Other than that:
> >
> > Reviewed-by: James Clark <james.clark@linaro.org>
> >
> > >                       goto err;
> > >               }
> > >       }
> >
>
> Subject to James' comments -
>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>

Hi Mike, I have uploaded the v4 patch as suggested by James, in
"[PATCH v4 2/2] coresight: core: Disable helpers for devices that fail
to enable".
Could you help review the v4 patch? In that patch, Leo suggested consolidat=
ing
error handling. But you expressed concern about it when reviewing the v2 pa=
tch.


>
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

