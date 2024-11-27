Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052FED609C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0wPBAaMjSnNTX8RqBZAQUWmuUVI0sWePXuVzRgZ7Qw=; b=i54ndtrntazF2tYPE71n98d3g+
	hs/xOqWiQrIzMeAgvwAlrgXHnT/GvVyf5PXl2rH+FRXHPV70O2K+k3lh3yqaG2hNlg5/dvx6pVyWe
	AczTWlvj31uK5fB8Qawuv1aPx4LtD9NxmuPAhad23OKjDguTOSjfosnIP0SS3fu8OYNvklo//Frmz
	dDuR1H0jPl8ivmTR+0BJtjoW1/DmZXiDn8jSAuRZq8cDk5BMdlpOhHvoFJZigH/x3I2/DsVuTiVvs
	GoYabL6Wp5sJrQTltKpQKQHzSJJvBs0qqTJt6UQ0yQhSatOy1T2TNGgXkv4MyLDM8l2F+qbJe+7wt
	8z2jQAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEre-0000000ClXr-0Yue;
	Wed, 27 Nov 2024 10:01:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEqg-0000000ClP6-0X9W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732701641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0wPBAaMjSnNTX8RqBZAQUWmuUVI0sWePXuVzRgZ7Qw=;
	b=hy99SoKJgr0j9NXUx6JFmobIsc5lyn4m/kohEn3xLZvmYkWEv5O3vc8FkfNjIjTlllU1wp
	kHydNNuCrh2jaNCqa9PbSGyRkLIrwHWaRyZHskktw1lj6rUZey7eeyv0tsyWT+5rRpzcvF
	ghZgljyirnUPaPe4E4el81k3MDZF3A8=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-i_ocD0eAMaiOm2j2qsHFRw-1; Wed, 27 Nov 2024 05:00:39 -0500
X-MC-Unique: i_ocD0eAMaiOm2j2qsHFRw-1
X-Mimecast-MFC-AGG-ID: i_ocD0eAMaiOm2j2qsHFRw
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5f1f269bb5cso227397eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701639; x=1733306439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0wPBAaMjSnNTX8RqBZAQUWmuUVI0sWePXuVzRgZ7Qw=;
        b=PAJkim8ERCS3R7m73BsM1BAat7NNfiAMrQJH7IPS/5HO//9q7PUHE75Cb0deUqrzlA
         AtkXl3Ppi9tjtfFtK31eaIoJAgcqvfNMBl9A92eO8fIFy+Hk7WeyVPpogVjyxR6E2T7S
         NWjY/uFUDDtSqpS22wQUWgq/q/Az6ih6JbUbmX9f2ydQ9Bo+GkjEhi5EX3MzQbtIraCZ
         c8jbRB10a9BFpY5N5U7S/0nQM+GlzWfDC0GGVeJTcwIVhdFt4ewWOGi172BoHbQFQhXO
         QC7tonCMbAQf9miJ2NZ7u3CBb5QfKm0qULbl33INdUPYgNBfejjZV8U4LWoPKSgKeXl0
         2dNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQSeCzYRL9wRKqJCE/WZmdr7fBo1i+Nd/BxyHVMY7YvXRQe0i5OJ19cFPbP2WPcivCWJFssL+3ORC9U9F0LYqw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2gdO7k0jjsAYnIGjleVilsZcC8WQVxL8t9zT7XBKYrgK3Y6E0
	I/woI6nTBWHq+MLCXmdNitee2tzYGlL63TI1hN9xhFQ3BffYk0OAbYmbTJBBbjrvShTT5hxRdm0
	EcPCdTGJdUC3YebE2qnCLCqNLNrqHfyEXPBxYI9yLpGW3oTKn93eALKciriEqaVtltFjpSPjT7Y
	k4jBrTrTTyk1JCZONPISG9PHu7Ts6lw3EeKzfDgiZkQeAs+Kym1JvN9USKqgmohlM=
X-Gm-Gg: ASbGncucsLYlTCIGOEvI+aIRLfsPN0G2Jg/N12GOY5JMXIy8tZGG22chfy5fx5fKaqS
	jWLvLuNEersWamZqu3FpK6D71IIvd2w==
X-Received: by 2002:a05:6870:c152:b0:27b:b2e0:6af with SMTP id 586e51a60fabf-29dc3fb9cd2mr485566fac.2.1732701638779;
        Wed, 27 Nov 2024 02:00:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxVRugfM1h6RP4poBOiNX8qRrDOehBisqylVM+eiLebPmXpS2cMHMjj58RYifbv8/vFUZK4bOyHhB27KGFiHc=
X-Received: by 2002:a05:6870:c152:b0:27b:b2e0:6af with SMTP id
 586e51a60fabf-29dc3fb9cd2mr485554fac.2.1732701638432; Wed, 27 Nov 2024
 02:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com> <2nuncc5rscu6h74ylaiu6yozg34aoigaj5d4uzvdtolt5q7bmv@6hacpxyb2532>
In-Reply-To: <2nuncc5rscu6h74ylaiu6yozg34aoigaj5d4uzvdtolt5q7bmv@6hacpxyb2532>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 27 Nov 2024 11:00:27 +0100
Message-ID: <CALE0LRtUN2N_Z05jH_BMSg7yvirSRob0pSErmQxTu8AatmODgw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
To: s-vadapalli <s-vadapalli@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dasnavis Sabiya <sabiya.d@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3rLPh3hvoXAjGBKwgdtTxspCqGZ6vGZy0uYCt5ecvnc_1732701639
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_020042_238936_FE3DCAE2 
X-CRM114-Status: GOOD (  24.99  )
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

On Wed, Nov 27, 2024 at 9:27=E2=80=AFAM s-vadapalli <s-vadapalli@ti.com> wr=
ote:
>
> On Tue, Nov 26, 2024 at 11:08:19AM +0100, Enric Balletbo i Serra wrote:
>
> Hello Enric,
>
> > From: Dasnavis Sabiya <sabiya.d@ti.com>
> >
> > AM69 SK board has two stacked USB3 connectors:
> >    1. USB3 (Stacked TypeA + TypeC)
> >    2. USB3 TypeA Hub interfaced through TUSB8041.
> >
> > The board uses SERDES0 Lane 3 for USB3 IP. So update the
> > SerDes lane info for PCIe and USB. Add the pin mux data
> > and enable USB 3.0 support with its respective SERDES settings.
> >
> > Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
> > Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
> > ---
> > I've been carrying this patch for quite long time in my builds to have
> > support for USB on my AM69-SK board without problems. For some reason t=
his
> > patch was never send to upstream or I couldn't find it. So I took the
> > opportunity, now that I rebased my build, to send upstream.
> >
> > I have maintained the original author of the downstream patch as is
> > basically his work.
> > ---
> >  arch/arm64/boot/dts/ti/k3-am69-sk.dts | 33 +++++++++++++++++++++++++++=
++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dt=
s/ti/k3-am69-sk.dts
>
> [...]
>
> > +&usb0 {
> > +     status =3D "okay";
> > +     dr_mode =3D "host";
>
> Since the Type-C interface is also connected to USB0, shouldn't "dr_mode"
> be "otg"? Also, has the Type-C interface been tested with this patch?
> Please let me know.
>

Yes, all usb from the board were tested. I'll try otg mode for the
Type-C interface and resend the patch.

$ lsusb -t
/:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
    |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 001: Dev 003, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
            |__ Port 001: Dev 004, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 1.5M
            |__ Port 001: Dev 004, If 1, Class=3DHuman Interface Device,
Driver=3Dusbhid, 1.5M
        |__ Port 002: Dev 005, If 0, Class=3DMass Storage,
Driver=3Dusb-storage, 480M
/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000=
M
    |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
        |__ Port 003: Dev 004, If 0, Class=3DMass Storage,
Driver=3Dusb-storage, 5000M
        |__ Port 004: Dev 003, If 0, Class=3DMass Storage,
Driver=3Dusb-storage, 5000M

Thanks,
   Enric
> [...]
>
> Regards,
> Siddharth.
>


