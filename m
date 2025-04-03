Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A3AC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 18:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTtcXxb4p7VMEp2BDy1np9PTwD2dUqn8F9klggrFWvU=; b=JU8veZ1V3JHSFnU7mEPOTLqfTG
	rOyxpd7cuLZlefAces8Lxnp62cTBlGo+HxILi785clWcRTLEfbqYsPcX1HDWaPy6ogUUObqEIkKHU
	GwUe6/rxVkOFk38sfkLOVcj0lH9KOpx5lvN2smYHOh7ifFYjPpwmQGCXOZ3oZwQiNgaqmvZS/4+PG
	2qqvC89vAN1yCPjld0KIjETeMGxAmYz2ufHMt5T2UCFZjDROX5aDkK5cr8dDzR1Y2nqKaxf34f+Bw
	eNul5Apqu3q2HA8bAVHYzTLT2Z5Dl4I87vZQ9rqyET16ilUeif2wmGkpOkP6YwIU5q94SNWSj1GE1
	Od+eNoeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ouh-00000009WWQ-3sw6;
	Thu, 03 Apr 2025 18:03:39 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ops-00000009VvZ-40zr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 17:58:42 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6e8f254b875so11877546d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743703120; x=1744307920; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTtcXxb4p7VMEp2BDy1np9PTwD2dUqn8F9klggrFWvU=;
        b=WGIGJs53x+1bmMxW3gsqYBj4kuhv18xkUkotKKnapIlcXMYJofOIREhBzBvFUdfqxH
         aQMyriFjdu+fj/kQL3hcoCneqg1ImJsh0vGflnbkwKfMLPbSy2KYuU5CKASmBoeysWWa
         tx+XhTUNTqhxHu5qpvaxV+dCEcZhOsM2/+c3PoBaZ3tgrC8kGLLSMEsLvqQwIZyQKmkC
         kw4ZgQn8cOpLCjWggFkRvg5J7g4/TToObvf9nzEqsQaXpBKtd1H5RxHxOWQ3v1qRd6XC
         yEX+sAujnpCvU2Ex7ypQElaQMUS0n5qlYTLQjqKG4/6RZXp7IXN/YH6t0NPYfx/R28ct
         oDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703120; x=1744307920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTtcXxb4p7VMEp2BDy1np9PTwD2dUqn8F9klggrFWvU=;
        b=sntiJUzfXjt10XimmIOwe/LHLS+L3pNv1HVrHKGu7OyRsXdhkL++bisMRy4ivSiLgP
         G9dpf7eiJANTkyIafMjt7m/70qvTzkFCypcv7DJGeo0HGIv7xljrmOwnHuxOr1rHFutO
         ZV+U73wA/SDy3OkqbxbRivlPKHsryC0sePNVHvR9LxrsHNiAlnolQ51rjCtju4hKtKQA
         Bb2jI9MV17HLjf4i1hreNyr3RH+MxdIujkxexTHTHiVUdv/cbbZEWFKOClrmyeO2fgRv
         406QJeki/8kHe4EXTdTPnFgnmlrsZqVF5ejNyKiLTCzM6aytodJLhaxVO+dEj7RcZtQI
         pp4w==
X-Forwarded-Encrypted: i=1; AJvYcCWceBPGZPaP3WbUqB2+xLLIhvfJKA89RokyqeHJw1kdhIt8YXMN5oTlhxGkGqJw9ursGoXB7ymCXOzxFFmE9nVc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5ziVMuCbGypKBZw5viNvyaye2YRnIgZsHU4B0UrmYmJbPnW7x
	fCVT3FNCwj9NsgHFT2i65B7e6EduccO2Pru4srq2AO031wPFRWRDseYmbR3qK//WB9nZYT/8bb8
	prYvaA6O9CfSE7bWjR7GbyNKXYHH07MZ3zPo=
X-Gm-Gg: ASbGncvmEJ1eRqqTQ1BsDfkZdHAzEs/XuJ5rdFRkvfkO+nkd8b2nkOcIwzlqAGnU94n
	NaQVYOu9peIY8s/W2a7Th6JGiWeoP6NQyCB3FF657nRXt5z1lAs8fhWZAIiJQ9//73s+LZ4OaEU
	lX4WsQHXNZ0dxcuk5UnSEPhEnP2g==
X-Google-Smtp-Source: AGHT+IEIevg4UoRGTbvyOr3Eao4GsML/JhZbbcVtm3uMnzENFqDg+qpmk05qd7SBpBbE6Xh8ZpZL9TyDiOgGPlQ/rnc=
X-Received: by 2002:a05:6214:224b:b0:6e8:fee2:aae7 with SMTP id
 6a1803df08f44-6f01e7a28e9mr2037426d6.39.1743703119539; Thu, 03 Apr 2025
 10:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-3-yabinc@google.com>
 <20250402134716.GK115840@e132581.arm.com>
In-Reply-To: <20250402134716.GK115840@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 3 Apr 2025 10:58:28 -0700
X-Gm-Features: ATxdqUHIAqPYc3Y25BVtrlywrV7mimjAyUqMxC5jp5EtHtHnp9yy0EUaDFps-fo
Message-ID: <CALJ9ZPPp_DhLJcdjxmSTvkEspqYOK0mYkMaBF7ZieArJpWJOnw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] coresight: catu: Prevent concurrent PERF and SYSFS
 mode enablement
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_105841_013903_626511E7 
X-CRM114-Status: GOOD (  29.53  )
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

On Wed, Apr 2, 2025 at 6:47=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Apr 01, 2025 at 06:18:31PM -0700, Yabin Cui wrote:
> > A CATU device can be enabled for either PERF mode or SYSFS mode, but
> > not both simultaneously. Consider the following race condition:
> >
> > CPU 1 enables CATU for PERF mode.
> > CPU 2 enables CATU for SYSFS mode. It only increases refcnt.
> > CPU 2 enables ETR for SYSFS mode.
> > CPU 1 fails to enable ETR for PERF mode.
> >
> > This results in a CATU being enabled in PERF mode and an ETR enabled
> > in SYSFS mode, leading to unknown behavior.
> >
> > To prevent this situation, this patch checks enabled mode of a
> > CATU device before increasing its refcnt.
>
> Yes.  We have also observed the same issue.  I am currently working on
> refactoring the Arm CoreSight locking, my plan is to use coresight_path
> to maintain mode.
>
> Given it is uncommon case to use two modes concurrently in Arm
> CoreSight, I assume this is not an urgent issue.  Could we defer this
> patch?  My understanding is that this issue will be prevented with
> checking the path mode, rather than checking modes in seperate modules.

Sure, I am fine with withdrawing this patch, as there are other plans to ad=
dress
the issue.

>
> To be clear, I am fine with other two patches in the series.
>
> Thanks,
> Leo
>
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > Suggested-by: James Clark <james.clark@linaro.org>
> > Suggested-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-catu.c | 6 +++++-
> >  drivers/hwtracing/coresight/coresight-catu.h | 1 +
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwt=
racing/coresight/coresight-catu.c
> > index b1d490dd7249..0caf3a3e75ce 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.c
> > +++ b/drivers/hwtracing/coresight/coresight-catu.c
> > @@ -466,7 +466,10 @@ static int catu_enable(struct coresight_device *cs=
dev, enum cs_mode mode,
> >               CS_UNLOCK(catu_drvdata->base);
> >               rc =3D catu_enable_hw(catu_drvdata, mode, data);
> >               CS_LOCK(catu_drvdata->base);
> > -     }
> > +             if (!rc)
> > +                     catu_drvdata->mode =3D mode;
> > +     } else if (catu_drvdata->mode !=3D mode)
> > +             rc =3D -EBUSY;
> >       if (!rc)
> >               csdev->refcnt++;
> >       return rc;
> > @@ -499,6 +502,7 @@ static int catu_disable(struct coresight_device *cs=
dev, void *__unused)
> >               CS_UNLOCK(catu_drvdata->base);
> >               rc =3D catu_disable_hw(catu_drvdata);
> >               CS_LOCK(catu_drvdata->base);
> > +             catu_drvdata->mode =3D CS_MODE_DISABLED;
> >       } else {
> >               rc =3D -EBUSY;
> >       }
> > diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwt=
racing/coresight/coresight-catu.h
> > index 755776cd19c5..ea406464f0a8 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.h
> > +++ b/drivers/hwtracing/coresight/coresight-catu.h
> > @@ -66,6 +66,7 @@ struct catu_drvdata {
> >       struct coresight_device *csdev;
> >       int irq;
> >       raw_spinlock_t spinlock;
> > +     enum cs_mode mode;
> >  };
> >
> >  #define CATU_REG32(name, offset)                                     \
> > --
> > 2.49.0.472.ge94155a9ec-goog
> >

