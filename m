Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3868FCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 01:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSYKQjyLLpQ9U6VgF/+NC7c9Vfg3d8+LTPH7512lTcw=; b=aqvIor8PtpHJzfRrG07O4I56xL
	LWdcDOIguU2UJkoW6hWoKdixnH6NwC27hJBQRKGMeiIRtgu5Izo8zYR53yZjmeHQDS2B23NFRmsKR
	dfaISIldgRkONykHPo96hB8NpTI5GW6EiPdxbBo/BmFbFRG0Z0YBn4T8PUFg4p8JjQawKXRzskjwM
	mLHXGv6qoLsHSrFz3dvmSLZsMv4r/1susMTP4iqLXlbjJNrofqXClrGPKr1hl+h3AZJMA4nqBR2dC
	Ib8UJLkpAp9HEAolurr5kGvZRc2ibNoADhtPYBo7awrpbLmrJIB/5SPBBUv2hQx5EBrnRAZOrSjeN
	1RWFkGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEHYr-00000003Krj-3Zqm;
	Thu, 30 Oct 2025 01:34:45 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEHYp-00000003Kqf-0jiw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 01:34:44 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-63f533fbfd0so506034d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 18:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761788082; x=1762392882; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSYKQjyLLpQ9U6VgF/+NC7c9Vfg3d8+LTPH7512lTcw=;
        b=KuJvQSbGxrGAvKU6rSfDOzT3N1DzN/16gr2rq1KYUhvf6zAeSImd7lRIkpx0fyeIrH
         rIt4tEmRy8duiLl5rxTiDYbCgq6Pg1/V6lzAXaXSfIWrsrfgHKrgoK6j1At4C0LWNYwf
         srHX3HQAOPCUqsyst+VNGE7iu/MBOC3sZjCYdWCkeUG+SuhVRnb1TCVfF9/Mj3bIAmor
         YpBitgWGPP7FT0OqJux80mZgUuQNJYxO7ukjyi/wDNOtOIXXABey869P+2zbDGMnIORs
         knFC0PY7ESXHUdeKta/w60XkIARu0zcALXgjvEhca3gEe2UK4hks0iVFZ6AQZLSTVXK2
         Inyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761788082; x=1762392882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSYKQjyLLpQ9U6VgF/+NC7c9Vfg3d8+LTPH7512lTcw=;
        b=iWKt6u73OutHr0HcZzjFCfngIX8tRf0BSsy0jE+q9b4gRXStZ9esFKtBXc1EZ9tHqI
         1yrcFucCqspokYLXa291vkSC8lOb6+ne1ty8hhXbMRGXOTMWXkd/iOPAdfyA3VYNbh9M
         wxFPcAb80oM4BVBypJ9crkEnEkRp3667exlnqOeuk5Bjxjr1/1yWLM4b0XbvJO3PXQd9
         kUOwJRVP6noBaNDE1YOt4JH9DyKV+Ih3XKy8wxY1RmvuNW19auxCRDHbCUgQ6GY1mO5b
         3Vv3MF2Je5A38Y5NJ6g9oTyodsrr1gcHCt0VWl5f3Er4SIIMloS3M3EaUm2JNblUUlWx
         z44Q==
X-Forwarded-Encrypted: i=1; AJvYcCVE1Hi06xjg2WRgO/JhDMwl153sVwo7cQv+BvkL6uTiz2T2XumF4WYzWsJWnOpJkvE6TMU1I8P8U/3ziJMA3mva@lists.infradead.org
X-Gm-Message-State: AOJu0YzA3wofn9X7TurcT3zbWCDfoVofDvjLKx8e0StkZc8HD49BO+DS
	QN/TKghTYwpXp2zy7+2o48/b+KasKLn0Yqr3P1ObcnCUZMDX7EAgE1AjtxFf3xoVOdyC3P2OKzc
	o0NpFJbuV1aKmOSp3izQ9yeU2J/UGmWs=
X-Gm-Gg: ASbGncvPadkU4XUlreR/sG+BSWyAoFtFscYTXTNgaIV02b7EqrDkkBnoHvmW6ET3NEP
	Z8wWmN1PKR+02C/By8r5jugkB/IIs02Qyr3Z/A2shCTYnuoHsdwZbRZ4svaXAW4l5xijoFmI8Tj
	GNtAue4fgTII70LX2K+2DjsRIxuXxidqJyLJJoRIRoG9ABN8baxT4OzBgCoBq+iFDrv/a8r37mj
	SRJCKFnqwIMaLq2uulzj/W76qICu4jdVjVTUtc2v6e+u1arqVQSo8mahWA=
X-Google-Smtp-Source: AGHT+IHMgJ4rKBE3uO85FiTJlzlAN942wrm4DmLjbiS0N7/wUCXXDdFNOdlxyLWqUIKEUXLtWtfDUoP0SJbFBB5hViQ=
X-Received: by 2002:a05:690c:6a89:b0:784:841e:c03c with SMTP id
 00721157ae682-7863903404amr16292487b3.15.1761788081875; Wed, 29 Oct 2025
 18:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251029071435.88-1-kernel@airkyi.com> <20251029071435.88-11-kernel@airkyi.com>
 <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
 <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com> <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
In-Reply-To: <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Thu, 30 Oct 2025 09:34:30 +0800
X-Gm-Features: AWmQ_bnwd-FVfcBS5MP2Q8qG3_b5HlIQQto3HU-lVRe3FvjLA4i8HmYCB1URRXQ
Message-ID: <CAL411-oXfvp-iqN+uRmFHijdmW=1omKwozKOoZ2shxukMHmwPg@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Frank Wang <frank.wang@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_183443_231990_45D320B8 
X-CRM114-Status: GOOD (  20.58  )
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

On Wed, Oct 29, 2025 at 6:32=E2=80=AFPM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> On 10/29/2025 6:21 PM, Chaoyi Chen wrote:
>
> > Hi Peter,
> >
> > On 10/29/2025 5:45 PM, Peter Chen wrote:
> >>> +&i2c4 {
> >>> +       i2c-scl-rising-time-ns =3D <475>;
> >>> +       i2c-scl-falling-time-ns =3D <26>;
> >>> +       status =3D "okay";
> >>> +
> >>> +       usbc0: typec-portc@22 {
> >>> +               compatible =3D "fcs,fusb302";
> >>> +               reg =3D <0x22>;
> >>> +               interrupt-parent =3D <&gpio1>;
> >>> +               interrupts =3D <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
> >>> +               pinctrl-names =3D "default";
> >>> +               pinctrl-0 =3D <&usbc0_int>;
> >>> +               vbus-supply =3D <&vbus_typec>;
> >>> +
> >>> +               usb_con: connector {
> >>> +                       compatible =3D "usb-c-connector";
> >>> +                       label =3D "USB-C";
> >>> +                       data-role =3D "dual";
> >>> +                       power-role =3D "dual";
> >>> +                       try-power-role =3D "sink";
> >>> +                       op-sink-microwatt =3D <1000000>;
> >>> +                       sink-pdos =3D
> >>> +                               <PDO_FIXED(5000, 2500, PDO_FIXED_USB_=
COMM)>;
> >>> +                       source-pdos =3D
> >>> +                               <PDO_FIXED(5000, 1500, PDO_FIXED_USB_=
COMM)>;
> >>> +
> >>> +                       altmodes {
> >>> +                               displayport {
> >>> +                                       svid =3D /bits/ 16 <0xff01>;
> >>> +                                       vdo =3D <0x00001c46>;
> >>> +                               };
> >>> +                       };
> >>> +
> >>> +                       ports {
> >>> +                               #address-cells =3D <1>;
> >>> +                               #size-cells =3D <0>;
> >>> +
> >>> +                               port@0 {
> >>> +                                       reg =3D <0>;
> >>> +
> >>> +                                       usbc_hs: endpoint {
> >>> + remote-endpoint =3D <&u2phy0_typec_hs>;
> >>> +                                       };
> >>> +                               };
> >>> +
> >> Why USB2 PHY needs to be notified for Type-C connection?
> >
> > I think the USB-connector binding require a port@0 for High Speed.  So =
I filled in USB2 PHY here. And I have looked up boards with the same usage,=
 and some of the results are as follows:
> >
> > - rk3399-firefly.dts
> >
> > - rk3399-pinebook-pro.dts
> >
> > - rk3399-eaidk-610.dts
> >

Okay.  My question is basic: USB2 PHY supplies DP/DM, and the DP/DM is
short for Type-C connector,
and no control is needed for Type-C application.
Why is there a remote-endpoint connection between USB2 PHY and Type-C conne=
ctor?

> >
> >>
> >>> +                               port@1 {
> >>> +                                       reg =3D <1>;
> >>> +
> >>> +                                       usbc_ss: endpoint {
> >>> + remote-endpoint =3D <&tcphy0_typec_ss>;
> >>> +                                       };
> >>> +                               };
> >>> +
> >>> +                               port@2 {
> >>> +                                       reg =3D <2>;
> >>> +
> >>> +                                       usbc_dp: endpoint {
> >>> + remote-endpoint =3D <&tcphy0_typec_dp>;
> >>> +                                       };
> >>> +                               };
> >>> +                       };
> >>> +               };
> >>> +       };
> >>> +};
> >>> +
> >> .....
> >>>   &u2phy0 {
> >>>          status =3D "okay";
> >>> +
> >>> +       port {
> >>> +               u2phy0_typec_hs: endpoint {
> >>> +                       remote-endpoint =3D <&usbc_hs>;
> >>> +               };
> >>> +       };
> >>>   };
> >>>
> >> There is no switch and mux, how to co-work with Type-C?
> >
> > I checked the phy-rockchip-inno-usb2.c but did not find any switch or m=
ux. Does this mean that we need to implement them? Thank you.
>
> Wait a minute, actually we have multiple hardware interfaces, one of whic=
h is Type-C, eventually connected to USBDPPHY, and the other is micro-usb c=
onnected to U2PHY.

I assume the Micro-USB connector does not use Type-C/PD IC, is it
right? Does it relate to this patch?

Best regards,
Peter

