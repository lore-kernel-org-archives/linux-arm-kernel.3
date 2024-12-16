Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CA9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OA+5NHNpYkR5jHDPlHiNbA4eDHZp6F0pnYCxfmtazPI=; b=QFpaW2E328Hqz6I1ZXqgXzoIhO
	glcN2YPq79nwog5eZutGrppgRCOO0fao6EZovzAPfvEYNF7YiLJrleNr0FMPpPqR9zv+Qc6YdLDmq
	tjHnjSno69My9+5mNeqkvC0niqaMbYfI1M6bOc+9tIzYFSM8bpPKZzEDE+UWKKUjdqm6xf4Pxhay8
	zGUhrrQMP769q38+j6hiUlQmgQl6p5wcKkqMXalvT4jbyLD46yCQ/xLA9Ouo5DSkRL5cVLp4z84Hn
	Eod//+83yvsc1YYRnkpFAlTKyUsm3Gb09e6E2u95N4Y69A8m4RbB5M+Xf0J/lt3aAXqbLOaB1x7VO
	y9tCM9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8UW-00000009iFx-3oxZ;
	Mon, 16 Dec 2024 10:38:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8TR-00000009iC1-3zuA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:37:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21634338cfdso45975955ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734345433; x=1734950233; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OA+5NHNpYkR5jHDPlHiNbA4eDHZp6F0pnYCxfmtazPI=;
        b=WA8RjkTROGm4ZaPECp6oho1h+yIbcFIrkpFBw2DdowqjZP5b2U9IwKcYmdIeZ6Q4ay
         KB98MRguQwgggcluMYpqj+MpTXancfLQVARVaSTTV/BpFYxgjwQYJXZJhbI/TSsp+9to
         uYSNtJfFepMZCEpxtwQ3cMgNx1KWM2DuhfURr1UPfhgXhN7Rf+BEnxh/QqbuC7fyzexb
         z14i9GaXabfEhBDqpnlMqwfTTA9iOiyXSrsG2F6hq5Kx4T4ekfbV/Ixx3WKQ8UOs0EBV
         dn+gbA0Gj6LQ3CO6TXkUa08UwNpj4LxFJKDGn+ZgM0PvovKK6Iy5cNahiIbTD7+ugksu
         Mjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734345433; x=1734950233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OA+5NHNpYkR5jHDPlHiNbA4eDHZp6F0pnYCxfmtazPI=;
        b=Rytkx6yuDKjXFn6TX+OkVuoHlFJfL77fQNU2nvUWw1HyjP1vz75laWMpbUR3GtizOF
         JGD/43C8gqKDEitTWMWmmFYTnWucw3g+C2N8wpUAJERiNgiA8AP+li1IQadfEqBq+iqu
         M4m9rlcwh3DdTz28gB3I1xTkZOgoIyoKSndOL9ah5euEjqh7Fe5GqH2NG5lfCDltaJeY
         5hIqJPUHpxVDTzZfRYNyrcFLd4Fm5NG4ra2Ayw4EhlpOvqXgOr6t4wlpsAaJLF86tQl0
         ttP1Y62Shjmhq2zQFi43lZvn+S5Q3ciseUZN+rBkagZ99JsGdbl+OcfuKrBdgC1kZCvk
         yZAg==
X-Forwarded-Encrypted: i=1; AJvYcCVkJH8N+h5h9SLYklDVz+mLA9K/PbwPShkDF2bsFfdsY8xg2aPSrBbjMB0SFQL3rh+3VkDrxdRMArUyi5V660aY@lists.infradead.org
X-Gm-Message-State: AOJu0YwygylJjpUF1LNraVtNMbNK3e0EXyEDAocF1M2xn2hnc9RGJbOp
	FjS1huiVZvIwa5rEGgsofsDKO+KmKMVQKFz0k/2BEEc9iv47bipCYUmCKDoIM+xauft8KxL19tD
	glF+K1L1YCjsaouBoQQsibee5feA=
X-Gm-Gg: ASbGncum5kgMTRqTbortl0TcIA/ciLLSp3r+Fi3LYbSAzoscS25t/9X9FjSZGCRU5KX
	CaQumP04iajzUoAtXBmzc0+UiAXhfLMvJL1QV
X-Google-Smtp-Source: AGHT+IEfJuxZgByf8coZVShcY2o38RAmrG/Ekf/AwY+kg0lR0Tn82vhGRiBGnt/O4l6C6KpCfqPDXfWpy3rGQZ4zwTI=
X-Received: by 2002:a17:903:32cf:b0:20b:a6f5:2768 with SMTP id
 d9443c01a7336-218929f1d59mr182557835ad.10.1734345432525; Mon, 16 Dec 2024
 02:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20241216073745.2973317-1-guomin_chen@sina.com>
 <Z1_p0nU93PHJ4Sg_@pluto> <Z1_2rxJ7TOEIOMp7@pluto>
In-Reply-To: <Z1_2rxJ7TOEIOMp7@pluto>
From: gchen chen <gchen.guomin@gmail.com>
Date: Mon, 16 Dec 2024 18:37:01 +0800
Message-ID: <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: guomin_chen@sina.com, Sudeep Holla <sudeep.holla@arm.com>, 
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_023713_990292_82B9F5F7 
X-CRM114-Status: GOOD (  33.25  )
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

Cristian Marussi <cristian.marussi@arm.com> =E4=BA=8E2024=E5=B9=B412=E6=9C=
=8816=E6=97=A5=E5=91=A8=E4=B8=80 17:45=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Dec 16, 2024 at 08:50:26AM +0000, Cristian Marussi wrote:
> > On Mon, Dec 16, 2024 at 03:37:45PM +0800, guomin_chen@sina.com wrote:
> > > From: guomin chen <guomin_chen@sina.com>
> > >
> > > Currently, scmi_bus_id is only used to set scmi_dev.id,
> > > which in turn sets the SCMI device name. After removing
> > > scmi_bus_id, it is clearer and more meaningful to directly
> > > use the unique tuple [Parent name,device name, protocol] to
> > > set the SCMI device name.
> > >
> >
> > Hi Guomin,
> >
> > this same pTCH was NACKed(Rejected) a few days ago:
> >
> > https://lore.kernel.org/arm-scmi/20241211134505.2218386-1-guomin_chen@s=
ina.com/T/#u
> >
> > ...and you agreed that is not a simplification we can do (not to break
> > multuple instances...)...
> >
> > ..so why you are posting V2 now ?
>
> Wait...you changed slightly this indeed....you are using dev_parent...my
> bad...but please when you post new version of a patch add a summary of
> changes between versions...
>
> >
> > Thanks,
> > Cristian
> >
> > > Signed-off-by: guomin chen <guomin_chen@sina.com>
> > > ---
> > >  drivers/firmware/arm_scmi/bus.c    | 17 +++--------------
> > >  drivers/firmware/arm_scmi/driver.c |  4 ++--
> > >  2 files changed, 5 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_s=
cmi/bus.c
> > > index 157172a5f2b5..800e8ec9357c 100644
> > > --- a/drivers/firmware/arm_scmi/bus.c
> > > +++ b/drivers/firmware/arm_scmi/bus.c
> > > @@ -20,7 +20,6 @@
> > >  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
> > >  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> > >
> > > -static DEFINE_IDA(scmi_bus_id);
> > >
> > >  static DEFINE_IDR(scmi_requested_devices);
> > >  /* Protect access to scmi_requested_devices */
> > > @@ -341,7 +340,6 @@ static void __scmi_device_destroy(struct scmi_dev=
ice *scmi_dev)
> > >     if (scmi_dev->protocol_id =3D=3D SCMI_PROTOCOL_SYSTEM)
> > >             atomic_set(&scmi_syspower_registered, 0);
> > >
> > > -   ida_free(&scmi_bus_id, scmi_dev->id);
> > >     device_unregister(&scmi_dev->dev);
> > >  }
> > >
> > > @@ -349,7 +347,7 @@ static struct scmi_device *
> > >  __scmi_device_create(struct device_node *np, struct device *parent,
> > >                  int protocol, const char *name)
> > >  {
> > > -   int id, retval;
> > > +   int retval;
> > >     struct scmi_device *scmi_dev;
> > >
> > >     /*
> > > @@ -387,20 +385,13 @@ __scmi_device_create(struct device_node *np, st=
ruct device *parent,
> > >             return NULL;
> > >     }
> > >
> > > -   id =3D ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
> > > -   if (id < 0) {
> > > -           kfree_const(scmi_dev->name);
> > > -           kfree(scmi_dev);
> > > -           return NULL;
> > > -   }
> > > -
> > > -   scmi_dev->id =3D id;
> > >     scmi_dev->protocol_id =3D protocol;
> > >     scmi_dev->dev.parent =3D parent;
> > >     device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
> > >     scmi_dev->dev.bus =3D &scmi_bus_type;
> > >     scmi_dev->dev.release =3D scmi_device_release;
> > > -   dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
> > > +   dev_set_name(&scmi_dev->dev, "scmi_dev.%s.%s.%d", dev_name(parent=
),
> > > +                   scmi_dev->name, protocol);
> > >
>
> So now you are using the parent top node SCMI device to create a unique
> device...and it probably endup in a name like:
>
>         scmi-dev.arm-scmi.0.auto.genpd.13
>
>         scmi-dev.arm-scmi.1.auto.genpd.13
>
> ...that certainly is more readable but is bulky and anyway giving unique
> IDs to devices is pretty common and you lookup which device is which by
> simply looking at the drivers/ link....not suure what's the benefit of
> all of this...just to avoid an IDA table ?
>
> > >     retval =3D device_register(&scmi_dev->dev);
> > >     if (retval)
> > > @@ -413,7 +404,6 @@ __scmi_device_create(struct device_node *np, stru=
ct device *parent,
> > >     return scmi_dev;
> > >  put_dev:
> > >     put_device(&scmi_dev->dev);
> > > -   ida_free(&scmi_bus_id, id);
> > >     return NULL;
> > >  }
> > >
> > > @@ -526,7 +516,6 @@ static void __exit scmi_bus_exit(void)
> > >      */
> > >     scmi_devices_unregister();
> > >     bus_unregister(&scmi_bus_type);
> > > -   ida_destroy(&scmi_bus_id);
> > >  }
> > >  module_exit(scmi_bus_exit);
> > >
> > > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/ar=
m_scmi/driver.c
> > > index 1b5fb2c4ce86..bbf1f05f2be3 100644
> > > --- a/drivers/firmware/arm_scmi/driver.c
> > > +++ b/drivers/firmware/arm_scmi/driver.c
> > > @@ -2641,8 +2641,8 @@ static int scmi_chan_setup(struct scmi_info *in=
fo, struct device_node *of_node,
> > >     cinfo->max_msg_size =3D info->desc->max_msg_size;
> > >
> > >     /* Create a unique name for this transport device */
> > > -   snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> > > -            idx ? "rx" : "tx", prot_id);
> > > +   snprintf(name, 32, "__scmi_transport_device_%s",
> > > +            idx ? "rx" : "tx");
>
> I agree on what Dan said AND also this results in having the same name fo=
r different
> devices across 2 instances if you have a per-protocol channel because you=
 havent anymore
> the protocol_id bit.
hi  Cristian=EF=BC=8Cand dan
    Because I used a 3-tuple [parent name, name, protocol] when
creating the SCMI device name, I removed the prot_id from the
parameter =E2=80=98name=E2=80=99 when creating transport devices. This way,=
 it avoids
the repetition of protocol ID in the SCMI device name.

> All in all, I would drop this patch and keep naming as it is because I do=
nt see a real benefit
> here....up to Sudeep decide.
     Yes, it does not have real benefits, but from the perspective of
the device name, this change will be clearer and more meaningful. And
the code is more concise.

Thanks
guomin.chen
>
> Thanks,
> Cristian

