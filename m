Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBB5D690EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 09:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oNbRZATueezg81CZReVlx5jV0RK0ryx+s0XgVPaZYI=; b=aND77jyfPXW3F+9CgDNS4YbypE
	2deyvdVc4zJebTWN08HZgMxmEvphpdHyOfsOKeXrh9ziXvH1gIrUl+wNeM5VENzDyItUNzqCHEftN
	N1Kdk5ieJrwi7DxP1G5KaO7uqunGUYzE2YAeISdkwhckAYnNMpdY+Dp6v9Rl7ABzE0lYpTH6BB70V
	Pu70AeXmdvJ4wZP4UNQphXdkXw0IYrxgWYNs0iracSeyDEUas5CM41VzTPSMLobOmIlDvVuavzoBs
	Cnm4Dl4FaiXAPeX6G6WPEDHxJujMkj+w2/eE8MqRofPZaXr3ULKARSs1Wv/clxQ8zy/j7V+xUvz9t
	1KwsjC1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGb8u-0000000FBKx-1sSI;
	Thu, 28 Nov 2024 09:49:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGb7u-0000000FBEJ-49tp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 09:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732787277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oNbRZATueezg81CZReVlx5jV0RK0ryx+s0XgVPaZYI=;
	b=BKPwP7Nw8sEp8SJheCGnzkpLPUyz4t7ZC+9d4MIbaK1wCy5RG1K/UWg1tTOB6g79VALxmC
	im066pCEhohUhi82jnt66D72o/W6+KNR3ea8dDKRrKeRMxScaiAm4jhXS2/zjZDJdWkhZc
	YhybmWiW+CiohgHfZ2xXm+oTNL23Nq0=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-FfPM3XLvOnOUzg2p3_0X0w-1; Thu, 28 Nov 2024 04:47:55 -0500
X-MC-Unique: FfPM3XLvOnOUzg2p3_0X0w-1
X-Mimecast-MFC-AGG-ID: FfPM3XLvOnOUzg2p3_0X0w
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5f1e2d2660eso16591eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 01:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732787274; x=1733392074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oNbRZATueezg81CZReVlx5jV0RK0ryx+s0XgVPaZYI=;
        b=ZuQfA7xI59CHcihsTfSPvJslUnSxcn3pDB2Ykh34mi7yi2qrxLLfe8yTcRI9TFjWdm
         z9RQ5xm6tXGCltmQ1c/JlLxdFVC3PEqgZmBeSHsmFeGnYbUsDLkeu5QuU6VL9yhdx9bt
         5VhwTur5eEM5FYFBykYrm4YmOsPB3hxymr+Ev7upI9wNNmsmcA/uo70DoaUS0zCqsgL5
         TlNtpw8LqBxMnZV/lA0U6zgbGjkA6TdFyMmg2NYNr3oHDQ8OsPkjAH8BWmh2vgApTluQ
         hzrDga4P5AkLOXw/FqP/HoAldnXd5HZv3fHl0LbaNBFW0pIT2afdSiRZ++1UK0c64DD9
         S88Q==
X-Forwarded-Encrypted: i=1; AJvYcCVW9a7hDx5E9k4fUurSsZ65g9USY6X8ok9QxbVUxmlKduyP62RRcwpnKmZqClxonU6ebhirQmweHb4RSeGMvlsI@lists.infradead.org
X-Gm-Message-State: AOJu0YzE+Gz10O7pQVeeCBnGC/VZ59rxmJWZHUcm5r66woZIGSlBZ/K4
	w6SBdMxWU/BZl3U9EEmuymNe0gpGdJEa4uYaLSNdv4XTuOJzCQAeRLuQFXO7UF6oBnUX/HUpx74
	UlEtFBQbveHOslVrLWcyZkrGmhnlwbMwOCaOqDI14i03w3C2MpjS9Z+FqQso40X0pktAjGq+Dnx
	2TRdvycH3BqArjQmpOi8EjI1oQX3dPQPpzJ+wOsCOYiBZ4SnnOKEHu8Oyy6QauGM4=
X-Gm-Gg: ASbGncvIjSAKjdGXnRCH+px7jFCDgoRtfj5TH2zc67mDWJjuZwyMYk7P/6a565k14tB
	z1GCOJQzo3ZblN2tJK6UVnK6iLP2+iQ==
X-Received: by 2002:a05:6830:3146:b0:717:f7b9:e229 with SMTP id 46e09a7af769-71d65d30197mr1404042a34.7.1732787273873;
        Thu, 28 Nov 2024 01:47:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTAME9UHHiL0FJTpRauKthCid+eKGwe6kyh+EMyOOhg7rXyOzJ0JB3RkIoWUs3QEYs+kMb3CeH/rBKs806tdc=
X-Received: by 2002:a05:6830:3146:b0:717:f7b9:e229 with SMTP id
 46e09a7af769-71d65d30197mr1404027a34.7.1732787273591; Thu, 28 Nov 2024
 01:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com>
 <2nuncc5rscu6h74ylaiu6yozg34aoigaj5d4uzvdtolt5q7bmv@6hacpxyb2532> <CALE0LRtUN2N_Z05jH_BMSg7yvirSRob0pSErmQxTu8AatmODgw@mail.gmail.com>
In-Reply-To: <CALE0LRtUN2N_Z05jH_BMSg7yvirSRob0pSErmQxTu8AatmODgw@mail.gmail.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 28 Nov 2024 10:47:42 +0100
Message-ID: <CALE0LRu-Sx5oTVNY3hm+Msu-zb04a7_ZD+r3xF1eRfR_WtK0VA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
To: s-vadapalli <s-vadapalli@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dasnavis Sabiya <sabiya.d@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qMsN1HHw4Mpp-LkVpi4eBy3AxGhaqi3AkK0-fbFdHZk_1732787274
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_014759_104781_93022D93 
X-CRM114-Status: GOOD (  33.97  )
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

On Wed, Nov 27, 2024 at 11:00=E2=80=AFAM Enric Balletbo i Serra
<eballetb@redhat.com> wrote:
>
> Hi,
>
> On Wed, Nov 27, 2024 at 9:27=E2=80=AFAM s-vadapalli <s-vadapalli@ti.com> =
wrote:
> >
> > On Tue, Nov 26, 2024 at 11:08:19AM +0100, Enric Balletbo i Serra wrote:
> >
> > Hello Enric,
> >
> > > From: Dasnavis Sabiya <sabiya.d@ti.com>
> > >
> > > AM69 SK board has two stacked USB3 connectors:
> > >    1. USB3 (Stacked TypeA + TypeC)
> > >    2. USB3 TypeA Hub interfaced through TUSB8041.
> > >
> > > The board uses SERDES0 Lane 3 for USB3 IP. So update the
> > > SerDes lane info for PCIe and USB. Add the pin mux data
> > > and enable USB 3.0 support with its respective SERDES settings.
> > >
> > > Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
> > > Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
> > > ---
> > > I've been carrying this patch for quite long time in my builds to hav=
e
> > > support for USB on my AM69-SK board without problems. For some reason=
 this
> > > patch was never send to upstream or I couldn't find it. So I took the
> > > opportunity, now that I rebased my build, to send upstream.
> > >
> > > I have maintained the original author of the downstream patch as is
> > > basically his work.
> > > ---
> > >  arch/arm64/boot/dts/ti/k3-am69-sk.dts | 33 +++++++++++++++++++++++++=
++++++++
> > >  1 file changed, 33 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/=
dts/ti/k3-am69-sk.dts
> >
> > [...]
> >
> > > +&usb0 {
> > > +     status =3D "okay";
> > > +     dr_mode =3D "host";
> >
> > Since the Type-C interface is also connected to USB0, shouldn't "dr_mod=
e"
> > be "otg"? Also, has the Type-C interface been tested with this patch?
> > Please let me know.
> >

So I changed the dr_mode to otg instead of host and tried to configure
a usb mass storage gadget but unfortunately didn't work, but this
could be a driver problem, I got the following error

  UDC core: g1: couldn't find an available UDC

As the devicetree should describe the hardware, and as far as I can
see it should support the type-c port act as a gadget, I'm fine with
changing the dr_mode, unless anyone have more information about this,
the thing that makes me think a bit more is that, in the TI kernel
this is set to host, so I'm wondering if I'm missing something or is
just that was never tested.

Thanks,
  Enric

>
> Yes, all usb from the board were tested. I'll try otg mode for the
> Type-C interface and resend the patch.
>
> $ lsusb -t
> /:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 48=
0M
>     |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
>         |__ Port 001: Dev 003, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
>             |__ Port 001: Dev 004, If 0, Class=3DHuman Interface Device,
> Driver=3Dusbhid, 1.5M
>             |__ Port 001: Dev 004, If 1, Class=3DHuman Interface Device,
> Driver=3Dusbhid, 1.5M
>         |__ Port 002: Dev 005, If 0, Class=3DMass Storage,
> Driver=3Dusb-storage, 480M
> /:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 50=
00M
>     |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
>         |__ Port 003: Dev 004, If 0, Class=3DMass Storage,
> Driver=3Dusb-storage, 5000M
>         |__ Port 004: Dev 003, If 0, Class=3DMass Storage,
> Driver=3Dusb-storage, 5000M
>
> Thanks,
>    Enric
> > [...]
> >
> > Regards,
> > Siddharth.
> >


